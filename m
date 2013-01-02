Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TqPuG-00009l-Lj
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 16:07:04 +0100
Received: by mail-la0-f46.google.com with SMTP id fq13so6047445lab.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2013 06:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=NUfS+tUD6qLCaUrVLHn++VapNTYjK4ml1ygYrWu1Qx0=;
	b=0vbPT39E1QopuMHLIU46JQrLUJ4KyHTScfEP3O5RowcrJJkmAY3DEKtQhBzutCGI0A
	R6qiS4KPX+bTQeSdYbY5KqJT+J7rkp1UZ09A6HO+kYAWfI4ZKVOERl7GmARx6LriDpeq
	J5eHstUk+Gd8cOaFUs890o9aVYfahIXl+kTUmFoA+lSf/g8jlLT+sPC5G1hSBGkfh1EH
	DF8zqZ1nmR4SRUPJQ7O97EikR3tW+puwdcniDS3opxOHy48EQ+NNCaupG7abfMQBNwAC
	uYwbQ+E2+oVFaN+EGgMBDv364qeGkN/fqNPxtDzJxOg13/YBno6ClsAQxhnoHrmxcNWj
	7E4w==
Received: by 10.112.43.161 with SMTP id x1mr19002084lbl.32.1357138317986; Wed,
	02 Jan 2013 06:51:57 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 2 Jan 2013 06:51:37 -0800 (PST)
In-Reply-To: <1357127607-20161-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1357127607-20161-1-git-send-email-muhammad_shakeel@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 2 Jan 2013 07:51:37 -0700
X-Google-Sender-Auth: CSxtMKQ3g2jmj0tqM5op0pSpU_w
Message-ID: <CABcZANn3GUDdPK6XwVMHqEeJjiAhWRukEiiumXoifYF-PT--Sg@mail.gmail.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] [RFC] archive-*-source.bbclass: Handle package class 'package_ipk'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2013 15:07:05 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe2b2a5acc0404d24f6384

--e0cb4efe2b2a5acc0404d24f6384
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 2, 2013 at 4:53 AM, Shakeel, Muhammad <
muhammad_shakeel@mentor.com> wrote:

>  addtask do_archive_scripts_logs after do_package_write_rpm
> +addtask do_archive_scripts_logs after do_package_write_ipk
>

This will cause problems for anyone trying to do builds without package_ipk
at all. I'd suggest using anonymous python to add the appropriate package
dependencies based on what tasks actually exist.

-CHris

--e0cb4efe2b2a5acc0404d24f6384
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Wed, Jan 2, 2013 at 4:53 AM,=
 Shakeel, Muhammad <span dir=3D"ltr">&lt;<a href=3D"mailto:muhammad_shakeel=
@mentor.com" target=3D"_blank">muhammad_shakeel@mentor.com</a>&gt;</span> w=
rote:<br>

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":hw">=
=C2=A0addtask do_archive_scripts_logs after do_package_write_rpm<br>
+addtask do_archive_scripts_logs after do_package_write_ipk</div></blockquo=
te></div><br></div><div class=3D"gmail_extra" style>This will cause problem=
s for anyone trying to do builds without package_ipk at all. I&#39;d sugges=
t using anonymous python to add the appropriate package dependencies based =
on what tasks actually exist.</div>

<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
>-CHris</div></div>

--e0cb4efe2b2a5acc0404d24f6384--

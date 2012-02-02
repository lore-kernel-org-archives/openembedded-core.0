Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rt1cL-00040W-G0
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:42:45 +0100
Received: by lbol12 with SMTP id l12so422321lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 10:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=9XMqMJ5UB7XRXmq7q+y38VTYAybbp5xZDEaZBJ3xNqU=;
	b=OrLLeiJv7ua04KJn7WPzC/Ji0JXOvtjPspTAgExtpLPcEVlfx57P0AR9ag9+7fseWr
	KiJxvZCNPjzvBUTNjvsS2D8umOecJoUElXiuTHpwodgWiNVCIchEACMZ4Kc+TWTTTu2S
	1h9a+wB0QHVfbjXXjm9AeC+ustc1R1nA5zRoM=
MIME-Version: 1.0
Received: by 10.112.11.10 with SMTP id m10mr1038453lbb.11.1328207689104; Thu,
	02 Feb 2012 10:34:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Thu, 2 Feb 2012 10:34:49 -0800 (PST)
In-Reply-To: <1328194429.13744.187.camel@ted>
References: <cover.1328127940.git.otavio@ossystems.com.br>
	<429ddbe3779c6957e6ecad5ae37200865e19fa0f.1328127940.git.otavio@ossystems.com.br>
	<1328129842.2716.156.camel@x121e.pbcl.net>
	<CAP9ODKqgPLHzPo6cNdx-9pijqW1wx2Pd5QejF-HaYax8F71Dqw@mail.gmail.com>
	<1328179437.29933.185.camel@phil-desktop>
	<1328194429.13744.187.camel@ted>
Date: Thu, 2 Feb 2012 16:34:49 -0200
X-Google-Sender-Auth: t-koayqV8Llxdal9KhnLVMDKjsM
Message-ID: <CAP9ODKodp-zEWaEnztzsVOf6YQ3h4GsfmKG6yA-dZvH8j_OfFw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dhcp: move dhcp leases files handling to postinst/postrm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Feb 2012 18:42:45 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe318c7f3f6204b7ff7301

--e0cb4efe318c7f3f6204b7ff7301
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 2, 2012 at 12:53, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Agreed, mkdir is much more likely to be available than install on most
> target machines.
>

I did it and pushed to my tree.

When changing it, I bumped PR again as I had it merged in our local tree to
fix this problem for yestarday build and so I'd like to keep those in sync.

Want me to send it again or you pick it from there?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e0cb4efe318c7f3f6204b7ff7301
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Feb 2, 2012 at 12:53, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div id=3D":66h">Agreed, mkdir is much more likely to be available than ins=
tall on most<br>
target machines.<br></div></blockquote></div><br>I did it and pushed to my =
tree.<div><br></div><div>When changing it, I bumped PR again as I had it me=
rged in our local tree to fix this problem for yestarday build and so I&#39=
;d like to keep those in sync.</div>
<div><br></div><div>Want me to send it again or you pick it from there?<br =
clear=3D"all"><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailt=
o:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0=
 <a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossys=
tems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--e0cb4efe318c7f3f6204b7ff7301--

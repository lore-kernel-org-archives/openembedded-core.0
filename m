Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TqS5H-0004nU-9n
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 18:26:32 +0100
Received: by mail-la0-f48.google.com with SMTP id ej20so6470968lab.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2013 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=5icvEkoI5fi21aVcnuYLZa7tD3ELLgLR6pxqWC0ke5k=;
	b=ky3FlBGwvw47ezIqTYbhWuqlURc26wUyVD5v8nKpEpjzKvd9+yuQJZ5FXeJFuVg9Q+
	X2VJeNysXjYR1KPXhSYkAVIB1F6dbWrPlPuVlzHZidgOFYmb5KU0plwAalFiVHqi9Z3n
	JUXyIJ/Nz9Ix0EKdEgawH8tuMcww0Ys4NSEh2QnkBlnXc4NkDpRRP8EDnq4k0fui1KdC
	UToc1W/fvWY3e0RNJjZFJLsN9WDpCrrPgsx6Y4hHS0KytgwIwudK1Vss4deq2k4UpppT
	hkpCCLSUDvcCnsGYeRkZJ6T4GTZm27RQxAE+mVu84RTMwkk+ueZIPKRQGzentdxLv/uF
	/mMQ==
Received: by 10.152.124.111 with SMTP id mh15mr44130859lab.20.1357146688701;
	Wed, 02 Jan 2013 09:11:28 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 2 Jan 2013 09:11:08 -0800 (PST)
In-Reply-To: <CAP9ODKoRytWOxAX3jn0nj12Jeah9mihobxd2PWaqApWA0ut9yQ@mail.gmail.com>
References: <1357127607-20161-1-git-send-email-muhammad_shakeel@mentor.com>
	<CABcZANn3GUDdPK6XwVMHqEeJjiAhWRukEiiumXoifYF-PT--Sg@mail.gmail.com>
	<CAP9ODKoRytWOxAX3jn0nj12Jeah9mihobxd2PWaqApWA0ut9yQ@mail.gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 2 Jan 2013 10:11:08 -0700
X-Google-Sender-Auth: e_llgch-dSsmMtKzZYQ7oujdoBo
Message-ID: <CABcZANkEoq6BpZ7YWPnD_QVpFym31DmWH+G6mBaFOnqqeO6SXg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 02 Jan 2013 17:26:33 -0000
Content-Type: multipart/alternative; boundary=f46d042f954e49c5b404d2515608

--f46d042f954e49c5b404d2515608
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 2, 2013 at 10:04 AM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Wed, Jan 2, 2013 at 12:51 PM, Christopher Larson
> <chris_larson@mentor.com> wrote:
> > On Wed, Jan 2, 2013 at 4:53 AM, Shakeel, Muhammad
> > <muhammad_shakeel@mentor.com> wrote:
> >>
> >>  addtask do_archive_scripts_logs after do_package_write_rpm
> >> +addtask do_archive_scripts_logs after do_package_write_ipk
> >
> >
> > This will cause problems for anyone trying to do builds without
> package_ipk
> > at all. I'd suggest using anonymous python to add the appropriate package
> > dependencies based on what tasks actually exist.
>
> Uh? the only exception for it would be deb, right?


Yes, and?

-Chris

--f46d042f954e49c5b404d2515608
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">On Wed, Jan 2, 2013 at 10:04 AM, Otavio Salvador <span dir=3D"ltr">&lt;=
<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossyste=
ms.com.br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"im">=
On Wed, Jan 2, 2013 at 12:51 PM, Christopher Larson<br>
&lt;<a href=3D"mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&=
gt; wrote:<br>
&gt; On Wed, Jan 2, 2013 at 4:53 AM, Shakeel, Muhammad<br>
&gt; &lt;<a href=3D"mailto:muhammad_shakeel@mentor.com">muhammad_shakeel@me=
ntor.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0addtask do_archive_scripts_logs after do_package_write_rpm<b=
r>
&gt;&gt; +addtask do_archive_scripts_logs after do_package_write_ipk<br>
&gt;<br>
&gt;<br>
&gt; This will cause problems for anyone trying to do builds without packag=
e_ipk<br>
&gt; at all. I&#39;d suggest using anonymous python to add the appropriate =
package<br>
&gt; dependencies based on what tasks actually exist.<br>
<br>
</div></div>Uh? the only exception for it would be deb, right?</blockquote>=
</div><br></div><div class=3D"gmail_extra" style>Yes, and?</div><div class=
=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style>-Chris</d=
iv>

</div>

--f46d042f954e49c5b404d2515608--

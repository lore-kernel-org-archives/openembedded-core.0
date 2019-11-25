Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id C57467FC82
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 20:22:42 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id b20so12090929lfp.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 12:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1OzhcGG7tytQ+4HdpUgsVdZ4lTbPTJwfxb+FS9VqIX4=;
	b=FGOFmdKidKzIGZrVx6mIKVDrvpkYaVfPNpmZWT+zCQK3nfwV4b6bpBuUE4Qlxs64bS
	zm6uSw17p/yzJfETawxEch/M82ikhrWqhE/EfU+jY7qlpIb5dSzUeOJgGwwD0RZoycKe
	8gB2LX7BUvrf2RZorwhQ7jw8I6BS7QhmL6xQAZ9DQNwaFAvw2DjTMyShgPe7XkGwXLv+
	SF077GDEvDTu5ZX/98oCq3aJxMJeZVOciUUgaGd3Rv7wNGjuMj+aYWZ8bbApKyOENmZa
	Ue0qmO9mOAFS/wZPQmF25qQu0Z6p6S+f2jDyXl+Jp5WCKiWjWRLaJxsNZdB95NaBXOvd
	Apxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1OzhcGG7tytQ+4HdpUgsVdZ4lTbPTJwfxb+FS9VqIX4=;
	b=GnlCNUu59+NT0jeJgh4oBljz6mKe85VaEYHT9eZ+3ZlHdKruPuWSXpCRF62NP1ly4H
	BxjBqGCNDHuwtMnqBZaTOU9s+HoNQPjoFGK/H3Ta6bOOWmZxwWwbU25EZWSqvlh8747d
	yCbEo7EStSR2e7isf99AegXHB+LJoBA1feObV62h/HEXM/Xn6+ZpxhgclFcMVeuluYfG
	TVOj09DIRqWrqIHa4+qQP9Jqr/Dz33btudi0tiy3I6YOXBNCVKQSblicztqItUqNlNk3
	RBt2hx12Dl7fdP5fAbBHSrBONRfULKrWR1xZUXQ0C9hfnIn7+QRKS6mHQ/sclfBRcXz2
	y5OQ==
X-Gm-Message-State: APjAAAWAUbtOCZI3Ai+OzzhSpvlDaVQizAqDMjIJjis2zZqhyNV7W3P9
	0cVwJaciK/rCRySH4xE40MiweqmL2X1yEICpEnRYxPLW
X-Google-Smtp-Source: APXvYqwIFl3AjeB0IeHYjB1NjikSf0O78gU/BhcRdhlD++0eZW3hVlzP2xOq19p6vBDhTmQODmxpEv2+d4b6SF+2Fs8=
X-Received: by 2002:ac2:43c7:: with SMTP id u7mr21427816lfl.71.1574713362918; 
	Mon, 25 Nov 2019 12:22:42 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<20191125195555.GA31543@localhost>
In-Reply-To: <20191125195555.GA31543@localhost>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 26 Nov 2019 09:22:31 +1300
Message-ID: <CADySD0Ey3Zo_6g5mJMxPyG4uETgbya6aXN28qr_rifvH=BYhwg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Nov 2019 20:22:43 -0000
Content-Type: multipart/alternative; boundary="0000000000009eb37a059831867d"

--0000000000009eb37a059831867d
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

Seems you are correct. My distro is based upon TI's Arago distro which uses
following

# Select external binary prebuilt Arm toolchain
TCMODE = "external-arm"
TCLIBC = "external-arm-toolchain"

And external-arm-toolchain.bb recipe has following
require recipes-core/glibc/glibc-package.inc
INHIBIT_DEFAULT_DEPS = "1"
INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

And glibc-package.inc has following
INHIBIT_SYSROOT_STRIP = "1"

I just rebuild by disabling INHIBIT_PACKAGE_STRIP = "1" in
external-arm-toolchain.bb and it reduced image size to 12M

$ ls -al lib/
-rwxr-xr-x  1 ankur ankur  138436 Nov 26 09:08 ld-2.28.so
lrwxrwxrwx  1 ankur ankur      10 Nov 26 09:08 ld-linux-armhf.so.3 ->
ld-2.28.so
-rwxr-xr-x  1 ankur ankur 1246708 Nov 26 09:08 libc.so.6
-rwxr-xr-x  1 ankur ankur    9600 Nov 26 09:08 libdl.so.2
-rw-r--r--  1 ankur ankur     132 Nov 26 09:07 libgcc_s.so
-rw-r--r--  1 ankur ankur  124396 Nov 26 09:07 libgcc_s.so.1
-rwxr-xr-x  1 ankur ankur  451932 Nov 26 09:08 libm.so.6
-rwxr-xr-x  1 ankur ankur   67292 Nov 26 09:08 libnsl.so.1
-rwxr-xr-x  1 ankur ankur   26244 Nov 26 09:08 libnss_compat.so.2
-rwxr-xr-x  1 ankur ankur   17812 Nov 26 09:08 libnss_dns.so.2
-rwxr-xr-x  1 ankur ankur   38368 Nov 26 09:08 libnss_files.so.2
-rwxr-xr-x  1 ankur ankur   13708 Nov 26 09:08 libnss_hesiod.so.2
-rwxr-xr-x  1 ankur ankur   92356 Nov 26 09:08 libpthread.so.0

$ ls -al usr/lib
total 2816
drwxr-xr-x  3 ankur ankur    4096 Nov 26 09:18 .
drwxr-xr-x 10 ankur ankur    4096 Nov 26 09:18 ..
lrwxrwxrwx  1 ankur ankur      15 Nov 26 09:12 libi2c.so.0 ->
libi2c.so.0.1.1
-rwxr-xr-x  1 ankur ankur    5292 Nov 26 09:12 libi2c.so.0.1.1
lrwxrwxrwx  1 ankur ankur      16 Nov 26 09:11 libkmod.so.2 ->
libkmod.so.2.3.3
-rwxr-xr-x  1 ankur ankur   46840 Nov 26 09:11 libkmod.so.2.3.3
-rwxr-xr-x  1 ankur ankur 1404888 Nov 26 09:08 libstdc++.so.6
-rwxr-xr-x  1 ankur ankur 1404888 Nov 26 09:08 libstdc++.so.6.0.25
-rw-r--r--  1 ankur ankur    2388 Nov 26 09:08 libstdc++.so.6.0.25-gdb.py
Thank you so much for help.

Regards
Ankur

On Tue, Nov 26, 2019 at 8:55 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Tue, Nov 26, 2019 at 07:37:48AM +1300, Ankur Tyagi wrote:
> > Hi,
> >
> > Based upon "thud" branch, I created core-image-minimal for am335x-evm
> board
> > and resulting image size is very big (71M)
> >
> > /lib dir is 39M and /usr/lib is 24M.
> >...
> > -rwxr-xr-x  1 ankur ankur *16537400* Nov 26 06:41 libc.so.6
> >...
> > -rwxr-xr-x  1 ankur ankur  *6416640* Nov 26 06:41 libm.so.6
> >...
>
> These sizes are the expected sizes for the libraries with debug symbols.
>
> Are you setting INHIBIT_PACKAGE_DEBUG_SPLIT or something similar that
> prevents stripping of the target filesystem?
>
> > Thanks
> > Ankur
>
> cu
> Adrian
>

--0000000000009eb37a059831867d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">Hi Adrian,</div><div class=3D"gmail_default" s=
tyle=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-family:verdana,sans-serif">Seems you are correct. My dist=
ro is based upon TI&#39;s Arago distro which uses following</div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><br></div><div =
class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"># Select e=
xternal binary prebuilt Arm toolchain<br>TCMODE =3D &quot;external-arm&quot=
;<br>TCLIBC =3D &quot;external-arm-toolchain&quot;</div><div class=3D"gmail=
_default" style=3D"font-family:verdana,sans-serif"><br></div><div class=3D"=
gmail_default" style=3D"font-family:verdana,sans-serif">And <a href=3D"http=
://external-arm-toolchain.bb">external-arm-toolchain.bb</a> recipe has foll=
owing</div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-s=
erif">require recipes-core/glibc/glibc-package.inc</div><div class=3D"gmail=
_default" style=3D"font-family:verdana,sans-serif">INHIBIT_DEFAULT_DEPS =3D=
 &quot;1&quot;<br>INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>INHIBIT_PACKAG=
E_DEBUG_SPLIT =3D &quot;1&quot;</div><div class=3D"gmail_default" style=3D"=
font-family:verdana,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:verdana,sans-serif">And glibc-package.inc has following</d=
iv><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">IN=
HIBIT_SYSROOT_STRIP =3D &quot;1&quot;</div><div class=3D"gmail_default" sty=
le=3D"font-family:verdana,sans-serif"><br></div>I<span class=3D"gmail_defau=
lt" style=3D"font-family:verdana,sans-serif"> just rebuild by disabling INH=
IBIT_PACKAGE_STRIP =3D &quot;1&quot; in <a href=3D"http://external-arm-tool=
chain.bb">external-arm-toolchain.bb</a> and it reduced image size to 12M</s=
pan></div><div dir=3D"ltr"><span class=3D"gmail_default" style=3D"font-fami=
ly:verdana,sans-serif"><br></span></div><div dir=3D"ltr"><span class=3D"gma=
il_default" style=3D"font-family:verdana,sans-serif">$ ls -al lib/<br>-rwxr=
-xr-x =C2=A01 ankur ankur =C2=A0138436 Nov 26 09:08 <a href=3D"http://ld-2.=
28.so">ld-2.28.so</a><br>lrwxrwxrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=
=A010 Nov 26 09:08 ld-linux-armhf.so.3 -&gt; <a href=3D"http://ld-2.28.so">=
ld-2.28.so</a><br>-rwxr-xr-x =C2=A01 ankur ankur 1246708 Nov 26 09:08 libc.=
so.6<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 =C2=A09600 Nov 26 09:08 libdl=
.so.2<br>-rw-r--r-- =C2=A01 ankur ankur =C2=A0 =C2=A0 132 Nov 26 09:07 libg=
cc_s.so<br>-rw-r--r-- =C2=A01 ankur ankur =C2=A0124396 Nov 26 09:07 libgcc_=
s.so.1<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0451932 Nov 26 09:08 libm.so.=
6<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 67292 Nov 26 09:08 libnsl.so.1<b=
r>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 26244 Nov 26 09:08 libnss_compat.so=
.2<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 17812 Nov 26 09:08 libnss_dns.s=
o.2<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 38368 Nov 26 09:08 libnss_file=
s.so.2<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 13708 Nov 26 09:08 libnss_h=
esiod.so.2<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 92356 Nov 26 09:08 libp=
thread.so.0<br></span></div><div><br></div><div><div style=3D"font-family:v=
erdana,sans-serif" class=3D"gmail_default">$ ls -al usr/lib<br>total 2816<b=
r>drwxr-xr-x =C2=A03 ankur ankur =C2=A0 =C2=A04096 Nov 26 09:18 .<br>drwxr-=
xr-x 10 ankur ankur =C2=A0 =C2=A04096 Nov 26 09:18 ..<br>lrwxrwxrwx =C2=A01=
 ankur ankur =C2=A0 =C2=A0 =C2=A015 Nov 26 09:12 libi2c.so.0 -&gt; libi2c.s=
o.0.1.1<br>-rwxr-xr-x =C2=A01 ankur ankur =C2=A0 =C2=A05292 Nov 26 09:12 li=
bi2c.so.0.1.1<br>lrwxrwxrwx =C2=A01 ankur ankur =C2=A0 =C2=A0 =C2=A016 Nov =
26 09:11 libkmod.so.2 -&gt; libkmod.so.2.3.3<br>-rwxr-xr-x =C2=A01 ankur an=
kur =C2=A0 46840 Nov 26 09:11 libkmod.so.2.3.3<br>-rwxr-xr-x =C2=A01 ankur =
ankur 1404888 Nov 26 09:08 libstdc++.so.6<br>-rwxr-xr-x =C2=A01 ankur ankur=
 1404888 Nov 26 09:08 libstdc++.so.6.0.25<br>-rw-r--r-- =C2=A01 ankur ankur=
 =C2=A0 =C2=A02388 Nov 26 09:08 libstdc++.<a href=3D"http://so.6.0.25-gdb.p=
y">so.6.0.25-gdb.py</a><br></div><div style=3D"font-family:verdana,sans-ser=
if" class=3D"gmail_default"></div><div style=3D"font-family:verdana,sans-se=
rif" class=3D"gmail_default">Thank you so much for help.</div><div style=3D=
"font-family:verdana,sans-serif" class=3D"gmail_default"><br></div><div sty=
le=3D"font-family:verdana,sans-serif" class=3D"gmail_default">Regards</div>=
<div style=3D"font-family:verdana,sans-serif" class=3D"gmail_default">Ankur=
<br></div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Nov 26, 2019 at 8:55 AM Adrian Bunk &lt;<a href=3D"mailto=
:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Nov 26, 2019 at 07:37:48AM +1300, =
Ankur Tyagi wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Based upon &quot;thud&quot; branch, I created core-image-minimal for a=
m335x-evm board<br>
&gt; and resulting image size is very big (71M)<br>
&gt; <br>
&gt; /lib dir is 39M and /usr/lib is 24M.<br>
&gt;...<br>
&gt; -rwxr-xr-x=C2=A0 1 ankur ankur *16537400* Nov 26 06:41 libc.so.6<br>
<span class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"></sp=
an>&gt;...<br>
&gt; -rwxr-xr-x=C2=A0 1 ankur ankur=C2=A0 *6416640* Nov 26 06:41 libm.so.6<=
br>
&gt;...<br>
<br>
These sizes are the expected sizes for the libraries with debug symbols.<br=
>
<br>
Are you setting INHIBIT_PACKAGE_DEBUG_SPLIT or something similar that <br>
prevents stripping of the target filesystem?<br>
<br>
&gt; Thanks<br>
&gt; Ankur<br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>

--0000000000009eb37a059831867d--

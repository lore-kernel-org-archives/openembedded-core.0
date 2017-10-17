Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 76DC378299
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:41:27 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id m16so2101453iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 05:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bs+j2LomBZmS5GTcxRWKuJlu0nwP+/26GrgRGzMT8Nc=;
	b=P7grX3Tv3bG4xMDSoNotpIhpljOOnze02F2N0qx5fbcL8LS6MY/SKymeBIue/DDEFV
	Lg0ln2pmpgBzhMQg/YYKc7jLAY3g6xDtoVLDJGU3tT7BawZAeaDMY+kpEgaG4lNQXp3Z
	yop8ePHLC8IXGmsHiq0dgKixPvybVICZroakMjjz7dSZhOmuXYbw1ofbt7N5RHtCBNJs
	1kA/ZGtcAPNaJH9FKidzyTqYN5GIz8I/BuSjQrntxtr6Y1omHzey5CkeadDjWahHQOmk
	BYmpsaLGZCDOj7Vy584um22CD4DKVYTVstqLNPvwWF5kgiGaHEl61Af4Lp1xnxCK33Zi
	kG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bs+j2LomBZmS5GTcxRWKuJlu0nwP+/26GrgRGzMT8Nc=;
	b=Lm67KhSCeq0wyrSG7fMVZnljHM3z1x81eU56sZ8Wj0SPf9EfoRueFFb6Jd5slMP9QR
	h0pff8lbsdntE96P/FNmYj2zJMsAOuzLQE/fz9g2KoMA5tvnZPnTYdBpB5yWKWUmuhMK
	WbFbny6cY7oVzkspYpPgaOiGgej5zDA2924FAJ9MHhBtjjgIGmfvT4NRKSdO13mssMjV
	w7z2V4XxeP/q7Db0nCVXWz9eDwZIPQUbaLKooXYjm88MjIXfpgWXfsvDc0ud4d9sUqR4
	coEkn7y7WKB7Q/po3awQDJbiA0hd2KBfmSv2Jz0wR9esa0XFjKDCCFbrbFZ569bVEO3h
	7/+w==
X-Gm-Message-State: AMCzsaXz++jkBf+GvNGMaObV/inTYjDrDvzCOiTmdcrzLlp3GOPouqkS
	L0E4R2sWnmPR6IPQWOwx4ddRa+cLtJcMIquI4oeI0A==
X-Google-Smtp-Source: AOwi7QASjpBkXcU8n2DtmIdPf3yQTv6mZO8cnHw2/xyNzEK0VLIzOeLNPdC2HkSQ1CXXESLMX2esWdrfTTM7YOGQyxA=
X-Received: by 10.107.36.80 with SMTP id k77mr15330986iok.176.1508244088728;
	Tue, 17 Oct 2017 05:41:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 17 Oct 2017 05:41:08 -0700 (PDT)
In-Reply-To: <20171014154858.35123-4-raj.khem@gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-4-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 13:41:08 +0100
Message-ID: <CAJTo0LZC2At7Jnni1eLBTXyAdWsNVf-ynAVX8thc1EOujnsRuA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] libevdev: Add dependency on libcheck
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
X-List-Received-Date: Tue, 17 Oct 2017 12:41:27 -0000
Content-Type: multipart/alternative; boundary="001a1141909e24e690055bbd716c"

--001a1141909e24e690055bbd716c
Content-Type: text/plain; charset="UTF-8"

Curious how you hit this with master.  For me:

checking for check >= 0.9.9... no
configure: WARNING: check not found - skipping building unit tests

The configure script uses pkg-config so shouldn't be picking up host
binaries.  Can you dig a little?

Ross

On 14 October 2017 at 16:48, Khem Raj <raj.khem@gmail.com> wrote:

> Fixes failures like
>
> test-main.o ../../libevdev-1.5.2/test/test-main.c
> | ../../libevdev-1.5.2/test/test-main.c:24:19: fatal error: check.h: No
> such file or directory
> |  #include <check.h>
> |                    ^
> | compilation terminated.
> | make[2]: *** [test-main.o] Error 1
>
> Change-Id: I73fce0532b91fe410d509ae55ff471ad2ea5d929
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/libevdev/libevdev_1.5.7.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/libevdev/libevdev_1.5.7.bb
> b/meta/recipes-support/libevdev/libevdev_1.5.7.bb
> index f740da206e..4b54971b1c 100644
> --- a/meta/recipes-support/libevdev/libevdev_1.5.7.bb
> +++ b/meta/recipes-support/libevdev/libevdev_1.5.7.bb
> @@ -6,6 +6,8 @@ LICENSE = "MIT-X"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
>                      file://libevdev/libevdev.h;endline=21;md5=
> 7ff4f0b5113252c2f1a828e0bbad98d1"
>
> +DEPENDS += "libcheck"
> +
>  SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
>
>  SRC_URI[md5sum] = "4f1cfaee8d75ea3fbbfeb99a98730952"
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141909e24e690055bbd716c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Curious how you hit this with master.=C2=A0 For me:<div><b=
r></div><div><div>checking for check &gt;=3D 0.9.9... no</div><div>configur=
e: WARNING: check not found - skipping building unit tests</div></div><div>=
<br></div><div>The configure script uses pkg-config so shouldn&#39;t be pic=
king up host binaries.=C2=A0 Can you dig a little?</div><div><br></div><div=
>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 October 2017 at 16:48, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Fixes failures like<br>
<br>
test-main.o ../../libevdev-1.5.2/test/<wbr>test-main.c<br>
| ../../libevdev-1.5.2/test/<wbr>test-main.c:24:19: fatal error: check.h: N=
o such file or directory<br>
|=C2=A0 #include &lt;check.h&gt;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br=
>
| compilation terminated.<br>
| make[2]: *** [test-main.o] Error 1<br>
<br>
Change-Id: I73fce0532b91fe410d509ae55ff47<wbr>1ad2ea5d929<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libevdev/<a href=3D"http://libevdev_1.5.7.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>libevdev_1.5.7.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-support/<wbr>libevdev/<a href=3D"http://libevdev_=
1.5.7.bb" rel=3D"noreferrer" target=3D"_blank">libevdev_1.5.7.bb</a> b/meta=
/recipes-support/<wbr>libevdev/<a href=3D"http://libevdev_1.5.7.bb" rel=3D"=
noreferrer" target=3D"_blank">libevdev_1.5.7.bb</a><br>
index f740da206e..4b54971b1c 100644<br>
--- a/meta/recipes-support/<wbr>libevdev/<a href=3D"http://libevdev_1.5.7.b=
b" rel=3D"noreferrer" target=3D"_blank">libevdev_1.5.7.bb</a><br>
+++ b/meta/recipes-support/<wbr>libevdev/<a href=3D"http://libevdev_1.5.7.b=
b" rel=3D"noreferrer" target=3D"_blank">libevdev_1.5.7.bb</a><br>
@@ -6,6 +6,8 @@ LICENSE =3D &quot;MIT-X&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>75aae0d38feea6fd=
a97ca381cb9132<wbr>eb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://libevdev/libevdev.h;<wbr>endline=3D21;md5=3D<wbr>7ff4f0b5113252c2=
f1a828e0bbad98<wbr>d1&quot;<br>
<br>
+DEPENDS +=3D &quot;libcheck&quot;<br>
+<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/software/libe=
vdev/${BP}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://www.freedesk=
top.org/<wbr>software/libevdev/${BP}.tar.xz</a><wbr>&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>4f1cfaee8d75ea3fbbfeb99a987309<wbr>52&=
quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1141909e24e690055bbd716c--

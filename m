Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.12070.1608744586745019527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 09:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mPeUbmGk;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n26so179981eju.6
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 09:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z/C01nuN9/JNzBExzR9YDc2EIISb7cRVvglqdFqw+oE=;
        b=mPeUbmGkV6DWfHHROqTVBIlTh37RTzrMoYATKWgWkSVZjwqsqnON6f26gDjUBBrEJ5
         7P2u8iWoc+Ne4IVPp2TbD16I6IS+pHa3EQcwPHYEPALMEd6UlWoPKnPe2ykmf8n0we3E
         44VuBeQDjy/2KJD9NnRpjpS9cie25ZKbybf0ifA8LGRqARmUUh9pKFfPkr7vvoN/TP24
         DBqSwRABEtwYNdz2IBgGbvjhyCS33ub4LhQK77+8coc5uQxRzBf+QzEtzuCVHPuHxyzs
         Pnr/Jbz9nYXZNmdOPQj7ah6nlSB1j+I/94LUBfCe5zh69ESXVWny3y4AOHbvW9tnwfDb
         JAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z/C01nuN9/JNzBExzR9YDc2EIISb7cRVvglqdFqw+oE=;
        b=jh/qwndRHQhpIRXUu+Up9RVYl4VQ3C9cq2EF++MRvliNhQlj796X8nRq4/vRmc6ZrM
         BBIXHuvjPcokRTgo8xNcRziV6ouvaI6qhuBa3IvlKIFD79CDtH18Il3Jo6C3OhmNK/s1
         9PhFfamL5zOXHyk7gtZbF8NamHwj172Iw4wc24fIyKO/or5Tb2qstLCrriUjd4OnsQAc
         3MoKPGysMis2XBr4NDcHf36QY2J4clix10hSjBih7W5xO1tQndxuzPP1nDb8Ov2oqY1K
         QNB7HRqZuoblntEKv5SFF4xwhhnHsNM54jkhM1wq7XTLg6gA++97V3LF3MUl0nJZzSig
         mmpA==
X-Gm-Message-State: AOAM532UbIS1ir6RR+ybxsMGac2FH1VMaovFhzicN8SWw4GXnF2UqKL4
	SojCitNaLCHnGp6qWZRIDsqgIQD5P9bH3OcE5sQ=
X-Google-Smtp-Source: ABdhPJxyKpY6T7K7Sjm7fHxV9tx0YJwgSN7kAozOwhM9DYn3xw3X/5YgVCtyOBEKI5nwQOSYsQDBry5yMDlEfSvd2NI=
X-Received: by 2002:a17:906:49c2:: with SMTP id w2mr24123978ejv.12.1608744585132;
 Wed, 23 Dec 2020 09:29:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608735614.git.anuj.mittal@intel.com> <54f8b66ee2439bc6ab68e622f34d451d1bdbfcd9.1608735614.git.anuj.mittal@intel.com>
In-Reply-To: <54f8b66ee2439bc6ab68e622f34d451d1bdbfcd9.1608735614.git.anuj.mittal@intel.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Wed, 23 Dec 2020 17:29:46 +0000
Message-ID: <CANPvuR=pDJRbU2BboW-nPpcYBWE8jErPSm7dz-K4uapVQab+pA@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH 19/35] ffmpeg: add srt package config knob
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000087fbe605b72509d7"

--00000000000087fbe605b72509d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

This patch requereis srt from meta-openembedded but it is only present on
master branch
https://git.openembedded.org/meta-openembedded/commit/?id=3D23343cb8e94979=
81e4ef14d5eeae5df9bf891624

This needs 23343cb8 to be backported to gatesgarth on meta-openembedded.

Jose

Anuj Mittal <anuj.mittal@intel.com> escreveu no dia quarta, 23/12/2020 =C3=
=
=A0(s)
15:19:

> From: Jose Quaresma <quaresma.jose@gmail.com>
>
>     * 0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
>       Upstream-Status: Backport [
> https://github.com/FFmpeg/FFmpeg/commit/7c59e1b0f285cd7c7b35fcd71f49c5fd=
52cf9315
> ]
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 5b9c0fa129308180d6d3acf0a321433652ecd9dc)
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  ...uild-fail-when-used-the-libsrt-1.4.1.patch | 52 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |  2 +
>  2 files changed, 54 insertions(+)
>  create mode 100644
> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-=
used-the-libsrt-1.4.1.patch
>
> diff --git
> a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-whe=
n-used-the-libsrt-1.4.1.patch
> b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-whe=
n-used-the-libsrt-1.4.1.patch
> new file mode 100644
> index 0000000000..7635c9196a
> --- /dev/null
> +++
> b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-whe=
n-used-the-libsrt-1.4.1.patch
> @@ -0,0 +1,52 @@
> +From aebb72e025cbfbd4a6765354f6f565ad4ac89789 Mon Sep 17 00:00:00 2001
> +From: Jun Zhao <barryjzhao@tencent.com>
> +Date: Sun, 12 Jul 2020 05:48:48 +0800
> +Subject: [PATCH] lavf/srt: fix build fail when used the libsrt 1.4.1
> +
> +lavf/srt: fix build fail when used the libsrt 1.4.1
> +
> +libsrt changed the:
> +SRTO_SMOOTHER   -> SRTO_CONGESTION
> +SRTO_STRICTENC  -> SRTO_ENFORCEDENCRYPTION
> +and removed the front of deprecated options (SRTO_SMOOTHER/SRTO_STRICTE=
NC)
> +in the header, it's lead to build fail
> +
> +fix #8760
> +
> +Upstream-Status: Backport [
> https://github.com/FFmpeg/FFmpeg/commit/7c59e1b0f285cd7c7b35fcd71f49c5fd=
52cf9315
> ]
> +
> +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> +Signed-off-by: Jun Zhao <barryjzhao@tencent.com>
> +---
> + libavformat/libsrt.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/libavformat/libsrt.c b/libavformat/libsrt.c
> +index 4de575b..4719ce0 100644
> +--- a/libavformat/libsrt.c
> ++++ b/libavformat/libsrt.c
> +@@ -313,8 +313,12 @@ static int libsrt_set_options_pre(URLContext *h, i=
nt
> fd)
> +         (s->pbkeylen >=3D 0 && libsrt_setsockopt(h, fd, SRTO_PBKEYLEN,
> "SRTO_PBKEYLEN", &s->pbkeylen, sizeof(s->pbkeylen)) < 0) ||
> +         (s->passphrase && libsrt_setsockopt(h, fd, SRTO_PASSPHRASE,
> "SRTO_PASSPHRASE", s->passphrase, strlen(s->passphrase)) < 0) ||
> + #if SRT_VERSION_VALUE >=3D 0x010302
> ++#if SRT_VERSION_VALUE >=3D 0x010401
> ++        (s->enforced_encryption >=3D 0 && libsrt_setsockopt(h, fd,
> SRTO_ENFORCEDENCRYPTION, "SRTO_ENFORCEDENCRYPTION",
> &s->enforced_encryption, sizeof(s->enforced_encryption)) < 0) ||
> ++#else
> +         /* SRTO_STRICTENC =3D=3D SRTO_ENFORCEDENCRYPTION (53), but for
> compatibility, we used SRTO_STRICTENC */
> +         (s->enforced_encryption >=3D 0 && libsrt_setsockopt(h, fd,
> SRTO_STRICTENC, "SRTO_STRICTENC", &s->enforced_encryption,
> sizeof(s->enforced_encryption)) < 0) ||
> ++#endif
> +         (s->kmrefreshrate >=3D 0 && libsrt_setsockopt(h, fd,
> SRTO_KMREFRESHRATE, "SRTO_KMREFRESHRATE", &s->kmrefreshrate,
> sizeof(s->kmrefreshrate)) < 0) ||
> +         (s->kmpreannounce >=3D 0 && libsrt_setsockopt(h, fd,
> SRTO_KMPREANNOUNCE, "SRTO_KMPREANNOUNCE", &s->kmpreannounce,
> sizeof(s->kmpreannounce)) < 0) ||
> + #endif
> +@@ -333,7 +337,11 @@ static int libsrt_set_options_pre(URLContext *h, i=
nt
> fd)
> +         (s->lossmaxttl >=3D 0 && libsrt_setsockopt(h, fd, SRTO_LOSSMAX=
TTL,
> "SRTO_LOSSMAXTTL", &s->lossmaxttl, sizeof(s->lossmaxttl)) < 0) ||
> +         (s->minversion >=3D 0 && libsrt_setsockopt(h, fd, SRTO_MINVERS=
ION,
> "SRTO_MINVERSION", &s->minversion, sizeof(s->minversion)) < 0) ||
> +         (s->streamid && libsrt_setsockopt(h, fd, SRTO_STREAMID,
> "SRTO_STREAMID", s->streamid, strlen(s->streamid)) < 0) ||
> ++#if SRT_VERSION_VALUE >=3D 0x010401
> ++        (s->smoother && libsrt_setsockopt(h, fd, SRTO_CONGESTION,
> "SRTO_CONGESTION", s->smoother, strlen(s->smoother)) < 0) ||
> ++#else
> +         (s->smoother && libsrt_setsockopt(h, fd, SRTO_SMOOTHER,
> "SRTO_SMOOTHER", s->smoother, strlen(s->smoother)) < 0) ||
> ++#endif
> +         (s->messageapi >=3D 0 && libsrt_setsockopt(h, fd, SRTO_MESSAGE=
API,
> "SRTO_MESSAGEAPI", &s->messageapi, sizeof(s->messageapi)) < 0) ||
> +         (s->payload_size >=3D 0 && libsrt_setsockopt(h, fd,
> SRTO_PAYLOADSIZE, "SRTO_PAYLOADSIZE", &s->payload_size,
> sizeof(s->payload_size)) < 0) ||
> +         ((h->flags & AVIO_FLAG_WRITE) && libsrt_setsockopt(h, fd,
> SRTO_SENDER, "SRTO_SENDER", &yes, sizeof(yes)) < 0)) {
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> index 517dac7f05..72c2fe16ec 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> @@ -25,6 +25,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>
>  SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>             file://mips64_cpu_detection.patch \
> +
>  file://0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb"
>
> @@ -70,6 +71,7 @@ PACKAGECONFIG[mp3lame] =3D
> "--enable-libmp3lame,--disable-libmp3lame,lame"
>  PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
>  PACKAGECONFIG[sdl2] =3D "--enable-sdl2,--disable-sdl2,virtual/libsdl2"
>  PACKAGECONFIG[speex] =3D "--enable-libspeex,--disable-libspeex,speex"
> +PACKAGECONFIG[srt] =3D "--enable-libsrt,--disable-libsrt,srt"
>  PACKAGECONFIG[theora] =3D "--enable-libtheora,--disable-libtheora,libth=
eora
> libogg"
>  PACKAGECONFIG[vaapi] =3D "--enable-vaapi,--disable-vaapi,libva"
>  PACKAGECONFIG[vdpau] =3D "--enable-vdpau,--disable-vdpau,libvdpau"
> --
> 2.29.2
>
>
>=20
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--00000000000087fbe605b72509d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Anuj,<div><br></div><div>This patch requereis srt from =
meta-openembedded but it is only present on master branch</div><div><a href=
=
=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3D23343cb8e9=
497981e4ef14d5eeae5df9bf891624">https://git.openembedded.org/meta-openembed=
ded/commit/?id=3D23343cb8e9497981e4ef14d5eeae5df9bf891624</a><br></div><div=
><br></div><div>This needs 23343cb8 to be backported to=C2=A0gatesgarth on=
=C2=A0meta-openembedded.</div><div><br></div><div>Jose</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Anuj Mittal &l=
t;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; es=
creveu no dia quarta, 23/12/2020 =C3=A0(s) 15:19:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Jose Quaresma &lt;<a href=3D"mailto=
:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;=
<br>
<br>
=C2=A0 =C2=A0 * 0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.pa=
tch<br>
=C2=A0 =C2=A0 =C2=A0 Upstream-Status: Backport [<a href=3D"https://github.=
com/FFmpeg/FFmpeg/commit/7c59e1b0f285cd7c7b35fcd71f49c5fd52cf9315" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/FFmpeg/FFmpeg/commit/7c59e1=
b0f285cd7c7b35fcd71f49c5fd52cf9315</a>]<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com=
" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
(cherry picked from commit 5b9c0fa129308180d6d3acf0a321433652ecd9dc)<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0...uild-fail-when-used-the-libsrt-1.4.1.patch | 52 +++++++++++++++++=
++<br>
=C2=A0.../recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.1.bb" rel=
=
=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.1.bb</a> |=C2=A0 2 +<br>
=C2=A02 files changed, 54 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-s=
rt-fix-build-fail-when-used-the-libsrt-1.4.1.patch<br>
<br>
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build=
-fail-when-used-the-libsrt-1.4.1.patch b/meta/recipes-multimedia/ffmpeg/ffm=
peg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch<br>
new file mode 100644<br>
index 0000000000..7635c9196a<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-w=
hen-used-the-libsrt-1.4.1.patch<br>
@@ -0,0 +1,52 @@<br>
+From aebb72e025cbfbd4a6765354f6f565ad4ac89789 Mon Sep 17 00:00:00 2001<br=
>
+From: Jun Zhao &lt;<a href=3D"mailto:barryjzhao@tencent.com" target=3D"_b=
lank">barryjzhao@tencent.com</a>&gt;<br>
+Date: Sun, 12 Jul 2020 05:48:48 +0800<br>
+Subject: [PATCH] lavf/srt: fix build fail when used the libsrt 1.4.1<br>
+<br>
+lavf/srt: fix build fail when used the libsrt 1.4.1<br>
+<br>
+libsrt changed the:<br>
+SRTO_SMOOTHER=C2=A0 =C2=A0-&gt; SRTO_CONGESTION<br>
+SRTO_STRICTENC=C2=A0 -&gt; SRTO_ENFORCEDENCRYPTION<br>
+and removed the front of deprecated options (SRTO_SMOOTHER/SRTO_STRICTENC=
)<br>
+in the header, it&#39;s lead to build fail<br>
+<br>
+fix #8760<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/FFmpeg/FFmpeg/co=
mmit/7c59e1b0f285cd7c7b35fcd71f49c5fd52cf9315" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/FFmpeg/FFmpeg/commit/7c59e1b0f285cd7c7b35fcd71f=
49c5fd52cf9315</a>]<br>
+<br>
+Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
+Signed-off-by: Jun Zhao &lt;<a href=3D"mailto:barryjzhao@tencent.com" tar=
get=3D"_blank">barryjzhao@tencent.com</a>&gt;<br>
+---<br>
+ libavformat/libsrt.c | 8 ++++++++<br>
+ 1 file changed, 8 insertions(+)<br>
+<br>
+diff --git a/libavformat/libsrt.c b/libavformat/libsrt.c<br>
+index 4de575b..4719ce0 100644<br>
+--- a/libavformat/libsrt.c<br>
++++ b/libavformat/libsrt.c<br>
+@@ -313,8 +313,12 @@ static int libsrt_set_options_pre(URLContext *h, int=
 fd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;pbkeylen &gt;=3D 0 &amp;&amp; li=
bsrt_setsockopt(h, fd, SRTO_PBKEYLEN, &quot;SRTO_PBKEYLEN&quot;, &amp;s-&gt=
;pbkeylen, sizeof(s-&gt;pbkeylen)) &lt; 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;passphrase &amp;&amp; libsrt_set=
sockopt(h, fd, SRTO_PASSPHRASE, &quot;SRTO_PASSPHRASE&quot;, s-&gt;passphra=
se, strlen(s-&gt;passphrase)) &lt; 0) ||<br>
+ #if SRT_VERSION_VALUE &gt;=3D 0x010302<br>
++#if SRT_VERSION_VALUE &gt;=3D 0x010401<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (s-&gt;enforced_encryption &gt;=3D 0 &amp;&a=
mp; libsrt_setsockopt(h, fd, SRTO_ENFORCEDENCRYPTION, &quot;SRTO_ENFORCEDEN=
CRYPTION&quot;, &amp;s-&gt;enforced_encryption, sizeof(s-&gt;enforced_encry=
ption)) &lt; 0) ||<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* SRTO_STRICTENC =3D=3D SRTO_ENFORCEDE=
NCRYPTION (53), but for compatibility, we used SRTO_STRICTENC */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;enforced_encryption &gt;=3D 0 &a=
mp;&amp; libsrt_setsockopt(h, fd, SRTO_STRICTENC, &quot;SRTO_STRICTENC&quot=
;, &amp;s-&gt;enforced_encryption, sizeof(s-&gt;enforced_encryption)) &lt; =
0) ||<br>
++#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;kmrefreshrate &gt;=3D 0 &amp;&am=
p; libsrt_setsockopt(h, fd, SRTO_KMREFRESHRATE, &quot;SRTO_KMREFRESHRATE&qu=
ot;, &amp;s-&gt;kmrefreshrate, sizeof(s-&gt;kmrefreshrate)) &lt; 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;kmpreannounce &gt;=3D 0 &amp;&am=
p; libsrt_setsockopt(h, fd, SRTO_KMPREANNOUNCE, &quot;SRTO_KMPREANNOUNCE&qu=
ot;, &amp;s-&gt;kmpreannounce, sizeof(s-&gt;kmpreannounce)) &lt; 0) ||<br>
+ #endif<br>
+@@ -333,7 +337,11 @@ static int libsrt_set_options_pre(URLContext *h, int=
 fd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;lossmaxttl &gt;=3D 0 &amp;&amp; =
libsrt_setsockopt(h, fd, SRTO_LOSSMAXTTL, &quot;SRTO_LOSSMAXTTL&quot;, &amp=
;s-&gt;lossmaxttl, sizeof(s-&gt;lossmaxttl)) &lt; 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;minversion &gt;=3D 0 &amp;&amp; =
libsrt_setsockopt(h, fd, SRTO_MINVERSION, &quot;SRTO_MINVERSION&quot;, &amp=
;s-&gt;minversion, sizeof(s-&gt;minversion)) &lt; 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;streamid &amp;&amp; libsrt_setso=
ckopt(h, fd, SRTO_STREAMID, &quot;SRTO_STREAMID&quot;, s-&gt;streamid, strl=
en(s-&gt;streamid)) &lt; 0) ||<br>
++#if SRT_VERSION_VALUE &gt;=3D 0x010401<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (s-&gt;smoother &amp;&amp; libsrt_setsockopt=
(h, fd, SRTO_CONGESTION, &quot;SRTO_CONGESTION&quot;, s-&gt;smoother, strle=
n(s-&gt;smoother)) &lt; 0) ||<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;smoother &amp;&amp; libsrt_setso=
ckopt(h, fd, SRTO_SMOOTHER, &quot;SRTO_SMOOTHER&quot;, s-&gt;smoother, strl=
en(s-&gt;smoother)) &lt; 0) ||<br>
++#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;messageapi &gt;=3D 0 &amp;&amp; =
libsrt_setsockopt(h, fd, SRTO_MESSAGEAPI, &quot;SRTO_MESSAGEAPI&quot;, &amp=
;s-&gt;messageapi, sizeof(s-&gt;messageapi)) &lt; 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;payload_size &gt;=3D 0 &amp;&amp=
; libsrt_setsockopt(h, fd, SRTO_PAYLOADSIZE, &quot;SRTO_PAYLOADSIZE&quot;, =
&amp;s-&gt;payload_size, sizeof(s-&gt;payload_size)) &lt; 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((h-&gt;flags &amp; AVIO_FLAG_WRITE) &a=
mp;&amp; libsrt_setsockopt(h, fd, SRTO_SENDER, &quot;SRTO_SENDER&quot;, &am=
p;yes, sizeof(yes)) &lt; 0)) {<br>
diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.1=
.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.1.bb</a> b/meta/recipe=
s-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">ffmpeg_4.3.1.bb</a><br>
index 517dac7f05..72c2fe16ec 100644<br>
--- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.1.bb" re=
l=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.1.bb</a><br>
+++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.3.1.bb" re=
l=3D"noreferrer" target=3D"_blank">ffmpeg_4.3.1.bb</a><br>
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPLv2;md5=3Db2=
34ee4d69f5fce4486a80fdaf4a4263 \<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://www.ffmpeg.org/releases/$%7BBP%=
7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://www.ffmpeg.org/rele=
ases/${BP}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mips64_cpu_detection.patc=
h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-lavf-srt-fix-build-f=
ail-when-used-the-libsrt-1.4.1.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ad009240d46e307b4e03a213a0f49c11b650e44=
5b1f8be0dda2a9212b34d2ffb&quot;<br>
<br>
@@ -70,6 +71,7 @@ PACKAGECONFIG[mp3lame] =3D &quot;--enable-libmp3lame,--d=
isable-libmp3lame,lame&quot;<br>
=C2=A0PACKAGECONFIG[openssl] =3D &quot;--enable-openssl,--disable-openssl,=
openssl&quot;<br>
=C2=A0PACKAGECONFIG[sdl2] =3D &quot;--enable-sdl2,--disable-sdl2,virtual/l=
ibsdl2&quot;<br>
=C2=A0PACKAGECONFIG[speex] =3D &quot;--enable-libspeex,--disable-libspeex,=
speex&quot;<br>
+PACKAGECONFIG[srt] =3D &quot;--enable-libsrt,--disable-libsrt,srt&quot;<b=
r>
=C2=A0PACKAGECONFIG[theora] =3D &quot;--enable-libtheora,--disable-libtheo=
ra,libtheora libogg&quot;<br>
=C2=A0PACKAGECONFIG[vaapi] =3D &quot;--enable-vaapi,--disable-vaapi,libva&=
quot;<br>
=C2=A0PACKAGECONFIG[vdpau] =3D &quot;--enable-vdpau,--disable-vdpau,libvdp=
au&quot;<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Qua=
resma</div></div>

--00000000000087fbe605b72509d7--

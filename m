Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB0C78901
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 21:01:08 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id w128so7699144wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 13:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qdZRPbEZAJOjHHlcOWpvuv+YoAt4i//63CZ1qasJQLU=;
	b=GL4etb/oRYUhIhxYoze/oG+YbtJdlnvscjDNwbP4lw4NCVmCRylHr2D4k49yp3CXmh
	MFw8eXEGnhQoq4vVFoppFaxU0S+Voj0RBZNuQB2KMWbOGtZ4QNvYh7p+yT2SnupGtWBe
	O1flj4T9XX4pr5hJlLfGbnwIaGvaJU6vtiWN7gCp/CzUxguwNHbcU0Fs9t5De6U+bb2n
	8an3AoUlyx4PLnkP7HaQYFnR/tq0edtNK8uucst/sqiHFHxkxR/tEMEWk8TUwNcSSoAh
	n1lgWb/+BOszkjqxXn95jVOrqq5np+NYR47UaZIR9+zQ7QfO4caYSNF0UiQdINBP7Upi
	OKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qdZRPbEZAJOjHHlcOWpvuv+YoAt4i//63CZ1qasJQLU=;
	b=BrXAntlbqX1ltaMAOsGh+bz6D8w2cjuW8hTjRl7Vs+aXa32mSca9QZ9RnV3phjy5VZ
	E+abxNb07yT98vBBJbyeG4MquucJh8m51bQ0q50VhXYEa4Tr4Z7tR8zTNPJpUHoOa3mb
	+BPcbTIA3CXo72DMmzaAxb+ubf0ydtQQ+JTAKRtyF6TbvfHOT45T0FBsg28k0Hq28dgH
	LMTjp3cRDyHSHLXDkIZhCNF6vUJfZGIw1ghkj6MgxxqpJsr/5ompTptJfgLOtq0qUDFd
	lZ1W0vsRVc6K8GfzZbm11XlYsUiriXaH1Qpc/osIfCQzaqfvla5Fu2pgAUJMc0MLWq0v
	e+Hg==
X-Gm-Message-State: APf1xPBz67z+TIPCgI6YiIZfzqBYw3FisloE0N37m9DAq4kgmF3WwVuU
	+syjU2SZ0FEVQdg4HVvLKRViRgyHm4IMbbzDoq26GQ==
X-Google-Smtp-Source: AG47ELvYZSBq4w9yCz0eIdYJ0vlKRC7kD6WiUu/KMvew5mYu9CSPt0esAWdXP1uTQaxSLNQGE2u8vH2GaSMohYGm7FA=
X-Received: by 10.80.246.143 with SMTP id d15mr21047666edn.196.1519851669727; 
	Wed, 28 Feb 2018 13:01:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.143.162 with HTTP; Wed, 28 Feb 2018 13:01:09 -0800 (PST)
In-Reply-To: <CAJTo0LatUkmJPixp2_CnxwRfP4hqvMdjtaiX3H_ezFxRwr_mAA@mail.gmail.com>
References: <20180228184225.10017-1-francescogiancane8@gmail.com>
	<CAJTo0LatUkmJPixp2_CnxwRfP4hqvMdjtaiX3H_ezFxRwr_mAA@mail.gmail.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Wed, 28 Feb 2018 22:01:09 +0100
Message-ID: <CAEQ58sgRB4kZ9Z_gmSPWt0nd8WrPmYi81HQoEAz_SbbgFHHFTg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libepoxy: New recipe updated to latest release
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
X-List-Received-Date: Wed, 28 Feb 2018 21:01:09 -0000
Content-Type: multipart/alternative; boundary="f403045f1f8ae2affc05664c0a3f"

--f403045f1f8ae2affc05664c0a3f
Content-Type: text/plain; charset="UTF-8"

Hi,

Thank you for the review.
I took the opportunity to re-check my patch, as requested:
- removed old version;
- updated the patches for 1.5.0 version of the library;
- fixed configure-time flags;
- tested again.

Everything seems OK now.

a PATCH v2 shall follow.

Thanks,
Francesco Giancane

2018-02-28 20:58 GMT+01:00 Burton, Ross <ross.burton@intel.com>:

> Please also delete the old release.
>
> Ross
>
> On 28 February 2018 at 18:42, Francesco Giancane <
> francescogiancane8@gmail.com> wrote:
>
>> libepoxy 1.4.3 did not compile successfully because of
>> implicit symbol definitions and link-time errors.
>> A new recipe with latest libepoxy release (1.5.0) which
>> successfully compiles is provided.
>>
>> Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
>> ---
>>  meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb | 24
>> ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>  create mode 100644 meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
>>
>> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
>> b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
>> new file mode 100644
>> index 0000000000..d7702cfd64
>> --- /dev/null
>> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "OpenGL function pointer management library"
>> +HOMEPAGE = "https://github.com/anholt/libepoxy/"
>> +SECTION = "libs"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
>> +
>> +SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${
>> BP}.tar.xz \
>> +           "
>> +SRC_URI[md5sum] = "63fe3847789258254dcd7e3fdb9e7f5e"
>> +SRC_URI[sha256sum] = "4c94995398a6ebf691600dda2e968
>> 5a0cac261414175c2adf4645cdfab42a5d5"
>> +UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
>> +
>> +inherit meson pkgconfig distro_features_check
>> +
>> +REQUIRED_DISTRO_FEATURES = "opengl"
>> +
>> +DEPENDS = "util-macros"
>> +
>> +PACKAGECONFIG[egl] = "-Denable-egl=yes, -Denable-egl=no, virtual/egl"
>> +PACKAGECONFIG[x11] = "-Denable-glx=yes, -Denable-glx=no, virtual/libx11
>> virtual/libgl"
>> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
>> +
>> +EXTRA_OEMESON_append_libc-musl = " -Dhas-dlvsym=false "
>> --
>> 2.14.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--f403045f1f8ae2affc05664c0a3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Thank you for the review.</div><div=
>I took the opportunity to re-check my patch, as requested:</div><div>- rem=
oved old version;</div><div>- updated the patches for 1.5.0 version of the =
library;</div><div class=3D"gmail_extra">- fixed configure-time flags;</div=
><div class=3D"gmail_extra">- tested again.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Everything seems OK now.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">a PATCH v2 shall f=
ollow.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Thanks,<br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr">Francesco Giancane</div></div></div></div></div></div></div>
<br><div class=3D"gmail_quote">2018-02-28 20:58 GMT+01:00 Burton, Ross <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank=
">ross.burton@intel.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr">Please also delete the old release.<div><br></div><div>Ross=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div>=
<div class=3D"h5">On 28 February 2018 at 18:42, Francesco Giancane <span di=
r=3D"ltr">&lt;<a href=3D"mailto:francescogiancane8@gmail.com" target=3D"_bl=
ank">francescogiancane8@gmail.com</a>&gt;</span> wrote:<br></div></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div><div class=3D"h5">libepoxy 1.4.3 did not co=
mpile successfully because of<br>
implicit symbol definitions and link-time errors.<br>
A new recipe with latest libepoxy release (1.5.0) which<br>
successfully compiles is provided.<br>
<br>
Signed-off-by: Francesco Giancane &lt;<a href=3D"mailto:francescogiancane8@=
gmail.com" target=3D"_blank">francescogiancane8@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/libepox<wbr>y/<a href=3D"http://libepoxy_1.5.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a> | 24 +++++++=
+++++++++++++++++<br>
=C2=A01 file changed, 24 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/libepoxy<wbr>/<a href=3D"htt=
p://libepoxy_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.=
bb</a><br>
<br>
diff --git a/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy=
_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a> b/met=
a/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a><br>
new file mode 100644<br>
index 0000000000..d7702cfd64<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1.5.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a><br>
@@ -0,0 +1,24 @@<br>
+SUMMARY =3D &quot;OpenGL function pointer management library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/anholt/libepoxy/" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/anholt/lib<wbr>epoxy/</a>&=
quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D58ef4c80d4<wbr>01e07bd9ee8=
b6b58cf464b&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/anholt/$%7BBPN%7D/releases=
/download/$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/anholt/${B<wbr>PN}/releases/download/${PV}/${<wbr>BP}.ta=
r.xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI[md5sum] =3D &quot;63fe3847789258254dcd7e3fdb9e7<wbr>f5e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4c94995398a6ebf691600dda2e968<wbr>5a0cac26141=
4175c2adf4645cdfab4<wbr>2a5d5&quot;<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/anholt/libepoxy=
/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/anholt/l=
ib<wbr>epoxy/releases</a>&quot;<br>
+<br>
+inherit meson pkgconfig distro_features_check<br>
+<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
+<br>
+DEPENDS =3D &quot;util-macros&quot;<br>
+<br>
+PACKAGECONFIG[egl] =3D &quot;-Denable-egl=3Dyes, -Denable-egl=3Dno, virtua=
l/egl&quot;<br>
+PACKAGECONFIG[x11] =3D &quot;-Denable-glx=3Dyes, -Denable-glx=3Dno, virtua=
l/libx11 virtual/libgl&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FE<wbr>ATURES&#39=
;, &#39;x11&#39;, d)} egl&quot;<br>
+<br>
+EXTRA_OEMESON_append_libc-mus<wbr>l =3D &quot; -Dhas-dlvsym=3Dfalse &quot;=
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888"><span class=3D"m=
_4835065452750070574HOEnZb"><font color=3D"#888888">--<br>
2.14.3<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><br></div>
</blockquote></div><br></div></div>

--f403045f1f8ae2affc05664c0a3f--

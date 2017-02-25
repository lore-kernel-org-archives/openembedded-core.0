Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id D0A5672F3F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 17:30:51 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id s186so7825868qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 09:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=86KpwaUUinrOo7VJ8HS1ttsy3uxa0WhC4WJ4XZwOmbk=;
	b=YfcWUNY7Xz31r2P2XsQE1aDE4N4Ri0DGfWeP3LVrTuLmxTeU4v655S3Ds1oYv8Dmc6
	vVr8R/T5dc+Gxj+chAKfNXqkWK56SO4vD9sLDPGzG6vjy2layGfvMoRAGjrQ6I4k5i2s
	va02V9RCSFJhkDN6RhP/CjzQrSfChn0ISsufYIw1YNHopNgPh4RMHVG8AujyOF7xF1wD
	mZH7hvsyYWH5BXsonq93FOtCUmILJQc9xUIJP0nAPa7JVaaMynEq5BPDP0aQX45oaVvx
	jXXFa/t8TaBQ9dxz227umT1dPawCILDff0ZP68lGzMja+BfdVOGkvvcpwGH8sxupSpth
	O+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=86KpwaUUinrOo7VJ8HS1ttsy3uxa0WhC4WJ4XZwOmbk=;
	b=n/GPdhX+Btg+zmt1LfOBW8Gm7zozLRP4aBgWRT79ibvXAgKPxfUdrU3BPhhWIC4tL8
	qZbeBbQjWmRP3hDgxlvAd2+V/WEL8gM7q8Z81QkRGhaWyUMPug3KIklIqwgV6hUFKFcS
	4fmSHHXWcLmzqM5ytih0ZJxRCuCRTpEXWpyAKoR/G1JzytG9Fpxy/Unl+5HvsRhtduaS
	ws904D4yYDvk7noFf6zGubBbFcuyVsWuz/u+H7wfRpncpVfCBbn1gAX6FWC5QkdVuI+F
	9shuk0L64vmfR1mrI3sfvANJ5BY0VBv/4r6iSepc4LpxoaUGj18Vl+UfvJMRyV4uTUSB
	/ttA==
X-Gm-Message-State: AMke39nLxKzbiDDPBtxxZSzAuYkfP/FGeJ/6nt36xKm+Pm0RkDZqDwt9OoM67YcqpbNDxNJML6bxVffwxEHuDA==
X-Received: by 10.237.40.39 with SMTP id r36mr9063253qtd.282.1488043852721;
	Sat, 25 Feb 2017 09:30:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.132.68 with HTTP; Sat, 25 Feb 2017 09:30:52 -0800 (PST)
In-Reply-To: <1484089620-19725-4-git-send-email-nathan_lynch@mentor.com>
References: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
	<1484089620-19725-4-git-send-email-nathan_lynch@mentor.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 25 Feb 2017 12:30:52 -0500
Message-ID: <CADkTA4NZCsXM9eE4PyQmdsLa4sDdqawirzisZQmzw-mHZV63Qw@mail.gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] lttng-modules: upgrade to 2.9.0
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
X-List-Received-Date: Sat, 25 Feb 2017 17:30:52 -0000
Content-Type: multipart/alternative; boundary=001a11487ff440737105495e35f8

--001a11487ff440737105495e35f8
Content-Type: text/plain; charset=UTF-8

Following up on this old patch .. since it causing a problem with my
introduction of
the 4.10 kernel.

I'm going to have to switch back to the git fetching of lttng to easily
pull in the latest
changes to adapt to the 4.10 kernel.

lttng just doesn't release often enough for bleeding edge kernels, and
while maintaining
a set of patches on top of the released version is possible .. I don't see
the point.

I missed the discussion on this one when it first came out, so I missed the
reason that
we switched away from git to the release tarballs ?

I also didn't find it in my archived email, so before I go ahead and make a
_git variant of
the recipe again I wanted to check in and make sure that I'm not going to
break a
workflow or undo something that was being fixed.

Cheers,

Bruce


On Tue, Jan 10, 2017 at 6:06 PM, Nathan Lynch <nathan_lynch@mentor.com>
wrote:

> Switch to using release tarballs.
>
> Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
> ---
>  .../lttng/{lttng-modules_git.bb => lttng-modules_2.9.0.bb}     | 10
> ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-modules_git.bb =>
> lttng-modules_2.9.0.bb} (84%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb
> b/meta/recipes-kernel/lttng/lttng-modules_2.9.0.bb
> similarity index 84%
> rename from meta/recipes-kernel/lttng/lttng-modules_git.bb
> rename to meta/recipes-kernel/lttng/lttng-modules_2.9.0.bb
> index 8a287131d06d..e59d6bc1379c 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.9.0.bb
> @@ -8,20 +8,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> 362844633a08753bd96ab322a6c7f9f6 \
>
>  inherit module
>
> -SRCREV = "6e4fc6f36d68fb3c8d40113f8670eb6e9c8ffd76"
> -PV = "2.8.0+git${SRCPV}"
> -
>  COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
>
> -SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.8 \
> +SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-
> en.patch"
>
> +SRC_URI[md5sum] = "717df375ccb6f32bb297cc2f2e692bbf"
> +SRC_URI[sha256sum] = "af914e5954081cfb6bd4c6dcf93904
> 74e0c13fe056b12b3dfc86d1b88b8340a0"
> +
>  export INSTALL_MOD_DIR="kernel/lttng-modules"
>
>  EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"
>
> -S = "${WORKDIR}/git"
> -
>  do_install_append() {
>         # Delete empty directories to avoid QA failures if no modules were
> built
>         find ${D}/lib -depth -type d -empty -exec rmdir {} \;
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11487ff440737105495e35f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Following up on this old patch .. since it causing a probl=
em with my introduction of<div>the 4.10 kernel.</div><div><br></div><div>I&=
#39;m going to have to switch back to the git fetching of lttng to easily p=
ull in the latest</div><div>changes to adapt to the 4.10 kernel.=C2=A0</div=
><div><br></div><div>lttng just doesn&#39;t release often enough for bleedi=
ng edge kernels, and while maintaining</div><div>a set of patches on top of=
 the released version is possible .. I don&#39;t see the point.</div><div><=
br></div><div>I missed the discussion on this one when it first came out, s=
o I missed the reason that</div><div>we switched away from git to the relea=
se tarballs ?=C2=A0</div><div><br></div><div>I also didn&#39;t find it in m=
y archived email, so before I go ahead and make a _git variant of</div><div=
>the recipe again I wanted to check in and make sure that I&#39;m not going=
 to break a</div><div>workflow or undo something that was being fixed.</div=
><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div><br><=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue=
, Jan 10, 2017 at 6:06 PM, Nathan Lynch <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:nathan_lynch@mentor.com" target=3D"_blank">nathan_lynch@mentor.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Switch to using releas=
e tarballs.<br>
<br>
Signed-off-by: Nathan Lynch &lt;<a href=3D"mailto:nathan_lynch@mentor.com">=
nathan_lynch@mentor.com</a>&gt;<br>
---<br>
=C2=A0.../lttng/{<a href=3D"http://lttng-modules_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">lttng-modules_git.<wbr>bb</a> =3D&gt; <a href=3D"http://=
lttng-modules_2.9.0.bb" rel=3D"noreferrer" target=3D"_blank">lttng-modules_=
2.9.0.bb</a>}=C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
=C2=A01 file changed, 4 insertions(+), 6 deletions(-)<br>
=C2=A0rename meta/recipes-kernel/lttng/{<a href=3D"http://lttng-modules_git=
.bb" rel=3D"noreferrer" target=3D"_blank">ltt<wbr>ng-modules_git.bb</a> =3D=
&gt; <a href=3D"http://lttng-modules_2.9.0.bb" rel=3D"noreferrer" target=3D=
"_blank">lttng-modules_2.9.0.bb</a>} (84%)<br>
<br>
diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_git.=
bb" rel=3D"noreferrer" target=3D"_blank">lt<wbr>tng-modules_git.bb</a> b/me=
ta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.9.0.bb" rel=3D"no=
referrer" target=3D"_blank">lt<wbr>tng-modules_2.9.0.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_git.b=
b" rel=3D"noreferrer" target=3D"_blank">lttn<wbr>g-modules_git.bb</a><br>
rename to meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.9.0.b=
b" rel=3D"noreferrer" target=3D"_blank">lttn<wbr>g-modules_2.9.0.bb</a><br>
index 8a287131d06d..e59d6bc1379c 100644<br>
--- a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_git.bb" rel=
=3D"noreferrer" target=3D"_blank">lt<wbr>tng-modules_git.bb</a><br>
+++ b/meta/recipes-kernel/lttng/<a href=3D"http://lttng-modules_2.9.0.bb" r=
el=3D"noreferrer" target=3D"_blank">lt<wbr>tng-modules_2.9.0.bb</a><br>
@@ -8,20 +8,18 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>3628=
44633a08753bd96ab322a6c7f9<wbr>f6 \<br>
<br>
=C2=A0inherit module<br>
<br>
-SRCREV =3D &quot;<wbr>6e4fc6f36d68fb3c8d40113f8670eb<wbr>6e9c8ffd76&quot;<=
br>
-PV =3D &quot;2.8.0+git${SRCPV}&quot;<br>
-<br>
=C2=A0COMPATIBLE_HOST =3D &#39;(x86_64|i.86|powerpc|aarch64|<wbr>mips|nios2=
|arm).*-linux&#39;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.org/lttng-modules.git;=
branch=3Dstable-2.8" rel=3D"noreferrer" target=3D"_blank">git.lttng.org/ltt=
ng-<wbr>modules.git;branch=3Dstable-2.8</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://lttng.org/files/${BPN}/${BPN}-${PV}.t=
ar.bz2" rel=3D"noreferrer" target=3D"_blank">https://lttng.org/files/${<wbr=
>BPN}/${BPN}-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile-Do-not-fail-<wbr>=
if-CONFIG_TRACEPOINTS-is-not-<wbr>en.patch&quot;<br>
<br>
+SRC_URI[md5sum] =3D &quot;<wbr>717df375ccb6f32bb297cc2f2e692b<wbr>bf&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>af914e5954081cfb6bd4c6dcf93904<wbr>74e0c=
13fe056b12b3dfc86d1b88b83<wbr>40a0&quot;<br>
+<br>
=C2=A0export INSTALL_MOD_DIR=3D&quot;kernel/lttng-<wbr>modules&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;KERNELDIR=3D&#39;${STAGING_KERNEL_<wbr>DIR}&#=
39;&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Delete empty directories to avoid QA failures=
 if no modules were built<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 find ${D}/lib -depth -type d -empty -exec rmdir=
 {} \;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a11487ff440737105495e35f8--

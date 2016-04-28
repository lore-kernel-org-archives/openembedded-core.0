Return-Path: <kad@kad.name>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB2270018
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 22:07:55 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id u185so105410140iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 15:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2bq1IyuPhXA/sZeTIATETiqjdpWeqrWQjllPSfkeJ2M=;
	b=ahuSt5DwTcWFVLfvG1dP2KGMvN/rwdE+DA73g8oOK15nw+SovwokkJWhVnuyCKoTM7
	A8e8rQMwm9GW+iHY+LLd+ENvjsQPz9rMEX0ed/15cpJsoMn/lavJf/guot4fxKC5Y9it
	douKS3k2L7n0u2vk+Pn33CGxv5F9W+v5iMRFI0nrE9wjGndM52dsG7c6Ja8gaSdmJYv0
	9mhEps001Jd/lf+ZUzwRz5dGtzFJ6jBwB28Ox2A2/3odNNVZ8CaU3jCEVCidhZinturs
	xfDvzOmZeBNHPQFGNqXBveC5i2fRgXYeOxf91SZWdB2ZfLMT9N03XMsImlyTDc5Uq+Qf
	gtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2bq1IyuPhXA/sZeTIATETiqjdpWeqrWQjllPSfkeJ2M=;
	b=UzcORYcsKhyrV94JagRiU7moKmkeEn5qYl5GV2y6kd3ColtvbaS9KHV9+hBwUDjm5E
	bJ79bpBdK6L+pMq0VW1ESGLC6ewJ7l6snMDRWcEVRbDwZwUuGOqpoXLDc2ari5mu78bL
	t6ztx290Wh7LeZ4/192KReqf36lf91gsifn/wj+gHUxcnuiPKZMiH5SQHsRPhF2dxjaV
	+b3GEQ99bTYjBx0hZrf0Ma2tpkJP0ymi4+sDoR+N6f92cqROcC5UHo/EWOQCdqfJHbXf
	n9TbHCDk51GOOxzf3epp3LI0/AT+egImqZ250pYi/dmc7Vjc9tbyIufzfZDj7EpC2MA/
	1Z3w==
X-Gm-Message-State: AOPr4FVGT3WITWBw5GVfILnbBXJ9RmwhqGMi3zRxOXiKhf4K7uH9rMdVdCwlrl8xHyA0tYwqqqpJ+RfAqTb7nQ==
MIME-Version: 1.0
X-Received: by 10.107.8.19 with SMTP id 19mr21402554ioi.60.1461881276492; Thu,
	28 Apr 2016 15:07:56 -0700 (PDT)
Received: by 10.107.35.137 with HTTP; Thu, 28 Apr 2016 15:07:56 -0700 (PDT)
In-Reply-To: <c32880f5e89776d3515079d6c8ebe86111cb10ed.1461749328.git.ed.bartosh@linux.intel.com>
References: <cover.1461749328.git.ed.bartosh@linux.intel.com>
	<c32880f5e89776d3515079d6c8ebe86111cb10ed.1461749328.git.ed.bartosh@linux.intel.com>
Date: Fri, 29 Apr 2016 01:07:56 +0300
Message-ID: <CANFkWpnEAFoBRf=oAnKLUasuVhxDgoYswk_o0s3HFT-4W8yiMw@mail.gmail.com>
From: Alexander Kanevskiy <kad@kad.name>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] bmap-tools: initial commit, version 3.2
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
X-List-Received-Date: Thu, 28 Apr 2016 22:07:57 -0000
Content-Type: multipart/alternative; boundary=001a113eae10308d09053192c2a2

--001a113eae10308d09053192c2a2
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 27, 2016 at 12:36 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> Bmap-tools - tools to generate block map (AKA bmap) and flash images
> using bmap. Bmaptool is a generic tool for creating the block map
> (bmap) for a file and copying files using the block map.
>
> The idea is that large file containing unused blocks, like raw system
> image files, can be copied or flashed a lot faster with bmaptool than
> with traditional tools like "dd" or "cp".
>
> [YOCTO #9414]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 24
> +++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
>
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> new file mode 100644
> index 0000000..e10f5fd
> --- /dev/null
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Tools to generate block map (AKA bmap) and flash images using
> bmap"
> +DESCRIPTION = "Bmap-tools - tools to generate block map (AKA bmap) and
> flash images using \
> +bmap. Bmaptool is a generic tool for creating the block map (bmap) for a
> file, \
> +and copying files using the block map. The idea is that large file
> containing \
> +unused blocks, like raw system image files, can be copied or flashed a
> lot \
> +faster with bmaptool than with traditional tools like "dd" or "cp"."
> +HOMEPAGE = "http://git.infradead.org/users/dedekind/bmap-tools.git"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "ftp://ftp.infradead.org/pub/${BPN}/${BPN}-${PV}.tgz"
> +SRC_URI[md5sum] = "92cdad1cb4dfa0cca7176c8e22752616"
> +SRC_URI[sha256sum] =
> "cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02bf2d434"
> +
> +RDEPENDS_${PN} = "python-core python-compression"
> +
> +inherit setuptools
> +
> +BBCLASSEXTEND = "native"
> +
> +do_install_append_class-native() {
> +    sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|'
> ${D}${bindir}/bmaptool
> +}
>

better to use recipe that would create in deploy/tools standalone version
of the tool.
Otherwise, there is no easy way for user to utilize generated bmap files.

--
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
br, Alexander Kanevskiy

--001a113eae10308d09053192c2a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Apr 27, 2016 at 12:36 PM, Ed Bartosh <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Bmap-to=
ols - tools to generate block map (AKA bmap) and flash images<br>
using bmap. Bmaptool is a generic tool for creating the block map<br>
(bmap) for a file and copying files using the block map.<br>
<br>
The idea is that large file containing unused blocks, like raw system<br>
image files, can be copied or flashed a lot faster with bmaptool than<br>
with traditional tools like &quot;dd&quot; or &quot;cp&quot;.<br>
<br>
[YOCTO #9414]<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.2.bb" =
rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.2.bb</a> | 24 +++++++++++=
++++++++++++<br>
=C2=A01 file changed, 24 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/bmap-tools/<a href=3D"http://=
bmap-tools_3.2.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.2.bb</=
a><br>
<br>
diff --git a/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3=
.2.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.2.bb</a> b/meta/re=
cipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">bmap-tools_3.2.bb</a><br>
new file mode 100644<br>
index 0000000..e10f5fd<br>
--- /dev/null<br>
+++ b/meta/recipes-support/bmap-tools/<a href=3D"http://bmap-tools_3.2.bb" =
rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.2.bb</a><br>
@@ -0,0 +1,24 @@<br>
+SUMMARY =3D &quot;Tools to generate block map (AKA bmap) and flash images =
using bmap&quot;<br>
+DESCRIPTION =3D &quot;Bmap-tools - tools to generate block map (AKA bmap) =
and flash images using \<br>
+bmap. Bmaptool is a generic tool for creating the block map (bmap) for a f=
ile, \<br>
+and copying files using the block map. The idea is that large file contain=
ing \<br>
+unused blocks, like raw system image files, can be copied or flashed a lot=
 \<br>
+faster with bmaptool than with traditional tools like &quot;dd&quot; or &q=
uot;cp&quot;.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://git.infradead.org/users/dedekind/bmap=
-tools.git" rel=3D"noreferrer" target=3D"_blank">http://git.infradead.org/u=
sers/dedekind/bmap-tools.git</a>&quot;<br>
+SECTION =3D &quot;console/utils&quot;<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"ftp://ftp.infradead.org/pub/${BPN}/${BPN}-${P=
V}.tgz" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.infradead.org/pub/${=
BPN}/${BPN}-${PV}.tgz</a>&quot;<br>
+SRC_URI[md5sum] =3D &quot;92cdad1cb4dfa0cca7176c8e22752616&quot;<br>
+SRC_URI[sha256sum] =3D &quot;cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f38=
03c308efab02bf2d434&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;python-core python-compression&quot;<br>
+<br>
+inherit setuptools<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+do_install_append_class-native() {<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s|^#!.*/usr/bin/env python|#! /usr/bin/env na=
tivepython|&#39; ${D}${bindir}/bmaptool<br>
+}<br></blockquote><div><br></div><div>better to use recipe that would crea=
te in deploy/tools standalone version of the tool.=C2=A0</div><div>Otherwis=
e, there is no easy way for user to utilize generated bmap files.</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">br, Alexander Kanevskiy</div>
</div></div>

--001a113eae10308d09053192c2a2--

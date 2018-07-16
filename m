Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 390C578869
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 21:20:34 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id s17-v6so1381363vke.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 14:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=52YXjueGH082rI1o8a8IGc8ERBeRhfgx88or9QiITYw=;
	b=i7Qy+3SCxTsZ/vZicdicVKYiaeo1b+c7J5oLT/riIp4rHtrxlKqPuI72Ez9hHD8EKE
	JbqkEId61ioajQJAWJ+7Cz9coiAGNpV4ZptAg6/25x4qanm3E/pMehvSfuu/UD4L9TSD
	+soaFB1lFMQRFAz8gTyJvLgM7O4dMOh03sVkuKy8Lh8/JifTTNhx5iGgNwb6JiVDjCmr
	K9k9L/0zkVeM2Jq+TJwN52dsTS9BSeVkbep6IPAAo17wcjVqc3EqnB3dwkx0pHz8SNUY
	efZgUiYt7sPmqO6yP3CaCDA4t/T3j/aNGPUCq2LrnrtKrEwCxmXveNfXZ8DZ0165w1Kj
	CvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=52YXjueGH082rI1o8a8IGc8ERBeRhfgx88or9QiITYw=;
	b=r/uY7gKoXwuUU8Up8WxiDT1HOSJfCQzMszMJ0QVB06WwCy77UgVluRMb8grFlDK09f
	iyii+WpQwbLRu+dEh3ggDi8r6BBftFRRwBiuLAk4RCLlV5W0CjveHSk5vUrDWT0KoZ16
	Qnn/OyzzOR0T7Nm9A0Z5rgEX9WUV9OwMa2zmDJW7hn5WPaHo/3jtClqUmba0SwT6btG1
	0S82la5FoaV/l4C+P97PgCbAdAl7BY0psh2fu4coydacfZSJCwrOG7ubRhoRCjF1kdbM
	hDx2wpEmug4buf0jdfnGTWShzWW0Sh8L8rCmUAsmM7MgP+z0ZID1oCd7ElwRhz2ENhgW
	/eyA==
X-Gm-Message-State: AOUpUlGhAf8jS8e1kxxH1Wnk97d7wSRBRrssjW8EVHs3Hlj5AQv9nmQD
	uQdssJMZd5d/J/bBJ9z6IUSoJ7jktWtevUcywas=
X-Google-Smtp-Source: AAOMgpfk/U3IuUv3amXzjh7ULST2iO3AVod4NtywgvW78p15DDSVtg0wcZkgbjTKpPamXVvZDiNlrmXtXLQwl4v6BS4=
X-Received: by 2002:a1f:1584:: with SMTP id
	126-v6mr1403471vkv.146.1531776034939; 
	Mon, 16 Jul 2018 14:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180716210731.22173-1-alistair.francis@wdc.com>
In-Reply-To: <20180716210731.22173-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Jul 2018 14:20:23 -0700
Message-ID: <CAMKF1sprbtHUg7AB7dAZYWcoBBBNT6=v_Dz0dhAtu8Vem1WDgQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ndctl: Add the NDCTL package
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
X-List-Received-Date: Mon, 16 Jul 2018 21:20:35 -0000
Content-Type: multipart/alternative; boundary="00000000000070298705712466de"

--00000000000070298705712466de
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 2:07 PM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Add the NDCTL package (the libnvdimm utility library). This is based
> on the work from the meta-luv layer with a version bump.
>

I am not sure if it is a core candidate as yet
We can accept it into meta-oe and if it get useful for multiple
architectures later we can propose it into oe-core


> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-core/ndctl/ndctl_git.bb | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta/recipes-core/ndctl/ndctl_git.bb
>
> diff --git a/meta/recipes-core/ndctl/ndctl_git.bb
> b/meta/recipes-core/ndctl/ndctl_git.bb
> new file mode 100644
> index 0000000000..3bf54e74bf
> --- /dev/null
> +++ b/meta/recipes-core/ndctl/ndctl_git.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "libnvdimm utility library"
> +DESCRIPTION = "Utility library for managing the libnvdimm \
> +(non-volatile memory device) sub-system in the Linux kernel. \
> +The LIBNVDIMM subsystem provides support for three types of \
> +NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
> +simultaneously support both PMEM and BLK mode access."
> +HOMEPAGE = "
> https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next
> "
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
> +
> +inherit autotools-brokensep pkgconfig module-base
> +
> +SRCREV = "0d6aeeabec9d271e08c12e4cf679b59946e20156"
> +SRC_URI = "git://github.com/pmem/ndctl.git"
> +
> +DEPENDS = "virtual/kernel kmod udev json-c"
> +
> +PV = "v61+git${SRCPV}"
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
> +
> +do_configure_prepend() {
> +    ${S}/autogen.sh
> +}
> +
> +do_install_append() {
> +        install -d ${D}${bindir}
> +        install -m 755 ${WORKDIR}/ndctl_runner ${D}${bindir}
> +}
> +
> +COMPATIBLE_HOST='(x86_64).*'
> +
> +FILES_${PN} += "/usr/share/bash-completion/completions/ndctl"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000070298705712466de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon,=
 Jul 16, 2018 at 2:07 PM Alistair Francis &lt;<a href=3D"mailto:alistair.fr=
ancis@wdc.com">alistair.francis@wdc.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Add the NDCTL package (the libnvdimm utility library). =
This is based<br>
on the work from the meta-luv layer with a version bump.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I am not sure if=
 it is a core candidate as yet=C2=A0</div><div dir=3D"auto">We can accept i=
t into meta-oe and if it get useful for multiple architectures later we can=
 propose it into oe-core</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/ndctl/<a href=3D"http://ndctl_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">ndctl_git.bb</a> | 34 ++++++++++++++++++++++++++++<=
br>
=C2=A01 file changed, 34 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/ndctl/<a href=3D"http://ndctl_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">ndctl_git.bb</a><br>
<br>
diff --git a/meta/recipes-core/ndctl/<a href=3D"http://ndctl_git.bb" rel=3D=
"noreferrer" target=3D"_blank">ndctl_git.bb</a> b/meta/recipes-core/ndctl/<=
a href=3D"http://ndctl_git.bb" rel=3D"noreferrer" target=3D"_blank">ndctl_g=
it.bb</a><br>
new file mode 100644<br>
index 0000000000..3bf54e74bf<br>
--- /dev/null<br>
+++ b/meta/recipes-core/ndctl/<a href=3D"http://ndctl_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">ndctl_git.bb</a><br>
@@ -0,0 +1,34 @@<br>
+SUMMARY =3D &quot;libnvdimm utility library&quot;<br>
+DESCRIPTION =3D &quot;Utility library for managing the libnvdimm \<br>
+(non-volatile memory device) sub-system in the Linux kernel. \<br>
+The LIBNVDIMM subsystem provides support for three types of \<br>
+NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \<br>
+simultaneously support both PMEM and BLK mode access.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://git.kernel.org/cgit/linux/kernel/git=
/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=3Dlibnvdimm-for-n=
ext" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/cgit/linux=
/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=3Dlibn=
vdimm-for-next</a>&quot;<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De66651809cac5da60c8b80e9e4=
e79e08&quot;<br>
+<br>
+inherit autotools-brokensep pkgconfig module-base<br>
+<br>
+SRCREV =3D &quot;0d6aeeabec9d271e08c12e4cf679b59946e20156&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/pmem/ndctl.git" rel=
=3D"noreferrer" target=3D"_blank">github.com/pmem/ndctl.git</a>&quot;<br>
+<br>
+DEPENDS =3D &quot;virtual/kernel kmod udev json-c&quot;<br>
+<br>
+PV =3D &quot;v61+git${SRCPV}&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+EXTRA_OECONF +=3D &quot;--enable-test --enable-destructive --disable-docs&=
quot;<br>
+<br>
+do_configure_prepend() {<br>
+=C2=A0 =C2=A0 ${S}/autogen.sh<br>
+}<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 ${WORKDIR}/ndctl_runner ${D}${b=
indir}<br>
+}<br>
+<br>
+COMPATIBLE_HOST=3D&#39;(x86_64).*&#39;<br>
+<br>
+FILES_${PN} +=3D &quot;/usr/share/bash-completion/completions/ndctl&quot;<=
br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000070298705712466de--

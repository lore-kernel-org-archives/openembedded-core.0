Return-Path: <mikko.ylinen@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id EE75D70016
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 12:52:24 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id k15so16550127qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 04:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DzOjOhSIw+og1x0TsZD8Vl81XzcvdMLdZ0wC60xY1Lk=;
	b=jDVkA8jzlEsJ5UZhwv0f4StcNI3/1kOUTh6ftOwS4vd+fO/ReD1CS59wfQLIjiXsRL
	T2C6/u1JiL83yPOzi63SHVPWi0+HOgzWUrN0XHlB/MGJul0o9Eto0H02fIBulQJe14ny
	FxhxjZxvE1TkBHUcjCdOAeOX9K6u5z0r5o2hXCzDaPNSidr+Io7yy7g4+1FT9RBeq5LM
	UMMdFtiiaRTwalKh/4gYyKPqV6ULsbW9fj3+X4WVzqRAA6LLFbWV747q8sNspXKxphXq
	6EBAKLRdm8qQyDfc3TySfXhAxHm6pwagVoIr9lrE9udWTrjaOhusNqVhCD9VBM+O0Zi2
	iySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DzOjOhSIw+og1x0TsZD8Vl81XzcvdMLdZ0wC60xY1Lk=;
	b=T6zaI82L6Pq78I1HUKKIBZjBHo0sFuw1MEoXzwEYvq5CXvHP0P5zVUlFYXOFfvY7K5
	fregZjeUz0l8B/zInFFg8BpTAd6edpCzhd1dUOuYdt51VcVTDxnbTdM2xm6xN36k5Bjo
	hkCFALMgndlY2D/I7AH3QdyP8zQiyyq8WyfVq/FcI4DN/xYiQXcwfmnt6TfqFkP095Nj
	+ap6hKorE9fOXvs94KepOFfpsNrNa2vl6tE2a5gvC9x+cgmTPl+t4MVKn9Q21A1WlSPB
	hyhH+EhPXogMNdq2f+PPHcpc2gU9j2fk85V2CEVUCr5xsUfic6PwM43CoeovRNAUM365
	2MUQ==
X-Gm-Message-State: AIkVDXLqV0U0JHG2HFNH8qpYL+ZktRRIxnhTWk5ueV+4aXcVjeQ6VQOYzpbGqE7xWQp2LJm4cE6PJOg+xCqA7BVc
X-Received: by 10.237.34.239 with SMTP id q44mr11989616qtc.18.1484225545200;
	Thu, 12 Jan 2017 04:52:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.173.200 with HTTP; Thu, 12 Jan 2017 04:52:24 -0800 (PST)
In-Reply-To: <aff775fa6d3760d628b28276840a306f906347a6.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
	<aff775fa6d3760d628b28276840a306f906347a6.1484164023.git.alejandro.hernandez@linux.intel.com>
From: "Ylinen, Mikko" <mikko.ylinen@intel.com>
Date: Thu, 12 Jan 2017 14:52:24 +0200
Message-ID: <CAHZ0fbEWJcA_rhrgSiKOaU01cN6wVr=r5UsJq6oqpo6WARB_4A@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/7] image-live-artifacts: Add support for creating image artifacts only
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
X-List-Received-Date: Thu, 12 Jan 2017 12:52:26 -0000
Content-Type: multipart/alternative; boundary=001a113e7aee639fa10545e530a8

--001a113e7aee639fa10545e530a8
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 11, 2017 at 9:55 PM, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>
> Rather than create an actual image, just put the image artifacts in an
> 'artifacts' directory that can then be picked up by wic.
>
>
This is a desired goal now that wic is more widely used. However, any
particular
reason why the implementation talks about "live" and copies what the live
image
do_bootimg gives?


> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> ---
>  meta/classes/image-live-artifacts.bbclass | 40
> +++++++++++++++++++++++++++++++
>  meta/classes/image.bbclass                |  3 +++
>  meta/classes/image_types.bbclass          |  2 ++
>  3 files changed, 45 insertions(+)
>  create mode 100644 meta/classes/image-live-artifacts.bbclass
>
> diff --git a/meta/classes/image-live-artifacts.bbclass
> b/meta/classes/image-live-artifacts.bbclass
> new file mode 100644
> index 0000000..1501a9b
> --- /dev/null
> +++ b/meta/classes/image-live-artifacts.bbclass
> @@ -0,0 +1,40 @@
> +# Create the artifacts only on an ARTIFACTS_DIR,
> +# which can be later picked up by wic
> +
> +inherit live-vm-common
> +
> +do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
>

perhaps have 'do_image_artifacts' and let users/other classes set
additional dependencies.


> +                        mtools-native:do_populate_sysroot \
> +                        cdrtools-native:do_populate_sysroot \
> +                        virtual/kernel:do_deploy \
> +                        ${MLPREFIX}syslinux:do_populate_sysroot \
> +                        syslinux-native:do_populate_sysroot \
>

For example, if I use systemd-boot I don't need syslinux built at all. The
EFI_CLASS/PCBIOS_CLASS
could define the additional depends here (like they are currently doing for
bootimg/bootdirectdisk).

The defaults should be just kernel and initrd(s) (if defined).


> +                        ${@oe.utils.ifelse(d.getVar('COMPRESSISO',
> False),'zisofs-tools-native:do_populate_sysroot','')} \
> +                        "
> +
> +
> +LABELS_LIVE ?= "boot install"
> +
> +ARTIFACTS_DIR = "${DEPLOY_DIR_IMAGE}/artifacts"
> +
> +populate_bootloader() {
> +       populate_kernel ${ARTIFACTS_DIR}
> +
> +       if [ "${PCBIOS}" = "1" ]; then
> +               syslinux_hddimg_populate ${ARTIFACTS_DIR}
> +       fi
> +       if [ "${EFI}" = "1" ]; then
> +               efi_hddimg_populate ${ARTIFACTS_DIR}
> +       fi
> +}
> +
> +python do_bootimg() {
> +    set_live_vm_vars(d, 'LIVE')
> +    if d.getVar("PCBIOS", True) == "1":
> +        bb.build.exec_func('build_syslinux_cfg', d)
> +    if d.getVar("EFI", True) == "1":
> +        bb.build.exec_func('build_efi_cfg', d)
> +    bb.build.exec_func('populate_bootloader', d)
> +}
> +
> +addtask bootimg before do_image_complete
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 04fd5f9..fd249c8 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -130,6 +130,9 @@ do_rootfs[vardeps] += "${@rootfs_variables(d)}"
>  do_build[depends] += "virtual/kernel:do_deploy"
>
>  def build_live(d):
> +    if bb.utils.contains("IMAGE_FSTYPES", "live-artifacts-only",
> "live-artifacts-only", "0", d) == "live-artifacts-only":
> +         return "image-live-artifacts"
>

Is there a need for the image artifacts for other than wic? It could be
made so that if wic is in IMAGE_FSTYPES,
image-artifacts are built by default. This means the logic of inheriting
image-artifacts has a better place, e.g.,
in it's own build_wic() check.

-- Mikko

--001a113e7aee639fa10545e530a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jan 11, 2017 at 9:55 PM, Alejandro Hernandez <span dir=3D"ltr">=
&lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank=
">alejandro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">From: Tom Zanussi &lt;<a href=3D"mailto:tom.zanussi@linu=
x.intel.com">tom.zanussi@linux.intel.com</a>&gt;<br>
<br>
Rather than create an actual image, just put the image artifacts in an<br>
&#39;artifacts&#39; directory that can then be picked up by wic.<br>
<br></blockquote><div><br></div><div>This is a desired goal now that wic is=
 more widely used. However, any particular</div><div>reason why the impleme=
ntation talks about &quot;live&quot; and copies what the live image</div><d=
iv>do_bootimg gives?=C2=A0</div><div>=C2=A0<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.hernande=
z@linux.intel.com">alejandro.hernandez@linux.<wbr>intel.com</a>&gt;<br>
Signed-off-by: Tom Zanussi &lt;<a href=3D"mailto:tom.zanussi@linux.intel.co=
m">tom.zanussi@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image-live-<wbr>artifacts.bbclass | 40 +++++++++++++++++=
+++++++++++++<wbr>+<br>
=C2=A0meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 +++<br>
=C2=A0meta/classes/image_types.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 ++<br>
=C2=A03 files changed, 45 insertions(+)<br>
=C2=A0create mode 100644 meta/classes/image-live-<wbr>artifacts.bbclass<br>
<br>
diff --git a/meta/classes/image-live-<wbr>artifacts.bbclass b/meta/classes/=
image-live-<wbr>artifacts.bbclass<br>
new file mode 100644<br>
index 0000000..1501a9b<br>
--- /dev/null<br>
+++ b/meta/classes/image-live-<wbr>artifacts.bbclass<br>
@@ -0,0 +1,40 @@<br>
+# Create the artifacts only on an ARTIFACTS_DIR,<br>
+# which can be later picked up by wic<br>
+<br>
+inherit live-vm-common<br>
+<br>
+do_bootimg[depends] +=3D &quot;dosfstools-native:do_<wbr>populate_sysroot =
\<br></blockquote><div><br></div><div>perhaps have &#39;do_image_artifacts&=
#39; and let users/other classes set additional dependencies.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mtools-native:do_populate_<wbr>sysroot \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cdrtools-native:do_populate_<wbr>sysroot \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 virtual/kernel:do_deploy \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${MLPREFIX}syslinux:do_<wbr>populate_sysroot \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 syslinux-native:do_populate_<wbr>sysroot \<br></blockquote><div>=
<br></div><div>For example, if I use systemd-boot I don&#39;t need syslinux=
 built at all. The EFI_CLASS/PCBIOS_CLASS</div><div>could define the additi=
onal depends here (like they are currently doing for bootimg/bootdirectdisk=
).</div><div><br></div><div>The defaults should be just kernel and initrd(s=
) (if defined).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${@oe.utils.ifelse(d.getVar(&#39;<wbr>COMPRESSISO&#39;, False),&=
#39;zisofs-tools-native:<wbr>do_populate_sysroot&#39;,&#39;&#39;)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;<br>
+<br>
+<br>
+LABELS_LIVE ?=3D &quot;boot install&quot;<br>
+<br>
+ARTIFACTS_DIR =3D &quot;${DEPLOY_DIR_IMAGE}/<wbr>artifacts&quot;<br>
+<br>
+populate_bootloader() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0populate_kernel ${ARTIFACTS_DIR}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${PCBIOS}&quot; =3D &quot;1&quot; ];=
 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syslinux_hddimg_pop=
ulate ${ARTIFACTS_DIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${EFI}&quot; =3D &quot;1&quot; ]; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efi_hddimg_populate=
 ${ARTIFACTS_DIR}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
+python do_bootimg() {<br>
+=C2=A0 =C2=A0 set_live_vm_vars(d, &#39;LIVE&#39;)<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;PCBIOS&quot;, True) =3D=3D &quot;1&quot;:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&#39;build_<wbr>syslinux_cf=
g&#39;, d)<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;EFI&quot;, True) =3D=3D &quot;1&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&#39;build_efi_<wbr>cfg&#39=
;, d)<br>
+=C2=A0 =C2=A0 bb.build.exec_func(&#39;populate_<wbr>bootloader&#39;, d)<br=
>
+}<br>
+<br>
+addtask bootimg before do_image_complete<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 04fd5f9..fd249c8 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -130,6 +130,9 @@ do_rootfs[vardeps] +=3D &quot;${@rootfs_variables(d)}&q=
uot;<br>
=C2=A0do_build[depends] +=3D &quot;virtual/kernel:do_deploy&quot;<br>
<br>
=C2=A0def build_live(d):<br>
+=C2=A0 =C2=A0 if bb.utils.contains(&quot;IMAGE_<wbr>FSTYPES&quot;, &quot;l=
ive-artifacts-only&quot;, &quot;live-artifacts-only&quot;, &quot;0&quot;, d=
) =3D=3D &quot;live-artifacts-only&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;image-live-artifacts&quot;<=
br></blockquote><div><br></div><div>Is there a need for the image artifacts=
 for other than wic? It could be made so that if wic is in IMAGE_FSTYPES,</=
div><div>image-artifacts are built by default. This means the logic of inhe=
riting image-artifacts has a better place, e.g.,</div><div>in it&#39;s own =
build_wic() check.</div><div><br></div><div>-- Mikko</div></div></div></div=
>

--001a113e7aee639fa10545e530a8--

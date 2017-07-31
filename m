Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id AA61878348
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 08:59:47 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id g189so1369576vke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JQ8oANZWFC743gl1i2hGo190iozVbCuV4L3aLD9XgRA=;
	b=EqScWOkdQcxLkh2xlQxpDtnvRDJHJ/T1o3SZbjIPy51V7Vs2tWdO72WuWdMrFTdTbD
	7E88R/jR4dJMJazq3DGtIIdcm6XcazEK92ExF/a4/4BjrOVHYbYcM1+23u/gCAAsCS5J
	SZUThgGtnpuN2EKmCpOdXTlqvGfjDFfBU8tocl/AQjOKnF6S7SjsCSGFB0OVVGe6rgPG
	OYbeZRsXlG5DpZ7Be+EEaBxkdh1hjhtKFRi9eEzK4ofQIn3aung8hQWD1Zkjq5vhM582
	EwfOUwCZ2Y1neGd807PRG1Leu2rEDTUCy4q3X5Z8O99VOFiG78x61gS2D2OTOejKD5Eg
	k1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JQ8oANZWFC743gl1i2hGo190iozVbCuV4L3aLD9XgRA=;
	b=WMIpVisCoG4+hqMNsk0ryevllZM9/htGETYdwJI+o4Ksnuw1y3z6zEhCQIP1VyDABn
	LyPY/NsvefnfNJ8KigGCNfMMq8LYtLSVYX8vL8/+mfsaLUQPxNUlVlFnojM5i/tDhNjs
	vDiRNsNnOEx3DM/6AkpYVV2DcwGpMBWTts+Jti+wHcXuaFqBYEHIsFvZ/mJ4MP/Z8DaC
	yueAzoKEbRnATiRZY4+YVLNzcjj+mrpoJqZoWXf1roCSnygeoG2H008WBfD9f7oxYh8J
	OoDrlZcvW28zL6/u1KDYPlMnYjdKMdSPiAudrdKspEj8EjaLQPsH2AUpLvb34NZf4W1L
	biWQ==
X-Gm-Message-State: AIVw112xHNw65FWZ4YIfcckjsgwRlr8mtpVT6H+lHmZXvrdRzf+kv+5A
	6CHVdgui2wACkFIfynRXh7iTAqRZKA==
X-Received: by 10.31.135.79 with SMTP id j76mr7211241vkd.150.1501491588425;
	Mon, 31 Jul 2017 01:59:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.212 with HTTP; Mon, 31 Jul 2017 01:59:48 -0700 (PDT)
In-Reply-To: <1501491388-15182-1-git-send-email-liu.ming50@gmail.com>
References: <1501491388-15182-1-git-send-email-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 31 Jul 2017 10:59:48 +0200
Message-ID: <CALatG=6TOB7jL3G0X3b7pQe6kmsjmBsZjxWDrmBxZN3qbkBKNQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH V2] meta: drop do_bootdirectdisk do_vmimg references
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
X-List-Received-Date: Mon, 31 Jul 2017 08:59:47 -0000
Content-Type: multipart/alternative; boundary="001a114592e4c2ece2055599409d"

--001a114592e4c2ece2055599409d
Content-Type: text/plain; charset="UTF-8"

Changes in V2:

1 Also drop the reference to image-vm.bbclass.

//Ming Liu

2017-07-31 10:56 GMT+02:00 <liu.ming50@gmail.com>:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> do_bootdirectdisk and do_vmimg had been dropped by commit 929ba563:
> [ image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types ]
>
> Also drop the references to them and image-vm.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/classes/grub-efi.bbclass     | 1 -
>  meta/classes/license.bbclass      | 9 ++-------
>  meta/classes/rm_work.bbclass      | 2 +-
>  meta/classes/systemd-boot.bbclass | 3 +--
>  meta/conf/documentation.conf      | 1 -
>  5 files changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index df7fe18..610479b 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -17,7 +17,6 @@
>  # ${GRUB_ROOT} - grub's root device.
>
>  do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
> -do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
>
>  GRUB_SERIAL ?= "console=ttyS0,115200"
>  GRUB_CFG_VM = "${S}/grub_vm.cfg"
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index d4be478..4f7842c 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -255,14 +255,9 @@ def get_boot_dependencies(d):
>      """
>
>      depends = []
> -    boot_depends_string = ""
>      taskdepdata = d.getVar("BB_TASKDEPDATA", False)
> -    # Only bootimg and bootdirectdisk include the depends flag
> -    boot_tasks = ["do_bootimg", "do_bootdirectdisk",]
> -
> -    for task in boot_tasks:
> -        boot_depends_string = "%s %s" % (boot_depends_string,
> -                d.getVarFlag(task, "depends") or "")
> +    # Only bootimg includes the depends flag
> +    boot_depends_string = d.getVarFlag("do_bootimg", "depends") or ""
>      boot_depends = [dep.split(":")[0] for dep
>                  in boot_depends_string.split()
>                  if not dep.split(":")[0].endswith("-native")]
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index badeaeb..0faa4a6 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -71,7 +71,7 @@ do_rm_work () {
>                  i=dummy
>                  break
>                  ;;
> -            *do_rootfs*|*do_image*|*do_bootimg*|*do_bootdirectdisk*|*
> do_vmimg*|*do_write_qemuboot_conf*)
> +            *do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*)
>                  i=dummy
>                  break
>                  ;;
> diff --git a/meta/classes/systemd-boot.bbclass
> b/meta/classes/systemd-boot.bbclass
> index 9f8f75e..9373070 100644
> --- a/meta/classes/systemd-boot.bbclass
> +++ b/meta/classes/systemd-boot.bbclass
> @@ -7,10 +7,9 @@
>  #                        maintenance.
>  #
>  # Set EFI_PROVIDER = "systemd-boot" to use systemd-boot on your live
> images instead of grub-efi
> -# (images built by image-live.bbclass or image-vm.bbclass)
> +# (images built by image-live.bbclass)
>
>  do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
> -do_bootdirectdisk[depends] += "${MLPREFIX}systemd-boot:do_deploy"
>
>  EFIDIR = "/EFI/BOOT"
>
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 35b9103..a55e283 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -56,7 +56,6 @@ do_testsdk[doc] = "Installs an SDK and performs runtime
> tests on the tools insta
>  do_uboot_mkimage[doc] = "Creates a uImage file from the kernel for the
> U-Boot bootloader"
>  do_unpack[doc] = "Unpacks the source code into a working directory"
>  do_validate_branches[doc] = "Ensures that the source/meta branches are on
> the locations specified by their SRCREV values for a linux-yocto style
> kernel"
> -do_vmimg[doc] = "Creates an image for use with VMware or VirtualBox
> compatible virtual machine hosts (based on IMAGE_FSTYPES either .vmdk or
> .vdi)"
>
>  # DESCRIPTIONS FOR VARIABLES #
>
> --
> 2.7.4
>
>

--001a114592e4c2ece2055599409d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Changes in V2:<div><br></div><div>1 Also drop the referenc=
e to image-vm.bbclass.</div><div><br></div><div>//Ming Liu</div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-07-31 10:56 GMT+0=
2:00  <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@e=
xternal.atlascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br=
>
<br>
do_bootdirectdisk and do_vmimg had been dropped by commit 929ba563:<br>
[ image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types ]<br>
<br>
</span>Also drop the references to them and image-vm.<br>
<span class=3D""><br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/grub-efi.bbclass=C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/classes/license.bbclass=C2=A0 =C2=A0 =C2=A0 | 9 ++-------<br>
=C2=A0meta/classes/rm_work.bbclass=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
</span>=C2=A0meta/classes/systemd-boot.<wbr>bbclass | 3 +--<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A05 files changed, 4 insertions(+), 12 deletions(-)<br>
<div><div class=3D"h5"><br>
diff --git a/meta/classes/grub-efi.<wbr>bbclass b/meta/classes/grub-efi.<wb=
r>bbclass<br>
index df7fe18..610479b 100644<br>
--- a/meta/classes/grub-efi.<wbr>bbclass<br>
+++ b/meta/classes/grub-efi.<wbr>bbclass<br>
@@ -17,7 +17,6 @@<br>
=C2=A0# ${GRUB_ROOT} - grub&#39;s root device.<br>
<br>
=C2=A0do_bootimg[depends] +=3D &quot;${MLPREFIX}grub-efi:do_<wbr>deploy&quo=
t;<br>
-do_bootdirectdisk[depends] +=3D &quot;${MLPREFIX}grub-efi:do_<wbr>deploy&q=
uot;<br>
<br>
=C2=A0GRUB_SERIAL ?=3D &quot;console=3DttyS0,115200&quot;<br>
=C2=A0GRUB_CFG_VM =3D &quot;${S}/grub_vm.cfg&quot;<br>
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass<br=
>
index d4be478..4f7842c 100644<br>
--- a/meta/classes/license.bbclass<br>
+++ b/meta/classes/license.bbclass<br>
@@ -255,14 +255,9 @@ def get_boot_dependencies(d):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0depends =3D []<br>
-=C2=A0 =C2=A0 boot_depends_string =3D &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0taskdepdata =3D d.getVar(&quot;BB_TASKDEPDATA&quot;, Fa=
lse)<br>
-=C2=A0 =C2=A0 # Only bootimg and bootdirectdisk include the depends flag<b=
r>
-=C2=A0 =C2=A0 boot_tasks =3D [&quot;do_bootimg&quot;, &quot;do_bootdirectd=
isk&quot;,]<br>
-<br>
-=C2=A0 =C2=A0 for task in boot_tasks:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_depends_string =3D &quot;%s %s&quot; % (b=
oot_depends_string,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVarFlag(task,=
 &quot;depends&quot;) or &quot;&quot;)<br>
+=C2=A0 =C2=A0 # Only bootimg includes the depends flag<br>
+=C2=A0 =C2=A0 boot_depends_string =3D d.getVarFlag(&quot;do_bootimg&quot;,=
 &quot;depends&quot;) or &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0boot_depends =3D [dep.split(&quot;:&quot;)[0] for dep<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in boot_depen=
ds_string.split()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not dep.sp=
lit(&quot;:&quot;)[0].endswith(&quot;-<wbr>native&quot;)]<br>
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass<br=
>
index badeaeb..0faa4a6 100644<br>
--- a/meta/classes/rm_work.bbclass<br>
+++ b/meta/classes/rm_work.bbclass<br>
@@ -71,7 +71,7 @@ do_rm_work () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=3Ddummy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *do_rootfs*|*do_image*|*do_<wbr>=
bootimg*|*do_bootdirectdisk*|*<wbr>do_vmimg*|*do_write_qemuboot_<wbr>conf*)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *do_rootfs*|*do_image*|*do_<wbr>=
bootimg*|*do_write_qemuboot_<wbr>conf*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=3Ddummy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
diff --git a/meta/classes/systemd-boot.<wbr>bbclass b/meta/classes/systemd-=
boot.<wbr>bbclass<br>
</div></div>index 9f8f75e..9373070 100644<br>
--- a/meta/classes/systemd-boot.<wbr>bbclass<br>
+++ b/meta/classes/systemd-boot.<wbr>bbclass<br>
@@ -7,10 +7,9 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 maintenance.<br>
=C2=A0#<br>
=C2=A0# Set EFI_PROVIDER =3D &quot;systemd-boot&quot; to use systemd-boot o=
n your live images instead of grub-efi<br>
-# (images built by image-live.bbclass or image-vm.bbclass)<br>
+# (images built by image-live.bbclass)<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
=C2=A0do_bootimg[depends] +=3D &quot;${MLPREFIX}systemd-boot:do_<wbr>deploy=
&quot;<br>
-do_bootdirectdisk[depends] +=3D &quot;${MLPREFIX}systemd-boot:do_<wbr>depl=
oy&quot;<br>
<br>
=C2=A0EFIDIR =3D &quot;/EFI/BOOT&quot;<br>
<br>
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf<br=
>
index 35b9103..a55e283 100644<br>
--- a/meta/conf/documentation.conf<br>
+++ b/meta/conf/documentation.conf<br>
@@ -56,7 +56,6 @@ do_testsdk[doc] =3D &quot;Installs an SDK and performs ru=
ntime tests on the tools insta<br>
=C2=A0do_uboot_mkimage[doc] =3D &quot;Creates a uImage file from the kernel=
 for the U-Boot bootloader&quot;<br>
=C2=A0do_unpack[doc] =3D &quot;Unpacks the source code into a working direc=
tory&quot;<br>
=C2=A0do_validate_branches[doc] =3D &quot;Ensures that the source/meta bran=
ches are on the locations specified by their SRCREV values for a linux-yoct=
o style kernel&quot;<br>
-do_vmimg[doc] =3D &quot;Creates an image for use with VMware or VirtualBox=
 compatible virtual machine hosts (based on IMAGE_FSTYPES either .vmdk or .=
vdi)&quot;<br>
<br>
=C2=A0# DESCRIPTIONS FOR VARIABLES #<br>
<br>
--<br>
2.7.4<br>
<br>
</div></div></blockquote></div><br></div>

--001a114592e4c2ece2055599409d--

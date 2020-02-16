Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD9A61472
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 21:42:20 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id f7so5452252uaa.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 13:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RVdTZmNdRlI46jmO79JQ2F+S4Sg6hyfpYDhqo5rRFYA=;
	b=aXuV0LTO7/d8lD4LrUOAXf97RQ7uqAx8tzWOl7v3lCPl5fh838iqYASiOpZpXAVojE
	Gy80NaUX1zcxTqdPD9nqWo1yufmhnqZuO9t3MqzBIv3xLo3tKLEw/3VAjDZfADPWGSgZ
	qIARdKZqKdGlvS2CI33P7XYlEm0sHfsjjCu4Gx4V60U+1NESqeu6agzvhNY1vB27Pct0
	WCmDigcF1AuvokoWuc/ycrP4P2fXhQRhl1nOWlb5dwgDiRXYgAd+jQKNmZDiSMGgkt49
	XUh7q/4/ijAlo3QnZuZV+R+iDXl7jeSEjUPb/rRHcGaiKhcfaL/k61k0tMyUjbRfm1jm
	09wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RVdTZmNdRlI46jmO79JQ2F+S4Sg6hyfpYDhqo5rRFYA=;
	b=J5Xf/qHNTiZRyrilL3USAPsHL9zNHxvEhRTmHljxsAfk7a3tiVZ/XHPDwtZ0/Iu0Cb
	1FGI/ecQq5hQjM7HJ3ihr+vx9Vr8dOVj/AZO0B8yet1z5cV3KR4IXoD8H2PGMIREgDmK
	KQ4YNK9E2qlAroT6Zf51lzuuac+WIEvGCrWQ0KR7H5EaJWLn9Mxd9S6ecVgHv8KCYwQp
	ykeV8yMol8T5s36fA8H2ZmZE3b2TEuNsNZj+bbfUQX1h8c+vZYLJDcMaoSGSpldfDUDC
	wwhV+EN/o8IO/yF3POhPhWiDrHvrFRUSNRQSQdLkq7ZlwluGPGPW7VS4li4UdEWkQLxo
	PNbA==
X-Gm-Message-State: APjAAAXnlKckyku/r9gSGySlWN7ziYaIYyKimCPmgRRsKrvLLtYVNQ1r
	EJfy3eJH7ESTILDgR3eWIpY9r6ZVP1dTj0935aE=
X-Google-Smtp-Source: APXvYqybmY3vXcezRUagKDzw5pzc0NuVUP9Hv2VwMV8padigIOZzDOlhysdgg1DtF9K/h6nxnlIsN/Y54CPFzoyVJ6E=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr6069827uap.93.1581889341776;
	Sun, 16 Feb 2020 13:42:21 -0800 (PST)
MIME-Version: 1.0
References: <BL0PR01MB4307700D50405B40B4B45BCB8F170@BL0PR01MB4307.prod.exchangelabs.com>
In-Reply-To: <BL0PR01MB4307700D50405B40B4B45BCB8F170@BL0PR01MB4307.prod.exchangelabs.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Feb 2020 22:42:10 +0100
Message-ID: <CANNYZj_sxfRtX1CtTwXu15F_qcdW+BL_S4Gu-KtGYz_c5_A7ww@mail.gmail.com>
To: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
Cc: "meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	Jia Zhang <zhang.jia@linux.alibaba.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fail to upgrade RPMs when IMA enabled
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
X-List-Received-Date: Sun, 16 Feb 2020 21:42:21 -0000
Content-Type: multipart/alternative; boundary="0000000000004a68c3059eb8505a"

--0000000000004a68c3059eb8505a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This should be addressed to the maintainers of meta-secure-core, this is,
Jia.

Openembedded/Yocto in general does not define or test OS upgrades.

You can also start looking into the failure you're getting from here:
https://github.com/rpm-software-management/rpm/blob/master/plugins/ima.c

Alex

On Sun, 16 Feb 2020 at 22:21, Muhlenkamp, Lewis <
lewis.muhlenkamp@stryker.com> wrote:

> Hello,
>
>
>
> I=E2=80=99ve been trying to get the security stuff in meta-secure-core wo=
rking so
> I can upgrade from one version of the OS I=E2=80=99m creating, right now =
called
> LewisOS, to a new version, just by being able to run =E2=80=9Crpm -U=E2=
=80=9D or =E2=80=9Cdnf
> upgrade=E2=80=9D commands.  I can run =E2=80=9Cdnf upgrade=E2=80=9D succe=
ssfully against non kernel
> related packages, but the kernel, initramfs and systemd-boot RPMs always
> fail with the same error, no matter what I try.
>
>
>
> I am using Zeus for my builds.  I am using an older commit for LewisOS
> version X, 8a518a2054bdd349d7661ee4872590fc8750313f, dated 2019 Dec 30, o=
f
> the meta-secure-core GIT repo.  I am using
> 8302e3c479154157667e22e9d7c5461c966b4586, dated 2020 Jan 19, of the
> meta-secure-core GIT repo for LewisOS version Y.
>
>
>
> My machine is intel-corei7-64.
>
>
>
> I=E2=80=99ll just stick with systemd-boot RPM for this email.  LewisOS ve=
rsion X
> installs systemd-boot-243+0+efb536d0cb-r0.corei7_64_intell_common.  Lewis=
OS
> version Y contains systemd-boot-243.2-r0.corei7_64_intel_common.  When I
> try to upgrade systemd-boot, I get the following error message:
>
>
>
> =3D=3D=3D Start upgrade messages =3D=3D=3D
>
> root@intel-corei7-64:/var/opt/repos/os# rpm -q systemd-boot
>
> systemd-boot-243+0+efb536d0cb-r0.corei7_64_intel_common
>
> root@intel-corei7-64:/var/opt/repos/os# rpm -qp
> systemd-boot-243.2-r0.corei7_64_intel_common.rpm
>
> systemd-boot-243.2-r0.corei7_64_intel_common
>
> root@intel-corei7-64:/var/opt/repos/os# rpm -Uhv
> systemd-boot-243.2-r0.corei7_64_intel_common.rpm
>
> Verifying=E2=80=A6
> ######################################## [100%]
>
> Preparing=E2=80=A6
> ######################################## [100%]
>
> Updating / installing=E2=80=A6
>
>    1:systemd-boot-243.2-r0
> ######################################## [ 50%]
>
> error: ima: could not apply signature on
> =E2=80=98/boot/EFI/BOOT/bootx64.efi;5e49ad05=E2=80=99: Operation not supp=
orted
>
> error: Plugin ima: hook fsm_file_prepare failed
>
> error: unpacking of archive failed on file
> /boot/EFI/BOOT/bootx64.efi;5e49ad05: cpio: (error 0x2)
>
> error: systemd-boot-243.2-r0.corei7_64_intel_common: install failed
>
> error: systemd-boot-243+0+efb536d0cb-r0.corei7_64_intel_common: erase
> skipped
>
> =3D=3D=3D End upgrade messages =3D=3D=3D
>
>
>
>
>
> The above error messages also appear when I try updating
> kernel-image-bzimage, kernel-initramfs and systemd-bootconf.
>
>
>
> I have the following in my bblayers.conf file:
>
>
>
> =3D=3D=3D Start bblayers.conf =3D=3D=3D
>
> # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
>
> # changes incompatibly
>
> LCONF_VERSION =3D "7"
>
>
>
> BBPATH =3D "${TOPDIR}"
>
> BBFILES ?=3D ""
>
>
>
> BBLAYERS ?=3D " \
>
>   ${HOME}/meta-stryker/meta-lewisos-distro \
>
>   ${HOME}/meta-stryker/meta-lewisos-common \
>
>   ${HOME}/meta-stryker/meta-lewisos-edge \
>
>   ${HOME}/oe-core/meta \
>
>   ${HOME}/meta-openembedded/meta-python \
>
>   ${HOME}/meta-openembedded/meta-perl \
>
>   ${HOME}/meta-openembedded/meta-filesystems \
>
>   ${HOME}/meta-openembedded/meta-oe \
>
>   ${HOME}/meta-openembedded/meta-networking \
>
>   ${HOME}/meta-openembedded/meta-webserver \
>
>   ${HOME}/meta-intel \
>
>   ${HOME}/meta-virtualization \
>
>   ${HOME}/meta-cloud-services \
>
>   ${HOME}/meta-cloud-services/meta-openstack \
>
>   ${HOME}/meta-secure-core/meta \
>
>   ${HOME}/meta-secure-core/meta-signing-key \
>
>   ${HOME}/meta-secure-core/meta-tpm \
>
>   ${HOME}/meta-secure-core/meta-tpm2 \
>
>   ${HOME}/meta-secure-core/meta-efi-secure-boot \
>
>   ${HOME}/meta-secure-core/meta-integrity \
>
>   ${HOME}/meta-secure-core/meta-encrypted-storage \
>
>   ${HOME}/meta-secure-core/meta-ids \
>
>   ${HOME}/meta-secure-core/meta-intel-sgx \
>
>   "
>
> =3D=3D=3D End bblayers.conf =3D=3D=3D
>
>
>
>
>
> Here is my local.conf file
>
>
>
> =3D=3D=3D Start local.conf =3D=3D=3D
>
> MACHINE ?=3D "intel-corei7-64"
>
> DL_DIR ?=3D "/var/opt/openembedded-linux/downloads"
>
> SSTATE_DIR ?=3D "/var/opt/openembedded-linux/sstate-cache"
>
> PACKAGE_CLASSES ?=3D "package_rpm"
>
>
>
> # Extra image configuration defaults
>
> #
>
> # The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to
> the generated
>
> # images.
>
> # There are other application targets that can be used here too, see
>
> # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more
> details.
>
> # We default to enabling the debugging tweaks.
>
> EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
>
>
>
> USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
>
> PATCHRESOLVE =3D "noop"
>
> BB_DISKMON_DIRS ??=3D "\
>
>     STOPTASKS,${TMPDIR},1G,100K \
>
>     STOPTASKS,${DL_DIR},1G,100K \
>
>     STOPTASKS,${SSTATE_DIR},1G,100K \
>
>     STOPTASKS,/tmp,100M,100K \
>
>     ABORT,${TMPDIR},100M,1K \
>
>     ABORT,${DL_DIR},100M,1K \
>
>     ABORT,${SSTATE_DIR},100M,1K \
>
>     ABORT,/tmp,10M,1K"
>
>
>
> PACKAGECONFIG_append_pn-qemu-native =3D " sdl"
>
> PACKAGECONFIG_append_pn-nativesdk-qemu =3D " sdl"
>
> CONF_VERSION =3D "1"
>
>
>
> DISTRO =3D "lewisos"
>
>
>
> # The following 2 lines are to generate an ISO.
>
> IMAGE_FSTYPES +=3D "live"
>
> NOISO =3D "0"
>
>
>
> # The following line is needed to help address issues with updating the O=
S.
>
> # It prevents a lot of messages regarding file/directory ownership issues=
.
>
> DIRFILES =3D "1"
>
>
>
> # The BBMASK directive below is to prevent the kernel-initramfs.bbappend
>
> # from meta-secure-core from being used.  We have customized the bb file.
>
> # So, don't want any changes to it.
>
> BBMASK +=3D
> "meta-secure-core/meta-efi-secure-boot/recipes-core/images/kernel-initram=
fs.bbappend"
>
>
>
> # INITRAMFS_IMAGE must be defined here.  It cannot be defined in an image
>
> # recipe.  If it is only defined in an image recipe, the build fails to
>
> # sign packages.
>
> INITRAMFS_IMAGE =3D "secure-core-image-initramfs"
>
>
>
> # Similarly, the kernel-image-bzimage must be defined here.  When it was
>
> # set in the image recipe, got complaints about no buildable providers.
>
> # Weird.
>
> IMAGE_INSTALL +=3D "kernel-image-bzimage"
>
>
>
> # These DISTRO_FEATURES must remain here.  When I tried to put them into
>
> # the lewisos.conf distro configuration file, the build of the stryker-ed=
ge
>
> # image failed.  Got old errors.  Apparently some of the bbappends were
>
> # not picked up properly when these were defined in the distro config
>
> # file.  Not sure why.
>
> DISTRO_FEATURES_NATIVE_append +=3D "systemd ima tpm tpm2 efi-secure-boot
> luks"
>
> DISTRO_FEATURES_append +=3D "systemd ima tpm tpm2 efi-secure-boot luks
> modsign pam intel-sgx"
>
>
>
> MACHINE_FEATURES_NATIVE_append +=3D "efi"
>
> MACHINE_FEATURES_append +=3D "efi"
>
> DEBUG_FLAGS_forcevariable =3D ""
>
> USER_CLASSES_remove =3D "image-prelink"
>
> =3D=3D=3D End local.conf =3D=3D=3D
>
>
>
>
>
> Here is my lewisos.conf distro configuration file.
>
>
>
> =3D=3D=3D Start lewisos.conf =3D=3D=3D
>
> # Lewisos distribution configuration file
>
> DISTRO =3D "lewisos"
>
> DISTRO_NAME =3D "Lewis test distribution"
>
> DISTRO_VERSION =3D "0.1.3-ou"
>
> MAINTAINER =3D "mako.device@stryker.com"
>
>
>
> IMAGE_VERSION_SUFFIX =3D "-${DISTRO_VERSION}"
>
>
>
> # Want to use systemd as the init manager
>
> DISTRO_FEATURES_append =3D " systemd"
>
> VIRTUAL-RUNTIME_init_manager =3D "systemd"
>
> VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
>
>
>
> # Need virtualization
>
> DISTRO_FEATURES_append =3D " virtualization"
>
>
>
> # Add support for wireless
>
> DISTRO_FEATURES_append =3D " wifi"
>
>
>
> # Add support for disk encryption, secure boot and access to TPM
>
> # Needed for both the product build, and for native
>
> # From the meta-secure-core layer
>
> # DISTRO_FEATURES_append =3D " ima tpm tpm2 efi-secure-boot luks modsign =
pam
> intel-sgx"
>
> # DISTRO_FEATURES_NATIVE_append =3D " ima tpm tpm2 efi-secure-boot luks"
>
>
>
> # Remove undesirable features
>
> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "nfs"
>
> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
>
> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "zeroconf"
>
>
>
> # Set up for signing RPMs
>
> # Inherit the sign_rpm_ext and user-key-store classes from the
> meta-secure-core
>
> # layer.  They provide some additional functionality.
>
> # If not using the meta-secure-core layer, uncomment the sign_rpm line an=
d
>
> # comment out the sign_rpm_ext and user-key-store lines.
>
> # INHERIT +=3D "sign_rpm"
>
> INHERIT +=3D "sign_rpm_ext"
>
> INHERIT +=3D "user-key-store"
>
>
>
> # NOTE: The two RPM_GPG lines cannot have spaces in their values.  It
> causes
>
> # the build to fail since the scripts cannot handle the space.
>
> RPM_GPG_NAME =3D "xxxxxxxx"
>
> RPM_GPG_PASSPHRASE =3D "yyyyyyyy"
>
> =3D=3D=3D End lewisos.conf =3D=3D=3D
>
>
>
>
>
> And here is my bbappend for linux-intel
>
>
>
> =3D=3D=3D Start linux-intel_%.bbappend =3D=3D=3D
>
> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>
> SRC_URI +=3D "file://kernel_baseline.scc"
>
> KERNEL_IMAGEDEST =3D "boot/${DISTRO}-${DISTRO_VERSION}"
>
>
>
> FILES_kernel-image-bzimage =3D "/boot/${PV}/bzImage-${KERNEL_VERSION_NAME=
}"
>
>
>
> python do_package_prepend () {
>
>     os.remove(d.getVar('D') + '/' + d.getVar('KERNEL_IMAGEDEST') +
> '/bzImage')
>
> }
>
>
>
> require recipes-kernel/linux/linux-yocto-integrity.inc
>
> =3D=3D=3D End linux-intel_%.bbappend =3D=3D=3D
>
>
>
>
>
> I=E2=80=99m removing symbolic links and putting the kernel and initramfs =
in
> version specific directories because the /boot partition is vfat, which
> doesn=E2=80=99t support symbolic links, and if I kept the names as someth=
ing like
> bzImage, then =E2=80=9Cdnf upgrade=E2=80=9D would complain about multiple=
 RPMs trying to
> own the same file.
>
>
>
> What am I missing?  Where did I make a mistake?  Does the
> meta-secure-core, or Openembedded/Yocto in general support upgrading from
> version X to version Y of an OS using just some command like =E2=80=9Cdnf=
 upgrade=E2=80=9D?
>
>
>
> If you need more information, please let me know.
>
>
>
> As one last piece of info, if I remove =E2=80=9Cima=E2=80=9D from DISTRO_=
FEATURES, the
> build hangs when trying to sign the RPMs.
>
>
>
> Thank you
>
>
>
> Lewis Muhlenkamp
>
>
> Follow this link to read our Privacy Statement
> <https://www.stryker.com/content/stryker/gb/en/legal/global-policy-statem=
ent.html/>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000004a68c3059eb8505a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This should be addressed to the maintainers of meta-s=
ecure-core, this is, Jia. <br></div><div><br></div><div>Openembedded/Yocto =
in general does not define or test OS upgrades.</div><div><br></div><div>Yo=
u can also start looking into the failure you&#39;re getting from here:</di=
v><div><a href=3D"https://github.com/rpm-software-management/rpm/blob/maste=
r/plugins/ima.c">https://github.com/rpm-software-management/rpm/blob/master=
/plugins/ima.c</a></div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 16 Feb 20=
20 at 22:21, Muhlenkamp, Lewis &lt;<a href=3D"mailto:lewis.muhlenkamp@stryk=
er.com">lewis.muhlenkamp@stryker.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_3294336248073245212WordSection1">
<p class=3D"MsoNormal">Hello,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I=E2=80=99ve been trying to get the security stuff i=
n meta-secure-core working so I can upgrade from one version of the OS I=E2=
=80=99m creating, right now called LewisOS, to a new version, just by being=
 able to run =E2=80=9Crpm -U=E2=80=9D or =E2=80=9Cdnf upgrade=E2=80=9D comm=
ands.=C2=A0 I
 can run =E2=80=9Cdnf upgrade=E2=80=9D successfully against non kernel rela=
ted packages, but the kernel, initramfs and systemd-boot RPMs always fail w=
ith the same error, no matter what I try.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I am using Zeus for my builds.=C2=A0 I am using an o=
lder commit for LewisOS version X, 8a518a2054bdd349d7661ee4872590fc8750313f=
, dated 2019 Dec 30, of the meta-secure-core GIT repo.=C2=A0 I am using 830=
2e3c479154157667e22e9d7c5461c966b4586, dated
 2020 Jan 19, of the meta-secure-core GIT repo for LewisOS version Y.<u></u=
><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">My machine is intel-corei7-64.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I=E2=80=99ll just stick with systemd-boot RPM for th=
is email.=C2=A0 LewisOS version X installs systemd-boot-243+0+efb536d0cb-r0=
.corei7_64_intell_common.=C2=A0 LewisOS version Y contains systemd-boot-243=
.2-r0.corei7_64_intel_common.=C2=A0 When I try to upgrade
 systemd-boot, I get the following error message:<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=3D=3D=3D Start upgrade messages =3D=3D=3D<u></u><u>=
</u></p>
<p class=3D"MsoNormal">root@intel-corei7-64:/var/opt/repos/os# rpm -q syste=
md-boot<u></u><u></u></p>
<p class=3D"MsoNormal">systemd-boot-243+0+efb536d0cb-r0.corei7_64_intel_com=
mon<u></u><u></u></p>
<p class=3D"MsoNormal">root@intel-corei7-64:/var/opt/repos/os# rpm -qp syst=
emd-boot-243.2-r0.corei7_64_intel_common.rpm<u></u><u></u></p>
<p class=3D"MsoNormal">systemd-boot-243.2-r0.corei7_64_intel_common<u></u><=
u></u></p>
<p class=3D"MsoNormal">root@intel-corei7-64:/var/opt/repos/os# rpm -Uhv sys=
temd-boot-243.2-r0.corei7_64_intel_common.rpm<u></u><u></u></p>
<p class=3D"MsoNormal">Verifying=E2=80=A6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ################################=
######## [100%]<u></u><u></u></p>
<p class=3D"MsoNormal">Preparing=E2=80=A6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ################################=
######## [100%]<u></u><u></u></p>
<p class=3D"MsoNormal">Updating / installing=E2=80=A6<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0 1:systemd-boot-243.2-r0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###################################=
##### [ 50%]<u></u><u></u></p>
<p class=3D"MsoNormal">error: ima: could not apply signature on =E2=80=98/b=
oot/EFI/BOOT/bootx64.efi;5e49ad05=E2=80=99: Operation not supported<u></u><=
u></u></p>
<p class=3D"MsoNormal">error: Plugin ima: hook fsm_file_prepare failed<u></=
u><u></u></p>
<p class=3D"MsoNormal">error: unpacking of archive failed on file /boot/EFI=
/BOOT/bootx64.efi;5e49ad05: cpio: (error 0x2)<u></u><u></u></p>
<p class=3D"MsoNormal">error: systemd-boot-243.2-r0.corei7_64_intel_common:=
 install failed<u></u><u></u></p>
<p class=3D"MsoNormal">error: systemd-boot-243+0+efb536d0cb-r0.corei7_64_in=
tel_common: erase skipped<u></u><u></u></p>
<p class=3D"MsoNormal">=3D=3D=3D End upgrade messages =3D=3D=3D<u></u><u></=
u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">The above error messages also appear when I try upda=
ting kernel-image-bzimage, kernel-initramfs and systemd-bootconf.<u></u><u>=
</u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I have the following in my bblayers.conf file:<u></u=
><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=3D=3D=3D Start bblayers.conf =3D=3D=3D<u></u><u></u=
></p>
<p class=3D"MsoNormal"># LAYER_CONF_VERSION is increased each time build/co=
nf/bblayers.conf<u></u><u></u></p>
<p class=3D"MsoNormal"># changes incompatibly<u></u><u></u></p>
<p class=3D"MsoNormal">LCONF_VERSION =3D &quot;7&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">BBPATH =3D &quot;${TOPDIR}&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">BBFILES ?=3D &quot;&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">BBLAYERS ?=3D &quot; \<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-stryker/meta-lewisos-distro \<u>=
</u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-stryker/meta-lewisos-common \<u>=
</u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-stryker/meta-lewisos-edge \<u></=
u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/oe-core/meta \<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-openembedded/meta-python \<u></u=
><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-openembedded/meta-perl \<u></u><=
u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-openembedded/meta-filesystems \<=
u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-openembedded/meta-oe \<u></u><u>=
</u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-openembedded/meta-networking \<u=
></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-openembedded/meta-webserver \<u>=
</u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-intel \<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-virtualization \<u></u><u></u></=
p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-cloud-services \<u></u><u></u></=
p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-cloud-services/meta-openstack \<=
u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-secure-core/meta \<u></u><u></u>=
</p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-secure-core/meta-signing-key \<u=
></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-secure-core/meta-tpm \<u></u><u>=
</u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-secure-core/meta-tpm2 \<u></u><u=
></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-secure-core/meta-efi-secure-boot=
 \<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-secure-core/meta-integrity \<u><=
/u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-secure-core/meta-encrypted-stora=
ge \<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-secure-core/meta-ids \<u></u><u>=
</u></p>
<p class=3D"MsoNormal">=C2=A0 ${HOME}/meta-secure-core/meta-intel-sgx \<u><=
/u><u></u></p>
<p class=3D"MsoNormal">=C2=A0 &quot;<u></u><u></u></p>
<p class=3D"MsoNormal">=3D=3D=3D End bblayers.conf =3D=3D=3D<u></u><u></u><=
/p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Here is my local.conf file<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=3D=3D=3D Start local.conf =3D=3D=3D<u></u><u></u></=
p>
<p class=3D"MsoNormal">MACHINE ?=3D &quot;intel-corei7-64&quot;<u></u><u></=
u></p>
<p class=3D"MsoNormal">DL_DIR ?=3D &quot;/var/opt/openembedded-linux/downlo=
ads&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">SSTATE_DIR ?=3D &quot;/var/opt/openembedded-linux/ss=
tate-cache&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">PACKAGE_CLASSES ?=3D &quot;package_rpm&quot;<u></u><=
u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># Extra image configuration defaults<u></u><u></u></=
p>
<p class=3D"MsoNormal">#<u></u><u></u></p>
<p class=3D"MsoNormal"># The EXTRA_IMAGE_FEATURES variable allows extra pac=
kages to be added to the generated<u></u><u></u></p>
<p class=3D"MsoNormal"># images.<u></u><u></u></p>
<p class=3D"MsoNormal"># There are other application targets that can be us=
ed here too, see<u></u><u></u></p>
<p class=3D"MsoNormal"># meta/classes/image.bbclass and meta/classes/core-i=
mage.bbclass for more details.<u></u><u></u></p>
<p class=3D"MsoNormal"># We default to enabling the debugging tweaks.<u></u=
><u></u></p>
<p class=3D"MsoNormal">EXTRA_IMAGE_FEATURES ?=3D &quot;debug-tweaks&quot;<u=
></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">USER_CLASSES ?=3D &quot;buildstats image-mklibs imag=
e-prelink&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">PATCHRESOLVE =3D &quot;noop&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">BB_DISKMON_DIRS ??=3D &quot;\<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 STOPTASKS,${TMPDIR},1G,100K \<u><=
/u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 STOPTASKS,${DL_DIR},1G,100K \<u><=
/u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 STOPTASKS,${SSTATE_DIR},1G,100K \=
<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 STOPTASKS,/tmp,100M,100K \<u></u>=
<u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 ABORT,${TMPDIR},100M,1K \<u></u><=
u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 ABORT,${DL_DIR},100M,1K \<u></u><=
u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 ABORT,${SSTATE_DIR},100M,1K \<u><=
/u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 ABORT,/tmp,10M,1K&quot;<u></u><u>=
</u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">PACKAGECONFIG_append_pn-qemu-native =3D &quot; sdl&q=
uot;<u></u><u></u></p>
<p class=3D"MsoNormal">PACKAGECONFIG_append_pn-nativesdk-qemu =3D &quot; sd=
l&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">CONF_VERSION =3D &quot;1&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">DISTRO =3D &quot;lewisos&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># The following 2 lines are to generate an ISO.<u></=
u><u></u></p>
<p class=3D"MsoNormal">IMAGE_FSTYPES +=3D &quot;live&quot;<u></u><u></u></p=
>
<p class=3D"MsoNormal">NOISO =3D &quot;0&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># The following line is needed to help address issue=
s with updating the OS.<u></u><u></u></p>
<p class=3D"MsoNormal"># It prevents a lot of messages regarding file/direc=
tory ownership issues.<u></u><u></u></p>
<p class=3D"MsoNormal">DIRFILES =3D &quot;1&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># The BBMASK directive below is to prevent the kerne=
l-initramfs.bbappend<u></u><u></u></p>
<p class=3D"MsoNormal"># from meta-secure-core from being used.=C2=A0 We ha=
ve customized the bb file.<u></u><u></u></p>
<p class=3D"MsoNormal"># So, don&#39;t want any changes to it.<u></u><u></u=
></p>
<p class=3D"MsoNormal">BBMASK +=3D &quot;meta-secure-core/meta-efi-secure-b=
oot/recipes-core/images/kernel-initramfs.bbappend&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># INITRAMFS_IMAGE must be defined here.=C2=A0 It can=
not be defined in an image<u></u><u></u></p>
<p class=3D"MsoNormal"># recipe.=C2=A0 If it is only defined in an image re=
cipe, the build fails to<u></u><u></u></p>
<p class=3D"MsoNormal"># sign packages.<u></u><u></u></p>
<p class=3D"MsoNormal">INITRAMFS_IMAGE =3D &quot;secure-core-image-initramf=
s&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># Similarly, the kernel-image-bzimage must be define=
d here.=C2=A0 When it was<u></u><u></u></p>
<p class=3D"MsoNormal"># set in the image recipe, got complaints about no b=
uildable providers.<u></u><u></u></p>
<p class=3D"MsoNormal"># Weird.<u></u><u></u></p>
<p class=3D"MsoNormal">IMAGE_INSTALL +=3D &quot;kernel-image-bzimage&quot;<=
u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># These DISTRO_FEATURES must remain here.=C2=A0 When=
 I tried to put them into<u></u><u></u></p>
<p class=3D"MsoNormal"># the lewisos.conf distro configuration file, the bu=
ild of the stryker-edge<u></u><u></u></p>
<p class=3D"MsoNormal"># image failed.=C2=A0 Got old errors.=C2=A0 Apparent=
ly some of the bbappends were<u></u><u></u></p>
<p class=3D"MsoNormal"># not picked up properly when these were defined in =
the distro config<u></u><u></u></p>
<p class=3D"MsoNormal"># file.=C2=A0 Not sure why.<u></u><u></u></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_NATIVE_append +=3D &quot;systemd ima=
 tpm tpm2 efi-secure-boot luks&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append +=3D &quot;systemd ima tpm tp=
m2 efi-secure-boot luks modsign pam intel-sgx&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">MACHINE_FEATURES_NATIVE_append +=3D &quot;efi&quot;<=
u></u><u></u></p>
<p class=3D"MsoNormal">MACHINE_FEATURES_append +=3D &quot;efi&quot;<u></u><=
u></u></p>
<p class=3D"MsoNormal">DEBUG_FLAGS_forcevariable =3D &quot;&quot;<u></u><u>=
</u></p>
<p class=3D"MsoNormal">USER_CLASSES_remove =3D &quot;image-prelink&quot;<u>=
</u><u></u></p>
<p class=3D"MsoNormal">=3D=3D=3D End local.conf =3D=3D=3D<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Here is my lewisos.conf distro configuration file.<u=
></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=3D=3D=3D Start lewisos.conf =3D=3D=3D<u></u><u></u>=
</p>
<p class=3D"MsoNormal"># Lewisos distribution configuration file<u></u><u><=
/u></p>
<p class=3D"MsoNormal">DISTRO =3D &quot;lewisos&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">DISTRO_NAME =3D &quot;Lewis test distribution&quot;<=
u></u><u></u></p>
<p class=3D"MsoNormal">DISTRO_VERSION =3D &quot;0.1.3-ou&quot;<u></u><u></u=
></p>
<p class=3D"MsoNormal">MAINTAINER =3D &quot;<a href=3D"mailto:mako.device@s=
tryker.com" target=3D"_blank">mako.device@stryker.com</a>&quot;<u></u><u></=
u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">IMAGE_VERSION_SUFFIX =3D &quot;-${DISTRO_VERSION}&qu=
ot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># Want to use systemd as the init manager<u></u><u><=
/u></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; systemd&quot;<u></=
u><u></u></p>
<p class=3D"MsoNormal">VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;=
<u></u><u></u></p>
<p class=3D"MsoNormal">VIRTUAL-RUNTIME_initscripts =3D &quot;systemd-compat=
-units&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># Need virtualization<u></u><u></u></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; virtualization&quo=
t;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># Add support for wireless<u></u><u></u></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; wifi&quot;<u></u><=
u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># Add support for disk encryption, secure boot and a=
ccess to TPM<u></u><u></u></p>
<p class=3D"MsoNormal"># Needed for both the product build, and for native<=
u></u><u></u></p>
<p class=3D"MsoNormal"># From the meta-secure-core layer<u></u><u></u></p>
<p class=3D"MsoNormal"># DISTRO_FEATURES_append =3D &quot; ima tpm tpm2 efi=
-secure-boot luks modsign pam intel-sgx&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"># DISTRO_FEATURES_NATIVE_append =3D &quot; ima tpm t=
pm2 efi-secure-boot luks&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># Remove undesirable features<u></u><u></u></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;nfs&q=
uot;<u></u><u></u></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;sysvi=
nit&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;zeroc=
onf&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># Set up for signing RPMs<u></u><u></u></p>
<p class=3D"MsoNormal"># Inherit the sign_rpm_ext and user-key-store classe=
s from the meta-secure-core<u></u><u></u></p>
<p class=3D"MsoNormal"># layer.=C2=A0 They provide some additional function=
ality.<u></u><u></u></p>
<p class=3D"MsoNormal"># If not using the meta-secure-core layer, uncomment=
 the sign_rpm line and<u></u><u></u></p>
<p class=3D"MsoNormal"># comment out the sign_rpm_ext and user-key-store li=
nes.<u></u><u></u></p>
<p class=3D"MsoNormal"># INHERIT +=3D &quot;sign_rpm&quot;<u></u><u></u></p=
>
<p class=3D"MsoNormal">INHERIT +=3D &quot;sign_rpm_ext&quot;<u></u><u></u><=
/p>
<p class=3D"MsoNormal">INHERIT +=3D &quot;user-key-store&quot;<u></u><u></u=
></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># NOTE: The two RPM_GPG lines cannot have spaces in =
their values.=C2=A0 It causes<u></u><u></u></p>
<p class=3D"MsoNormal"># the build to fail since the scripts cannot handle =
the space.<u></u><u></u></p>
<p class=3D"MsoNormal">RPM_GPG_NAME =3D &quot;xxxxxxxx&quot;<u></u><u></u><=
/p>
<p class=3D"MsoNormal">RPM_GPG_PASSPHRASE =3D &quot;yyyyyyyy&quot;<u></u><u=
></u></p>
<p class=3D"MsoNormal">=3D=3D=3D End lewisos.conf =3D=3D=3D<u></u><u></u></=
p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">And here is my bbappend for linux-intel<u></u><u></u=
></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=3D=3D=3D Start linux-intel_%.bbappend =3D=3D=3D<u><=
/u><u></u></p>
<p class=3D"MsoNormal">FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:=
&quot;<u></u><u></u></p>
<p class=3D"MsoNormal">SRC_URI +=3D &quot;file://kernel_baseline.scc&quot;<=
u></u><u></u></p>
<p class=3D"MsoNormal">KERNEL_IMAGEDEST =3D &quot;boot/${DISTRO}-${DISTRO_V=
ERSION}&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">FILES_kernel-image-bzimage =3D &quot;/boot/${PV}/bzI=
mage-${KERNEL_VERSION_NAME}&quot;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">python do_package_prepend () {<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 os.remove(d.getVar(&#39;D&#39;) +=
 &#39;/&#39; + d.getVar(&#39;KERNEL_IMAGEDEST&#39;) + &#39;/bzImage&#39;)<u=
></u><u></u></p>
<p class=3D"MsoNormal">}<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">require recipes-kernel/linux/linux-yocto-integrity.i=
nc<u></u><u></u></p>
<p class=3D"MsoNormal">=3D=3D=3D End linux-intel_%.bbappend =3D=3D=3D<u></u=
><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I=E2=80=99m removing symbolic links and putting the =
kernel and initramfs in version specific directories because the /boot part=
ition is vfat, which doesn=E2=80=99t support symbolic links, and if I kept =
the names as something like bzImage, then =E2=80=9Cdnf upgrade=E2=80=9D
 would complain about multiple RPMs trying to own the same file.<u></u><u><=
/u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">What am I missing?=C2=A0 Where did I make a mistake?=
=C2=A0 Does the meta-secure-core, or Openembedded/Yocto in general support =
upgrading from version X to version Y of an OS using just some command like=
 =E2=80=9Cdnf upgrade=E2=80=9D?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">If you need more information, please let me know.<u>=
</u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">As one last piece of info, if I remove =E2=80=9Cima=
=E2=80=9D from DISTRO_FEATURES, the build hangs when trying to sign the RPM=
s.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thank you<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Lewis Muhlenkamp<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
Follow this link to read our <a href=3D"https://www.stryker.com/content/str=
yker/gb/en/legal/global-policy-statement.html/" target=3D"_blank">
Privacy Statement</a>
</div>

-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000004a68c3059eb8505a--

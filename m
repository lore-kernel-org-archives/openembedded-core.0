Return-Path: <lewis.muhlenkamp@stryker.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	by mail.openembedded.org (Postfix) with ESMTP id A0E63601FB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 21:21:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=UmR9lzbl4AZ+Ylws6tRQ64iZstLCX7KwIBMMbL/W6M2r1EG8/+eUO5uN7sdi8mT9FhpVywqJiOocB0hAndOhYEDawPQhLTYl6y/8s+Xa2Mi2mphjP3m4FRNHvH2kQFSiR+AotRx63KSVuRHIyhkBqSBmbufqwP1xmJUCrmN+6bOnKpw6G+t1rhRDSoxNPFIEum00tUhjjsmwLefbtF/JwhAWQafEZGnD6jr9TohE/AosUer0FBESH14Ly05L1+5rBKlp8GrUHKGOiKa4HicQUM/3rSOj9tTL6p7L5dYwDFoV5HCH1TK7PTlD340+0qvGs6sxuWOQKE53P+1mXvwaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CUgbgCxe/JuYz7cerW8BMdGi+ewIRFJuskqdt4xqTDs=;
	b=kyRAQMM6IEtsJo2GtETu4XRgJk6uirlvDD7je1QB+UpT+1U9wogALt4Xbd5+RHYjPFW0OlXV/uhq/EWkFDFw1MHoYvjJsy47icxzyxC4ixQoGsXVXu6T0O6Yg3UBUGt+QtmxQVx7a6NK4DF8rx5slPWgXRaKLusOcGGIKoMKLlKcNo6ntKofVEPHOdyLfCup6K0Q+0AB1apwWV5HmxzfcDBGJlpQq19jQZ42l5a9Fo/HK1ZsTzR7QbVqIqUfRenAzRoMIzwRuv6nQMMpjP9XFPh+70R1N78VAmz2ljQ4opJyMrsN0wMcEFHF7YsatGbHYfAMLKXzXWSKyuLGNj1FkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=stryker.com;
	dmarc=pass action=none header.from=stryker.com; 
	dkim=pass header.d=stryker.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CUgbgCxe/JuYz7cerW8BMdGi+ewIRFJuskqdt4xqTDs=;
	b=bzZd8W/smvmv1jMZRzvPNTnKAXFZE3nuR3sf7FEnm2Og4kNXoSiGEuF0D6bGZ0gsGXFKEdMXOYKkux4GxuYcWdVvssnp9v4RMZKsajccwO4FeQaZhtMX1mCk+9IooM/aJ8SluI3WCA2xge4B/aUZA9NZjluHxhpL2aPehINS3+10YJHryTXHaf0QTEqZJOs7Gu3VSvMccrYvOA4tqad2NqaLO4P3OvF64VyIK1m9P4AlicNkDqvsYK39pUXMrboLkfYc3CeE/2r5M828Hv9rhA03M0YDB5MFxaffOYNM5LwTSHJFfzWMxSgobzQlzf+zimF+sA6MHYLEjy9qRHYOnQ==
Received: from BL0PR01MB4307.prod.exchangelabs.com (10.167.180.160) by
	BL0PR01MB5074.prod.exchangelabs.com (10.167.233.19) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.29; Sun, 16 Feb 2020 21:21:21 +0000
Received: from BL0PR01MB4307.prod.exchangelabs.com
	([fe80::1dd4:1103:408a:4238]) by BL0PR01MB4307.prod.exchangelabs.com
	([fe80::1dd4:1103:408a:4238%4]) with mapi id 15.20.2729.031;
	Sun, 16 Feb 2020 21:21:21 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "meta-intel@yoctoproject.org"
	<meta-intel@yoctoproject.org>, Jia Zhang <zhang.jia@linux.alibaba.com>
Thread-Topic: Fail to upgrade RPMs when IMA enabled
Thread-Index: AdXk/Dj2AZY8F1wkQFuKNDJNQOpCeQ==
Date: Sun, 16 Feb 2020 21:21:20 +0000
Message-ID: <BL0PR01MB4307700D50405B40B4B45BCB8F170@BL0PR01MB4307.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [198.72.46.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 53559e6e-2cf7-4334-a515-08d7b3262b23
x-ms-traffictypediagnostic: BL0PR01MB5074:
x-microsoft-antispam-prvs: <BL0PR01MB507423FE8D7B2A23533054ED8F170@BL0PR01MB5074.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03152A99FF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(136003)(366004)(396003)(376002)(199004)(189003)(66556008)(66446008)(66476007)(64756008)(110136005)(66946007)(55016002)(6506007)(71200400001)(316002)(9686003)(2906002)(7696005)(33656002)(76116006)(86362001)(478600001)(26005)(8676002)(5660300002)(81156014)(81166006)(186003)(52536014)(9326002)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR01MB5074;
	H:BL0PR01MB4307.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MO56d7r6Rp1ftg7wjhgghHvfg6jg/GOWtTjE7wWDArbVs76Oiuc+Syi5yGPexML4F4bQTrNHCO4Z11Kmk7LQY32oGoGI53PL6mQqtkBPgOLBz/eO3lsyXTMHGesV/Q1LZ2zMr3gT06rck7wnBiJDAatAY8bKXGqj76Q0uxV3t0gNS1iUACB2qOCt+06kvUjjVhUHu8VFAS1iig7JpTGJ11Rq54dIx7/UZPG2tpMw+NjJCiWIKpcbatQ+XqG22rR85zY6l995r1hBc/cDLIgvjXOGu1xWEmK3KASlfGFjw0pchj8liUegn1c5RfEnsvYffEK3P5ztuwF/hwfWR1H/cstn5cpQoXCryPf76jyxFEtmFW7mFZ4MH+OTIjCv4YRKFJinUfE5DloxteqBluIok+wsOJSuAkGxiLbzJuCtCjTRnbdazjsJBcDzx9XRe7J9
x-ms-exchange-antispam-messagedata: Zr/2F0z52iYiamCQnBy8+YTXPVRMKYnpvNKcowCEUCfIoH4WVzm3QGL1zBZq9Zl48DPQs+BFDf2EnkFEipMOQb01xQGmKGOMwdkREKsLvdVFkkDRmb9MK91gnOMStvLRC372wc9rKBLtqFPwFUBuQA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: stryker.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53559e6e-2cf7-4334-a515-08d7b3262b23
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2020 21:21:20.8620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AE5uBIBXh5ngCrEonNaKOdlhuvog+Y9Wk75MlFC+S7x/0Lm7t8UONtG5tewcxPM5EzFQPTecqohw5FxuPsOP7+L0IKgLR6BjR+geiHqS+XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5074
Subject: Fail to upgrade RPMs when IMA enabled
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
X-List-Received-Date: Sun, 16 Feb 2020 21:21:22 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BL0PR01MB4307700D50405B40B4B45BCB8F170BL0PR01MB4307prod_"

--_000_BL0PR01MB4307700D50405B40B4B45BCB8F170BL0PR01MB4307prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I've been trying to get the security stuff in meta-secure-core working so I=
 can upgrade from one version of the OS I'm creating, right now called Lewi=
sOS, to a new version, just by being able to run "rpm -U" or "dnf upgrade" =
commands.  I can run "dnf upgrade" successfully against non kernel related =
packages, but the kernel, initramfs and systemd-boot RPMs always fail with =
the same error, no matter what I try.

I am using Zeus for my builds.  I am using an older commit for LewisOS vers=
ion X, 8a518a2054bdd349d7661ee4872590fc8750313f, dated 2019 Dec 30, of the =
meta-secure-core GIT repo.  I am using 8302e3c479154157667e22e9d7c5461c966b=
4586, dated 2020 Jan 19, of the meta-secure-core GIT repo for LewisOS versi=
on Y.

My machine is intel-corei7-64.

I'll just stick with systemd-boot RPM for this email.  LewisOS version X in=
stalls systemd-boot-243+0+efb536d0cb-r0.corei7_64_intell_common.  LewisOS v=
ersion Y contains systemd-boot-243.2-r0.corei7_64_intel_common.  When I try=
 to upgrade systemd-boot, I get the following error message:

=3D=3D=3D Start upgrade messages =3D=3D=3D
root@intel-corei7-64:/var/opt/repos/os# rpm -q systemd-boot
systemd-boot-243+0+efb536d0cb-r0.corei7_64_intel_common
root@intel-corei7-64:/var/opt/repos/os# rpm -qp systemd-boot-243.2-r0.corei=
7_64_intel_common.rpm
systemd-boot-243.2-r0.corei7_64_intel_common
root@intel-corei7-64:/var/opt/repos/os# rpm -Uhv systemd-boot-243.2-r0.core=
i7_64_intel_common.rpm
Verifying...                          #####################################=
### [100%]
Preparing...                          #####################################=
### [100%]
Updating / installing...
   1:systemd-boot-243.2-r0          #######################################=
# [ 50%]
error: ima: could not apply signature on '/boot/EFI/BOOT/bootx64.efi;5e49ad=
05': Operation not supported
error: Plugin ima: hook fsm_file_prepare failed
error: unpacking of archive failed on file /boot/EFI/BOOT/bootx64.efi;5e49a=
d05: cpio: (error 0x2)
error: systemd-boot-243.2-r0.corei7_64_intel_common: install failed
error: systemd-boot-243+0+efb536d0cb-r0.corei7_64_intel_common: erase skipp=
ed
=3D=3D=3D End upgrade messages =3D=3D=3D


The above error messages also appear when I try updating kernel-image-bzima=
ge, kernel-initramfs and systemd-bootconf.

I have the following in my bblayers.conf file:

=3D=3D=3D Start bblayers.conf =3D=3D=3D
# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION =3D "7"

BBPATH =3D "${TOPDIR}"
BBFILES ?=3D ""

BBLAYERS ?=3D " \
  ${HOME}/meta-stryker/meta-lewisos-distro \
  ${HOME}/meta-stryker/meta-lewisos-common \
  ${HOME}/meta-stryker/meta-lewisos-edge \
  ${HOME}/oe-core/meta \
  ${HOME}/meta-openembedded/meta-python \
  ${HOME}/meta-openembedded/meta-perl \
  ${HOME}/meta-openembedded/meta-filesystems \
  ${HOME}/meta-openembedded/meta-oe \
  ${HOME}/meta-openembedded/meta-networking \
  ${HOME}/meta-openembedded/meta-webserver \
  ${HOME}/meta-intel \
  ${HOME}/meta-virtualization \
  ${HOME}/meta-cloud-services \
  ${HOME}/meta-cloud-services/meta-openstack \
  ${HOME}/meta-secure-core/meta \
  ${HOME}/meta-secure-core/meta-signing-key \
  ${HOME}/meta-secure-core/meta-tpm \
  ${HOME}/meta-secure-core/meta-tpm2 \
  ${HOME}/meta-secure-core/meta-efi-secure-boot \
  ${HOME}/meta-secure-core/meta-integrity \
  ${HOME}/meta-secure-core/meta-encrypted-storage \
  ${HOME}/meta-secure-core/meta-ids \
  ${HOME}/meta-secure-core/meta-intel-sgx \
  "
=3D=3D=3D End bblayers.conf =3D=3D=3D


Here is my local.conf file

=3D=3D=3D Start local.conf =3D=3D=3D
MACHINE ?=3D "intel-corei7-64"
DL_DIR ?=3D "/var/opt/openembedded-linux/downloads"
SSTATE_DIR ?=3D "/var/opt/openembedded-linux/sstate-cache"
PACKAGE_CLASSES ?=3D "package_rpm"

# Extra image configuration defaults
#
# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to th=
e generated
# images.
# There are other application targets that can be used here too, see
# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more d=
etails.
# We default to enabling the debugging tweaks.
EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"

USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
PATCHRESOLVE =3D "noop"
BB_DISKMON_DIRS ??=3D "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    STOPTASKS,/tmp,100M,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K \
    ABORT,/tmp,10M,1K"

PACKAGECONFIG_append_pn-qemu-native =3D " sdl"
PACKAGECONFIG_append_pn-nativesdk-qemu =3D " sdl"
CONF_VERSION =3D "1"

DISTRO =3D "lewisos"

# The following 2 lines are to generate an ISO.
IMAGE_FSTYPES +=3D "live"
NOISO =3D "0"

# The following line is needed to help address issues with updating the OS.
# It prevents a lot of messages regarding file/directory ownership issues.
DIRFILES =3D "1"

# The BBMASK directive below is to prevent the kernel-initramfs.bbappend
# from meta-secure-core from being used.  We have customized the bb file.
# So, don't want any changes to it.
BBMASK +=3D "meta-secure-core/meta-efi-secure-boot/recipes-core/images/kern=
el-initramfs.bbappend"

# INITRAMFS_IMAGE must be defined here.  It cannot be defined in an image
# recipe.  If it is only defined in an image recipe, the build fails to
# sign packages.
INITRAMFS_IMAGE =3D "secure-core-image-initramfs"

# Similarly, the kernel-image-bzimage must be defined here.  When it was
# set in the image recipe, got complaints about no buildable providers.
# Weird.
IMAGE_INSTALL +=3D "kernel-image-bzimage"

# These DISTRO_FEATURES must remain here.  When I tried to put them into
# the lewisos.conf distro configuration file, the build of the stryker-edge
# image failed.  Got old errors.  Apparently some of the bbappends were
# not picked up properly when these were defined in the distro config
# file.  Not sure why.
DISTRO_FEATURES_NATIVE_append +=3D "systemd ima tpm tpm2 efi-secure-boot lu=
ks"
DISTRO_FEATURES_append +=3D "systemd ima tpm tpm2 efi-secure-boot luks mods=
ign pam intel-sgx"

MACHINE_FEATURES_NATIVE_append +=3D "efi"
MACHINE_FEATURES_append +=3D "efi"
DEBUG_FLAGS_forcevariable =3D ""
USER_CLASSES_remove =3D "image-prelink"
=3D=3D=3D End local.conf =3D=3D=3D


Here is my lewisos.conf distro configuration file.

=3D=3D=3D Start lewisos.conf =3D=3D=3D
# Lewisos distribution configuration file
DISTRO =3D "lewisos"
DISTRO_NAME =3D "Lewis test distribution"
DISTRO_VERSION =3D "0.1.3-ou"
MAINTAINER =3D "mako.device@stryker.com"

IMAGE_VERSION_SUFFIX =3D "-${DISTRO_VERSION}"

# Want to use systemd as the init manager
DISTRO_FEATURES_append =3D " systemd"
VIRTUAL-RUNTIME_init_manager =3D "systemd"
VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"

# Need virtualization
DISTRO_FEATURES_append =3D " virtualization"

# Add support for wireless
DISTRO_FEATURES_append =3D " wifi"

# Add support for disk encryption, secure boot and access to TPM
# Needed for both the product build, and for native
# From the meta-secure-core layer
# DISTRO_FEATURES_append =3D " ima tpm tpm2 efi-secure-boot luks modsign pa=
m intel-sgx"
# DISTRO_FEATURES_NATIVE_append =3D " ima tpm tpm2 efi-secure-boot luks"

# Remove undesirable features
DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "nfs"
DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "zeroconf"

# Set up for signing RPMs
# Inherit the sign_rpm_ext and user-key-store classes from the meta-secure-=
core
# layer.  They provide some additional functionality.
# If not using the meta-secure-core layer, uncomment the sign_rpm line and
# comment out the sign_rpm_ext and user-key-store lines.
# INHERIT +=3D "sign_rpm"
INHERIT +=3D "sign_rpm_ext"
INHERIT +=3D "user-key-store"

# NOTE: The two RPM_GPG lines cannot have spaces in their values.  It cause=
s
# the build to fail since the scripts cannot handle the space.
RPM_GPG_NAME =3D "xxxxxxxx"
RPM_GPG_PASSPHRASE =3D "yyyyyyyy"
=3D=3D=3D End lewisos.conf =3D=3D=3D


And here is my bbappend for linux-intel

=3D=3D=3D Start linux-intel_%.bbappend =3D=3D=3D
FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
SRC_URI +=3D "file://kernel_baseline.scc"
KERNEL_IMAGEDEST =3D "boot/${DISTRO}-${DISTRO_VERSION}"

FILES_kernel-image-bzimage =3D "/boot/${PV}/bzImage-${KERNEL_VERSION_NAME}"

python do_package_prepend () {
    os.remove(d.getVar('D') + '/' + d.getVar('KERNEL_IMAGEDEST') + '/bzImag=
e')
}

require recipes-kernel/linux/linux-yocto-integrity.inc
=3D=3D=3D End linux-intel_%.bbappend =3D=3D=3D


I'm removing symbolic links and putting the kernel and initramfs in version=
 specific directories because the /boot partition is vfat, which doesn't su=
pport symbolic links, and if I kept the names as something like bzImage, th=
en "dnf upgrade" would complain about multiple RPMs trying to own the same =
file.

What am I missing?  Where did I make a mistake?  Does the meta-secure-core,=
 or Openembedded/Yocto in general support upgrading from version X to versi=
on Y of an OS using just some command like "dnf upgrade"?

If you need more information, please let me know.

As one last piece of info, if I remove "ima" from DISTRO_FEATURES, the buil=
d hangs when trying to sign the RPMs.

Thank you

Lewis Muhlenkamp

Follow this link to read our Privacy Statement<https://www.stryker.com/cont=
ent/stryker/gb/en/legal/global-policy-statement.html/>

--_000_BL0PR01MB4307700D50405B40B4B45BCB8F170BL0PR01MB4307prod_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ve been trying to get the security stuff in =
meta-secure-core working so I can upgrade from one version of the OS I&#821=
7;m creating, right now called LewisOS, to a new version, just by being abl=
e to run &#8220;rpm -U&#8221; or &#8220;dnf upgrade&#8221; commands. &nbsp;=
I
 can run &#8220;dnf upgrade&#8221; successfully against non kernel related =
packages, but the kernel, initramfs and systemd-boot RPMs always fail with =
the same error, no matter what I try.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am using Zeus for my builds.&nbsp; I am using an o=
lder commit for LewisOS version X, 8a518a2054bdd349d7661ee4872590fc8750313f=
, dated 2019 Dec 30, of the meta-secure-core GIT repo.&nbsp; I am using 830=
2e3c479154157667e22e9d7c5461c966b4586, dated
 2020 Jan 19, of the meta-secure-core GIT repo for LewisOS version Y.<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My machine is intel-corei7-64.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ll just stick with systemd-boot RPM for this=
 email.&nbsp; LewisOS version X installs systemd-boot-243&#43;0&#43;efb536d=
0cb-r0.corei7_64_intell_common.&nbsp; LewisOS version Y contains systemd-bo=
ot-243.2-r0.corei7_64_intel_common.&nbsp; When I try to upgrade
 systemd-boot, I get the following error message:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D Start upgrade messages =3D=3D=3D<o:p></o:p=
></p>
<p class=3D"MsoNormal">root@intel-corei7-64:/var/opt/repos/os# rpm -q syste=
md-boot<o:p></o:p></p>
<p class=3D"MsoNormal">systemd-boot-243&#43;0&#43;efb536d0cb-r0.corei7_64_i=
ntel_common<o:p></o:p></p>
<p class=3D"MsoNormal">root@intel-corei7-64:/var/opt/repos/os# rpm -qp syst=
emd-boot-243.2-r0.corei7_64_intel_common.rpm<o:p></o:p></p>
<p class=3D"MsoNormal">systemd-boot-243.2-r0.corei7_64_intel_common<o:p></o=
:p></p>
<p class=3D"MsoNormal">root@intel-corei7-64:/var/opt/repos/os# rpm -Uhv sys=
temd-boot-243.2-r0.corei7_64_intel_common.rpm<o:p></o:p></p>
<p class=3D"MsoNormal">Verifying&#8230;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ###################################=
##### [100%]<o:p></o:p></p>
<p class=3D"MsoNormal">Preparing&#8230;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ###################################=
##### [100%]<o:p></o:p></p>
<p class=3D"MsoNormal">Updating / installing&#8230;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; 1:systemd-boot-243.2-r0&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ####################################=
#### [ 50%]<o:p></o:p></p>
<p class=3D"MsoNormal">error: ima: could not apply signature on &#8216;/boo=
t/EFI/BOOT/bootx64.efi;5e49ad05&#8217;: Operation not supported<o:p></o:p><=
/p>
<p class=3D"MsoNormal">error: Plugin ima: hook fsm_file_prepare failed<o:p>=
</o:p></p>
<p class=3D"MsoNormal">error: unpacking of archive failed on file /boot/EFI=
/BOOT/bootx64.efi;5e49ad05: cpio: (error 0x2)<o:p></o:p></p>
<p class=3D"MsoNormal">error: systemd-boot-243.2-r0.corei7_64_intel_common:=
 install failed<o:p></o:p></p>
<p class=3D"MsoNormal">error: systemd-boot-243&#43;0&#43;efb536d0cb-r0.core=
i7_64_intel_common: erase skipped<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D End upgrade messages =3D=3D=3D<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The above error messages also appear when I try upda=
ting kernel-image-bzimage, kernel-initramfs and systemd-bootconf.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have the following in my bblayers.conf file:<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D Start bblayers.conf =3D=3D=3D<o:p></o:p></=
p>
<p class=3D"MsoNormal"># LAYER_CONF_VERSION is increased each time build/co=
nf/bblayers.conf<o:p></o:p></p>
<p class=3D"MsoNormal"># changes incompatibly<o:p></o:p></p>
<p class=3D"MsoNormal">LCONF_VERSION =3D &quot;7&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BBPATH =3D &quot;${TOPDIR}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">BBFILES ?=3D &quot;&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BBLAYERS ?=3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-stryker/meta-lewisos-distro \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-stryker/meta-lewisos-common \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-stryker/meta-lewisos-edge \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/oe-core/meta \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-python \<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-perl \<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-filesystems \<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-oe \<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-networking \<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-openembedded/meta-webserver \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-intel \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-virtualization \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-cloud-services \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-cloud-services/meta-openstack \<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-secure-core/meta \<o:p></o:p></p=
>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-secure-core/meta-signing-key \<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-secure-core/meta-tpm \<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-secure-core/meta-tpm2 \<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-secure-core/meta-efi-secure-boot=
 \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-secure-core/meta-integrity \<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-secure-core/meta-encrypted-stora=
ge \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-secure-core/meta-ids \<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp; ${HOME}/meta-secure-core/meta-intel-sgx \<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D End bblayers.conf =3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here is my local.conf file<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D Start local.conf =3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal">MACHINE ?=3D &quot;intel-corei7-64&quot;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">DL_DIR ?=3D &quot;/var/opt/openembedded-linux/downlo=
ads&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">SSTATE_DIR ?=3D &quot;/var/opt/openembedded-linux/ss=
tate-cache&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">PACKAGE_CLASSES ?=3D &quot;package_rpm&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># Extra image configuration defaults<o:p></o:p></p>
<p class=3D"MsoNormal">#<o:p></o:p></p>
<p class=3D"MsoNormal"># The EXTRA_IMAGE_FEATURES variable allows extra pac=
kages to be added to the generated<o:p></o:p></p>
<p class=3D"MsoNormal"># images.<o:p></o:p></p>
<p class=3D"MsoNormal"># There are other application targets that can be us=
ed here too, see<o:p></o:p></p>
<p class=3D"MsoNormal"># meta/classes/image.bbclass and meta/classes/core-i=
mage.bbclass for more details.<o:p></o:p></p>
<p class=3D"MsoNormal"># We default to enabling the debugging tweaks.<o:p><=
/o:p></p>
<p class=3D"MsoNormal">EXTRA_IMAGE_FEATURES ?=3D &quot;debug-tweaks&quot;<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">USER_CLASSES ?=3D &quot;buildstats image-mklibs imag=
e-prelink&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">PATCHRESOLVE =3D &quot;noop&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">BB_DISKMON_DIRS ??=3D &quot;\<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; STOPTASKS,${TMPDIR},1G,100K \<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; STOPTASKS,${DL_DIR},1G,100K \<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; STOPTASKS,${SSTATE_DIR},1G,100K \=
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; STOPTASKS,/tmp,100M,100K \<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; ABORT,${TMPDIR},100M,1K \<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; ABORT,${DL_DIR},100M,1K \<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; ABORT,${SSTATE_DIR},100M,1K \<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; ABORT,/tmp,10M,1K&quot;<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">PACKAGECONFIG_append_pn-qemu-native =3D &quot; sdl&q=
uot;<o:p></o:p></p>
<p class=3D"MsoNormal">PACKAGECONFIG_append_pn-nativesdk-qemu =3D &quot; sd=
l&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">CONF_VERSION =3D &quot;1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">DISTRO =3D &quot;lewisos&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># The following 2 lines are to generate an ISO.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">IMAGE_FSTYPES &#43;=3D &quot;live&quot;<o:p></o:p></=
p>
<p class=3D"MsoNormal">NOISO =3D &quot;0&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># The following line is needed to help address issue=
s with updating the OS.<o:p></o:p></p>
<p class=3D"MsoNormal"># It prevents a lot of messages regarding file/direc=
tory ownership issues.<o:p></o:p></p>
<p class=3D"MsoNormal">DIRFILES =3D &quot;1&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># The BBMASK directive below is to prevent the kerne=
l-initramfs.bbappend<o:p></o:p></p>
<p class=3D"MsoNormal"># from meta-secure-core from being used.&nbsp; We ha=
ve customized the bb file.<o:p></o:p></p>
<p class=3D"MsoNormal"># So, don't want any changes to it.<o:p></o:p></p>
<p class=3D"MsoNormal">BBMASK &#43;=3D &quot;meta-secure-core/meta-efi-secu=
re-boot/recipes-core/images/kernel-initramfs.bbappend&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># INITRAMFS_IMAGE must be defined here.&nbsp; It can=
not be defined in an image<o:p></o:p></p>
<p class=3D"MsoNormal"># recipe.&nbsp; If it is only defined in an image re=
cipe, the build fails to<o:p></o:p></p>
<p class=3D"MsoNormal"># sign packages.<o:p></o:p></p>
<p class=3D"MsoNormal">INITRAMFS_IMAGE =3D &quot;secure-core-image-initramf=
s&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># Similarly, the kernel-image-bzimage must be define=
d here.&nbsp; When it was<o:p></o:p></p>
<p class=3D"MsoNormal"># set in the image recipe, got complaints about no b=
uildable providers.<o:p></o:p></p>
<p class=3D"MsoNormal"># Weird.<o:p></o:p></p>
<p class=3D"MsoNormal">IMAGE_INSTALL &#43;=3D &quot;kernel-image-bzimage&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># These DISTRO_FEATURES must remain here.&nbsp; When=
 I tried to put them into<o:p></o:p></p>
<p class=3D"MsoNormal"># the lewisos.conf distro configuration file, the bu=
ild of the stryker-edge<o:p></o:p></p>
<p class=3D"MsoNormal"># image failed.&nbsp; Got old errors.&nbsp; Apparent=
ly some of the bbappends were<o:p></o:p></p>
<p class=3D"MsoNormal"># not picked up properly when these were defined in =
the distro config<o:p></o:p></p>
<p class=3D"MsoNormal"># file.&nbsp; Not sure why.<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_NATIVE_append &#43;=3D &quot;systemd=
 ima tpm tpm2 efi-secure-boot luks&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append &#43;=3D &quot;systemd ima tp=
m tpm2 efi-secure-boot luks modsign pam intel-sgx&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">MACHINE_FEATURES_NATIVE_append &#43;=3D &quot;efi&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoNormal">MACHINE_FEATURES_append &#43;=3D &quot;efi&quot;<o:p=
></o:p></p>
<p class=3D"MsoNormal">DEBUG_FLAGS_forcevariable =3D &quot;&quot;<o:p></o:p=
></p>
<p class=3D"MsoNormal">USER_CLASSES_remove =3D &quot;image-prelink&quot;<o:=
p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D End local.conf =3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here is my lewisos.conf distro configuration file.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D Start lewisos.conf =3D=3D=3D<o:p></o:p></p=
>
<p class=3D"MsoNormal"># Lewisos distribution configuration file<o:p></o:p>=
</p>
<p class=3D"MsoNormal">DISTRO =3D &quot;lewisos&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_NAME =3D &quot;Lewis test distribution&quot;<=
o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_VERSION =3D &quot;0.1.3-ou&quot;<o:p></o:p></=
p>
<p class=3D"MsoNormal">MAINTAINER =3D &quot;mako.device@stryker.com&quot;<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">IMAGE_VERSION_SUFFIX =3D &quot;-${DISTRO_VERSION}&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># Want to use systemd as the init manager<o:p></o:p>=
</p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; systemd&quot;<o:p>=
</o:p></p>
<p class=3D"MsoNormal">VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;=
<o:p></o:p></p>
<p class=3D"MsoNormal">VIRTUAL-RUNTIME_initscripts =3D &quot;systemd-compat=
-units&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># Need virtualization<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; virtualization&quo=
t;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># Add support for wireless<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; wifi&quot;<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># Add support for disk encryption, secure boot and a=
ccess to TPM<o:p></o:p></p>
<p class=3D"MsoNormal"># Needed for both the product build, and for native<=
o:p></o:p></p>
<p class=3D"MsoNormal"># From the meta-secure-core layer<o:p></o:p></p>
<p class=3D"MsoNormal"># DISTRO_FEATURES_append =3D &quot; ima tpm tpm2 efi=
-secure-boot luks modsign pam intel-sgx&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"># DISTRO_FEATURES_NATIVE_append =3D &quot; ima tpm t=
pm2 efi-secure-boot luks&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># Remove undesirable features<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_BACKFILL_CONSIDERED &#43;=3D &quot;n=
fs&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_BACKFILL_CONSIDERED &#43;=3D &quot;s=
ysvinit&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_BACKFILL_CONSIDERED &#43;=3D &quot;z=
eroconf&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># Set up for signing RPMs<o:p></o:p></p>
<p class=3D"MsoNormal"># Inherit the sign_rpm_ext and user-key-store classe=
s from the meta-secure-core<o:p></o:p></p>
<p class=3D"MsoNormal"># layer.&nbsp; They provide some additional function=
ality.<o:p></o:p></p>
<p class=3D"MsoNormal"># If not using the meta-secure-core layer, uncomment=
 the sign_rpm line and<o:p></o:p></p>
<p class=3D"MsoNormal"># comment out the sign_rpm_ext and user-key-store li=
nes.<o:p></o:p></p>
<p class=3D"MsoNormal"># INHERIT &#43;=3D &quot;sign_rpm&quot;<o:p></o:p></=
p>
<p class=3D"MsoNormal">INHERIT &#43;=3D &quot;sign_rpm_ext&quot;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">INHERIT &#43;=3D &quot;user-key-store&quot;<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"># NOTE: The two RPM_GPG lines cannot have spaces in =
their values.&nbsp; It causes<o:p></o:p></p>
<p class=3D"MsoNormal"># the build to fail since the scripts cannot handle =
the space.<o:p></o:p></p>
<p class=3D"MsoNormal">RPM_GPG_NAME =3D &quot;xxxxxxxx&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">RPM_GPG_PASSPHRASE =3D &quot;yyyyyyyy&quot;<o:p></o:=
p></p>
<p class=3D"MsoNormal">=3D=3D=3D End lewisos.conf =3D=3D=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And here is my bbappend for linux-intel<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D Start linux-intel_%.bbappend =3D=3D=3D<o:p=
></o:p></p>
<p class=3D"MsoNormal">FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:=
&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">SRC_URI &#43;=3D &quot;file://kernel_baseline.scc&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoNormal">KERNEL_IMAGEDEST =3D &quot;boot/${DISTRO}-${DISTRO_V=
ERSION}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">FILES_kernel-image-bzimage =3D &quot;/boot/${PV}/bzI=
mage-${KERNEL_VERSION_NAME}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">python do_package_prepend () {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; os.remove(d.getVar('D') &#43; '/'=
 &#43; d.getVar('KERNEL_IMAGEDEST') &#43; '/bzImage')<o:p></o:p></p>
<p class=3D"MsoNormal">}<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">require recipes-kernel/linux/linux-yocto-integrity.i=
nc<o:p></o:p></p>
<p class=3D"MsoNormal">=3D=3D=3D End linux-intel_%.bbappend =3D=3D=3D<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m removing symbolic links and putting the ke=
rnel and initramfs in version specific directories because the /boot partit=
ion is vfat, which doesn&#8217;t support symbolic links, and if I kept the =
names as something like bzImage, then &#8220;dnf upgrade&#8221;
 would complain about multiple RPMs trying to own the same file.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What am I missing?&nbsp; Where did I make a mistake?=
&nbsp; Does the meta-secure-core, or Openembedded/Yocto in general support =
upgrading from version X to version Y of an OS using just some command like=
 &#8220;dnf upgrade&#8221;?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If you need more information, please let me know.<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As one last piece of info, if I remove &#8220;ima&#8=
221; from DISTRO_FEATURES, the build hangs when trying to sign the RPMs.<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Lewis Muhlenkamp<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
Follow this link to read our <a href=3D"https://www.stryker.com/content/str=
yker/gb/en/legal/global-policy-statement.html/">
Privacy Statement</a>
</body>
</html>

--_000_BL0PR01MB4307700D50405B40B4B45BCB8F170BL0PR01MB4307prod_--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id E445B7316D;
	Wed,  1 Jun 2016 11:06:07 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id a20so21884960wma.1;
	Wed, 01 Jun 2016 04:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ffB2iJ3RHa28ufVUiaGJ/T5zXJ6x2CNUyJQTfJAPLSk=;
	b=LcSEsX+i8W3VTCnz1NR47QajR5cj1VRC9q2iT1cWc1npoDs7iWgq34CE45lVnI2ssv
	XbcWmk23M6ElhwjqmdQKOR7IbmZRiQNUeJarAEo60M4wXPXUkkGCU0AloAvFLubQHuzg
	HvrXmv7g80qeTqwZIidvnsLK5YS9lplU9KmYqNvXkOGYFvPsqquFfozjVFBD3jIkZqTd
	XI0s7I4t2/EflLBb3XYePi9apdPe351emuOeeYqYO/1GkmeAo1+Y85Hmz4rKsq6EgwPk
	eTZvikjtqMWm04gcEQHlsXDPmtv1ukRzDa4c6QkRH7qsrgQdAzzPSJ+l1vlfx+O+X6EA
	JYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ffB2iJ3RHa28ufVUiaGJ/T5zXJ6x2CNUyJQTfJAPLSk=;
	b=Cd1IlZuBViz/gXRoYtMqcYWcSN6TQW5HGFTII40n6K0p3pOFS3GfSgrimI3LTbrsII
	essxn2yaGcq3t7vru1EEID8TJtkx0S4exkLcz+P9fy+naUNuuQgSC6N4eGK8s0djbLyw
	seIWj+roXZNnUZ1O8t02Ii4UUGlkSHa8qG3hXC0QftpzdCv+0C2dvAL8SCmh/ECY5Ekx
	7b5qeDIfXxNMtIHPM6L9+iKmyVyEtEqpLdt9+mdMaxAPmNtaogFJYJYmiA5sUTk3zZgH
	ffbX5ufu5t/58+aFT19TFb3+ldJNYANwvsGFPZ6X3MhXkXfmutpx+nKRNez5QXgOogI5
	N+Qw==
X-Gm-Message-State: ALyK8tLO40JQqZJTrVJ3eAMyHfaBKJsRfqLmPAwhZu4lEXnGsE/mbCqTYbKY16vDezpAoB5QgGySx8wy7pD+cw==
MIME-Version: 1.0
X-Received: by 10.28.88.206 with SMTP id m197mr2921452wmb.43.1464779168168;
	Wed, 01 Jun 2016 04:06:08 -0700 (PDT)
Received: by 10.194.64.101 with HTTP; Wed, 1 Jun 2016 04:06:08 -0700 (PDT)
In-Reply-To: <20160530150145.6341.71576@opal.openembedded.org>
References: <20160530150145.6341.71576@opal.openembedded.org>
Date: Wed, 1 Jun 2016 13:06:08 +0200
Message-ID: <CA+chaQeoERJhi2gUNOReHVWpjM_pzcQj6NYqW6Qy_Jsm7-7uAQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] branch master updated (bb4ead9 -> b746223)
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
X-List-Received-Date: Wed, 01 Jun 2016 11:06:11 -0000
Content-Type: multipart/alternative; boundary=001a11442b46fe454405343579cc

--001a11442b46fe454405343579cc
Content-Type: text/plain; charset=UTF-8

On Mon, May 30, 2016 at 5:01 PM, <git@git.openembedded.org> wrote:

> rpurdie pushed a change to branch master
> in repository openembedded-core.
>
> ....

>       adds  ac512ff   libpam: update to 1.3.0
>
.....

Maxim, you might want to check dependencies of libpam.

In my bbappend for 1.2.1 (which still seems to be needed for 1.3.0):

 # Replace bison with bison-native, configure only checks for ac_prog
# configure:for ac_prog in 'bison -y' byacc
# add libxml2-native for deterministic build (it detects xmlcatalog and
xmllint)
DEPENDS = "bison-native flex flex-native cracklib libxml2-native"

    :Release Notes:
   Configure script is checking only for bison binary, libpam itself
   doesn't need target bison (only target flex).

   :Detailed Notes:
   Removes unnecessary GPLv3 dependency. libxml2-native dependency has no
   impact on built files, but configure is detecting it, causing this
   difference between builds:
   292c292
   < checking for xmllint... /bin/true



....
>


> The 6 revisions listed above as "new" are entirely new to this
> repository and will be described in separate emails.  The revisions
> listed as "adds" were already present in the repository and have only
> been added to this reference.
>
>
> Summary of changes:
>  meta/classes/gobject-introspection.bbclass         |  14 +-
>  meta/classes/grub-efi.bbclass                      |   2 +
>  meta/classes/gummiboot.bbclass                     |   2 +
>  meta/classes/kernel-fitimage.bbclass               |  20 ++-
>  meta/classes/kernel-grub.bbclass                   |  44 +++--
>  meta/classes/kernel-uimage.bbclass                 |  10 +-
>  meta/classes/kernel.bbclass                        | 187
> +++++++++++++++------
>  meta/classes/mirrors.bbclass                       |   8 +-
>  meta/classes/nopackages.bbclass                    |   6 +
>  meta/classes/npm.bbclass                           |  13 +-
>  meta/classes/sanity.bbclass                        |  13 ++
>  meta/classes/testexport.bbclass                    |   4 -
>  meta/classes/uboot-sign.bbclass                    |   8 +-
>  meta/conf/bitbake.conf                             |   2 +
>  meta/conf/distro/include/tcmode-default.inc        |   2 +-
>  meta/conf/documentation.conf                       |   3 +-
>  meta/conf/layer.conf                               |   1 +
>  meta/lib/oe/package_manager.py                     |  41 +++--
>  meta/lib/oeqa/oetest.py                            | 165
> ++++++++++++++++--
>  meta/lib/oeqa/utils/package_manager.py             |  29 ++++
>  meta/recipes-bsp/u-boot/u-boot.inc                 |  60 +++----
>  .../dhcp/dhcp/libxml2-configure-argument.patch     |  27 +++
>  meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb       |   4 +
>  meta/recipes-core/bsd-headers/bsd-headers.bb       |   2 +-
>  .../coreutils-8.25/disable-ls-output-quoting.patch |  49 ++++++
>  meta/recipes-core/coreutils/coreutils_8.25.bb      |   1 +
>  meta/recipes-core/dropbear/dropbear.inc            |   1 -
>  meta/recipes-core/fts/fts.bb                       |   2 +-
>  .../initscripts/initscripts-1.0/checkroot.sh       |   2 +-
>  .../initscripts/initscripts-1.0/mountall.sh        |   2 +-
>  .../initscripts/initscripts-1.0/umountfs           |   2 +-
>  meta/recipes-core/meta/signing-keys.bb             |   2 +-
>  .../docbook-xsl-stylesheets/docbook-xsl.xml        |   4 +-
>  ...1.78.1.bb => docbook-xsl-stylesheets_1.79.1.bb} |  22 +--
>  meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
>  .../0061-nios2-Make-assert-less-restrictive.patch  |  35 ++++
>  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb        |   4 +-
>  meta/recipes-extended/cpio/cpio_v2.inc             |   2 +
>  .../diffutils/diffutils-2.8.1/fix_gcc6.patch       |  31 ++++
>  meta/recipes-extended/diffutils/diffutils_2.8.1.bb |   3 +-
>  .../ghostscript/ghostscript_9.18.bb                |   2 +
>  .../msmtp/{msmtp_1.6.3.bb => msmtp_1.6.4.bb}       |   4 +-
>  .../pam/libpam/crypt_configure.patch               |  37 ++--
>  .../pam/libpam/pam-no-innetgr.patch                |  97 -----------
>  .../pam/libpam/pam-unix-nullok-secure.patch        | 119 ++++---------
>  .../pam/{libpam_1.2.1.bb => libpam_1.3.0.bb}       |  10 +-
>  .../gcr/{gcr_3.18.0.bb => gcr_3.20.0.bb}           |   4 +-
>  .../gobject-introspection_1.46.0.bb                |   3 +-
>  .../gtk+/{gtk+_2.24.29.bb => gtk+_2.24.30.bb}      |   4 +-
>  .../{libsecret_0.18.4.bb => libsecret_0.18.5.bb}   |   4 +-
>  .../0001-build-Use-AC_COMPILE_IFELSE.patch         | 105 ------------
>  ...clutter-1.0_1.24.2.bb => clutter-1.0_1.26.0.bb} |   5 +-
>  ...gst-3.0_3.0.16.bb => clutter-gst-3.0_3.0.18.bb} |   4 +-
>  .../jpeg/libjpeg-turbo_8d+1.4.2.bb                 |   1 +
>  .../xorg-lib/{libxcb_1.11.1.bb => libxcb_1.12.bb}  |   4 +-
>  meta/recipes-graphics/xorg-proto/xcb-proto_1.11.bb |   9 -
>  .../{xcb-proto.inc => xcb-proto_1.12.bb}           |   6 +-
>  meta/recipes-graphics/xorg-proto/xcb-proto_git.bb  |   9 -
>  .../linux-firmware/linux-firmware_git.bb           |   8 +-
>  meta/recipes-kernel/linux/linux-dtb.inc            |  49 +++---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |   4 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   6 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |   4 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |   4 +-
>  meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb       |  18 +-
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  18 +-
>  .../{babeltrace_1.3.1.bb => babeltrace_1.3.2.bb}   |   2 +-
>  .../argp-standalone/argp-standalone_1.3.bb         |   2 +-
>  .../ca-certificates/ca-certificates_20160104.bb    |   2 +
>  meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   2 +-
>  meta/recipes-support/gnupg/gnupg_2.1.11.bb         |   3 +-
>  meta/recipes-support/gpgme/gpgme_1.6.0.bb          |   3 +-
>  meta/recipes-support/libassuan/libassuan_2.4.2.bb  |   3 +-
>  .../{libevdev_1.4.6.bb => libevdev_1.5.1.bb}       |   4 +-
>  meta/recipes-support/libgcrypt/libgcrypt.inc       |   3 +-
>  .../0001-libgpg-error-Add-nios2-support.patch      |  46 -----
>  .../{libgpg-error_1.21.bb => libgpg-error_1.22.bb} |  12 +-
>  meta/recipes-support/libksba/libksba_1.3.3.bb      |   3 +-
>  .../liburcu/{liburcu_0.9.1.bb => liburcu_0.9.2.bb} |   4 +-
>  meta/recipes-support/npth/npth_1.2.bb              |   3 +-
>  meta/recipes-support/pinentry/pinentry_0.9.2.bb    |   3 +-
>  scripts/lib/wic/plugins/source/bootimg-efi.py      |   5 +
>  83 files changed, 830 insertions(+), 640 deletions(-)
>  create mode 100644 meta/lib/oeqa/utils/package_manager.py
>  create mode 100644
> meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch
>  create mode 100644
> meta/recipes-core/coreutils/coreutils-8.25/disable-ls-output-quoting.patch
>  rename meta/recipes-devtools/docbook-xml/{
> docbook-xsl-stylesheets_1.78.1.bb => docbook-xsl-stylesheets_1.79.1.bb}
> (76%)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch
>  create mode 100644
> meta/recipes-extended/diffutils/diffutils-2.8.1/fix_gcc6.patch
>  rename meta/recipes-extended/msmtp/{msmtp_1.6.3.bb => msmtp_1.6.4.bb}
> (86%)
>  delete mode 100644 meta/recipes-extended/pam/libpam/pam-no-innetgr.patch
>  rename meta/recipes-extended/pam/{libpam_1.2.1.bb => libpam_1.3.0.bb}
> (94%)
>  rename meta/recipes-gnome/gcr/{gcr_3.18.0.bb => gcr_3.20.0.bb} (89%)
>  rename meta/recipes-gnome/gtk+/{gtk+_2.24.29.bb => gtk+_2.24.30.bb} (91%)
>  rename meta/recipes-gnome/libsecret/{libsecret_0.18.4.bb =>
> libsecret_0.18.5.bb} (84%)
>  delete mode 100644
> meta/recipes-graphics/clutter/clutter-1.0/0001-build-Use-AC_COMPILE_IFELSE.patch
>  rename meta/recipes-graphics/clutter/{clutter-1.0_1.24.2.bb =>
> clutter-1.0_1.26.0.bb} (52%)
>  rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.16.bb =>
> clutter-gst-3.0_3.0.18.bb} (58%)
>  rename meta/recipes-graphics/xorg-lib/{libxcb_1.11.1.bb => libxcb_1.12.bb}
> (89%)
>  delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto_1.11.bb
>  rename meta/recipes-graphics/xorg-proto/{xcb-proto.inc =>
> xcb-proto_1.12.bb} (71%)
>  delete mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto_git.bb
>  rename meta/recipes-kernel/lttng/{babeltrace_1.3.1.bb =>
> babeltrace_1.3.2.bb} (93%)
>  rename meta/recipes-support/libevdev/{libevdev_1.4.6.bb =>
> libevdev_1.5.1.bb} (74%)
>  delete mode 100644
> meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch
>  rename meta/recipes-support/libgpg-error/{libgpg-error_1.21.bb =>
> libgpg-error_1.22.bb} (74%)
>  rename meta/recipes-support/liburcu/{liburcu_0.9.1.bb => liburcu_0.9.2.bb}
> (83%)
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--001a11442b46fe454405343579cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, May 30, 2016 at 5:01 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:git@g=
it.openembedded.org" target=3D"_blank">git@git.openembedded.org</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">rpurdie pushed a change to branch master<br>
in repository openembedded-core.<br>
<br></blockquote><div>....=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;border-left-color:rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0=
 adds=C2=A0 ac512ff=C2=A0 =C2=A0libpam: update to 1.3.0<br></blockquote><di=
v>.....</div><div><br></div><div>Maxim, you might want to check dependencie=
s of libpam.</div><div><br></div><div>In my bbappend for 1.2.1 (which still=
 seems to be needed for 1.3.0):</div><div><br></div><div>=C2=A0<span style=
=3D"color:rgb(0,0,0);font-family:monospace"># Replace bison with bison-nati=
ve, configure only checks for ac_prog=C2=A0</span><br></div><span style=3D"=
font-family:monospace"># configure:for ac_prog in &#39;bison -y&#39; byacc
<br># add libxml2-native for deterministic build (it detects xmlcatalog and=
 xmllint)
<br>DEPENDS =3D &quot;bison-native flex flex-native cracklib libxml2-native=
&quot;<br>
<br></span><span style=3D"font-family:monospace"><span style=3D"color:rgb(0=
,0,0)">=C2=A0 =C2=A0 :Release Notes:
</span><br> =C2=A0=C2=A0=C2=A0Configure script is checking only for bison b=
inary, libpam itself
<br> =C2=A0=C2=A0=C2=A0doesn&#39;t need target bison (only target flex).
<br> =C2=A0=C2=A0=C2=A0=C2=A0<br> =C2=A0=C2=A0=C2=A0:Detailed Notes:
<br> =C2=A0=C2=A0=C2=A0Removes unnecessary GPLv3 dependency. libxml2-native=
 dependency has no
<br> =C2=A0=C2=A0=C2=A0impact on built files, but configure is detecting it=
, causing this
<br> =C2=A0=C2=A0=C2=A0difference between builds:
<br> =C2=A0=C2=A0=C2=A0292c292
<br> =C2=A0=C2=A0=C2=A0&lt; checking for xmllint... /bin/true<br>
<br></span><span style=3D"font-family:monospace"><br><br></span><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left=
:1ex">....<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
The 6 revisions listed above as &quot;new&quot; are entirely new to this<br=
>
repository and will be described in separate emails.=C2=A0 The revisions<br=
>
listed as &quot;adds&quot; were already present in the repository and have =
only<br>
been added to this reference.<br>
<br>
<br>
Summary of changes:<br>
=C2=A0meta/classes/gobject-introspection.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 14 +-<br>
=C2=A0meta/classes/grub-efi.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta/classes/gummiboot.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 ++-<br>
=C2=A0meta/classes/kernel-grub.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 44 +++--<br>
=C2=A0meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 187 +++++++++++++++------<br>
=C2=A0meta/classes/mirrors.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0meta/classes/nopackages.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0meta/classes/npm.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +-<br>
=C2=A0meta/classes/sanity.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 ++<br>
=C2=A0meta/classes/testexport.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 -<br>
=C2=A0meta/classes/uboot-sign.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 =
+<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0meta/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0meta/lib/oe/package_manager.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 41 +++--<br>
=C2=A0meta/lib/oeqa/oetest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 165 ++++++++++++++++=
--<br>
=C2=A0meta/lib/oeqa/utils/package_manager.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 29 ++++<br>
=C2=A0meta/recipes-bsp/u-boot/u-boot.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 60 +++----<br>
=C2=A0.../dhcp/dhcp/libxml2-configure-argument.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 27 +++<br>
=C2=A0meta/recipes-connectivity/dhcp/<a href=3D"http://dhcp_4.3.3.bb" rel=
=3D"noreferrer" target=3D"_blank">dhcp_4.3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +<br>
=C2=A0meta/recipes-core/bsd-headers/<a href=3D"http://bsd-headers.bb" rel=
=3D"noreferrer" target=3D"_blank">bsd-headers.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../coreutils-8.25/disable-ls-output-quoting.patch |=C2=A0 49 ++++++<=
br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.25.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.25.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-core/dropbear/dropbear.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
=C2=A0meta/recipes-core/fts/<a href=3D"http://fts.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">fts.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../initscripts/initscripts-1.0/checkroot.sh=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../initscripts/initscripts-1.0/mountall.sh=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../initscripts/initscripts-1.0/umountfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://signing-keys.bb" rel=3D"nore=
ferrer" target=3D"_blank">signing-keys.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../docbook-xsl-stylesheets/docbook-xsl.xml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0...<a href=3D"http://1.78.1.bb" rel=3D"noreferrer" target=3D"_blank">=
1.78.1.bb</a> =3D&gt; <a href=3D"http://docbook-xsl-stylesheets_1.79.1.bb" =
rel=3D"noreferrer" target=3D"_blank">docbook-xsl-stylesheets_1.79.1.bb</a>}=
 |=C2=A0 22 +--<br>
=C2=A0meta/recipes-devtools/gcc/gcc-5.3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../0061-nios2-Make-assert-less-restrictive.patch=C2=A0 |=C2=A0 35 ++=
++<br>
=C2=A0meta/recipes-devtools/xmlto/<a href=3D"http://xmlto_0.0.28.bb" rel=3D=
"noreferrer" target=3D"_blank">xmlto_0.0.28.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-extended/cpio/cpio_v2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../diffutils/diffutils-2.8.1/fix_gcc6.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 31 ++++<br>
=C2=A0meta/recipes-extended/diffutils/<a href=3D"http://diffutils_2.8.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">diffutils_2.8.1.bb</a> |=C2=A0 =C2=A0=
3 +-<br>
=C2=A0.../ghostscript/<a href=3D"http://ghostscript_9.18.bb" rel=3D"norefer=
rer" target=3D"_blank">ghostscript_9.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../msmtp/{<a href=3D"http://msmtp_1.6.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">msmtp_1.6.3.bb</a> =3D&gt; <a href=3D"http://msmtp_1.6.4.bb" r=
el=3D"noreferrer" target=3D"_blank">msmtp_1.6.4.bb</a>}=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../pam/libpam/crypt_configure.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 37 ++--<br>
=C2=A0.../pam/libpam/pam-no-innetgr.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 97 -----------<br>
=C2=A0.../pam/libpam/pam-unix-nullok-secure.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 119 ++++---------<br>
=C2=A0.../pam/{<a href=3D"http://libpam_1.2.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libpam_1.2.1.bb</a> =3D&gt; <a href=3D"http://libpam_1.3.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libpam_1.3.0.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0.../gcr/{<a href=3D"http://gcr_3.18.0.bb" rel=3D"noreferrer" target=
=3D"_blank">gcr_3.18.0.bb</a> =3D&gt; <a href=3D"http://gcr_3.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gcr_3.20.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../<a href=3D"http://gobject-introspection_1.46.0.bb" rel=3D"norefer=
rer" target=3D"_blank">gobject-introspection_1.46.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0.../gtk+/{gtk+_<a href=3D"http://2.24.29.bb" rel=3D"noreferrer" targe=
t=3D"_blank">2.24.29.bb</a> =3D&gt; gtk+_<a href=3D"http://2.24.30.bb" rel=
=3D"noreferrer" target=3D"_blank">2.24.30.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0.../{<a href=3D"http://libsecret_0.18.4.bb" rel=3D"noreferrer" target=
=3D"_blank">libsecret_0.18.4.bb</a> =3D&gt; <a href=3D"http://libsecret_0.1=
8.5.bb" rel=3D"noreferrer" target=3D"_blank">libsecret_0.18.5.bb</a>}=C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../0001-build-Use-AC_COMPILE_IFELSE.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 105 ------------<br>
=C2=A0...<a href=3D"http://clutter-1.0_1.24.2.bb" rel=3D"noreferrer" target=
=3D"_blank">clutter-1.0_1.24.2.bb</a> =3D&gt; <a href=3D"http://clutter-1.0=
_1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">clutter-1.0_1.26.0.bb</a>}=
 |=C2=A0 =C2=A05 +-<br>
=C2=A0...<a href=3D"http://gst-3.0_3.0.16.bb" rel=3D"noreferrer" target=3D"=
_blank">gst-3.0_3.0.16.bb</a> =3D&gt; <a href=3D"http://clutter-gst-3.0_3.0=
.18.bb" rel=3D"noreferrer" target=3D"_blank">clutter-gst-3.0_3.0.18.bb</a>}=
 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../jpeg/libjpeg-turbo_8d+<a href=3D"http://1.4.2.bb" rel=3D"noreferr=
er" target=3D"_blank">1.4.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../xorg-lib/{<a href=3D"http://libxcb_1.11.1.bb" rel=3D"noreferrer" =
target=3D"_blank">libxcb_1.11.1.bb</a> =3D&gt; <a href=3D"http://libxcb_1.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">libxcb_1.12.bb</a>}=C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-graphics/xorg-proto/<a href=3D"http://xcb-proto_1.11.bb"=
 rel=3D"noreferrer" target=3D"_blank">xcb-proto_1.11.bb</a> |=C2=A0 =C2=A09=
 -<br>
=C2=A0.../{xcb-proto.inc =3D&gt; <a href=3D"http://xcb-proto_1.12.bb" rel=
=3D"noreferrer" target=3D"_blank">xcb-proto_1.12.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0meta/recipes-graphics/xorg-proto/<a href=3D"http://xcb-proto_git.bb" =
rel=3D"noreferrer" target=3D"_blank">xcb-proto_git.bb</a>=C2=A0 |=C2=A0 =C2=
=A09 -<br>
=C2=A0.../linux-firmware/<a href=3D"http://linux-firmware_git.bb" rel=3D"no=
referrer" target=3D"_blank">linux-firmware_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 49 +++---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.1.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.1.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.1.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_4.1.bb</a>=C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_4.4.bb</a>=C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 18 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 18 +-<br>
=C2=A0.../{<a href=3D"http://babeltrace_1.3.1.bb" rel=3D"noreferrer" target=
=3D"_blank">babeltrace_1.3.1.bb</a> =3D&gt; <a href=3D"http://babeltrace_1.=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">babeltrace_1.3.2.bb</a>}=C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../argp-standalone/<a href=3D"http://argp-standalone_1.3.bb" rel=3D"=
noreferrer" target=3D"_blank">argp-standalone_1.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../ca-certificates/<a href=3D"http://ca-certificates_20160104.bb" re=
l=3D"noreferrer" target=3D"_blank">ca-certificates_20160104.bb</a>=C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-support/gnupg/<a href=3D"http://gnupg_1.4.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_1.4.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.1.11.bb" rel=3D"=
noreferrer" target=3D"_blank">gnupg_2.1.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0meta/recipes-support/gpgme/<a href=3D"http://gpgme_1.6.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">gpgme_1.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0meta/recipes-support/libassuan/<a href=3D"http://libassuan_2.4.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libassuan_2.4.2.bb</a>=C2=A0 |=C2=A0 =
=C2=A03 +-<br>
=C2=A0.../{<a href=3D"http://libevdev_1.4.6.bb" rel=3D"noreferrer" target=
=3D"_blank">libevdev_1.4.6.bb</a> =3D&gt; <a href=3D"http://libevdev_1.5.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libevdev_1.5.1.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0meta/recipes-support/libgcrypt/libgcrypt.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0.../0001-libgpg-error-Add-nios2-support.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 46 -----<br>
=C2=A0.../{<a href=3D"http://libgpg-error_1.21.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libgpg-error_1.21.bb</a> =3D&gt; <a href=3D"http://libgpg-erro=
r_1.22.bb" rel=3D"noreferrer" target=3D"_blank">libgpg-error_1.22.bb</a>} |=
=C2=A0 12 +-<br>
=C2=A0meta/recipes-support/libksba/<a href=3D"http://libksba_1.3.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libksba_1.3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A03 +-<br>
=C2=A0.../liburcu/{<a href=3D"http://liburcu_0.9.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">liburcu_0.9.1.bb</a> =3D&gt; <a href=3D"http://liburcu_0.9=
.2.bb" rel=3D"noreferrer" target=3D"_blank">liburcu_0.9.2.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0meta/recipes-support/npth/<a href=3D"http://npth_1.2.bb" rel=3D"noref=
errer" target=3D"_blank">npth_1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0meta/recipes-support/pinentry/<a href=3D"http://pinentry_0.9.2.bb" re=
l=3D"noreferrer" target=3D"_blank">pinentry_0.9.2.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +-<br>
=C2=A0scripts/lib/wic/plugins/source/bootimg-efi.py=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +<br>
=C2=A083 files changed, 830 insertions(+), 640 deletions(-)<br>
=C2=A0create mode 100644 meta/lib/oeqa/utils/package_manager.py<br>
=C2=A0create mode 100644 meta/recipes-connectivity/dhcp/dhcp/libxml2-config=
ure-argument.patch<br>
=C2=A0create mode 100644 meta/recipes-core/coreutils/coreutils-8.25/disable=
-ls-output-quoting.patch<br>
=C2=A0rename meta/recipes-devtools/docbook-xml/{<a href=3D"http://docbook-x=
sl-stylesheets_1.78.1.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xsl-=
stylesheets_1.78.1.bb</a> =3D&gt; <a href=3D"http://docbook-xsl-stylesheets=
_1.79.1.bb" rel=3D"noreferrer" target=3D"_blank">docbook-xsl-stylesheets_1.=
79.1.bb</a>} (76%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-=
assert-less-restrictive.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/diffutils/diffutils-2.8.1/fi=
x_gcc6.patch<br>
=C2=A0rename meta/recipes-extended/msmtp/{<a href=3D"http://msmtp_1.6.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">msmtp_1.6.3.bb</a> =3D&gt; <a href=3D=
"http://msmtp_1.6.4.bb" rel=3D"noreferrer" target=3D"_blank">msmtp_1.6.4.bb=
</a>} (86%)<br>
=C2=A0delete mode 100644 meta/recipes-extended/pam/libpam/pam-no-innetgr.pa=
tch<br>
=C2=A0rename meta/recipes-extended/pam/{<a href=3D"http://libpam_1.2.1.bb" =
rel=3D"noreferrer" target=3D"_blank">libpam_1.2.1.bb</a> =3D&gt; <a href=3D=
"http://libpam_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">libpam_1.3.0.=
bb</a>} (94%)<br>
=C2=A0rename meta/recipes-gnome/gcr/{<a href=3D"http://gcr_3.18.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gcr_3.18.0.bb</a> =3D&gt; <a href=3D"http=
://gcr_3.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gcr_3.20.0.bb</a>} (=
89%)<br>
=C2=A0rename meta/recipes-gnome/gtk+/{gtk+_<a href=3D"http://2.24.29.bb" re=
l=3D"noreferrer" target=3D"_blank">2.24.29.bb</a> =3D&gt; gtk+_<a href=3D"h=
ttp://2.24.30.bb" rel=3D"noreferrer" target=3D"_blank">2.24.30.bb</a>} (91%=
)<br>
=C2=A0rename meta/recipes-gnome/libsecret/{<a href=3D"http://libsecret_0.18=
.4.bb" rel=3D"noreferrer" target=3D"_blank">libsecret_0.18.4.bb</a> =3D&gt;=
 <a href=3D"http://libsecret_0.18.5.bb" rel=3D"noreferrer" target=3D"_blank=
">libsecret_0.18.5.bb</a>} (84%)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0/0001-bui=
ld-Use-AC_COMPILE_IFELSE.patch<br>
=C2=A0rename meta/recipes-graphics/clutter/{<a href=3D"http://clutter-1.0_1=
.24.2.bb" rel=3D"noreferrer" target=3D"_blank">clutter-1.0_1.24.2.bb</a> =
=3D&gt; <a href=3D"http://clutter-1.0_1.26.0.bb" rel=3D"noreferrer" target=
=3D"_blank">clutter-1.0_1.26.0.bb</a>} (52%)<br>
=C2=A0rename meta/recipes-graphics/clutter/{<a href=3D"http://clutter-gst-3=
.0_3.0.16.bb" rel=3D"noreferrer" target=3D"_blank">clutter-gst-3.0_3.0.16.b=
b</a> =3D&gt; <a href=3D"http://clutter-gst-3.0_3.0.18.bb" rel=3D"noreferre=
r" target=3D"_blank">clutter-gst-3.0_3.0.18.bb</a>} (58%)<br>
=C2=A0rename meta/recipes-graphics/xorg-lib/{<a href=3D"http://libxcb_1.11.=
1.bb" rel=3D"noreferrer" target=3D"_blank">libxcb_1.11.1.bb</a> =3D&gt; <a =
href=3D"http://libxcb_1.12.bb" rel=3D"noreferrer" target=3D"_blank">libxcb_=
1.12.bb</a>} (89%)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-proto/<a href=3D"http:/=
/xcb-proto_1.11.bb" rel=3D"noreferrer" target=3D"_blank">xcb-proto_1.11.bb<=
/a><br>
=C2=A0rename meta/recipes-graphics/xorg-proto/{xcb-proto.inc =3D&gt; <a hre=
f=3D"http://xcb-proto_1.12.bb" rel=3D"noreferrer" target=3D"_blank">xcb-pro=
to_1.12.bb</a>} (71%)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-proto/<a href=3D"http:/=
/xcb-proto_git.bb" rel=3D"noreferrer" target=3D"_blank">xcb-proto_git.bb</a=
><br>
=C2=A0rename meta/recipes-kernel/lttng/{<a href=3D"http://babeltrace_1.3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">babeltrace_1.3.1.bb</a> =3D&gt; <a=
 href=3D"http://babeltrace_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">b=
abeltrace_1.3.2.bb</a>} (93%)<br>
=C2=A0rename meta/recipes-support/libevdev/{<a href=3D"http://libevdev_1.4.=
6.bb" rel=3D"noreferrer" target=3D"_blank">libevdev_1.4.6.bb</a> =3D&gt; <a=
 href=3D"http://libevdev_1.5.1.bb" rel=3D"noreferrer" target=3D"_blank">lib=
evdev_1.5.1.bb</a>} (74%)<br>
=C2=A0delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/000=
1-libgpg-error-Add-nios2-support.patch<br>
=C2=A0rename meta/recipes-support/libgpg-error/{<a href=3D"http://libgpg-er=
ror_1.21.bb" rel=3D"noreferrer" target=3D"_blank">libgpg-error_1.21.bb</a> =
=3D&gt; <a href=3D"http://libgpg-error_1.22.bb" rel=3D"noreferrer" target=
=3D"_blank">libgpg-error_1.22.bb</a>} (74%)<br>
=C2=A0rename meta/recipes-support/liburcu/{<a href=3D"http://liburcu_0.9.1.=
bb" rel=3D"noreferrer" target=3D"_blank">liburcu_0.9.1.bb</a> =3D&gt; <a hr=
ef=3D"http://liburcu_0.9.2.bb" rel=3D"noreferrer" target=3D"_blank">liburcu=
_0.9.2.bb</a>} (83%)<br>
<span class=3D""><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
_______________________________________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mai=
lman/listinfo/openembedded-commits</a><br>
</font></span></blockquote></div><br></div></div>

--001a11442b46fe454405343579cc--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8BC65CAC;
	Mon, 27 Apr 2015 13:38:28 +0000 (UTC)
Received: by wizk4 with SMTP id k4so99871302wiz.1;
	Mon, 27 Apr 2015 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=GmISltAwNXe64BNWvgoGwmkHTWw9utF40y01dxXCf+Q=;
	b=kx9nvZTcPj5gOMojt+kWzP/6e1qDV51Oumj1Oh9O3nlFIbm9ZMpuFgHbEBPlmhUgLq
	BPWga9G+hrQGsLMCp/64PW3M+IledmujnIW/a6WSCJdSReCAG/8pBAW+4E7cydPFO63V
	m5wtBaHh6BlD9ti7qz9UMnM2eMqvVphGg9eVIKVefoDdgmjmOejtT61qOE0IxFvwsXSE
	lzFOPj4vWM8iuk6PTGBvKEtZfBYqP9oXWplzutx3WqtehIGpyrGdiB8LyDCWYJJLedSx
	Yxi8paGZwO5YlrQXrpbIIyNDjrxp/uZbDozniz3hpKDl9DDCcwNEHMoznTSq4TkNAGLd
	406A==
X-Received: by 10.180.84.8 with SMTP id u8mr20869005wiy.39.1430141909844;
	Mon, 27 Apr 2015 06:38:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	z12sm29486063wjw.39.2015.04.27.06.38.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 06:38:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Apr 2015 15:39:25 +0200
To: openembedded-core@lists.openembedded.org,
	Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20150427133925.GF2379@jama>
References: <20150426215838.0A414501E8@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150426215838.0A414501E8@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : bluez4: add proper systemd support
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
X-List-Received-Date: Mon, 27 Apr 2015 13:38:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2015 at 09:58:38PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: c7fe8d52563619e2a248255ee7225593f5bb498f
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dc7fe8d52563619e2a248255ee7225593f5bb498f
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Thu Apr 23 17:38:33 2015 +0300
>=20
> bluez4: add proper systemd support
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This seems to break gst-plugin-bluetooth which is using the same
bluez4.inc, but doesn't have systemd support:

meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb,
do_package

ERROR: Function failed: SYSTEMD_SERVICE_gst-plugin-bluetooth value bluetoot=
h.service does not exist
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/i586-oe-linux/gst-plugin-bluetooth/4.101-r1/temp/log.do_package.77=
08
Log data follows:
| DEBUG: Executing python function sstate_task_prefunc
| DEBUG: Python function sstate_task_prefunc finished
| DEBUG: Executing python function do_package
| DEBUG: Executing python function package_get_auto_pr
| DEBUG: Python function package_get_auto_pr finished
| DEBUG: Executing python function perform_packagecopy
| DEBUG: Python function perform_packagecopy finished
| DEBUG: Executing python function split_and_strip_files
| DEBUG: runstrip: 'i586-oe-linux-strip' --remove-section=3D.comment --remo=
ve-section=3D.note --strip-unneeded '/home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/i586-oe-linux/gst-plugin-bluetooth/4.101-r1/package/usr/lib/gstrea=
mer-0.10/libgstbluetooth.so' -o '/home/jenkins/oe/world/shr-core/tmp-glibc/=
work/i586-oe-linux/gst-plugin-bluetooth/4.101-r1/package/usr/lib/gstreamer-=
0.10/libgstbluetooth.so.tmp' && chown --reference=3D'/home/jenkins/oe/world=
/shr-core/tmp-glibc/work/i586-oe-linux/gst-plugin-bluetooth/4.101-r1/packag=
e/usr/lib/gstreamer-0.10/libgstbluetooth.so' '/home/jenkins/oe/world/shr-co=
re/tmp-glibc/work/i586-oe-linux/gst-plugin-bluetooth/4.101-r1/package/usr/l=
ib/gstreamer-0.10/libgstbluetooth.so.tmp' && mv '/home/jenkins/oe/world/shr=
-core/tmp-glibc/work/i586-oe-linux/gst-plugin-bluetooth/4.101-r1/package/us=
r/lib/gstreamer-0.10/libgstbluetooth.so.tmp' '/home/jenkins/oe/world/shr-co=
re/tmp-glibc/work/i586-oe-linux/gst-plugin-bluetooth/4.101-r1/package/usr/l=
ib/gstreamer-0.10/libgstbluetooth.so'
| DEBUG: Python function split_and_strip_files finished
| DEBUG: Executing python function fixup_perms
| DEBUG: Python function fixup_perms finished
| DEBUG: Executing python function split_gstreamer10_packages
| DEBUG: Python function split_gstreamer10_packages finished
| DEBUG: Executing python function systemd_populate_packages
| DEBUG: adding systemd calls to postinst/postrm for gst-plugin-bluetooth
| DEBUG: Python function systemd_populate_packages finished
| DEBUG: Python function do_package finished
| ERROR: Function failed: SYSTEMD_SERVICE_gst-plugin-bluetooth value blueto=
oth.service does not exist
NOTE: recipe gst-plugin-bluetooth-4.101-r1: task do_package: Failed
ERROR: Task 31556 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb, do_package) fai=
led with exit code '1'


>=20
> ---
>=20
>  meta/recipes-connectivity/bluez/bluez4.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-co=
nnectivity/bluez/bluez4.inc
> index 11c9616..948b495 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -13,9 +13,11 @@ RDEPENDS_${PN}-dev =3D "bluez-hcidump"
>  PACKAGECONFIG ??=3D "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '', d)}=
 \
>  "
>  PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
>  PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,"
> +PACKAGECONFIG[systemd] =3D "--with-systemdunitdir=3D${systemd_unitdir}/s=
ystem/,--with-systemdunitdir=3D"
> =20
>  ASNEEDED =3D ""
> =20
> @@ -24,7 +26,7 @@ SRC_URI =3D "\
>  "
>  S =3D "${WORKDIR}/bluez-${PV}"
> =20
> -inherit autotools-brokensep pkgconfig
> +inherit autotools-brokensep pkgconfig systemd
> =20
>  EXTRA_OECONF =3D "\
>    --disable-gstreamer \
> @@ -43,4 +45,6 @@ EXTRA_OECONF =3D "\
>    --with-udevrulesdir=3D`pkg-config --variable=3Dudevdir udev`/rules.d \
>  "
> =20
> +SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
> +
>  EXCLUDE_FROM_WORLD =3D "1"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


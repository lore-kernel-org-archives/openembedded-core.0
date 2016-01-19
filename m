Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA5D6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 23:44:41 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id n128so183375321pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=GhVJ4fd6vdwaB2WM1xitrLEMMaEX0hY2XsJHfGTWUe4=;
	b=Sye0JMyePB7/uNR4PTrq2YmuxPEuk5xOQr/xcDCQnLCJhiVCkxv+l5radgW0b/+stJ
	vDuAqd0AGVQn9ZJAanoz0efzY/fOqeePQ1Tb+RznssL/ReIXr3AmmxibsPVvkUDw3g/n
	pMbrRXI8Y5y9jShPIs0UZTOw62fdarLjRMLqLF1omW0HO0G3qQ+RbVad0BbnlgHC4ztl
	9zdX/2pTqOVWIeNDO1Uw84RiAXUA1z+Vtufw+pVWvVfvwtRkQaxo1G0zQ0E1ZHaer6C0
	ZQYz3CEY2ZuzR+zsEfDcVl9Sa1/JzhpDlWUVBgHK/CHukUG3QTCHGGGqxvA9Tm0M2l/X
	xDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=GhVJ4fd6vdwaB2WM1xitrLEMMaEX0hY2XsJHfGTWUe4=;
	b=lF3X46RY89UzBH7sah4yF8Wf/DDdNP9RvTl0jXscENujPT6EUQp1dZ1Saajc2vxS2S
	YwRPnYJlgGKtdp05YMnFWRyhEd/VoOJCBXTzfCUA4bpICV+deKX4CmWSK4XYiIFRL08P
	cupfdbjIu+Yzehyx5k6xcDxP6xgHRdCcAL9V5VvtCkHKdLAR7rMvlGpAHFbVzoOebvfJ
	+rZBctsKP/dot7JXLA2fnJ/iBPY9ZOtYoewosUAPlcVj+ylA9vs/ZuuHIaW+VZzdIc46
	xQBOH9Km6jhfrs+zgAZvrRti/KghS1ZXh2AnnWIOWbGcFVPi8SNW8MzIdTjNgFkUQd3b
	MsLg==
X-Gm-Message-State: ALoCoQlLZsTO8XuTy2aRdGHbOepSh3g7qzFK/qf30t4CVgWAFgQBHeyA9TWi4GNoQJn0yL5FIrnXWhzURZ+nQ6DfKz4SPjudrQ==
X-Received: by 10.98.16.139 with SMTP id 11mr48281912pfq.128.1453247082440;
	Tue, 19 Jan 2016 15:44:42 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:2cdb:35b7:1df4:399a?
	([2601:646:8802:5d5c:2cdb:35b7:1df4:399a])
	by smtp.gmail.com with ESMTPSA id
	ss5sm11945356pab.15.2016.01.19.15.44.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 15:44:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453241111-3103-1-git-send-email-sgw@linux.intel.com>
Date: Tue, 19 Jan 2016 15:44:40 -0800
Message-Id: <33B3E41A-2F24-4D5D-A909-040AC2CC1820@gmail.com>
References: <1453241111-3103-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: Add 2 patches to support 4.4 kernel
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
X-List-Received-Date: Tue, 19 Jan 2016 23:44:44 -0000
X-Groupsio-MsgNum: 76466
Content-Type: multipart/signed;
	boundary="Apple-Mail=_34DA22F7-65D0-47C1-9BD6-7E1554DC248F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_34DA22F7-65D0-47C1-9BD6-7E1554DC248F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 19, 2016, at 2:05 PM, Saul Wold <sgw@linux.intel.com> wrote:
>=20
> These 2 patches are needed to build udev with the 4.4 kernel, the =
first
> mtd-probe adds back a stdint.h header that was removed in the kernel's =
mtd-user.h
> header file.
>=20
> The second adds a check for a new header and sets a Makefile variable
> to determine which header to use for the new kernel vs older kernels.


Patches are ok. You need to add Upstream-Status to both of them.
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-core/udev/udev.inc                    |  5 ++-
> ...-Add-stdint.h-as-it-was-removed-from-mtd-.patch | 26 +++++++++++
> ...c-Makefile.am-Check-for-input.h-and-input.patch | 50 =
++++++++++++++++++++++
> 3 files changed, 80 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-remove=
d-from-mtd-.patch
> create mode 100644 =
meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.=
h-and-input.patch
>=20
> diff --git a/meta/recipes-core/udev/udev.inc =
b/meta/recipes-core/udev/udev.inc
> index c00ed34..93d7369 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -31,7 +31,10 @@ SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
>            file://add-install-ptest.patch \
>            file://fix_rule-syntax-regex-ptest.patch \
>            file://run-ptest \
> -           file://init"
> +           file://init \
> +           =
file://0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch \
> +           =
file://0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch \
> +           "
>=20
> inherit autotools pkgconfig update-rc.d ptest
> RDEPENDS_${PN}-ptest +=3D "make perl python"
> diff --git =
a/meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-remo=
ved-from-mtd-.patch =
b/meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-remo=
ved-from-mtd-.patch
> new file mode 100644
> index 0000000..439eeac
> --- /dev/null
> +++ =
b/meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-remo=
ved-from-mtd-.patch
> @@ -0,0 +1,26 @@
> +=46rom 2935f9b2dfb92c3ce4376a988cd01b624430905b Mon Sep 17 00:00:00 =
2001
> +From: Saul Wold <sgw@linux.intel.com>
> +Date: Tue, 19 Jan 2016 09:49:56 -0800
> +Subject: [PATCH 1/2] mtd_probe.h: Add stdint.h as it was removed from
> + mtd-user.h in the kernel
> +
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +---
> + src/mtd_probe/mtd_probe.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/mtd_probe/mtd_probe.h b/src/mtd_probe/mtd_probe.h
> +index 2a37ede..49c1918 100644
> +--- a/src/mtd_probe/mtd_probe.h
> ++++ b/src/mtd_probe/mtd_probe.h
> +@@ -18,6 +18,7 @@
> +  */
> +
> + #include <mtd/mtd-user.h>
> ++#include <stdint.h>
> +
> + /* Full oob structure as written on the flash */
> + struct sm_oob {
> +--
> +2.5.0
> +
> diff --git =
a/meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-inpu=
t.h-and-input.patch =
b/meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-inpu=
t.h-and-input.patch
> new file mode 100644
> index 0000000..285680f
> --- /dev/null
> +++ =
b/meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-inpu=
t.h-and-input.patch
> @@ -0,0 +1,50 @@
> +=46rom 63ae7ebb0c6177efed46734061fb59c458a47a26 Mon Sep 17 00:00:00 =
2001
> +From: Saul Wold <sgw@linux.intel.com>
> +Date: Tue, 19 Jan 2016 09:49:19 -0800
> +Subject: [PATCH 2/2] configure.ac/Makefile.am: Check for input.h and
> + input-event-codes.h
> +
> +Add INPUT_HEADER to know which header file to use because it changed
> +in the 4.4 kernel code.
> +
> +Set INPUT_HEADER with default linux/input.h if it exists and if the
> +newer input-events-codes.h exists from 4.4 use it instead.
> +
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +---
> + Makefile.am  | 2 +-
> + configure.ac | 4 +++-
> + 2 files changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 2e32e69..04eb194 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -591,7 +591,7 @@ dist_udevkeymapforcerel_DATA =3D \
> + 	src/keymap/force-release-maps/samsung-other \
> + 	src/keymap/force-release-maps/common-volume-keys
> +
> +-src/keymap/keys.txt: $(INCLUDE_PREFIX)/linux/input.h
> ++src/keymap/keys.txt: $(INCLUDE_PREFIX)/$(INPUT_HEADER)
> + 	$(AM_V_at)mkdir -p src/keymap
> + 	$(AM_V_GEN)$(AWK) '/^#define.*KEY_[^ ]+[ \t]+[0-9]/ { if ($$2 !=3D=
 "KEY_MAX") { print $$2 } }' < $< | sed =
's/^KEY_COFFEE$$/KEY_SCREENLOCK/' > $@
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0500313..9674620 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -154,8 +154,10 @@ AS_IF([test "x$enable_keymap" =3D "xyes"], [
> +        if test -z "$GPERF"; then
> +               AC_MSG_ERROR([gperf is needed])
> +        fi
> ++
> ++       AC_CHECK_HEADER([linux/input.h], [AC_SUBST([INPUT_HEADER], =
[$(echo 'linux/input.h')])], AC_MSG_ERROR([kernel headers not found]))
> ++       AC_CHECK_HEADER([linux/input-event-codes.h], =
[AC_SUBST([INPUT_HEADER], [$(echo 'linux/input-event-codes.h')])], [:])
> +
> +-       AC_CHECK_HEADER([linux/input.h], [:], AC_MSG_ERROR([kernel =
headers not found]))
> +        AC_SUBST([INCLUDE_PREFIX], [$(echo '#include <linux/input.h>' =
| eval $ac_cpp -E - | sed -n '/linux\/input.h/ =
{s:.*"\(.*\)/linux/input.h".*:\1:; p; q}')])
> + ])
> + AM_CONDITIONAL([ENABLE_KEYMAP], [test "x$enable_keymap" =3D "xyes"])
> +--
> +2.5.0
> +
> --
> 2.5.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_34DA22F7-65D0-47C1-9BD6-7E1554DC248F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaeymgACgkQuwUzVZGdMxQ6uACfbVMvX6jzQSfPQ0ZkXQBzrgTr
4sAAn0TFDkqtLtfd2q32vffnA3EIqPJl
=8h7b
-----END PGP SIGNATURE-----

--Apple-Mail=_34DA22F7-65D0-47C1-9BD6-7E1554DC248F--

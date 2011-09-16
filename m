Received: from mail-wy0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R4d8r-0003XS-Er
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 20:28:01 +0200
Received: by wyh21 with SMTP id 21so4227045wyh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 11:22:48 -0700 (PDT)
Received: by 10.216.171.200 with SMTP id r50mr1536891wel.90.1316197367804;
	Fri, 16 Sep 2011 11:22:47 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e2sm13614967wbh.19.2011.09.16.11.22.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 11:22:46 -0700 (PDT)
References: <1316196859-2561-1-git-send-email-jdk@ti.com>
In-Reply-To: <1316196859-2561-1-git-send-email-jdk@ti.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <084F6773-2D94-45C1-B359-24DBE2F1C3A5@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Sep 2011 20:22:41 +0200
To: Jason Kridner <jdk@ti.com>
Cc: "<beagleboard@googlegrouops.com>" <beagleboard@googlegrouops.com>,
	Jason Kridner <jdk@ti.com>, "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH meta-ti] linux-3.0: use die-id for BeagleBoard-xM eth mac
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2011 18:28:01 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

please follow the README when sending patches, this is the wrong list

secondly, use the patches from the export/ directory, they have much less cr=
uft in them

Op 16 sep. 2011 om 20:14 heeft Jason Kridner <jdk@ti.com> het volgende gesch=
reven:

> Also removed broken ULCD driver and fixed a potential issued due to the dr=
opped
> update_mode function in omap_vout_probe.
>=20
> Updated ulcd patches with touchscreen support should be coming shortly.
>=20
> Signed-off-by: Jason Kridner <jdk@ti.com>
> Cc: Joel A Fernandes <agnel.joel@gmail.com>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> ---
> ...add-cpu-id-register-to-MAC-address-helper.patch |   89 ++++++++++
> ...BeagleBoard-Fix-up-random-or-missing-MAC-.patch |  156 ++++++++++++++++=
++
> ...ix-build-break-caused-by-update_mode-remo.patch |   44 +++++
> ...ays-Add-support-for-ThreeFiveCorp-S9700-D.patch |  170 ----------------=
----
> .../ulcd/0002-omap3-beagle-added-lcd-driver.patch  |   72 --------
> ...d-Set-LCD-power-enable-GPIO-in-board-file.patch |   49 ------
> ...004-Make-fbset-show-correct-timing-values.patch |   40 -----
> ...lcd-Set-LCD-power-enable-GPIO-in-board-file.eml |   93 -----------
> recipes-kernel/linux/linux_3.0.bb                  |    9 +-
> 9 files changed, 293 insertions(+), 429 deletions(-)
> create mode 100644 recipes-kernel/linux/linux-3.0/beagle/0007-OMAP2-add-cp=
u-id-register-to-MAC-address-helper.patch
> create mode 100644 recipes-kernel/linux/linux-3.0/beagle/0008-HACK-OMAP2-B=
eagleBoard-Fix-up-random-or-missing-MAC-.patch
> create mode 100644 recipes-kernel/linux/linux-3.0/ulcd/0001-OMAP_VOUT-Fix-=
build-break-caused-by-update_mode-remo.patch
> delete mode 100644 recipes-kernel/linux/linux-3.0/ulcd/0001-omap2-displays=
-Add-support-for-ThreeFiveCorp-S9700-D.patch
> delete mode 100644 recipes-kernel/linux/linux-3.0/ulcd/0002-omap3-beagle-a=
dded-lcd-driver.patch
> delete mode 100644 recipes-kernel/linux/linux-3.0/ulcd/0003-lcd-Set-LCD-po=
wer-enable-GPIO-in-board-file.patch
> delete mode 100644 recipes-kernel/linux/linux-3.0/ulcd/0004-Make-fbset-sho=
w-correct-timing-values.patch
> delete mode 100644 recipes-kernel/linux/linux-3.0/ulcd/lcd-Set-LCD-power-e=
nable-GPIO-in-board-file.eml
>=20
> diff --git a/recipes-kernel/linux/linux-3.0/beagle/0007-OMAP2-add-cpu-id-r=
egister-to-MAC-address-helper.patch b/recipes-kernel/linux/linux-3.0/beagle/=
0007-OMAP2-add-cpu-id-register-to-MAC-address-helper.patch
> new file mode 100644
> index 0000000..6fe25fa
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-3.0/beagle/0007-OMAP2-add-cpu-id-register=
-to-MAC-address-helper.patch
> @@ -0,0 +1,89 @@
> +=46rom 3a9fe52727626622058b1acce5e795ed01b63a13 Mon Sep 17 00:00:00 2001
> +From: Andy Green <andy@warmcat.com>
> +Date: Thu, 24 Mar 2011 21:27:29 +0000
> +Subject: [PATCH 1/2] OMAP2+: add cpu id register to MAC address helper
> +
> +Introduce a generic helper function that can set a MAC address using
> +data from the OMAP unique CPU ID register.
> +
> +For comparison purposes this produces a MAC address of
> +
> +  2e:40:70:f0:12:06
> +
> +for the ethernet device on my Panda.
> +
> +Note that this patch requires the fix patch for CPU ID register
> +indexes previously posted to linux-omap, otherwise the CPU ID is
> +misread on Panda by the existing function to do it.  This patch
> +is already on linux-omap.
> +
> +"OMAP2+:Common CPU DIE ID reading code reads wrong registers for OMAP4430=
"
> +http://git.kernel.org/?p=3Dlinux/kernel/git/tmlind/linux-omap-2.6.git;a=3D=
commit;h=3Db235e007831dbf57710e59cd4a120e2f374eecb9
> +
> +Signed-off-by: Andy Green <andy.green@linaro.org>
> +---
> + arch/arm/mach-omap2/id.c              |   39 +++++++++++++++++++++++++++=
++++++
> + arch/arm/mach-omap2/include/mach/id.h |    1 +
> + 2 files changed, 40 insertions(+), 0 deletions(-)
> +
> +diff --git a/arch/arm/mach-omap2/id.c b/arch/arm/mach-omap2/id.c
> +index 0ae02da..d306f26 100644
> +--- a/arch/arm/mach-omap2/id.c
> ++++ b/arch/arm/mach-omap2/id.c
> +@@ -576,3 +576,42 @@ void __init omap2_set_globals_tap(struct omap_global=
s *omap2_globals)
> +    else
> +        tap_prod_id =3D 0x0208;
> + }
> ++
> ++/*
> ++ * this uses the unique per-cpu info from the cpu fuses set at factory t=
o
> ++ * generate a 6-byte MAC address.  Two bits in the generated code are us=
ed
> ++ * to elaborate the generated address into four, so it can be used on mu=
ltiple
> ++ * network interfaces.
> ++ */
> ++
> ++void omap2_die_id_to_ethernet_mac(u8 *mac, int subtype)
> ++{
> ++    struct omap_die_id odi;
> ++    u32 tap =3D read_tap_reg(OMAP_TAP_IDCODE);
> ++
> ++    omap_get_die_id(&odi);
> ++
> ++    mac[0] =3D odi.id_2;
> ++    mac[1] =3D odi.id_2 >> 8;
> ++    mac[2] =3D odi.id_1;
> ++    mac[3] =3D odi.id_1 >> 8;
> ++    mac[4] =3D odi.id_1 >> 16;
> ++    mac[5] =3D odi.id_1 >> 24;
> ++
> ++    /* XOR other chip-specific data with ID */
> ++
> ++    tap ^=3D odi.id_3;
> ++
> ++    mac[0] ^=3D tap;
> ++    mac[1] ^=3D tap >> 8;
> ++    mac[2] ^=3D tap >> 16;
> ++    mac[3] ^=3D tap >> 24;
> ++
> ++    /* allow four MACs from this same basic data */
> ++
> ++    mac[1] =3D (mac[1] & ~0xc0) | ((subtype & 3) << 6);
> ++
> ++    /* mark it as not multicast and outside official 80211 MAC namespace=
 */
> ++
> ++    mac[0] =3D (mac[0] & ~1) | 2;
> ++}
> +diff --git a/arch/arm/mach-omap2/include/mach/id.h b/arch/arm/mach-omap2/=
include/mach/id.h
> +index 02ed3aa..373313a 100644
> +--- a/arch/arm/mach-omap2/include/mach/id.h
> ++++ b/arch/arm/mach-omap2/include/mach/id.h
> +@@ -18,5 +18,6 @@ struct omap_die_id {
> + };
> +=20
> + void omap_get_die_id(struct omap_die_id *odi);
> ++void omap2_die_id_to_ethernet_mac(u8 *mac, int subtype);
> +=20
> + #endif
> +--=20
> +1.7.4.1
> +
> diff --git a/recipes-kernel/linux/linux-3.0/beagle/0008-HACK-OMAP2-BeagleB=
oard-Fix-up-random-or-missing-MAC-.patch b/recipes-kernel/linux/linux-3.0/be=
agle/0008-HACK-OMAP2-BeagleBoard-Fix-up-random-or-missing-MAC-.patch
> new file mode 100644
> index 0000000..1a3a895
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-3.0/beagle/0008-HACK-OMAP2-BeagleBoard-Fi=
x-up-random-or-missing-MAC-.patch
> @@ -0,0 +1,156 @@
> +=46rom ef18c94dade18a25e2504c2527ce12c5e1bfafd4 Mon Sep 17 00:00:00 2001
> +From: Jason Kridner <jdk@ti.com>
> +Date: Thu, 15 Sep 2011 18:23:02 -0400
> +Subject: [PATCH] HACK: OMAP2+: BeagleBoard: Fix up random or missing MAC a=
ddresses for eth0 and wlan0
> +
> +This was borrowed from the Panda implementation at http://patches.linaro.=
org/777/
> +
> +This patch registers a network device notifier callback to set the mac
> +addresses for the onboard network assets of the BeagleBoard correctly, de=
spite the
> +drivers involved have used a random or all-zeros MAC address.
> +
> +The technique was suggested by Alan Cox on lkml.
> +
> +It works by device path so it corrects the MAC addresses even if the
> +drivers are in modules loaded in an order that changes their interface
> +name from usual (eg, the onboard module might be "wlan1" if there is a
> +USB wireless stick plugged in and its module is inserted first.)
> +
> +Cc: Andy Green <andy@warmcat.com>
> +---
> + arch/arm/mach-omap2/board-omap3beagle.c |   90 +++++++++++++++++++++++++=
++++++
> + 1 files changed, 90 insertions(+), 0 deletions(-)
> +
> +diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap=
2/board-omap3beagle.c
> +index 5e1d9f9..9712099 100644
> +--- a/arch/arm/mach-omap2/board-omap3beagle.c
> ++++ b/arch/arm/mach-omap2/board-omap3beagle.c
> +@@ -33,6 +33,8 @@
> +=20
> + #include <linux/regulator/machine.h>
> + #include <linux/i2c/twl.h>
> ++#include <linux/netdevice.h>
> ++#include <linux/if_ether.h>
> +=20
> + #include <mach/hardware.h>
> + #include <asm/mach-types.h>
> +@@ -42,6 +44,7 @@
> +=20
> + #include <plat/board.h>
> + #include <plat/common.h>
> ++#include <mach/id.h>
> + #include <video/omapdss.h>
> + #include <video/omap-panel-generic-dpi.h>
> + #include <plat/gpmc.h>
> +@@ -91,6 +94,90 @@ static struct {
> +    .usr_button_gpio =3D 4,
> + };
> +=20
> ++/*
> ++ * This device path represents the onboard USB <-> Ethernet bridge
> ++ * on the BeagleBoard-xM which needs a random or all-zeros
> ++ * mac address replaced with a per-cpu stable generated one
> ++ */
> ++
> ++static const char * const xm_fixup_mac_device_paths[] =3D {
> ++    "usb1/1-2/1-2.1/1-2.1:1.0",
> ++};
> ++
> ++static int beagle_device_path_need_mac(struct device *dev)
> ++{
> ++    const char **try =3D (const char **) xm_fixup_mac_device_paths;
> ++    const char *path;
> ++    int count =3D ARRAY_SIZE(xm_fixup_mac_device_paths);
> ++    const char *p;
> ++    int len;
> ++    struct device *devn;
> ++
> ++    while (count--) {
> ++
> ++        p =3D *try + strlen(*try);
> ++        devn =3D dev;
> ++
> ++        while (devn) {
> ++
> ++            path =3D dev_name(devn);
> ++            len =3D strlen(path);
> ++
> ++            if ((p - *try) < len) {
> ++                devn =3D NULL;
> ++                continue;
> ++            }
> ++
> ++            p -=3D len;
> ++
> ++            if (strncmp(path, p, len)) {
> ++                devn =3D NULL;
> ++                continue;
> ++            }
> ++
> ++            devn =3D devn->parent;
> ++            if (p =3D=3D *try)
> ++                return count;
> ++
> ++            if (devn !=3D NULL && (p - *try) < 2)
> ++                devn =3D NULL;
> ++
> ++            p--;
> ++            if (devn !=3D NULL && *p !=3D '/')
> ++                devn =3D NULL;
> ++        }
> ++
> ++        try++;
> ++    }
> ++
> ++    return -ENOENT;
> ++}
> ++
> ++static int omap_beagle_netdev_event(struct notifier_block *this,
> ++                         unsigned long event, void *ptr)
> ++{
> ++    struct net_device *dev =3D ptr;
> ++    struct sockaddr sa;
> ++    int n;
> ++
> ++    if (event !=3D NETDEV_REGISTER)
> ++        return NOTIFY_DONE;
> ++
> ++    n =3D beagle_device_path_need_mac(dev->dev.parent);
> ++    if (n >=3D 0) {
> ++        sa.sa_family =3D dev->type;
> ++        omap2_die_id_to_ethernet_mac(sa.sa_data, n);
> ++        dev->netdev_ops->ndo_set_mac_address(dev, &sa);
> ++    }
> ++
> ++    return NOTIFY_DONE;
> ++}
> ++
> ++static struct notifier_block omap_beagle_netdev_notifier =3D {
> ++    .notifier_call =3D omap_beagle_netdev_event,
> ++    .priority =3D 1,
> ++};
> ++
> + static struct gpio omap3_beagle_rev_gpios[] __initdata =3D {
> +    { 171, GPIOF_IN, "rev_id_0"    },
> +    { 172, GPIOF_IN, "rev_id_1" },
> +@@ -146,14 +233,17 @@ static void __init omap3_beagle_init_rev(void)
> +        printk(KERN_INFO "OMAP3 Beagle Rev: xM Ax/Bx\n");
> +        omap3_beagle_version =3D OMAP3BEAGLE_BOARD_XM;
> +        beagle_config.usb_pwr_level =3D GPIOF_OUT_INIT_HIGH;
> ++        register_netdevice_notifier(&omap_beagle_netdev_notifier);
> +        break;
> +    case 2:
> +        printk(KERN_INFO "OMAP3 Beagle Rev: xM C\n");
> +        omap3_beagle_version =3D OMAP3BEAGLE_BOARD_XMC;
> ++        register_netdevice_notifier(&omap_beagle_netdev_notifier);
> +        break;
> +    default:
> +        printk(KERN_INFO "OMAP3 Beagle Rev: unknown %hd\n", beagle_rev);
> +        omap3_beagle_version =3D OMAP3BEAGLE_BOARD_UNKN;
> ++        register_netdevice_notifier(&omap_beagle_netdev_notifier);
> +    }
> + }
> +=20
> +--=20
> +1.7.4.1
> +
> diff --git a/recipes-kernel/linux/linux-3.0/ulcd/0001-OMAP_VOUT-Fix-build-=
break-caused-by-update_mode-remo.patch b/recipes-kernel/linux/linux-3.0/ulcd=
/0001-OMAP_VOUT-Fix-build-break-caused-by-update_mode-remo.patch
> new file mode 100644
> index 0000000..ef78658
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-3.0/ulcd/0001-OMAP_VOUT-Fix-build-break-c=
aused-by-update_mode-remo.patch
> @@ -0,0 +1,44 @@
> +=46rom 297450b123610d5a4328b8f58cba405d16580ed6 Mon Sep 17 00:00:00 2001
> +From: archit taneja <archit@ti.com>
> +Date: Fri, 5 Aug 2011 07:19:21 +0000
> +Subject: [PATCH] OMAP_VOUT: Fix build break caused by update_mode removal=
 in DSS2
> +
> +The DSS2 driver does not support the configuration of the update_mode of a=

> +panel anymore. Remove the setting of update_mode done in omap_vout_probe(=
).
> +Ignore configuration of TE since omap_vout driver doesn't support manual u=
pdate
> +displays anyway.
> +
> +Signed-off-by: Archit Taneja <archit@ti.com>
> +Tested-by: Koen Kooi <koen@dominion.thruhere.net>
> +Signed-off-by: Vaibhav Hiremath <hvaibhav@ti.com>
> +---
> + drivers/media/video/omap/omap_vout.c |   13 -------------
> + 1 files changed, 0 insertions(+), 13 deletions(-)
> +
> +diff --git a/drivers/media/video/omap/omap_vout.c b/drivers/media/video/o=
map/omap_vout.c
> +index 4d07c58..d17d6b6 100644
> +--- a/drivers/media/video/omap/omap_vout.c
> ++++ b/drivers/media/video/omap/omap_vout.c
> +@@ -2557,19 +2557,6 @@ static int __init omap_vout_probe(struct platform_=
device *pdev)
> +                    "'%s' Display already enabled\n",
> +                    def_display->name);
> +            }
> +-            /* set the update mode */
> +-            if (def_display->caps &
> +-                    OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE) {
> +-                if (dssdrv->enable_te)
> +-                    dssdrv->enable_te(def_display, 0);
> +-                if (dssdrv->set_update_mode)
> +-                    dssdrv->set_update_mode(def_display,
> +-                            OMAP_DSS_UPDATE_MANUAL);
> +-            } else {
> +-                if (dssdrv->set_update_mode)
> +-                    dssdrv->set_update_mode(def_display,
> +-                            OMAP_DSS_UPDATE_AUTO);
> +-            }
> +        }
> +    }
> +=20
> +--=20
> +1.7.4.1
> +
> diff --git a/recipes-kernel/linux/linux-3.0/ulcd/0001-omap2-displays-Add-s=
upport-for-ThreeFiveCorp-S9700-D.patch b/recipes-kernel/linux/linux-3.0/ulcd=
/0001-omap2-displays-Add-support-for-ThreeFiveCorp-S9700-D.patch
> deleted file mode 100644
> index 926398d..0000000
> --- a/recipes-kernel/linux/linux-3.0/ulcd/0001-omap2-displays-Add-support-=
for-ThreeFiveCorp-S9700-D.patch
> +++ /dev/null
> @@ -1,170 +0,0 @@
> -=46rom 364e5e30ff9257f1bac68d7f30f3e7f51e8b1bfc Mon Sep 17 00:00:00 2001
> -From: Roger Monk <r-monk@ti.com>
> -Date: Wed, 10 Aug 2011 16:54:34 +0200
> -Subject: [PATCH 1/4] omap2-displays: Add support for ThreeFiveCorp S9700 D=
isplay
> -
> -* Add support for s9700rtwv35tr01b display panel
> -   * This is used on BeagleBoardToys ULCD/-lite daugtercards
> -
> -Signed-off-by: Roger Monk <r-monk@ti.com>
> ----
> - drivers/video/omap2/displays/Kconfig               |    6 +
> - drivers/video/omap2/displays/Makefile |    1 +
> - .../omap2/displays/panel-tfc-s9700rtwv35tr01b.c    |  118 ++++++++++++++=
++++++
> - 3 files changed, 125 insertions(+), 0 deletions(-)
> - create mode 100644 drivers/video/omap2/displays/panel-tfc-s9700rtwv35tr0=
1b.c
> -
> -diff --git a/drivers/video/omap2/displays/Kconfig b/drivers/video/omap2/d=
isplays/Kconfig
> -index 609a280..f8be2a8 100644
> ---- a/drivers/video/omap2/displays/Kconfig
> -+++ b/drivers/video/omap2/displays/Kconfig
> -@@ -30,6 +30,12 @@ config PANEL_NEC_NL8048HL11_01B
> -        This NEC NL8048HL11-01B panel is TFT LCD
> -        used in the Zoom2/3/3630 sdp boards.
> -=20
> -+config PANEL_TFCS9700RTWV35TR01B
> -+        tristate "TFC S9700RTWV35TR01B"
> -+        depends on OMAP2_DSS
> -+        help
> -+          LCD Panel used on BeagleboardToys 800x480 LCD Expansion Module=

> -+
> - config PANEL_TAAL
> -         tristate "Taal DSI Panel"
> -         depends on OMAP2_DSS_DSI
> -diff --git a/drivers/video/omap2/displays/Makefile b/drivers/video/omap2/=
displays/Makefile
> -index 0f601ab..8abdf50 100644
> ---- a/drivers/video/omap2/displays/Makefile
> -+++ b/drivers/video/omap2/displays/Makefile
> -@@ -5,4 +5,5 @@ obj-$(CONFIG_PANEL_NEC_NL8048HL11_01B) +=3D panel-nec-nl8=
048hl11-01b.o
> -=20
> - obj-$(CONFIG_PANEL_TAAL) +=3D panel-taal.o
> - obj-$(CONFIG_PANEL_TPO_TD043MTEA1) +=3D panel-tpo-td043mtea1.o
> -+obj-$(CONFIG_PANEL_TFCS9700RTWV35TR01B) +=3D panel-tfc-s9700rtwv35tr01b.=
o
> - obj-$(CONFIG_PANEL_ACX565AKM) +=3D panel-acx565akm.o
> -diff --git a/drivers/video/omap2/displays/panel-tfc-s9700rtwv35tr01b.c b/=
drivers/video/omap2/displays/panel-tfc-s9700rtwv35tr01b.c
> -new file mode 100644
> -index 0000000..c2a1a19
> ---- /dev/null
> -+++ b/drivers/video/omap2/displays/panel-tfc-s9700rtwv35tr01b.c
> -@@ -0,0 +1,118 @@
> -+/*
> -+ * LCD panel driver for TFC S9700RTWV35TR-01B
> -+ *
> -+ * Copyright (C) 2011 Texas Instruments Inc
> -+ * Author: Roger Monk <r-monk@ti.com>
> -+ * =46rom Original by : Vaibhav Hiremath <hvaibhav@ti.com>
> -+ *
> -+ * This program is free software; you can redistribute it and/or modify i=
t
> -+ * under the terms of the GNU General Public License version 2 as publis=
hed by
> -+ * the Free Software Foundation.
> -+ *
> -+ * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> -+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or=

> -+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> -+ * more details.
> -+ *
> -+ * You should have received a copy of the GNU General Public License alo=
ng with
> -+ * this program.  If not, see <http://www.gnu.org/licenses/>.
> -+ */
> -+
> -+#include <linux/module.h>
> -+#include <linux/delay.h>
> -+#include <linux/device.h>
> -+#include <linux/err.h>
> -+
> -+#include <video/omapdss.h>
> -+
> -+static struct omap_video_timings tfc_timings =3D {
> -+    .x_res        =3D 800,
> -+    .y_res        =3D 480,
> -+
> -+    .pixel_clock    =3D 30000,
> -+
> -+    .hsw        =3D 49,
> -+    .hfp        =3D 41,
> -+    .hbp        =3D 40,
> -+
> -+    .vsw        =3D 4,
> -+    .vfp        =3D 14,
> -+    .vbp        =3D 29,
> -+};
> -+
> -+static int tfc_panel_probe(struct omap_dss_device *dssdev)
> -+{
> -+    dssdev->panel.config =3D OMAP_DSS_LCD_TFT | OMAP_DSS_LCD_IVS |
> -+        OMAP_DSS_LCD_IHS; // | OMAP_DSS_LCD_IEO; - TODO check this - doe=
sn't work with this enabled
> -+    dssdev->panel.acb =3D 0x0;
> -+    dssdev->panel.timings =3D tfc_timings;
> -+
> -+    return 0;
> -+}
> -+
> -+static void tfc_panel_remove(struct omap_dss_device *dssdev)
> -+{
> -+}
> -+
> -+static int tfc_panel_enable(struct omap_dss_device *dssdev)
> -+{
> -+    int r =3D 0;
> -+
> -+    /* wait couple of vsyncs until enabling the LCD */
> -+    msleep(50);
> -+
> -+    if (dssdev->platform_enable)
> -+        r =3D dssdev->platform_enable(dssdev);
> -+
> -+    return r;
> -+}
> -+
> -+static void tfc_panel_disable(struct omap_dss_device *dssdev)
> -+{
> -+    if (dssdev->platform_disable)
> -+        dssdev->platform_disable(dssdev);
> -+
> -+    /* wait at least 5 vsyncs after disabling the LCD */
> -+
> -+    msleep(100);
> -+}
> -+
> -+static int tfc_panel_suspend(struct omap_dss_device *dssdev)
> -+{
> -+    tfc_panel_disable(dssdev);
> -+    return 0;
> -+}
> -+
> -+static int tfc_panel_resume(struct omap_dss_device *dssdev)
> -+{
> -+    return tfc_panel_enable(dssdev);
> -+}
> -+
> -+static struct omap_dss_driver tfc_s9700_driver =3D {
> -+    .probe        =3D tfc_panel_probe,
> -+    .remove        =3D tfc_panel_remove,
> -+
> -+    .enable        =3D tfc_panel_enable,
> -+    .disable    =3D tfc_panel_disable,
> -+    .suspend    =3D tfc_panel_suspend,
> -+    .resume        =3D tfc_panel_resume,
> -+
> -+    .driver         =3D {
> -+        .name   =3D "tfc_s9700_panel",
> -+        .owner  =3D THIS_MODULE,
> -+    },
> -+};
> -+
> -+static int __init tfc_panel_drv_init(void)
> -+{
> -+    return omap_dss_register_driver(&tfc_s9700_driver);
> -+}
> -+
> -+static void __exit tfc_panel_drv_exit(void)
> -+{
> -+    omap_dss_unregister_driver(&tfc_s9700_driver);
> -+}
> -+
> -+module_init(tfc_panel_drv_init);
> -+module_exit(tfc_panel_drv_exit);
> -+MODULE_LICENSE("GPL");
> ---=20
> -1.6.6.1
> -
> diff --git a/recipes-kernel/linux/linux-3.0/ulcd/0002-omap3-beagle-added-l=
cd-driver.patch b/recipes-kernel/linux/linux-3.0/ulcd/0002-omap3-beagle-adde=
d-lcd-driver.patch
> deleted file mode 100644
> index a0d3b3c..0000000
> --- a/recipes-kernel/linux/linux-3.0/ulcd/0002-omap3-beagle-added-lcd-driv=
er.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -=46rom 6b0587615fd0099261d049be17f12eae9f92ae85 Mon Sep 17 00:00:00 2001
> -From: Jason Kridner <jkridner@beagleboard.org>
> -Date: Fri, 5 Aug 2011 18:07:09 +0000
> -Subject: [PATCH 2/4] omap3: beagle: added lcd driver
> -
> -This enables the tfc_s9700_panel by default.  Needs to be extended to
> -redefine the driver name at boot time.
> ----
> - arch/arm/mach-omap2/board-omap3beagle.c |   25 +++++++++++++++++++++++++=

> - 1 files changed, 25 insertions(+), 0 deletions(-)
> -
> -diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap=
2/board-omap3beagle.c
> -index 5e1d9f9..b525a5e 100644
> ---- a/arch/arm/mach-omap2/board-omap3beagle.c
> -+++ b/arch/arm/mach-omap2/board-omap3beagle.c
> -@@ -84,11 +84,13 @@ static struct {
> -    int usb_pwr_level;
> -    int reset_gpio;
> -    int usr_button_gpio;
> -+    char *lcd_driver_name;
> - } beagle_config =3D {
> -    .mmc1_gpio_wp =3D -EINVAL,
> -    .usb_pwr_level =3D GPIOF_OUT_INIT_LOW,
> -    .reset_gpio =3D 129,
> -    .usr_button_gpio =3D 4,
> -+    .lcd_driver_name =3D "",
> - };
> -=20
> - static struct gpio omap3_beagle_rev_gpios[] __initdata =3D {
> -@@ -387,9 +389,28 @@ static struct omap_dss_device beagle_tv_device =3D {=

> -    .phy.venc.type =3D OMAP_DSS_VENC_TYPE_SVIDEO,
> - };
> -=20
> -+static int beagle_enable_lcd(struct omap_dss_device *dssdev)
> -+{
> -+    return 0;
> -+}
> -+
> -+static int beagle_disable_lcd(struct omap_dss_device *dssdev)
> -+{
> -+}
> -+
> -+static struct omap_dss_device beagle_lcd_device =3D {
> -+    .name            =3D "lcd",
> -+    .driver_name        =3D "",
> -+    .type            =3D OMAP_DISPLAY_TYPE_DPI,
> -+    .phy.dpi.data_lines    =3D 24,
> -+    .platform_enable    =3D beagle_enable_lcd,
> -+    .platform_disable    =3D beagle_disable_lcd,
> -+};
> -+
> - static struct omap_dss_device *beagle_dss_devices[] =3D {
> -    &beagle_dvi_device,
> -    &beagle_tv_device,
> -+    &beagle_lcd_device,
> - };
> -=20
> - static struct omap_dss_board_info beagle_dss_data =3D {
> -@@ -733,6 +754,10 @@ static void __init omap3_beagle_init(void)
> -=20
> -    gpio_buttons[0].gpio =3D beagle_config.usr_button_gpio;
> -=20
> -+    /* TODO: set lcd_driver_name by command line or device tree */
> -+    beagle_config.lcd_driver_name =3D "tfc_s9700_panel";
> -+    beagle_lcd_device.driver_name =3D beagle_config.lcd_driver_name;
> -+
> -    platform_add_devices(omap3_beagle_devices,
> -            ARRAY_SIZE(omap3_beagle_devices));
> -    omap_display_init(&beagle_dss_data);
> ---=20
> -1.6.6.1
> -
> diff --git a/recipes-kernel/linux/linux-3.0/ulcd/0003-lcd-Set-LCD-power-en=
able-GPIO-in-board-file.patch b/recipes-kernel/linux/linux-3.0/ulcd/0003-lcd=
-Set-LCD-power-enable-GPIO-in-board-file.patch
> deleted file mode 100644
> index ccc510f..0000000
> --- a/recipes-kernel/linux/linux-3.0/ulcd/0003-lcd-Set-LCD-power-enable-GP=
IO-in-board-file.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -=46rom 4b175ec2e08d1fa4a0bbaeb79ee2381164572fba Mon Sep 17 00:00:00 2001
> -From: Joel A Fernandes <agnel.joel@gmail.com>
> -Date: Thu, 18 Aug 2011 16:19:40 -0500
> -Subject: [PATCH 3/4] lcd: Set LCD power-enable GPIO in board file
> -
> -With this, the ULCD-lite display works with the 3.0 kernel
> -
> -v2 changes:
> -Fixed the beagle_config structure
> -
> -Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ----
> - arch/arm/mach-omap2/board-omap3beagle.c |    7 +++++++
> - 1 files changed, 7 insertions(+), 0 deletions(-)
> -
> -diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap=
2/board-omap3beagle.c
> -index b525a5e..6b0afda 100644
> ---- a/arch/arm/mach-omap2/board-omap3beagle.c
> -+++ b/arch/arm/mach-omap2/board-omap3beagle.c
> -@@ -85,12 +85,14 @@ static struct {
> -    int reset_gpio;
> -    int usr_button_gpio;
> -    char *lcd_driver_name;
> -+    int lcd_pwren;
> - } beagle_config =3D {
> -    .mmc1_gpio_wp =3D -EINVAL,
> -    .usb_pwr_level =3D GPIOF_OUT_INIT_LOW,
> -    .reset_gpio =3D 129,
> -    .usr_button_gpio =3D 4,
> -    .lcd_driver_name =3D "",
> -+    .lcd_pwren =3D 156
> - };
> -=20
> - static struct gpio omap3_beagle_rev_gpios[] __initdata =3D {
> -@@ -423,6 +425,11 @@ static void __init beagle_display_init(void)
> - {
> -    int r;
> -=20
> -+    r =3D gpio_request_one(beagle_config.lcd_pwren, GPIOF_OUT_INIT_LOW,
> -+                 "LCD power");
> -+    if (r < 0)
> -+        printk(KERN_ERR "Unable to get LCD power enable GPIO\n");
> -+
> -    r =3D gpio_request_one(beagle_dvi_device.reset_gpio, GPIOF_OUT_INIT_L=
OW,
> -                 "DVI reset");
> -    if (r < 0)
> ---=20
> -1.6.6.1
> -
> diff --git a/recipes-kernel/linux/linux-3.0/ulcd/0004-Make-fbset-show-corr=
ect-timing-values.patch b/recipes-kernel/linux/linux-3.0/ulcd/0004-Make-fbse=
t-show-correct-timing-values.patch
> deleted file mode 100644
> index fb37e96..0000000
> --- a/recipes-kernel/linux/linux-3.0/ulcd/0004-Make-fbset-show-correct-tim=
ing-values.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -=46rom 1d70480dca0c7648f5f51fad5ffb0e191212615a Mon Sep 17 00:00:00 2001
> -From: Joel A Fernandes <agnel.joel@gmail.com>
> -Date: Wed, 17 Aug 2011 00:28:49 -0500
> -Subject: [PATCH 4/4] Make fbset show correct timing values
> -
> -Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> -Cc: "Monk, Roger" <r-monk@ti.com>
> ----
> - .../omap2/displays/panel-tfc-s9700rtwv35tr01b.c    |    8 +++++++-
> - 1 files changed, 7 insertions(+), 1 deletions(-)
> -
> -diff --git a/drivers/video/omap2/displays/panel-tfc-s9700rtwv35tr01b.c b/=
drivers/video/omap2/displays/panel-tfc-s9700rtwv35tr01b.c
> -index c2a1a19..6afd4e3 100644
> ---- a/drivers/video/omap2/displays/panel-tfc-s9700rtwv35tr01b.c
> -+++ b/drivers/video/omap2/displays/panel-tfc-s9700rtwv35tr01b.c
> -@@ -88,6 +88,12 @@ static int tfc_panel_resume(struct omap_dss_device *ds=
sdev)
> -    return tfc_panel_enable(dssdev);
> - }
> -=20
> -+static void tfc_panel_get_timings(struct omap_dss_device *dssdev,
> -+                    struct omap_video_timings *timings)
> -+{
> -+        *timings =3D dssdev->panel.timings;
> -+}
> -+
> - static struct omap_dss_driver tfc_s9700_driver =3D {
> -    .probe        =3D tfc_panel_probe,
> -    .remove        =3D tfc_panel_remove,
> -@@ -96,7 +102,7 @@ static struct omap_dss_driver tfc_s9700_driver =3D {
> -    .disable    =3D tfc_panel_disable,
> -    .suspend    =3D tfc_panel_suspend,
> -    .resume        =3D tfc_panel_resume,
> --
> -+    .get_timings =3D tfc_panel_get_timings,
> -    .driver         =3D {
> -        .name   =3D "tfc_s9700_panel",
> -        .owner  =3D THIS_MODULE,
> ---=20
> -1.6.6.1
> -
> diff --git a/recipes-kernel/linux/linux-3.0/ulcd/lcd-Set-LCD-power-enable-=
GPIO-in-board-file.eml b/recipes-kernel/linux/linux-3.0/ulcd/lcd-Set-LCD-pow=
er-enable-GPIO-in-board-file.eml
> deleted file mode 100644
> index b9190ca..0000000
> --- a/recipes-kernel/linux/linux-3.0/ulcd/lcd-Set-LCD-power-enable-GPIO-in=
-board-file.eml
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -Received: from dflp51.itg.ti.com (128.247.22.94) by dfle71.ent.ti.com
> - (128.247.5.62) with Microsoft SMTP Server id 14.1.323.3; Thu, 18 Aug 201=
1
> - 16:20:16 -0500
> -Received: from medina.ext.ti.com (medina.ext.ti.com [192.91.81.31])    by=

> - dflp51.itg.ti.com (8.13.7/8.13.8) with ESMTP id p7ILKGO6027015;    Thu, 1=
8 Aug
> - 2011 16:20:16 -0500 (CDT)
> -Received: from psmtp.com (na3sys009amx237.postini.com [74.125.149.121])  =
  by
> - medina.ext.ti.com (8.13.7/8.13.7) with SMTP id p7ILKEGV022138
> -    (version=3DTLSv1/SSLv3 cipher=3DDHE-RSA-AES256-SHA bits=3D256 verify=3D=
NO);    Thu, 18
> - Aug 2011 16:20:15 -0500
> -Received: from mail-gw0-f44.google.com ([74.125.83.44]) (using TLSv1) by
> - na3sys009amx237.postini.com ([74.125.148.10]) with SMTP;    Thu, 18 Aug 2=
011
> - 21:20:15 GMT
> -Received: by mail-gw0-f44.google.com with SMTP id 20so1795458gwb.17      =
  for
> - <multiple recipients>; Thu, 18 Aug 2011 14:20:14 -0700 (PDT)
> -DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed;
> -        d=3Dgmail.com; s=3Dgamma;
> -        h=3Dfrom:to:cc:subject:date:message-id:x-mailer:to;
> -        bh=3DmlO4rjFmkzRMnrhhsfu4anyqiGVR0mfhw8disZTMggI=3D;
> -        b=3DXpmCdVu85QAFxt+f5UO9s0ydtoTSA6cX3WkfODm1HLusGTYtuKWP8bri6FZdV=
3OCHY
> -         CurUDzbnIAGqr4lB6FaSbcLRBuId09NJZoxxAIiJn4m3b+AsvvqKnp+0UukUbvgV=
MGcE
> -         TzKUD3ZN/ctVJueHCmGFhsOYJqW6ZC+IOwTok=3D
> -Received: by 10.236.176.67 with SMTP id a43mr1382161yhm.54.1313702414483;=

> -        Thu, 18 Aug 2011 14:20:14 -0700 (PDT)
> -Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])      =
  by
> - mx.google.com with ESMTPS id b24sm219554yhm.11.2011.08.18.14.20.12
> -        (version=3DTLSv1/SSLv3 cipher=3DOTHER);        Thu, 18 Aug 2011 1=
4:20:13
> - -0700 (PDT)
> -From: Joel A Fernandes <agnel.joel@gmail.com>
> -To: <beagleboard@googlegroups.com>, <beagleboard@googlegroups.com>
> -CC: Joel A Fernandes <agnel.joel@gmail.com>, <jdk@ti.com>, <k-kooi@ti.com=
>,
> -    "Coley, Gerald" <g-coley1@ti.com>, "Monk, Roger" <r-monk@ti.com>, "Po=
rter,
> - Matt" <mporter@ti.com>
> -Subject: [PATCH v2] lcd: Set LCD power-enable GPIO in board file
> -Date: Thu, 18 Aug 2011 16:19:40 -0500
> -Message-ID: <1313702380-6539-1-git-send-email-agnel.joel@gmail.com>
> -X-Mailer: git-send-email 1.7.1
> -X-pstn-neptune: 0/0/0.00/0
> -X-pstn-levels: (S:31.84097/99.90000 CV:99.9000 FC:95.5390 LC:95.5390 R:95=
.9108 P:95.9108 M:97.0282 C:98.6951 )
> -X-pstn-settings: 2 (0.5000:0.0750) s cv GT3 gt2 gt1 r p m=20
> -X-pstn-addresses: from <agnel.joel@gmail.com> [db-null]=20
> -Content-Type: text/plain
> -Return-Path: agnel.joel@gmail.com
> -X-MS-Exchange-Organization-AuthSource: DFLE71.ent.ti.com
> -X-MS-Exchange-Organization-AuthAs: Internal
> -X-MS-Exchange-Organization-AuthMechanism: 10
> -X-MS-Exchange-Organization-AVStamp-Mailbox: SYMANTEC;420610240;0;info
> -MIME-Version: 1.0
> -
> -With this, the ULCD-lite display works with the 3.0 kernel
> -
> -v2 changes:
> -Fixed the beagle_config structure
> -
> -Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ----
> - arch/arm/mach-omap2/board-omap3beagle.c |    7 +++++++
> - 1 files changed, 7 insertions(+), 0 deletions(-)
> -
> -diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap=
2/board-omap3beagle.c
> -index d49c1e2..08f06ff 100644
> ---- a/arch/arm/mach-omap2/board-omap3beagle.c
> -+++ b/arch/arm/mach-omap2/board-omap3beagle.c
> -@@ -90,12 +90,14 @@ static struct {
> -    int reset_gpio;
> -    int usr_button_gpio;
> -    char *lcd_driver_name;
> -+    int lcd_pwren;
> - } beagle_config =3D {
> -    .mmc1_gpio_wp =3D -EINVAL,
> -    .usb_pwr_level =3D GPIOF_OUT_INIT_LOW,
> -    .reset_gpio =3D 129,
> -    .usr_button_gpio =3D 4,
> -    .lcd_driver_name =3D "",
> -+    .lcd_pwren =3D 156
> - };
> -=20
> - static struct gpio omap3_beagle_rev_gpios[] __initdata =3D {
> -@@ -428,6 +430,11 @@ static void __init beagle_display_init(void)
> - {
> -    int r;
> -=20
> -+    r =3D gpio_request_one(beagle_config.lcd_pwren, GPIOF_OUT_INIT_LOW,
> -+                 "LCD power");
> -+    if (r < 0)
> -+        printk(KERN_ERR "Unable to get LCD power enable GPIO\n");
> -+
> -    r =3D gpio_request_one(beagle_dvi_device.reset_gpio, GPIOF_OUT_INIT_L=
OW,
> -                 "DVI reset");
> -    if (r < 0)
> ---=20
> -1.7.1
> -
> diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linu=
x_3.0.bb
> index 765c8de..871a698 100644
> --- a/recipes-kernel/linux/linux_3.0.bb
> +++ b/recipes-kernel/linux/linux_3.0.bb
> @@ -10,7 +10,7 @@ PV =3D "3.0.4"
> SRCREV_pn-${PN} =3D "04aa37b5f943920017ad094e776cd5514b1a9246"
>=20
> # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/i=
nclude/omap3.inc
> -MACHINE_KERNEL_PR_append =3D "c"
> +MACHINE_KERNEL_PR_append =3D "d"
>=20
> FILESPATH =3D. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACH=
INE}:"
>=20
> @@ -190,6 +190,8 @@ SRC_URI +=3D "git://git.kernel.org/pub/scm/linux/kerne=
l/git/stable/linux-3.0.y.git
>             file://beagle/0004-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch \
>             file://beagle/0005-omap3-Add-basic-support-for-720MHz-part.pat=
ch \
>             file://beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-er=
rors.patch \
> +            file://beagle/0007-OMAP2-add-cpu-id-register-to-MAC-address-h=
elper.patch \
> +            file://beagle/0008-HACK-OMAP2-BeagleBoard-Fix-up-random-or-mi=
ssing-MAC-.patch \
>             file://madc/0001-Enabling-Hwmon-driver-for-twl4030-madc.patch \=

>             file://madc/0002-mfd-twl-core-enable-madc-clock.patch \
>             \
> @@ -210,10 +212,7 @@ SRC_URI +=3D "git://git.kernel.org/pub/scm/linux/kern=
el/git/stable/linux-3.0.y.git
>             \
>             file://sgx/0001-ARM-L2-Add-and-export-outer_clean_all.patch \
>             \
> -            file://ulcd/0001-omap2-displays-Add-support-for-ThreeFiveCorp=
-S9700-D.patch \
> -            file://ulcd/0002-omap3-beagle-added-lcd-driver.patch \
> -            file://ulcd/0003-lcd-Set-LCD-power-enable-GPIO-in-board-file.=
patch \
> -            file://ulcd/0004-Make-fbset-show-correct-timing-values.patch \=

> +            file://ulcd/0001-OMAP_VOUT-Fix-build-break-caused-by-update_m=
ode-remo.patch \
>             \
>             file://omap4/0001-OMAP-Fix-linking-error-in-twl-common.c-for-O=
MAP2-3-4.patch \
>             \
> --=20
> 1.7.4.1
>=20



Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id C31806B772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 09:36:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7G9aXUI017457
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 05:36:33 -0400 (EDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 02:36:31 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 17:36:33 +0800
Message-ID: <e70fe2d2d4ee875f6a5e3d420cd13db1c99a5f70.1376645731.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1376645731.git.Qi.Chen@windriver.com>
References: <cover.1376645731.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 1/1] initscripts: remove obsolete device_table.txt
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
X-List-Received-Date: Fri, 16 Aug 2013 09:36:34 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

device_table.txt was once used by an init script named 'devices' to
create the basic files under /dev. However, it's no longer used now.
The devices init script has been removed, and makedevs command has been
disabled by default in busybox.

Besides, considering the device managers and devtmpfs filesystem, this
file is not likely to be used again. So we remove it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts/initscripts-1.0/device_table.txt   |  197 --------------------
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 -
 2 files changed, 199 deletions(-)
 delete mode 100644 meta/recipes-core/initscripts/initscripts-1.0/device_table.txt

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/device_table.txt b/meta/recipes-core/initscripts/initscripts-1.0/device_table.txt
deleted file mode 100644
index a302c5a..0000000
--- a/meta/recipes-core/initscripts/initscripts-1.0/device_table.txt
+++ /dev/null
@@ -1,197 +0,0 @@
-#/dev/		d	775	0	0	-	-	-	-	-
-#/dev/msys	d	775	0	0	-	-	-	-	-
-#/dev/pts	d	775	0	0	-	-	-	-	-
-#/var		d	775	0	0	-	-	-	-	-
-/boot/var/empty	d	755	0	3	-	-	-	-
-/dev/apm_bios	c	660	0	46	10	134	-	-	-
-/dev/audio	c	660	0	29	14	4	-	-	-
-/dev/audio1	c	660	0	29	14	20	-	-	-
-/dev/audio2	c	660	0	29	14	36	-	-	-
-/dev/audio3	c	660	0	29	14	52	-	-	-
-/dev/bty	c	644	0	0	60	0	0	1	5
-/dev/sharp_fl	c	640	0	44	254	0	-	-	-
-/dev/console	c	660	0	5	5	1	-	-
-/dev/cusa0	c	640	0	0	205	5	-	-	-
-/dev/cusa1	c	640	0	0	205	6	-	-	-
-/dev/cusa2	c	640	0	0	205	7	-	-	-
-/dev/dsp	c	660	0	29	14	3	-	-	-
-/dev/dsp1	c	660	0	29	14	19	-	-	-
-/dev/dsp2	c	660	0	29	14	35	-	-	-
-/dev/dsp3	c	660	0	29	14	51	-	-	-
-/dev/fb		c	660	0	44	29	0	0	32	2
-/dev/fb0autodetect	c	660	0	44	29	1	-	-	-
-/dev/fb0current	c	660	0	44	29	0	-	-	-
-#/dev/fb1	c	660	0	44	29	32	-	-	-
-/dev/fb1autodetect	c	660	0	44	29	33	-	-	-
-/dev/fb1current	c	660	0	44	29	32	-	-	-
-/dev/full	c	666	0	7	-	-	-
-/dev/hda	b	660	0	6	3	0	-	-	-
-/dev/hda	b	660	0	6	3	1	1	1	20
-/dev/hdb	b	660	0	6	3	64	-	-	-
-/dev/hdb	b	660	0	6	3	65	1	1	20
-/dev/hdc	b	660	0	6	22	0	-	-	-
-/dev/hdc	b	660	0	6	22	1	1	1	20
-/dev/initctl	p	600	0	0	-	-	-	-
-/dev/i2c0	c	660	0	0	89	0	-	-	-
-/dev/inportbm	c	660	0	0	10	2	-	-	-
-/dev/input/event c	660	0	0	13	64	0	1       20
-/dev/ircomm0	c	640	0	0	161	0	-	-	-
-/dev/jbm	c	660	0	0	10	4	-	-	-
-/dev/kmem	c	640	0	15	1	2	-	-	-
-/dev/lirc	c	660	0	5	61	0	-	-	-
-/dev/logibm	c	660	0	0	10	0	-	-	-
-/dev/loop0	b	660	0	11	7	0	-	-	-
-/dev/loop1	b	660	0	11	7	1	-	-	-
-/dev/mem	c	640	0	15	1	1	-	-	-
-/dev/mixer	c	666	0	0	14	0	-	-	-
-/dev/mixer1	c	666	0	0	14	16	-	-	-
-/dev/mixer2	c	666	0	0	14	32	-	-	-
-/dev/mixer3	c	666	0	0	14	48	-	-	-
-/dev/mmcda	b	640	0	0	60	0	-	-	-
-/dev/mmcda1	b	640	0	0	60	1	-	-	-
-/dev/mmcda2	b	640	0	0	60	2	-	-	-
-/dev/msys/fla	b	660	0	11	100	0	-	-	-
-/dev/msys/fla1	b	660	0	11	100	1	-	-	-
-/dev/msys/fla2	b	660	0	11	100	2	-	-	-
-/dev/msys/fla3	b	660	0	11	100	3	-	-	-
-/dev/msys/fla4	b	660	0	11	100	4	-	-	-
-/dev/msys/flb	b	660	0	11	100	64	-	-	-
-/dev/msys/flb1	b	660	0	11	100	65	-	-	-
-/dev/msys/flb2	b	660	0	11	100	66	-	-	-
-/dev/msys/flb3	b	660	0	11	100	67	-	-	-
-/dev/msys/flb4	b	660	0	11	100	68	-	-	-
-/dev/mtd	c	660	0	6	90	0	0	2	8
-/dev/mtdblock	b	640	0	0	31	0	0	1	8
-/dev/nst0	c	664	0	11	9	128	-	-	-
-/dev/nst0a	c	664	0	11	9	224	-	-	-
-/dev/nst0l	c	664	0	11	9	160	-	-	-
-/dev/nst0m	c	664	0	11	9	192	-	-	-
-/dev/nst1	c	664	0	11	9	129	-	-	-
-/dev/nst1a	c	664	0	11	9	225	-	-	-
-/dev/nst1l	c	664	0	11	9	161	-	-	-
-/dev/nst1m	c	664	0	11	9	193	-	-	-
-/dev/null	c	666	0	0	1	3	-	-	-
-/dev/par0	c	660	0	7	6	0	-	-	-
-/dev/par1	c	660	0	7	6	1	-	-	-
-/dev/par2	c	660	0	7	6	2	-	-	-
-/dev/port	c	640	0	15	1	4	-	-	-
-/dev/ppp	c	640	0	0	108	0	-	-	-
-/dev/psaux	c	660	0	0	10	1	-	-	-
-/dev/ptmx	c	666	0	5	5	2	-	-	-
-/dev/ptya0	c	660	0	5	2	176	-	-	-
-/dev/ptya1	c	660	0	5	2	177	-	-	-
-/dev/ptya2	c	660	0	5	2	178	-	-	-
-/dev/ptya3	c	660	0	5	2	179	-	-	-
-/dev/ptya4	c	660	0	5	2	180	-	-	-
-/dev/ptya5	c	660	0	5	2	181	-	-	-
-/dev/ptya6	c	660	0	5	2	182	-	-	-
-/dev/ptya7	c	660	0	5	2	183	-	-	-
-/dev/ptya8	c	660	0	5	2	184	-	-	-
-/dev/ptya9	c	660	0	5	2	185	-	-	-
-/dev/ptyaa	c	660	0	5	2	186	-	-	-
-/dev/ptyab	c	660	0	5	2	187	-	-	-
-/dev/ptyac	c	660	0	5	2	188	-	-	-
-/dev/ptyad	c	660	0	5	2	189	-	-	-
-/dev/ptyae	c	660	0	5	2	190	-	-	-
-/dev/ptyaf	c	660	0	5	2	191	-	-	-
-/dev/ram	b	640	0	0	1	0	0	1	4
-/dev/random	c	444	0	0	1	8	-	-	-
-/dev/rfcomm0	c	660	0	0	216	0	-	-	-
-/dev/rfcomm1	c	660	0	0	216	1	-	-	-
-/dev/rfcomm2	c	660	0	0	216	2	-	-	-
-/dev/rfcomm3	c	660	0	0	216	3	-	-	-
-/dev/rfcomm4	c	660	0	0	216	4	-	-	-
-/dev/rfcomm5	c	660	0	0	216	5	-	-	-
-/dev/rfcomm6	c	660	0	0	216	6	-	-	-
-/dev/rfcomm7	c	660	0	0	216	7	-	-	-
-/dev/rfcomm8	c	660	0	0	216	8	-	-	-
-/dev/rfcomm9	c	660	0	0	216	9	-	-	-
-/dev/rfcomm10	c	660	0	0	216	10	-	-	-
-/dev/rfcomm11	c	660	0	0	216	11	-	-	-
-/dev/rfcomm12	c	660	0	0	216	12	-	-	-
-/dev/rfcomm13	c	660	0	0	216	13	-	-	-
-/dev/rfcomm14	c	660	0	0	216	14	-	-	-
-/dev/rfcomm15	c	660	0	0	216	15	-	-	-
-/dev/rmidi0	c	660	0	0	35	64	-	-	-
-/dev/rmidi1	c	660	0	0	35	65	-	-	-
-/dev/rmidi2	c	660	0	0	35	66	-	-	-
-/dev/rmidi3	c	660	0	0	35	67	-	-	-
-/dev/rtc	c	660	0	47	10	135	-	-	-
-/dev/scd0	b	660	0	6	11	0	-	-	-
-/dev/scd1	b	660	0	6	11	1	-	-	-
-/dev/sda	b	660	0	6	8	0	-	-	-
-/dev/sda1	b	660	0	6	8	1	-	-	-
-/dev/sda2	b	660	0	6	8	2	-	-	-
-/dev/sda3	b	660	0	6	8	3	-	-	-
-/dev/sda4	b	660	0	6	8	4	-	-	-
-/dev/sda5	b	660	0	6	8	5	-	-	-
-/dev/sda6	b	660	0	6	8	6	-	-	-
-/dev/sda7	b	660	0	6	8	7	-	-	-
-/dev/sda8	b	660	0	6	8	8	-	-	-
-/dev/sda9	b	660	0	6	8	9	-	-	-
-/dev/sdb	b	660	0	6	8	16	-	-	-
-/dev/sdb1	b	660	0	6	8	17	-	-	-
-/dev/sdb2	b	660	0	6	8	18	-	-	-
-/dev/sdb3	b	660	0	6	8	19	-	-	-
-/dev/sdb4	b	660	0	6	8	20	-	-	-
-/dev/sdb5	b	660	0	6	8	21	-	-	-
-/dev/sdb6	b	660	0	6	8	22	-	-	-
-/dev/sdb7	b	660	0	6	8	23	-	-	-
-/dev/sdb8	b	660	0	6	8	24	-	-	-
-/dev/sdb9	b	660	0	6	8	25	-	-	-
-/dev/sdc	b	660	0	6	8	32	-	-	-
-/dev/sdc1	b	660	0	6	8	33	-	-	-
-/dev/sdc2	b	660	0	6	8	34	-	-	-
-/dev/sdc3	b	660	0	6	8	35	-	-	-
-/dev/sdc4	b	660	0	6	8	36	-	-	-
-/dev/sdc5	b	660	0	6	8	37	-	-	-
-/dev/sdc6	b	660	0	6	8	38	-	-	-
-/dev/sdc7	b	660	0	6	8	39	-	-	-
-/dev/sdc8	b	660	0	6	8	40	-	-	-
-/dev/sdc9	b	660	0	6	8	41	-	-	-
-/dev/sd_slotstat	c	660	0	6	10	240	-	-	-
-/dev/sharp_audioctl	c	660	0	29	10	213	-	-	-
-/dev/sharp_buz	c	660	0	29	10	211	-	-	-
-/dev/sharp_kbdctl	c	660	0	45	10	214	-	-	-
-/dev/sharp_led	c	660	0	48	10	210	-	-	-
-/dev/sharp_ts	c	640	0	45	11	0	-	-	-
-/dev/smtpe0	c	640	0	0	35	128	-	-	-
-/dev/smtpe1	c	640	0	0	35	129	-	-	-
-/dev/smtpe2	c	640	0	0	35	130	-	-	-
-/dev/smtpe3	c	640	0	0	35	131	-	-	-
-/dev/sndstat	c	660	0	29	14	6	-	-	-
-/dev/snd/seq	c	660	0	0	116	1	-	-	-
-/dev/snd/timer	c	660	0	0	116	33	-	-	-
-/dev/snd/controlC0	c	660	0	0	116	0	-	-	-
-/dev/snd/controlC1	c	660	0	0	116	32	-	-	-
-/dev/snd/controlC2	c	660	0	0	116	64	-	-	-
-/dev/snd/controlC3	c	660	0	0	116	96	-	-	-
-/dev/snd/hwC0D0	c	660	0	0	116	4	-	-	-
-/dev/snd/hwC0D1	c	660	0	0	116	5	-	-	-
-/dev/snd/hwC0D2	c	660	0	0	116	6	-	-	-
-/dev/snd/hwC0D3	c	660	0	0	116	7	-	-	-
-/dev/snd/pcmC0D0c	c	660	0	0	116	24	-	-	-
-/dev/snd/pcmC0D0p	c	660	0	0	116	16	-	-	-
-/dev/snd/pcmC0D1c	c	660	0	0	116	25	-	-	-
-/dev/snd/pcmC0D1p	c	660	0	0	116	17	-	-	-
-/dev/snd/pcmC0D2c	c	660	0	0	116	26	-	-	-
-/dev/snd/pcmC0D2p	c	660	0	0	116	18	-	-	-
-/dev/snd/pcmC0D3c	c	660	0	0	116	27	-	-	-
-/dev/snd/pcmC0D3p	c	660	0	0	116	19	-	-	-
-/dev/st0	c	660	0	11	9	0	-	-	-
-/dev/st0a	c	660	0	11	9	96	-	-	-
-/dev/st0l	c	660	0	11	9	32	-	-	-
-/dev/st0m	c	660	0	11	9	64	-	-	-
-/dev/st1	c	660	0	11	9	1	-	-	-
-/dev/st1a	c	660	0	11	9	97	-	-	-
-/dev/st1l	c	660	0	11	9	33	-	-	-
-/dev/st1m	c	660	0	11	9	65	-	-	-
-/dev/tty	c	664	0	5	5	0	-	-	-
-/dev/tty	c	666	0	5	4	0	0	1	9
-/dev/ttyS	c	640	0	5	4	64	0	1	4
-/dev/ttySA	c	640	0	5	204	5	0	1	4
-/dev/ttyUSB	c	660	0	5	188	0	0	1	2
-/dev/urandom	c	644	0	0	1	9	-	-	-
-/dev/usbmouse	c	640	0	45	10	32	-	-	-
-/dev/zero	c	644	0	0	1	5	-	-	-
-/dev/input/mice	c	660	0	0	13	63	-	-	-
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 52e1c9c..5b5085f 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -26,7 +26,6 @@ SRC_URI = "file://functions \
            file://checkroot.sh \
            file://umountnfs.sh \
            file://sysfs.sh \
-           file://device_table.txt \
            file://populate-volatile.sh \
            file://read-only-rootfs-hook.sh \
            file://volatiles \
@@ -103,7 +102,6 @@ do_install () {
 #
 	install -m 0755 ${WORKDIR}/banner.sh	${D}${sysconfdir}/init.d/banner.sh
 	install -m 0755 ${WORKDIR}/umountfs	${D}${sysconfdir}/init.d/umountfs
-	install -m 0755		${WORKDIR}/device_table.txt		${D}${sysconfdir}/device_table
 #
 # Create runlevel links
 #
-- 
1.7.9.5



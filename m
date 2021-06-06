Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.25800.1623000258279588624
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 21B9A38C1262
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:18 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.5 SUCCEEDED
Message-ID: <MADEUP.16860E22D28015BC.29797@lists.openembedded.org>
X-Groupsio-MsgNum: 152728
Content-Type: multipart/mixed; boundary="===============2506612229168156137=="

--===============2506612229168156137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-ucm-conf* to *1.2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.4-1.2.5.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============2506612229168156137==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.4-1.2.5.patch"

From 52cfa1401330a034327c81b03c873db8f850be96 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 15:38:53 +0000
Subject: [PATCH] alsa-ucm-conf: upgrade 1.2.4 -> 1.2.5

---
 .../alsa/{alsa-ucm-conf_1.2.4.bb => alsa-ucm-conf_1.2.5.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.4.bb => alsa-ucm-conf_1.2.5.bb} (84%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb
similarity index 84%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb
index 32cf41c8fd..23c69867d9 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "2c3b535c77dcb9aaf62a61f4f8324f1ab184162f105f7ec9ed1e37c742fcd340"
+SRC_URI[sha256sum] = "093ae3d85a5e6fd2cd1cc27feda400d7191382fb8b5e5e23497286c87c1507a5"
 
 inherit allarch
 
@@ -18,6 +18,7 @@ do_install() {
         cp -r "${S}/ucm2" "${D}${datadir}/alsa"
 }
 
+S = "${WORKDIR}/alsa-ucm-conf-1.2.4.81.g4884e"
 PACKAGES = "${PN}"
 
 FILES_${PN} = "*"
-- 
2.17.1


--===============2506612229168156137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/sof-soundwire/rt1308-4.conf", added "/usr/share/alsa/ucm2/conf.d/tegra/ASUS Google Nexus 7 ALC5642.conf /usr/share/alsa/ucm2/conf.d/tegra/GoogleNyanBig.conf /usr/share/alsa/ucm2/conf.d/tegra/Compal PAZ00.conf /usr/share/alsa/ucm2/conf.d/DB820c/DB820c.conf /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Main-Audio-HiFi.conf /usr/share/alsa/ucm2/codecs/rt5645/init.conf /usr/share/alsa/ucm2/conf.d/tegra/GoogleNyanBlaze.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC0EnableSeq.conf /usr/share/alsa/ucm2/codecs/wm5102/HeadPhones.conf /usr/share/alsa/ucm2/lib/ctl-remap.conf /usr/share/alsa/ucm2/sof-soundwire/rt1308-1.conf /usr/share/alsa/ucm2/conf.d/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf /usr/share/alsa/ucm2/Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf /usr/share/alsa/ucm2/sof-soundwire/rt711-sdca.conf /usr/share/al
 sa/ucm2/lib/generic.conf /usr/share/alsa/ucm2/bytcr-wm5102/HiFi.conf /usr/share/alsa/ucm2/conf.virt.d/.gitignore /usr/share/alsa/ucm2/conf.d/tegra/Acer Iconia Tab A500 WM8903.conf /usr/share/alsa/ucm2/Tegra/rt5640/ASUS Google Nexus 7 ALC5642.conf /usr/share/alsa/ucm2/conf.d/DB410c/DB410c.conf /usr/share/alsa/ucm2/Tegra/wm8903/Acer Iconia Tab A500 WM8903.conf /usr/share/alsa/ucm2/lib/card-init.conf /usr/share/alsa/ucm2/bytcr-wm5102/bytcr-wm5102.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Main-Audio.conf /usr/share/alsa/ucm2/codecs/nau8824/DMIC1_2.conf /usr/share/alsa/ucm2/codecs/rt5651/init.conf /usr/share/alsa/ucm2/Qualcomm/sm8250/HiFi.conf /usr/share/alsa/ucm2/codecs/wm5102/EnableSeq.conf /usr/share/alsa/ucm2/codecs/rt715-sdca/init.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/SpeakerDisableSeq.conf /usr/share/alsa/ucm2/codecs/rt711-sdca/init.conf /usr/share/alsa/ucm2/sof-soundwire/rt715-sdca.conf /usr/share/als
 a/ucm2/codecs/qcom-lpass/wsa-macro/SpeakerEnableSeq.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC0DisableSeq.conf /usr/share/alsa/ucm2/codecs/wm5102/Speaker.conf /usr/share/alsa/ucm2/sof-soundwire/dmic.conf /usr/share/alsa/ucm2/codecs/wm5102/IN3-InternalMic.conf /usr/share/alsa/ucm2/codecs/rt5640/init.conf /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Front-Headphone.conf /usr/share/alsa/ucm2/codecs/wm5102/IN1-HeadsetMic.conf /usr/share/alsa/ucm2/Qualcomm/sm8250/HDMI.conf /usr/share/alsa/ucm2/conf.d/sdm845/DB845c.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 154121 to 181817 (+18%)
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/kblrt5660/Hdmi1.conf changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/alsa/ucm2/kblrt5660/Hdmi2.conf changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/alsa/ucm2/kblrt5660/HiFi.conf changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/alsa/ucm2/kblrt5660/kblrt5660.conf changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/alsa/ucm2/sof-soundwire/rt1308-4.conf moved to /usr/share/alsa/ucm2/sof-soundwire/rt1308-1.conf
  /usr/share/alsa/ucm2/sof-soundwire/rt1308-4.conf moved to /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf
  /usr/share/alsa/ucm2/sof-soundwire/rt1308-4.conf moved to /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf
  /usr/share/alsa/ucm2/bytcr-wm5102 was added
  /usr/share/alsa/ucm2/bytcr-wm5102/bytcr-wm5102.conf was added
  /usr/share/alsa/ucm2/bytcr-wm5102/HiFi.conf was added
  /usr/share/alsa/ucm2/codecs/nau8824/DMIC1_2.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC0DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC0EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/SpeakerDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/SpeakerEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/rt5640/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt5645/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt5651/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt711-sdca was added
  /usr/share/alsa/ucm2/codecs/rt711-sdca/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt715-sdca was added
  /usr/share/alsa/ucm2/codecs/rt715-sdca/init.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102 was added
  /usr/share/alsa/ucm2/codecs/wm5102/EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/HeadPhones.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/IN1-HeadsetMic.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/IN3-InternalMic.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/Speaker.conf was added
  /usr/share/alsa/ucm2/conf.d was added
  /usr/share/alsa/ucm2/conf.d/DB410c was added
  /usr/share/alsa/ucm2/conf.d/DB410c/DB410c.conf was added
  /usr/share/alsa/ucm2/conf.d/DB820c was added
  /usr/share/alsa/ucm2/conf.d/DB820c/DB820c.conf was added
  /usr/share/alsa/ucm2/conf.d/sdm845 was added
  /usr/share/alsa/ucm2/conf.d/sdm845/DB845c.conf was added
  /usr/share/alsa/ucm2/conf.d/sm8250 was added
  /usr/share/alsa/ucm2/conf.d/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf was added
  /usr/share/alsa/ucm2/conf.d/tegra was added
  /usr/share/alsa/ucm2/conf.d/tegra/Acer Iconia Tab A500 WM8903.conf was added
  /usr/share/alsa/ucm2/conf.d/tegra/ASUS Google Nexus 7 ALC5642.conf was added
  /usr/share/alsa/ucm2/conf.d/tegra/Compal PAZ00.conf was added
  /usr/share/alsa/ucm2/conf.d/tegra/GoogleNyanBig.conf was added
  /usr/share/alsa/ucm2/conf.d/tegra/GoogleNyanBlaze.conf was added
  /usr/share/alsa/ucm2/conf.virt.d was added
  /usr/share/alsa/ucm2/conf.virt.d/.gitignore was added
  /usr/share/alsa/ucm2/lib was added
  /usr/share/alsa/ucm2/lib/card-init.conf was added
  /usr/share/alsa/ucm2/lib/ctl-remap.conf was added
  /usr/share/alsa/ucm2/lib/generic.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8250 was added
  /usr/share/alsa/ucm2/Qualcomm/sm8250/HDMI.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8250/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/dmic.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt711-sdca.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt715-sdca.conf was added
  /usr/share/alsa/ucm2/Tegra/rt5640 was added
  /usr/share/alsa/ucm2/Tegra/rt5640/ASUS Google Nexus 7 ALC5642.conf was added
  /usr/share/alsa/ucm2/Tegra/wm8903 was added
  /usr/share/alsa/ucm2/Tegra/wm8903/Acer Iconia Tab A500 WM8903.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Front-Headphone.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Main-Audio.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Main-Audio-HiFi.conf was added

--===============2506612229168156137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.4" to "1.2.5"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: FILELIST: removed "/usr/share/alsa/ucm2/sof-soundwire/rt1308-4.conf", added "/usr/share/alsa/ucm2/codecs/rt5651/init.conf /usr/share/alsa/ucm2/codecs/rt715-sdca/init.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf /usr/share/alsa/ucm2/Tegra/wm8903/Acer Iconia Tab A500 WM8903.conf /usr/share/alsa/ucm2/Tegra/rt5640/ASUS Google Nexus 7 ALC5642.conf /usr/share/alsa/ucm2/codecs/wm5102/HeadPhones.conf /usr/share/alsa/ucm2/lib/generic.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC0DisableSeq.conf /usr/share/alsa/ucm2/lib/ctl-remap.conf /usr/share/alsa/ucm2/conf.d/tegra/Compal PAZ00.conf /usr/share/alsa/ucm2/lib/card-init.conf /usr/share/alsa/ucm2/codecs/wm5102/IN3-InternalMic.conf /usr/share/alsa/ucm2/codecs/rt5645/init.conf /usr/share/alsa/ucm2/codecs/wm5102/EnableSeq.conf /usr/share/alsa/ucm2/codecs/wm5102/Speaker.conf /usr/share/alsa/ucm2/conf.d/DB820c/DB820c.conf /usr/share/alsa/ucm2/conf.d/tegra/Acer Iconia Tab A
 500 WM8903.conf /usr/share/alsa/ucm2/Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf /usr/share/alsa/ucm2/codecs/rt5640/init.conf /usr/share/alsa/ucm2/conf.d/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf /usr/share/alsa/ucm2/conf.virt.d/.gitignore /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Front-Headphone.conf /usr/share/alsa/ucm2/Qualcomm/sm8250/HiFi.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC0EnableSeq.conf /usr/share/alsa/ucm2/codecs/nau8824/DMIC1_2.conf /usr/share/alsa/ucm2/conf.d/tegra/GoogleNyanBig.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/SpeakerEnableSeq.conf /usr/share/alsa/ucm2/conf.d/tegra/ASUS Google Nexus 7 ALC5642.conf /usr/share/alsa/ucm2/bytcr-wm5102/bytcr-wm5102.conf /usr/share/alsa/ucm2/conf.d/sdm845/DB845c.conf /usr/share/alsa/ucm2/codecs/rt711-sdca/init.conf /usr/share/alsa/ucm2/conf.d/tegra/GoogleNyanBlaze.conf /usr/share/alsa/ucm2/Qualcomm/sm8250/HDMI.conf /usr/share
 /alsa/ucm2/sof-soundwire/rt1308-1.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/SpeakerDisableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt715-sdca.conf /usr/share/alsa/ucm2/bytcr-wm5102/HiFi.conf /usr/share/alsa/ucm2/sof-soundwire/rt711-sdca.conf /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Main-Audio-HiFi.conf /usr/share/alsa/ucm2/codecs/wm5102/IN1-HeadsetMic.conf /usr/share/alsa/ucm2/sof-soundwire/dmic.conf /usr/share/alsa/ucm2/conf.d/DB410c/DB410c.conf /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Main-Audio.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 154121 to 181817 (+18%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.4" to "1.2.5"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/sof-soundwire/rt1308-4.conf", added "/usr/share/alsa/ucm2/codecs/rt5651/init.conf /usr/share/alsa/ucm2/codecs/rt715-sdca/init.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf /usr/share/alsa/ucm2/Tegra/wm8903/Acer Iconia Tab A500 WM8903.conf /usr/share/alsa/ucm2/Tegra/rt5640/ASUS Google Nexus 7 ALC5642.conf /usr/share/alsa/ucm2/codecs/wm5102/HeadPhones.conf /usr/share/alsa/ucm2/lib/generic.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC0DisableSeq.conf /usr/share/alsa/ucm2/lib/ctl-remap.conf /usr/share/alsa/ucm2/conf.d/tegra/Compal PAZ00.conf /usr/share/alsa/ucm2/lib/card-init.conf /usr/share/alsa/ucm2/codecs/wm5102/IN3-InternalMic.conf /usr/share/alsa/ucm2/codecs/rt5645/init.conf /usr/share/alsa/ucm2/codecs/wm5102/EnableSeq.conf /usr/share/alsa/ucm2/codecs/wm5102/Speaker.conf /usr/share/alsa/ucm2/conf.d/DB820c/DB820c.conf /usr/share/alsa/ucm2/conf.d/tegra/Acer Iconia Tab A500 
 WM8903.conf /usr/share/alsa/ucm2/Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf /usr/share/alsa/ucm2/codecs/rt5640/init.conf /usr/share/alsa/ucm2/conf.d/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf /usr/share/alsa/ucm2/conf.virt.d/.gitignore /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Front-Headphone.conf /usr/share/alsa/ucm2/Qualcomm/sm8250/HiFi.conf /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC0EnableSeq.conf /usr/share/alsa/ucm2/codecs/nau8824/DMIC1_2.conf /usr/share/alsa/ucm2/conf.d/tegra/GoogleNyanBig.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/SpeakerEnableSeq.conf /usr/share/alsa/ucm2/conf.d/tegra/ASUS Google Nexus 7 ALC5642.conf /usr/share/alsa/ucm2/bytcr-wm5102/bytcr-wm5102.conf /usr/share/alsa/ucm2/conf.d/sdm845/DB845c.conf /usr/share/alsa/ucm2/codecs/rt711-sdca/init.conf /usr/share/alsa/ucm2/conf.d/tegra/GoogleNyanBlaze.conf /usr/share/alsa/ucm2/Qualcomm/sm8250/HDMI.conf /usr/share/als
 a/ucm2/sof-soundwire/rt1308-1.conf /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/SpeakerDisableSeq.conf /usr/share/alsa/ucm2/sof-soundwire/rt715-sdca.conf /usr/share/alsa/ucm2/bytcr-wm5102/HiFi.conf /usr/share/alsa/ucm2/sof-soundwire/rt711-sdca.conf /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Main-Audio-HiFi.conf /usr/share/alsa/ucm2/codecs/wm5102/IN1-HeadsetMic.conf /usr/share/alsa/ucm2/sof-soundwire/dmic.conf /usr/share/alsa/ucm2/conf.d/DB410c/DB410c.conf /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Main-Audio.conf"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.4" to "1.2.5"
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.4.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.5.tar.bz2"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/kblrt5660/Hdmi1.conf changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/alsa/ucm2/kblrt5660/Hdmi2.conf changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/alsa/ucm2/kblrt5660/HiFi.conf changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/alsa/ucm2/kblrt5660/kblrt5660.conf changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/alsa/ucm2/sof-soundwire/rt1308-4.conf moved to /usr/share/alsa/ucm2/sof-soundwire/rt1308-1.conf
  /usr/share/alsa/ucm2/sof-soundwire/rt1308-4.conf moved to /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf
  /usr/share/alsa/ucm2/sof-soundwire/rt1308-4.conf moved to /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf
  /usr/share/alsa/ucm2/bytcr-wm5102 was added
  /usr/share/alsa/ucm2/bytcr-wm5102/bytcr-wm5102.conf was added
  /usr/share/alsa/ucm2/bytcr-wm5102/HiFi.conf was added
  /usr/share/alsa/ucm2/codecs/nau8824/DMIC1_2.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC0DisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/va-macro/DMIC0EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/SpeakerDisableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/qcom-lpass/wsa-macro/SpeakerEnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/rt5640/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt5645/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt5651/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt711-sdca was added
  /usr/share/alsa/ucm2/codecs/rt711-sdca/init.conf was added
  /usr/share/alsa/ucm2/codecs/rt715-sdca was added
  /usr/share/alsa/ucm2/codecs/rt715-sdca/init.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102 was added
  /usr/share/alsa/ucm2/codecs/wm5102/EnableSeq.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/HeadPhones.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/IN1-HeadsetMic.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/IN3-InternalMic.conf was added
  /usr/share/alsa/ucm2/codecs/wm5102/Speaker.conf was added
  /usr/share/alsa/ucm2/conf.d was added
  /usr/share/alsa/ucm2/conf.d/DB410c was added
  /usr/share/alsa/ucm2/conf.d/DB410c/DB410c.conf was added
  /usr/share/alsa/ucm2/conf.d/DB820c was added
  /usr/share/alsa/ucm2/conf.d/DB820c/DB820c.conf was added
  /usr/share/alsa/ucm2/conf.d/sdm845 was added
  /usr/share/alsa/ucm2/conf.d/sdm845/DB845c.conf was added
  /usr/share/alsa/ucm2/conf.d/sm8250 was added
  /usr/share/alsa/ucm2/conf.d/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf was added
  /usr/share/alsa/ucm2/conf.d/tegra was added
  /usr/share/alsa/ucm2/conf.d/tegra/Acer Iconia Tab A500 WM8903.conf was added
  /usr/share/alsa/ucm2/conf.d/tegra/ASUS Google Nexus 7 ALC5642.conf was added
  /usr/share/alsa/ucm2/conf.d/tegra/Compal PAZ00.conf was added
  /usr/share/alsa/ucm2/conf.d/tegra/GoogleNyanBig.conf was added
  /usr/share/alsa/ucm2/conf.d/tegra/GoogleNyanBlaze.conf was added
  /usr/share/alsa/ucm2/conf.virt.d was added
  /usr/share/alsa/ucm2/conf.virt.d/.gitignore was added
  /usr/share/alsa/ucm2/lib was added
  /usr/share/alsa/ucm2/lib/card-init.conf was added
  /usr/share/alsa/ucm2/lib/ctl-remap.conf was added
  /usr/share/alsa/ucm2/lib/generic.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8250 was added
  /usr/share/alsa/ucm2/Qualcomm/sm8250/HDMI.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8250/HiFi.conf was added
  /usr/share/alsa/ucm2/Qualcomm/sm8250/Qualcomm-RB5-WSA8815-Speakers-DMIC0.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/dmic.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1316-1.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt1316-2.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt711-sdca.conf was added
  /usr/share/alsa/ucm2/sof-soundwire/rt715-sdca.conf was added
  /usr/share/alsa/ucm2/Tegra/rt5640 was added
  /usr/share/alsa/ucm2/Tegra/rt5640/ASUS Google Nexus 7 ALC5642.conf was added
  /usr/share/alsa/ucm2/Tegra/wm8903 was added
  /usr/share/alsa/ucm2/Tegra/wm8903/Acer Iconia Tab A500 WM8903.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Front-Headphone.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Main-Audio.conf was added
  /usr/share/alsa/ucm2/USB-Audio/Gigabyte-Aorus-Master-Main-Audio-HiFi.conf was added

--===============2506612229168156137==--

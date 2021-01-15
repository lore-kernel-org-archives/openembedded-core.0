Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.701.1610713822866013454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id E024438C139B
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.18.3 SUCCEEDED
Message-ID: <MADEUP.165A67B0C630C779.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146812
Content-Type: multipart/mixed; boundary="===============6087302344664185532=="

--===============6087302344664185532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.18.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.18.2-1.18.3.patch
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

--===============6087302344664185532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1420 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1420 targets, 33 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8d683f5d761c952b61088037bb4f92e4408463a4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8d683f5d761c952b61088037bb4f92e4408463a4"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 42 Found 25 Missed 17 Current 937 (59% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 961 of 979 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 973 of 979 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 977 of 979 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1080 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2042 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_fetch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2159 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_fetch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_fetch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2228 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_write_config)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_fetch: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2255 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_unpack)
NOTE: Running task 2256 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_prepare_recipe_sysroot)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_fetch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 2331 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_unpack)
NOTE: recipe libva-2.10.0-r0: task do_write_config: Started
NOTE: recipe libva-2.10.0-r0: task do_unpack: Started
NOTE: Running task 2397 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 979 of 979 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_write_config: Started
NOTE: recipe libva-2.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2592 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_unpack: Succeeded
NOTE: Running task 2758 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_patch: Succeeded
NOTE: Running task 2759 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2760 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_lic unihash changed to e7fc1e7d84385e7d0513b50897275cd17818dcb5796ada1cef4bef294f20e985
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2761 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2762 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libva-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2763 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2764 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d4041a4a48affaafca05a5e4c3d93c77aa466a8c7d00d8d9ab20e5262d434f0f
NOTE: recipe libva-2.10.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2905 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0f9421dca25c576b826474b0e95dade406781e1c7de20748017962073d574ad4
NOTE: Setscene tasks completed
NOTE: Running task 2975 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libva-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2986 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_compile)
NOTE: recipe libva-2.10.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2987 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_install)
NOTE: recipe libva-2.10.0-r0: task do_install: Started
NOTE: recipe libva-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 2988 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_package)
NOTE: Running task 2989 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.10.0-r0: task do_package: Started
NOTE: recipe libva-2.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2990 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 2991 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2992 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_configure)
NOTE: recipe libva-2.10.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_configure: Started
NOTE: recipe libva-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2993 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_package_write_rpm)
NOTE: recipe libva-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_configure: Succeeded
NOTE: Running task 2994 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_compile: Succeeded
NOTE: Running task 2995 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_install: Succeeded
NOTE: Running task 2996 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package)
NOTE: Running task 2997 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package: Succeeded
NOTE: Running task 2998 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2999 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package_write_rpm)
NOTE: Running task 3000 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3001 of 3001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3001 tasks of which 2967 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 163 ERROR messages shown, returning a non-zero exit code.

--===============6087302344664185532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8d683f5d761c952b61088037bb4f92e4408463a4"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8d683f5d761c952b61088037bb4f92e4408463a4"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 42 Found 25 Missed 17 Current 933 (59% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 957 of 975 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 969 of 975 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 973 of 975 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata_setscene)
NOTE: Running task 1080 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2024 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_fetch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2141 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_fetch)
NOTE: recipe libva-2.10.0-r0: task do_fetch: Started
NOTE: Running task 2210 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_write_config)
NOTE: recipe libva-2.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 2222 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_unpack)
NOTE: Running task 2223 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 975 of 975 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 2291 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_unpack)
NOTE: recipe libva-2.10.0-r0: task do_write_config: Started
NOTE: recipe libva-2.10.0-r0: task do_unpack: Started
NOTE: recipe libva-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2380 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_write_config)
NOTE: recipe libva-2.10.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_unpack: Started
NOTE: recipe libva-2.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2515 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_write_config: Started
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_unpack: Succeeded
NOTE: Running task 2740 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_patch: Succeeded
NOTE: Running task 2741 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2742 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2743 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2744 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_lic unihash changed to e7fc1e7d84385e7d0513b50897275cd17818dcb5796ada1cef4bef294f20e985
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libva-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2745 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 37b13c2fd369d8f1cbb30d7498e8ed15c2aa31eab2163136d11ca50fb4715ab0
NOTE: recipe libva-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2886 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2887 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libva-2.10.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b2f87c1f8835bea5fb54c2522c9fffb8ea62a07ad29d07add5b6484f22177419
NOTE: Setscene tasks completed
NOTE: Running task 2957 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libva-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2968 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_compile)
NOTE: recipe libva-2.10.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2969 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_install)
NOTE: recipe libva-2.10.0-r0: task do_install: Started
NOTE: recipe libva-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 2970 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_package)
NOTE: Running task 2971 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.10.0-r0: task do_package: Started
NOTE: recipe libva-2.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2972 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 2973 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2974 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_configure)
NOTE: recipe libva-2.10.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_configure: Started
NOTE: recipe libva-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2975 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_package_write_rpm)
NOTE: recipe libva-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_install: Succeeded
NOTE: Running task 2978 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package)
NOTE: Running task 2979 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package: Succeeded
NOTE: Running task 2980 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2981 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package_write_rpm)
NOTE: Running task 2982 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2983 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2983 tasks of which 2949 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 163 ERROR messages shown, returning a non-zero exit code.

--===============6087302344664185532==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.18.2-1.18.3.patch"

From 357f68fb22b35420509e7a5d59f997ea7240e76f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 11:20:03 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.18.2 -> 1.18.3

---
 ...streamer1.0-vaapi_1.18.2.bb => gstreamer1.0-vaapi_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.2.bb => gstreamer1.0-vaapi_1.18.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
index f237191d5f..23040ad73c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "8c7b2c74fda095d83dea67accde6a68ba9f608d97ed969fdcf278930f9b1c7c0"
+SRC_URI[sha256sum] = "ae9877f15757a661d4dfe6a09755a2faa959ab60752f14ca26b7ff10765e1f12"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.27.0


--===============6087302344664185532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 43 skipped, 0 masked, 0 errors.
Removing 144 recipes from the core2-32 sysroot...done.
Removing 149 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8d683f5d761c952b61088037bb4f92e4408463a4"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8d683f5d761c952b61088037bb4f92e4408463a4"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 742 Found 725 Missed 17 Current 248 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 249 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 310 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 314 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 315 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 322 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.35.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 324 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 332 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 333 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 334 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 344 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 346 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.35.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 349 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 350 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 356 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgudev-234-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 357 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 358 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 363 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 368 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 369 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 373 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package_write_rpm_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 374 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgudev-234-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 381 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 382 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 383 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 385 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 386 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 387 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 388 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 389 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 390 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 391 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 392 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 393 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 405 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 408 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 416 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 422 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 435 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 436 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 438 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 445 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 449 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 450 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 451 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 452 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 453 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 454 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 455 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 458 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 459 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 460 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 461 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 462 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 463 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 464 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_setscene: Started
NOTE: recipe binutils-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 465 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 466 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 467 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 468 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 475 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 476 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 477 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 479 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 480 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 481 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 482 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_package_write_rpm_setscene)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nettle-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 495 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 497 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 506 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 512 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 515 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 516 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 520 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 952 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_fetch)
NOTE: Running task 973 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_fetch)
NOTE: Running task 1006 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_write_config)
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1096 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_write_config)
NOTE: recipe libva-2.10.0-r0: task do_fetch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_fetch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 1230 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_unpack)
NOTE: Running task 1231 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_unpack)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_write_config: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_write_config: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_write_config: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_unpack: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_unpack: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_unpack: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 1232 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_patch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_unpack: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 1233 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_patch)
NOTE: recipe libva-2.10.0-r0: task do_patch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_patch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_patch: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_patch: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 1234 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1235 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_lic)
NOTE: Running task 1236 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_deploy_source_date_epoch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_deploy_source_date_epoch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_lic: Started
NOTE: recipe libva-2.10.0-r0: task do_deploy_source_date_epoch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_lic unihash changed to e7fc1e7d84385e7d0513b50897275cd17818dcb5796ada1cef4bef294f20e985
NOTE: recipe libva-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-234-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-234-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-234-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-234-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 583 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 586 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 589 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 591 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 601 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 609 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 628 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 632 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 654 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 659 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 660 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 665 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 669 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 673 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 675 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 680 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libogg-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 689 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 692 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 694 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 700 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 710 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 713 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 719 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 722 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 739 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 750 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 751 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 754 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 756 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 761 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 764 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 772 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 776 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 779 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 780 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 787 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_247.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 800 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 804 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 816 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1503 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 819 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1512 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1513 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 823 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 828 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 831 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 836 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 837 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 839 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 840 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1545 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 843 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 854 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 855 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1560 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 861 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 863 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 866 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1572 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 879 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1583 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 881 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 883 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 887 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 888 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 893 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 906 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 907 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 912 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 913 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 914 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 915 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 916 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 921 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 922 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 923 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 926 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 927 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 929 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 930 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 932 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1617 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 934 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 937 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 942 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 943 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 945 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 948 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 951 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 953 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 954 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 957 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 960 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 965 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1697 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 972 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 977 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8aee874b86bf32f2d6775679a54b0a6b02a3acbb944a6280782ba5b76ec44d91
NOTE: Running task 1701 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 984 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 985 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 988 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2003 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2494 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 606c018e80990d3d160802f550d145d7183be4710cf26edb902f108f7c3dc2e0
NOTE: recipe libva-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3006 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_configure)
NOTE: recipe libva-2.10.0-r0: task do_configure: Started
NOTE: recipe libva-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 3007 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_compile)
NOTE: recipe libva-2.10.0-r0: task do_compile: Started
NOTE: recipe libva-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 3008 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_install)
NOTE: recipe libva-2.10.0-r0: task do_install: Started
NOTE: recipe libva-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 3009 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_package)
NOTE: Running task 3010 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.10.0-r0: task do_package: Started
NOTE: recipe libva-2.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3011 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 3012 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3013 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_configure)
NOTE: recipe libva-2.10.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_configure: Started
NOTE: recipe libva-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3014 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_package_write_rpm)
NOTE: recipe libva-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_configure: Succeeded
NOTE: Running task 3015 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_compile: Succeeded
NOTE: Running task 3016 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_install: Succeeded
NOTE: Running task 3017 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package)
NOTE: Running task 3018 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package: Succeeded
NOTE: Running task 3019 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3020 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package_write_rpm)
NOTE: Running task 3021 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3022 of 3022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3022 tasks of which 2982 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 163 ERROR messages shown, returning a non-zero exit code.

--===============6087302344664185532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 59 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8d683f5d761c952b61088037bb4f92e4408463a4"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8d683f5d761c952b61088037bb4f92e4408463a4"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 42 Found 25 Missed 17 Current 926 (59% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 950 of 968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 962 of 968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 966 of 968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata_setscene)
NOTE: Running task 1080 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2004 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_fetch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2119 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_fetch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2188 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_write_config)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_fetch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_fetch: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2241 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_unpack)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2242 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_prepare_recipe_sysroot)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_fetch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_fetch: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2301 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_unpack)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_write_config: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2357 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_write_config)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_unpack: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_write_config: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_prepare_recipe_sysroot: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_unpack: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_write_config: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_unpack: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2583 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_patch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_write_config: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_patch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_unpack: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2712 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_patch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_patch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_patch: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2713 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2714 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_lic)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_lic unihash changed to e7fc1e7d84385e7d0513b50897275cd17818dcb5796ada1cef4bef294f20e985
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2720 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2721 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libva-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2722 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c961e1b507439ea1c330271d040ab6ee92c4dce7926f5d1a6aa27a1015e2bb87
NOTE: recipe libva-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2829 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_configure)
NOTE: recipe libva-2.10.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2864 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 19cc089a98f77e08e9f9ea2d7007eb5a13fbc73703034d5bbdc3d372ce429274
NOTE: Setscene tasks completed
NOTE: Running task 2927 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libva-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2945 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_compile)
NOTE: recipe libva-2.10.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2946 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_install)
NOTE: recipe libva-2.10.0-r0: task do_install: Started
NOTE: recipe libva-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 2947 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_package)
NOTE: Running task 2948 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.10.0-r0: task do_package: Started
NOTE: recipe libva-2.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2949 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 2950 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_packagedata)
NOTE: recipe libva-2.10.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2951 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_package_write_rpm)
NOTE: recipe libva-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2952 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_configure: Succeeded
NOTE: Running task 2953 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_compile: Succeeded
NOTE: Running task 2954 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_install: Succeeded
NOTE: Running task 2955 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package)
NOTE: Running task 2956 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package: Succeeded
NOTE: Running task 2957 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2958 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package_write_rpm)
NOTE: Running task 2959 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2960 of 2960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2960 tasks of which 2926 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 163 ERROR messages shown, returning a non-zero exit code.

--===============6087302344664185532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 50 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8d683f5d761c952b61088037bb4f92e4408463a4"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8d683f5d761c952b61088037bb4f92e4408463a4"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 42 Found 25 Missed 17 Current 933 (59% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 957 of 975 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 969 of 975 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 973 of 975 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata_setscene)
NOTE: Running task 1080 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2024 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_fetch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2141 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_fetch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2210 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_write_config)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_fetch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_fetch: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2272 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_unpack)
NOTE: Running task 2273 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_prepare_recipe_sysroot)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_fetch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_fetch: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2346 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_unpack)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_write_config: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2379 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_write_config)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_unpack: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_write_config: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_prepare_recipe_sysroot: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_unpack: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_write_config: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_unpack: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: Running task 2635 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_patch)
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_write_config: Succeeded
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe libva-2.10.0-r0: task do_patch: Started
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.18.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.18.3-r0 to 0:1.18.2-r0) [version-going-backwards]
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_unpack: Succeeded
NOTE: Running task 2735 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 975 of 975 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_patch: Succeeded
NOTE: Running task 2737 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2738 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_lic unihash changed to e7fc1e7d84385e7d0513b50897275cd17818dcb5796ada1cef4bef294f20e985
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2743 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2744 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libva-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2745 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cd4c61dd8a6ed1b3ad75c3dc51c019d64a81088a9ff8e572e5451c8eccc1c2bf
NOTE: recipe libva-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2852 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_configure)
NOTE: recipe libva-2.10.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2887 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2a19e722cc67a7f7657c848ae4d23cc5d17c2bda02f1f9ef02bd50166c44b01a
NOTE: Setscene tasks completed
NOTE: Running task 2955 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libva-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2968 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_compile)
NOTE: recipe libva-2.10.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libva-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2969 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_install)
NOTE: recipe libva-2.10.0-r0: task do_install: Started
NOTE: recipe libva-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 2970 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_package)
NOTE: Running task 2971 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.10.0-r0: task do_package: Started
NOTE: recipe libva-2.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2972 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 2973 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_packagedata)
NOTE: recipe libva-2.10.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2974 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_configure: Started
NOTE: recipe libva-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2975 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.10.0.bb:do_package_write_rpm)
NOTE: recipe libva-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_install: Succeeded
NOTE: Running task 2978 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package)
NOTE: Running task 2979 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package: Succeeded
NOTE: Running task 2980 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2981 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package_write_rpm)
NOTE: Running task 2982 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2983 of 2983 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2983 tasks of which 2949 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 163 ERROR messages shown, returning a non-zero exit code.

--===============6087302344664185532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.3.tar.xz"

--===============6087302344664185532==--

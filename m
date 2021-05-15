Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.4452.1621074783468242180
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 84E3038C13D7
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gsettings-desktop-schemas: upgrading to 40.0 FAILED
Message-ID: <MADEUP.167F36ED84AB2F76.8589@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============2811086270598316038=="

--===============2811086270598316038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gsettings-desktop-schemas* to *40.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gsettings-desktop-schemas -V 40.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1459 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-200563c1258db5b53794cbef9e6a1c289a2d6e28"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:200563c1258db5b53794cbef9e6a1c289a2d6e28"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnome.org/pub/GNOME/sources/gsettings-desktop-schemas/40.0/gsettings-desktop-schemas-40.0.tar.xz;name=archive...
Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 826 .bb files complete (824 cached, 2 parsed). 1460 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-200563c1258db5b53794cbef9e6a1c289a2d6e28"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:200563c1258db5b53794cbef9e6a1c289a2d6e28"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://ftp.gnome.org/pub/GNOME/sources/gsettings-desktop-schemas/40.0/gsettings-desktop-schemas-40.0.tar.xz;name=archive, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-5mr50gz8/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-5mr50gz8/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-5mr50gz8/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-5mr50gz8/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-5mr50gz8/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-5mr5
 0gz8/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://ftp.gnome.org/pub/GNOME/sources/gsettings-desktop-schemas/40.0/gsettings-desktop-schemas-40.0.tar.xz' --progress=dot -v failed with exit code 8, output:
--2021-05-15 06:26:37--  https://ftp.gnome.org/pub/GNOME/sources/gsettings-desktop-schemas/40.0/gsettings-desktop-schemas-40.0.tar.xz
Resolving ftp.gnome.org (ftp.gnome.org)... 2620:52:3:1:5054:ff:fe0d:ee0f, 2620:52:3:1:5054:ff:fedd:5ad0, 2620:52:3:1:5054:ff:fede:8714, ...
Connecting to ftp.gnome.org (ftp.gnome.org)|2620:52:3:1:5054:ff:fe0d:ee0f|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://download.gnome.org/sources/gsettings-desktop-schemas/40.0/gsettings-desktop-schemas-40.0.tar.xz [following]
--2021-05-15 06:26:37--  https://download.gnome.org/sources/gsettings-desktop-schemas/40.0/gsettings-desktop-schemas-40.0.tar.xz
Resolving download.gnome.org (download.gnome.org)... 2620:52:3:1:5054:ff:fe0d:ee0f, 2620:52:3:1:5054:ff:fedd:5ad0, 2620:52:3:1:5054:ff:fede:8714, ...
Connecting to download.gnome.org (download.gnome.org)|2620:52:3:1:5054:ff:fe0d:ee0f|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-05-15 06:26:37 ERROR 404: Not Found.


ERROR: Fetcher failure for URL: 'https://ftp.gnome.org/pub/GNOME/sources/gsettings-desktop-schemas/40.0/gsettings-desktop-schemas-40.0.tar.xz;name=archive'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-5mr50gz8/work/temp/log.do_fetch.590487
NOTE: Tasks Summary: Attempted 82 tasks of which 81 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
ERROR: Failed to fetch URL https://ftp.gnome.org/pub/GNOME/sources/gsettings-desktop-schemas/40.0/gsettings-desktop-schemas-40.0.tar.xz;name=archive



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============2811086270598316038==--

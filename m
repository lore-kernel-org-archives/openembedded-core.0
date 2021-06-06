Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.26023.1623000257574536168
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 34C6038C1289
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20210604 FAILED
Message-ID: <MADEUP.16860E22BAA3186E.22991@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============5384456595279439448=="

--===============5384456595279439448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *acpica* to *20210604* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade acpica -V 20210604
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1452 entries from dependency cache.
INFO: Extracting current version source...
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ef8815dc7c97f0ca33207ae71e840d5a5210b898"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ef8815dc7c97f0ca33207ae71e840d5a5210b898"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://acpica.org/sites/acpica/files/acpica-unix-20210604.tar.gz...
Loading cache...done.
Loaded 1452 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (815 cached, 2 parsed). 1453 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ef8815dc7c97f0ca33207ae71e840d5a5210b898"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ef8815dc7c97f0ca33207ae71e840d5a5210b898"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://acpica.org/sites/acpica/files/acpica-unix-20210604.tar.gz, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-thxabzgs/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-thxabzgs/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-thxabzgs/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-thxabzgs/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-thxabzgs/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-thxa
 bzgs/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://acpica.org/sites/acpica/files/acpica-unix-20210604.tar.gz' --progress=dot -v failed with exit code 8, output:
--2021-06-06 09:54:13--  https://acpica.org/sites/acpica/files/acpica-unix-20210604.tar.gz
Resolving acpica.org (acpica.org)... 2001:19d0:306:9::5, 198.145.21.19
Connecting to acpica.org (acpica.org)|2001:19d0:306:9::5|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-06-06 09:54:13 ERROR 404: Not Found.


ERROR: Fetcher failure for URL: 'https://acpica.org/sites/acpica/files/acpica-unix-20210604.tar.gz'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-thxabzgs/work/temp/log.do_fetch.32367
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
ERROR: Failed to fetch URL https://acpica.org/sites/acpica/files/acpica-unix-20210604.tar.gz



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============5384456595279439448==--

Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16599.1598724116843092521
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69DDDE020D6; Sat, 29 Aug 2020 11:01:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE,WEIRD_PORT autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.0 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.113] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2BECE020CE
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:55 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.16.6 FAILED
Message-Id: <20200829180156.69DDDE020D6@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:01:56 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============8906690307731962023=="

--===============8906690307731962023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.16.6* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade bind -V 9.16.6
NOTE: Starting bitbake server...
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/build/workspace
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 779 .bb files complete (0 cached, 779 parsed). 1341 targets, 35 skipped, 0 masked, 0 errors.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200829"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:104ff3c834d9ea60de4600fca374c0bdc9ca843d"
workspace            = "master:104ff3c834d9ea60de4600fca374c0bdc9ca843d"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.isc.org/isc/bind9/9.16.6/bind-9.16.6.tar.gz...
Loading cache...done.
Loaded 1341 entries from dependency cache.
Parsing recipes...done.
Parsing of 780 .bb files complete (778 cached, 2 parsed). 1342 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200829"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:104ff3c834d9ea60de4600fca374c0bdc9ca843d"
workspace            = "master:104ff3c834d9ea60de4600fca374c0bdc9ca843d"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://ftp.isc.org/isc/bind9/9.16.6/bind-9.16.6.tar.gz, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; unset _PYTHON_SYSCONFIGDATA_NAME; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gr9jgbvg/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gr9jgbvg/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gr9jgbvg/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gr9jgbvg/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gr9jgbvg/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/recipetool-gr9jgbvg/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://ftp.isc.org/isc/bind9/9.16.6/bind-9.16.6.tar.gz' --progress=dot -v failed with exit code 8, output:
--2020-08-29 10:20:16--  https://ftp.isc.org/isc/bind9/9.16.6/bind-9.16.6.tar.gz
Resolving ftp.isc.org (ftp.isc.org)... 2001:4f8:1:f::49, 149.20.1.49
Connecting to ftp.isc.org (ftp.isc.org)|2001:4f8:1:f::49|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2020-08-29 10:20:16 ERROR 404: Not Found.


ERROR: Fetcher failure for URL: 'https://ftp.isc.org/isc/bind9/9.16.6/bind-9.16.6.tar.gz'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gr9jgbvg/work/temp/log.do_fetch.18217
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
ERROR: Failed to fetch URL https://ftp.isc.org/isc/bind9/9.16.6/bind-9.16.6.tar.gz



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============8906690307731962023==--

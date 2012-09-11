Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TBN29-0006vC-46
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 11:45:29 +0200
Received: from localhost ([127.0.0.1]:53596 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TBMq2-0006g1-8G
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 09:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=SOlkmkIJ191xFoklzPv5QA
	61jAc=; b=S5gqQoUTJDL4Zilog6DeRrrnZC5mX4NAmY3HXHP9VKY/KYeDi7ytz+
	rmhspHTB9XidTz5ofKM8H0heuGMtwAo5GU6/J5/3lr/uhVhUz1tGSKZ/oj6p7HBM
	tj2up3e6KWMTJwiUptBUcvTLYmMDn52lCRQsNTT380gE/6zr719NM=
Received: from [195.171.99.130] (port=56387 helo=[192.168.0.40])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TBMq2-0006fw-4I
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 09:32:58 +0000
Message-ID: <504F05A8.3000207@communistcode.co.uk>
Date: Tue, 11 Sep 2012 10:34:32 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: /usr/bin/python is needed by git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 09:45:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm not sure where this issue is coming from so I'm just going to dump 
the output log and see if anyone bites. From what I can tell it is maybe 
an RPM dependency issue...?

WARNING: Host distribution ""Arch Linux"" has not been validated with 
this version of the build system; you may possibly experience unexpected 
failures. It is recommended that you use a tested distribution.
Loading cache: 100% 
|#########################################################################################################################################################################################################| 
ETA:  00:00:00
Loaded 1206 entries from dependency cache.
Parsing recipes: 100% 
|#######################################################################################################################################################################################################| 
Time: 00:00:00
Parsing of 896 .bb files complete (894 cached, 2 parsed). 1205 targets, 
57 skipped, 7 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.15.3"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "poky"
DISTRO_VERSION    = "1.2+snapshot-20120911"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "master:7250638ec895bc89508711831083d43b9e1e9826"
meta-ti           = "master:7b54887b9505bb8334bfbe4094a2c396add8da48"
meta-db           = "master:4da6bda041dbbcee2d7464668de280d84c035fa9"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: QA Issue: kmod: /bin/kmod, installed in the base_prefix, 
requires a shared library under exec_prefix (/usr): libkmod.so.2 => 
/usr/lib/libkmod.so.2 (0xdead1000)
WARNING: QA Issue: libpam: /lib/security/pam_cracklib.so, installed in 
the base_prefix, requires a shared library under exec_prefix (/usr): 
libcrack.so.2 => /usr/lib/libcrack.so.2 (0xdead3000)
WARNING: QA Issue: libpam: /lib/security/pam_cracklib.so, installed in 
the base_prefix, requires a shared library under exec_prefix (/usr): 
libz.so.1 => /usr/lib/libz.so.1 (0xdead4000)
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the 
base_prefix, requires a shared library under exec_prefix (/usr): 
libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0xdead2000)
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the 
base_prefix, requires a shared library under exec_prefix (/usr): 
libgthread-2.0.so.0 => /usr/lib/libgthread-2.0.so.0 (0xdead3000)
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the 
base_prefix, requires a shared library under exec_prefix (/usr): 
libffi.so.5 => /usr/lib/libffi.so.5 (0xdead4000)
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.0.1, installed in the 
base_prefix, requires a shared library under exec_prefix (/usr): 
libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0xdead5000)
WARNING: QA Issue: udev: /lib/udev/udev-acl, installed in the 
base_prefix, requires a shared library under exec_prefix (/usr): 
libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0xdead2000)
WARNING: QA Issue: php: Files/directories were installed but not shipped
   /mnt
   /mnt/storage
   /mnt/storage/yoctoBuilds
   /mnt/storage/yoctoBuilds/poky-beaglebone.git
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots
ERROR: Function failed: do_rootfs (see 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/beaglebone-poky-linux-gnueabi/core-image-db-1.0-r0/temp/log.do_rootfs.15968 
for further information)
ERROR: Logfile of failure stored in: 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/beaglebone-poky-linux-gnueabi/core-image-db-1.0-r0/temp/log.do_rootfs.15968
Log data follows:
| DEBUG: Executing shell function do_rootfs
| Generating solve db for 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/deploy/rpm/beaglebone...
| Generating solve db for 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/deploy/rpm/armv7a_vfp_neon...
| Generating solve db for 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/deploy/rpm/all...
|    total:               1      0.000000 MB     88.851492 secs
|    fingerprint:      2487      0.065276 MB      0.731218 secs
|    install:           829      0.000000 MB     67.751171 secs
|    digest:           1658     11.934144 MB      0.117111 secs
|    signature:        1658      0.000000 MB      5.105333 secs
|    dbadd:             829      0.000000 MB     67.590105 secs
|    dbget:           17782      0.000000 MB      0.058949 secs
|    dbput:             829      6.853944 MB     57.990037 secs
|    readhdr:          8291     13.578976 MB      3.732102 secs
|    hdrload:          4452     21.570272 MB      0.088323 secs
|    hdrget:         159643      0.000000 MB      1.030783 secs
|    total:               1      0.000000 MB    190.089845 secs
|    fingerprint:      5034      0.089692 MB      1.256801 secs
|    install:          1678      0.000000 MB    146.995181 secs
|    digest:           3356     17.421210 MB      0.215644 secs
|    signature:        3356      0.000000 MB      9.807536 secs
|    dbadd:            1678      0.000000 MB    146.709467 secs
|    dbget:           34599      0.000000 MB      0.299620 secs
|    dbput:            1678     10.496148 MB    131.603615 secs
|    readhdr:         16781     20.750458 MB      9.085295 secs
|    hdrload:          8591     31.786302 MB      0.191107 secs
|    hdrget:         324291      0.000000 MB      2.933854 secs
|    total:               1      0.000000 MB      2.395373 secs
|    fingerprint:        36      0.000032 MB      0.000915 secs
|    install:            12      0.000000 MB      0.517583 secs
|    digest:             24      0.047656 MB      0.000381 secs
|    signature:          24      0.000000 MB      0.032788 secs
|    dbadd:              12      0.000000 MB      0.486005 secs
|    dbget:              59      0.000000 MB      0.000351 secs
|    dbput:              12      0.035820 MB      0.185407 secs
|    readhdr:           121      0.071560 MB      0.021102 secs
|    hdrload:            65      0.119208 MB      0.000533 secs
|    hdrget:           1814      0.000000 MB      0.003769 secs
| Generating solve db for 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/deploy/rpm/all...
| Processing task-core-boot...
| Processing git...
| Processing php-cgi...
| Processing packagegroup-core-ssh-openssh...
| Processing valgrind...
| Processing libjansson4...
| Processing hiawatha...
| Processing htop...
| Processing libwebsockets0...
| Processing openssh-sftp-server...
| error: Failed dependencies:
|     /usr/bin/python is needed by git-1.7.7-r2.armv7a_vfp_neon
| ERROR: Function failed: do_rootfs (see 
/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/beaglebone-poky-linux-gnueabi/core-image-db-1.0-r0/temp/log.do_rootfs.15968 
for further information)
ERROR: Task 7 
(/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta-db/recipes-core/images/core-image-db.bb, 
do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2137 tasks of which 1805 didn't need to 
be rerun and 1 failed.

Summary: 1 task failed:
/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta-db/recipes-core/images/core-image-db.bb, 
do_rootfs
Summary: There were 10 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--




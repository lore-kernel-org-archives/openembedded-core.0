Received: from atl4mhfb02.myregisteredsite.com ([209.17.115.56])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U4GWE-0001Aa-Ak
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 20:55:33 +0100
Received: from atl4mhob05.myregisteredsite.com
	(atl4mhob05.myregisteredsite.com [209.17.115.43])
	by atl4mhfb02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r19JdVWQ001083 for <openembedded-core@lists.openembedded.org>;
	Sat, 9 Feb 2013 14:39:32 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob05.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r19JdEaX011415 for <openembedded-core@lists.openembedded.org>;
	Sat, 9 Feb 2013 14:39:14 -0500
Received: (qmail 32528 invoked by uid 0); 9 Feb 2013 19:39:08 -0000
Received: from unknown (HELO ?10.0.0.14?)
	(mike@milosoftware.com@85.150.144.104)
	by 0 with ESMTPA; 9 Feb 2013 19:39:08 -0000
Message-ID: <5116A5DA.90500@topic.nl>
Date: Sat, 09 Feb 2013 20:39:06 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
	<CAJTo0LYJ8aza9P0V2X_UszE2yWJjGGacWUstPYeoxF0KcwDYxg@mail.gmail.com>
	<510B73EB.8060907@topic.nl>
	<CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
	<510BBC3D.1030207@topic.nl>
In-Reply-To: <510BBC3D.1030207@topic.nl>
Subject: Re: Multiple MACHINE building is broken in OE-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Feb 2013 19:55:34 -0000
X-Groupsio-MsgNum: 35260
Content-Type: multipart/mixed; boundary="------------070503050902020008030800"

--------------070503050902020008030800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2013 01:59 PM, Mike Looijmans wrote:
> On 02/01/2013 11:29 AM, Burton, Ross wrote:
>> On 1 February 2013 07:51, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>>>> A concrete example might help.
>>>
>>> Would be glad to comply, if you care to explain what you need. What
>>> should I
>>> do, which logging to collect (and maybe how)?
>>
>> To start with just the two machines you are changing between and the
>> packages/tasks that are re-ran.

Well, here's an example of me switching from "vusolo2" to "et9x00" in 
the current state of OE. I'm migrating this from a year-old or so state 
of OE-core to the present.

On the "old" system (not "classic" openembedded, just a much older 
oe-core!) switching would result in just immediately building rootfs, 
and nothing more.

Now when I change MACHINE from one to the other, after just having 
built, it runs hundreds of tasks, and it takes a few minutes to do all that.

$ export MACHINE=et9x00
$ bitbake my-image
$ export MACHINE=vusolo2
$ bitbake my-image > /tmp/bitbake.log
$ export MACHINE=et9x00
$ bitbake my-image > /tmp/bitbake.log

I've attached the two log files.

WHY is it doing all that? None of these packages are machine specific!
-- 
Mike Looijmans - Topic Automation

--------------070503050902020008030800
Content-Type: text/x-log;
 name="bitbake-switch-from-et9x00-to-vusolo2.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="bitbake-switch-from-et9x00-to-vusolo2.log"

Loading cache...done.
Loaded 1853 entries from dependency cache.
Parsing recipes...done.
Parsing of 1571 .bb files complete (1480 cached, 91 parsed). 1929 targets, 125 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.17.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-11.10"
TARGET_SYS        = "mipsel-oe-linux"
MACHINE           = "et9x00"
DISTRO            = "openpli"
DISTRO_VERSION    = "4"
TUNE_FEATURES     = "o32 fpu-hard mips32"
TARGET_FPU        = ""
meta-oe           
meta-networking   = "(nobranch):61911b23099c2658186179504ded318c987b5276"
meta              = "master:d9466101908f05cb11c8a8afb73430ad919ac50d"
meta-openpli      
meta-local        = "upstream:99c7070b2b4826021c3f5ca4a40c279794712711"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Running setscene task 917 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 918 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 919 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 920 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 921 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 922 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 923 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 924 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_package_write_ipk_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ncurses-5.9-r13.1: task do_package_write_ipk_setscene: Started
NOTE: recipe eglibc-2.17-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_package_write_ipk_setscene: Started
NOTE: recipe opkg-collateral-1.0-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe avahi-0.6.31-r6.1: task do_package_write_ipk_setscene: Started
NOTE: recipe dropbear-2012.55-r3.1: task do_package_write_ipk_setscene: Started
NOTE: recipe samba-3.0.37-r8: task do_package_write_ipk_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe opkg-collateral-1.0-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe dropbear-2012.55-r3.1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 925 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 926 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 927 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_packagedata_setscene)
NOTE: Running setscene task 928 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_packagedata_setscene)
NOTE: recipe opkg-collateral-1.0-r2: task do_packagedata_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.42.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe dropbear-2012.55-r3.1: task do_packagedata_setscene: Started
NOTE: recipe avahi-0.6.31-r6.1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 929 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_package_write_ipk_setscene)
NOTE: recipe ncurses-5.9-r13.1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 930 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_package_write_ipk_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 931 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_package_setscene)
NOTE: recipe opkg-collateral-1.0-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe dropbear-2012.55-r3.1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_package_setscene)
NOTE: Running setscene task 933 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_package_setscene)
NOTE: recipe e2fsprogs-1.42.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 934 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_package_write_ipk_setscene)
NOTE: recipe nfs-utils-1.2.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe early-configure-20101009-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_package_setscene: Started
NOTE: recipe opkg-collateral-1.0-r2: task do_package_setscene: Started
NOTE: recipe dropbear-2012.55-r3.1: task do_package_setscene: Started
NOTE: recipe sdparm-1.07-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe nfs-utils-1.2.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe opkg-collateral-1.0-r2: task do_package_setscene: Succeeded
NOTE: recipe early-configure-20101009-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 935 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 936 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_packagedata_setscene)
NOTE: Running setscene task 937 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_packagedata_setscene)
NOTE: Running setscene task 938 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_package_write_ipk_setscene)
NOTE: recipe early-configure-20101009-r0: task do_packagedata_setscene: Started
NOTE: recipe sdparm-1.07-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 939 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_packagedata_setscene)
NOTE: recipe nfs-utils-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe tuxbox-links-1.0-r10: task do_package_write_ipk_setscene: Started
NOTE: recipe util-linux-2.22.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe dropbear-2012.55-r3.1: task do_package_setscene: Succeeded
NOTE: Running setscene task 940 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_package_write_ipk_setscene)
NOTE: recipe nfs-utils-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe early-configure-20101009-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 941 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_package_setscene)
NOTE: Running setscene task 942 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_package_setscene)
NOTE: recipe sdparm-1.07-r1: task do_packagedata_setscene: Started
NOTE: recipe tuxbox-links-1.0-r10: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 943 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_packagedata_setscene)
NOTE: recipe eglibc-2.17-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 944 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_package_write_ipk_setscene)
NOTE: recipe sdparm-1.07-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe vsftpd-2.3.5-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe samba-3.0.37-r8: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 945 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_package_setscene)
NOTE: recipe nfs-utils-1.2.7-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.22.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 946 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_packagedata_setscene)
NOTE: recipe early-configure-20101009-r0: task do_package_setscene: Started
NOTE: Running setscene task 947 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/settings-autorestore.bb, do_populate_sysroot_setscene)
NOTE: recipe tuxbox-links-1.0-r10: task do_packagedata_setscene: Started
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe sdparm-1.07-r1: task do_package_setscene: Started
NOTE: recipe vsftpd-2.3.5-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 948 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_packagedata_setscene)
NOTE: recipe tuxbox-links-1.0-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe samba-3.0.37-r8: task do_packagedata_setscene: Started
NOTE: recipe settings-autorestore-20111105-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe early-configure-20101009-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 949 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 950 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_package_setscene)
NOTE: recipe settings-autorestore-20111105-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_package_write_ipk_setscene)
NOTE: recipe vsftpd-2.3.5-r4: task do_packagedata_setscene: Started
NOTE: recipe nfs-utils-1.2.7-r0: task do_package_setscene: Succeeded
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe sdparm-1.07-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 952 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_package_write_ipk_setscene)
NOTE: recipe samba-3.0.37-r8: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 953 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_packagedata_setscene)
NOTE: Running setscene task 954 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 955 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_package_setscene)
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tuxbox-links-1.0-r10: task do_package_setscene: Started
NOTE: recipe firmware-htc7010-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe vsftpd-2.3.5-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-rt2870-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 956 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_package_setscene)
NOTE: recipe tuxbox-links-1.0-r10: task do_package_setscene: Succeeded
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 957 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe samba-3.0.37-r8: task do_package_setscene: Started
NOTE: recipe firmware-htc9271-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-rt2870-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe firmware-htc7010-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 958 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_packagedata_setscene)
NOTE: Running setscene task 959 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_packagedata_setscene)
NOTE: Running setscene task 960 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_packagedata_setscene)
NOTE: recipe vsftpd-2.3.5-r4: task do_package_setscene: Started
NOTE: recipe firmware-htc9271-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_packagedata_setscene)
NOTE: Running setscene task 962 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_package_setscene)
NOTE: recipe firmware-rt73-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe firmware-htc7010-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe firmware-rt2870-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-htc9271-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 963 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_package_setscene)
NOTE: recipe firmware-rt73-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 964 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_packagedata_setscene)
NOTE: recipe firmware-htc7010-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_package_setscene: Started
NOTE: Running setscene task 965 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_package_setscene)
NOTE: recipe vsftpd-2.3.5-r4: task do_package_setscene: Succeeded
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 966 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_package_setscene: Started
NOTE: recipe firmware-rt2870-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-htc9271-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rt73-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 968 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_package_setscene)
NOTE: Running setscene task 969 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_package_setscene)
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 970 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rt73-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-htc7010-1.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 971 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_package_setscene)
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-htc7010-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe firmware-rt2870-1.0-r0: task do_package_setscene: Started
NOTE: recipe firmware-htc9271-1.0-r0: task do_package_setscene: Started
NOTE: recipe firmware-zd1211-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 972 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe firmware-rt2870-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe firmware-rt73-1.0-r0: task do_package_setscene: Started
NOTE: recipe firmware-htc9271-1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 973 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_packagedata_setscene)
NOTE: Running setscene task 974 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 975 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-zd1211-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 976 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_packagedata_setscene)
NOTE: Running setscene task 977 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_packagedata_setscene)
NOTE: recipe firmware-rt73-1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 978 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe firmware-zd1211-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 979 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_package_write_ipk_setscene)
NOTE: recipe alsa-lib-1.0.25-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eglibc-locale-2.17-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ethtool-3.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-zd1211-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_package_setscene)
NOTE: Running setscene task 981 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_package_setscene)
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python-2.7.3-r5.2: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 982 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_package_setscene)
NOTE: recipe alsa-lib-1.0.25-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 983 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_package_write_ipk_setscene)
NOTE: recipe ethtool-3.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 984 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_packagedata_setscene)
NOTE: recipe firmware-zd1211-1.0-r0: task do_package_setscene: Started
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_package_setscene: Started
NOTE: recipe firmware-zd1211-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 985 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python-twisted-12.0.0-r2: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 986 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe ethtool-3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 987 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_package_write_ipk_setscene)
NOTE: recipe python-utf8-hack-0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python-2.7.3-r5.2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe python-twisted-12.0.0-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 988 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 989 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_packagedata_setscene)
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe python-utf8-hack-0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 990 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_packagedata_setscene)
NOTE: recipe ethtool-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_package_setscene)
NOTE: Running setscene task 992 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_packagedata_setscene)
NOTE: recipe python-twisted-12.0.0-r2: task do_packagedata_setscene: Started
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 993 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_packagedata_setscene)
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_packagedata_setscene: Started
NOTE: recipe python-utf8-hack-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ethtool-3.7-r0: task do_package_setscene: Started
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_packagedata_setscene: Started
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python-twisted-12.0.0-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 994 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_package_setscene)
NOTE: Running setscene task 995 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_package_setscene)
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 996 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_packagedata_setscene)
NOTE: Running setscene task 997 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_package_setscene)
NOTE: recipe python-utf8-hack-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ethtool-3.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 998 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_package_setscene)
NOTE: recipe python-twisted-12.0.0-r2: task do_package_setscene: Started
NOTE: Running setscene task 999 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_package_write_ipk_setscene)
NOTE: recipe samba-3.0.37-r8: task do_package_setscene: Succeeded
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_package_setscene: Started
NOTE: Running setscene task 1000 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_packagedata_setscene: Started
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_package_setscene: Started
NOTE: recipe python-utf8-hack-0.2-r0: task do_package_setscene: Started
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_package_setscene: Succeeded
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1001 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_package_setscene)
NOTE: recipe python-utf8-hack-0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1003 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_package_write_ipk_setscene)
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_package_setscene: Succeeded
NOTE: Running setscene task 1004 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_package_write_ipk_setscene)
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1005 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_packagedata_setscene)
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_package_setscene: Started
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_package_write_ipk_setscene: Started
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_packagedata_setscene: Started
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1006 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_package_setscene: Succeeded
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1008 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_package_setscene)
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1009 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvdcss-1.2.10-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_package_setscene: Started
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_packagedata_setscene: Started
NOTE: Running setscene task 1010 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libdvdcss-1.2.10-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1011 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_package_write_ipk_setscene)
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_packagedata_setscene: Started
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1013 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_packagedata_setscene)
NOTE: recipe libdvdcss-1.2.10-r1: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-4.7.2-r17: task do_package_write_ipk_setscene: Started
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_packagedata_setscene: Started
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1014 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_package_write_ipk_setscene)
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_package_setscene)
NOTE: recipe gcc-runtime-4.7.2-r17: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1016 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_package_write_ipk_setscene)
NOTE: recipe freetype-2.4.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_package_setscene: Started
NOTE: recipe gstreamer-0.10.36-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe freetype-2.4.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1017 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_package_write_ipk_setscene)
NOTE: recipe gstreamer-0.10.36-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1018 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_package_write_ipk_setscene)
NOTE: recipe eglibc-locale-2.17-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1019 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_packagedata_setscene)
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1020 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_package_setscene)
NOTE: recipe jpeg-8d-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_package_setscene)
NOTE: recipe eglibc-locale-2.17-r0: task do_packagedata_setscene: Started
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_package_setscene: Started
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_package_setscene: Started
NOTE: Running setscene task 1022 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_packagedata_setscene)
NOTE: recipe jpeg-8d-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1023 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_package_write_ipk_setscene)
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_packagedata_setscene: Started
NOTE: recipe libdvbsi++-0.3.6-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvbsi++-0.3.6-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1024 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_packagedata_setscene)
NOTE: recipe libdvbsi++-0.3.6-r1: task do_packagedata_setscene: Started
NOTE: recipe python-twisted-12.0.0-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1025 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_package_write_ipk_setscene)
NOTE: recipe fribidi-0.19.2-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe fribidi-0.19.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1026 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_packagedata_setscene)
NOTE: recipe fribidi-0.19.2-r1: task do_packagedata_setscene: Started
NOTE: recipe libdvdcss-1.2.10-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1027 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_package_setscene)
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_package_setscene: Succeeded
NOTE: recipe libdvdcss-1.2.10-r1: task do_package_setscene: Started
NOTE: Running setscene task 1028 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_package_write_ipk_setscene)
NOTE: recipe libmad-0.15.1b-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe fribidi-0.19.2-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1029 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_package_setscene)
NOTE: recipe libdvbsi++-0.3.6-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe eglibc-locale-2.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-0.19.2-r1: task do_package_setscene: Started
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1030 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_package_setscene)
NOTE: Running setscene task 1031 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_package_setscene)
NOTE: Running setscene task 1032 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_package_setscene)
NOTE: recipe libmad-0.15.1b-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1033 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_package_write_ipk_setscene)
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_package_setscene: Started
NOTE: recipe libdvbsi++-0.3.6-r1: task do_package_setscene: Started
NOTE: recipe eglibc-locale-2.17-r0: task do_package_setscene: Started
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1034 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_package_write_ipk_setscene)
NOTE: recipe fribidi-0.19.2-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1035 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_package_write_ipk_setscene)
NOTE: recipe libpng-1.5.13-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvdcss-1.2.10-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1036 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_package_write_ipk_setscene)
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe libungif-4.1.3-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe libxml2-2.9.0-r1.1: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvbsi++-0.3.6-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1037 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_package_write_ipk_setscene)
NOTE: recipe libpng-1.5.13-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1038 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_package_write_ipk_setscene)
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1039 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_packagedata_setscene)
NOTE: recipe libungif-4.1.3-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1040 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_packagedata_setscene)
NOTE: recipe libxml2-2.9.0-r1.1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1041 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_package_write_ipk_setscene)
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_packagedata_setscene: Started
NOTE: recipe openssl-0.9.8x-r15.0: task do_package_write_ipk_setscene: Started
NOTE: recipe libungif-4.1.3-r3: task do_packagedata_setscene: Started
NOTE: recipe python-imaging-1.1.7-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_package_setscene: Succeeded
NOTE: Running setscene task 1042 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_package_write_ipk_setscene)
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1043 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_package_setscene)
NOTE: Running setscene task 1044 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_packagedata_setscene)
NOTE: recipe libungif-4.1.3-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python-imaging-1.1.7-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-wifi-0.5.0-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1045 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_packagedata_setscene)
NOTE: Running setscene task 1046 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_package_setscene)
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_package_setscene: Started
NOTE: recipe python-imaging-1.1.7-r4: task do_packagedata_setscene: Started
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_packagedata_setscene: Started
NOTE: recipe libungif-4.1.3-r3: task do_package_setscene: Started
NOTE: recipe python-imaging-1.1.7-r4: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1047 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_package_setscene)
NOTE: recipe python-imaging-1.1.7-r4: task do_package_setscene: Started
NOTE: recipe python-wifi-0.5.0-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1048 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1049 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_package_setscene)
NOTE: recipe openssl-0.9.8x-r15.0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-wifi-0.5.0-r1: task do_packagedata_setscene: Started
NOTE: recipe libungif-4.1.3-r3: task do_package_setscene: Succeeded
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_package_setscene: Started
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1050 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_package_write_ipk_setscene)
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_package_setscene: Succeeded
NOTE: Running setscene task 1051 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1052 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_packagedata_setscene)
NOTE: Running setscene task 1053 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_package_write_ipk_setscene)
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_package_setscene: Succeeded
NOTE: recipe python-wifi-0.5.0-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1054 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_package_setscene)
NOTE: Running setscene task 1055 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_package_write_ipk_setscene)
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe python-imaging-1.1.7-r4: task do_package_setscene: Succeeded
NOTE: recipe python-pyopenssl-0.13-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1056 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_package_write_ipk_setscene)
NOTE: recipe ushare-1.1a-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_packagedata_setscene: Started
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ushare-1.1a-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1057 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_packagedata_setscene)
NOTE: recipe python-wifi-0.5.0-r1: task do_package_setscene: Started
NOTE: recipe python-pyopenssl-0.13-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1058 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_packagedata_setscene)
NOTE: recipe python-gdata-2.0.14-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe streamripper-1.64.6-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_packagedata_setscene: Started
NOTE: recipe python-wifi-0.5.0-r1: task do_package_setscene: Succeeded
NOTE: recipe python-gdata-2.0.14-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe streamripper-1.64.6-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ushare-1.1a-r1: task do_packagedata_setscene: Started
NOTE: recipe python-pyopenssl-0.13-r1: task do_packagedata_setscene: Started
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1060 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_package_setscene)
NOTE: Running setscene task 1061 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1062 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_packagedata_setscene)
NOTE: Running setscene task 1063 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_packagedata_setscene)
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe ushare-1.1a-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe python-pyopenssl-0.13-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1064 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_package_setscene)
NOTE: Running setscene task 1065 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_package_setscene)
NOTE: Running setscene task 1066 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_package_setscene)
NOTE: recipe python-gdata-2.0.14-r1: task do_packagedata_setscene: Started
NOTE: recipe streamripper-1.64.6-r1: task do_packagedata_setscene: Started
NOTE: recipe python-mutagen-1.18-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_package_setscene: Started
NOTE: recipe ushare-1.1a-r1: task do_package_setscene: Started
NOTE: recipe python-pyopenssl-0.13-r1: task do_package_setscene: Started
NOTE: recipe python-mutagen-1.18-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_package_setscene: Started
NOTE: recipe python-gdata-2.0.14-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1067 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_packagedata_setscene)
NOTE: Running setscene task 1068 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_package_setscene)
NOTE: recipe streamripper-1.64.6-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe python-mutagen-1.18-r1: task do_packagedata_setscene: Started
NOTE: recipe python-gdata-2.0.14-r1: task do_package_setscene: Started
NOTE: Running setscene task 1069 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_package_setscene)
NOTE: recipe ushare-1.1a-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1070 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_package_write_ipk_setscene)
NOTE: recipe python-pyopenssl-0.13-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1071 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_package_write_ipk_setscene)
NOTE: recipe streamripper-1.64.6-r1: task do_package_setscene: Started
NOTE: recipe python-mutagen-1.18-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1072 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_package_setscene)
NOTE: recipe streamripper-1.64.6-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1073 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_packagedata_setscene)
NOTE: recipe python-daap-0.7.1-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe libcddb-1.3.2-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1074 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_package_write_ipk_setscene)
NOTE: recipe python-mutagen-1.18-r1: task do_package_setscene: Started
NOTE: recipe python-daap-0.7.1-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1075 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_packagedata_setscene)
NOTE: recipe libcddb-1.3.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-mutagen-1.18-r1: task do_package_setscene: Succeeded
NOTE: recipe libmad-0.15.1b-r1: task do_packagedata_setscene: Started
NOTE: recipe python-gdata-2.0.14-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1076 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1077 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_packagedata_setscene)
NOTE: Running setscene task 1078 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_package_write_ipk_setscene)
NOTE: recipe dvdbackup-0.4.2-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe python-daap-0.7.1-r3: task do_packagedata_setscene: Started
NOTE: recipe libmad-0.15.1b-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe dvdbackup-0.4.2-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libcddb-1.3.2-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1079 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_package_setscene)
NOTE: Running setscene task 1080 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe python-daap-0.7.1-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_package_setscene)
NOTE: recipe libmad-0.15.1b-r1: task do_package_setscene: Started
NOTE: recipe dvdbackup-0.4.2-r2: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1082 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_package_write_ipk_setscene)
NOTE: recipe base-passwd-3.5.26-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libcddb-1.3.2-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1083 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_package_setscene)
NOTE: recipe python-daap-0.7.1-r3: task do_package_setscene: Started
NOTE: recipe dvdbackup-0.4.2-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe libcddb-1.3.2-r1: task do_package_setscene: Started
NOTE: Running setscene task 1084 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_package_setscene)
NOTE: recipe gettext-0.18.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe dvdbackup-0.4.2-r2: task do_package_setscene: Started
NOTE: recipe python-daap-0.7.1-r3: task do_package_setscene: Succeeded
NOTE: Running setscene task 1085 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_package_write_ipk_setscene)
NOTE: recipe base-passwd-3.5.26-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1086 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_package_write_ipk_setscene)
NOTE: recipe libcddb-1.3.2-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1087 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_package_write_ipk_setscene)
NOTE: recipe libmad-0.15.1b-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1088 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_package_write_ipk_setscene)
NOTE: recipe libcap-2.22-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe dvdbackup-0.4.2-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1089 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_package_write_ipk_setscene)
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_package_setscene: Succeeded
NOTE: Running setscene task 1090 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gettext-0.18.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1091 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_package_write_ipk_setscene)
NOTE: recipe libcap-2.22-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1092 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_package_write_ipk_setscene)
NOTE: recipe dbus-1.6.8-r5.0: task do_package_write_ipk_setscene: Started
NOTE: recipe expat-2.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gstreamer-0.10.36-r4: task do_packagedata_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1093 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_package_write_ipk_setscene)
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe gstreamer-0.10.36-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.1.4.3-r13: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1094 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_package_setscene)
NOTE: recipe talloc-2.0.1-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe expat-2.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe readline-6.2-r4: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1095 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_package_write_ipk_setscene)
NOTE: recipe dbus-1.6.8-r5.0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1096 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_package_write_ipk_setscene)
NOTE: recipe zlib-1.2.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe readline-6.2-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe talloc-2.0.1-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1097 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_package_write_ipk_setscene)
NOTE: recipe shadow-4.1.4.3-r13: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1098 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1099 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe zlib-1.2.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1100 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_package_write_ipk_setscene)
NOTE: recipe libevent-2.0.21-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1101 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_package_write_ipk_setscene)
NOTE: recipe libnfsidmap-0.25-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_ipk_setscene: Started
NOTE: recipe talloc-2.0.1-r2: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3.7.15.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libnfsidmap-0.25-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1102 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_packagedata_setscene)
NOTE: Running setscene task 1103 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_packagedata_setscene)
NOTE: recipe bzip2-1.0.6-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe talloc-2.0.1-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1104 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_package_setscene)
NOTE: recipe libnfsidmap-0.25-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe libevent-2.0.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1105 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_packagedata_setscene)
NOTE: recipe sqlite3-3.7.15.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe talloc-2.0.1-r2: task do_package_setscene: Started
NOTE: Running setscene task 1106 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_package_write_ipk_setscene)
NOTE: recipe bzip2-1.0.6-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gstreamer-0.10.36-r4: task do_package_setscene: Started
NOTE: recipe libevent-2.0.21-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1107 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_package_write_ipk_setscene)
NOTE: recipe libnfsidmap-0.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_package_setscene)
NOTE: Running setscene task 1109 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_package_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_setscene: Started
NOTE: recipe talloc-2.0.1-r2: task do_package_setscene: Succeeded
NOTE: recipe libevent-2.0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1111 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_package_setscene)
NOTE: recipe libnfsidmap-0.25-r0: task do_package_setscene: Started
NOTE: recipe gdbm-1.10-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe libevent-2.0.21-r0: task do_package_setscene: Started
NOTE: recipe db-5.3.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libnfsidmap-0.25-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1112 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_package_write_ipk_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_setscene: Succeeded
NOTE: Running setscene task 1113 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_package_write_ipk_setscene)
NOTE: recipe gdbm-1.10-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1114 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_package_write_ipk_setscene)
NOTE: recipe liboil-0.3.17-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libvorbis-1.3.3-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libogg-1.3.0-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libevent-2.0.21-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1115 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_package_write_ipk_setscene)
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libogg-1.3.0-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1116 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_packagedata_setscene)
NOTE: Running setscene task 1117 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_package_write_ipk_setscene)
NOTE: recipe libvorbis-1.3.3-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1118 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_packagedata_setscene)
NOTE: recipe liboil-0.3.17-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1119 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_packagedata_setscene)
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libvorbis-1.3.3-r1: task do_packagedata_setscene: Started
NOTE: recipe tremor-20120314-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe liboil-0.3.17-r5: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1120 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_package_setscene)
NOTE: recipe liboil-0.3.17-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1121 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.3-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1122 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_package_setscene)
NOTE: Running setscene task 1123 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_package_setscene)
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_package_setscene: Started
NOTE: recipe gstreamer-0.10.36-r4: task do_package_setscene: Succeeded
NOTE: Running setscene task 1124 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_package_write_ipk_setscene)
NOTE: recipe libvorbis-1.3.3-r1: task do_package_setscene: Started
NOTE: recipe tremor-20120314-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1125 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_packagedata_setscene)
NOTE: recipe liboil-0.3.17-r5: task do_package_setscene: Started
NOTE: recipe tremor-20120314-r1: task do_packagedata_setscene: Started
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1126 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_package_setscene)
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_package_setscene: Succeeded
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1127 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1128 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_packagedata_setscene)
NOTE: recipe tremor-20120314-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package_setscene: Started
NOTE: Running setscene task 1129 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_package_setscene)
NOTE: recipe liboil-0.3.17-r5: task do_package_setscene: Succeeded
NOTE: Running setscene task 1130 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_package_write_ipk_setscene)
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_packagedata_setscene: Started
NOTE: recipe tremor-20120314-r1: task do_package_setscene: Started
NOTE: recipe orc-0.4.16-r0.0: task do_package_write_ipk_setscene: Started
NOTE: recipe cairo-1.12.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1131 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_package_setscene)
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_package_setscene: Started
NOTE: recipe libvorbis-1.3.3-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1132 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_package_write_ipk_setscene)
NOTE: recipe orc-0.4.16-r0.0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1133 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_packagedata_setscene)
NOTE: recipe libid3tag-0.15.1b-r7: task do_package_write_ipk_setscene: Started
NOTE: recipe orc-0.4.16-r0.0: task do_packagedata_setscene: Started
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_package_setscene: Succeeded
NOTE: recipe tremor-20120314-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1134 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1135 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_package_write_ipk_setscene)
NOTE: recipe speex-1.2rc1-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe flac-1.2.1-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe libid3tag-0.15.1b-r7: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1136 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_packagedata_setscene)
NOTE: recipe orc-0.4.16-r0.0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1137 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_package_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_package_setscene: Succeeded
NOTE: recipe libid3tag-0.15.1b-r7: task do_packagedata_setscene: Started
NOTE: Running setscene task 1138 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_package_write_ipk_setscene)
NOTE: recipe orc-0.4.16-r0.0: task do_package_setscene: Started
NOTE: recipe speex-1.2rc1-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1139 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_packagedata_setscene)
NOTE: recipe speex-1.2rc1-r2: task do_packagedata_setscene: Started
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe db-5.3.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1140 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_package_write_ipk_setscene)
NOTE: recipe orc-0.4.16-r0.0: task do_package_setscene: Succeeded
NOTE: recipe flac-1.2.1-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1141 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1142 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_package_write_ipk_setscene)
NOTE: recipe libid3tag-0.15.1b-r7: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1143 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_package_setscene)
NOTE: recipe libmms-0.6.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libid3tag-0.15.1b-r7: task do_package_setscene: Started
NOTE: recipe curl-7.28.1-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe speex-1.2rc1-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1144 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_packagedata_setscene)
NOTE: Running setscene task 1145 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_package_setscene)
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2rc1-r2: task do_package_setscene: Started
NOTE: recipe libmms-0.6.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1146 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_packagedata_setscene)
NOTE: Running setscene task 1147 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_packagedata_setscene)
NOTE: recipe libmms-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_packagedata_setscene: Started
NOTE: recipe libid3tag-0.15.1b-r7: task do_package_setscene: Succeeded
NOTE: Running setscene task 1148 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_package_write_ipk_setscene)
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1149 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_package_setscene)
NOTE: recipe mpeg2dec-0.4.1-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_package_setscene: Started
NOTE: recipe libmms-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1150 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_package_setscene)
NOTE: Running setscene task 1151 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_package_setscene)
NOTE: recipe curl-7.28.1-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1152 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_packagedata_setscene)
NOTE: recipe libmms-0.6.2-r0: task do_package_setscene: Started
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_package_setscene: Started
NOTE: recipe mpeg2dec-0.4.1-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1153 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_packagedata_setscene)
NOTE: recipe mpeg2dec-0.4.1-r2: task do_packagedata_setscene: Started
NOTE: recipe curl-7.28.1-r3: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.12.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1154 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_packagedata_setscene)
NOTE: recipe cairo-1.12.10-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2rc1-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1155 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_package_write_ipk_setscene)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe mpeg2dec-0.4.1-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1156 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_package_setscene)
NOTE: recipe mpeg2dec-0.4.1-r2: task do_package_setscene: Started
NOTE: recipe libmms-0.6.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1157 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_package_write_ipk_setscene)
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1158 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_package_write_ipk_setscene)
NOTE: recipe cairo-1.12.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lame-3.99.5-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe opencore-amr-0.1.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe curl-7.28.1-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1159 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_package_setscene)
NOTE: Running setscene task 1160 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_package_setscene)
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_package_setscene: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1161 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_packagedata_setscene)
NOTE: recipe mpeg2dec-0.4.1-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1162 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_packagedata_setscene)
NOTE: recipe curl-7.28.1-r3: task do_package_setscene: Started
NOTE: Running setscene task 1163 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_package_write_ipk_setscene)
NOTE: recipe cairo-1.12.10-r0: task do_package_setscene: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata_setscene: Started
NOTE: recipe libcdio-0.82-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe opencore-amr-0.1.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libxml2-2.9.0-r1.1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1164 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_packagedata_setscene)
NOTE: recipe opencore-amr-0.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lame-3.99.5-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1165 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_packagedata_setscene)
NOTE: recipe lame-3.99.5-r1: task do_packagedata_setscene: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1166 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_package_setscene)
NOTE: recipe liba52-0.7.4-r4: task do_package_setscene: Started
NOTE: recipe libcdio-0.82-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1167 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_packagedata_setscene)
NOTE: recipe opencore-amr-0.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.0-r1.1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_package_setscene)
NOTE: recipe lame-3.99.5-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1169 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_package_setscene)
NOTE: Running setscene task 1170 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_package_setscene)
NOTE: recipe libcdio-0.82-r0: task do_packagedata_setscene: Started
NOTE: recipe opencore-amr-0.1.2-r0: task do_package_setscene: Started
NOTE: recipe lame-3.99.5-r1: task do_package_setscene: Started
NOTE: recipe liba52-0.7.4-r4: task do_package_setscene: Succeeded
NOTE: Running setscene task 1171 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_package_write_ipk_setscene)
NOTE: recipe libcdio-0.82-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1172 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_package_setscene)
NOTE: recipe libcdio-0.82-r0: task do_package_setscene: Started
NOTE: recipe libgcc-4.7.2-r17: task do_package_write_ipk_setscene: Started
NOTE: recipe opencore-amr-0.1.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1173 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_package_write_ipk_setscene)
NOTE: recipe curl-7.28.1-r3: task do_package_setscene: Succeeded
NOTE: Running setscene task 1174 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_package_write_ipk_setscene)
NOTE: recipe libxml2-2.9.0-r1.1: task do_package_setscene: Started
NOTE: recipe lame-3.99.5-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1175 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_package_write_ipk_setscene)
NOTE: recipe sysvinit-2.88dsf-r13: task do_package_write_ipk_setscene: Started
NOTE: recipe libgcc-4.7.2-r17: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libnss-mdns-0.10-r7: task do_package_write_ipk_setscene: Started
NOTE: recipe rpcbind-0.2.0-r4: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1176 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_package_write_ipk_setscene)
NOTE: recipe libcdio-0.82-r0: task do_package_setscene: Succeeded
NOTE: recipe showiframe-1.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1177 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_package_write_ipk_setscene)
NOTE: recipe sysvinit-2.88dsf-r13: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libnss-mdns-0.10-r7: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe rpcbind-0.2.0-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1178 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_packagedata_setscene)
NOTE: Running setscene task 1179 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_packagedata_setscene)
NOTE: Running setscene task 1180 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_packagedata_setscene)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe showiframe-1.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1181 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_packagedata_setscene)
NOTE: recipe sysvinit-2.88dsf-r13: task do_packagedata_setscene: Started
NOTE: recipe libnss-mdns-0.10-r7: task do_packagedata_setscene: Started
NOTE: recipe rpcbind-0.2.0-r4: task do_packagedata_setscene: Started
NOTE: recipe showiframe-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-2.88dsf-r13: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1182 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_package_setscene)
NOTE: recipe rpcbind-0.2.0-r4: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_package_setscene)
NOTE: recipe libnss-mdns-0.10-r7: task do_packagedata_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe showiframe-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sysvinit-2.88dsf-r13: task do_package_setscene: Started
NOTE: Running setscene task 1184 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1185 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_package_setscene)
NOTE: Running setscene task 1186 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_package_setscene)
NOTE: recipe cairo-1.12.10-r0: task do_package_setscene: Succeeded
NOTE: recipe rpcbind-0.2.0-r4: task do_package_setscene: Started
NOTE: Running setscene task 1187 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_package_write_ipk_setscene)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libnss-mdns-0.10-r7: task do_package_setscene: Started
NOTE: recipe showiframe-1.1-r0: task do_package_setscene: Started
NOTE: recipe kmod-9-r0.0: task do_package_write_ipk_setscene: Started
NOTE: recipe rpcbind-0.2.0-r4: task do_package_setscene: Succeeded
NOTE: Running setscene task 1188 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_package_write_ipk_setscene)
NOTE: recipe sysvinit-2.88dsf-r13: task do_package_setscene: Succeeded
NOTE: Running setscene task 1189 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_package_write_ipk_setscene)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1190 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_package_setscene)
NOTE: recipe libnss-mdns-0.10-r7: task do_package_setscene: Succeeded
NOTE: Running setscene task 1191 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_packagedata_setscene)
NOTE: recipe showiframe-1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe bluez4-4.101-r6: task do_package_write_ipk_setscene: Started
NOTE: recipe wireless-tools-1_29-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_setscene: Started
NOTE: Running setscene task 1192 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_package_write_ipk_setscene)
NOTE: recipe avahi-0.6.31-r6.1: task do_packagedata_setscene: Started
NOTE: recipe wpa-supplicant-2.0-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_setscene: Succeeded
NOTE: recipe kmod-9-r0.0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1193 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_packagedata_setscene)
NOTE: Running setscene task 1194 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_package_write_ipk_setscene)
NOTE: recipe kmod-9-r0.0: task do_packagedata_setscene: Started
NOTE: recipe usbutils-006-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe wireless-tools-1_29-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe avahi-0.6.31-r6.1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1195 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_packagedata_setscene)
NOTE: Running setscene task 1196 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_package_setscene)
NOTE: recipe wireless-tools-1_29-r4: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.0-r1.1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1197 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_package_write_ipk_setscene)
NOTE: recipe wpa-supplicant-2.0-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1198 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_packagedata_setscene)
NOTE: recipe kmod-9-r0.0: task do_packagedata_setscene: Succeeded
NOTE: recipe usbutils-006-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1199 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_package_setscene)
NOTE: Running setscene task 1200 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_packagedata_setscene)
NOTE: recipe alsa-utils-1.0.26-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe wpa-supplicant-2.0-r2: task do_packagedata_setscene: Started
NOTE: recipe usbutils-006-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-9-r0.0: task do_package_setscene: Started
NOTE: recipe wireless-tools-1_29-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez4-4.101-r6: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1201 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1202 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_package_setscene)
NOTE: recipe alsa-utils-1.0.26-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe wpa-supplicant-2.0-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1203 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1204 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_package_setscene)
NOTE: recipe avahi-0.6.31-r6.1: task do_package_setscene: Started
NOTE: recipe kmod-9-r0.0: task do_package_setscene: Succeeded
NOTE: recipe usbutils-006-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-state-0.2.0-r4: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1205 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_package_write_ipk_setscene)
NOTE: recipe wireless-tools-1_29-r4: task do_package_setscene: Started
NOTE: Running setscene task 1206 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_package_setscene)
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe wpa-supplicant-2.0-r2: task do_package_setscene: Started
NOTE: recipe usbutils-006-r0: task do_package_setscene: Started
NOTE: recipe busybox-1.20.2-r32: task do_package_write_ipk_setscene: Started
NOTE: recipe alsa-state-0.2.0-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1207 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_packagedata_setscene)
NOTE: recipe alsa-utils-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe wireless-tools-1_29-r4: task do_package_setscene: Succeeded
NOTE: Running setscene task 1208 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_packagedata_setscene)
NOTE: recipe usbutils-006-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1209 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_package_write_ipk_setscene)
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe busybox-1.20.2-r32: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe alsa-state-0.2.0-r4: task do_packagedata_setscene: Started
NOTE: Running setscene task 1210 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_packagedata_setscene)
NOTE: Running setscene task 1211 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_packagedata_setscene)
NOTE: recipe alsa-utils-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1212 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_package_setscene)
NOTE: recipe modutils-initscripts-1.0-r7: task do_package_write_ipk_setscene: Started
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_packagedata_setscene: Started
NOTE: recipe busybox-1.20.2-r32: task do_packagedata_setscene: Started
NOTE: recipe modutils-initscripts-1.0-r7: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe alsa-utils-1.0.26-r0: task do_package_setscene: Started
NOTE: recipe alsa-state-0.2.0-r4: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1213 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_package_setscene)
NOTE: Running setscene task 1214 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_packagedata_setscene)
NOTE: recipe alsa-state-0.2.0-r4: task do_package_setscene: Started
NOTE: recipe modutils-initscripts-1.0-r7: task do_packagedata_setscene: Started
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe busybox-1.20.2-r32: task do_packagedata_setscene: Succeeded
NOTE: recipe wpa-supplicant-2.0-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1215 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_package_setscene)
NOTE: Running setscene task 1216 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1217 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_package_setscene)
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_package_setscene: Started
NOTE: recipe busybox-1.20.2-r32: task do_package_setscene: Started
NOTE: recipe modutils-initscripts-1.0-r7: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1218 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_package_setscene)
NOTE: recipe avahi-0.6.31-r6.1: task do_package_setscene: Succeeded
NOTE: recipe netbase-1_5.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1219 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_packagedata_setscene)
NOTE: recipe alsa-state-0.2.0-r4: task do_package_setscene: Succeeded
NOTE: Running setscene task 1220 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_package_write_ipk_setscene)
NOTE: recipe modutils-initscripts-1.0-r7: task do_package_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-utils-1.0.26-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1221 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_package_write_ipk_setscene)
NOTE: recipe modutils-initscripts-1.0-r7: task do_package_setscene: Succeeded
NOTE: recipe netbase-1_5.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1222 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1223 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_package_write_ipk_setscene)
NOTE: recipe init-ifupdown-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe initscripts-1.0-r142: task do_package_write_ipk_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1224 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_package_setscene)
NOTE: recipe python-cheetah-2.4.4-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe initscripts-1.0-r142: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe init-ifupdown-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1225 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1226 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_packagedata_setscene)
NOTE: recipe busybox-1.20.2-r32: task do_package_setscene: Succeeded
NOTE: Running setscene task 1227 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_packagedata_setscene)
NOTE: recipe python-cheetah-2.4.4-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1228 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_packagedata_setscene)
NOTE: Running setscene task 1229 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_packagedata_setscene)
NOTE: recipe init-ifupdown-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_package_setscene: Succeeded
NOTE: recipe netbase-1_5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1230 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_package_write_ipk_setscene)
NOTE: recipe initscripts-1.0-r142: task do_packagedata_setscene: Started
NOTE: recipe python-cheetah-2.4.4-r3: task do_packagedata_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_setscene: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_packagedata_setscene: Started
NOTE: recipe netbase-1_5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe init-ifupdown-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.28.7-r3: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1231 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_package_setscene)
NOTE: Running setscene task 1232 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_package_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1233 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_package_write_ipk_setscene)
NOTE: recipe initscripts-1.0-r142: task do_packagedata_setscene: Succeeded
NOTE: recipe python-cheetah-2.4.4-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1234 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_package_setscene)
NOTE: Running setscene task 1235 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_package_setscene)
NOTE: recipe netbase-1_5.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 1236 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_package_setscene)
NOTE: recipe init-ifupdown-1.0-r0: task do_package_setscene: Started
NOTE: recipe tiff-4.0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe initscripts-1.0-r142: task do_package_setscene: Started
NOTE: recipe python-cheetah-2.4.4-r3: task do_package_setscene: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_package_setscene: Started
NOTE: recipe glib-networking-2.28.7-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1237 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_packagedata_setscene)
NOTE: recipe glib-networking-2.28.7-r3: task do_packagedata_setscene: Started
NOTE: recipe init-ifupdown-1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1238 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_package_write_ipk_setscene)
NOTE: recipe tiff-4.0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe initscripts-1.0-r142: task do_package_setscene: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_package_setscene: Succeeded
NOTE: recipe netbase-1_5.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1239 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1240 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_packagedata_setscene)
NOTE: recipe python-cheetah-2.4.4-r3: task do_package_setscene: Succeeded
NOTE: Running setscene task 1241 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1242 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1243 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_packagedata_setscene)
NOTE: recipe glib-networking-2.28.7-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1244 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_package_setscene)
NOTE: recipe libupnp-1.6.5-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe faad2-2.7-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe tiff-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.28.7-r3: task do_package_setscene: Started
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1245 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_packagedata_setscene)
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libupnp-1.6.5-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe tiff-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe faad2-2.7-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1246 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_packagedata_setscene)
NOTE: Running setscene task 1247 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_package_setscene)
NOTE: Running setscene task 1248 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_packagedata_setscene)
NOTE: Running setscene task 1249 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_package_setscene)
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_packagedata_setscene: Started
NOTE: recipe faad2-2.7-r1: task do_packagedata_setscene: Started
NOTE: recipe libupnp-1.6.5-r1: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.0.3-r0: task do_package_setscene: Started
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1250 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_packagedata_setscene)
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libupnp-1.6.5-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1251 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_package_setscene)
NOTE: Running setscene task 1252 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_package_setscene)
NOTE: recipe glib-networking-2.28.7-r3: task do_package_setscene: Succeeded
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1253 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_package_write_ipk_setscene)
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_package_setscene: Started
NOTE: recipe libupnp-1.6.5-r1: task do_package_setscene: Started
NOTE: recipe faad2-2.7-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1254 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_package_setscene)
NOTE: recipe attr-2.4.46-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1255 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_package_setscene)
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_package_setscene: Succeeded
NOTE: recipe faad2-2.7-r1: task do_package_setscene: Started
NOTE: Running setscene task 1256 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_package_write_ipk_setscene)
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_package_setscene: Started
NOTE: recipe attr-2.4.46-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1257 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_populate_lic_setscene)
NOTE: recipe libffi-3.0.11-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe fontconfig-2.10.2-r1: task do_populate_lic_setscene: Started
NOTE: recipe libupnp-1.6.5-r1: task do_package_setscene: Succeeded
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1258 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1259 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_package_setscene: Started
NOTE: recipe faad2-2.7-r1: task do_package_setscene: Succeeded
NOTE: recipe libffi-3.0.11-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1260 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_package_write_ipk_setscene)
NOTE: recipe fontconfig-2.10.2-r1: task do_populate_lic_setscene: Succeeded
NOTE: recipe fontconfig-2.10.2-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe pixman-1_0.28.2-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1261 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1262 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_package_setscene: Succeeded
NOTE: Running setscene task 1263 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_packagedata_setscene)
NOTE: recipe eglibc-locale-2.17-r0: task do_package_setscene: Succeeded
NOTE: recipe tiff-4.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1264 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_packagedata_setscene)
NOTE: Running setscene task 1265 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_package_write_ipk_setscene)
NOTE: recipe fontconfig-2.10.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe pixman-1_0.28.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1266 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_packagedata_setscene)
NOTE: Running setscene task 1267 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_packagedata_setscene)
NOTE: recipe gnutls-2.12.21-r8.4: task do_package_write_ipk_setscene: Started
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe libproxy-0.4.7-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe python-2.7.3-r5.2: task do_packagedata_setscene: Started
NOTE: recipe jpeg-8d-r1: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-0.2.2-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe fontconfig-2.10.2-r1: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.28.2-r1: task do_packagedata_setscene: Started
NOTE: recipe libproxy-0.4.7-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1268 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_packagedata_setscene)
NOTE: recipe gnutls-2.12.21-r8.4: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-2.7.3-r5.2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1269 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_packagedata_setscene)
NOTE: Running setscene task 1270 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1271 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_package_setscene)
NOTE: recipe jpeg-8d-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1272 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_package_setscene)
NOTE: recipe pixman-1_0.28.2-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1273 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_package_setscene)
NOTE: recipe libtirpc-0.2.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe fontconfig-2.10.2-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1274 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_packagedata_setscene)
NOTE: Running setscene task 1275 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_package_setscene)
NOTE: recipe libproxy-0.4.7-r5: task do_packagedata_setscene: Started
NOTE: recipe gnutls-2.12.21-r8.4: task do_packagedata_setscene: Started
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_packagedata_setscene: Started
NOTE: recipe libproxy-0.4.7-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-2.12.21-r8.4: task do_packagedata_setscene: Succeeded
NOTE: recipe python-2.7.3-r5.2: task do_package_setscene: Started
NOTE: recipe jpeg-8d-r1: task do_package_setscene: Started
NOTE: recipe pixman-1_0.28.2-r1: task do_package_setscene: Started
NOTE: recipe fontconfig-2.10.2-r1: task do_package_setscene: Started
NOTE: Running setscene task 1276 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_package_setscene)
NOTE: Running setscene task 1277 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_package_setscene)
NOTE: recipe libtirpc-0.2.2-r1: task do_packagedata_setscene: Started
NOTE: recipe libproxy-0.4.7-r5: task do_package_setscene: Started
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-2.12.21-r8.4: task do_package_setscene: Started
NOTE: Running setscene task 1278 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_package_setscene)
NOTE: recipe libtirpc-0.2.2-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1279 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_package_setscene)
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_package_setscene: Started
NOTE: recipe libtirpc-0.2.2-r1: task do_package_setscene: Started
NOTE: recipe libproxy-0.4.7-r5: task do_package_setscene: Succeeded
NOTE: recipe pixman-1_0.28.2-r1: task do_package_setscene: Succeeded
NOTE: recipe fontconfig-2.10.2-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1280 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_packagedata_setscene)
NOTE: Running setscene task 1281 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_packagedata_setscene)
NOTE: Running setscene task 1282 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_package_write_ipk_setscene)
NOTE: recipe jpeg-8d-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1283 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_package_write_ipk_setscene)
NOTE: recipe freetype-2.4.11-r0: task do_packagedata_setscene: Started
NOTE: recipe quota-4.01-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libpng-1.5.13-r2: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-0.2.2-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1284 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_package_write_ipk_setscene)
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libpng-1.5.13-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.4.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1285 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_package_setscene)
NOTE: Running setscene task 1286 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_package_setscene)
NOTE: recipe dbus-glib-0.100-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_package_setscene: Succeeded
NOTE: recipe quota-4.01-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1287 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1288 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_packagedata_setscene)
NOTE: recipe dbus-glib-0.100-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1289 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_package_write_ipk_setscene)
NOTE: recipe quota-4.01-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1290 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_package_write_ipk_setscene)
NOTE: recipe libcheck-0.9.9-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libcheck-0.9.9-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe quota-4.01-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1291 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_package_write_ipk_setscene)
NOTE: recipe freetype-2.4.11-r0: task do_package_setscene: Started
NOTE: Running setscene task 1292 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_package_setscene)
NOTE: recipe libpng-1.5.13-r2: task do_package_setscene: Started
NOTE: recipe libnl-1_3.2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libsamplerate0-0.1.8-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libdca-0.0.5-5-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe gnutls-2.12.21-r8.4: task do_package_setscene: Succeeded
NOTE: recipe quota-4.01-r1: task do_package_setscene: Started
NOTE: Running setscene task 1293 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_package_write_ipk_setscene)
NOTE: recipe libdca-0.0.5-5-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1294 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_packagedata_setscene)
NOTE: recipe libdca-0.0.5-5-r1: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1295 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_packagedata_setscene)
NOTE: recipe libpng-1.5.13-r2: task do_package_setscene: Succeeded
NOTE: recipe fuse-2.9.2-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1296 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_package_write_ipk_setscene)
NOTE: recipe libnl-1_3.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libsamplerate0-0.1.8-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1297 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_packagedata_setscene)
NOTE: recipe libdca-0.0.5-5-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1298 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_package_setscene)
NOTE: recipe libsamplerate0-0.1.8-r1: task do_packagedata_setscene: Started
NOTE: recipe libdca-0.0.5-5-r1: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.5.0-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe quota-4.01-r1: task do_package_setscene: Succeeded
NOTE: recipe fuse-2.9.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libnl-1_3.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1299 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1300 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_packagedata_setscene)
NOTE: Running setscene task 1301 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_package_setscene)
NOTE: recipe libsamplerate0-0.1.8-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1302 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_package_setscene)
NOTE: recipe freetype-2.4.11-r0: task do_package_setscene: Succeeded
NOTE: recipe libdca-0.0.5-5-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1303 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_package_write_ipk_setscene)
NOTE: recipe libgcrypt-1.5.0-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1304 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1305 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_packagedata_setscene)
NOTE: recipe mtd-utils-1.5.0-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe fuse-2.9.2-r1: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.2.21-r0: task do_package_setscene: Started
NOTE: recipe libsamplerate0-0.1.8-r1: task do_package_setscene: Started
NOTE: recipe bluez-hcidump-2.5-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe mtd-utils-1.5.0-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe fuse-2.9.2-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-4.2-r6: task do_package_write_ipk_setscene: Started
NOTE: recipe libgcrypt-1.5.0-r2: task do_packagedata_setscene: Started
NOTE: Running setscene task 1306 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1307 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_package_setscene)
NOTE: recipe bluez-hcidump-2.5-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe fuse-2.9.2-r1: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.5.0-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1308 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_packagedata_setscene)
NOTE: Running setscene task 1309 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_package_setscene)
NOTE: recipe libsamplerate0-0.1.8-r1: task do_package_setscene: Succeeded
NOTE: recipe mtd-utils-1.5.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 1310 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_packagedata_setscene)
NOTE: recipe bash-4.2-r6: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1311 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_packagedata_setscene)
NOTE: recipe bluez-hcidump-2.5-r1: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.5.0-r2: task do_package_setscene: Started
NOTE: recipe flac-1.2.1-r4: task do_packagedata_setscene: Started
NOTE: recipe mtd-utils-1.5.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe fuse-2.9.2-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1312 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_package_write_ipk_setscene)
NOTE: recipe bash-4.2-r6: task do_packagedata_setscene: Started
NOTE: Running setscene task 1313 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_package_setscene)
NOTE: recipe bluez-hcidump-2.5-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1314 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_package_setscene)
NOTE: recipe flac-1.2.1-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe libnl-1_3.2.21-r0: task do_package_setscene: Succeeded
NOTE: recipe gawk-4.0.1-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe mtd-utils-1.5.0-r5: task do_package_setscene: Started
NOTE: Running setscene task 1315 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_package_setscene)
NOTE: Running setscene task 1316 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_package_write_ipk_setscene)
NOTE: recipe bash-4.2-r6: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez-hcidump-2.5-r1: task do_package_setscene: Started
NOTE: Running setscene task 1317 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_package_setscene)
NOTE: recipe libgcrypt-1.5.0-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1318 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_packagedata_setscene)
NOTE: recipe xz-5.1.2alpha-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-4.2-r6: task do_package_setscene: Started
NOTE: recipe gawk-4.0.1-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bluez-hcidump-2.5-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1319 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_packagedata_setscene)
NOTE: Running setscene task 1320 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_packagedata_setscene)
NOTE: recipe mtd-utils-1.5.0-r5: task do_package_setscene: Succeeded
NOTE: Running setscene task 1321 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_packagedata_setscene)
NOTE: recipe flac-1.2.1-r4: task do_package_setscene: Started
NOTE: recipe gawk-4.0.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.22-r5: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.42.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez4-4.101-r6: task do_packagedata_setscene: Started
NOTE: recipe xz-5.1.2alpha-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1322 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.42.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-4.2-r6: task do_package_setscene: Succeeded
NOTE: recipe bluez4-4.101-r6: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.22-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-4.0.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1323 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1324 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_package_setscene)
NOTE: Running setscene task 1325 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_package_setscene)
NOTE: Running setscene task 1326 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_package_setscene)
NOTE: Running setscene task 1327 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_package_setscene)
NOTE: recipe xz-5.1.2alpha-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.22-r5: task do_package_setscene: Started
NOTE: recipe gawk-4.0.1-r1: task do_package_setscene: Started
NOTE: recipe bluez4-4.101-r6: task do_package_setscene: Started
NOTE: recipe xz-5.1.2alpha-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1328 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_package_setscene)
NOTE: recipe e2fsprogs-1.42.6-r0: task do_package_setscene: Started
NOTE: recipe xz-5.1.2alpha-r0: task do_package_setscene: Started
NOTE: recipe flac-1.2.1-r4: task do_package_setscene: Succeeded
NOTE: recipe util-macros-1_1.17-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1329 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_packagedata_setscene)
NOTE: recipe libcap-2.22-r5: task do_package_setscene: Succeeded
NOTE: recipe libogg-1.3.0-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1330 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_packagedata_setscene)
NOTE: recipe util-macros-1_1.17-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1331 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_packagedata_setscene)
NOTE: recipe attr-2.4.46-r4: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.17-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.46-r4: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1332 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_package_setscene)
NOTE: recipe gawk-4.0.1-r1: task do_package_setscene: Succeeded
NOTE: recipe xz-5.1.2alpha-r0: task do_package_setscene: Succeeded
NOTE: recipe util-macros-1_1.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1333 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_package_setscene)
NOTE: Running setscene task 1334 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_package_write_ipk_setscene)
NOTE: recipe libogg-1.3.0-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1335 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_package_write_ipk_setscene)
NOTE: recipe attr-2.4.46-r4: task do_package_setscene: Started
NOTE: Running setscene task 1336 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_package_setscene)
NOTE: recipe bluez4-4.101-r6: task do_package_setscene: Succeeded
NOTE: recipe e2fsprogs-1.42.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1337 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_packagedata_setscene)
NOTE: Running setscene task 1338 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_packagedata_setscene)
NOTE: recipe util-macros-1_1.17-r0: task do_package_setscene: Started
NOTE: recipe lzo-2.06-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.46-r4: task do_package_setscene: Succeeded
NOTE: recipe libtasn1-2.14-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libogg-1.3.0-r1: task do_package_setscene: Started
NOTE: recipe util-linux-2.22.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1339 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_packagedata_setscene)
NOTE: recipe util-macros-1_1.17-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1340 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_packagedata_setscene)
NOTE: recipe lzo-2.06-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe dbus-glib-0.100-r2: task do_packagedata_setscene: Started
NOTE: Running setscene task 1341 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_packagedata_setscene)
NOTE: recipe libtasn1-2.14-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1342 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_packagedata_setscene)
NOTE: recipe python-2.7.3-r5.2: task do_package_setscene: Succeeded
NOTE: recipe libcheck-0.9.9-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1343 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_packagedata_setscene)
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.06-r1: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-2.14-r1: task do_packagedata_setscene: Started
NOTE: recipe openssl-0.9.8x-r15.0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1344 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_packagedata_setscene)
NOTE: recipe util-linux-2.22.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-glib-0.100-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.9.9-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1345 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_package_setscene)
NOTE: Running setscene task 1346 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_packagedata_setscene)
NOTE: Running setscene task 1347 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_packagedata_setscene)
NOTE: recipe lzo-2.06-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1348 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_package_setscene)
NOTE: recipe openssl-0.9.8x-r15.0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.6-r5: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.0-r1: task do_package_setscene: Succeeded
NOTE: recipe db-5.3.21-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.10-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 1349 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_package_setscene)
NOTE: Running setscene task 1350 of 1401 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_package_setscene)
NOTE: recipe libtasn1-2.14-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe db-5.3.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.6-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1351 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_package_setscene)
NOTE: Running setscene task 1352 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_package_setscene)
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_package_setscene: Started
NOTE: Running setscene task 1353 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_package_setscene)
NOTE: recipe gdbm-1.10-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1354 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_package_setscene)
NOTE: recipe libcheck-0.9.9-r1: task do_package_setscene: Started
NOTE: recipe util-linux-2.22.2-r0: task do_package_setscene: Started
NOTE: recipe dbus-glib-0.100-r2: task do_package_setscene: Started
NOTE: recipe openssl-0.9.8x-r15.0: task do_package_setscene: Started
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1355 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_package_setscene)
NOTE: recipe libcheck-0.9.9-r1: task do_package_setscene: Succeeded
NOTE: recipe bzip2-1.0.6-r5: task do_package_setscene: Started
NOTE: recipe gdbm-1.10-r3: task do_package_setscene: Started
NOTE: Running setscene task 1356 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_package_setscene)
NOTE: recipe db-5.3.21-r0: task do_package_setscene: Started
NOTE: recipe dbus-glib-0.100-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1357 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_packagedata_setscene)
NOTE: recipe lzo-2.06-r1: task do_package_setscene: Started
NOTE: recipe libtasn1-2.14-r1: task do_package_setscene: Started
NOTE: recipe bzip2-1.0.6-r5: task do_package_setscene: Succeeded
NOTE: Running setscene task 1358 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_packagedata_setscene)
NOTE: recipe gdbm-1.10-r3: task do_package_setscene: Succeeded
NOTE: recipe dbus-1.6.8-r5.0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1359 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_package_write_ipk_setscene)
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.06-r1: task do_package_setscene: Succeeded
NOTE: recipe libtasn1-2.14-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1360 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_package_write_ipk_setscene)
NOTE: recipe libusb1-1.0.9-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1361 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_package_write_ipk_setscene)
NOTE: recipe libsndfile1-1.0.25-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libgpg-error-1.10-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe libusb1-1.0.9-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1362 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1363 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_package_setscene)
NOTE: recipe dbus-1.6.8-r5.0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1364 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_package_setscene)
NOTE: recipe libusb1-1.0.9-r1: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.10-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.25-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1365 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_packagedata_setscene)
NOTE: Running setscene task 1366 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_packagedata_setscene)
NOTE: recipe libusb1-1.0.9-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.25-r1: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_package_setscene: Started
NOTE: recipe dbus-1.6.8-r5.0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.10-r2: task do_packagedata_setscene: Started
NOTE: Running setscene task 1367 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_package_setscene)
NOTE: recipe libusb1-1.0.9-r1: task do_package_setscene: Started
NOTE: recipe util-linux-2.22.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.25-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.10-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1368 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_package_setscene)
NOTE: Running setscene task 1369 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_package_setscene)
NOTE: recipe libsndfile1-1.0.25-r1: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.10-r2: task do_package_setscene: Started
NOTE: recipe libusb1-1.0.9-r1: task do_package_setscene: Succeeded
NOTE: recipe libgpg-error-1.10-r2: task do_package_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.25-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1370 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_packagedata_setscene)
NOTE: Running setscene task 1371 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_packagedata_setscene)
NOTE: recipe sqlite3-3.7.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.0.25-r3: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.6.8-r5.0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1372 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_packagedata_setscene)
NOTE: Running setscene task 1373 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_packagedata_setscene)
NOTE: Running setscene task 1374 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_packagedata_setscene)
NOTE: recipe sqlite3-3.7.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1375 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_package_setscene)
NOTE: recipe base-passwd-3.5.26-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.1.4.3-r13: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.0.25-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1376 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_package_setscene)
NOTE: recipe sqlite3-3.7.15.2-r0: task do_package_setscene: Started
NOTE: recipe openssl-0.9.8x-r15.0: task do_package_setscene: Succeeded
NOTE: recipe base-passwd-3.5.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1377 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_package_setscene)
NOTE: Running setscene task 1378 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_package_setscene)
NOTE: recipe shadow-4.1.4.3-r13: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1379 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_package_setscene)
NOTE: recipe alsa-lib-1.0.25-r3: task do_package_setscene: Started
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_package_setscene: Started
NOTE: recipe base-passwd-3.5.26-r0: task do_package_setscene: Started
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_package_setscene: Succeeded
NOTE: recipe shadow-4.1.4.3-r13: task do_package_setscene: Started
NOTE: recipe base-passwd-3.5.26-r0: task do_package_setscene: Succeeded
NOTE: recipe sqlite3-3.7.15.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1380 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_packagedata_setscene)
NOTE: recipe readline-6.2-r4: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.0.25-r3: task do_package_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1381 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_packagedata_setscene)
NOTE: Running setscene task 1382 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_packagedata_setscene)
NOTE: recipe readline-6.2-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.0.11-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1383 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_package_setscene)
NOTE: recipe zlib-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.0.11-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1384 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_package_setscene)
NOTE: Running setscene task 1385 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_package_setscene)
NOTE: recipe readline-6.2-r4: task do_package_setscene: Started
NOTE: recipe zlib-1.2.7-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.1.4.3-r13: task do_package_setscene: Succeeded
NOTE: Running setscene task 1386 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_packagedata_setscene)
NOTE: recipe libffi-3.0.11-r1: task do_package_setscene: Started
NOTE: recipe readline-6.2-r4: task do_package_setscene: Succeeded
NOTE: recipe gettext-0.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.7-r0: task do_package_setscene: Succeeded
NOTE: recipe libffi-3.0.11-r1: task do_package_setscene: Succeeded
NOTE: recipe gettext-0.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1387 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_package_setscene)
NOTE: recipe gettext-0.18.2-r0: task do_package_setscene: Started
NOTE: recipe gettext-0.18.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1388 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_packagedata_setscene)
NOTE: Running setscene task 1389 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_packagedata_setscene)
NOTE: recipe db-5.3.21-r0: task do_package_setscene: Succeeded
NOTE: recipe ncurses-5.9-r13.1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-5.9-r13.1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1390 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_package_setscene)
NOTE: recipe expat-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1391 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_package_setscene)
NOTE: recipe ncurses-5.9-r13.1: task do_package_setscene: Started
NOTE: recipe expat-2.1.0-r0: task do_package_setscene: Started
NOTE: recipe expat-2.1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe ncurses-5.9-r13.1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1392 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_packagedata_setscene)
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_packagedata_setscene: Started
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1393 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_package_setscene)
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_package_setscene: Started
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1394 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_packagedata_setscene)
NOTE: Running setscene task 1395 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-4.7.2-r17: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1396 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_package_setscene)
NOTE: recipe gcc-runtime-4.7.2-r17: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1397 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_package_setscene)
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_package_setscene: Succeeded
NOTE: recipe gcc-runtime-4.7.2-r17: task do_package_setscene: Started
NOTE: recipe gcc-runtime-4.7.2-r17: task do_package_setscene: Succeeded
NOTE: Running setscene task 1398 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_packagedata_setscene)
NOTE: recipe libgcc-4.7.2-r17: task do_packagedata_setscene: Started
NOTE: recipe libgcc-4.7.2-r17: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1399 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_package_setscene)
NOTE: recipe libgcc-4.7.2-r17: task do_package_setscene: Started
NOTE: recipe libgcc-4.7.2-r17: task do_package_setscene: Succeeded
NOTE: Running setscene task 1400 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_packagedata_setscene)
NOTE: recipe eglibc-2.17-r3: task do_packagedata_setscene: Started
NOTE: recipe eglibc-2.17-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1401 of 1401 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_package_setscene)
NOTE: recipe eglibc-2.17-r3: task do_package_setscene: Started
NOTE: recipe eglibc-2.17-r3: task do_package_setscene: Succeeded
NOTE: Executing RunQueue Tasks
NOTE: Running noexec task 367 of 3939 (ID: 1227, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_4.7.bb, do_package_write)
NOTE: Running noexec task 369 of 3939 (ID: 1230, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_4.7.bb, do_build)
NOTE: Running task 370 of 3939 (ID: 1231, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_4.7.bb, do_rm_work)
NOTE: Running noexec task 658 of 3939 (ID: 1213, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_package_write)
NOTE: Running noexec task 660 of 3939 (ID: 1216, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_build)
NOTE: Running task 661 of 3939 (ID: 1217, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_rm_work)
NOTE: Running noexec task 1073 of 3939 (ID: 40, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_package_write)
NOTE: Running noexec task 1075 of 3939 (ID: 2474, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_package_write)
NOTE: Running noexec task 1077 of 3939 (ID: 1241, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_package_write)
NOTE: Running noexec task 1079 of 3939 (ID: 54, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_package_write)
NOTE: Running noexec task 1081 of 3939 (ID: 1829, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_package_write)
NOTE: Running noexec task 1083 of 3939 (ID: 1815, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_package_write)
NOTE: Running noexec task 1085 of 3939 (ID: 1955, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_package_write)
NOTE: Running noexec task 1087 of 3939 (ID: 1927, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_package_write)
NOTE: Running noexec task 1089 of 3939 (ID: 3301, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_package_write)
NOTE: Running noexec task 1091 of 3939 (ID: 2179, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_package_write)
NOTE: Running noexec task 1093 of 3939 (ID: 1885, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_package_write)
NOTE: Running noexec task 1095 of 3939 (ID: 1577, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_package_write)
NOTE: Running noexec task 1097 of 3939 (ID: 2011, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_package_write)
NOTE: Running noexec task 1099 of 3939 (ID: 3273, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_package_write)
NOTE: Running noexec task 1106 of 3939 (ID: 43, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_build)
NOTE: Running task 1107 of 3939 (ID: 44, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_rm_work)
NOTE: Running noexec task 1108 of 3939 (ID: 2477, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_build)
NOTE: Running task 1109 of 3939 (ID: 2478, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_rm_work)
NOTE: Running noexec task 1110 of 3939 (ID: 1244, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_build)
NOTE: Running task 1111 of 3939 (ID: 1245, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_rm_work)
NOTE: Running noexec task 1112 of 3939 (ID: 1832, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_build)
NOTE: Running task 1113 of 3939 (ID: 1833, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_rm_work)
NOTE: Running noexec task 1114 of 3939 (ID: 1958, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_build)
NOTE: Running task 1115 of 3939 (ID: 1959, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_rm_work)
NOTE: Running noexec task 1116 of 3939 (ID: 3304, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_build)
NOTE: Running task 1117 of 3939 (ID: 3305, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_rm_work)
NOTE: recipe gcc-cross-4.7.2-r17: task do_rm_work: Started
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_rm_work: Started
NOTE: recipe eglibc-2.17-r3: task do_rm_work: Started
NOTE: recipe zlib-1.2.7-r0: task do_rm_work: Started
NOTE: recipe libgcc-4.7.2-r17: task do_rm_work: Started
NOTE: recipe expat-2.1.0-r0: task do_rm_work: Started
NOTE: recipe libffi-3.0.11-r1: task do_rm_work: Started
NOTE: recipe gcc-cross-4.7.2-r17: task do_rm_work: Succeeded
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_rm_work: Succeeded
NOTE: recipe gcc-runtime-4.7.2-r17: task do_rm_work: Started
NOTE: recipe eglibc-2.17-r3: task do_rm_work: Succeeded
NOTE: recipe libgcc-4.7.2-r17: task do_rm_work: Succeeded
NOTE: recipe gcc-runtime-4.7.2-r17: task do_rm_work: Succeeded
NOTE: recipe expat-2.1.0-r0: task do_rm_work: Succeeded
NOTE: recipe zlib-1.2.7-r0: task do_rm_work: Succeeded
NOTE: recipe libffi-3.0.11-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 1118 of 3939 (ID: 2182, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_build)
NOTE: Running task 1119 of 3939 (ID: 2183, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_rm_work)
NOTE: Running noexec task 1120 of 3939 (ID: 1580, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_build)
NOTE: Running task 1121 of 3939 (ID: 1581, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_rm_work)
NOTE: Running noexec task 1135 of 3939 (ID: 1549, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_package_write)
NOTE: Running noexec task 1137 of 3939 (ID: 1552, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_build)
NOTE: Running task 1138 of 3939 (ID: 1553, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_rm_work)
NOTE: Running noexec task 1149 of 3939 (ID: 1409, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_package_write)
NOTE: Running noexec task 1151 of 3939 (ID: 1412, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_build)
NOTE: Running task 1152 of 3939 (ID: 1413, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_rm_work)
NOTE: Running noexec task 1163 of 3939 (ID: 2123, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_package_write)
NOTE: Running noexec task 1175 of 3939 (ID: 2109, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_package_write)
NOTE: Running noexec task 1177 of 3939 (ID: 2112, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_build)
NOTE: Running task 1178 of 3939 (ID: 2113, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_rm_work)
NOTE: Running noexec task 1189 of 3939 (ID: 2095, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_package_write)
NOTE: Running noexec task 1202 of 3939 (ID: 505, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_package_write)
NOTE: Running noexec task 1214 of 3939 (ID: 1773, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_package_write)
NOTE: Running noexec task 1216 of 3939 (ID: 1776, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_build)
NOTE: Running task 1217 of 3939 (ID: 1777, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_rm_work)
NOTE: Running noexec task 1228 of 3939 (ID: 1843, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_package_write)
NOTE: Running noexec task 1240 of 3939 (ID: 861, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_package_write)
NOTE: Running noexec task 1266 of 3939 (ID: 1423, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_package_write)
NOTE: Running noexec task 1278 of 3939 (ID: 3877, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_package_write)
NOTE: Running noexec task 1290 of 3939 (ID: 1507, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_package_write)
NOTE: Running noexec task 1292 of 3939 (ID: 1510, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_build)
NOTE: Running task 1293 of 3939 (ID: 1511, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_rm_work)
NOTE: recipe libogg-1.3.0-r1: task do_rm_work: Started
NOTE: Running noexec task 1304 of 3939 (ID: 1451, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_package_write)
NOTE: Running noexec task 1306 of 3939 (ID: 1454, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_build)
NOTE: Running task 1307 of 3939 (ID: 1455, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_rm_work)
NOTE: recipe libxml2-2.9.0-r1.1: task do_rm_work: Started
NOTE: recipe openssl-0.9.8x-r15.0: task do_rm_work: Started
NOTE: recipe base-passwd-3.5.26-r0: task do_rm_work: Started
NOTE: recipe db-5.3.21-r0: task do_rm_work: Started
NOTE: recipe libogg-1.3.0-r1: task do_rm_work: Succeeded
NOTE: recipe libxml2-2.9.0-r1.1: task do_rm_work: Succeeded
NOTE: recipe freetype-2.4.11-r0: task do_rm_work: Started
NOTE: recipe libpng-1.5.13-r2: task do_rm_work: Started
NOTE: recipe freetype-2.4.11-r0: task do_rm_work: Succeeded
NOTE: recipe base-passwd-3.5.26-r0: task do_rm_work: Succeeded
NOTE: recipe openssl-0.9.8x-r15.0: task do_rm_work: Succeeded
NOTE: Running noexec task 1318 of 3939 (ID: 819, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_package_write)
NOTE: Running noexec task 1320 of 3939 (ID: 822, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_build)
NOTE: Running task 1321 of 3939 (ID: 823, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_rm_work)
NOTE: recipe jpeg-8d-r1: task do_rm_work: Started
NOTE: Running noexec task 1332 of 3939 (ID: 3597, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_package_write)
NOTE: Running noexec task 1344 of 3939 (ID: 2221, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_package_write)
NOTE: Running noexec task 1346 of 3939 (ID: 2224, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_build)
NOTE: Running task 1347 of 3939 (ID: 2225, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_rm_work)
NOTE: Running noexec task 1358 of 3939 (ID: 2193, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_package_write)
NOTE: Running noexec task 1360 of 3939 (ID: 2196, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_build)
NOTE: Running task 1361 of 3939 (ID: 2197, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_rm_work)
NOTE: recipe db-5.3.21-r0: task do_rm_work: Succeeded
NOTE: recipe libpng-1.5.13-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 1382 of 3939 (ID: 1801, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_package_write)
NOTE: Running noexec task 1384 of 3939 (ID: 1804, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_build)
NOTE: Running task 1385 of 3939 (ID: 1805, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_rm_work)
NOTE: Running noexec task 1428 of 3939 (ID: 2249, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_package_write)
NOTE: Running noexec task 1430 of 3939 (ID: 2252, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_build)
NOTE: Running task 1431 of 3939 (ID: 2253, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_rm_work)
NOTE: Running noexec task 1442 of 3939 (ID: 2235, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_package_write)
NOTE: Running noexec task 1444 of 3939 (ID: 2238, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_build)
NOTE: Running task 1445 of 3939 (ID: 2239, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_rm_work)
NOTE: recipe jpeg-8d-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 1456 of 3939 (ID: 2207, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_package_write)
NOTE: Running noexec task 1458 of 3939 (ID: 2210, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_build)
NOTE: Running task 1459 of 3939 (ID: 2211, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_rm_work)
NOTE: Running noexec task 1470 of 3939 (ID: 2165, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_package_write)
NOTE: Running noexec task 1482 of 3939 (ID: 3807, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_package_write)
NOTE: Running noexec task 1484 of 3939 (ID: 3810, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_build)
NOTE: Running task 1485 of 3939 (ID: 3811, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_rm_work)
NOTE: recipe alsa-lib-1.0.25-r3: task do_rm_work: Started
NOTE: recipe tremor-20120314-r1: task do_rm_work: Started
NOTE: recipe alsa-lib-1.0.25-r3: task do_rm_work: Succeeded
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_rm_work: Started
NOTE: recipe libvorbis-1.3.3-r1: task do_rm_work: Started
NOTE: recipe orc-0.4.16-r0.0: task do_rm_work: Started
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_rm_work: Started
NOTE: Running noexec task 1496 of 3939 (ID: 2291, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_package_write)
NOTE: Running noexec task 1498 of 3939 (ID: 2294, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_build)
NOTE: Running task 1499 of 3939 (ID: 2295, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_rm_work)
NOTE: recipe libtheora-1.1.1-r1: task do_rm_work: Started
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_rm_work: Succeeded
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_rm_work: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_rm_work: Succeeded
NOTE: recipe tremor-20120314-r1: task do_rm_work: Succeeded
NOTE: recipe libvorbis-1.3.3-r1: task do_rm_work: Succeeded
NOTE: recipe lzo-2.06-r1: task do_rm_work: Started
NOTE: recipe orc-0.4.16-r0.0: task do_rm_work: Succeeded
NOTE: Running noexec task 1510 of 3939 (ID: 3821, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_package_write)
NOTE: Running noexec task 1512 of 3939 (ID: 3824, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_build)
NOTE: Running task 1513 of 3939 (ID: 3825, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_rm_work)
NOTE: Running noexec task 1538 of 3939 (ID: 3259, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_package_write)
NOTE: Running noexec task 1540 of 3939 (ID: 3262, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_build)
NOTE: Running task 1541 of 3939 (ID: 3263, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_rm_work)
NOTE: Running noexec task 1566 of 3939 (ID: 973, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_package_write)
NOTE: Running noexec task 1592 of 3939 (ID: 3765, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_package_write)
NOTE: Running noexec task 1642 of 3939 (ID: 3371, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_package_write)
NOTE: Running task 1644 of 3939 (ID: 190, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_fetch)
NOTE: recipe libid3tag-0.15.1b-r7: task do_rm_work: Started
NOTE: recipe lzo-2.06-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 1655 of 3939 (ID: 2151, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_package_write)
NOTE: Running noexec task 1657 of 3939 (ID: 2154, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_build)
NOTE: Running task 1658 of 3939 (ID: 2155, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_rm_work)
NOTE: recipe libid3tag-0.15.1b-r7: task do_rm_work: Succeeded
NOTE: Running noexec task 1669 of 3939 (ID: 3189, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_package_write)
NOTE: Running noexec task 1671 of 3939 (ID: 3192, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_build)
NOTE: Running task 1672 of 3939 (ID: 3193, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_rm_work)
NOTE: Running noexec task 1683 of 3939 (ID: 3175, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_package_write)
NOTE: Running noexec task 1695 of 3939 (ID: 1493, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_package_write)
NOTE: Running noexec task 1697 of 3939 (ID: 1496, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_build)
NOTE: Running task 1698 of 3939 (ID: 1497, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_rm_work)
NOTE: Running noexec task 1737 of 3939 (ID: 252, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_package_write)
NOTE: Running noexec task 1740 of 3939 (ID: 255, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_build)
NOTE: Running task 1741 of 3939 (ID: 256, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_rm_work)
NOTE: recipe libtasn1-2.14-r1: task do_rm_work: Started
NOTE: Running noexec task 1742 of 3939 (ID: 57, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_build)
NOTE: Running task 1743 of 3939 (ID: 58, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_rm_work)
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_rm_work: Started
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_rm_work: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_fetch: Started
NOTE: recipe libtasn1-2.14-r1: task do_rm_work: Succeeded
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_rm_work: Started
NOTE: recipe libmad-0.15.1b-r1: task do_rm_work: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_fetch: Succeeded
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_rm_work: Succeeded
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_rm_work: Succeeded
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_rm_work: Succeeded
NOTE: recipe libmad-0.15.1b-r1: task do_rm_work: Succeeded
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_rm_work: Started
NOTE: Running noexec task 1744 of 3939 (ID: 1818, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_build)
NOTE: Running task 1745 of 3939 (ID: 1819, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_rm_work)
NOTE: Running noexec task 1746 of 3939 (ID: 1930, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_build)
NOTE: Running task 1747 of 3939 (ID: 1931, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_rm_work)
NOTE: recipe ncurses-5.9-r13.1: task do_rm_work: Started
NOTE: Running noexec task 1748 of 3939 (ID: 1888, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_build)
NOTE: Running task 1749 of 3939 (ID: 1889, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_rm_work)
NOTE: Running noexec task 1750 of 3939 (ID: 2014, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_build)
NOTE: Running task 1751 of 3939 (ID: 2015, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_rm_work)
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_rm_work: Succeeded
NOTE: Running noexec task 1752 of 3939 (ID: 3276, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_build)
NOTE: Running task 1753 of 3939 (ID: 3277, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_rm_work)
NOTE: Running noexec task 1754 of 3939 (ID: 2126, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_build)
NOTE: Running task 1755 of 3939 (ID: 2127, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_rm_work)
NOTE: Running noexec task 1756 of 3939 (ID: 2098, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_build)
NOTE: Running task 1757 of 3939 (ID: 2099, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_rm_work)
NOTE: recipe attr-2.4.46-r4: task do_rm_work: Started
NOTE: recipe gettext-0.18.2-r0: task do_rm_work: Started
NOTE: recipe ncurses-5.9-r13.1: task do_rm_work: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_rm_work: Succeeded
NOTE: recipe readline-6.2-r4: task do_rm_work: Started
NOTE: Running noexec task 1758 of 3939 (ID: 508, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_build)
NOTE: Running task 1759 of 3939 (ID: 509, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_rm_work)
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_rm_work: Started
NOTE: recipe sqlite3-3.7.15.2-r0: task do_rm_work: Started
NOTE: recipe gdbm-1.10-r3: task do_rm_work: Started
NOTE: Running noexec task 1760 of 3939 (ID: 1846, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_build)
NOTE: Running task 1761 of 3939 (ID: 1847, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_rm_work)
NOTE: recipe bzip2-1.0.6-r5: task do_rm_work: Started
NOTE: recipe gettext-0.18.2-r0: task do_rm_work: Succeeded
NOTE: recipe gdbm-1.10-r3: task do_rm_work: Succeeded
NOTE: recipe readline-6.2-r4: task do_rm_work: Succeeded
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_rm_work: Succeeded
NOTE: recipe sqlite3-3.7.15.2-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 1762 of 3939 (ID: 864, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_build)
NOTE: Running task 1763 of 3939 (ID: 865, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_rm_work)
NOTE: Running noexec task 1764 of 3939 (ID: 1426, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_build)
NOTE: Running task 1765 of 3939 (ID: 1427, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_rm_work)
NOTE: Running noexec task 1766 of 3939 (ID: 3880, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_build)
NOTE: Running task 1767 of 3939 (ID: 3881, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_rm_work)
NOTE: recipe bzip2-1.0.6-r5: task do_rm_work: Succeeded
NOTE: Running noexec task 1768 of 3939 (ID: 3600, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_build)
NOTE: Running task 1769 of 3939 (ID: 3601, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_rm_work)
NOTE: Running noexec task 1770 of 3939 (ID: 2168, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_build)
NOTE: Running task 1771 of 3939 (ID: 2169, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_rm_work)
NOTE: recipe util-linux-2.22.2-r0: task do_rm_work: Started
NOTE: recipe libcap-2.22-r5: task do_rm_work: Started
NOTE: Running noexec task 1772 of 3939 (ID: 976, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_build)
NOTE: Running task 1773 of 3939 (ID: 977, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_rm_work)
NOTE: recipe gstreamer-0.10.36-r4: task do_rm_work: Started
NOTE: recipe liboil-0.3.17-r5: task do_rm_work: Started
NOTE: recipe util-linux-2.22.2-r0: task do_rm_work: Succeeded
NOTE: recipe libcap-2.22-r5: task do_rm_work: Succeeded
NOTE: recipe libgpg-error-1.10-r2: task do_rm_work: Started
NOTE: recipe gstreamer-0.10.36-r4: task do_rm_work: Succeeded
NOTE: recipe liboil-0.3.17-r5: task do_rm_work: Succeeded
NOTE: Running noexec task 1774 of 3939 (ID: 3768, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_build)
NOTE: Running task 1775 of 3939 (ID: 3769, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_rm_work)
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_rm_work: Started
NOTE: Running noexec task 1776 of 3939 (ID: 3374, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_build)
NOTE: Running task 1777 of 3939 (ID: 3375, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_rm_work)
NOTE: recipe python-2.7.3-r5.2: task do_rm_work: Started
NOTE: Running task 1778 of 3939 (ID: 186, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_unpack)
NOTE: Running noexec task 1779 of 3939 (ID: 3178, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_build)
NOTE: Running task 1780 of 3939 (ID: 3179, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_rm_work)
NOTE: recipe libgcrypt-1.5.0-r2: task do_rm_work: Started
NOTE: recipe libgpg-error-1.10-r2: task do_rm_work: Succeeded
NOTE: recipe python-2.7.3-r5.2: task do_rm_work: Succeeded
NOTE: recipe libgcrypt-1.5.0-r2: task do_rm_work: Succeeded
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_rm_work: Succeeded
NOTE: recipe gnutls-2.12.21-r8.4: task do_rm_work: Started
NOTE: Running noexec task 1795 of 3939 (ID: 917, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_package_write)
NOTE: Running noexec task 1797 of 3939 (ID: 920, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_build)
NOTE: Running task 1798 of 3939 (ID: 921, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_rm_work)
NOTE: Running noexec task 1809 of 3939 (ID: 833, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_package_write)
NOTE: Running noexec task 1811 of 3939 (ID: 836, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_build)
NOTE: Running task 1812 of 3939 (ID: 837, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_rm_work)
NOTE: Running noexec task 1829 of 3939 (ID: 3386, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_package_write)
NOTE: Running noexec task 1832 of 3939 (ID: 3389, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_build)
NOTE: Running task 1833 of 3939 (ID: 3390, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_rm_work)
NOTE: recipe xz-5.1.2alpha-r0: task do_rm_work: Started
NOTE: recipe gnutls-2.12.21-r8.4: task do_rm_work: Succeeded
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_unpack: Started
NOTE: Running noexec task 1847 of 3939 (ID: 3793, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_package_write)
NOTE: Running noexec task 1849 of 3939 (ID: 3796, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_build)
NOTE: Running task 1850 of 3939 (ID: 3797, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_rm_work)
NOTE: Running noexec task 1861 of 3939 (ID: 1633, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_package_write)
NOTE: Running noexec task 1863 of 3939 (ID: 1636, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_build)
NOTE: Running task 1864 of 3939 (ID: 1637, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_rm_work)
NOTE: recipe tiff-4.0.3-r0: task do_rm_work: Started
NOTE: recipe xz-5.1.2alpha-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 1889 of 3939 (ID: 1605, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_package_write)
NOTE: Running noexec task 1891 of 3939 (ID: 1608, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_build)
NOTE: Running task 1892 of 3939 (ID: 1609, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_rm_work)
NOTE: recipe util-macros-1_1.17-r0: task do_rm_work: Started
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_rm_work: Started
NOTE: recipe ethtool-3.7-r0: task do_rm_work: Started
NOTE: recipe tiff-4.0.3-r0: task do_rm_work: Succeeded
NOTE: recipe libproxy-0.4.7-r5: task do_rm_work: Started
NOTE: recipe util-macros-1_1.17-r0: task do_rm_work: Succeeded
NOTE: recipe ethtool-3.7-r0: task do_rm_work: Succeeded
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_rm_work: Started
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_rm_work: Succeeded
NOTE: recipe libproxy-0.4.7-r5: task do_rm_work: Succeeded
NOTE: recipe python-wifi-0.5.0-r1: task do_rm_work: Started
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_rm_work: Succeeded
NOTE: recipe python-wifi-0.5.0-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 1903 of 3939 (ID: 1591, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_package_write)
NOTE: Running noexec task 1905 of 3939 (ID: 1594, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_build)
NOTE: Running task 1906 of 3939 (ID: 1595, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_rm_work)
NOTE: Running noexec task 1917 of 3939 (ID: 1563, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_package_write)
NOTE: Running noexec task 1919 of 3939 (ID: 1566, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_build)
NOTE: Running task 1920 of 3939 (ID: 1567, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_rm_work)
NOTE: Running noexec task 1931 of 3939 (ID: 1535, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_package_write)
NOTE: Running noexec task 1933 of 3939 (ID: 1538, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_build)
NOTE: Running task 1934 of 3939 (ID: 1539, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_rm_work)
NOTE: Running noexec task 1945 of 3939 (ID: 1521, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_package_write)
NOTE: Running noexec task 1947 of 3939 (ID: 1524, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_build)
NOTE: Running task 1948 of 3939 (ID: 1525, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_rm_work)
NOTE: Running noexec task 1959 of 3939 (ID: 1479, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_package_write)
NOTE: Running noexec task 1961 of 3939 (ID: 1482, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_build)
NOTE: Running task 1962 of 3939 (ID: 1483, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_rm_work)
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_unpack: Succeeded
NOTE: Running noexec task 1973 of 3939 (ID: 1465, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_package_write)
NOTE: Running noexec task 1975 of 3939 (ID: 1468, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_build)
NOTE: Running task 1976 of 3939 (ID: 1469, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_rm_work)
NOTE: Running task 1977 of 3939 (ID: 187, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_patch)
NOTE: Running task 1978 of 3939 (ID: 191, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_openpli_branding)
NOTE: recipe python-imaging-1.1.7-r4: task do_rm_work: Started
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_rm_work: Started
NOTE: recipe libungif-4.1.3-r3: task do_rm_work: Started
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_rm_work: Started
NOTE: recipe fribidi-0.19.2-r1: task do_rm_work: Started
NOTE: recipe libdvbsi++-0.3.6-r1: task do_rm_work: Started
NOTE: recipe python-imaging-1.1.7-r4: task do_rm_work: Succeeded
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_rm_work: Succeeded
NOTE: recipe libungif-4.1.3-r3: task do_rm_work: Succeeded
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_rm_work: Succeeded
NOTE: recipe fribidi-0.19.2-r1: task do_rm_work: Succeeded
NOTE: recipe libdvbsi++-0.3.6-r1: task do_rm_work: Succeeded
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_patch: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_patch: Succeeded
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_openpli_branding: Started
NOTE: Running noexec task 1989 of 3939 (ID: 1437, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_package_write)
NOTE: Running noexec task 1991 of 3939 (ID: 1440, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_build)
NOTE: Running task 1992 of 3939 (ID: 1441, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_rm_work)
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_openpli_branding: Succeeded
NOTE: Running noexec task 2017 of 3939 (ID: 3849, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_package_write)
NOTE: Running noexec task 2019 of 3939 (ID: 3852, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_build)
NOTE: Running task 2020 of 3939 (ID: 3853, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_rm_work)
NOTE: Running noexec task 2031 of 3939 (ID: 3400, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_package_write)
NOTE: Running noexec task 2043 of 3939 (ID: 3357, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_package_write)
NOTE: Running noexec task 2045 of 3939 (ID: 3360, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_build)
NOTE: Running task 2046 of 3939 (ID: 3361, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_rm_work)
NOTE: Running noexec task 2057 of 3939 (ID: 3343, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_package_write)
NOTE: Running noexec task 2059 of 3939 (ID: 3346, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_build)
NOTE: Running task 2060 of 3939 (ID: 3347, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_rm_work)
NOTE: Running noexec task 2071 of 3939 (ID: 2305, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_package_write)
NOTE: Running noexec task 2073 of 3939 (ID: 2308, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_build)
NOTE: Running task 2074 of 3939 (ID: 2309, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_rm_work)
NOTE: Running noexec task 2085 of 3939 (ID: 350, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_package_write)
NOTE: Running noexec task 2087 of 3939 (ID: 353, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_build)
NOTE: Running task 2088 of 3939 (ID: 354, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_rm_work)
NOTE: Running task 2089 of 3939 (ID: 195, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_populate_lic)
NOTE: Running task 2090 of 3939 (ID: 192, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_configure)
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_rm_work: Started
NOTE: recipe libusb1-1.0.9-r1: task do_rm_work: Started
NOTE: recipe pixman-1_0.28.2-r1: task do_rm_work: Started
NOTE: recipe fontconfig-2.10.2-r1: task do_rm_work: Started
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_rm_work: Succeeded
NOTE: recipe libusb1-1.0.9-r1: task do_rm_work: Succeeded
NOTE: recipe flac-1.2.1-r4: task do_rm_work: Started
NOTE: recipe e2fsprogs-1.42.6-r0: task do_rm_work: Started
NOTE: Running noexec task 2100 of 3939 (ID: 1871, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_package_write)
NOTE: Running noexec task 2117 of 3939 (ID: 2459, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_package_write)
NOTE: Running noexec task 2119 of 3939 (ID: 2462, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_build)
NOTE: Running task 2120 of 3939 (ID: 2463, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_rm_work)
NOTE: recipe fontconfig-2.10.2-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2145 of 3939 (ID: 3498, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_package_write)
NOTE: Running noexec task 2147 of 3939 (ID: 3501, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_build)
NOTE: Running task 2148 of 3939 (ID: 3502, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_rm_work)
NOTE: recipe pixman-1_0.28.2-r1: task do_rm_work: Succeeded
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_configure: Started
NOTE: Running noexec task 2159 of 3939 (ID: 3863, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_package_write)
NOTE: Running noexec task 2161 of 3939 (ID: 3866, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_build)
NOTE: Running task 2162 of 3939 (ID: 3867, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_rm_work)
NOTE: recipe e2fsprogs-1.42.6-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 2173 of 3939 (ID: 1857, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_package_write)
NOTE: Running noexec task 2175 of 3939 (ID: 1860, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_build)
NOTE: Running task 2176 of 3939 (ID: 1861, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_rm_work)
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_populate_lic: Started
NOTE: recipe flac-1.2.1-r4: task do_rm_work: Succeeded
NOTE: Running noexec task 2187 of 3939 (ID: 2445, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_package_write)
NOTE: Running noexec task 2189 of 3939 (ID: 2448, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_build)
NOTE: Running task 2190 of 3939 (ID: 2449, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_rm_work)
NOTE: recipe libcdio-0.82-r0: task do_rm_work: Started
NOTE: Running noexec task 2201 of 3939 (ID: 2431, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_package_write)
NOTE: Running noexec task 2203 of 3939 (ID: 2434, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_build)
NOTE: Running task 2204 of 3939 (ID: 2435, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_rm_work)
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_rm_work: Started
NOTE: recipe libdaemon-0.14-r0: task do_rm_work: Started
NOTE: recipe libcdio-0.82-r0: task do_rm_work: Succeeded
NOTE: recipe opencore-amr-0.1.2-r0: task do_rm_work: Started
NOTE: recipe libsndfile1-1.0.25-r1: task do_rm_work: Started
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_rm_work: Succeeded
NOTE: recipe lame-3.99.5-r1: task do_rm_work: Started
NOTE: recipe libdaemon-0.14-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 2215 of 3939 (ID: 2417, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_package_write)
NOTE: Running noexec task 2217 of 3939 (ID: 2420, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_build)
NOTE: Running task 2218 of 3939 (ID: 2421, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_rm_work)
NOTE: recipe libsndfile1-1.0.25-r1: task do_rm_work: Succeeded
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_populate_lic: Succeeded
NOTE: recipe opencore-amr-0.1.2-r0: task do_rm_work: Succeeded
NOTE: recipe lame-3.99.5-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2229 of 3939 (ID: 2403, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_package_write)
NOTE: Running noexec task 2231 of 3939 (ID: 2406, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_build)
NOTE: Running task 2232 of 3939 (ID: 2407, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_rm_work)
NOTE: Running noexec task 2243 of 3939 (ID: 2389, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_package_write)
NOTE: Running noexec task 2245 of 3939 (ID: 2392, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_build)
NOTE: Running task 2246 of 3939 (ID: 2393, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_rm_work)
NOTE: Running noexec task 2257 of 3939 (ID: 2375, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_package_write)
NOTE: Running noexec task 2259 of 3939 (ID: 2378, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_build)
NOTE: Running task 2260 of 3939 (ID: 2379, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_rm_work)
NOTE: Running noexec task 2271 of 3939 (ID: 2361, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_package_write)
NOTE: Running noexec task 2273 of 3939 (ID: 2364, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_build)
NOTE: Running task 2274 of 3939 (ID: 2365, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_rm_work)
NOTE: recipe liba52-0.7.4-r4: task do_rm_work: Started
NOTE: Running noexec task 2309 of 3939 (ID: 2319, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_package_write)
NOTE: Running noexec task 2311 of 3939 (ID: 2322, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_build)
NOTE: Running task 2312 of 3939 (ID: 2323, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_rm_work)
NOTE: recipe liba52-0.7.4-r4: task do_rm_work: Succeeded
NOTE: Running noexec task 2323 of 3939 (ID: 2277, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_package_write)
NOTE: Running noexec task 2325 of 3939 (ID: 2280, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_build)
NOTE: Running task 2326 of 3939 (ID: 2281, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_rm_work)
NOTE: recipe mpeg2dec-0.4.1-r2: task do_rm_work: Started
NOTE: Running noexec task 2361 of 3939 (ID: 3512, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_package_write)
NOTE: Running noexec task 2386 of 3939 (ID: 1913, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_package_write)
NOTE: Running noexec task 2389 of 3939 (ID: 1916, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_build)
NOTE: Running task 2390 of 3939 (ID: 1917, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_rm_work)
NOTE: recipe libmms-0.6.2-r0: task do_rm_work: Started
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_rm_work: Started
NOTE: recipe curl-7.28.1-r3: task do_rm_work: Started
NOTE: recipe cairo-1.12.10-r0: task do_rm_work: Started
NOTE: recipe libmms-0.6.2-r0: task do_rm_work: Succeeded
NOTE: recipe speex-1.2rc1-r2: task do_rm_work: Started
NOTE: recipe shadow-4.1.4.3-r13: task do_rm_work: Started
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_rm_work: Succeeded
NOTE: recipe curl-7.28.1-r3: task do_rm_work: Succeeded
NOTE: recipe speex-1.2rc1-r2: task do_rm_work: Succeeded
NOTE: recipe cairo-1.12.10-r0: task do_rm_work: Succeeded
NOTE: recipe mpeg2dec-0.4.1-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 2391 of 3939 (ID: 1874, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_build)
NOTE: Running task 2392 of 3939 (ID: 1875, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_rm_work)
NOTE: Running noexec task 2393 of 3939 (ID: 3403, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_build)
NOTE: Running task 2394 of 3939 (ID: 3404, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_rm_work)
NOTE: Running noexec task 2395 of 3939 (ID: 3515, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_build)
NOTE: Running task 2396 of 3939 (ID: 3516, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_rm_work)
NOTE: recipe shadow-4.1.4.3-r13: task do_rm_work: Succeeded
NOTE: Running noexec task 2412 of 3939 (ID: 3569, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_package_write)
NOTE: Running noexec task 2414 of 3939 (ID: 3572, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_build)
NOTE: Running task 2415 of 3939 (ID: 3573, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_rm_work)
NOTE: Running noexec task 2426 of 3939 (ID: 3484, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_package_write)
NOTE: Running noexec task 2428 of 3939 (ID: 3487, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_build)
NOTE: Running task 2429 of 3939 (ID: 3488, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_rm_work)
NOTE: Running noexec task 2440 of 3939 (ID: 3470, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_package_write)
NOTE: Running noexec task 2442 of 3939 (ID: 3473, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_build)
NOTE: Running task 2443 of 3939 (ID: 3474, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_rm_work)
NOTE: Running noexec task 2454 of 3939 (ID: 3245, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_package_write)
NOTE: Running noexec task 2456 of 3939 (ID: 3248, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_build)
NOTE: Running task 2457 of 3939 (ID: 3249, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_rm_work)
NOTE: recipe dbus-1.6.8-r5.0: task do_rm_work: Started
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_rm_work: Started
NOTE: recipe dbus-glib-0.100-r2: task do_rm_work: Started
NOTE: recipe libdca-0.0.5-5-r1: task do_rm_work: Started
NOTE: recipe quota-4.01-r1: task do_rm_work: Started
NOTE: recipe libtirpc-0.2.2-r1: task do_rm_work: Started
NOTE: recipe dbus-1.6.8-r5.0: task do_rm_work: Succeeded
NOTE: recipe libdca-0.0.5-5-r1: task do_rm_work: Succeeded
NOTE: recipe faad2-2.7-r1: task do_rm_work: Started
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_rm_work: Succeeded
NOTE: recipe dbus-glib-0.100-r2: task do_rm_work: Succeeded
NOTE: recipe quota-4.01-r1: task do_rm_work: Succeeded
NOTE: recipe libtirpc-0.2.2-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2468 of 3939 (ID: 3231, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_package_write)
NOTE: Running noexec task 2470 of 3939 (ID: 3234, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_build)
NOTE: Running task 2471 of 3939 (ID: 3235, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_rm_work)
NOTE: Running noexec task 2482 of 3939 (ID: 1997, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_package_write)
NOTE: Running noexec task 2484 of 3939 (ID: 2000, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_build)
NOTE: Running task 2485 of 3939 (ID: 2001, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_rm_work)
NOTE: recipe faad2-2.7-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2496 of 3939 (ID: 1983, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_package_write)
NOTE: Running noexec task 2498 of 3939 (ID: 1986, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_build)
NOTE: Running task 2499 of 3939 (ID: 1987, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_rm_work)
NOTE: Running noexec task 2510 of 3939 (ID: 1969, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_package_write)
NOTE: Running noexec task 2512 of 3939 (ID: 1972, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_build)
NOTE: Running task 2513 of 3939 (ID: 1973, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_rm_work)
NOTE: Running noexec task 2524 of 3939 (ID: 3554, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_package_write)
NOTE: Running noexec task 2526 of 3939 (ID: 3557, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_build)
NOTE: Running task 2527 of 3939 (ID: 3558, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_rm_work)
NOTE: Running noexec task 2557 of 3939 (ID: 875, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_package_write)
NOTE: Running noexec task 2559 of 3939 (ID: 903, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_package_write)
NOTE: Running noexec task 2560 of 3939 (ID: 878, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_build)
NOTE: Running task 2561 of 3939 (ID: 879, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_rm_work)
NOTE: Running noexec task 2564 of 3939 (ID: 906, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_build)
NOTE: Running task 2565 of 3939 (ID: 907, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_rm_work)
NOTE: recipe libupnp-1.6.5-r1: task do_rm_work: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_rm_work: Started
NOTE: recipe libevent-2.0.21-r0: task do_rm_work: Started
NOTE: recipe libupnp-1.6.5-r1: task do_rm_work: Succeeded
NOTE: recipe libnfsidmap-0.25-r0: task do_rm_work: Started
NOTE: recipe libsamplerate0-0.1.8-r1: task do_rm_work: Started
NOTE: Running noexec task 2575 of 3939 (ID: 2333, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_package_write)
NOTE: Running noexec task 2577 of 3939 (ID: 2909, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_package_write)
NOTE: Running noexec task 2578 of 3939 (ID: 2336, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_build)
NOTE: Running task 2579 of 3939 (ID: 2337, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_rm_work)
NOTE: recipe tcp-wrappers-7.6-r10: task do_rm_work: Succeeded
NOTE: recipe libevent-2.0.21-r0: task do_rm_work: Succeeded
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_rm_work: Started
NOTE: recipe libnfsidmap-0.25-r0: task do_rm_work: Succeeded
NOTE: recipe libsamplerate0-0.1.8-r1: task do_rm_work: Succeeded
NOTE: recipe python-twisted-12.0.0-r2: task do_rm_work: Started
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_rm_work: Succeeded
NOTE: Running noexec task 2582 of 3939 (ID: 2912, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_build)
NOTE: Running task 2583 of 3939 (ID: 2913, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_rm_work)
NOTE: Running noexec task 2594 of 3939 (ID: 3583, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_package_write)
NOTE: Running noexec task 2596 of 3939 (ID: 3586, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_build)
NOTE: Running task 2597 of 3939 (ID: 3587, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_rm_work)
NOTE: recipe python-twisted-12.0.0-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 2608 of 3939 (ID: 3611, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_package_write)
NOTE: Running noexec task 2610 of 3939 (ID: 3614, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_build)
NOTE: Running task 2611 of 3939 (ID: 3615, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_rm_work)
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_rm_work: Started
NOTE: Running noexec task 2622 of 3939 (ID: 3540, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_package_write)
NOTE: Running noexec task 2624 of 3939 (ID: 3543, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_build)
NOTE: Running task 2625 of 3939 (ID: 3544, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_rm_work)
NOTE: Running noexec task 2635 of 3939 (ID: 1029, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_package_write)
NOTE: Running noexec task 2638 of 3939 (ID: 1032, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_build)
NOTE: Running task 2639 of 3939 (ID: 1033, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_rm_work)
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 2649 of 3939 (ID: 1015, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_package_write)
NOTE: Running noexec task 2652 of 3939 (ID: 1018, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_build)
NOTE: Running task 2653 of 3939 (ID: 1019, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_rm_work)
NOTE: Running noexec task 2663 of 3939 (ID: 1001, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_package_write)
NOTE: Running noexec task 2666 of 3939 (ID: 1004, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_build)
NOTE: Running task 2667 of 3939 (ID: 1005, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_rm_work)
NOTE: recipe glib-networking-2.28.7-r3: task do_rm_work: Started
NOTE: recipe fuse-2.9.2-r1: task do_rm_work: Started
NOTE: recipe mtd-utils-1.5.0-r5: task do_rm_work: Started
NOTE: recipe libnl-1_3.2.21-r0: task do_rm_work: Started
NOTE: recipe libdvdcss-1.2.10-r1: task do_rm_work: Started
NOTE: recipe fuse-2.9.2-r1: task do_rm_work: Succeeded
NOTE: recipe libdvdcss-1.2.10-r1: task do_rm_work: Succeeded
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_rm_work: Started
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_rm_work: Started
NOTE: recipe glib-networking-2.28.7-r3: task do_rm_work: Succeeded
NOTE: recipe mtd-utils-1.5.0-r5: task do_rm_work: Succeeded
NOTE: recipe libnl-1_3.2.21-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 2677 of 3939 (ID: 987, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_package_write)
NOTE: Running noexec task 2680 of 3939 (ID: 990, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_build)
NOTE: Running task 2681 of 3939 (ID: 991, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_rm_work)
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_rm_work: Succeeded
NOTE: Running noexec task 2705 of 3939 (ID: 945, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_package_write)
NOTE: Running noexec task 2708 of 3939 (ID: 948, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_build)
NOTE: Running task 2709 of 3939 (ID: 949, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_rm_work)
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_rm_work: Succeeded
NOTE: Running noexec task 2719 of 3939 (ID: 931, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_package_write)
NOTE: Running noexec task 2722 of 3939 (ID: 934, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_build)
NOTE: Running task 2723 of 3939 (ID: 935, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_rm_work)
NOTE: Running noexec task 2733 of 3939 (ID: 889, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_package_write)
NOTE: Running noexec task 2736 of 3939 (ID: 892, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_build)
NOTE: Running task 2737 of 3939 (ID: 893, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_rm_work)
NOTE: Running noexec task 2747 of 3939 (ID: 847, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_package_write)
NOTE: Running noexec task 2750 of 3939 (ID: 850, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_build)
NOTE: Running task 2751 of 3939 (ID: 851, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_rm_work)
NOTE: Running noexec task 2772 of 3939 (ID: 1675, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_package_write)
NOTE: Running noexec task 2774 of 3939 (ID: 1678, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_build)
NOTE: Running task 2775 of 3939 (ID: 1679, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_rm_work)
NOTE: Running noexec task 2786 of 3939 (ID: 1759, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_package_write)
NOTE: Running noexec task 2788 of 3939 (ID: 1762, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_build)
NOTE: Running task 2789 of 3939 (ID: 1763, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_rm_work)
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_rm_work: Started
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_rm_work: Started
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_rm_work: Started
NOTE: recipe python-utf8-hack-0.2-r0: task do_rm_work: Started
NOTE: recipe eglibc-locale-2.17-r0: task do_rm_work: Started
NOTE: recipe python-pyopenssl-0.13-r1: task do_rm_work: Started
NOTE: recipe dvdbackup-0.4.2-r2: task do_rm_work: Started
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_rm_work: Succeeded
NOTE: recipe python-pyopenssl-0.13-r1: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_rm_work: Succeeded
NOTE: recipe python-utf8-hack-0.2-r0: task do_rm_work: Succeeded
NOTE: recipe eglibc-locale-2.17-r0: task do_rm_work: Succeeded
NOTE: recipe dvdbackup-0.4.2-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 2800 of 3939 (ID: 1745, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_package_write)
NOTE: Running noexec task 2802 of 3939 (ID: 1748, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_build)
NOTE: Running task 2803 of 3939 (ID: 1749, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_rm_work)
NOTE: Running noexec task 2814 of 3939 (ID: 1731, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_package_write)
NOTE: Running noexec task 2816 of 3939 (ID: 1734, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_build)
NOTE: Running task 2817 of 3939 (ID: 1735, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_rm_work)
NOTE: Running noexec task 2828 of 3939 (ID: 1717, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_package_write)
NOTE: Running noexec task 2830 of 3939 (ID: 1720, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_build)
NOTE: Running task 2831 of 3939 (ID: 1721, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_rm_work)
NOTE: Running noexec task 2842 of 3939 (ID: 1703, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_package_write)
NOTE: Running noexec task 2844 of 3939 (ID: 1706, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_build)
NOTE: Running task 2845 of 3939 (ID: 1707, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_rm_work)
NOTE: Running noexec task 2856 of 3939 (ID: 1689, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_package_write)
NOTE: Running noexec task 2858 of 3939 (ID: 1692, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_build)
NOTE: Running task 2859 of 3939 (ID: 1693, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_rm_work)
NOTE: Running noexec task 2870 of 3939 (ID: 1661, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_package_write)
NOTE: Running noexec task 2872 of 3939 (ID: 1664, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_build)
NOTE: Running task 2873 of 3939 (ID: 1665, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_rm_work)
NOTE: Running noexec task 2907 of 3939 (ID: 2502, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_package_write)
NOTE: Running noexec task 2910 of 3939 (ID: 2505, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_build)
NOTE: Running task 2911 of 3939 (ID: 2506, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_rm_work)
NOTE: recipe libcddb-1.3.2-r1: task do_rm_work: Started
NOTE: recipe python-mutagen-1.18-r1: task do_rm_work: Started
NOTE: recipe python-daap-0.7.1-r3: task do_rm_work: Started
NOTE: recipe sysvinit-2.88dsf-r13: task do_rm_work: Started
NOTE: recipe libcddb-1.3.2-r1: task do_rm_work: Succeeded
NOTE: recipe python-mutagen-1.18-r1: task do_rm_work: Succeeded
NOTE: recipe python-gdata-2.0.14-r1: task do_rm_work: Started
NOTE: Running noexec task 2950 of 3939 (ID: 1941, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_package_write)
NOTE: Running noexec task 2952 of 3939 (ID: 1944, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_build)
NOTE: Running task 2953 of 3939 (ID: 1945, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_rm_work)
NOTE: recipe streamripper-1.64.6-r1: task do_rm_work: Started
NOTE: recipe ushare-1.1a-r1: task do_rm_work: Started
NOTE: Running noexec task 2963 of 3939 (ID: 3526, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_package_write)
NOTE: Running noexec task 2965 of 3939 (ID: 3709, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_package_write)
NOTE: Running noexec task 2966 of 3939 (ID: 3529, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_build)
NOTE: Running task 2967 of 3939 (ID: 3530, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_rm_work)
NOTE: recipe python-daap-0.7.1-r3: task do_rm_work: Succeeded
NOTE: recipe sysvinit-2.88dsf-r13: task do_rm_work: Succeeded
NOTE: recipe streamripper-1.64.6-r1: task do_rm_work: Succeeded
NOTE: recipe python-gdata-2.0.14-r1: task do_rm_work: Succeeded
NOTE: recipe ushare-1.1a-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2970 of 3939 (ID: 3712, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_build)
NOTE: Running task 2971 of 3939 (ID: 3713, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_rm_work)
NOTE: Running noexec task 2992 of 3939 (ID: 2726, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_package_write)
NOTE: Running noexec task 2995 of 3939 (ID: 2729, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_build)
NOTE: Running task 2996 of 3939 (ID: 2730, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_rm_work)
NOTE: recipe talloc-2.0.1-r2: task do_rm_work: Started
NOTE: Running noexec task 3006 of 3939 (ID: 392, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_package_write)
NOTE: Running noexec task 3008 of 3939 (ID: 2544, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_package_write)
NOTE: Running noexec task 3009 of 3939 (ID: 395, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_build)
NOTE: Running task 3010 of 3939 (ID: 396, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_rm_work)
NOTE: recipe libcheck-0.9.9-r1: task do_rm_work: Started
NOTE: Running noexec task 3013 of 3939 (ID: 2547, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_build)
NOTE: Running task 3014 of 3939 (ID: 2548, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_rm_work)
NOTE: Running noexec task 3024 of 3939 (ID: 3681, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_package_write)
NOTE: Running noexec task 3027 of 3939 (ID: 3684, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_build)
NOTE: Running task 3028 of 3939 (ID: 3685, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_rm_work)
NOTE: recipe talloc-2.0.1-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 3048 of 3939 (ID: 2670, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_package_write)
NOTE: Running noexec task 3050 of 3939 (ID: 2656, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_package_write)
NOTE: Running noexec task 3051 of 3939 (ID: 2673, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_build)
NOTE: Running task 3052 of 3939 (ID: 2674, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_rm_work)
NOTE: recipe libcheck-0.9.9-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 3055 of 3939 (ID: 2659, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_build)
NOTE: Running task 3056 of 3939 (ID: 2660, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_rm_work)
NOTE: recipe gawk-4.0.1-r1: task do_rm_work: Started
NOTE: recipe busybox-1.20.2-r32: task do_rm_work: Started
NOTE: recipe bash-4.2-r6: task do_rm_work: Started
NOTE: recipe nfs-utils-1.2.7-r0: task do_rm_work: Started
NOTE: recipe rpcbind-0.2.0-r4: task do_rm_work: Started
NOTE: recipe bash-4.2-r6: task do_rm_work: Succeeded
NOTE: recipe alsa-state-0.2.0-r4: task do_rm_work: Started
NOTE: recipe busybox-1.20.2-r32: task do_rm_work: Succeeded
NOTE: recipe nfs-utils-1.2.7-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3066 of 3939 (ID: 2754, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_package_write)
NOTE: Running noexec task 3069 of 3939 (ID: 2757, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_build)
NOTE: Running task 3070 of 3939 (ID: 2758, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_rm_work)
NOTE: recipe gawk-4.0.1-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 3080 of 3939 (ID: 2600, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_package_write)
NOTE: Running noexec task 3082 of 3939 (ID: 3667, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_package_write)
NOTE: Running noexec task 3083 of 3939 (ID: 2603, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_build)
NOTE: Running task 3084 of 3939 (ID: 2604, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_rm_work)
NOTE: Running noexec task 3087 of 3939 (ID: 3670, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_build)
NOTE: Running task 3088 of 3939 (ID: 3671, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_rm_work)
NOTE: recipe rpcbind-0.2.0-r4: task do_rm_work: Succeeded
NOTE: Running noexec task 3098 of 3939 (ID: 294, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_package_write)
NOTE: Running noexec task 3100 of 3939 (ID: 2530, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_package_write)
NOTE: Running noexec task 3101 of 3939 (ID: 297, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_build)
NOTE: Running task 3102 of 3939 (ID: 298, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_rm_work)
NOTE: recipe alsa-utils-1.0.26-r0: task do_rm_work: Started
NOTE: Running noexec task 3105 of 3939 (ID: 2533, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_build)
NOTE: Running task 3106 of 3939 (ID: 2534, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_rm_work)
NOTE: recipe alsa-state-0.2.0-r4: task do_rm_work: Succeeded
NOTE: recipe netbase-1_5.0-r0: task do_rm_work: Started
NOTE: recipe bluez-hcidump-2.5-r1: task do_rm_work: Started
NOTE: recipe avahi-0.6.31-r6.1: task do_rm_work: Started
NOTE: recipe alsa-utils-1.0.26-r0: task do_rm_work: Succeeded
NOTE: recipe netbase-1_5.0-r0: task do_rm_work: Succeeded
NOTE: recipe bluez4-4.101-r6: task do_rm_work: Started
NOTE: Running noexec task 3163 of 3939 (ID: 776, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_package_write)
NOTE: Running noexec task 3165 of 3939 (ID: 2839, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_package_write)
NOTE: Running noexec task 3166 of 3939 (ID: 779, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_build)
NOTE: Running task 3167 of 3939 (ID: 780, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_rm_work)
NOTE: recipe libnss-mdns-0.10-r7: task do_rm_work: Started
NOTE: recipe bluez-hcidump-2.5-r1: task do_rm_work: Succeeded
NOTE: recipe avahi-0.6.31-r6.1: task do_rm_work: Succeeded
NOTE: Running noexec task 3170 of 3939 (ID: 2842, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_build)
NOTE: Running task 3171 of 3939 (ID: 2843, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_rm_work)
NOTE: Running noexec task 3195 of 3939 (ID: 2811, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_package_write)
NOTE: Running noexec task 3198 of 3939 (ID: 2814, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_build)
NOTE: Running task 3199 of 3939 (ID: 2815, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_rm_work)
NOTE: recipe bluez4-4.101-r6: task do_rm_work: Succeeded
NOTE: Running noexec task 3209 of 3939 (ID: 2782, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_package_write)
NOTE: Running noexec task 3212 of 3939 (ID: 2785, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_build)
NOTE: Running task 3213 of 3939 (ID: 2786, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_rm_work)
NOTE: Running noexec task 3223 of 3939 (ID: 2768, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_package_write)
NOTE: Running noexec task 3226 of 3939 (ID: 2771, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_build)
NOTE: Running task 3227 of 3939 (ID: 2772, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_rm_work)
NOTE: Running noexec task 3237 of 3939 (ID: 2740, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_package_write)
NOTE: Running noexec task 3240 of 3939 (ID: 2743, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_build)
NOTE: Running task 3241 of 3939 (ID: 2744, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_rm_work)
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_rm_work: Started
NOTE: recipe libnss-mdns-0.10-r7: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_rm_work: Started
NOTE: recipe init-ifupdown-1.0-r0: task do_rm_work: Started
NOTE: Running noexec task 3265 of 3939 (ID: 2698, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_package_write)
NOTE: Running noexec task 3268 of 3939 (ID: 2701, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_build)
NOTE: Running task 3269 of 3939 (ID: 2702, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_rm_work)
NOTE: recipe python-cheetah-2.4.4-r3: task do_rm_work: Started
NOTE: recipe initscripts-1.0-r142: task do_rm_work: Started
NOTE: recipe modutils-initscripts-1.0-r7: task do_rm_work: Started
NOTE: recipe python-cheetah-2.4.4-r3: task do_rm_work: Succeeded
NOTE: recipe initscripts-1.0-r142: task do_rm_work: Succeeded
NOTE: recipe init-ifupdown-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe modutils-initscripts-1.0-r7: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3293 of 3939 (ID: 2642, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_package_write)
NOTE: Running noexec task 3296 of 3939 (ID: 2645, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_build)
NOTE: Running task 3297 of 3939 (ID: 2646, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_rm_work)
NOTE: Running noexec task 3307 of 3939 (ID: 2628, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_package_write)
NOTE: Running noexec task 3310 of 3939 (ID: 2631, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_build)
NOTE: Running task 3311 of 3939 (ID: 2632, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_rm_work)
NOTE: Running noexec task 3321 of 3939 (ID: 2614, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_package_write)
NOTE: Running noexec task 3324 of 3939 (ID: 2617, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_build)
NOTE: Running task 3325 of 3939 (ID: 2618, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_rm_work)
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_rm_work: Started
NOTE: Running noexec task 3335 of 3939 (ID: 2586, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_package_write)
NOTE: Running noexec task 3338 of 3939 (ID: 2589, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_build)
NOTE: Running task 3339 of 3939 (ID: 2590, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_rm_work)
NOTE: Running noexec task 3349 of 3939 (ID: 2572, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_package_write)
NOTE: Running noexec task 3352 of 3939 (ID: 2575, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_build)
NOTE: Running task 3353 of 3939 (ID: 2576, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_rm_work)
NOTE: Running noexec task 3363 of 3939 (ID: 2558, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_package_write)
NOTE: Running noexec task 3366 of 3939 (ID: 2561, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_build)
NOTE: Running task 3367 of 3939 (ID: 2562, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_rm_work)
NOTE: recipe usbutils-006-r0: task do_rm_work: Started
NOTE: recipe kmod-9-r0.0: task do_rm_work: Started
NOTE: recipe wpa-supplicant-2.0-r2: task do_rm_work: Started
NOTE: recipe wireless-tools-1_29-r4: task do_rm_work: Started
NOTE: recipe showiframe-1.1-r0: task do_rm_work: Started
NOTE: recipe usbutils-006-r0: task do_rm_work: Succeeded
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3377 of 3939 (ID: 547, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_package_write)
NOTE: Running noexec task 3380 of 3939 (ID: 550, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_build)
NOTE: Running task 3381 of 3939 (ID: 551, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_rm_work)
NOTE: recipe wireless-tools-1_29-r4: task do_rm_work: Succeeded
NOTE: recipe kmod-9-r0.0: task do_rm_work: Succeeded
NOTE: Running task 3396 of 3939 (ID: 220, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_fetch)
NOTE: Running task 3397 of 3939 (ID: 206, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_fetch)
NOTE: recipe wpa-supplicant-2.0-r2: task do_rm_work: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_rm_work: Started
NOTE: Running noexec task 3408 of 3939 (ID: 180, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_package_write)
NOTE: Running noexec task 3410 of 3939 (ID: 183, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_build)
NOTE: Running task 3411 of 3939 (ID: 184, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_rm_work)
NOTE: recipe showiframe-1.1-r0: task do_rm_work: Succeeded
NOTE: Running task 3468 of 3939 (ID: 786, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_fetch)
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_rm_work: Started
NOTE: Running task 3469 of 3939 (ID: 758, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_fetch)
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_rm_work: Succeeded
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_fetch: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_fetch: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_rm_work: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_rm_work: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_fetch: Succeeded
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_fetch: Succeeded
NOTE: Running noexec task 3479 of 3939 (ID: 715, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_package_write)
NOTE: Running noexec task 3482 of 3939 (ID: 718, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_build)
NOTE: Running task 3483 of 3939 (ID: 719, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_rm_work)
NOTE: Running noexec task 3493 of 3939 (ID: 701, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_package_write)
NOTE: Running noexec task 3496 of 3939 (ID: 704, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_build)
NOTE: Running task 3497 of 3939 (ID: 705, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_rm_work)
NOTE: Running task 3498 of 3939 (ID: 216, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_unpack)
NOTE: Running task 3499 of 3939 (ID: 202, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_unpack)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_fetch: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_fetch: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 3500 of 3939 (ID: 754, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_unpack)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_fetch: Succeeded
NOTE: recipe firmware-zd1211-1.0-r0: task do_rm_work: Started
NOTE: Running task 3501 of 3939 (ID: 782, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_unpack)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_rm_work: Started
NOTE: Running noexec task 3511 of 3939 (ID: 687, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_package_write)
NOTE: Running noexec task 3514 of 3939 (ID: 690, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_build)
NOTE: Running task 3515 of 3939 (ID: 691, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_rm_work)
NOTE: recipe firmware-zd1211-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_unpack: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_unpack: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_unpack: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_unpack: Started
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_rm_work: Started
NOTE: Running noexec task 3525 of 3939 (ID: 673, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_package_write)
NOTE: Running noexec task 3528 of 3939 (ID: 676, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_build)
NOTE: Running task 3529 of 3939 (ID: 677, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_rm_work)
NOTE: Running noexec task 3539 of 3939 (ID: 659, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_package_write)
NOTE: Running noexec task 3542 of 3939 (ID: 662, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_build)
NOTE: Running task 3543 of 3939 (ID: 663, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_rm_work)
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_unpack: Succeeded
NOTE: recipe firmware-rt73-1.0-r0: task do_rm_work: Started
NOTE: recipe firmware-rt2870-1.0-r0: task do_rm_work: Started
NOTE: recipe firmware-rt73-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_unpack: Succeeded
NOTE: Running task 3544 of 3939 (ID: 203, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_patch)
NOTE: Running noexec task 3554 of 3939 (ID: 645, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_package_write)
NOTE: Running noexec task 3557 of 3939 (ID: 648, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_build)
NOTE: Running task 3558 of 3939 (ID: 649, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_rm_work)
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe firmware-rt2870-1.0-r0: task do_rm_work: Succeeded
NOTE: Running task 3559 of 3939 (ID: 783, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_patch)
NOTE: Running noexec task 3569 of 3939 (ID: 631, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_package_write)
NOTE: Running noexec task 3572 of 3939 (ID: 634, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_build)
NOTE: Running task 3573 of 3939 (ID: 635, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_rm_work)
NOTE: recipe firmware-htc9271-1.0-r0: task do_rm_work: Started
NOTE: Running task 3574 of 3939 (ID: 755, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_patch)
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_patch: Started
NOTE: Running noexec task 3584 of 3939 (ID: 617, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_package_write)
NOTE: Running noexec task 3587 of 3939 (ID: 620, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_build)
NOTE: Running task 3588 of 3939 (ID: 621, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_rm_work)
NOTE: recipe firmware-htc7010-1.0-r0: task do_rm_work: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_patch: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_rm_work: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_patch: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_patch: Succeeded
NOTE: recipe firmware-htc9271-1.0-r0: task do_rm_work: Succeeded
NOTE: Running task 3590 of 3939 (ID: 599, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_fetch)
NOTE: recipe firmware-htc7010-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_patch: Succeeded
NOTE: Running task 3591 of 3939 (ID: 585, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_fetch)
NOTE: Running task 3592 of 3939 (ID: 571, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_fetch)
NOTE: Running task 3593 of 3939 (ID: 759, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_configure)
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3619 of 3939 (ID: 533, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_package_write)
NOTE: Running noexec task 3622 of 3939 (ID: 536, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_build)
NOTE: Running task 3623 of 3939 (ID: 537, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_rm_work)
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_unpack: Succeeded
NOTE: Running noexec task 3661 of 3939 (ID: 476, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_package_write)
NOTE: Running noexec task 3664 of 3939 (ID: 479, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_build)
NOTE: Running task 3665 of 3939 (ID: 480, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_rm_work)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_fetch: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_fetch: Started
NOTE: Running task 3666 of 3939 (ID: 217, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_patch)
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_fetch: Succeeded
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_fetch: Succeeded
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_configure: Started
NOTE: Running task 3667 of 3939 (ID: 595, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_unpack)
NOTE: Running task 3668 of 3939 (ID: 581, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_unpack)
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_fetch: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_configure: Succeeded
NOTE: recipe vsftpd-2.3.5-r4: task do_rm_work: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_fetch: Succeeded
NOTE: Running task 3669 of 3939 (ID: 760, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_compile)
NOTE: Running task 3670 of 3939 (ID: 567, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_unpack)
NOTE: recipe tuxbox-links-1.0-r10: task do_rm_work: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_patch: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_patch: Succeeded
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_unpack: Started
NOTE: Running noexec task 3695 of 3939 (ID: 448, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_package_write)
NOTE: Running noexec task 3698 of 3939 (ID: 451, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_build)
NOTE: Running task 3699 of 3939 (ID: 452, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_rm_work)
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_unpack: Started
NOTE: recipe vsftpd-2.3.5-r4: task do_rm_work: Succeeded
NOTE: recipe tuxbox-links-1.0-r10: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_unpack: Succeeded
NOTE: Running task 3728 of 3939 (ID: 402, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_fetch)
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_compile: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_unpack: Started
NOTE: Running noexec task 3752 of 3939 (ID: 364, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_package_write)
NOTE: Running noexec task 3755 of 3939 (ID: 367, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_build)
NOTE: Running task 3756 of 3939 (ID: 368, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_rm_work)
NOTE: Running task 3757 of 3939 (ID: 596, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_patch)
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3758 of 3939 (ID: 756, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_install)
NOTE: recipe sdparm-1.07-r1: task do_rm_work: Started
NOTE: recipe openpli-bootlogo-3.0-r10: task do_fetch: Started
NOTE: recipe openpli-bootlogo-3.0-r10: task do_fetch: Succeeded
NOTE: recipe early-configure-20101009-r0: task do_rm_work: Started
NOTE: recipe sdparm-1.07-r1: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_patch: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_patch: Succeeded
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_install: Started
NOTE: recipe early-configure-20101009-r0: task do_rm_work: Succeeded
NOTE: Running task 3759 of 3939 (ID: 398, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_unpack)
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_install: Succeeded
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_unpack: Succeeded
NOTE: Running noexec task 3769 of 3939 (ID: 336, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_package_write)
NOTE: Running noexec task 3772 of 3939 (ID: 339, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_build)
NOTE: Running task 3773 of 3939 (ID: 340, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_rm_work)
NOTE: Running noexec task 3797 of 3939 (ID: 308, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_package_write)
NOTE: Running noexec task 3800 of 3939 (ID: 311, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_build)
NOTE: Running task 3801 of 3939 (ID: 312, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_rm_work)
NOTE: Running task 3802 of 3939 (ID: 568, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_patch)
NOTE: Running noexec task 3827 of 3939 (ID: 266, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_package_write)
NOTE: Running noexec task 3830 of 3939 (ID: 269, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_build)
NOTE: Running task 3831 of 3939 (ID: 270, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_rm_work)
NOTE: recipe openpli-bootlogo-3.0-r10: task do_unpack: Started
NOTE: Running task 3832 of 3939 (ID: 764, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_package)
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_unpack: Succeeded
NOTE: recipe openpli-bootlogo-3.0-r10: task do_unpack: Succeeded
NOTE: recipe dropbear-2012.55-r3.1: task do_rm_work: Started
NOTE: Running task 3833 of 3939 (ID: 757, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_populate_sysroot)
NOTE: Running task 3834 of 3939 (ID: 582, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_patch)
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_patch: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_patch: Succeeded
NOTE: recipe opkg-collateral-1.0-r2: task do_rm_work: Started
NOTE: recipe samba-3.0.37-r8: task do_rm_work: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_package: Started
NOTE: Running task 3836 of 3939 (ID: 399, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_patch)
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_patch: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_patch: Succeeded
NOTE: recipe dropbear-2012.55-r3.1: task do_rm_work: Succeeded
NOTE: recipe samba-3.0.37-r8: task do_rm_work: Succeeded
NOTE: recipe openpli-bootlogo-3.0-r10: task do_patch: Started
NOTE: recipe openpli-bootlogo-3.0-r10: task do_patch: Succeeded
NOTE: recipe opkg-collateral-1.0-r2: task do_rm_work: Succeeded
NOTE: Running task 3842 of 3939 (ID: 403, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_configure)
NOTE: Running task 3843 of 3939 (ID: 405, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_populate_lic)
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe openpli-bootlogo-3.0-r10: task do_configure: Started
NOTE: recipe openpli-bootlogo-3.0-r10: task do_populate_lic: Started
NOTE: recipe openpli-bootlogo-3.0-r10: task do_configure: Succeeded
NOTE: Running task 3844 of 3939 (ID: 404, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_compile)
NOTE: recipe openpli-bootlogo-3.0-r10: task do_populate_lic: Succeeded
NOTE: recipe openpli-bootlogo-3.0-r10: task do_compile: Started
NOTE: recipe openpli-bootlogo-3.0-r10: task do_compile: Succeeded
NOTE: Running task 3845 of 3939 (ID: 400, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_install)
NOTE: recipe openpli-bootlogo-3.0-r10: task do_install: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_package: Succeeded
NOTE: recipe openpli-bootlogo-3.0-r10: task do_install: Succeeded
NOTE: Running task 3846 of 3939 (ID: 763, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_packagedata)
NOTE: Running task 3847 of 3939 (ID: 408, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_package)
NOTE: Running task 3848 of 3939 (ID: 401, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_populate_sysroot)
NOTE: recipe openpli-bootlogo-3.0-r10: task do_package: Started
NOTE: recipe openpli-bootlogo-3.0-r10: task do_populate_sysroot: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_packagedata: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe openpli-bootlogo-3.0-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 3849 of 3939 (ID: 767, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_package_write_ipk)
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe openpli-bootlogo-3.0-r10: task do_package: Succeeded
NOTE: Running task 3850 of 3939 (ID: 407, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_packagedata)
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 3851 of 3939 (ID: 762, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_package_write)
NOTE: Running noexec task 3852 of 3939 (ID: 765, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_build)
NOTE: Running task 3853 of 3939 (ID: 766, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_rm_work)
NOTE: recipe openpli-bootlogo-3.0-r10: task do_packagedata: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_rm_work: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_rm_work: Succeeded
NOTE: recipe openpli-bootlogo-3.0-r10: task do_packagedata: Succeeded
NOTE: Running task 3854 of 3939 (ID: 411, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_package_write_ipk)
NOTE: recipe openpli-bootlogo-3.0-r10: task do_package_write_ipk: Started
NOTE: recipe openpli-bootlogo-3.0-r10: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 3855 of 3939 (ID: 406, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_package_write)
NOTE: Running noexec task 3856 of 3939 (ID: 409, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_build)
NOTE: Running task 3857 of 3939 (ID: 410, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/bootlogo/openpli-bootlogo.bb, do_rm_work)
NOTE: recipe openpli-bootlogo-3.0-r10: task do_rm_work: Started
NOTE: recipe openpli-bootlogo-3.0-r10: task do_rm_work: Succeeded
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_configure: Succeeded
NOTE: Running task 3858 of 3939 (ID: 193, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_compile)
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_compile: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_compile: Succeeded
NOTE: Running task 3859 of 3939 (ID: 194, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_openpli_preinstall)
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_openpli_preinstall: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_openpli_preinstall: Succeeded
NOTE: Running task 3860 of 3939 (ID: 188, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_install)
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_install: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_install: Succeeded
NOTE: Running task 3861 of 3939 (ID: 198, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_package)
NOTE: Running task 3862 of 3939 (ID: 189, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_populate_sysroot)
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_package: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_populate_sysroot: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_populate_sysroot: Succeeded
NOTE: Running task 3863 of 3939 (ID: 221, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_configure)
NOTE: Running task 3864 of 3939 (ID: 207, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_configure)
NOTE: Running task 3865 of 3939 (ID: 787, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_configure)
NOTE: Running task 3866 of 3939 (ID: 600, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_configure)
NOTE: Running task 3867 of 3939 (ID: 586, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_configure)
NOTE: Running task 3868 of 3939 (ID: 572, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_configure)
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_configure: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_configure: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_configure: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_configure: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_configure: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_configure: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_configure: Succeeded
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_configure: Succeeded
NOTE: Running task 3869 of 3939 (ID: 573, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_compile)
NOTE: Running task 3870 of 3939 (ID: 601, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_compile)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_configure: Succeeded
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_compile: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_compile: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_compile: Succeeded
NOTE: Running task 3871 of 3939 (ID: 788, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_compile)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_compile: Succeeded
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_configure: Succeeded
NOTE: Running task 3872 of 3939 (ID: 569, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_install)
NOTE: Running task 3873 of 3939 (ID: 587, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_compile)
NOTE: Running task 3874 of 3939 (ID: 597, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_install)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_compile: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_install: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_compile: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_install: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_compile: Succeeded
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_install: Succeeded
NOTE: Running task 3875 of 3939 (ID: 784, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_install)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_install: Succeeded
NOTE: Running task 3876 of 3939 (ID: 570, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_populate_sysroot)
NOTE: Running task 3877 of 3939 (ID: 598, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_populate_sysroot)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_install: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_populate_sysroot: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_populate_sysroot: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_install: Succeeded
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3878 of 3939 (ID: 785, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_populate_sysroot)
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_compile: Succeeded
NOTE: Running task 3879 of 3939 (ID: 583, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_install)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_populate_sysroot: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_install: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_install: Succeeded
NOTE: Running task 3880 of 3939 (ID: 584, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_populate_sysroot)
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_populate_sysroot: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_populate_sysroot: Succeeded
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_configure: Succeeded
NOTE: Running task 3881 of 3939 (ID: 208, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_compile)
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_compile: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_compile: Succeeded
NOTE: Running task 3882 of 3939 (ID: 204, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_install)
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_install: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_install: Succeeded
NOTE: Running task 3883 of 3939 (ID: 205, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_populate_sysroot)
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_populate_sysroot: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_populate_sysroot: Succeeded
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_package: Succeeded
NOTE: Running task 3884 of 3939 (ID: 197, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_packagedata)
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_packagedata: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_packagedata: Succeeded
NOTE: Running task 3885 of 3939 (ID: 201, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_package_write_ipk)
NOTE: Running task 3886 of 3939 (ID: 212, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_package)
NOTE: Running task 3887 of 3939 (ID: 792, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_package)
NOTE: Running task 3888 of 3939 (ID: 605, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_package)
NOTE: Running task 3889 of 3939 (ID: 591, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_package)
NOTE: Running task 3890 of 3939 (ID: 577, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_package)
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_package: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_package: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_package: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_package_write_ipk: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_package: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_package: Started
WARNING: QA Issue: enigma2-plugin-extensions-ppanel: Files/directories were installed but not shipped
  /etc
  /etc/ppanel
  /etc/ppanel/PPanel_tutorial.xml
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_package: Succeeded
NOTE: Running task 3891 of 3939 (ID: 576, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_packagedata)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_package: Succeeded
NOTE: Running task 3892 of 3939 (ID: 604, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_packagedata)
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_packagedata: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_packagedata: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_package: Succeeded
NOTE: Running task 3893 of 3939 (ID: 211, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_packagedata)
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_packagedata: Succeeded
NOTE: Running task 3894 of 3939 (ID: 580, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_package_write_ipk)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_package: Succeeded
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_packagedata: Started
NOTE: Running task 3895 of 3939 (ID: 791, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_packagedata)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_packagedata: Succeeded
NOTE: Running task 3896 of 3939 (ID: 608, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_package_write_ipk)
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_package_write_ipk: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_packagedata: Succeeded
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_package_write_ipk: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_packagedata: Started
NOTE: Running task 3897 of 3939 (ID: 215, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_package_write_ipk)
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_package_write_ipk: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_packagedata: Succeeded
NOTE: Running task 3898 of 3939 (ID: 795, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_package_write_ipk)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_package_write_ipk: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_package_write_ipk: Succeeded
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 3899 of 3939 (ID: 575, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_package_write)
NOTE: Running noexec task 3900 of 3939 (ID: 603, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_package_write)
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_package_write_ipk: Succeeded
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 3901 of 3939 (ID: 790, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_package_write)
NOTE: Running noexec task 3902 of 3939 (ID: 210, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_package_write)
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_package: Succeeded
NOTE: Running task 3903 of 3939 (ID: 590, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_packagedata)
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_packagedata: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_packagedata: Succeeded
NOTE: Running task 3904 of 3939 (ID: 594, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_package_write_ipk)
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_package_write_ipk: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 3905 of 3939 (ID: 589, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_package_write)
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 3906 of 3939 (ID: 196, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_package_write)
NOTE: Running noexec task 3907 of 3939 (ID: 199, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_build)
NOTE: Running task 3908 of 3939 (ID: 200, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/enigma2.bb, do_rm_work)
NOTE: Running noexec task 3909 of 3939 (ID: 213, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_build)
NOTE: Running task 3910 of 3939 (ID: 214, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_rm_work)
NOTE: Running noexec task 3911 of 3939 (ID: 793, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_build)
NOTE: Running task 3912 of 3939 (ID: 794, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_rm_work)
NOTE: Running noexec task 3913 of 3939 (ID: 606, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_build)
NOTE: Running task 3914 of 3939 (ID: 607, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_rm_work)
NOTE: Running noexec task 3915 of 3939 (ID: 592, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_build)
NOTE: Running task 3916 of 3939 (ID: 593, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_rm_work)
NOTE: Running noexec task 3917 of 3939 (ID: 578, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_build)
NOTE: Running task 3918 of 3939 (ID: 579, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_rm_work)
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_rm_work: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_rm_work: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_rm_work: Started
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_rm_work: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_rm_work: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_rm_work: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_rm_work: Succeeded
NOTE: recipe enigma2-2.7+gitAUTOINC+6c4d72d650dd6be8648bf4de9cfb2a0ac9c0531d-r42: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_configure: Succeeded
NOTE: Running task 3919 of 3939 (ID: 222, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_compile)
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_compile: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_compile: Succeeded
NOTE: Running task 3920 of 3939 (ID: 218, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_install)
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_install: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_install: Succeeded
NOTE: Running task 3921 of 3939 (ID: 226, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_package)
NOTE: Running task 3922 of 3939 (ID: 219, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_populate_sysroot)
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_package: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_populate_sysroot: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_populate_sysroot: Succeeded
NOTE: Running noexec task 3929 of 3939 (ID: 9, /media/work/pliqt/openpli-oe-core/meta-local/recipes-local/images/my-image.bb, do_package_write)
WARNING: QA Issue: enigma2-plugins: Files/directories were installed but not shipped
  /media
  /media/hdd
  /media/hdd/bootlogos
  /media/hdd/bootlogos/moon_radio.mvi
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_package: Succeeded
NOTE: Running task 3931 of 3939 (ID: 225, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_packagedata)
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_packagedata: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_packagedata: Succeeded
NOTE: Running task 3932 of 3939 (ID: 229, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_package_write_ipk)
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_package_write_ipk: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 3933 of 3939 (ID: 224, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_package_write)
NOTE: Running noexec task 3934 of 3939 (ID: 227, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_build)
NOTE: Running task 3935 of 3939 (ID: 228, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugins.bb, do_rm_work)
NOTE: Running task 3936 of 3939 (ID: 7, /media/work/pliqt/openpli-oe-core/meta-local/recipes-local/images/my-image.bb, do_rootfs)
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_rm_work: Started
NOTE: recipe enigma2-plugins-experimental-gitAUTOINC+d454b20734e305fa537912f8439ac88f6314f2c0-r7: task do_rm_work: Succeeded
NOTE: recipe my-image-1.0-r0: task do_rootfs: Started
NOTE: recipe my-image-1.0-r0: task do_rootfs: Succeeded
NOTE: Running noexec task 3937 of 3939 (ID: 12, /media/work/pliqt/openpli-oe-core/meta-local/recipes-local/images/my-image.bb, do_build)
NOTE: Running task 3938 of 3939 (ID: 13, /media/work/pliqt/openpli-oe-core/meta-local/recipes-local/images/my-image.bb, do_rm_work)
NOTE: recipe my-image-1.0-r0: task do_rm_work: Started
NOTE: recipe my-image-1.0-r0: task do_rm_work: Succeeded
NOTE: Running task 3939 of 3939 (ID: 14, /media/work/pliqt/openpli-oe-core/meta-local/recipes-local/images/my-image.bb, do_rm_work_all)
NOTE: recipe my-image-1.0-r0: task do_rm_work_all: Started
NOTE: recipe my-image-1.0-r0: task do_rm_work_all: Succeeded
NOTE: Tasks Summary: Attempted 3939 tasks of which 3327 didn't need to be rerun and all succeeded.

Summary: There were 2 WARNING messages shown.

--------------070503050902020008030800
Content-Type: text/x-log;
 name="bitbake-switch-from-vusolo2-to-et9x00.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="bitbake-switch-from-vusolo2-to-et9x00.log"

Loading cache...done.
Loaded 1853 entries from dependency cache.
Parsing recipes...done.
Parsing of 1571 .bb files complete (1494 cached, 77 parsed). 1929 targets, 125 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.17.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-11.10"
TARGET_SYS        = "mipsel-oe-linux"
MACHINE           = "vusolo2"
DISTRO            = "openpli"
DISTRO_VERSION    = "4"
TUNE_FEATURES     = "o32 fpu-hard mips32"
TARGET_FPU        = ""
meta-oe           
meta-networking   = "(nobranch):61911b23099c2658186179504ded318c987b5276"
meta              = "master:d9466101908f05cb11c8a8afb73430ad919ac50d"
meta-openpli      
meta-local        = "upstream:99c7070b2b4826021c3f5ca4a40c279794712711"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Running setscene task 945 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 946 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 947 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 948 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 949 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 950 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 951 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 952 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_package_write_ipk_setscene)
NOTE: recipe samba-3.0.37-r8: task do_package_write_ipk_setscene: Started
NOTE: recipe ncurses-5.9-r13.1: task do_package_write_ipk_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe opkg-collateral-1.0-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe avahi-0.6.31-r6.1: task do_package_write_ipk_setscene: Started
NOTE: recipe eglibc-2.17-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe opkg-collateral-1.0-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 953 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 954 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_packagedata_setscene)
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ncurses-5.9-r13.1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 955 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 956 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_package_write_ipk_setscene)
NOTE: recipe opkg-collateral-1.0-r2: task do_packagedata_setscene: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 957 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_packagedata_setscene)
NOTE: recipe avahi-0.6.31-r6.1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 958 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_package_write_ipk_setscene)
NOTE: recipe e2fsprogs-1.42.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_packagedata_setscene: Started
NOTE: recipe dropbear-2012.55-r3.1: task do_package_write_ipk_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-collateral-1.0-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe early-configure-20101009-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 959 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_package_setscene)
NOTE: Running setscene task 960 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_package_setscene)
NOTE: recipe dropbear-2012.55-r3.1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 961 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.42.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe eglibc-2.17-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 962 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 963 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_package_setscene)
NOTE: Running setscene task 964 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_package_write_ipk_setscene)
NOTE: recipe early-configure-20101009-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 965 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_packagedata_setscene)
NOTE: recipe opkg-collateral-1.0-r2: task do_package_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_package_setscene: Started
NOTE: recipe opkg-collateral-1.0-r2: task do_package_setscene: Succeeded
NOTE: recipe dropbear-2012.55-r3.1: task do_packagedata_setscene: Started
NOTE: Running setscene task 966 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_package_write_ipk_setscene)
NOTE: recipe samba-3.0.37-r8: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 967 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_packagedata_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_package_setscene: Started
NOTE: recipe sdparm-1.07-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe early-configure-20101009-r0: task do_packagedata_setscene: Started
NOTE: recipe nfs-utils-1.2.7-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 968 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_package_write_ipk_setscene)
NOTE: recipe dropbear-2012.55-r3.1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_package_setscene)
NOTE: recipe tuxbox-links-1.0-r10: task do_package_write_ipk_setscene: Started
NOTE: recipe samba-3.0.37-r8: task do_packagedata_setscene: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_package_setscene: Succeeded
NOTE: Running setscene task 970 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_package_write_ipk_setscene)
NOTE: recipe nfs-utils-1.2.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 971 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_packagedata_setscene)
NOTE: recipe sdparm-1.07-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe early-configure-20101009-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_package_setscene)
NOTE: Running setscene task 973 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_packagedata_setscene)
NOTE: recipe tuxbox-links-1.0-r10: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe samba-3.0.37-r8: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.22.2-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 974 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_packagedata_setscene)
NOTE: Running setscene task 975 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_package_setscene)
NOTE: recipe dropbear-2012.55-r3.1: task do_package_setscene: Started
NOTE: recipe nfs-utils-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vsftpd-2.3.5-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe early-configure-20101009-r0: task do_package_setscene: Started
NOTE: recipe sdparm-1.07-r1: task do_packagedata_setscene: Started
NOTE: recipe nfs-utils-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.22.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 976 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 977 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_package_setscene)
NOTE: recipe early-configure-20101009-r0: task do_package_setscene: Succeeded
NOTE: recipe sdparm-1.07-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe tuxbox-links-1.0-r10: task do_packagedata_setscene: Started
NOTE: recipe samba-3.0.37-r8: task do_package_setscene: Started
NOTE: Running setscene task 978 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_package_setscene)
NOTE: recipe dropbear-2012.55-r3.1: task do_package_setscene: Succeeded
NOTE: Running setscene task 979 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 980 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_package_write_ipk_setscene)
NOTE: recipe vsftpd-2.3.5-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 981 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_packagedata_setscene)
NOTE: recipe tuxbox-links-1.0-r10: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_package_setscene)
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe sdparm-1.07-r1: task do_package_setscene: Started
NOTE: recipe nfs-utils-1.2.7-r0: task do_package_setscene: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_package_write_ipk_setscene: Started
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe vsftpd-2.3.5-r4: task do_packagedata_setscene: Started
NOTE: recipe tuxbox-links-1.0-r10: task do_package_setscene: Started
NOTE: recipe sdparm-1.07-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 983 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 984 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe tuxbox-links-1.0-r10: task do_package_setscene: Succeeded
NOTE: Running setscene task 985 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_packagedata_setscene)
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 986 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_packagedata_setscene)
NOTE: Running setscene task 987 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_packagedata_setscene)
NOTE: recipe nfs-utils-1.2.7-r0: task do_package_setscene: Succeeded
NOTE: recipe vsftpd-2.3.5-r4: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 989 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_package_setscene)
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_packagedata_setscene: Started
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_packagedata_setscene: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_packagedata_setscene: Started
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe firmware-htc7010-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe vsftpd-2.3.5-r4: task do_package_setscene: Started
NOTE: Running setscene task 990 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_packagedata_setscene)
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_package_setscene)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 992 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_package_setscene)
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 993 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_packagedata_setscene)
NOTE: Running setscene task 994 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_package_setscene)
NOTE: recipe firmware-htc7010-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 995 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_packagedata_setscene)
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_package_setscene: Started
NOTE: recipe vsftpd-2.3.5-r4: task do_package_setscene: Succeeded
NOTE: Running setscene task 996 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_package_setscene: Succeeded
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_package_setscene: Started
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_packagedata_setscene: Started
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_package_setscene: Started
NOTE: recipe firmware-htc7010-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 997 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_package_setscene)
NOTE: Running setscene task 998 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_package_setscene: Succeeded
NOTE: recipe firmware-htc9271-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 999 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_package_setscene)
NOTE: Running setscene task 1000 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_package_setscene: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_package_setscene: Succeeded
NOTE: recipe firmware-rt2870-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-rt73-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-htc7010-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-htc9271-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1001 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1002 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_package_setscene)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_package_setscene: Started
NOTE: Running setscene task 1003 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rt73-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe firmware-rt2870-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1005 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_packagedata_setscene)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_package_setscene: Succeeded
NOTE: recipe firmware-htc7010-1.0-r0: task do_package_setscene: Started
NOTE: recipe samba-3.0.37-r8: task do_package_setscene: Succeeded
NOTE: Running setscene task 1007 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-htc9271-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1008 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-rt2870-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe firmware-htc7010-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe firmware-rt73-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1009 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-rt2870-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-zd1211-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1010 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_package_setscene)
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe firmware-htc9271-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe firmware-rt73-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-zd1211-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1011 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_package_setscene)
NOTE: Running setscene task 1013 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_packagedata_setscene)
NOTE: Running setscene task 1014 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_package_setscene)
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1015 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_packagedata_setscene)
NOTE: recipe firmware-rt2870-1.0-r0: task do_package_setscene: Started
NOTE: recipe firmware-zd1211-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1017 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-zd1211-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1018 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_package_setscene)
NOTE: recipe firmware-rt2870-1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1019 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_package_setscene)
NOTE: Running setscene task 1020 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe firmware-htc9271-1.0-r0: task do_package_setscene: Started
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe firmware-rt73-1.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 1021 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_package_setscene)
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1022 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_package_setscene)
NOTE: recipe firmware-htc9271-1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1023 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rt73-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe firmware-zd1211-1.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 1024 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_package_setscene: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_package_setscene: Started
NOTE: recipe alsa-lib-1.0.25-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_package_setscene: Started
NOTE: recipe firmware-zd1211-1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1025 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_packagedata_setscene)
NOTE: Running setscene task 1026 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1027 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1028 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_package_write_ipk_setscene)
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe ethtool-3.7-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1029 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_package_write_ipk_setscene)
NOTE: recipe alsa-lib-1.0.25-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe eglibc-locale-2.17-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1030 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_packagedata_setscene: Started
NOTE: recipe python-twisted-12.0.0-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe ethtool-3.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1031 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python-2.7.3-r5.2: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1032 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_package_setscene)
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe python-utf8-hack-0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe python-twisted-12.0.0-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1033 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_package_setscene: Started
NOTE: Running setscene task 1034 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_packagedata_setscene)
NOTE: recipe python-utf8-hack-0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1035 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_packagedata_setscene)
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1036 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_package_write_ipk_setscene)
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python-utf8-hack-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_packagedata_setscene: Started
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1037 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_packagedata_setscene)
NOTE: recipe python-2.7.3-r5.2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1038 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_package_write_ipk_setscene)
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1039 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_packagedata_setscene)
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python-utf8-hack-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1040 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_packagedata_setscene)
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_packagedata_setscene: Started
NOTE: Running setscene task 1041 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_package_setscene)
NOTE: Running setscene task 1042 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_package_setscene)
NOTE: recipe ethtool-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_package_write_ipk_setscene: Started
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_package_setscene: Started
NOTE: recipe ethtool-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python-twisted-12.0.0-r2: task do_packagedata_setscene: Started
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1043 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_packagedata_setscene)
NOTE: recipe python-utf8-hack-0.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 1044 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_package_setscene)
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 1045 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_package_setscene)
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_package_setscene: Succeeded
NOTE: recipe python-twisted-12.0.0-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe python-utf8-hack-0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1046 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_package_setscene)
NOTE: Running setscene task 1047 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_package_write_ipk_setscene)
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe ethtool-3.7-r0: task do_package_setscene: Started
NOTE: Running setscene task 1049 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_package_setscene)
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_packagedata_setscene: Started
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_package_write_ipk_setscene: Started
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_package_setscene: Started
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_package_setscene: Started
NOTE: recipe python-twisted-12.0.0-r2: task do_package_setscene: Started
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_package_setscene: Succeeded
NOTE: recipe ethtool-3.7-r0: task do_package_setscene: Succeeded
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1050 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1051 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1052 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_package_setscene)
NOTE: Running setscene task 1053 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_package_write_ipk_setscene)
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1054 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_packagedata_setscene)
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvdcss-1.2.10-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_package_write_ipk_setscene: Started
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_packagedata_setscene: Started
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libdvdcss-1.2.10-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1055 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_packagedata_setscene)
NOTE: Running setscene task 1057 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_package_write_ipk_setscene)
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1058 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_packagedata_setscene)
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_package_setscene: Succeeded
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_packagedata_setscene: Started
NOTE: Running setscene task 1059 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_package_write_ipk_setscene)
NOTE: recipe libdvdcss-1.2.10-r1: task do_packagedata_setscene: Started
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-4.7.2-r17: task do_package_write_ipk_setscene: Started
NOTE: recipe freetype-2.4.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe freetype-2.4.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1060 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_package_write_ipk_setscene)
NOTE: recipe gcc-runtime-4.7.2-r17: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1061 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_package_write_ipk_setscene)
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1062 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_package_setscene)
NOTE: recipe gstreamer-0.10.36-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_package_setscene: Started
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_package_setscene)
NOTE: recipe libdvdcss-1.2.10-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1064 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_package_setscene)
NOTE: Running setscene task 1065 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_package_setscene)
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1066 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_packagedata_setscene)
NOTE: recipe gstreamer-0.10.36-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1067 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_package_write_ipk_setscene)
NOTE: recipe eglibc-locale-2.17-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-twisted-12.0.0-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1068 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_package_write_ipk_setscene)
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_package_setscene: Started
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_package_setscene: Started
NOTE: recipe libdvdcss-1.2.10-r1: task do_package_setscene: Started
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_packagedata_setscene: Started
NOTE: recipe jpeg-8d-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe eglibc-locale-2.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libdvbsi++-0.3.6-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe jpeg-8d-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libdvbsi++-0.3.6-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1070 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1071 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_packagedata_setscene)
NOTE: recipe fribidi-0.19.2-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvbsi++-0.3.6-r1: task do_packagedata_setscene: Started
NOTE: recipe fribidi-0.19.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1072 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_packagedata_setscene)
NOTE: recipe fribidi-0.19.2-r1: task do_packagedata_setscene: Started
NOTE: recipe libdvdcss-1.2.10-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1073 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_package_write_ipk_setscene)
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_package_setscene)
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_package_setscene: Succeeded
NOTE: Running setscene task 1075 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_package_write_ipk_setscene)
NOTE: recipe libdvbsi++-0.3.6-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-0.19.2-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libmad-0.15.1b-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1076 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_package_setscene)
NOTE: Running setscene task 1077 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_package_setscene)
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_package_setscene: Started
NOTE: recipe eglibc-locale-2.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1078 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_package_setscene)
NOTE: recipe libpng-1.5.13-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe fribidi-0.19.2-r1: task do_package_setscene: Started
NOTE: recipe libdvbsi++-0.3.6-r1: task do_package_setscene: Started
NOTE: recipe eglibc-locale-2.17-r0: task do_package_setscene: Started
NOTE: recipe libmad-0.15.1b-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_package_setscene: Succeeded
NOTE: Running setscene task 1079 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1080 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_package_write_ipk_setscene)
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1081 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_package_write_ipk_setscene)
NOTE: recipe libungif-4.1.3-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe libpng-1.5.13-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe fribidi-0.19.2-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1082 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_package_write_ipk_setscene)
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1083 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_package_write_ipk_setscene)
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_package_setscene: Succeeded
NOTE: Running setscene task 1084 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_packagedata_setscene)
NOTE: recipe libungif-4.1.3-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libxml2-2.9.0-r1.1: task do_package_write_ipk_setscene: Started
NOTE: recipe openssl-0.9.8x-r15.0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1086 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_packagedata_setscene)
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvbsi++-0.3.6-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1087 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_package_write_ipk_setscene)
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.0-r1.1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_packagedata_setscene: Started
NOTE: recipe libungif-4.1.3-r3: task do_packagedata_setscene: Started
NOTE: recipe python-imaging-1.1.7-r4: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1088 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_package_write_ipk_setscene)
NOTE: recipe openssl-0.9.8x-r15.0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1089 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_package_write_ipk_setscene)
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-imaging-1.1.7-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1090 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_packagedata_setscene)
NOTE: recipe python-wifi-0.5.0-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_package_setscene)
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_packagedata_setscene: Started
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libungif-4.1.3-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1093 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_package_setscene)
NOTE: recipe python-imaging-1.1.7-r4: task do_packagedata_setscene: Started
NOTE: Running setscene task 1094 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_package_setscene)
NOTE: recipe python-wifi-0.5.0-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_package_setscene: Started
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1095 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1096 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_packagedata_setscene)
NOTE: recipe python-imaging-1.1.7-r4: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1097 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_package_setscene)
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1098 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_package_setscene)
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1099 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_package_write_ipk_setscene)
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_packagedata_setscene: Started
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_package_setscene: Started
NOTE: recipe libungif-4.1.3-r3: task do_package_setscene: Started
NOTE: recipe python-wifi-0.5.0-r1: task do_packagedata_setscene: Started
NOTE: recipe python-imaging-1.1.7-r4: task do_package_setscene: Started
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_package_setscene: Started
NOTE: recipe ushare-1.1a-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libungif-4.1.3-r3: task do_package_setscene: Succeeded
NOTE: recipe python-wifi-0.5.0-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe ushare-1.1a-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1100 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1101 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_package_setscene)
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1102 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_package_setscene)
NOTE: Running setscene task 1103 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1104 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_packagedata_setscene)
NOTE: recipe python-pyopenssl-0.13-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe python-wifi-0.5.0-r1: task do_package_setscene: Started
NOTE: recipe ushare-1.1a-r1: task do_packagedata_setscene: Started
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_package_setscene: Started
NOTE: recipe python-gdata-2.0.14-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe python-wifi-0.5.0-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1105 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_package_write_ipk_setscene)
NOTE: recipe ushare-1.1a-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe python-gdata-2.0.14-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1106 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_package_setscene)
NOTE: Running setscene task 1107 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_packagedata_setscene)
NOTE: recipe python-imaging-1.1.7-r4: task do_package_setscene: Succeeded
NOTE: recipe python-pyopenssl-0.13-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1108 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1109 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_packagedata_setscene)
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1110 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_package_write_ipk_setscene)
NOTE: recipe streamripper-1.64.6-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe ushare-1.1a-r1: task do_package_setscene: Started
NOTE: recipe python-gdata-2.0.14-r1: task do_packagedata_setscene: Started
NOTE: recipe python-mutagen-1.18-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe python-pyopenssl-0.13-r1: task do_packagedata_setscene: Started
NOTE: recipe streamripper-1.64.6-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-daap-0.7.1-r3: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1111 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_packagedata_setscene)
NOTE: recipe python-gdata-2.0.14-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe python-mutagen-1.18-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1112 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_package_setscene)
NOTE: recipe ushare-1.1a-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1113 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_packagedata_setscene)
NOTE: recipe python-pyopenssl-0.13-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1114 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1115 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_package_setscene)
NOTE: recipe python-daap-0.7.1-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1116 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_packagedata_setscene)
NOTE: recipe streamripper-1.64.6-r1: task do_packagedata_setscene: Started
NOTE: recipe python-mutagen-1.18-r1: task do_packagedata_setscene: Started
NOTE: recipe python-gdata-2.0.14-r1: task do_package_setscene: Started
NOTE: recipe python-pyopenssl-0.13-r1: task do_package_setscene: Started
NOTE: recipe libcddb-1.3.2-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe streamripper-1.64.6-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe python-mutagen-1.18-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1117 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_package_setscene)
NOTE: Running setscene task 1118 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_package_setscene)
NOTE: recipe python-daap-0.7.1-r3: task do_packagedata_setscene: Started
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_package_setscene: Succeeded
NOTE: Running setscene task 1119 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_packagedata_setscene)
NOTE: recipe python-pyopenssl-0.13-r1: task do_package_setscene: Succeeded
NOTE: recipe libcddb-1.3.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python-daap-0.7.1-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe streamripper-1.64.6-r1: task do_package_setscene: Started
NOTE: Running setscene task 1120 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_packagedata_setscene)
NOTE: Running setscene task 1121 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_package_write_ipk_setscene)
NOTE: recipe python-mutagen-1.18-r1: task do_package_setscene: Started
NOTE: Running setscene task 1122 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_package_setscene)
NOTE: recipe python-gdata-2.0.14-r1: task do_package_setscene: Succeeded
NOTE: recipe gstreamer-0.10.36-r4: task do_packagedata_setscene: Started
NOTE: Running setscene task 1123 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_package_write_ipk_setscene)
NOTE: recipe streamripper-1.64.6-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1124 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_packagedata_setscene)
NOTE: recipe libcddb-1.3.2-r1: task do_packagedata_setscene: Started
NOTE: recipe dvdbackup-0.4.2-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe python-mutagen-1.18-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1125 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_package_write_ipk_setscene)
NOTE: recipe python-daap-0.7.1-r3: task do_package_setscene: Started
NOTE: recipe base-passwd-3.5.26-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gstreamer-0.10.36-r4: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1126 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_package_setscene)
NOTE: recipe libmad-0.15.1b-r1: task do_packagedata_setscene: Started
NOTE: recipe dvdbackup-0.4.2-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1127 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_packagedata_setscene)
NOTE: recipe libcddb-1.3.2-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe python-daap-0.7.1-r3: task do_package_setscene: Succeeded
NOTE: Running setscene task 1128 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_package_setscene)
NOTE: Running setscene task 1129 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_package_write_ipk_setscene)
NOTE: recipe libmad-0.15.1b-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gstreamer-0.10.36-r4: task do_package_setscene: Started
NOTE: Running setscene task 1130 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_package_write_ipk_setscene)
NOTE: recipe base-passwd-3.5.26-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe dvdbackup-0.4.2-r2: task do_packagedata_setscene: Started
NOTE: Running setscene task 1131 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1132 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_package_setscene)
NOTE: recipe expat-2.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libcddb-1.3.2-r1: task do_package_setscene: Started
NOTE: recipe gettext-0.18.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe expat-2.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libcap-2.22-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe libmad-0.15.1b-r1: task do_package_setscene: Started
NOTE: recipe dvdbackup-0.4.2-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1133 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_package_setscene)
NOTE: Running setscene task 1134 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_package_write_ipk_setscene)
NOTE: recipe libmad-0.15.1b-r1: task do_package_setscene: Succeeded
NOTE: recipe dvdbackup-0.4.2-r2: task do_package_setscene: Started
NOTE: Running setscene task 1135 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_package_write_ipk_setscene)
NOTE: recipe libcddb-1.3.2-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1136 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_package_write_ipk_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libcap-2.22-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1137 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_package_write_ipk_setscene)
NOTE: recipe dvdbackup-0.4.2-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1138 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_package_write_ipk_setscene)
NOTE: recipe dbus-1.6.8-r5.0: task do_package_write_ipk_setscene: Started
NOTE: recipe gettext-0.18.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1139 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_package_write_ipk_setscene)
NOTE: recipe shadow-4.1.4.3-r13: task do_package_write_ipk_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1140 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_package_write_ipk_setscene)
NOTE: recipe readline-6.2-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe talloc-2.0.1-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe gstreamer-0.10.36-r4: task do_package_setscene: Succeeded
NOTE: Running setscene task 1141 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_package_write_ipk_setscene)
NOTE: recipe shadow-4.1.4.3-r13: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe zlib-1.2.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe dbus-1.6.8-r5.0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1142 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1143 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_package_write_ipk_setscene)
NOTE: recipe readline-6.2-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe talloc-2.0.1-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1144 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1145 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1146 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_package_write_ipk_setscene)
NOTE: recipe libnfsidmap-0.25-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe zlib-1.2.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1147 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_package_write_ipk_setscene)
NOTE: recipe libevent-2.0.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_ipk_setscene: Started
NOTE: recipe libnfsidmap-0.25-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1148 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_packagedata_setscene)
NOTE: recipe sqlite3-3.7.15.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bzip2-1.0.6-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe libevent-2.0.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1149 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_packagedata_setscene)
NOTE: Running setscene task 1150 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_packagedata_setscene)
NOTE: recipe db-5.3.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe talloc-2.0.1-r2: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.6-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1151 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_package_write_ipk_setscene)
NOTE: recipe libevent-2.0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3.7.15.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libnfsidmap-0.25-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1152 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_package_write_ipk_setscene)
NOTE: recipe gdbm-1.10-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe gdbm-1.10-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1153 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_package_write_ipk_setscene)
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe db-5.3.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1154 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_packagedata_setscene)
NOTE: Running setscene task 1155 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_package_write_ipk_setscene)
NOTE: recipe talloc-2.0.1-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1156 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_package_setscene)
NOTE: recipe libnfsidmap-0.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevent-2.0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liboil-0.3.17-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_packagedata_setscene: Started
NOTE: recipe talloc-2.0.1-r2: task do_package_setscene: Started
NOTE: Running setscene task 1157 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_package_setscene)
NOTE: Running setscene task 1158 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_package_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libnfsidmap-0.25-r0: task do_package_setscene: Started
NOTE: recipe libevent-2.0.21-r0: task do_package_setscene: Started
NOTE: recipe libogg-1.3.0-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1159 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_package_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_setscene: Started
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1160 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_package_setscene)
NOTE: recipe libnfsidmap-0.25-r0: task do_package_setscene: Succeeded
NOTE: recipe liboil-0.3.17-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_setscene: Succeeded
NOTE: recipe talloc-2.0.1-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1161 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_packagedata_setscene)
NOTE: Running setscene task 1162 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1163 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1164 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_package_write_ipk_setscene)
NOTE: recipe libogg-1.3.0-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1165 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_package_write_ipk_setscene)
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_package_setscene: Started
NOTE: recipe liboil-0.3.17-r5: task do_packagedata_setscene: Started
NOTE: recipe libevent-2.0.21-r0: task do_package_setscene: Succeeded
NOTE: recipe libvorbis-1.3.3-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1166 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_package_write_ipk_setscene)
NOTE: recipe tremor-20120314-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_package_setscene: Succeeded
NOTE: recipe liboil-0.3.17-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1167 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1168 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_package_setscene)
NOTE: recipe libvorbis-1.3.3-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1169 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_packagedata_setscene)
NOTE: recipe orc-0.4.16-r0.0: task do_package_write_ipk_setscene: Started
NOTE: recipe cairo-1.12.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liboil-0.3.17-r5: task do_package_setscene: Started
NOTE: recipe libvorbis-1.3.3-r1: task do_packagedata_setscene: Started
NOTE: recipe tremor-20120314-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1170 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_packagedata_setscene)
NOTE: recipe tremor-20120314-r1: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1171 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_packagedata_setscene)
NOTE: recipe orc-0.4.16-r0.0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1172 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.3-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1173 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_packagedata_setscene)
NOTE: Running setscene task 1174 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_package_setscene)
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.16-r0.0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.3-r1: task do_package_setscene: Started
NOTE: recipe tremor-20120314-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1175 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_package_setscene)
NOTE: recipe liboil-0.3.17-r5: task do_package_setscene: Succeeded
NOTE: Running setscene task 1176 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_package_write_ipk_setscene)
NOTE: recipe tremor-20120314-r1: task do_package_setscene: Started
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1177 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_package_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.16-r0.0: task do_packagedata_setscene: Succeeded
NOTE: recipe libid3tag-0.15.1b-r7: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1178 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_package_setscene)
NOTE: Running setscene task 1179 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_package_setscene)
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_package_setscene: Started
NOTE: recipe tremor-20120314-r1: task do_package_setscene: Succeeded
NOTE: recipe cairo-1.12.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1180 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_packagedata_setscene)
NOTE: Running setscene task 1181 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_package_write_ipk_setscene)
NOTE: recipe libvorbis-1.3.3-r1: task do_package_setscene: Succeeded
NOTE: recipe libid3tag-0.15.1b-r7: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1182 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_package_write_ipk_setscene)
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1183 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_packagedata_setscene)
NOTE: Running setscene task 1184 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_package_write_ipk_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_package_setscene: Started
NOTE: recipe orc-0.4.16-r0.0: task do_package_setscene: Started
NOTE: recipe cairo-1.12.10-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.2.1-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe libid3tag-0.15.1b-r7: task do_packagedata_setscene: Started
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe speex-1.2rc1-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1185 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_package_write_ipk_setscene)
NOTE: recipe cairo-1.12.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1186 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_package_setscene)
NOTE: recipe libid3tag-0.15.1b-r7: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.16-r0.0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1187 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1188 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_package_setscene)
NOTE: recipe curl-7.28.1-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe speex-1.2rc1-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1189 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_packagedata_setscene)
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe flac-1.2.1-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe cairo-1.12.10-r0: task do_package_setscene: Started
NOTE: Running setscene task 1190 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1191 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_packagedata_setscene)
NOTE: recipe libmms-0.6.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libid3tag-0.15.1b-r7: task do_package_setscene: Started
NOTE: recipe speex-1.2rc1-r2: task do_packagedata_setscene: Started
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmms-0.6.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1192 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_packagedata_setscene)
NOTE: recipe libid3tag-0.15.1b-r7: task do_package_setscene: Succeeded
NOTE: recipe speex-1.2rc1-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1193 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1194 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_package_setscene)
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.28.1-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1195 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_packagedata_setscene)
NOTE: recipe libmms-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1196 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_packagedata_setscene)
NOTE: Running setscene task 1197 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_package_setscene)
NOTE: recipe mpeg2dec-0.4.1-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe speex-1.2rc1-r2: task do_package_setscene: Started
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_packagedata_setscene: Started
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_package_setscene: Started
NOTE: recipe curl-7.28.1-r3: task do_packagedata_setscene: Started
NOTE: recipe libmms-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpeg2dec-0.4.1-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1198 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_package_setscene)
NOTE: Running setscene task 1199 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_packagedata_setscene)
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1200 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_package_setscene)
NOTE: recipe speex-1.2rc1-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1201 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_package_write_ipk_setscene)
NOTE: recipe mpeg2dec-0.4.1-r2: task do_packagedata_setscene: Started
NOTE: recipe curl-7.28.1-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1202 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_package_setscene)
NOTE: recipe libmms-0.6.2-r0: task do_package_setscene: Started
NOTE: recipe cairo-1.12.10-r0: task do_package_setscene: Succeeded
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_package_setscene: Started
NOTE: Running setscene task 1203 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_package_write_ipk_setscene)
NOTE: recipe libmms-0.6.2-r0: task do_package_setscene: Succeeded
NOTE: recipe mpeg2dec-0.4.1-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1204 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_package_write_ipk_setscene)
NOTE: recipe curl-7.28.1-r3: task do_package_setscene: Started
NOTE: Running setscene task 1205 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_package_setscene)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe lame-3.99.5-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe opencore-amr-0.1.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe mpeg2dec-0.4.1-r2: task do_package_setscene: Started
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_package_setscene: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1206 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1207 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1208 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_packagedata_setscene)
NOTE: recipe libxml2-2.9.0-r1.1: task do_packagedata_setscene: Started
NOTE: recipe libcdio-0.82-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata_setscene: Started
NOTE: recipe lame-3.99.5-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe mpeg2dec-0.4.1-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1209 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_packagedata_setscene)
NOTE: Running setscene task 1210 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_package_write_ipk_setscene)
NOTE: recipe opencore-amr-0.1.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1211 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_packagedata_setscene)
NOTE: recipe liba52-0.7.4-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe lame-3.99.5-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1212 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_package_setscene)
NOTE: recipe libxml2-2.9.0-r1.1: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-4.7.2-r17: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1213 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_package_setscene)
NOTE: recipe opencore-amr-0.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe liba52-0.7.4-r4: task do_package_setscene: Started
NOTE: recipe libxml2-2.9.0-r1.1: task do_package_setscene: Started
NOTE: recipe lame-3.99.5-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1214 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_package_setscene)
NOTE: recipe libcdio-0.82-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe opencore-amr-0.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1215 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_package_setscene)
NOTE: Running setscene task 1216 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_packagedata_setscene)
NOTE: recipe lame-3.99.5-r1: task do_package_setscene: Started
NOTE: recipe libgcc-4.7.2-r17: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_package_setscene: Succeeded
NOTE: Running setscene task 1217 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1218 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_package_write_ipk_setscene)
NOTE: recipe opencore-amr-0.1.2-r0: task do_package_setscene: Started
NOTE: recipe libcdio-0.82-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-2.88dsf-r13: task do_package_write_ipk_setscene: Started
NOTE: recipe libnss-mdns-0.10-r7: task do_package_write_ipk_setscene: Started
NOTE: recipe curl-7.28.1-r3: task do_package_setscene: Succeeded
NOTE: Running setscene task 1219 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_package_write_ipk_setscene)
NOTE: recipe libnss-mdns-0.10-r7: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1220 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_packagedata_setscene)
NOTE: recipe libcdio-0.82-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1221 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_package_setscene)
NOTE: recipe libcdio-0.82-r0: task do_package_setscene: Started
NOTE: recipe sysvinit-2.88dsf-r13: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe rpcbind-0.2.0-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe libnss-mdns-0.10-r7: task do_packagedata_setscene: Started
NOTE: Running setscene task 1222 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_packagedata_setscene)
NOTE: recipe lame-3.99.5-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1223 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_package_write_ipk_setscene)
NOTE: recipe opencore-amr-0.1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe sysvinit-2.88dsf-r13: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.0-r1.1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1224 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1225 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_package_write_ipk_setscene)
NOTE: recipe showiframe-1.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe rpcbind-0.2.0-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libnss-mdns-0.10-r7: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1226 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1227 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_package_setscene)
NOTE: recipe showiframe-1.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1228 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_packagedata_setscene)
NOTE: recipe sysvinit-2.88dsf-r13: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-9-r0.0: task do_package_write_ipk_setscene: Started
NOTE: recipe rpcbind-0.2.0-r4: task do_packagedata_setscene: Started
NOTE: Running setscene task 1229 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_package_setscene)
NOTE: recipe libcdio-0.82-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1230 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_package_write_ipk_setscene)
NOTE: recipe libnss-mdns-0.10-r7: task do_package_setscene: Started
NOTE: recipe showiframe-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-2.88dsf-r13: task do_package_setscene: Started
NOTE: recipe bluez4-4.101-r6: task do_package_write_ipk_setscene: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe kmod-9-r0.0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe rpcbind-0.2.0-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe libnss-mdns-0.10-r7: task do_package_setscene: Succeeded
NOTE: Running setscene task 1231 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1232 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_packagedata_setscene)
NOTE: Running setscene task 1233 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_package_setscene)
NOTE: recipe showiframe-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1234 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_packagedata_setscene)
NOTE: Running setscene task 1235 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_package_setscene)
NOTE: recipe bluez4-4.101-r6: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe sysvinit-2.88dsf-r13: task do_package_setscene: Succeeded
NOTE: Running setscene task 1236 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1237 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_package_write_ipk_setscene)
NOTE: recipe kmod-9-r0.0: task do_packagedata_setscene: Started
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe rpcbind-0.2.0-r4: task do_package_setscene: Started
NOTE: recipe avahi-0.6.31-r6.1: task do_packagedata_setscene: Started
NOTE: recipe showiframe-1.1-r0: task do_package_setscene: Started
NOTE: recipe wireless-tools-1_29-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe wpa-supplicant-2.0-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe kmod-9-r0.0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpcbind-0.2.0-r4: task do_package_setscene: Succeeded
NOTE: recipe showiframe-1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1238 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_package_setscene)
NOTE: Running setscene task 1239 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1240 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_package_write_ipk_setscene)
NOTE: recipe eglibc-locale-2.17-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1241 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_package_write_ipk_setscene)
NOTE: recipe sysfsutils-2.1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe wireless-tools-1_29-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1242 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_package_setscene)
NOTE: Running setscene task 1243 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_packagedata_setscene)
NOTE: recipe wpa-supplicant-2.0-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1244 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_packagedata_setscene)
NOTE: recipe usbutils-006-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe kmod-9-r0.0: task do_package_setscene: Started
NOTE: recipe alsa-utils-1.0.26-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe alsa-state-0.2.0-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe avahi-0.6.31-r6.1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1245 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_package_setscene)
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_setscene: Started
NOTE: recipe wireless-tools-1_29-r4: task do_packagedata_setscene: Started
NOTE: recipe wpa-supplicant-2.0-r2: task do_packagedata_setscene: Started
NOTE: recipe kmod-9-r0.0: task do_package_setscene: Succeeded
NOTE: recipe usbutils-006-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1246 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1247 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_packagedata_setscene)
NOTE: recipe alsa-utils-1.0.26-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe alsa-state-0.2.0-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_package_setscene: Succeeded
NOTE: recipe wireless-tools-1_29-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe wpa-supplicant-2.0-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1248 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1249 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_packagedata_setscene)
NOTE: Running setscene task 1250 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_packagedata_setscene)
NOTE: Running setscene task 1251 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_package_setscene)
NOTE: Running setscene task 1252 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_package_setscene)
NOTE: recipe avahi-0.6.31-r6.1: task do_package_setscene: Started
NOTE: recipe usbutils-006-r0: task do_packagedata_setscene: Started
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe busybox-1.20.2-r32: task do_package_write_ipk_setscene: Started
NOTE: recipe alsa-utils-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-state-0.2.0-r4: task do_packagedata_setscene: Started
NOTE: recipe wireless-tools-1_29-r4: task do_package_setscene: Started
NOTE: recipe wpa-supplicant-2.0-r2: task do_package_setscene: Started
NOTE: recipe usbutils-006-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-state-0.2.0-r4: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1253 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_package_setscene)
NOTE: recipe busybox-1.20.2-r32: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1254 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_packagedata_setscene)
NOTE: recipe alsa-utils-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1255 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_package_setscene)
NOTE: Running setscene task 1256 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_package_setscene)
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1257 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_packagedata_setscene)
NOTE: recipe wireless-tools-1_29-r4: task do_package_setscene: Succeeded
NOTE: Running setscene task 1258 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_package_write_ipk_setscene)
NOTE: recipe busybox-1.20.2-r32: task do_packagedata_setscene: Started
NOTE: recipe usbutils-006-r0: task do_package_setscene: Started
NOTE: recipe wpa-supplicant-2.0-r2: task do_package_setscene: Succeeded
NOTE: recipe alsa-utils-1.0.26-r0: task do_package_setscene: Started
NOTE: Running setscene task 1259 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_package_write_ipk_setscene)
NOTE: recipe alsa-state-0.2.0-r4: task do_package_setscene: Started
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_packagedata_setscene: Started
NOTE: recipe modutils-initscripts-1.0-r7: task do_package_write_ipk_setscene: Started
NOTE: recipe busybox-1.20.2-r32: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.6.31-r6.1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1260 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_package_setscene)
NOTE: recipe alsa-state-0.2.0-r4: task do_package_setscene: Succeeded
NOTE: recipe netbase-1_5.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1262 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_package_write_ipk_setscene)
NOTE: recipe usbutils-006-r0: task do_package_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe modutils-initscripts-1.0-r7: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1263 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_package_write_ipk_setscene)
NOTE: recipe busybox-1.20.2-r32: task do_package_setscene: Started
NOTE: Running setscene task 1264 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_package_setscene)
NOTE: Running setscene task 1265 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_packagedata_setscene)
NOTE: recipe alsa-utils-1.0.26-r0: task do_package_setscene: Succeeded
NOTE: recipe netbase-1_5.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1266 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1267 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_package_write_ipk_setscene)
NOTE: recipe init-ifupdown-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_package_setscene: Started
NOTE: Running setscene task 1268 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_package_setscene)
NOTE: recipe initscripts-1.0-r142: task do_package_write_ipk_setscene: Started
NOTE: recipe modutils-initscripts-1.0-r7: task do_packagedata_setscene: Started
NOTE: recipe python-cheetah-2.4.4-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe init-ifupdown-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package_setscene: Started
NOTE: Running setscene task 1269 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r142: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1270 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_packagedata_setscene)
NOTE: recipe modutils-initscripts-1.0-r7: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1271 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_package_setscene)
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_package_setscene: Succeeded
NOTE: recipe python-cheetah-2.4.4-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1272 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1273 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_packagedata_setscene)
NOTE: recipe netbase-1_5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1274 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_packagedata_setscene)
NOTE: Running setscene task 1275 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_package_write_ipk_setscene)
NOTE: recipe busybox-1.20.2-r32: task do_package_setscene: Succeeded
NOTE: Running setscene task 1276 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_package_write_ipk_setscene)
NOTE: recipe init-ifupdown-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe netbase-1_5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1277 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_package_setscene)
NOTE: recipe modutils-initscripts-1.0-r7: task do_package_setscene: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r142: task do_packagedata_setscene: Started
NOTE: recipe python-cheetah-2.4.4-r3: task do_packagedata_setscene: Started
NOTE: recipe init-ifupdown-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.28.7-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe tiff-4.0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1278 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_package_setscene)
NOTE: recipe netbase-1_5.0-r0: task do_package_setscene: Started
NOTE: recipe modutils-initscripts-1.0-r7: task do_package_setscene: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1279 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_package_write_ipk_setscene)
NOTE: recipe init-ifupdown-1.0-r0: task do_package_setscene: Started
NOTE: recipe initscripts-1.0-r142: task do_packagedata_setscene: Succeeded
NOTE: recipe python-cheetah-2.4.4-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.28.7-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1280 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_package_setscene)
NOTE: Running setscene task 1281 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_package_setscene)
NOTE: Running setscene task 1282 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_package_setscene)
NOTE: recipe netbase-1_5.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1283 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_packagedata_setscene)
NOTE: recipe tiff-4.0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1284 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1285 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_packagedata_setscene)
NOTE: recipe init-ifupdown-1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1286 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_package_write_ipk_setscene)
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python-cheetah-2.4.4-r3: task do_package_setscene: Started
NOTE: recipe initscripts-1.0-r142: task do_package_setscene: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_package_setscene: Started
NOTE: recipe glib-networking-2.28.7-r3: task do_packagedata_setscene: Started
NOTE: recipe libupnp-1.6.5-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe tiff-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe faad2-2.7-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1287 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_packagedata_setscene)
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r142: task do_package_setscene: Succeeded
NOTE: recipe python-cheetah-2.4.4-r3: task do_package_setscene: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_package_setscene: Succeeded
NOTE: recipe glib-networking-2.28.7-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libupnp-1.6.5-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1288 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1289 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_packagedata_setscene)
NOTE: recipe faad2-2.7-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1290 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_package_setscene)
NOTE: Running setscene task 1291 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1292 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_packagedata_setscene)
NOTE: recipe tiff-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1293 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_package_setscene)
NOTE: Running setscene task 1294 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_packagedata_setscene)
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1295 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_package_setscene)
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.46-r4: task do_package_write_ipk_setscene: Started
NOTE: recipe glib-networking-2.28.7-r3: task do_package_setscene: Started
NOTE: recipe libupnp-1.6.5-r1: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.0.3-r0: task do_package_setscene: Started
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe faad2-2.7-r1: task do_packagedata_setscene: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.46-r4: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_package_setscene: Started
NOTE: Running setscene task 1296 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_package_setscene)
NOTE: Running setscene task 1297 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_package_write_ipk_setscene)
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libupnp-1.6.5-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.28.7-r3: task do_package_setscene: Succeeded
NOTE: recipe faad2-2.7-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1298 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_populate_lic_setscene)
NOTE: Running setscene task 1299 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_packagedata_setscene)
NOTE: Running setscene task 1300 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_package_setscene)
NOTE: Running setscene task 1301 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_package_setscene)
NOTE: Running setscene task 1302 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_package_write_ipk_setscene)
NOTE: recipe libffi-3.0.11-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1303 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_packagedata_setscene)
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_package_setscene: Started
NOTE: recipe faad2-2.7-r1: task do_package_setscene: Started
NOTE: recipe libupnp-1.6.5-r1: task do_package_setscene: Started
NOTE: recipe fontconfig-2.10.2-r1: task do_populate_lic_setscene: Started
NOTE: recipe libffi-3.0.11-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe fontconfig-2.10.2-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1304 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_package_write_ipk_setscene)
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe jpeg-8d-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1305 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_package_setscene)
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_package_setscene: Succeeded
NOTE: recipe fontconfig-2.10.2-r1: task do_populate_lic_setscene: Succeeded
NOTE: recipe fontconfig-2.10.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1306 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_packagedata_setscene)
NOTE: Running setscene task 1307 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_package_write_ipk_setscene)
NOTE: recipe pixman-1_0.28.2-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1308 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_packagedata_setscene)
NOTE: recipe jpeg-8d-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1309 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_package_setscene)
NOTE: recipe libupnp-1.6.5-r1: task do_package_setscene: Succeeded
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_package_setscene: Started
NOTE: recipe faad2-2.7-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1310 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1311 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_package_write_ipk_setscene)
NOTE: recipe pixman-1_0.28.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe fontconfig-2.10.2-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1312 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_packagedata_setscene)
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1313 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_package_write_ipk_setscene)
NOTE: recipe pixman-1_0.28.2-r1: task do_packagedata_setscene: Started
NOTE: recipe python-2.7.3-r5.2: task do_packagedata_setscene: Started
NOTE: recipe gnutls-2.12.21-r8.4: task do_package_write_ipk_setscene: Started
NOTE: recipe libproxy-0.4.7-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_package_write_ipk_setscene: Started
NOTE: recipe jpeg-8d-r1: task do_package_setscene: Started
NOTE: recipe libtirpc-0.2.2-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libproxy-0.4.7-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1314 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_packagedata_setscene)
NOTE: Running setscene task 1315 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_packagedata_setscene)
NOTE: recipe libtirpc-0.2.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1316 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_packagedata_setscene)
NOTE: recipe pixman-1_0.28.2-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.10.2-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1317 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_package_setscene)
NOTE: recipe gnutls-2.12.21-r8.4: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1318 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_package_setscene)
NOTE: Running setscene task 1319 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_packagedata_setscene)
NOTE: recipe libproxy-0.4.7-r5: task do_packagedata_setscene: Started
NOTE: recipe python-2.7.3-r5.2: task do_packagedata_setscene: Succeeded
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-0.2.2-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1320 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_package_setscene)
NOTE: recipe fontconfig-2.10.2-r1: task do_package_setscene: Started
NOTE: recipe pixman-1_0.28.2-r1: task do_package_setscene: Started
NOTE: recipe gnutls-2.12.21-r8.4: task do_packagedata_setscene: Started
NOTE: recipe libproxy-0.4.7-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe jpeg-8d-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1321 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1322 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_package_setscene)
NOTE: Running setscene task 1323 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_package_setscene)
NOTE: recipe pixman-1_0.28.2-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1324 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_packagedata_setscene)
NOTE: recipe libtirpc-0.2.2-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-2.12.21-r8.4: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1325 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_package_setscene)
NOTE: Running setscene task 1326 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_package_setscene)
NOTE: recipe python-2.7.3-r5.2: task do_package_setscene: Started
NOTE: recipe quota-4.01-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_package_setscene: Started
NOTE: recipe libproxy-0.4.7-r5: task do_package_setscene: Started
NOTE: recipe libpng-1.5.13-r2: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-0.2.2-r1: task do_package_setscene: Started
NOTE: recipe gnutls-2.12.21-r8.4: task do_package_setscene: Started
NOTE: recipe libproxy-0.4.7-r5: task do_package_setscene: Succeeded
NOTE: recipe libpng-1.5.13-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1327 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1328 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_package_setscene)
NOTE: recipe quota-4.01-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtirpc-0.2.2-r1: task do_package_setscene: Succeeded
NOTE: recipe fontconfig-2.10.2-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1329 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_packagedata_setscene)
NOTE: Running setscene task 1330 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_packagedata_setscene)
NOTE: Running setscene task 1331 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_package_write_ipk_setscene)
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_package_setscene: Succeeded
NOTE: Running setscene task 1332 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_package_write_ipk_setscene)
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe freetype-2.4.11-r0: task do_packagedata_setscene: Started
NOTE: recipe quota-4.01-r1: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.5.13-r2: task do_package_setscene: Started
NOTE: recipe dbus-glib-0.100-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe freetype-2.4.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe quota-4.01-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1333 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1334 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_package_setscene)
NOTE: Running setscene task 1335 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_package_setscene)
NOTE: recipe libpng-1.5.13-r2: task do_package_setscene: Succeeded
NOTE: recipe libcheck-0.9.9-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1336 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_package_write_ipk_setscene)
NOTE: recipe dbus-glib-0.100-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1337 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_package_write_ipk_setscene)
NOTE: recipe quota-4.01-r1: task do_package_setscene: Started
NOTE: recipe libcheck-0.9.9-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gnutls-2.12.21-r8.4: task do_package_setscene: Succeeded
NOTE: Running setscene task 1338 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1339 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_package_write_ipk_setscene)
NOTE: recipe libnl-1_3.2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe freetype-2.4.11-r0: task do_package_setscene: Started
NOTE: recipe libsamplerate0-0.1.8-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe quota-4.01-r1: task do_package_setscene: Succeeded
NOTE: recipe libdca-0.0.5-5-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1340 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_package_write_ipk_setscene)
NOTE: recipe libgcrypt-1.5.0-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe libnl-1_3.2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe fuse-2.9.2-r1: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 1341 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_packagedata_setscene)
NOTE: recipe mtd-utils-1.5.0-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe libnl-1_3.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libdca-0.0.5-5-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1342 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_packagedata_setscene)
NOTE: recipe fuse-2.9.2-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libgcrypt-1.5.0-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libnl-1_3.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1343 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_packagedata_setscene)
NOTE: Running setscene task 1344 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_package_setscene)
NOTE: Running setscene task 1345 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_packagedata_setscene)
NOTE: recipe libsamplerate0-0.1.8-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libdca-0.0.5-5-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1346 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_packagedata_setscene)
NOTE: recipe fuse-2.9.2-r1: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.2.21-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.5.0-r2: task do_packagedata_setscene: Started
NOTE: recipe libsamplerate0-0.1.8-r1: task do_packagedata_setscene: Started
NOTE: recipe libdca-0.0.5-5-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe mtd-utils-1.5.0-r5: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1347 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_packagedata_setscene)
NOTE: Running setscene task 1348 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_package_setscene)
NOTE: recipe freetype-2.4.11-r0: task do_package_setscene: Succeeded
NOTE: recipe libgcrypt-1.5.0-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe libsamplerate0-0.1.8-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1349 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_package_setscene)
NOTE: Running setscene task 1350 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_package_write_ipk_setscene)
NOTE: recipe fuse-2.9.2-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1351 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_package_setscene)
NOTE: Running setscene task 1352 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_package_setscene)
NOTE: recipe libnl-1_3.2.21-r0: task do_package_setscene: Succeeded
NOTE: recipe mtd-utils-1.5.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 1353 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_package_write_ipk_setscene)
NOTE: recipe libdca-0.0.5-5-r1: task do_package_setscene: Started
NOTE: recipe bluez-hcidump-2.5-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libsamplerate0-0.1.8-r1: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.5.0-r2: task do_package_setscene: Started
NOTE: recipe mtd-utils-1.5.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1354 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_package_setscene)
NOTE: recipe fuse-2.9.2-r1: task do_package_setscene: Started
NOTE: recipe libdca-0.0.5-5-r1: task do_package_setscene: Succeeded
NOTE: recipe bluez-hcidump-2.5-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1355 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_package_write_ipk_setscene)
NOTE: Running setscene task 1356 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_packagedata_setscene)
NOTE: recipe bash-4.2-r6: task do_package_write_ipk_setscene: Started
NOTE: recipe fuse-2.9.2-r1: task do_package_setscene: Succeeded
NOTE: recipe mtd-utils-1.5.0-r5: task do_package_setscene: Started
NOTE: Running setscene task 1357 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_package_write_ipk_setscene)
NOTE: recipe libgcrypt-1.5.0-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1358 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_packagedata_setscene)
NOTE: recipe gawk-4.0.1-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe bluez-hcidump-2.5-r1: task do_packagedata_setscene: Started
NOTE: recipe xz-5.1.2alpha-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libcap-2.22-r5: task do_packagedata_setscene: Started
NOTE: recipe libsamplerate0-0.1.8-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1359 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_packagedata_setscene)
NOTE: recipe bash-4.2-r6: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1360 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_packagedata_setscene)
NOTE: recipe flac-1.2.1-r4: task do_packagedata_setscene: Started
NOTE: recipe bash-4.2-r6: task do_packagedata_setscene: Started
NOTE: recipe xz-5.1.2alpha-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1361 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_packagedata_setscene)
NOTE: recipe gawk-4.0.1-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bluez-hcidump-2.5-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.22-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1362 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_packagedata_setscene)
NOTE: Running setscene task 1363 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_package_setscene)
NOTE: recipe mtd-utils-1.5.0-r5: task do_package_setscene: Succeeded
NOTE: Running setscene task 1364 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_packagedata_setscene)
NOTE: Running setscene task 1365 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_package_setscene)
NOTE: recipe flac-1.2.1-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-4.2-r6: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1366 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_package_setscene)
NOTE: Running setscene task 1367 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_package_setscene)
NOTE: recipe gawk-4.0.1-r1: task do_packagedata_setscene: Started
NOTE: recipe xz-5.1.2alpha-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.42.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.22-r5: task do_package_setscene: Started
NOTE: recipe bluez-hcidump-2.5-r1: task do_package_setscene: Started
NOTE: recipe flac-1.2.1-r4: task do_package_setscene: Started
NOTE: recipe gawk-4.0.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.42.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-4.2-r6: task do_package_setscene: Started
NOTE: Running setscene task 1368 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_package_setscene)
NOTE: Running setscene task 1369 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_package_setscene)
NOTE: recipe xz-5.1.2alpha-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1370 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_package_setscene)
NOTE: recipe python-2.7.3-r5.2: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.22-r5: task do_package_setscene: Succeeded
NOTE: Running setscene task 1371 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_packagedata_setscene)
NOTE: Running setscene task 1372 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_packagedata_setscene)
NOTE: recipe xz-5.1.2alpha-r0: task do_package_setscene: Started
NOTE: recipe bluez-hcidump-2.5-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1373 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_packagedata_setscene)
NOTE: recipe gawk-4.0.1-r1: task do_package_setscene: Started
NOTE: recipe openssl-0.9.8x-r15.0: task do_packagedata_setscene: Started
NOTE: recipe bash-4.2-r6: task do_package_setscene: Succeeded
NOTE: Running setscene task 1374 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_packagedata_setscene)
NOTE: recipe bzip2-1.0.6-r5: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.42.6-r0: task do_package_setscene: Started
NOTE: recipe db-5.3.21-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.1.2alpha-r0: task do_package_setscene: Succeeded
NOTE: recipe openssl-0.9.8x-r15.0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.10-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 1375 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_packagedata_setscene)
NOTE: Running setscene task 1376 of 1446 (/media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_package_setscene)
NOTE: recipe flac-1.2.1-r4: task do_package_setscene: Succeeded
NOTE: Running setscene task 1377 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_packagedata_setscene)
NOTE: recipe bluez4-4.101-r6: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.6-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1378 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_package_setscene)
NOTE: recipe libogg-1.3.0-r1: task do_packagedata_setscene: Started
NOTE: recipe gawk-4.0.1-r1: task do_package_setscene: Succeeded
NOTE: recipe db-5.3.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.10-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1379 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_packagedata_setscene)
NOTE: Running setscene task 1380 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_package_setscene)
NOTE: Running setscene task 1381 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_package_setscene)
NOTE: recipe bluez4-4.101-r6: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-0.9.8x-r15.0: task do_package_setscene: Started
NOTE: recipe libogg-1.3.0-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1382 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_package_setscene)
NOTE: Running setscene task 1383 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_package_setscene)
NOTE: recipe bzip2-1.0.6-r5: task do_package_setscene: Started
NOTE: recipe e2fsprogs-1.42.6-r0: task do_package_setscene: Succeeded
NOTE: recipe db-5.3.21-r0: task do_package_setscene: Started
NOTE: Running setscene task 1384 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_packagedata_setscene)
NOTE: recipe gdbm-1.10-r3: task do_package_setscene: Started
NOTE: recipe attr-2.4.46-r4: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.6-r5: task do_package_setscene: Succeeded
NOTE: Running setscene task 1385 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_package_write_ipk_setscene)
NOTE: recipe attr-2.4.46-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.10-r3: task do_package_setscene: Succeeded
NOTE: recipe bluez4-4.101-r6: task do_package_setscene: Started
NOTE: recipe libogg-1.3.0-r1: task do_package_setscene: Started
NOTE: Running setscene task 1386 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_package_setscene)
NOTE: Running setscene task 1387 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_package_write_ipk_setscene)
NOTE: recipe util-macros-1_1.17-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe util-linux-2.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.17-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe lzo-2.06-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libogg-1.3.0-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1388 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_packagedata_setscene)
NOTE: recipe attr-2.4.46-r4: task do_package_setscene: Started
NOTE: Running setscene task 1389 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_package_write_ipk_setscene)
NOTE: recipe lzo-2.06-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1390 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_packagedata_setscene)
NOTE: recipe util-linux-2.22.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1391 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_package_setscene)
NOTE: recipe util-macros-1_1.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-2.14-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe bluez4-4.101-r6: task do_package_setscene: Succeeded
NOTE: Running setscene task 1392 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_packagedata_setscene)
NOTE: recipe attr-2.4.46-r4: task do_package_setscene: Succeeded
NOTE: recipe lzo-2.06-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1393 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_packagedata_setscene)
NOTE: recipe util-linux-2.22.2-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-2.14-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1394 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_packagedata_setscene)
NOTE: Running setscene task 1395 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_package_setscene)
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_packagedata_setscene: Started
NOTE: recipe openssl-0.9.8x-r15.0: task do_package_setscene: Succeeded
NOTE: recipe dbus-glib-0.100-r2: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.06-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1396 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_packagedata_setscene)
NOTE: Running setscene task 1397 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_package_setscene)
NOTE: recipe libcheck-0.9.9-r1: task do_packagedata_setscene: Started
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1398 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_package_setscene)
NOTE: recipe util-macros-1_1.17-r0: task do_package_setscene: Started
NOTE: recipe libtasn1-2.14-r1: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.06-r1: task do_package_setscene: Started
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_package_setscene: Started
NOTE: recipe dbus-glib-0.100-r2: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.9.9-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.17-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1399 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_package_setscene)
NOTE: Running setscene task 1400 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_package_setscene)
NOTE: Running setscene task 1401 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_package_write_ipk_setscene)
NOTE: recipe lzo-2.06-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1402 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_package_write_ipk_setscene)
NOTE: recipe libtasn1-2.14-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1403 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_package_setscene)
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1404 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_package_write_ipk_setscene)
NOTE: recipe libcheck-0.9.9-r1: task do_package_setscene: Started
NOTE: recipe libusb1-1.0.9-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libtasn1-2.14-r1: task do_package_setscene: Started
NOTE: recipe dbus-glib-0.100-r2: task do_package_setscene: Started
NOTE: recipe libsndfile1-1.0.25-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe libcheck-0.9.9-r1: task do_package_setscene: Succeeded
NOTE: recipe libgpg-error-1.10-r2: task do_package_write_ipk_setscene: Started
NOTE: recipe libusb1-1.0.9-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe util-linux-2.22.2-r0: task do_package_setscene: Succeeded
NOTE: recipe dbus-glib-0.100-r2: task do_package_setscene: Succeeded
NOTE: Running setscene task 1405 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_packagedata_setscene)
NOTE: recipe libsndfile1-1.0.25-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtasn1-2.14-r1: task do_package_setscene: Succeeded
NOTE: recipe libgpg-error-1.10-r2: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1406 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_packagedata_setscene)
NOTE: Running setscene task 1407 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_packagedata_setscene)
NOTE: Running setscene task 1408 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_packagedata_setscene)
NOTE: Running setscene task 1409 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_packagedata_setscene)
NOTE: recipe libusb1-1.0.9-r1: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.10-r2: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.6.8-r5.0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.0.25-r1: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.9-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.6.8-r5.0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.10-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1410 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_package_setscene)
NOTE: Running setscene task 1411 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_package_setscene)
NOTE: Running setscene task 1412 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_package_setscene)
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1413 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_package_setscene)
NOTE: recipe libusb1-1.0.9-r1: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.10-r2: task do_package_setscene: Started
NOTE: recipe libsndfile1-1.0.25-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1414 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_package_setscene)
NOTE: recipe libusb1-1.0.9-r1: task do_package_setscene: Succeeded
NOTE: recipe dbus-1.6.8-r5.0: task do_package_setscene: Started
NOTE: recipe libsndfile1-1.0.25-r1: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.10-r2: task do_package_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.25-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1415 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_packagedata_setscene)
NOTE: Running setscene task 1416 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_packagedata_setscene)
NOTE: recipe alsa-lib-1.0.25-r3: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.6.8-r5.0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1417 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_packagedata_setscene)
NOTE: Running setscene task 1418 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_packagedata_setscene)
NOTE: Running setscene task 1419 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_packagedata_setscene)
NOTE: recipe sqlite3-3.7.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.26-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.0.25-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3.7.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.1.4.3-r13: task do_packagedata_setscene: Started
NOTE: Running setscene task 1420 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_package_setscene)
NOTE: Running setscene task 1421 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_package_setscene)
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1422 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_package_setscene)
NOTE: recipe base-passwd-3.5.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.1.4.3-r13: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.0.25-r3: task do_package_setscene: Started
NOTE: Running setscene task 1423 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_package_setscene)
NOTE: Running setscene task 1424 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_package_setscene)
NOTE: recipe sqlite3-3.7.15.2-r0: task do_package_setscene: Started
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_package_setscene: Started
NOTE: recipe base-passwd-3.5.26-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.1.4.3-r13: task do_package_setscene: Started
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_package_setscene: Succeeded
NOTE: recipe sqlite3-3.7.15.2-r0: task do_package_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_package_setscene: Succeeded
NOTE: recipe db-5.3.21-r0: task do_package_setscene: Succeeded
NOTE: recipe base-passwd-3.5.26-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1425 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_packagedata_setscene)
NOTE: Running setscene task 1426 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_packagedata_setscene)
NOTE: Running setscene task 1427 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_packagedata_setscene)
NOTE: recipe zlib-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-6.2-r4: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.0.11-r1: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-6.2-r4: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.0.25-r3: task do_package_setscene: Succeeded
NOTE: Running setscene task 1428 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_package_setscene)
NOTE: Running setscene task 1429 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_package_setscene)
NOTE: recipe libffi-3.0.11-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1430 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_package_setscene)
NOTE: recipe zlib-1.2.7-r0: task do_package_setscene: Started
NOTE: recipe readline-6.2-r4: task do_package_setscene: Started
NOTE: recipe libffi-3.0.11-r1: task do_package_setscene: Started
NOTE: recipe readline-6.2-r4: task do_package_setscene: Succeeded
NOTE: recipe zlib-1.2.7-r0: task do_package_setscene: Succeeded
NOTE: recipe libffi-3.0.11-r1: task do_package_setscene: Succeeded
NOTE: recipe shadow-4.1.4.3-r13: task do_package_setscene: Succeeded
NOTE: Running setscene task 1431 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_packagedata_setscene)
NOTE: recipe gettext-0.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gettext-0.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1432 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_package_setscene)
NOTE: recipe gettext-0.18.2-r0: task do_package_setscene: Started
NOTE: recipe gettext-0.18.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1433 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_packagedata_setscene)
NOTE: Running setscene task 1434 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_packagedata_setscene)
NOTE: recipe ncurses-5.9-r13.1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-5.9-r13.1: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1435 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_package_setscene)
NOTE: Running setscene task 1436 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_package_setscene)
NOTE: recipe ncurses-5.9-r13.1: task do_package_setscene: Started
NOTE: recipe expat-2.1.0-r0: task do_package_setscene: Started
NOTE: recipe expat-2.1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe ncurses-5.9-r13.1: task do_package_setscene: Succeeded
NOTE: Running setscene task 1437 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_packagedata_setscene)
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_packagedata_setscene: Started
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1438 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_package_setscene)
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_package_setscene: Started
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1439 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_packagedata_setscene)
NOTE: Running setscene task 1440 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-4.7.2-r17: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1441 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_package_setscene)
NOTE: recipe gcc-runtime-4.7.2-r17: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1442 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_package_setscene)
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_package_setscene: Started
NOTE: recipe gcc-runtime-4.7.2-r17: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_package_setscene: Succeeded
NOTE: recipe gcc-runtime-4.7.2-r17: task do_package_setscene: Succeeded
NOTE: Running setscene task 1443 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_packagedata_setscene)
NOTE: recipe libgcc-4.7.2-r17: task do_packagedata_setscene: Started
NOTE: recipe libgcc-4.7.2-r17: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1444 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_package_setscene)
NOTE: recipe libgcc-4.7.2-r17: task do_package_setscene: Started
NOTE: recipe libgcc-4.7.2-r17: task do_package_setscene: Succeeded
NOTE: Running setscene task 1445 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_packagedata_setscene)
NOTE: recipe eglibc-2.17-r3: task do_packagedata_setscene: Started
NOTE: recipe eglibc-2.17-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1446 of 1446 (/media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_package_setscene)
NOTE: recipe eglibc-2.17-r3: task do_package_setscene: Started
NOTE: recipe eglibc-2.17-r3: task do_package_setscene: Succeeded
NOTE: Executing RunQueue Tasks
NOTE: Running noexec task 367 of 4065 (ID: 1297, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_4.7.bb, do_package_write)
NOTE: Running noexec task 369 of 4065 (ID: 1300, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_4.7.bb, do_build)
NOTE: Running task 370 of 4065 (ID: 1301, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_4.7.bb, do_rm_work)
NOTE: Running noexec task 658 of 4065 (ID: 1283, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_package_write)
NOTE: Running noexec task 660 of 4065 (ID: 1286, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_build)
NOTE: Running task 661 of 4065 (ID: 1287, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb, do_rm_work)
NOTE: Running noexec task 1073 of 4065 (ID: 40, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_package_write)
NOTE: Running noexec task 1075 of 4065 (ID: 2586, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_package_write)
NOTE: Running noexec task 1077 of 4065 (ID: 1311, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_package_write)
NOTE: Running noexec task 1079 of 4065 (ID: 54, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_package_write)
NOTE: Running noexec task 1081 of 4065 (ID: 1899, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_package_write)
NOTE: Running noexec task 1083 of 4065 (ID: 1885, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_package_write)
NOTE: Running noexec task 1085 of 4065 (ID: 2025, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_package_write)
NOTE: Running noexec task 1087 of 4065 (ID: 1997, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_package_write)
NOTE: Running noexec task 1089 of 4065 (ID: 3441, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_package_write)
NOTE: Running noexec task 1091 of 4065 (ID: 2291, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_package_write)
NOTE: Running noexec task 1093 of 4065 (ID: 1955, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_package_write)
NOTE: Running noexec task 1095 of 4065 (ID: 1661, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_package_write)
NOTE: Running noexec task 1097 of 4065 (ID: 2081, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_package_write)
NOTE: Running noexec task 1099 of 4065 (ID: 3413, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_package_write)
NOTE: Running noexec task 1106 of 4065 (ID: 43, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_build)
NOTE: Running task 1107 of 4065 (ID: 44, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.17.bb, do_rm_work)
NOTE: Running noexec task 1108 of 4065 (ID: 2589, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_build)
NOTE: Running task 1109 of 4065 (ID: 2590, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_rm_work)
NOTE: Running noexec task 1110 of 4065 (ID: 1314, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_build)
NOTE: Running task 1111 of 4065 (ID: 1315, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_4.7.bb, do_rm_work)
NOTE: Running noexec task 1112 of 4065 (ID: 1902, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_build)
NOTE: Running task 1113 of 4065 (ID: 1903, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/expat/expat_2.1.0.bb, do_rm_work)
NOTE: Running noexec task 1114 of 4065 (ID: 2028, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_build)
NOTE: Running task 1115 of 4065 (ID: 2029, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.7.bb, do_rm_work)
NOTE: Running noexec task 1116 of 4065 (ID: 3444, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_build)
NOTE: Running task 1117 of 4065 (ID: 3445, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/libffi/libffi_3.0.11.bb, do_rm_work)
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_rm_work: Started
NOTE: recipe gcc-cross-4.7.2-r17: task do_rm_work: Started
NOTE: recipe gcc-cross-4.7.2-r17: task do_rm_work: Succeeded
NOTE: Running noexec task 1118 of 4065 (ID: 2294, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_build)
NOTE: Running task 1119 of 4065 (ID: 2295, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.0.bb, do_rm_work)
NOTE: recipe gcc-runtime-4.7.2-r17: task do_rm_work: Started
NOTE: recipe libtool-cross-2.4.2-r6.1: task do_rm_work: Succeeded
NOTE: recipe libgcc-4.7.2-r17: task do_rm_work: Started
NOTE: recipe zlib-1.2.7-r0: task do_rm_work: Started
NOTE: Running noexec task 1120 of 4065 (ID: 1664, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_build)
NOTE: Running task 1121 of 4065 (ID: 1665, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/openssl/openssl_0.9.8x.bb, do_rm_work)
NOTE: recipe eglibc-2.17-r3: task do_rm_work: Started
NOTE: recipe expat-2.1.0-r0: task do_rm_work: Started
NOTE: recipe zlib-1.2.7-r0: task do_rm_work: Succeeded
NOTE: recipe libffi-3.0.11-r1: task do_rm_work: Started
NOTE: recipe gcc-runtime-4.7.2-r17: task do_rm_work: Succeeded
NOTE: recipe libogg-1.3.0-r1: task do_rm_work: Started
NOTE: Running noexec task 1135 of 4065 (ID: 1633, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_package_write)
NOTE: Running noexec task 1137 of 4065 (ID: 1636, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_build)
NOTE: Running task 1138 of 4065 (ID: 1637, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/libxml/libxml2_2.9.0.bb, do_rm_work)
NOTE: recipe libgcc-4.7.2-r17: task do_rm_work: Succeeded
NOTE: Running noexec task 1149 of 4065 (ID: 1493, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_package_write)
NOTE: Running noexec task 1151 of 4065 (ID: 1496, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_build)
NOTE: Running task 1152 of 4065 (ID: 1497, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/freetype/freetype_2.4.11.bb, do_rm_work)
NOTE: Running noexec task 1163 of 4065 (ID: 2235, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_package_write)
NOTE: Running noexec task 1175 of 4065 (ID: 2221, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_package_write)
NOTE: Running noexec task 1177 of 4065 (ID: 2224, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_build)
NOTE: Running task 1178 of 4065 (ID: 2225, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/db/db_5.3.21.bb, do_rm_work)
NOTE: recipe openssl-0.9.8x-r15.0: task do_rm_work: Started
NOTE: recipe expat-2.1.0-r0: task do_rm_work: Succeeded
NOTE: recipe libxml2-2.9.0-r1.1: task do_rm_work: Started
NOTE: recipe freetype-2.4.11-r0: task do_rm_work: Started
NOTE: recipe libffi-3.0.11-r1: task do_rm_work: Succeeded
NOTE: recipe openssl-0.9.8x-r15.0: task do_rm_work: Succeeded
NOTE: recipe libogg-1.3.0-r1: task do_rm_work: Succeeded
NOTE: recipe db-5.3.21-r0: task do_rm_work: Started
NOTE: recipe eglibc-2.17-r3: task do_rm_work: Succeeded
NOTE: recipe libxml2-2.9.0-r1.1: task do_rm_work: Succeeded
NOTE: recipe freetype-2.4.11-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 1189 of 4065 (ID: 2207, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_package_write)
NOTE: Running noexec task 1202 of 4065 (ID: 547, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_package_write)
NOTE: Running noexec task 1214 of 4065 (ID: 1913, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_package_write)
NOTE: Running noexec task 1226 of 4065 (ID: 1843, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_package_write)
NOTE: Running noexec task 1228 of 4065 (ID: 1846, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_build)
NOTE: Running task 1229 of 4065 (ID: 1847, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb, do_rm_work)
NOTE: recipe db-5.3.21-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 1240 of 4065 (ID: 931, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_package_write)
NOTE: Running noexec task 1266 of 4065 (ID: 1507, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_package_write)
NOTE: Running noexec task 1278 of 4065 (ID: 4003, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_package_write)
NOTE: Running noexec task 1290 of 4065 (ID: 1591, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_package_write)
NOTE: Running noexec task 1292 of 4065 (ID: 1594, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_build)
NOTE: Running task 1293 of 4065 (ID: 1595, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.5.13.bb, do_rm_work)
NOTE: Running noexec task 1304 of 4065 (ID: 1535, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_package_write)
NOTE: Running noexec task 1306 of 4065 (ID: 1538, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_build)
NOTE: Running task 1307 of 4065 (ID: 1539, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/jpeg/jpeg_8d.bb, do_rm_work)
NOTE: Running noexec task 1318 of 4065 (ID: 889, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_package_write)
NOTE: Running noexec task 1320 of 4065 (ID: 892, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_build)
NOTE: Running task 1321 of 4065 (ID: 893, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb, do_rm_work)
NOTE: Running noexec task 1332 of 4065 (ID: 3737, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_package_write)
NOTE: Running noexec task 1344 of 4065 (ID: 2333, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_package_write)
NOTE: Running noexec task 1346 of 4065 (ID: 2336, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_build)
NOTE: Running task 1347 of 4065 (ID: 2337, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/tremor/tremor_20120314.bb, do_rm_work)
NOTE: Running noexec task 1358 of 4065 (ID: 2305, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_package_write)
NOTE: Running noexec task 1360 of 4065 (ID: 2308, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_build)
NOTE: Running task 1361 of 4065 (ID: 2309, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb, do_rm_work)
NOTE: Running noexec task 1382 of 4065 (ID: 1871, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_package_write)
NOTE: Running noexec task 1384 of 4065 (ID: 1874, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_build)
NOTE: Running task 1385 of 4065 (ID: 1875, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb, do_rm_work)
NOTE: Running noexec task 1424 of 4065 (ID: 2361, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_package_write)
NOTE: Running noexec task 1426 of 4065 (ID: 2364, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_build)
NOTE: Running task 1427 of 4065 (ID: 2365, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/orc/orc_0.4.16.bb, do_rm_work)
NOTE: recipe base-passwd-3.5.26-r0: task do_rm_work: Started
NOTE: recipe libpng-1.5.13-r2: task do_rm_work: Started
NOTE: recipe libvorbis-1.3.3-r1: task do_rm_work: Started
NOTE: recipe jpeg-8d-r1: task do_rm_work: Started
NOTE: recipe alsa-lib-1.0.25-r3: task do_rm_work: Started
NOTE: recipe tremor-20120314-r1: task do_rm_work: Started
NOTE: recipe base-passwd-3.5.26-r0: task do_rm_work: Succeeded
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_rm_work: Started
NOTE: recipe libpng-1.5.13-r2: task do_rm_work: Succeeded
NOTE: recipe jpeg-8d-r1: task do_rm_work: Succeeded
NOTE: recipe alsa-lib-1.0.25-r3: task do_rm_work: Succeeded
NOTE: recipe tremor-20120314-r1: task do_rm_work: Succeeded
NOTE: recipe libvorbis-1.3.3-r1: task do_rm_work: Succeeded
NOTE: recipe orc-0.4.16-r0.0: task do_rm_work: Started
NOTE: Running noexec task 1438 of 4065 (ID: 2347, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_package_write)
NOTE: Running noexec task 1440 of 4065 (ID: 2350, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_build)
NOTE: Running task 1441 of 4065 (ID: 2351, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/cdparanoia/cdparanoia_svn.bb, do_rm_work)
NOTE: Running noexec task 1452 of 4065 (ID: 2319, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_package_write)
NOTE: Running noexec task 1454 of 4065 (ID: 2322, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_build)
NOTE: Running task 1455 of 4065 (ID: 2323, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb, do_rm_work)
NOTE: recipe shadow-sysroot-4.1.4.3-r3: task do_rm_work: Succeeded
NOTE: Running noexec task 1466 of 4065 (ID: 2277, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_package_write)
NOTE: Running noexec task 1482 of 4065 (ID: 3933, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_package_write)
NOTE: Running noexec task 1484 of 4065 (ID: 3936, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_build)
NOTE: Running task 1485 of 4065 (ID: 3937, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/lzo/lzo_2.06.bb, do_rm_work)
NOTE: Running noexec task 1496 of 4065 (ID: 3947, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_package_write)
NOTE: Running noexec task 1498 of 4065 (ID: 3950, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_build)
NOTE: Running task 1499 of 4065 (ID: 3951, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/libtasn1_2.14.bb, do_rm_work)
NOTE: Running noexec task 1510 of 4065 (ID: 2403, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_package_write)
NOTE: Running noexec task 1512 of 4065 (ID: 2406, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_build)
NOTE: Running task 1513 of 4065 (ID: 2407, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb, do_rm_work)
NOTE: Running noexec task 1552 of 4065 (ID: 3399, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_package_write)
NOTE: Running noexec task 1554 of 4065 (ID: 3402, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_build)
NOTE: Running task 1555 of 4065 (ID: 3403, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdread/libdvdread_svn.bb, do_rm_work)
NOTE: Running noexec task 1566 of 4065 (ID: 1043, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_package_write)
NOTE: Running noexec task 1592 of 4065 (ID: 3891, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_package_write)
NOTE: Running noexec task 1642 of 4065 (ID: 3511, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_package_write)
NOTE: Running noexec task 1659 of 4065 (ID: 2263, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_package_write)
NOTE: Running noexec task 1661 of 4065 (ID: 2266, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_build)
NOTE: Running task 1662 of 4065 (ID: 2267, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvdnav/libdvdnav_svn.bb, do_rm_work)
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_rm_work: Started
NOTE: recipe orc-0.4.16-r0.0: task do_rm_work: Succeeded
NOTE: Running noexec task 1673 of 4065 (ID: 3357, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_package_write)
NOTE: Running noexec task 1675 of 4065 (ID: 3360, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_build)
NOTE: Running task 1676 of 4065 (ID: 3361, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/libtuxtxt.bb, do_rm_work)
NOTE: recipe libtheora-1.1.1-r1: task do_rm_work: Started
NOTE: recipe libtasn1-2.14-r1: task do_rm_work: Started
NOTE: recipe libtasn1-2.14-r1: task do_rm_work: Succeeded
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_rm_work: Started
NOTE: recipe cdparanoia-10.2+svnr17289-r1: task do_rm_work: Succeeded
NOTE: recipe libid3tag-0.15.1b-r7: task do_rm_work: Started
NOTE: Running noexec task 1687 of 4065 (ID: 3343, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_package_write)
NOTE: Running noexec task 1699 of 4065 (ID: 1577, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_package_write)
NOTE: Running noexec task 1701 of 4065 (ID: 1580, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_build)
NOTE: Running task 1702 of 4065 (ID: 1581, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb, do_rm_work)
NOTE: recipe lzo-2.06-r1: task do_rm_work: Started
NOTE: Running noexec task 1748 of 4065 (ID: 3526, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_package_write)
NOTE: Running noexec task 1751 of 4065 (ID: 3529, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_build)
NOTE: Running task 1752 of 4065 (ID: 3530, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libproxy/libproxy_0.4.7.bb, do_rm_work)
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_rm_work: Started
NOTE: recipe libdvdnav-4.2.0+svnr1243-r1: task do_rm_work: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_rm_work: Succeeded
NOTE: recipe libid3tag-0.15.1b-r7: task do_rm_work: Succeeded
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_rm_work: Started
NOTE: Running noexec task 1766 of 4065 (ID: 3919, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_package_write)
NOTE: Running noexec task 1768 of 4065 (ID: 3922, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_build)
NOTE: Running task 1769 of 4065 (ID: 3923, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.17.bb, do_rm_work)
NOTE: Running noexec task 1780 of 4065 (ID: 987, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_package_write)
NOTE: Running noexec task 1782 of 4065 (ID: 990, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_build)
NOTE: Running task 1783 of 4065 (ID: 991, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdreamdvd/libdreamdvd_1.0.bb, do_rm_work)
NOTE: Running noexec task 1794 of 4065 (ID: 903, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_package_write)
NOTE: Running noexec task 1796 of 4065 (ID: 906, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_build)
NOTE: Running task 1797 of 4065 (ID: 907, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/ethtool/ethtool_3.7.bb, do_rm_work)
NOTE: recipe libmad-0.15.1b-r1: task do_rm_work: Started
NOTE: recipe libproxy-0.4.7-r5: task do_rm_work: Started
NOTE: recipe libtuxtxt-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r0: task do_rm_work: Succeeded
NOTE: recipe lzo-2.06-r1: task do_rm_work: Succeeded
NOTE: recipe util-macros-1_1.17-r0: task do_rm_work: Started
NOTE: recipe libdvdread-4.2.0+svnr1243-r1: task do_rm_work: Succeeded
NOTE: recipe libmad-0.15.1b-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 1807 of 4065 (ID: 294, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_package_write)
NOTE: Running noexec task 1810 of 4065 (ID: 297, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_build)
NOTE: Running task 1811 of 4065 (ID: 298, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb, do_rm_work)
NOTE: Running noexec task 1812 of 4065 (ID: 57, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_build)
NOTE: Running task 1813 of 4065 (ID: 58, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/ncurses/ncurses_5.9.bb, do_rm_work)
NOTE: Running noexec task 1814 of 4065 (ID: 1888, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_build)
NOTE: Running task 1815 of 4065 (ID: 1889, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/gettext/gettext_0.18.2.bb, do_rm_work)
NOTE: recipe ethtool-3.7-r0: task do_rm_work: Started
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_rm_work: Started
NOTE: Running noexec task 1816 of 4065 (ID: 2000, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_build)
NOTE: Running task 1817 of 4065 (ID: 2001, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/readline/readline_6.2.bb, do_rm_work)
NOTE: recipe libproxy-0.4.7-r5: task do_rm_work: Succeeded
NOTE: Running noexec task 1818 of 4065 (ID: 1958, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_build)
NOTE: Running task 1819 of 4065 (ID: 1959, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb, do_rm_work)
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_rm_work: Started
NOTE: recipe util-macros-1_1.17-r0: task do_rm_work: Succeeded
NOTE: recipe ncurses-5.9-r13.1: task do_rm_work: Started
NOTE: recipe readline-6.2-r4: task do_rm_work: Started
NOTE: Running noexec task 1820 of 4065 (ID: 2084, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_build)
NOTE: Running task 1821 of 4065 (ID: 2085, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.7.15.2.bb, do_rm_work)
NOTE: recipe ethtool-3.7-r0: task do_rm_work: Succeeded
NOTE: recipe libdreamdvd-1.0+gitAUTOINC+6aa22dd3f530ca4be49946e07e4a0bfe60427bdf-r3: task do_rm_work: Succeeded
NOTE: recipe opkg-1_0.1.8+svnr649-r16.0: task do_rm_work: Succeeded
NOTE: recipe ncurses-5.9-r13.1: task do_rm_work: Succeeded
NOTE: recipe readline-6.2-r4: task do_rm_work: Succeeded
NOTE: Running noexec task 1822 of 4065 (ID: 3416, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_build)
NOTE: Running task 1823 of 4065 (ID: 3417, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/attr/attr_2.4.46.bb, do_rm_work)
NOTE: recipe gettext-0.18.2-r0: task do_rm_work: Started
NOTE: Running noexec task 1824 of 4065 (ID: 2238, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_build)
NOTE: Running task 1825 of 4065 (ID: 2239, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gdbm/gdbm_1.10.bb, do_rm_work)
NOTE: Running noexec task 1826 of 4065 (ID: 2210, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_build)
NOTE: Running task 1827 of 4065 (ID: 2211, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.6.bb, do_rm_work)
NOTE: recipe sqlite3-3.7.15.2-r0: task do_rm_work: Started
NOTE: Running noexec task 1828 of 4065 (ID: 550, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_build)
NOTE: Running task 1829 of 4065 (ID: 551, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/util-linux/util-linux_2.22.2.bb, do_rm_work)
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_rm_work: Started
NOTE: Running noexec task 1830 of 4065 (ID: 1916, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_build)
NOTE: Running task 1831 of 4065 (ID: 1917, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcap/libcap_2.22.bb, do_rm_work)
NOTE: recipe attr-2.4.46-r4: task do_rm_work: Started
NOTE: recipe sqlite3-3.7.15.2-r0: task do_rm_work: Succeeded
NOTE: recipe gdbm-1.10-r3: task do_rm_work: Started
NOTE: recipe gettext-0.18.2-r0: task do_rm_work: Succeeded
NOTE: recipe util-linux-2.22.2-r0: task do_rm_work: Started
NOTE: Running noexec task 1832 of 4065 (ID: 934, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_build)
NOTE: Running task 1833 of 4065 (ID: 935, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_rm_work)
NOTE: recipe glib-2.0-1_2.34.3-r2: task do_rm_work: Succeeded
NOTE: recipe bzip2-1.0.6-r5: task do_rm_work: Started
NOTE: recipe util-linux-2.22.2-r0: task do_rm_work: Succeeded
NOTE: recipe libcap-2.22-r5: task do_rm_work: Started
NOTE: Running noexec task 1834 of 4065 (ID: 1510, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_build)
NOTE: Running task 1835 of 4065 (ID: 1511, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb, do_rm_work)
NOTE: Running noexec task 1836 of 4065 (ID: 4006, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_build)
NOTE: Running task 1837 of 4065 (ID: 4007, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb, do_rm_work)
NOTE: recipe attr-2.4.46-r4: task do_rm_work: Succeeded
NOTE: Running noexec task 1838 of 4065 (ID: 3740, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_build)
NOTE: Running task 1839 of 4065 (ID: 3741, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb, do_rm_work)
NOTE: Running noexec task 1840 of 4065 (ID: 2280, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_build)
NOTE: Running task 1841 of 4065 (ID: 2281, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/liboil/liboil_0.3.17.bb, do_rm_work)
NOTE: recipe libcap-2.22-r5: task do_rm_work: Succeeded
NOTE: recipe bzip2-1.0.6-r5: task do_rm_work: Succeeded
NOTE: Running noexec task 1842 of 4065 (ID: 1046, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_build)
NOTE: Running task 1843 of 4065 (ID: 1047, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_rm_work)
NOTE: Running noexec task 1844 of 4065 (ID: 3894, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_build)
NOTE: Running task 1845 of 4065 (ID: 3895, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/xz/xz_5.1.2alpha.bb, do_rm_work)
NOTE: recipe gstreamer-0.10.36-r4: task do_rm_work: Started
NOTE: recipe python-2.7.3-r5.2: task do_rm_work: Started
NOTE: recipe liboil-0.3.17-r5: task do_rm_work: Started
NOTE: recipe libgcrypt-1.5.0-r2: task do_rm_work: Started
NOTE: recipe gdbm-1.10-r3: task do_rm_work: Succeeded
NOTE: recipe libgpg-error-1.10-r2: task do_rm_work: Started
NOTE: Running noexec task 1846 of 4065 (ID: 3514, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_build)
NOTE: Running task 1847 of 4065 (ID: 3515, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/gnutls/gnutls_2.12.21.bb, do_rm_work)
NOTE: recipe liboil-0.3.17-r5: task do_rm_work: Succeeded
NOTE: recipe xz-5.1.2alpha-r0: task do_rm_work: Started
NOTE: recipe libgpg-error-1.10-r2: task do_rm_work: Succeeded
NOTE: recipe libgcrypt-1.5.0-r2: task do_rm_work: Succeeded
NOTE: recipe gnutls-2.12.21-r8.4: task do_rm_work: Started
NOTE: Running noexec task 1848 of 4065 (ID: 3346, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_build)
NOTE: Running task 1849 of 4065 (ID: 3347, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb, do_rm_work)
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_rm_work: Started
NOTE: Running noexec task 1864 of 4065 (ID: 1717, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_package_write)
NOTE: Running noexec task 1866 of 4065 (ID: 1720, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_build)
NOTE: Running task 1867 of 4065 (ID: 1721, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/tuxtxt/tuxtxt-enigma2.bb, do_rm_work)
NOTE: Running noexec task 1892 of 4065 (ID: 1689, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_package_write)
NOTE: Running noexec task 1894 of 4065 (ID: 1692, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_build)
NOTE: Running task 1895 of 4065 (ID: 1693, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-wifi_0.5.0.bb, do_rm_work)
NOTE: recipe python-2.7.3-r5.2: task do_rm_work: Succeeded
NOTE: recipe gstreamer-0.10.36-r4: task do_rm_work: Succeeded
NOTE: recipe gnutls-2.12.21-r8.4: task do_rm_work: Succeeded
NOTE: Running noexec task 1906 of 4065 (ID: 1675, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_package_write)
NOTE: Running noexec task 1908 of 4065 (ID: 1678, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_build)
NOTE: Running task 1909 of 4065 (ID: 1679, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/python/python-imaging_1.1.7.bb, do_rm_work)
NOTE: Running noexec task 1920 of 4065 (ID: 1647, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_package_write)
NOTE: Running noexec task 1922 of 4065 (ID: 1650, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_build)
NOTE: Running task 1923 of 4065 (ID: 1651, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-support/libxmlccwrap/libxmlccwrap_0.0.12.bb, do_rm_work)
NOTE: Running noexec task 1934 of 4065 (ID: 1619, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_package_write)
NOTE: Running noexec task 1936 of 4065 (ID: 1622, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_build)
NOTE: Running task 1937 of 4065 (ID: 1623, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libungif/libungif_4.1.3.bb, do_rm_work)
NOTE: recipe tiff-4.0.3-r0: task do_rm_work: Started
NOTE: recipe xz-5.1.2alpha-r0: task do_rm_work: Succeeded
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_rm_work: Started
NOTE: recipe gst-plugins-base-0.10.36-r10: task do_rm_work: Succeeded
NOTE: recipe python-wifi-0.5.0-r1: task do_rm_work: Started
NOTE: Running noexec task 1948 of 4065 (ID: 1605, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_package_write)
NOTE: Running noexec task 1950 of 4065 (ID: 1608, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_build)
NOTE: Running task 1951 of 4065 (ID: 1609, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-core/libsigc++-1.2/libsigc++-1.2_1.2.5.bb, do_rm_work)
NOTE: Running noexec task 1962 of 4065 (ID: 1563, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_package_write)
NOTE: Running noexec task 1964 of 4065 (ID: 1566, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_build)
NOTE: Running task 1965 of 4065 (ID: 1567, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb, do_rm_work)
NOTE: recipe python-imaging-1.1.7-r4: task do_rm_work: Started
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_rm_work: Started
NOTE: recipe python-wifi-0.5.0-r1: task do_rm_work: Succeeded
NOTE: recipe libungif-4.1.3-r3: task do_rm_work: Started
NOTE: recipe tiff-4.0.3-r0: task do_rm_work: Succeeded
NOTE: recipe libxmlccwrap-0.0.12-r1: task do_rm_work: Succeeded
NOTE: recipe tuxtxt-enigma2-2.0+gitAUTOINC+90fda7dcc09917491e0f90580c26f3fdb2213ec6-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 1976 of 4065 (ID: 1549, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_package_write)
NOTE: Running noexec task 1978 of 4065 (ID: 1552, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_build)
NOTE: Running task 1979 of 4065 (ID: 1553, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libdvbsi++/libdvbsi++_0.3.6.bb, do_rm_work)
NOTE: recipe python-imaging-1.1.7-r4: task do_rm_work: Succeeded
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_rm_work: Started
NOTE: recipe libungif-4.1.3-r3: task do_rm_work: Succeeded
NOTE: Running noexec task 1997 of 4065 (ID: 1521, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_package_write)
NOTE: Running noexec task 1999 of 4065 (ID: 1524, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_build)
NOTE: Running task 2000 of 4065 (ID: 1525, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/hotplug-e2-helper.bb, do_rm_work)
NOTE: recipe fribidi-0.19.2-r1: task do_rm_work: Started
NOTE: Running noexec task 2025 of 4065 (ID: 3540, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_package_write)
NOTE: Running noexec task 2037 of 4065 (ID: 3497, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_package_write)
NOTE: Running noexec task 2039 of 4065 (ID: 3500, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_build)
NOTE: Running task 2040 of 4065 (ID: 3501, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb, do_rm_work)
NOTE: recipe libsigc++-1.2-1.2.5-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 2051 of 4065 (ID: 3483, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_package_write)
NOTE: Running noexec task 2053 of 4065 (ID: 3486, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_build)
NOTE: Running task 2054 of 4065 (ID: 3487, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_rm_work)
NOTE: recipe fribidi-0.19.2-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2065 of 4065 (ID: 2417, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_package_write)
NOTE: Running noexec task 2067 of 4065 (ID: 2420, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_build)
NOTE: Running task 2068 of 4065 (ID: 2421, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/flac/flac_1.2.1.bb, do_rm_work)
NOTE: Running noexec task 2079 of 4065 (ID: 3975, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_package_write)
NOTE: Running noexec task 2081 of 4065 (ID: 3978, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_build)
NOTE: Running task 2082 of 4065 (ID: 3979, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.9.bb, do_rm_work)
NOTE: Running noexec task 2093 of 4065 (ID: 392, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_package_write)
NOTE: Running noexec task 2095 of 4065 (ID: 395, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_build)
NOTE: Running task 2096 of 4065 (ID: 396, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.6.bb, do_rm_work)
NOTE: Running noexec task 2107 of 4065 (ID: 2571, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_package_write)
NOTE: Running noexec task 2109 of 4065 (ID: 2574, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_build)
NOTE: Running task 2110 of 4065 (ID: 2575, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb, do_rm_work)
NOTE: recipe libdvbsi++-0.3.6-r1: task do_rm_work: Started
NOTE: recipe pixman-1_0.28.2-r1: task do_rm_work: Started
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_rm_work: Started
NOTE: recipe flac-1.2.1-r4: task do_rm_work: Started
NOTE: recipe fontconfig-2.10.2-r1: task do_rm_work: Started
NOTE: recipe libusb1-1.0.9-r1: task do_rm_work: Started
NOTE: recipe e2fsprogs-1.42.6-r0: task do_rm_work: Started
NOTE: recipe libdvbsi++-0.3.6-r1: task do_rm_work: Succeeded
NOTE: recipe hotplug-e2-helper-1.0+gitAUTOINC+b47dc2357a6e5e38bc3a58bc102a1f7a35a12a4e-r0: task do_rm_work: Succeeded
NOTE: recipe pixman-1_0.28.2-r1: task do_rm_work: Succeeded
NOTE: recipe fontconfig-2.10.2-r1: task do_rm_work: Succeeded
NOTE: recipe libusb1-1.0.9-r1: task do_rm_work: Succeeded
NOTE: recipe e2fsprogs-1.42.6-r0: task do_rm_work: Succeeded
NOTE: recipe libcdio-0.82-r0: task do_rm_work: Started
NOTE: recipe flac-1.2.1-r4: task do_rm_work: Succeeded
NOTE: Running noexec task 2120 of 4065 (ID: 1941, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_package_write)
NOTE: Running noexec task 2165 of 4065 (ID: 3638, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_package_write)
NOTE: Running noexec task 2167 of 4065 (ID: 3641, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_build)
NOTE: Running task 2168 of 4065 (ID: 3642, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libusb/libusb-compat_0.1.4.bb, do_rm_work)
NOTE: recipe libcdio-0.82-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 2179 of 4065 (ID: 2557, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_package_write)
NOTE: Running noexec task 2181 of 4065 (ID: 2560, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_build)
NOTE: Running task 2182 of 4065 (ID: 2561, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/opencore-amr/opencore-amr_0.1.2.bb, do_rm_work)
NOTE: Running noexec task 2193 of 4065 (ID: 2543, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_package_write)
NOTE: Running noexec task 2195 of 4065 (ID: 2546, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_build)
NOTE: Running task 2196 of 4065 (ID: 2547, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/lame/lame_3.99.5.bb, do_rm_work)
NOTE: Running noexec task 2207 of 4065 (ID: 2529, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_package_write)
NOTE: Running noexec task 2209 of 4065 (ID: 2532, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_build)
NOTE: Running task 2210 of 4065 (ID: 2533, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/liba52/liba52_0.7.4.bb, do_rm_work)
NOTE: Running noexec task 2221 of 4065 (ID: 2515, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_package_write)
NOTE: Running noexec task 2223 of 4065 (ID: 2518, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_build)
NOTE: Running task 2224 of 4065 (ID: 2519, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb, do_rm_work)
NOTE: Running noexec task 2235 of 4065 (ID: 2501, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_package_write)
NOTE: Running noexec task 2237 of 4065 (ID: 2504, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_build)
NOTE: Running task 2238 of 4065 (ID: 2505, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/rtmp/librtmp.bb, do_rm_work)
NOTE: Running noexec task 2249 of 4065 (ID: 2487, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_package_write)
NOTE: Running noexec task 2251 of 4065 (ID: 2490, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_build)
NOTE: Running task 2252 of 4065 (ID: 2491, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/libmms/libmms_0.6.2.bb, do_rm_work)
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_rm_work: Started
NOTE: Running noexec task 2263 of 4065 (ID: 2473, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_package_write)
NOTE: Running noexec task 2265 of 4065 (ID: 2476, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_build)
NOTE: Running task 2266 of 4065 (ID: 2477, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/curl/curl_7.28.1.bb, do_rm_work)
NOTE: recipe opencore-amr-0.1.2-r0: task do_rm_work: Started
NOTE: recipe lame-3.99.5-r1: task do_rm_work: Started
NOTE: recipe liba52-0.7.4-r4: task do_rm_work: Started
NOTE: recipe mpeg2dec-0.4.1-r2: task do_rm_work: Started
NOTE: recipe libmms-0.6.2-r0: task do_rm_work: Started
NOTE: recipe libusb-compat-1_0.1.4-r1: task do_rm_work: Succeeded
NOTE: recipe opencore-amr-0.1.2-r0: task do_rm_work: Succeeded
NOTE: recipe mpeg2dec-0.4.1-r2: task do_rm_work: Succeeded
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_rm_work: Started
NOTE: Running noexec task 2301 of 4065 (ID: 2431, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_package_write)
NOTE: Running noexec task 2303 of 4065 (ID: 2434, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_build)
NOTE: Running task 2304 of 4065 (ID: 2435, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/speex/speex_1.2rc1.bb, do_rm_work)
NOTE: recipe libmms-0.6.2-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 2315 of 4065 (ID: 2389, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_package_write)
NOTE: Running noexec task 2317 of 4065 (ID: 2392, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_build)
NOTE: Running task 2318 of 4065 (ID: 2393, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.10.bb, do_rm_work)
NOTE: Running noexec task 2343 of 4065 (ID: 3989, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_package_write)
NOTE: Running noexec task 2345 of 4065 (ID: 3992, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_build)
NOTE: Running task 2346 of 4065 (ID: 3993, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb, do_rm_work)
NOTE: recipe curl-7.28.1-r3: task do_rm_work: Started
NOTE: Running noexec task 2357 of 4065 (ID: 1927, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_package_write)
NOTE: Running noexec task 2359 of 4065 (ID: 1930, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_build)
NOTE: Running task 2360 of 4065 (ID: 1931, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb, do_rm_work)
NOTE: recipe lame-3.99.5-r1: task do_rm_work: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_rm_work: Succeeded
NOTE: recipe librtmp-2.4+gitAUTOINC+3a1e20c08cc4f7ad8b6684fadd0bfb4420376809-r1: task do_rm_work: Succeeded
NOTE: recipe curl-7.28.1-r3: task do_rm_work: Succeeded
NOTE: recipe cairo-1.12.10-r0: task do_rm_work: Started
NOTE: Running noexec task 2381 of 4065 (ID: 3652, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_package_write)
NOTE: Running noexec task 2392 of 4065 (ID: 1983, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_package_write)
NOTE: Running noexec task 2395 of 4065 (ID: 1986, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_build)
NOTE: Running task 2396 of 4065 (ID: 1987, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/shadow/shadow_4.1.4.3.bb, do_rm_work)
NOTE: recipe speex-1.2rc1-r2: task do_rm_work: Started
NOTE: Running noexec task 2397 of 4065 (ID: 1944, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_build)
NOTE: Running task 2398 of 4065 (ID: 1945, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus_1.6.8.bb, do_rm_work)
NOTE: Running noexec task 2399 of 4065 (ID: 3543, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_build)
NOTE: Running task 2400 of 4065 (ID: 3544, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb, do_rm_work)
NOTE: recipe libdaemon-0.14-r0: task do_rm_work: Started
NOTE: Running noexec task 2401 of 4065 (ID: 3655, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_build)
NOTE: Running task 2402 of 4065 (ID: 3656, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dbus/dbus-glib_0.100.bb, do_rm_work)
NOTE: recipe libsndfile1-1.0.25-r1: task do_rm_work: Started
NOTE: recipe speex-1.2rc1-r2: task do_rm_work: Succeeded
NOTE: recipe cairo-1.12.10-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 2418 of 4065 (ID: 3709, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_package_write)
NOTE: Running noexec task 2420 of 4065 (ID: 3712, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_build)
NOTE: Running task 2421 of 4065 (ID: 3713, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/vlc/libdca_0.0.5-5.bb, do_rm_work)
NOTE: recipe libdaemon-0.14-r0: task do_rm_work: Succeeded
NOTE: recipe shadow-4.1.4.3-r13: task do_rm_work: Started
NOTE: recipe dbus-glib-0.100-r2: task do_rm_work: Started
NOTE: Running noexec task 2432 of 4065 (ID: 3624, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_package_write)
NOTE: Running noexec task 2434 of 4065 (ID: 3627, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_build)
NOTE: Running task 2435 of 4065 (ID: 3628, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/quota/quota_4.01.bb, do_rm_work)
NOTE: recipe libsndfile1-1.0.25-r1: task do_rm_work: Succeeded
NOTE: recipe dbus-glib-0.100-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 2446 of 4065 (ID: 3610, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_package_write)
NOTE: Running noexec task 2448 of 4065 (ID: 3613, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_build)
NOTE: Running task 2449 of 4065 (ID: 3614, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb, do_rm_work)
NOTE: recipe dbus-1.6.8-r5.0: task do_rm_work: Started
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_rm_work: Started
NOTE: Running noexec task 2460 of 4065 (ID: 3385, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_package_write)
NOTE: Running noexec task 2462 of 4065 (ID: 3388, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_build)
NOTE: Running task 2463 of 4065 (ID: 3389, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb, do_rm_work)
NOTE: recipe libdca-0.0.5-5-r1: task do_rm_work: Started
NOTE: Running noexec task 2474 of 4065 (ID: 3371, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_package_write)
NOTE: Running noexec task 2476 of 4065 (ID: 3374, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_build)
NOTE: Running task 2477 of 4065 (ID: 3375, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/libupnp/libupnp_1.6.5.bb, do_rm_work)
NOTE: recipe libgnome-keyring-2.32.0-r3: task do_rm_work: Succeeded
NOTE: recipe dbus-1.6.8-r5.0: task do_rm_work: Succeeded
NOTE: recipe quota-4.01-r1: task do_rm_work: Started
NOTE: recipe libdca-0.0.5-5-r1: task do_rm_work: Succeeded
NOTE: recipe shadow-4.1.4.3-r13: task do_rm_work: Succeeded
NOTE: Running noexec task 2488 of 4065 (ID: 2067, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_package_write)
NOTE: Running noexec task 2490 of 4065 (ID: 2070, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_build)
NOTE: Running task 2491 of 4065 (ID: 2071, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb, do_rm_work)
NOTE: Running noexec task 2502 of 4065 (ID: 2053, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_package_write)
NOTE: Running noexec task 2504 of 4065 (ID: 2056, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_build)
NOTE: Running task 2505 of 4065 (ID: 2057, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libevent/libevent_2.0.21.bb, do_rm_work)
NOTE: recipe libtirpc-0.2.2-r1: task do_rm_work: Started
NOTE: Running noexec task 2516 of 4065 (ID: 2039, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_package_write)
NOTE: Running noexec task 2518 of 4065 (ID: 2042, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_build)
NOTE: Running task 2519 of 4065 (ID: 2043, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb, do_rm_work)
NOTE: Running noexec task 2530 of 4065 (ID: 3694, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_package_write)
NOTE: Running noexec task 2532 of 4065 (ID: 3697, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_build)
NOTE: Running task 2533 of 4065 (ID: 3698, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb, do_rm_work)
NOTE: recipe libupnp-1.6.5-r1: task do_rm_work: Started
NOTE: recipe faad2-2.7-r1: task do_rm_work: Started
NOTE: recipe libtirpc-0.2.2-r1: task do_rm_work: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_rm_work: Started
NOTE: recipe quota-4.01-r1: task do_rm_work: Succeeded
NOTE: recipe faad2-2.7-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2543 of 4065 (ID: 945, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_package_write)
NOTE: Running noexec task 2545 of 4065 (ID: 973, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_package_write)
NOTE: Running noexec task 2546 of 4065 (ID: 948, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_build)
NOTE: Running task 2547 of 4065 (ID: 949, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-twisted_12.0.0.bb, do_rm_work)
NOTE: recipe libupnp-1.6.5-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2550 of 4065 (ID: 976, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_build)
NOTE: Running task 2551 of 4065 (ID: 977, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb, do_rm_work)
NOTE: Running noexec task 2581 of 4065 (ID: 2445, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_package_write)
NOTE: Running noexec task 2583 of 4065 (ID: 3049, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_package_write)
NOTE: Running noexec task 2584 of 4065 (ID: 2448, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_build)
NOTE: Running task 2585 of 4065 (ID: 2449, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb, do_rm_work)
NOTE: recipe libevent-2.0.21-r0: task do_rm_work: Started
NOTE: recipe libnfsidmap-0.25-r0: task do_rm_work: Started
NOTE: recipe libsamplerate0-0.1.8-r1: task do_rm_work: Started
NOTE: Running noexec task 2588 of 4065 (ID: 3052, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_build)
NOTE: Running task 2589 of 4065 (ID: 3053, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb, do_rm_work)
NOTE: recipe tcp-wrappers-7.6-r10: task do_rm_work: Succeeded
NOTE: Running noexec task 2623 of 4065 (ID: 1099, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_package_write)
NOTE: Running noexec task 2626 of 4065 (ID: 1102, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_build)
NOTE: Running task 2627 of 4065 (ID: 1103, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb, do_rm_work)
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_rm_work: Started
NOTE: recipe python-twisted-12.0.0-r2: task do_rm_work: Started
NOTE: recipe libevent-2.0.21-r0: task do_rm_work: Succeeded
NOTE: recipe libnfsidmap-0.25-r0: task do_rm_work: Succeeded
NOTE: recipe libsamplerate0-0.1.8-r1: task do_rm_work: Succeeded
NOTE: recipe python-zopeinterface-3.5.1-r3: task do_rm_work: Succeeded
NOTE: recipe glib-networking-2.28.7-r3: task do_rm_work: Started
NOTE: recipe python-twisted-12.0.0-r2: task do_rm_work: Succeeded
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_rm_work: Started
NOTE: recipe glib-networking-2.28.7-r3: task do_rm_work: Succeeded
NOTE: Running noexec task 2637 of 4065 (ID: 1085, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_package_write)
NOTE: Running noexec task 2640 of 4065 (ID: 1088, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_build)
NOTE: Running task 2641 of 4065 (ID: 1089, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb, do_rm_work)
NOTE: Running noexec task 2651 of 4065 (ID: 1071, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_package_write)
NOTE: Running noexec task 2654 of 4065 (ID: 1074, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_build)
NOTE: Running task 2655 of 4065 (ID: 1075, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb, do_rm_work)
NOTE: recipe libdvdcss-1.2.10-r1: task do_rm_work: Started
NOTE: Running noexec task 2665 of 4065 (ID: 1057, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_package_write)
NOTE: Running noexec task 2668 of 4065 (ID: 1060, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_build)
NOTE: Running task 2669 of 4065 (ID: 1061, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb, do_rm_work)
NOTE: Running noexec task 2693 of 4065 (ID: 1015, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_package_write)
NOTE: Running noexec task 2696 of 4065 (ID: 1018, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_build)
NOTE: Running task 2697 of 4065 (ID: 1019, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-pli-hd.bb, do_rm_work)
NOTE: Running noexec task 2707 of 4065 (ID: 1001, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_package_write)
NOTE: Running noexec task 2710 of 4065 (ID: 1004, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_build)
NOTE: Running task 2711 of 4065 (ID: 1005, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-skins/enigma2-plugin-skins-magic.bb, do_rm_work)
NOTE: recipe libdvdcss-1.2.10-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2721 of 4065 (ID: 959, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_package_write)
NOTE: Running noexec task 2724 of 4065 (ID: 962, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_build)
NOTE: Running task 2725 of 4065 (ID: 963, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-utf8-hack.bb, do_rm_work)
NOTE: Running noexec task 2737 of 4065 (ID: 917, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_package_write)
NOTE: Running noexec task 2742 of 4065 (ID: 920, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_build)
NOTE: Running task 2743 of 4065 (ID: 921, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/eglibc/eglibc-locale_2.17.bb, do_rm_work)
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_rm_work: Started
NOTE: recipe libsoup-2.4-2.40.2-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 2754 of 4065 (ID: 3723, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_package_write)
NOTE: Running noexec task 2756 of 4065 (ID: 3726, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_build)
NOTE: Running task 2757 of 4065 (ID: 3727, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/fuse/fuse_2.9.2.bb, do_rm_work)
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_rm_work: Started
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_rm_work: Started
NOTE: recipe python-utf8-hack-0.2-r0: task do_rm_work: Started
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_rm_work: Started
NOTE: recipe eglibc-locale-2.17-r0: task do_rm_work: Started
NOTE: recipe gst-plugins-ugly-0.10.19-r6: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_rm_work: Started
NOTE: recipe gst-plugins-bad-0.10.23-r6: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-skins-pli-hd-0.1+gitAUTOINC+e39eb9ffee03efdb9f57a2f291393917c3840cec-r0: task do_rm_work: Succeeded
NOTE: recipe python-utf8-hack-0.2-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 2782 of 4065 (ID: 3751, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_package_write)
NOTE: Running noexec task 2784 of 4065 (ID: 3754, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_build)
NOTE: Running task 2785 of 4065 (ID: 3755, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb, do_rm_work)
NOTE: recipe gst-plugins-good-0.10.31-r11: task do_rm_work: Succeeded
NOTE: recipe fuse-2.9.2-r1: task do_rm_work: Started
NOTE: Running noexec task 2796 of 4065 (ID: 3680, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_package_write)
NOTE: Running noexec task 2798 of 4065 (ID: 3683, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_build)
NOTE: Running task 2799 of 4065 (ID: 3684, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libnl/libnl_3.2.21.bb, do_rm_work)
NOTE: Running noexec task 2820 of 4065 (ID: 1745, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_package_write)
NOTE: Running noexec task 2822 of 4065 (ID: 1748, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_build)
NOTE: Running task 2823 of 4065 (ID: 1749, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb, do_rm_work)
NOTE: recipe enigma2-plugin-skins-magic-1.0+gitAUTOINC+2ebda5a64780f6f5230dfef417f1ecf900462741-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 2834 of 4065 (ID: 1829, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_package_write)
NOTE: Running noexec task 2836 of 4065 (ID: 1832, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_build)
NOTE: Running task 2837 of 4065 (ID: 1833, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/dvdbackup/dvdbackup_0.4.2.bb, do_rm_work)
NOTE: Running noexec task 2848 of 4065 (ID: 1815, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_package_write)
NOTE: Running noexec task 2850 of 4065 (ID: 1818, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_build)
NOTE: Running task 2851 of 4065 (ID: 1819, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/libcddb/libcddb_1.3.2.bb, do_rm_work)
NOTE: Running noexec task 2862 of 4065 (ID: 1801, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_package_write)
NOTE: Running noexec task 2864 of 4065 (ID: 1804, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_build)
NOTE: Running task 2865 of 4065 (ID: 1805, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-daap_0.7.1.bb, do_rm_work)
NOTE: recipe eglibc-locale-2.17-r0: task do_rm_work: Succeeded
NOTE: recipe fuse-2.9.2-r1: task do_rm_work: Succeeded
NOTE: recipe mtd-utils-1.5.0-r5: task do_rm_work: Started
NOTE: recipe libnl-1_3.2.21-r0: task do_rm_work: Started
NOTE: Running noexec task 2876 of 4065 (ID: 1787, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_package_write)
NOTE: Running noexec task 2878 of 4065 (ID: 1790, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_build)
NOTE: Running task 2879 of 4065 (ID: 1791, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-mutagen_1.18.bb, do_rm_work)
NOTE: Running noexec task 2890 of 4065 (ID: 1773, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_package_write)
NOTE: Running noexec task 2892 of 4065 (ID: 1776, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_build)
NOTE: Running task 2893 of 4065 (ID: 1777, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/streamripper/streamripper_1.64.6.bb, do_rm_work)
NOTE: recipe libcddb-1.3.2-r1: task do_rm_work: Started
NOTE: recipe python-pyopenssl-0.13-r1: task do_rm_work: Started
NOTE: recipe dvdbackup-0.4.2-r2: task do_rm_work: Started
NOTE: recipe mtd-utils-1.5.0-r5: task do_rm_work: Succeeded
NOTE: recipe libnl-1_3.2.21-r0: task do_rm_work: Succeeded
NOTE: recipe libcddb-1.3.2-r1: task do_rm_work: Succeeded
NOTE: recipe python-daap-0.7.1-r3: task do_rm_work: Started
NOTE: recipe python-pyopenssl-0.13-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 2904 of 4065 (ID: 1759, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_package_write)
NOTE: Running noexec task 2906 of 4065 (ID: 1762, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_build)
NOTE: Running task 2907 of 4065 (ID: 1763, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-devtools/python/python-gdata_2.0.14.bb, do_rm_work)
NOTE: recipe dvdbackup-0.4.2-r2: task do_rm_work: Succeeded
NOTE: Running noexec task 2918 of 4065 (ID: 1731, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_package_write)
NOTE: Running noexec task 2920 of 4065 (ID: 1734, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_build)
NOTE: Running task 2921 of 4065 (ID: 1735, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/ushare/ushare_1.1a.bb, do_rm_work)
NOTE: recipe python-mutagen-1.18-r1: task do_rm_work: Started
NOTE: Running noexec task 2955 of 4065 (ID: 2614, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_package_write)
NOTE: Running noexec task 2958 of 4065 (ID: 2617, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_build)
NOTE: Running task 2959 of 4065 (ID: 2618, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_rm_work)
NOTE: recipe streamripper-1.64.6-r1: task do_rm_work: Started
NOTE: Running noexec task 2998 of 4065 (ID: 2011, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_package_write)
NOTE: Running noexec task 3000 of 4065 (ID: 2014, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_build)
NOTE: Running task 3001 of 4065 (ID: 2015, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_rm_work)
NOTE: recipe python-mutagen-1.18-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 3011 of 4065 (ID: 3666, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_package_write)
NOTE: Running noexec task 3013 of 4065 (ID: 3835, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_package_write)
NOTE: Running noexec task 3014 of 4065 (ID: 3669, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_build)
NOTE: Running task 3015 of 4065 (ID: 3670, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-support/libcheck/libcheck_0.9.9.bb, do_rm_work)
NOTE: Running noexec task 3018 of 4065 (ID: 3838, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_build)
NOTE: Running task 3019 of 4065 (ID: 3839, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/gawk/gawk_4.0.1.bb, do_rm_work)
NOTE: recipe python-gdata-2.0.14-r1: task do_rm_work: Started
NOTE: recipe sysvinit-2.88dsf-r13: task do_rm_work: Started
NOTE: recipe python-daap-0.7.1-r3: task do_rm_work: Succeeded
NOTE: recipe python-gdata-2.0.14-r1: task do_rm_work: Succeeded
NOTE: recipe ushare-1.1a-r1: task do_rm_work: Started
NOTE: Running noexec task 3044 of 4065 (ID: 2852, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_package_write)
NOTE: Running noexec task 3047 of 4065 (ID: 2855, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_build)
NOTE: Running task 3048 of 4065 (ID: 2856, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/busybox/busybox_1.20.2.bb, do_rm_work)
NOTE: Running noexec task 3084 of 4065 (ID: 434, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_package_write)
NOTE: Running noexec task 3086 of 4065 (ID: 2656, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_package_write)
NOTE: Running noexec task 3087 of 4065 (ID: 437, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_build)
NOTE: Running task 3088 of 4065 (ID: 438, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb, do_rm_work)
NOTE: recipe talloc-2.0.1-r2: task do_rm_work: Started
NOTE: recipe streamripper-1.64.6-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 3091 of 4065 (ID: 2659, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_build)
NOTE: Running task 3092 of 4065 (ID: 2660, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb, do_rm_work)
NOTE: recipe gawk-4.0.1-r1: task do_rm_work: Started
NOTE: recipe libcheck-0.9.9-r1: task do_rm_work: Started
NOTE: recipe talloc-2.0.1-r2: task do_rm_work: Succeeded
NOTE: recipe ushare-1.1a-r1: task do_rm_work: Succeeded
NOTE: recipe libcheck-0.9.9-r1: task do_rm_work: Succeeded
NOTE: recipe sysvinit-2.88dsf-r13: task do_rm_work: Succeeded
NOTE: Running noexec task 3102 of 4065 (ID: 3821, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_package_write)
NOTE: Running noexec task 3105 of 4065 (ID: 3824, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_build)
NOTE: Running task 3106 of 4065 (ID: 3825, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_rm_work)
NOTE: recipe busybox-1.20.2-r32: task do_rm_work: Started
NOTE: Running noexec task 3126 of 4065 (ID: 2782, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_package_write)
NOTE: Running noexec task 3128 of 4065 (ID: 2768, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_package_write)
NOTE: Running noexec task 3129 of 4065 (ID: 2785, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_build)
NOTE: Running task 3130 of 4065 (ID: 2786, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/alsa-state/alsa-state.bb, do_rm_work)
NOTE: recipe rpcbind-0.2.0-r4: task do_rm_work: Started
NOTE: Running noexec task 3133 of 4065 (ID: 2771, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_build)
NOTE: Running task 3134 of 4065 (ID: 2772, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb, do_rm_work)
NOTE: recipe nfs-utils-1.2.7-r0: task do_rm_work: Started
NOTE: Running noexec task 3164 of 4065 (ID: 2880, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_package_write)
NOTE: Running noexec task 3167 of 4065 (ID: 2883, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_build)
NOTE: Running task 3168 of 4065 (ID: 2884, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/netbase/netbase_5.0.bb, do_rm_work)
NOTE: recipe rpcbind-0.2.0-r4: task do_rm_work: Succeeded
NOTE: recipe nfs-utils-1.2.7-r0: task do_rm_work: Succeeded
NOTE: recipe gawk-4.0.1-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 3178 of 4065 (ID: 2712, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_package_write)
NOTE: Running noexec task 3180 of 4065 (ID: 3807, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_package_write)
NOTE: Running noexec task 3181 of 4065 (ID: 2715, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_build)
NOTE: Running task 3182 of 4065 (ID: 2716, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_rm_work)
NOTE: recipe bash-4.2-r6: task do_rm_work: Started
NOTE: Running noexec task 3185 of 4065 (ID: 3810, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_build)
NOTE: Running task 3186 of 4065 (ID: 3811, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb, do_rm_work)
NOTE: recipe busybox-1.20.2-r32: task do_rm_work: Succeeded
NOTE: Running noexec task 3196 of 4065 (ID: 336, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_package_write)
NOTE: Running noexec task 3198 of 4065 (ID: 2642, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_package_write)
NOTE: Running noexec task 3199 of 4065 (ID: 339, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_build)
NOTE: Running task 3200 of 4065 (ID: 340, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_rm_work)
NOTE: Running noexec task 3203 of 4065 (ID: 2645, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_build)
NOTE: Running task 3204 of 4065 (ID: 2646, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb, do_rm_work)
NOTE: recipe alsa-state-0.2.0-r4: task do_rm_work: Started
NOTE: recipe netbase-1_5.0-r0: task do_rm_work: Started
NOTE: recipe alsa-utils-1.0.26-r0: task do_rm_work: Started
NOTE: recipe bluez-hcidump-2.5-r1: task do_rm_work: Started
NOTE: recipe bash-4.2-r6: task do_rm_work: Succeeded
NOTE: recipe alsa-state-0.2.0-r4: task do_rm_work: Succeeded
NOTE: recipe netbase-1_5.0-r0: task do_rm_work: Succeeded
NOTE: recipe alsa-utils-1.0.26-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3243 of 4065 (ID: 818, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_package_write)
NOTE: Running noexec task 3245 of 4065 (ID: 2965, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_package_write)
NOTE: Running noexec task 3246 of 4065 (ID: 821, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_build)
NOTE: Running task 3247 of 4065 (ID: 822, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport.bb, do_rm_work)
NOTE: recipe bluez4-4.101-r6: task do_rm_work: Started
NOTE: recipe libnss-mdns-0.10-r7: task do_rm_work: Started
NOTE: Running noexec task 3250 of 4065 (ID: 2968, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_build)
NOTE: Running task 3251 of 4065 (ID: 2969, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-plugin-extensions-xmltvimport-rytec_20120529.bb, do_rm_work)
NOTE: Running noexec task 3275 of 4065 (ID: 2937, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_package_write)
NOTE: Running noexec task 3278 of 4065 (ID: 2940, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_build)
NOTE: Running task 3279 of 4065 (ID: 2941, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb, do_rm_work)
NOTE: recipe bluez4-4.101-r6: task do_rm_work: Succeeded
NOTE: Running noexec task 3289 of 4065 (ID: 2908, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_package_write)
NOTE: Running noexec task 3292 of 4065 (ID: 2911, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_build)
NOTE: Running task 3293 of 4065 (ID: 2912, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb, do_rm_work)
NOTE: recipe bluez-hcidump-2.5-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 3303 of 4065 (ID: 2894, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_package_write)
NOTE: Running noexec task 3306 of 4065 (ID: 2897, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_build)
NOTE: Running task 3307 of 4065 (ID: 2898, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb, do_rm_work)
NOTE: recipe avahi-0.6.31-r6.1: task do_rm_work: Started
NOTE: Running noexec task 3317 of 4065 (ID: 2866, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_package_write)
NOTE: Running noexec task 3320 of 4065 (ID: 2869, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_build)
NOTE: Running task 3321 of 4065 (ID: 2870, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb, do_rm_work)
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_rm_work: Started
NOTE: recipe libnss-mdns-0.10-r7: task do_rm_work: Succeeded
NOTE: Running noexec task 3345 of 4065 (ID: 2824, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_package_write)
NOTE: Running noexec task 3348 of 4065 (ID: 2827, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_build)
NOTE: Running task 3349 of 4065 (ID: 2828, /media/work/pliqt/openpli-oe-core/meta-openembedded/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb, do_rm_work)
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_rm_work: Started
NOTE: recipe python-cheetah-2.4.4-r3: task do_rm_work: Started
NOTE: recipe init-ifupdown-1.0-r0: task do_rm_work: Started
NOTE: recipe modutils-initscripts-1.0-r7: task do_rm_work: Started
NOTE: recipe enigma2-plugin-extensions-xmltvimport-rytec-20120529-r0: task do_rm_work: Succeeded
NOTE: recipe initscripts-1.0-r142: task do_rm_work: Started
NOTE: recipe avahi-0.6.31-r6.1: task do_rm_work: Succeeded
NOTE: recipe python-cheetah-2.4.4-r3: task do_rm_work: Succeeded
NOTE: recipe init-ifupdown-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-xmltvimport-1.0+gitAUTOINC+bfb35fcf97fc11259c28b41c9c7f4fab26461b5b-r25: task do_rm_work: Succeeded
NOTE: recipe modutils-initscripts-1.0-r7: task do_rm_work: Succeeded
NOTE: Running noexec task 3387 of 4065 (ID: 2754, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_package_write)
NOTE: Running noexec task 3390 of 4065 (ID: 2757, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_build)
NOTE: Running task 3391 of 4065 (ID: 2758, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-bsp/usbutils/usbutils_006.bb, do_rm_work)
NOTE: Running noexec task 3401 of 4065 (ID: 2740, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_package_write)
NOTE: Running noexec task 3404 of 4065 (ID: 2743, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_build)
NOTE: Running task 3405 of 4065 (ID: 2744, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb, do_rm_work)
NOTE: recipe initscripts-1.0-r142: task do_rm_work: Succeeded
NOTE: Running noexec task 3415 of 4065 (ID: 2726, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_package_write)
NOTE: Running noexec task 3418 of 4065 (ID: 2729, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_build)
NOTE: Running task 3419 of 4065 (ID: 2730, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb, do_rm_work)
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_rm_work: Started
NOTE: Running noexec task 3429 of 4065 (ID: 2698, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_package_write)
NOTE: Running noexec task 3432 of 4065 (ID: 2701, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_build)
NOTE: Running task 3433 of 4065 (ID: 2702, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, do_rm_work)
NOTE: Running noexec task 3443 of 4065 (ID: 2684, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_package_write)
NOTE: Running noexec task 3446 of 4065 (ID: 2687, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_build)
NOTE: Running task 3447 of 4065 (ID: 2688, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb, do_rm_work)
NOTE: Running noexec task 3457 of 4065 (ID: 2670, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_package_write)
NOTE: Running noexec task 3460 of 4065 (ID: 2673, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_build)
NOTE: Running task 3461 of 4065 (ID: 2674, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/showiframe/showiframe.bb, do_rm_work)
NOTE: Running noexec task 3471 of 4065 (ID: 589, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_package_write)
NOTE: Running noexec task 3474 of 4065 (ID: 592, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_build)
NOTE: Running task 3475 of 4065 (ID: 593, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-multimedia/aio-grab/aio-grab.bb, do_rm_work)
NOTE: recipe usbutils-006-r0: task do_rm_work: Started
NOTE: recipe kmod-9-r0.0: task do_rm_work: Started
NOTE: recipe wireless-tools-1_29-r4: task do_rm_work: Started
NOTE: recipe ntfs-3g-ntfsprogs-2011.4.12-r0: task do_rm_work: Succeeded
NOTE: recipe wpa-supplicant-2.0-r2: task do_rm_work: Started
NOTE: Running noexec task 3514 of 4065 (ID: 252, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_package_write)
NOTE: Running noexec task 3516 of 4065 (ID: 255, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_build)
NOTE: Running task 3517 of 4065 (ID: 256, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-plugins/enigma2-pliplugins.bb, do_rm_work)
NOTE: recipe wpa-supplicant-2.0-r2: task do_rm_work: Succeeded
NOTE: recipe kmod-9-r0.0: task do_rm_work: Succeeded
NOTE: recipe showiframe-1.1-r0: task do_rm_work: Started
NOTE: recipe wireless-tools-1_29-r4: task do_rm_work: Succeeded
NOTE: recipe usbutils-006-r0: task do_rm_work: Succeeded
NOTE: recipe sysfsutils-2.1.0-r5: task do_rm_work: Started
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_rm_work: Started
NOTE: Running noexec task 3528 of 4065 (ID: 222, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_package_write)
NOTE: Running noexec task 3530 of 4065 (ID: 225, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_build)
NOTE: Running task 3531 of 4065 (ID: 226, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb, do_rm_work)
NOTE: recipe showiframe-1.1-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3597 of 4065 (ID: 832, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_package_write)
NOTE: Running noexec task 3600 of 4065 (ID: 835, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_build)
NOTE: Running task 3601 of 4065 (ID: 836, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-foreca.bb, do_rm_work)
NOTE: Running noexec task 3611 of 4065 (ID: 804, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_package_write)
NOTE: Running noexec task 3614 of 4065 (ID: 807, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_build)
NOTE: Running task 3615 of 4065 (ID: 808, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2-softcams/enigma2-plugin-softcams-cccam_2.3.0.bb, do_rm_work)
NOTE: Running noexec task 3625 of 4065 (ID: 757, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_package_write)
NOTE: Running noexec task 3628 of 4065 (ID: 760, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_build)
NOTE: Running task 3629 of 4065 (ID: 761, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-zd1211.bb, do_rm_work)
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_rm_work: Started
NOTE: Running noexec task 3639 of 4065 (ID: 743, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_package_write)
NOTE: Running noexec task 3642 of 4065 (ID: 746, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_build)
NOTE: Running task 3643 of 4065 (ID: 747, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8712u.bb, do_rm_work)
NOTE: recipe sysfsutils-2.1.0-r5: task do_rm_work: Succeeded
NOTE: recipe aio-grab-1.0+gitAUTOINC+47983a78821c0fdbef3aab36113d5c6fc34bb11b-r1: task do_rm_work: Succeeded
NOTE: Running noexec task 3653 of 4065 (ID: 729, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_package_write)
NOTE: Running noexec task 3656 of 4065 (ID: 732, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_build)
NOTE: Running task 3657 of 4065 (ID: 733, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rtl8192cu.bb, do_rm_work)
NOTE: Running noexec task 3667 of 4065 (ID: 715, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_package_write)
NOTE: Running noexec task 3670 of 4065 (ID: 718, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_build)
NOTE: Running task 3671 of 4065 (ID: 719, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt73.bb, do_rm_work)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_rm_work: Started
NOTE: recipe firmware-zd1211-1.0-r0: task do_rm_work: Started
NOTE: recipe enigma2-pliplugins-1.0+gitAUTOINC+bcf694f5e6d3b9e8dba1f8e14201694420390bad-r5: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_rm_work: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_rm_work: Started
NOTE: recipe firmware-zd1211-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_rm_work: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3681 of 4065 (ID: 701, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_package_write)
NOTE: Running noexec task 3684 of 4065 (ID: 704, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_build)
NOTE: Running task 3685 of 4065 (ID: 705, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-rt2870.bb, do_rm_work)
NOTE: Running noexec task 3695 of 4065 (ID: 687, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_package_write)
NOTE: Running noexec task 3698 of 4065 (ID: 690, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_build)
NOTE: Running task 3699 of 4065 (ID: 691, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc9271.bb, do_rm_work)
NOTE: recipe enigma2-plugin-extensions-foreca-gitAUTOINC+3812ec34780f35581943540e01368a92c804aa50-r0: task do_rm_work: Succeeded
NOTE: recipe firmware-rt73-1.0-r0: task do_rm_work: Started
NOTE: recipe enigma2-plugin-softcams-cccam-2.3.0-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3709 of 4065 (ID: 673, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_package_write)
NOTE: Running noexec task 3712 of 4065 (ID: 676, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_build)
NOTE: Running task 3713 of 4065 (ID: 677, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-htc7010.bb, do_rm_work)
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_rm_work: Started
NOTE: Running noexec task 3723 of 4065 (ID: 659, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_package_write)
NOTE: Running noexec task 3726 of 4065 (ID: 662, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_build)
NOTE: Running task 3727 of 4065 (ID: 663, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-linux/linux-firmwares/firmware-carl9170_1.9.5.bb, do_rm_work)
NOTE: recipe firmware-rtl8712u-1.0-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3737 of 4065 (ID: 645, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_package_write)
NOTE: Running noexec task 3740 of 4065 (ID: 648, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_build)
NOTE: Running task 3741 of 4065 (ID: 649, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-ppanel.bb, do_rm_work)
NOTE: recipe firmware-rt2870-1.0-r0: task do_rm_work: Started
NOTE: Running noexec task 3751 of 4065 (ID: 631, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_package_write)
NOTE: Running noexec task 3754 of 4065 (ID: 634, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_build)
NOTE: Running task 3755 of 4065 (ID: 635, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-openwebif.bb, do_rm_work)
NOTE: recipe firmware-rt73-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_rm_work: Started
NOTE: recipe firmware-rt2870-1.0-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3765 of 4065 (ID: 617, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_package_write)
NOTE: Running noexec task 3768 of 4065 (ID: 620, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_build)
NOTE: Running task 3769 of 4065 (ID: 621, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/e2openplugins/enigma2-plugin-extensions-autobackup.bb, do_rm_work)
NOTE: recipe firmware-carl9170-1.9.5-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3793 of 4065 (ID: 575, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_package_write)
NOTE: Running noexec task 3796 of 4065 (ID: 578, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_build)
NOTE: Running task 3797 of 4065 (ID: 579, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb, do_rm_work)
NOTE: recipe firmware-htc9271-1.0-r0: task do_rm_work: Started
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_rm_work: Started
NOTE: recipe firmware-htc7010-1.0-r0: task do_rm_work: Started
NOTE: recipe firmware-rtl8192cu-1.0-r0: task do_rm_work: Succeeded
NOTE: Running noexec task 3835 of 4065 (ID: 518, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_package_write)
NOTE: Running noexec task 3838 of 4065 (ID: 521, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_build)
NOTE: Running task 3839 of 4065 (ID: 522, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/tuxbox-links.bb, do_rm_work)
NOTE: Running noexec task 3863 of 4065 (ID: 490, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_package_write)
NOTE: Running noexec task 3866 of 4065 (ID: 493, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_build)
NOTE: Running task 3867 of 4065 (ID: 494, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-extended/sdparm/sdparm_1.07.bb, do_rm_work)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_rm_work: Started
NOTE: recipe firmware-htc9271-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-openwebif-0.1+gitAUTOINC+4231dbbaa7cfe7d37287e7a3ee7df1461b1dfd01-r2.72: task do_rm_work: Succeeded
NOTE: Running noexec task 3933 of 4065 (ID: 406, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_package_write)
NOTE: Running noexec task 3936 of 4065 (ID: 409, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_build)
NOTE: Running task 3937 of 4065 (ID: 410, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-openpli/enigma2/early-configure.bb, do_rm_work)
NOTE: recipe sdparm-1.07-r1: task do_rm_work: Started
NOTE: recipe firmware-htc7010-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_rm_work: Started
NOTE: recipe vsftpd-2.3.5-r4: task do_rm_work: Started
NOTE: recipe tuxbox-links-1.0-r10: task do_rm_work: Started
NOTE: Running noexec task 3947 of 4065 (ID: 378, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_package_write)
NOTE: Running noexec task 3950 of 4065 (ID: 381, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_build)
NOTE: Running task 3951 of 4065 (ID: 382, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-core/dropbear/dropbear_2012.55.bb, do_rm_work)
NOTE: Running noexec task 3975 of 4065 (ID: 350, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_package_write)
NOTE: Running noexec task 3978 of 4065 (ID: 353, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_build)
NOTE: Running task 3979 of 4065 (ID: 354, /media/work/pliqt/openpli-oe-core/meta-openpli/recipes-connectivity/samba/samba_3.0.37.bb, do_rm_work)
NOTE: recipe enigma2-plugin-extensions-ppanel-2.0+gitAUTOINC+4ce6ca5915f2f7449f6945046f772169ccaefab6-r0: task do_rm_work: Succeeded
NOTE: recipe sdparm-1.07-r1: task do_rm_work: Succeeded
NOTE: recipe vsftpd-2.3.5-r4: task do_rm_work: Succeeded
NOTE: recipe tuxbox-links-1.0-r10: task do_rm_work: Succeeded
NOTE: recipe enigma2-plugin-extensions-autobackup-2.0+gitAUTOINC+9f8d95bdd2eef008476071b4de0e230ea05a7a37-r0: task do_rm_work: Succeeded
NOTE: recipe early-configure-20101009-r0: task do_rm_work: Started
NOTE: Running noexec task 4003 of 4065 (ID: 308, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_package_write)
NOTE: Running noexec task 4006 of 4065 (ID: 311, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_build)
NOTE: Running task 4007 of 4065 (ID: 312, /media/work/pliqt/openpli-oe-core/openembedded-core/meta/recipes-devtools/opkg/opkg-collateral.bb, do_rm_work)
NOTE: recipe dropbear-2012.55-r3.1: task do_rm_work: Started
NOTE: Running task 4061 of 4065 (ID: 7, /media/work/pliqt/openpli-oe-core/meta-local/recipes-local/images/my-image.bb, do_rootfs)
NOTE: recipe dropbear-2012.55-r3.1: task do_rm_work: Succeeded
NOTE: recipe samba-3.0.37-r8: task do_rm_work: Started
NOTE: recipe early-configure-20101009-r0: task do_rm_work: Succeeded
NOTE: recipe opkg-collateral-1.0-r2: task do_rm_work: Started
NOTE: recipe samba-3.0.37-r8: task do_rm_work: Succeeded
NOTE: recipe opkg-collateral-1.0-r2: task do_rm_work: Succeeded
NOTE: recipe my-image-1.0-r0: task do_rootfs: Started
NOTE: recipe my-image-1.0-r0: task do_rootfs: Succeeded
NOTE: Running noexec task 4063 of 4065 (ID: 12, /media/work/pliqt/openpli-oe-core/meta-local/recipes-local/images/my-image.bb, do_build)
NOTE: Running task 4064 of 4065 (ID: 13, /media/work/pliqt/openpli-oe-core/meta-local/recipes-local/images/my-image.bb, do_rm_work)
NOTE: recipe my-image-1.0-r0: task do_rm_work: Started
NOTE: recipe my-image-1.0-r0: task do_rm_work: Succeeded
NOTE: Running task 4065 of 4065 (ID: 14, /media/work/pliqt/openpli-oe-core/meta-local/recipes-local/images/my-image.bb, do_rm_work_all)
NOTE: recipe my-image-1.0-r0: task do_rm_work_all: Started
NOTE: recipe my-image-1.0-r0: task do_rm_work_all: Succeeded
NOTE: Tasks Summary: Attempted 4065 tasks of which 3557 didn't need to be rerun and all succeeded.

--------------070503050902020008030800--

Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6D406E15B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 10:11:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0QAB2XJ023800
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Jan 2014 02:11:02 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 26 Jan 2014 02:11:02 -0800
Message-ID: <52E4DF34.8040701@windriver.com>
Date: Sun, 26 Jan 2014 18:11:00 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1390716716.git.liezhi.yang@windriver.com>
	<E20F3D69-C00E-4C63-8D6F-D8229F010309@dominion.thruhere.net>
In-Reply-To: <E20F3D69-C00E-4C63-8D6F-D8229F010309@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/58] [dora-next] fixes for dora (cover letter only)
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
X-List-Received-Date: Sun, 26 Jan 2014 10:11:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/26/2014 05:32 PM, Koen Kooi wrote:
>
> Op 26 jan. 2014, om 07:16 heeft Robert Yang <liezhi.yang@windriver.com> het volgende geschreven:
>
>> Note:
>> This PULL is based on oe-core, and here is another one based on poky:
>>
>> git://git.yoctoproject.org/poky-contrib robert/dora-next
>>
>> // Robert
>>
>>
>> The following changes since commit 198623d80d31f19c963e61d03cbcb12dd318dfdf:
>>
>>   ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script (2014-01-24 12:48:15 +0000)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib robert/dora-next
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=robert/dora-next
>>
>> Alexandre Belloni (1):
>>   wpa-supplicant-2.0: don't exit in pkg_postinst
>>
>> Anders Darander (1):
>>   terminal.bbclass: do not export PS1
>>
>> Andreas Oberritter (1):
>>   cogl-1.0: explicitly disable cairo
>>
>> Bruce Ashfield (1):
>>   linux-libc-headers: fix MIPS klibc build error
>>
>> Chen Qi (1):
>>   subversion: fix build problem when sysroot contains '-D' or '-I'
>>
>> Christopher Larson (4):
>>   python, python-native: fix PARALLEL_MAKEINST failure
>>   cairo: add/use packageconfig for valgrind support
>>   pulseaudio: fix RDEPENDS traversal for consolekit
>>   xz: make the LICENSE info more accurate
>>
>> Cristiana Voicu (1):
>>   babeltrace: correct PV variable
>>
>> Enrico Scholz (1):
>>   bluez4: added dependency on 'libsndfile1'
>>
>> Hongxu Jia (5):
>>   kconfig-frontends: add python to kconfig-frontends's RDEPENDS
>>   qemu: add PACKAGECONFIG for vnc, libcurl, nss, uuid, curses, gtk+,
>>     libcap-ng
>>   qemu: add bash and python to qemu's RDEPENDS
>>   license.bbclass: fix copying license directories failed
>>   nativesdk.bbclass: support nativesdk to override with the
>>     PACKAGES_DYNAMIC statement
>>
>> Jackie Huang (3):
>>   grub: add explicit dependency on bison-native
>>   kconfig-frontends: fix the incorrect depends on gperf
>>   guile: fix the depends for target recipes
>>
>> Jacob Kroon (1):
>>   meta/lib/oe/terminal.py: Don't pass non-supported '--disable-factory'
>>     flag to gnome-terminal
>>
>> Kai Kang (1):
>>   x264: install libraries to right directory when enable multilib
>>
>> Krzysztof Sywula (1):
>>   Minicom depends on libiconv
>>
>> Laurentiu Palcu (1):
>>   x11vnc: fix CAPS_LOCK issues
>>
>> Li Wang (1):
>>   xinetd: CVE-2013-4342
>>
>> Martin Jansa (3):
>>   avahi: add leading space to RRECOMMENDS append
>>   xinput-calibrator: add formfactor to RDEPENDS
>>   base.bbclass: Set umask 022 also for do_unpack task
>>
>> Ming Liu (4):
>>   qemu: use PACKAGECONFIG to address xfsprogs dependency
>>   qemu: explicitly disable xen support
>>   libpthread-stubs: should set ALLOW_EMPTY
>>   grub: add PACKAGECONFIG for device-mapper
>>
>> Nick D'Ademo (1):
>>   libav: install libraries to right directory when multilib is enabled
>>
>> Otavio Salvador (1):
>>   gcc-4.8: Backport PR c++/57532 fix from 4.8.2
>>
>> Paul Eggleton (2):
>>   linux-firmware: add missing linux-firmware-iwlwifi-7260-7 package
>>   libav: add libpostproc to PROVIDES (for 0.8.x version only)
>>
>> Phil Blundell (2):
>>   libsoup: Remove libproxy from DEPENDS
>>   binutils: Also add autoconf-native to DEPENDS
>>
>> Richard Purdie (7):
>>   base/gcc-common: Ensure umask setting is consistent for shared workdir
>>   image.bbclass: Depend on virtual/kernel:do_deploy
>>   gcc-cross-canadian: Fix fortran build
>>   gcc-crosssdk.inc: Fix missing dependencies (such as libmpc-native)
>>   eglibc-locale: Fix depends on binutils
>>   eglibc-locale: Fix previous dependency change to properly work in
>>     nativesdk case
>>   eglibc-locale: Fix multilib builds to depend on the correct binutils
>>
>> Robert Yang (2):
>>   coreutils 6.9: fix coreutils.texi
>>   gcc-4.8/libstdc++-v3: disable sdt
>>
>> Ross Burton (3):
>>   ptest: ensure do_install_ptest_base task runs in fakeroot context
>>   useradd.bbclass: add dependency on base-files
>>   dbus: use PACKAGECONFIG for X11 and systemd
>>
>> Roy Li (1):
>>   multilib: Ensure we map the SYSTEMD_PACKAGES variable
>>
>> Saul Wold (1):
>>   openssl: use PACKAGECONFIG to disable perl bits
>>
>> Scott Garman (1):
>>   runqemu: remove core-image-* whitelist
>>
>> Tom Zanussi (1):
>>   systemtap: Add --enable-prologues to configuration
>>
>> Yue Tao (3):
>>   python: do not replace ccache in the middle of a path
>>   acpid: CVE-2011-1159
>>   icu: CVE-2013-2924
>>
>> mykhani (1):
>>   openssl.inc: Install c_rehash utility with openssl
>>
>> yzhu1 (1):
>>   populate_sdk: verify executable or dynamically linked library
>
> I absolutely hate these massive pull requests for stable branches:
>
> 1) important fixes keep collecting dust
> 2) 56 changes at once makes testing and debugging really painfull
>
> So for the future could you *please* send pull requests directly after patches get proposed?
>

Sorry, I don't quite understand what do you mean, this is just for review,
not the final PULl, I only sent the cover lettter is for avoiding flushing
mailing list.

// Robert.



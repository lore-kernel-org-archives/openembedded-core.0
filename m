Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97F6C744EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 03:05:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4P34OKk026659
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 20:05:02 -0700
Received: from [128.224.27.58] (128.224.27.58) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 24 May 2018 20:04:21 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <545c0cd3-bf37-8546-7d04-8e84254425ec@windriver.com>
Date: Fri, 25 May 2018 11:04:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 00/24] meta: various fixes
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
X-List-Received-Date: Fri, 25 May 2018 03:05:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 05/25/2018 10:48 AM, Robert Yang wrote:
> Hi RP and Ross,
> 
> These are part of our local patches, most of them have been sent before, but
> didn't get reply, would you please help to review and merge/reject them? Thank
> you very much, All of them are good changes from my side.
> 
> // Robert
> 
> The following changes since commit 9da097b0de6425464ebd3f0539b7495b11d139b5:
> 
>    libnss-mdns: fix postinst and postrm (2018-05-22 13:09:04 +0100)
> 
> are available in the git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/24fixes
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/24fixes

Since there are only 22 fixes now, I put them to a more generic branch:

   git://git.openembedded.org/openembedded-core-contrib rbt/fix_from_wr
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/fix_from_wr

// Robert

> 
> Catalin Enache (1):
>    init-install: add timeout for legacy grub
> 
> Chen Qi (1):
>    populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES
> 
> Hu (1):
>    shadow: fix pam configs for chpasswd, newusers
> 
> Jackie Huang (3):
>    rootfs-postcommands: split ssh_allow_empty_password
>    dropbear: add default config file to disable root login
>    glibc: re-package for libnss-db
> 
> Jian Liu (1):
>    lsof: fix LSOF_CCV in version.h
> 
> Kai Kang (4):
>    dbus: update build options when enable ptest
>    dbus-test: sync x11 configure options with dbus
>    toolchain-scripts.bbclass: do not extend dependency if extended
>      already
>    shadow: update ownership and permission of /var/spool/mail
> 
> Li Wang (2):
>    gawk: fix command location in ptest script
>    rpcbind: add option to make user able to use fixed port number
> 
> Mark Hatle (1):
>    base.bbclass: Add buildcfg multilib values
> 
> Mingli Yu (1):
>    at: add libselinux to PACKAGECONFIG
> 
> Ovidiu Panait (2):
>    openssl-nativesdk: Fix "can't open config file" warning
>    nativesdk-rpm: Add wrappers for nativesdk support
> 
> Robert Yang (3):
>    runqemu-extract-sdk: allow install debugfs on rootfs
>    oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN
>    site/powerpc64-linux: add cvs_cv_func_printf_ptr
> 
> Shan Hai (1):
>    xinetd: add Init Script Actions to xinetd script
> 
> Yadi.hu (1):
>    busybox: handle syslog
> 
> Yuanjie Huang (1):
>    gcc-sanitizers: Fix libtool .la files
> 
> Yue Tao (1):
>    initscripts: Avoid starting rpcbind daemon twice
> 
>   meta/classes/base.bbclass                          |  16 ++-
>   meta/classes/image.bbclass                         |   2 +-
>   meta/classes/populate_sdk_ext.bbclass              |   6 +
>   meta/classes/rootfs-postcommands.bbclass           |  25 +++-
>   meta/classes/toolchain-scripts.bbclass             |  13 ++-
>   meta/conf/bitbake.conf                             |   2 +-
>   meta/lib/oe/copy_buildsystem.py                    |  18 +++
>   .../openssl/openssl/environment.d-openssl.sh       |   1 +
>   meta/recipes-connectivity/openssl/openssl10.inc    |   7 ++
>   .../recipes-connectivity/openssl/openssl_1.0.2o.bb |   5 +
>   .../recipes-connectivity/openssl/openssl_1.1.0h.bb |  11 ++
>   meta/recipes-core/busybox/busybox.inc              |  14 ++-
>   meta/recipes-core/dbus/dbus-test_1.12.8.bb         |   6 +-
>   meta/recipes-core/dbus/dbus_1.12.8.bb              |   4 +-
>   meta/recipes-core/dropbear/dropbear.inc            |   3 +
>   .../dropbear/dropbear/dropbear.default             |   2 +
>   meta/recipes-core/glibc/glibc-package.inc          |   5 +-
>   .../initrdscripts/files/init-install.sh            |   2 +
>   .../initscripts/initscripts-1.0/mountnfs.sh        |   9 +-
>   meta/recipes-devtools/gcc/gcc-sanitizers.inc       |   2 +
>   meta/recipes-devtools/rpm/rpm_4.14.1.bb            |  42 ++++---
>   meta/recipes-extended/at/at_3.1.20.bb              |   6 +
>   meta/recipes-extended/gawk/gawk_4.2.1.bb           |   2 +
>   .../files/Configure-fix-LSOF_CCV-assignment.patch  |  31 +++++
>   meta/recipes-extended/lsof/lsof_4.89.bb            |   4 +-
>   .../rpcbind_add_option_to_fix_port_number.patch    | 130 +++++++++++++++++++++
>   meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb     |   1 +
>   meta/recipes-extended/shadow/files/pam.d/chpasswd  |   2 +
>   meta/recipes-extended/shadow/files/pam.d/newusers  |   2 +
>   meta/recipes-extended/shadow/shadow.inc            |   3 +-
>   meta/recipes-extended/xinetd/xinetd/xinetd.init    |  12 +-
>   meta/site/powerpc64-linux                          |   2 +
>   scripts/runqemu-extract-sdk                        |   4 +-
>   33 files changed, 355 insertions(+), 39 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.default
>   create mode 100644 meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch
>   create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
> 


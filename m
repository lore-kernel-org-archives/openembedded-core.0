Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C46078A9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 03:58:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w633wqCm010390
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Jul 2018 20:58:52 -0700 (PDT)
Received: from [128.224.16.192] (128.224.16.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 2 Jul 2018 20:58:51 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <8feb3fc5-6832-fc8c-384c-0d7497968e61@windriver.com>
Date: Tue, 3 Jul 2018 11:58:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1528252931.git.liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 00/11] meta: various fixes
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
X-List-Received-Date: Tue, 03 Jul 2018 03:58:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi RP and Ross,

Any comments on these, please ?

// Robert

On 06/06/2018 10:54 AM, Robert Yang wrote:
> * V3:
>    - Fix RP's comments
>      Fix comments for "lsof: fix LSOF_CCV in version.h"
>      Fix "rootfs-postcommands: split ssh_allow_empty_password" since it caused a oe-selftest case failed.
> 
>    - Drop already merge commits
> 
>    - Drop unneeded commit:
>      gcc-sanitizers: Fix libtool .la files
> 
>    - Drop an incorrect commit which caused oe-selftest failed:
>      glibc: re-package for libnss-db
>      This one needs rework.
> 
>    - Ran "oe-selftest -a" to test it.
> 
> * V2:
>    Rebase to up-to-date master branch and drop already merged patches.
> 
> * V1: Initial version
> 
> // Robert
> 
> The following changes since commit cd195bdf5dd2c8ff03c58a63dcabe88b142d2a9c:
> 
>    oe-pkgdata-util: package-info: Re-add support for the --extra option (2018-06-04 15:14:43 +0100)
> 
> are available in the git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/fix_from_wr
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/fix_from_wr
> 
> Chen Qi (1):
>    populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES
> 
> Jackie Huang (2):
>    rootfs-postcommands: split ssh_allow_empty_password
>    dropbear: add default config file to disable root login
> 
> Jian Liu (1):
>    lsof: fix LSOF_CCV in version.h
> 
> Kai Kang (1):
>    toolchain-scripts.bbclass: do not extend dependency if extended
>      already
> 
> Li Wang (1):
>    rpcbind: add option to make user able to use fixed port number
> 
> Mark Hatle (1):
>    base.bbclass: Add buildcfg multilib values
> 
> Ovidiu Panait (1):
>    openssl-nativesdk: Fix "can't open config file" warning
> 
> Robert Yang (1):
>    oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN
> 
> Shan Hai (1):
>    xinetd: add Init Script Actions to xinetd script
> 
> Yadi.hu (1):
>    busybox: handle syslog
> 
>   meta/classes/base.bbclass                          |  13 ++-
>   meta/classes/image.bbclass                         |   2 +-
>   meta/classes/populate_sdk_ext.bbclass              |   6 +
>   meta/classes/rootfs-postcommands.bbclass           |  25 +++-
>   meta/classes/toolchain-scripts.bbclass             |  13 ++-
>   meta/conf/bitbake.conf                             |   2 +-
>   meta/lib/oe/copy_buildsystem.py                    |  18 +++
>   meta/lib/oeqa/selftest/cases/imagefeatures.py      |   4 +-
>   .../openssl/openssl/environment.d-openssl.sh       |   1 +
>   meta/recipes-connectivity/openssl/openssl10.inc    |   7 ++
>   .../recipes-connectivity/openssl/openssl_1.0.2o.bb |   5 +
>   .../recipes-connectivity/openssl/openssl_1.1.0h.bb |  11 ++
>   meta/recipes-core/busybox/busybox.inc              |  14 ++-
>   meta/recipes-core/dropbear/dropbear.inc            |   3 +
>   .../dropbear/dropbear/dropbear.default             |   2 +
>   .../files/Configure-fix-LSOF_CCV-assignment.patch  |  42 +++++++
>   meta/recipes-extended/lsof/lsof_4.89.bb            |   4 +-
>   .../rpcbind_add_option_to_fix_port_number.patch    | 130 +++++++++++++++++++++
>   meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb     |   1 +
>   meta/recipes-extended/xinetd/xinetd/xinetd.init    |  12 +-
>   20 files changed, 299 insertions(+), 16 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.default
>   create mode 100644 meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch
>   create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
> 


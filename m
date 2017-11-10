Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E20578637
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:35:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADZ6ZF003980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:35:08 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.193) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:35:06 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <ad44d334-e180-b2ef-e50b-7d7a970ca784@windriver.com>
Date: Fri, 10 Nov 2017 21:34:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 00/23] Fixes for multilib and eSDK
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
X-List-Received-Date: Fri, 10 Nov 2017 13:35:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sorry, the time on the server was wrong, so the email send time was wrong,
I fixed it just now.

// Robert

On 11/10/2017 02:27 PM, Robert Yang wrote:
> The following changes since commit f706448952c942d25ea96cda09a700d2c5c63520:
> 
>    maintainers.inc: add Otavio Salvador for go-dep (2017-11-09 12:33:12 +0000)
> 
> are available in the git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/multilib_sdk
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/multilib_sdk
> 
> Robert Yang (23):
>    staging.bbclass: make subprocess.check_output() capture stderr
>    testsdk.bbclass: add a newline after own-mirrors
>    populate_sdk_ext.bbclass: don't rename layers when failed
>    oe/copy_buildsystem.py: make sure layer exists
>    staging.bbclass: fix for multilib
>    populate_sdk_ext.bbclass: fix for multilib
>    sstate.bbclass: sstate_hardcode_path(): fix for multilib
>    staging.bbclass: staging_populate_sysroot_dir(): fix for multilib
>    staging.bbclass: print searched manifest when not found
>    staging.bbclass: extend_recipe_sysroot(): search multilib manifest
>    image.bbclass: remove depmodwrapper-cross from DEPENDS
>    package_manager.py: print running dnf command
>    package_manager.py: reverse archs correctly
>    package_manager.py: remove obsolete MULTILIB_ARCHS
>    multilib.bbclass: remove unneeded bb.data.inherits_class()
>    multilib.bbclass: remove obsolete DEFAULTTUNE_ML_
>    multilib.bbclass: remove invalid PACKAGE_INSTALL
>    multilib_global.bbclass: fix indent
>    volatile-binds: use PN to replace hardcode name
>    multilib.bbclass: extend allarch recipes
>    toolchain-scripts.bbclass: only install all MULTILIB_VARIANTS for
>      image
>    populate_sdk_ext.bbclass: disable for multilib image
>    populate_sdk_ext.bbclass: remove the try...finally
> 
>   meta/classes/allarch.bbclass                       |   3 -
>   meta/classes/image.bbclass                         |   2 +-
>   meta/classes/multilib.bbclass                      |   8 -
>   meta/classes/multilib_global.bbclass               |   6 +-
>   meta/classes/package.bbclass                       |   9 --
>   meta/classes/populate_sdk_ext.bbclass              | 161 +++++++++++++--------
>   meta/classes/sstate.bbclass                        |   6 +-
>   meta/classes/staging.bbclass                       |  46 +++++-
>   meta/classes/testsdk.bbclass                       |   5 +-
>   meta/classes/toolchain-scripts.bbclass             |   6 +
>   meta/lib/oe/copy_buildsystem.py                    |   2 +-
>   meta/lib/oe/package_manager.py                     |  55 ++++++-
>   meta/recipes-core/volatile-binds/volatile-binds.bb |   2 +-
>   13 files changed, 207 insertions(+), 104 deletions(-)
> 


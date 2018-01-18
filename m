Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBDE5786B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 09:34:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0I9Z0Sb024363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 01:35:00 -0800
Received: from localhost.localdomain (128.224.163.240) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 18 Jan 2018 01:34:59 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1515403603.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <af2c70ff-edfa-fa06-b669-3fdce584b024@windriver.com>
Date: Thu, 18 Jan 2018 17:35:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <cover.1515403603.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 00/12 V2] Fixes for multilib and eSDK
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
X-List-Received-Date: Thu, 18 Jan 2018 09:34:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Two of the patches have been merged, so I rebased others and put them to:

   git://git.openembedded.org/openembedded-core-contrib rbt/multilib
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/multilib

Robert Yang (10):
   staging.bbclass: fix for multilib
   populate_sdk_ext.bbclass: fix for multilib
   staging.bbclass: staging_populate_sysroot_dir(): fix for multilib
   staging.bbclass: print searched manifest when not found
   staging.bbclass: extend_recipe_sysroot(): search multilib manifest
   package_manager.py: reverse archs correctly
   multilib.bbclass: extend allarch recipes
   toolchain-scripts.bbclass: only install all MULTILIB_VARIANTS for
     image
   multilib.bbclass: deltask populate_sdk and populate_sdk_ext
   populate_sdk_ext.bbclass: remove the try...finally

// Robert

On 01/08/2018 05:32 PM, Robert Yang wrote:
> * V2
>    + Drop already merged patches
> 
>    + Fix RP's comments:
>      - deltask populate_sdk and populate_sdk_ext for multilib
>      - Drop "image.bbclass: remove depmodwrapper-cross from DEPENDS"
>      - sstate.bbclass: sstate_hardcode_path(): fix for multilib
>        > fix the grep command
> 
> * V1
>    - Initial version
> 
> // Robert
> 
> The following changes since commit e9dfe7eb7f61b909ae7d034e80cfbebc1fad018b:
> 
>    icu-dbg: improve reproducibility (2018-01-08 08:45:33 +0000)
> 
> are available in the git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib oem1
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=oem1
> 
> Robert Yang (12):
>    staging.bbclass: fix for multilib
>    populate_sdk_ext.bbclass: fix for multilib
>    sstate.bbclass: sstate_hardcode_path(): fix for multilib
>    staging.bbclass: staging_populate_sysroot_dir(): fix for multilib
>    staging.bbclass: print searched manifest when not found
>    staging.bbclass: extend_recipe_sysroot(): search multilib manifest
>    package_manager.py: reverse archs correctly
>    multilib.bbclass: remove invalid PACKAGE_INSTALL
>    multilib.bbclass: extend allarch recipes
>    toolchain-scripts.bbclass: only install all MULTILIB_VARIANTS for
>      image
>    multilib.bbclass: deltask populate_sdk and populate_sdk_ext
>    populate_sdk_ext.bbclass: remove the try...finally
> 
>   meta/classes/allarch.bbclass           |   3 -
>   meta/classes/multilib.bbclass          |   8 +-
>   meta/classes/multilib_global.bbclass   |   4 +-
>   meta/classes/package.bbclass           |   9 ---
>   meta/classes/populate_sdk_ext.bbclass  | 142 +++++++++++++++++++--------------
>   meta/classes/sstate.bbclass            |   8 +-
>   meta/classes/staging.bbclass           |  40 +++++++++-
>   meta/classes/toolchain-scripts.bbclass |   6 ++
>   meta/lib/oe/package_manager.py         |  57 +++++++++++--
>   9 files changed, 186 insertions(+), 91 deletions(-)
> 


Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFE97060A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 22:35:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jul 2014 15:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,688,1400050800"; d="scan'208";a="572055762"
Received: from unknown (HELO [10.255.13.17]) ([10.255.13.17])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2014 15:35:07 -0700
Message-ID: <53C9A11B.3020805@linux.intel.com>
Date: Fri, 18 Jul 2014 15:35:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1405542583.git.ross.burton@intel.com>
	<934289b8ba6a8b7a0f1eec8aabf723f823d515d8.1405542583.git.ross.burton@intel.com>
In-Reply-To: <934289b8ba6a8b7a0f1eec8aabf723f823d515d8.1405542583.git.ross.burton@intel.com>
Subject: Re: [PATCH 2/2] default-distrovars: update license whitelists to use canonical names
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
X-List-Received-Date: Fri, 18 Jul 2014 22:35:14 -0000
X-Groupsio-MsgNum: 55230
Content-Type: multipart/mixed; boundary="------------080402080607080808060503"

--------------080402080607080808060503
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2014 02:08 PM, Ross Burton wrote:
> Now that all licenses are canonicalised to SPDX names when processing, we need
> to rename the whitelists to the match.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/conf/distro/include/default-distrovars.inc |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 1bc8e46..8d24d66 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -23,9 +23,9 @@ IMAGE_FEATURES ?= ""
>
>   # This is a list of packages that are used by the build system to build the distribution, they are not
>   # directly part of the distribution.
> -HOSTTOOLS_WHITELIST_GPLv3 ?= ""
> -WHITELIST_GPLv3 ?= "less"
> -LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc libgcc-initial gcc-runtime"
> +HOSTTOOLS_WHITELIST_GPL-3.0 ?= ""
> +WHITELIST_GPL-3.0 ?= "less"
> +LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan gnutls libtasn1 libidn libgcc libgcc-initial gcc-runtime"
>

This change seems to make multilib builds unhappy, both on the 
Autobuilder and locally, see attached output.

Sau!

>   COMMERCIAL_AUDIO_PLUGINS ?= ""
>   # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
>

--------------080402080607080808060503
Content-Type: text/plain; charset=UTF-8;
 name="cranky_multilib_build"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="cranky_multilib_build"

Parsing recipes...ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xaa61110>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xc2d9bd0>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x2eec3d0>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Unable to parse /srv/ssd/poky/meta-yocto/recipes-core/tiny-init/tiny-init.bb
Traceback (most recent call last):
  File "/srv/ssd/poky/bitbake/lib/bb/parse/ast.py", line 320, in finalize(fn='/srv/ssd/poky/meta-yocto/recipes-core/tiny-init/tiny-init.bb', d=<bb.data_smart.DataSmart object at 0x4eb9690>, variant='multilib:lib32'):
     
    >    bb.event.fire(bb.event.RecipePreFinalise(fn), d)
     
  File "/srv/ssd/poky/bitbake/lib/bb/event.py", line 158, in fire(event=<bb.event.RecipePreFinalise object at 0xaa61110>, d=<bb.data_smart.DataSmart object at 0x4eb9690>):
     
    >    fire_class_handlers(event, d)
         if worker_fire:
  File "/srv/ssd/poky/bitbake/lib/bb/event.py", line 97, in fire_class_handlers(event=<bb.event.RecipePreFinalise object at 0xaa61110>, d=<bb.data_smart.DataSmart object at 0x4eb9690>):
             if name in _catchall_handlers or name in evt_hmap:
    >            execute_handler(name, handler, event, d)
     
  File "/srv/ssd/poky/bitbake/lib/bb/event.py", line 74, in execute_handler(name='multilib_virtclass_handler', handler=<function multilib_virtclass_handler at 0x2eff140>, event=<bb.event.RecipePreFinalise object at 0xaa61110>, d=<bb.data_smart.DataSmart object at 0x4eb9690>):
         try:
    >        ret = handler(event)
         except (bb.parse.SkipRecipe, bb.BBHandledException):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xaa61110>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x92ef390>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xa0bdb10>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xa704050>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x251b110>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xc2bf550>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x9fa5c10>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x251b110>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xc2d00d0>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xc2d9150>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x92efc90>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x2ede8d0>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xc2d0ed0>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x4eccd90>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x4eb9c10>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x2eecb10>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x9205fd0>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xc2eab10>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x92ef650>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x2ed4c90>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x251b110>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x92efad0>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0xc2e6510>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x2ede890>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x9b6f390>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x920a850>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x9d6e590>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x4eb4f10>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x2edea90>)
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Execution of event handler 'multilib_virtclass_handler' failed
Traceback (most recent call last):
  File "multilib_virtclass_handler(e)", line 55, in multilib_virtclass_handler(e=<bb.event.RecipePreFinalise object at 0x2ee7d90>)
AttributeError: 'NoneType' object has no attribute 'split'


Summary: There were 33 ERROR messages shown, returning a non-zero exit code.

--------------080402080607080808060503--

Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A86E173BBE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 16:53:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jun 2015 09:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,553,1427785200"; d="scan'208";a="720846563"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.173])
	([10.219.4.173])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2015 09:52:59 -0700
Message-ID: <557082C8.2090907@linux.intel.com>
Date: Thu, 04 Jun 2015 11:54:32 -0500
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1433274434.git.anibal.limon@linux.intel.com>
	<CAJTo0LbAsutsVamsW4mYt8rKHL069DKFKhWMYhwMK-o9tcabwQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbAsutsVamsW4mYt8rKHL069DKFKhWMYhwMK-o9tcabwQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] recipeutils adds get_recipe_upstream_version and distrodata fixes
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
X-List-Received-Date: Thu, 04 Jun 2015 16:53:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross,

The problem is i forget to add v2 to the patch [1] that is a new version 
of the patch [2], sorry
about that.

Kind regards,
     alimon

[1] 
http://lists.openembedded.org/pipermail/openembedded-core/2015-June/105576.html
[2] 
http://lists.openembedded.org/pipermail/openembedded-core/2015-June/105534.html

On 04/06/15 11:09, Burton, Ross wrote:
> On 2 June 2015 at 20:49, Aníbal Limón <anibal.limon@linux.intel.com> wrote:
>
>> Aníbal Limón (4):
>>    recipeutils: Add get_recipe_upstream_version and
>>      get_recipe_pv_without_srcpv functions
>>    distrodata: Remove unnecessary include of package_regex.inc
>>    distrodata: checkpkg make usage of
>>      oe.recipeutils.get_recipe_upstream_version
>>    distrodata: Use Python CSV instead of did by hand
>>
> This series is causing this error if I run core-image-sato -c checkpkgall:
>
> ERROR: Error executing a python function in
> /home/ross/Yocto/poky/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'do_checkpkg', lineno: 126, function: <module>
>       0122:            f.close()
>       0123:        bb.utils.unlockfile(lf)
>       0124:
>       0125:
>   *** 0126:do_checkpkg(d)
>       0127:
> File: 'do_checkpkg', lineno: 87, function: do_checkpkg
>       0083:        """Set upstream version status"""
>       0084:        if not pupver:
>       0085:            pupver = "N/A"
>       0086:        else:
>   *** 0087:            pv, _, _ =
> oe.recipeutils.get_recipe_pv_without_srcpv(pversion, uri_type)
>       0088:            upv, _, _ =
> oe.recipeutils.get_recipe_pv_without_srcpv(pupver, uri_type)
>       0089:
>       0090:            cmp = vercmp_string(pv, upv)
>       0091:            if cmp == -1:
> File: '/home/ross/Yocto/poky/meta/lib/oe/recipeutils.py', lineno: 641,
> function: get_recipe_pv_without_srcpv
>       0637:    pfx = ''
>       0638:    sfx = ''
>       0639:
>       0640:    if uri_type == 'git':
>   *** 0641:        rd_tmp = rd.createCopy()
>       0642:
>       0643:        rd_tmp.setVar('SRCPV', '')
>       0644:        pv = rd_tmp.getVar('PV', True)
>       0645:
> Exception: AttributeError: 'str' object has no attribute 'createCopy'
>
> Ross
>



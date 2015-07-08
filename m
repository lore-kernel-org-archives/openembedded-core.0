Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B8BB673B10
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 07:21:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t687LUqn007181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 00:21:34 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Jul 2015 00:21:30 -0700
Message-ID: <559CCF76.9030003@windriver.com>
Date: Wed, 8 Jul 2015 15:21:26 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1436336498.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1436336498.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/3] Upgrade smartpm, less and elfutils
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
X-List-Received-Date: Wed, 08 Jul 2015 07:21:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Sorry, please drop this threads, I sent the wrong ones.

// Robert

On 07/08/2015 02:31 PM, Robert Yang wrote:
> Tested world core-image-sato core-image-sato-sdk build on:
> qemux86
> qemux86-64
> qemuarm
> qemuarm64
> qemuppc
> qemumpis
>
> Also tested core-image-sato on rpm_4.11.2.
>
> // Robert
>
> The following changes since commit df6ddc4bf9795212fda87f9d401893eb254074da:
>
>    file: fix long-options (2015-07-07 23:57:14 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/PU
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU
>
> Robert Yang (3):
>    less: 471 -> 478
>    elfutils: 0.162 -> 0.163
>    python-smartpm: 1.4.1 -> 1.5
>
>   ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
>   .../0001-remove-the-unneed-checking.patch          |    0
>   .../arm_backend.diff                               |    0
>   .../arm_func_value.patch                           |    0
>   .../arm_unwind_ret_mask.patch                      |    0
>   .../fixheadercheck.patch                           |    0
>   .../hppa_backend.diff                              |    0
>   .../m68k_backend.diff                              |    0
>   .../mips_backend.diff                              |    0
>   .../mips_readelf_w.patch                           |    0
>   .../non_linux.patch                                |    0
>   .../redhat-portability.diff                        |    0
>   .../scanf-format.patch                             |    0
>   .../testsuite-ignore-elflint.diff                  |    0
>   .../uclibc-support-for-elfutils-0.161.patch        |    0
>   .../{elfutils_0.162.bb => elfutils_0.163.bb}       |    4 +-
>   .../python/python-smartpm/smart-attempt.patch      |  164 ++-
>   .../smart-config-ignore-all-recommends.patch       |   24 -
>   .../python-smartpm/smart-conflict-provider.patch   |  196 ----
>   .../python/python-smartpm/smart-dflags.patch       |   45 -
>   .../python-smartpm/smart-filename-NAME_MAX.patch   |   35 -
>   .../smart-flag-exclude-packages.patch              |   70 --
>   .../smart-flag-ignore-recommends.patch             |   60 --
>   .../smart-improve-error-reporting.patch            |  168 +---
>   .../python-smartpm/smart-metadata-match.patch      |   28 -
>   .../python-smartpm/smart-multilib-fixes.patch      |   22 -
>   .../python/python-smartpm/smart-recommends.patch   | 1051 +-------------------
>   .../python-smartpm/smart-rpm-extra-macros.patch    |   27 -
>   .../python/python-smartpm/smart-rpm-md-parse.patch |   26 -
>   .../python/python-smartpm/smart-rpm-root.patch     |   80 --
>   .../python/python-smartpm/smart-tmpdir.patch       |   30 -
>   .../python/python-smartpm/smart-yaml-error.patch   |   86 --
>   .../python/python-smartpm/smartpm-rpm5-nodig.patch |   47 +-
>   .../python/python-smartpm_1.4.1.bb                 |   23 +-
>   ...ossible-buffer-overrun-with-invalid-UTF-8.patch |   49 -
>   .../less/{less_471.bb => less_478.bb}              |    7 +-
>   36 files changed, 137 insertions(+), 2105 deletions(-)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/0001-remove-the-unneed-checking.patch (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/arm_backend.diff (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/arm_func_value.patch (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/arm_unwind_ret_mask.patch (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/fixheadercheck.patch (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/hppa_backend.diff (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/m68k_backend.diff (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/mips_backend.diff (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/mips_readelf_w.patch (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/non_linux.patch (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/redhat-portability.diff (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/scanf-format.patch (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/testsuite-ignore-elflint.diff (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils-0.162 => elfutils-0.163}/uclibc-support-for-elfutils-0.161.patch (100%)
>   rename meta/recipes-devtools/elfutils/{elfutils_0.162.bb => elfutils_0.163.bb} (95%)
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-filename-NAME_MAX.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch
>   delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-yaml-error.patch
>   delete mode 100644 meta/recipes-extended/less/less/0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch
>   rename meta/recipes-extended/less/{less_471.bb => less_478.bb} (78%)
>


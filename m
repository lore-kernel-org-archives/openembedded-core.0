Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFFE87318D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 03:23:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0L3Ni5t026049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jan 2016 19:23:45 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jan 2016 19:23:44 -0800
To: Khem Raj <raj.khem@gmail.com>, "Maxin B. John" <maxin.john@intel.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
	<f457364648f238d8b0353c2f7d14a5b08ed427fe.1452472146.git.hongxu.jia@windriver.com>
	<20160120150754.GA26306@mbabyjoh-mobl.fi.intel.com>
	<EFF0F4EC-126D-4B7A-B276-32850ABFEB56@gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56A04F3D.8000902@windriver.com>
Date: Thu, 21 Jan 2016 11:23:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <EFF0F4EC-126D-4B7A-B276-32850ABFEB56@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/9] elfutils: 0.163 -> 0.164
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
X-List-Received-Date: Thu, 21 Jan 2016 03:23:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 01/21/2016 01:16 AM, Khem Raj wrote:
>> On Jan 20, 2016, at 7:07 AM, Maxin B. John <maxin.john@intel.com> wrote:
>>
>> Hi,
>>
>> On Mon, Jan 11, 2016 at 08:30:32AM +0800, Hongxu Jia wrote:
>>> Update patches from debian
>>> http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.164-1.debian.tar.xz
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>> .../elfutils/elfutils-0.163/arm_func_value.patch   |  165 ----
>>> .../elfutils-0.163/arm_unwind_ret_mask.patch       |   83 --
>>> .../elfutils/elfutils-0.163/non_linux.patch        |   35 -
>>> .../elfutils-0.163/redhat-portability.diff         | 1021 --------------------
>>> .../elfutils/elfutils-0.163/scanf-format.patch     |   40 -
>>> .../uclibc-support-for-elfutils-0.161.patch        |  106 --
>>> ...ferences-between-mips-machine-identifiers.patch |   34 +
>>> ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
>>> .../0001-fix-a-stack-usage-warning.patch           |    0
>>> .../0001-remove-the-unneed-checking.patch          |    0
>>> ...-support-for-mips64-abis-in-mips_retval.c.patch |  168 ++++
>>> .../0003-Add-mips-n64-relocation-format-hack.patch |  226 +++++
>>> .../arm_backend.diff                               |  389 ++++----
>>> .../fixheadercheck.patch                           |    0
>>> .../hppa_backend.diff                              |   69 +-
>>> .../elfutils/elfutils-0.164/kfreebsd_path.patch    |   15 +
>>> .../m68k_backend.diff                              |   61 +-
>>> .../mips_backend.diff                              |   71 +-
>>> .../mips_readelf_w.patch                           |    8 +-
>>> .../testsuite-ignore-elflint.diff                  |    0
>>> .../{elfutils_0.163.bb => elfutils_0.164.bb}       |   15 +-
>>> 21 files changed, 735 insertions(+), 1771 deletions(-)
>>> delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/arm_func_value.patch
>>> delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/arm_unwind_ret_mask.patch
>>> delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/non_linux.patch
>>> delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/redhat-portability.diff
>>> delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/scanf-format.patch
>>> delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch
>> Here, the patch uclibc-support-for-elfutils-0.161.patch was removed.
>> However, it is still referenced in the recipe. It should be updated
>> to fix build error with uclibc.
>>
>> WARNING: Failed to fetch URL file://uclibc-support-for-elfutils-0.161.patch, attempting MIRRORS if available
>> ERROR: Fetcher failure: Unable to find file file://uclibc-support-for-elfutils-0.161.patch anywhere. The paths that were searched were:
>> …
> its already fixed in my musl pull request.

Oh, sorry for the incorrectly deleting, thanks Khem to fix it.

//Hongxu


>> Best Regards,
>> Maxin
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB807F2B6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 01:27:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7N1RdX9012318
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2019 18:27:39 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 22 Aug 2019 18:27:26 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <1566438018-16251-1-git-send-email-hongxu.jia@windriver.com>
	<1566438018-16251-3-git-send-email-hongxu.jia@windriver.com>
	<c23770674c0d20493ba564fe32a4503d78571480.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <6323a64a-4573-1abc-9157-ed631f3e0436@windriver.com>
Date: Fri, 23 Aug 2019 09:27:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c23770674c0d20493ba564fe32a4503d78571480.camel@linuxfoundation.org>
Subject: Re: [PATCH 3/3] elfutils: 0.176 -> 0.177
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
X-List-Received-Date: Fri, 23 Aug 2019 01:27:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/22/19 9:27 PM, Richard Purdie wrote:
> On Thu, 2019-08-22 at 09:40 +0800, Hongxu Jia wrote:
>> - Update Debian patches
>>    
>> http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
>>
>> - Rebase Debian patches to 0.177
>>    debian/hppa_backend.diff
>>    debian/mips_backend.diff
>>    debian/arm_backend.diff
>>    debian/mips_readelf_w.patch
>>    debian/testsuite-ignore-elflint.diff
>>    debian/mips_cfi.patch
>>
>> - Fix build failure while applying debian patches
>>    0001-fix-compile-failure-with-debian-patches.patch
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../{elfutils_0.176.bb => elfutils_0.177.bb}       |   8 +-
>>   ...ferences-between-mips-machine-identifiers.patch |  12 +-
>>   ...1-fix-compile-failure-with-debian-patches.patch |  48 ++++++++
>>   ...-support-for-mips64-abis-in-mips_retval.c.patch |  13 +-
>>   .../0003-Add-mips-n64-relocation-format-hack.patch |  60 +++++-----
>>   .../elfutils/files/debian/arm_backend.diff         |  39 +++---
>>   .../elfutils/files/debian/disable_werror.patch     |  19 +--
>>   .../elfutils/files/debian/hppa_backend.diff        |  57 +++++----
>>   .../elfutils/files/debian/hurd_path.patch          |  17 +--
>>   .../elfutils/files/debian/ignore_strmerge.diff     |  15 +--
>>   .../elfutils/files/debian/kfreebsd_path.patch      |  13 +-
>>   .../elfutils/files/debian/mips_backend.diff        |  42 ++++---
>>   .../elfutils/files/debian/mips_cfi.patch           | 131
>> +++++++++++++++++++++
>>   .../elfutils/files/debian/mips_readelf_w.patch     |  22 ++--
>>   .../files/debian/testsuite-ignore-elflint.diff     |  22 ++--
>>   15 files changed, 340 insertions(+), 178 deletions(-)
>>   rename meta/recipes-devtools/elfutils/{elfutils_0.176.bb =>
>> elfutils_0.177.bb} (95%)
>>   create mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-
>> fix-compile-failure-with-debian-patches.patch
>>   create mode 100644 meta/recipes-
>> devtools/elfutils/files/debian/mips_cfi.patch
> I think the musl patches need refreshing as there are warnings:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/962
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/963

Sorry, I forget to do it, v2 incoming

//Hongxu


> Cheers,
>
> Richard
>



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5112273E11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:54:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7LAs3pr000315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Aug 2015 03:54:03 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 21 Aug 2015 03:54:03 -0700
Message-ID: <55D70349.7080003@windriver.com>
Date: Fri, 21 Aug 2015 18:54:01 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1440145857.git.liezhi.yang@windriver.com>
	<74b4262e5df004800e56b273e7d7a3d64d7af9b3.1440145857.git.liezhi.yang@windriver.com>
	<CAHiDW_HqD908Y_F7i6kFNrLhD4UohnUp1FSMtF-aVnCoW=A7TQ@mail.gmail.com>
In-Reply-To: <CAHiDW_HqD908Y_F7i6kFNrLhD4UohnUp1FSMtF-aVnCoW=A7TQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] btrfs-tools: 4.1.1 -> 4.1.2
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
X-List-Received-Date: Fri, 21 Aug 2015 10:54:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/21/2015 06:47 PM, Jussi Kukkonen wrote:
> On 21 August 2015 at 13:15, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../btrfs-tools/btrfs-tools_git.bb                 |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> index 4ad4b81..15cc3f2 100644
>> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
>>   SECTION = "base"
>>   DEPENDS = "util-linux attr e2fsprogs lzo acl"
>>
>> -SRCREV = "20be329fdb569fefdf88ba0e4ca1a41488fcbc19"
>> +SRCREV = "7f1328ccb5d159efe850d4eaea9b49bbe8c4181e"
>>   SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
>>              file://fix-parallel.patch \
>>   "
>> --
>
> Is there no PV change here?

Thanks, I updated in the repo.

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb 
b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index 4ad4b81..ae6c8f4 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = 
"file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
  SECTION = "base"
  DEPENDS = "util-linux attr e2fsprogs lzo acl"

-SRCREV = "20be329fdb569fefdf88ba0e4ca1a41488fcbc19"
+SRCREV = "7f1328ccb5d159efe850d4eaea9b49bbe8c4181e"
  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
             file://fix-parallel.patch \
  "
@@ -27,6 +27,6 @@ do_configure_prepend() {

  S = "${WORKDIR}/git"

-PV = "4.1.1+git${SRCPV}"
+PV = "4.1.2+git${SRCPV}"


// Robert

>
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


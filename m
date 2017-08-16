Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4351677EFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 07:09:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G79bFX024674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Aug 2017 00:09:37 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 00:09:36 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1502846743.git.kai.kang@windriver.com>
	<03c66574d747ad8186978debb07bce4a2ffc7726.1502846743.git.kai.kang@windriver.com>
	<CAMKF1sr+QhxS-4cGJGsh1Vaj0U-J4gp=t+VVtZBE9b1wocypZw@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <3f0e2c47-f680-a115-d349-29376bd9b2fc@windriver.com>
Date: Wed, 16 Aug 2017 15:11:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr+QhxS-4cGJGsh1Vaj0U-J4gp=t+VVtZBE9b1wocypZw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nss: 3.30.2 -> 3.31.1
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
X-List-Received-Date: Wed, 16 Aug 2017 07:09:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年08月16日 11:27, Khem Raj wrote:
> On Tue, Aug 15, 2017 at 6:26 PM,  <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Upgrade nss from 3.30.2 to latest stable version 3.31.1.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-support/nss/{nss_3.30.2.bb => nss_3.31.1.bb} | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>   rename meta/recipes-support/nss/{nss_3.30.2.bb => nss_3.31.1.bb} (96%)
>>
>> diff --git a/meta/recipes-support/nss/nss_3.30.2.bb b/meta/recipes-support/nss/nss_3.31.1.bb
>> similarity index 96%
>> rename from meta/recipes-support/nss/nss_3.30.2.bb
>> rename to meta/recipes-support/nss/nss_3.31.1.bb
>> index 6683e5c..955862f 100644
>> --- a/meta/recipes-support/nss/nss_3.30.2.bb
>> +++ b/meta/recipes-support/nss/nss_3.31.1.bb
>> @@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
>>                       file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
>>                       file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
>>
>> -SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_30_2_RTM/src/${BP}.tar.gz \
>> +VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
>> +
>> +SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
>>              file://nss.pc.in \
>>              file://signlibs.sh \
>>              file://0001-nss-fix-support-cross-compiling.patch \
>> @@ -24,10 +26,10 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_30
>>              file://disable-Wvarargs-with-clang.patch \
>>              file://pqg.c-ULL_addend.patch \
>>              file://Fix-compilation-for-X32.patch \
>> -           file://0001-Fix-warnings-found-with-gcc7.patch \
> Did you forget to delete the patch file ? it should be deleted if not
> needed anymore.

Forgot it. I'll send V2. Thanks.

--Kai

>
>>              "
>> -SRC_URI[md5sum] = "42c22dd8ec6254f846259f1d8dd2eb76"
>> -SRC_URI[sha256sum] = "0d4a77ff26bcee79fa8afe0125e0df6ae9e798b6b36782fa29e28febf7cfce24"
>> +
>> +SRC_URI[md5sum] = "ebb44f1394250d2cf6ec3c2e3d71fa20"
>> +SRC_URI[sha256sum] = "933439214dc03ee60e86d1419c19e1568998b0776dde987f41fa70ced6cd08dc"
>>
>>   UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
>>   UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
>> --
>> 2.10.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Regards,
Neil | Kai Kang



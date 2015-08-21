Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBAF673E11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:54:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7LAsvQ9000379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Aug 2015 03:54:57 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 21 Aug 2015 03:54:57 -0700
Message-ID: <55D7037F.3020509@windriver.com>
Date: Fri, 21 Aug 2015 18:54:55 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1440145857.git.liezhi.yang@windriver.com>
	<9dd6d914345f37e8584ef7a879afbe2d2e1835b8.1440145857.git.liezhi.yang@windriver.com>
	<CAHiDW_HjW089mLdSNCKxtTjRdY9rLzs0G-okYrCrjJRyN_TxYQ@mail.gmail.com>
In-Reply-To: <CAHiDW_HjW089mLdSNCKxtTjRdY9rLzs0G-okYrCrjJRyN_TxYQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] man-pages: 4.01 -> 4.02
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
X-List-Received-Date: Fri, 21 Aug 2015 10:54:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/21/2015 06:45 PM, Jussi Kukkonen wrote:
> On 21 August 2015 at 13:15, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../{man-pages_4.01.bb => man-pages_4.02.bb}       |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta/recipes-extended/man-pages/{man-pages_4.01.bb => man-pages_4.02.bb} (86%)
>
> Maxin sent this patch yesterday already.

Thanks, I dropped this one in the repo.

// Robert

>
>   - Jussi
>
>>
>> diff --git a/meta/recipes-extended/man-pages/man-pages_4.01.bb b/meta/recipes-extended/man-pages/man-pages_4.02.bb
>> similarity index 86%
>> rename from meta/recipes-extended/man-pages/man-pages_4.01.bb
>> rename to meta/recipes-extended/man-pages/man-pages_4.02.bb
>> index f6a5c49..1b90a44 100644
>> --- a/meta/recipes-extended/man-pages/man-pages_4.01.bb
>> +++ b/meta/recipes-extended/man-pages/man-pages_4.02.bb
>> @@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
>>   LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
>>   SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
>>
>> -SRC_URI[md5sum] = "575f4e8920166b1433c329bb621819d1"
>> -SRC_URI[sha256sum] = "ba89f3453982fae6c699a877368d51ee27883b4de709e753eee3783b447a8381"
>> +SRC_URI[md5sum] = "93df3279798a3345bb2c709584c83639"
>> +SRC_URI[sha256sum] = "42324f9ed47c89a43cb37b6bb0d5fbcad44838eee45cd394e181c98d038c49ff"
>>
>>   RDEPENDS_${PN} = "man"
>>
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82D6E76FC4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 00:35:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA40Zoo1003199
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Nov 2015 16:35:50 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 3 Nov 2015 16:35:50 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <1446589273-23317-1-git-send-email-mark.hatle@windriver.com>
	<1446589273-23317-2-git-send-email-mark.hatle@windriver.com>
	<CAMKF1soDd-GpSYetT-mv-PeXiwS3iwtA8=MyD8ntutiD+f84ow@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <563952E5.6060603@windriver.com>
Date: Tue, 3 Nov 2015 18:35:49 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soDd-GpSYetT-mv-PeXiwS3iwtA8=MyD8ntutiD+f84ow@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Fix XLP / Octeon 3 instruction clash
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
X-List-Received-Date: Wed, 04 Nov 2015 00:35:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 11/3/15 5:28 PM, Khem Raj wrote:
> On Tue, Nov 3, 2015 at 2:21 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> Use the value 0x00000080 for INSN_XLP, as the value 0x00000040 has already
>> been assigned to INSN_OCTEON3 by the binutils project.
>>
>> Without this change, invalid instructions can be generated for both INSN_XLP
>> and INSN_OCTEON3.
>>
> 
> this is ok. is octeon3 sent upstream yet ?

AFAIK, the octeon3 stuff is in the binutils master.

--Mark

>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  .../binutils/binutils/0012-Add-XLP-instructions-support.patch     | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch b/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
>> index c56ff91..ecc37cc 100644
>> --- a/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
>> +++ b/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
>> @@ -31,6 +31,12 @@ Netlogic. Also, update vendor name to NLM wherever applicable.
>>  Upstream-Status: Pending
>>
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Use 0x00000080 for INSN_XLP, the value 0x00000040 has already been assigned
>> +to INSN_OCTEON3
>> +
>> +Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>  ---
>>   bfd/aoutx.h           |  1 +
>>   bfd/archures.c        |  1 +
>> @@ -251,7 +257,7 @@ index ef26167..ef53ec6 100644
>>  +/* Netlogic Xlr instruction */
>>  +#define INSN_XLR              0x00000020
>>  +/* Netlogic XlP instruction */
>> -+#define INSN_XLP              0x00000040
>> ++#define INSN_XLP              0x00000080
>>
>>   /* DSP ASE */
>>   #define ASE_DSP                       0x00000001
>> --
>> 1.9.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



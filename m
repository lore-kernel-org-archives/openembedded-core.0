Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6102D776C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:43:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2K9hjrE001236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 20 Mar 2017 02:43:46 -0700
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Mar 2017 02:43:44 -0700
To: Stefano Babic <sbabic@denx.de>, <openembedded-core@lists.openembedded.org>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
	<2702bdc3f6961ba31689d97d67e900f9865d40ee.1487727826.git.liezhi.yang@windriver.com>
	<ef157c32-b0e7-c487-e9de-57449c22b474@denx.de>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <490a19b0-0d48-c090-685f-1edf1e017c4b@windriver.com>
Date: Mon, 20 Mar 2017 17:43:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <ef157c32-b0e7-c487-e9de-57449c22b474@denx.de>
Subject: Re: [PATCH 5/5] file: 5.29 -> 5.30
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
X-List-Received-Date: Mon, 20 Mar 2017 09:43:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Yes, file's upstream commit ID has changed, Paul has sent a patch for it:

http://lists.openembedded.org/pipermail/openembedded-core/2017-March/134261.html

// Robert

On 03/20/2017 05:14 PM, Stefano Babic wrote:
> On 22/02/2017 02:44, Robert Yang wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/recipes-devtools/file/{file_5.29.bb => file_5.30.bb} | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-devtools/file/{file_5.29.bb => file_5.30.bb} (96%)
>>
>> diff --git a/meta/recipes-devtools/file/file_5.29.bb b/meta/recipes-devtools/file/file_5.30.bb
>> similarity index 96%
>> rename from meta/recipes-devtools/file/file_5.29.bb
>> rename to meta/recipes-devtools/file/file_5.30.bb
>> index 29af8748150..0998fcfa899 100644
>> --- a/meta/recipes-devtools/file/file_5.29.bb
>> +++ b/meta/recipes-devtools/file/file_5.30.bb
>> @@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
>>          file://0001-Add-P-prompt-into-Usage-info.patch \
>>          "
>>
>> -SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
>> +SRCREV = "79814950aafb81ecd6a910c2a8a3b8ec12f3e4a6"
>>  S = "${WORKDIR}/git"
>>
>>  inherit autotools
>>
>
> Strange enough, it seems that the tree loses the history and all SRCREV
> are wrong. I tried with -krogoth, -morty, -master, and no revision
> number is found. In fact, after cloning the tree I see that all revision
> number were changed, just a couple here:
>
> 5.25 is now : 789cfc7d727cee1c7cfb7d29c09162e2399285c5
>
> 5.30 (this patch) : 3050419355566d2a96c5be97fef0ffae097bbb96
>
> Ok, I fix this in my layer with a .bbappend, but...Of course, all builds
> are broken - have you seen the same effect ?
>
> Best regards,
> Stefano
>


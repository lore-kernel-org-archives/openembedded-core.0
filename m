Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE7856078D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 14:21:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8KELZdO000471
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Sep 2016 07:21:35 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 07:21:35 -0700
To: Fathi Boudra <fathi.boudra@linaro.org>, ChenQi <Qi.Chen@windriver.com>
References: <1411725589-20460-1-git-send-email-fathi.boudra@linaro.org>
	<57E09AFD.4040006@windriver.com>
	<CAGNsrLDLQ0sJZyec8KwHxwuFGhMhP5mG+nFbFnR3816oD1MS-g@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <d8e2a387-eae9-8436-e08e-4768785bd545@windriver.com>
Date: Tue, 20 Sep 2016 10:21:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAGNsrLDLQ0sJZyec8KwHxwuFGhMhP5mG+nFbFnR3816oD1MS-g@mail.gmail.com>
X-Originating-IP: [172.25.44.6]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libunwind: add aarch64 support
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
X-List-Received-Date: Tue, 20 Sep 2016 14:21:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-20 07:57 AM, Fathi Boudra wrote:
> Hi,
>
> On 20 September 2016 at 05:12, ChenQi <Qi.Chen@windriver.com
> <mailto:Qi.Chen@windriver.com>> wrote:
>> On 09/26/2014 05:59 PM, Fathi Boudra wrote:
>>>
>>> * pass --enable-debug-frame on aarch64 architecture
>>
>>
>> Hi Fathi,
>>
>> I'm now dealing with a problem related to libunwind support on aarch64.
>> Could you please tell me why '--enable-debug-frame' is needed for aarch64?
>
> libunwind needs to be configured with --enable-debug-frame to prevent a
> linkage error.
> Note: --enable-debug-frame is automatically selected on ARM32, not on ARM64.
>

Thanks.
We dropped the configuration flag and don't see any linking/linkage
problems yet. Can you be more specific about the problems encountered?

Our goal is to make tcmalloc from gperftools work on ARM64.

../Randy

>> Best Regards,
>> Chen Qi
>
> Cheers,
> Fathi
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5


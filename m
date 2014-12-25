Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF54727AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 09:05:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBP95p5q004600
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 25 Dec 2014 01:05:52 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 25 Dec 2014 01:05:51 -0800
Message-ID: <549BD36A.5080505@windriver.com>
Date: Thu, 25 Dec 2014 17:05:46 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <960042129c61baae9bdf304c256f8d2e8dd578da.1419309149.git.hongxu.jia@windriver.com>	
	<f7818c823b514c419bf578416843c68538accf0f.1419473606.git.hongxu.jia@windriver.com>
	<1419497071.6428.20.camel@linuxfoundation.org>
In-Reply-To: <1419497071.6428.20.camel@linuxfoundation.org>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 6/6] groff: upgrade 1.22.3
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
X-List-Received-Date: Thu, 25 Dec 2014 09:06:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/2014 04:44 PM, Richard Purdie wrote:
> On Thu, 2014-12-25 at 10:19 +0800, Hongxu Jia wrote:
>> Rebase groff-1.22.2-correct-man.local-install-path.patch to 1.22.3
>>
>> Refer what debian did, we add perl to RRECOMMENDS_${PN}, here is the
>> explanation in groff 1.22.3 README:
>> ...
>> Additionally, producing `PDF' output directly with the `gropdf' device needs
>> a working installation of `perl'.  The same is true for some other
>> preprocessors like `chem'.
>> ...
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   ...off-1.22.2-correct-man.local-install-path.patch | 32 ---------------
>>   .../groff-correct-man.local-install-path.patch     | 45 ++++++++++++++++++++++
>>   .../groff/{groff_1.22.2.bb => groff_1.22.3.bb}     |  7 ++--
>>   3 files changed, 49 insertions(+), 35 deletions(-)
>>   delete mode 100644 meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
>>   create mode 100644 meta/recipes-extended/groff/groff-1.22.3/groff-correct-man.local-install-path.patch
>>   rename meta/recipes-extended/groff/{groff_1.22.2.bb => groff_1.22.3.bb} (89%)
> Given the original error message, if you build this on a machine
> with /bin/perl, does it not still give an error at rootfs time?
>
> Do we need to correctly set the path to perl in the recipe?

Got it, I will fix it. V3 incoming

//Hongxu

> Cheers,
>
> Richard
>
>



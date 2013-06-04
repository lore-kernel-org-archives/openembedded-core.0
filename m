Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF616A49F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 21:01:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r54L1tCd011393
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Jun 2013 14:01:57 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 4 Jun 2013 14:01:54 -0700
Message-ID: <51AE55C0.7010703@windriver.com>
Date: Tue, 4 Jun 2013 16:01:52 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <mailman.5041.1370320509.3521.openembedded-core@lists.openembedded.org>
	<20130604195725.GH18597@timesys.com>
	<51AE4820.5010606@juszkiewicz.com.pl>
In-Reply-To: <51AE4820.5010606@juszkiewicz.com.pl>
Subject: Re: [PATCH] tune-cortexa5.inc: add tune file for cortex-a5, based on a7
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
X-List-Received-Date: Tue, 04 Jun 2013 21:01:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/13 3:03 PM, Marcin Juszkiewicz wrote:
> W dniu 04.06.2013 21:57, Andy Voltz pisze:
>
>> I just tried this solution with my vybrid cortex-a5 build. The only issue is a
>> parse error on ${CORTEX_ID} here:
>>
>> TUNEVALID[cortex${CORTEX_ID}] = "Enable Cortex-${CORTEX_NAME} specific
>>
>> I amended the changes so that each tune-cortexa5.inc (for example) looks like:
>>
>> +CORTEX_ID = "a5"
>> +
>> +TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
>> +
>> +require conf/machine/include/tune-cortex.inc
>>
>> I didn't think it was worth having a CORTEX_NAME if TUNEVALID does not parse..
>
> Agree.

I had forgotten about this limitation.  In a variable's [...] variable elements 
are not extracted.

>> My only other thought is perhaps tune-cortex.inc should be called
>> tune-cortexa.inc? It seems like the m series is a different animal.
>
> Agree as well. M/R to be exact.
>
>> What do you think?

This seems reasonable to me.

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



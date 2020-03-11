Return-Path: <sk@typedivision.de>
Received: from smtp03.udag.de (smtp03.udag.de [62.146.106.29])
	by mail.openembedded.org (Postfix) with ESMTP id 43C6B601D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 20:38:01 +0000 (UTC)
Received: from MyMacBook.local (x4e3627bc.dyn.telefonica.de [78.54.39.188])
	by smtp03.udag.de (Postfix) with ESMTPA id 5BED821438;
	Wed, 11 Mar 2020 21:38:01 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200311163730.78078-1-sk@typedivision.de>
	<c487b390822a86c1f5dd9339324e86c973142e0e.camel@linuxfoundation.org>
From: Stefan Kral <sk@typedivision.de>
Message-ID: <d950b7b1-b5f1-8395-69d8-dde1d17725a8@typedivision.de>
Date: Wed, 11 Mar 2020 21:38:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c487b390822a86c1f5dd9339324e86c973142e0e.camel@linuxfoundation.org>
Authentication-Results: smtp03.udag.de;
	auth=pass smtp.auth=sk@typedivision.de smtp.mailfrom=sk@typedivision.de
Subject: Re: [PATCH] oeqa: enable testresults.json for testexport
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
X-List-Received-Date: Wed, 11 Mar 2020 20:38:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard,

I just started to evaluate the use of testexport.

If you think about removing that feature, what is the preferred way to 
test a deployed target image?
The idea here is to have two separate pipelines:

1. build
- a target-image-test (same as target-image but additional test 
facilities enabled, like ptest)
- the testexport output

2. test
- fetch build results and install the target-image-test to the real hardware
- run the exported runtime tests (host and target based cases)
- check/save the generated testresults.json

BR
Stefan

Am 11.03.20 um 18:22 schrieb Richard Purdie:
> On Wed, 2020-03-11 at 17:37 +0100, Stefan Kral wrote:
>> Add the option --json-result-dir to oeqa core context to enable
>> testresults.json creation for test runs via testexport.
>>
>> Eg. oe-test runtime --json-result-dir .
>>
>> Signed-off-by: Stefan Kral <sk@typedivision.de>
> Out of interest are you actively using testexport? I've been wondering
> if we should remove that support as it does complicate the code a lot
> and ironically, isn't well tested.
>
> Cheers,
>
> Richard
>



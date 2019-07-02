Return-Path: <martin@geanix.com>
X-Greylist: delayed 328 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Jul 2019 14:38:08 UTC
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id D85BC6D147
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 14:38:08 +0000 (UTC)
Received: from [192.168.8.20] (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id 5E3391697
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1562077901; bh=B+4jkb4dQoLE9at9Gq0epQlhzSa9Bz8IHQ1yL8xjhCk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=dUl4UICrCZ2UE3OutyRGv4i57K98YRmRX7L2iTuAZjDAj0/1Y8qICLEBf3cUfJbrl
	qdO28mlO9U94VT418Lg71lbUpozAiKaOSMTdh0+SkWiEw+IN/NYMjn5aoUtUg883Iu
	Sjp/2kX65G54wclJMMY7B34vjziPzR4HjNZfrNMUJ9kzocerLMG1ueBHJXsWXy4C2K
	9TqF5LHFOW+72n6pNCL9Lu0fQJJZa53B4zcgTzllbTWjPPWCm7H+IySfTg02L4S1g2
	01IJ+idnKCupwrjPpT7G8W5WaS+XXKDbKF0956djzQDTrNf6BzPYasDX8Y7hCY22BL
	/hG6ioNOp1HAA==
To: openembedded-core@lists.openembedded.org
References: <ba3936e9-0582-4187-89d7-0a8f1dd4c550@gmail.com>
	<20190702132640.GA11644@localhost>
	<88e4513f-1acd-eec8-5739-33a679471c06@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <b512c7ae-e710-9d2e-1f92-6a966dcf0011@geanix.com>
Date: Tue, 2 Jul 2019 16:32:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <88e4513f-1acd-eec8-5739-33a679471c06@gmail.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 884f5ce5917a
Subject: Re: The state of reproducible Builds
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
X-List-Received-Date: Tue, 02 Jul 2019 14:38:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

Hi,

On 02/07/2019 16.13, Joshua Watt wrote:
>> For detecting malicous binaries not built from the claimed sources 1. is
>> sufficient. For distributions like Debian that build natively this is
>> even the only option available since the host compiler is used.
>>
>> Doing 2. would of course be more desirable, but it can also be done in
>> a second step after all issues related to building on exactly the same
>> host have been sorted out.
> 
> I think there are also other use cases for #2 besides detecting 
> malicious binaries/source code, such as hash equivalence, or even being 
> able use sstate when making a reproducible build. You are correct that 
> this can be done in a second step, but I think that everyone needs to be 
> aware of the limitations that will present when #2 is not present (the 
> main one being that you probably can't make a reproducible build if you 
> use sstate).

Our use case for reproducible builds is to limit delta update sizes. 
I.e. updating one package shouldn;t change the binary output from other 
independent packages.

// Martin


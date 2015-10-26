Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22448766D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 16:55:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9QGtErc006714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Oct 2015 09:55:14 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 09:55:13 -0700
To: Phil Blundell <pb@pbcl.net>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
References: <562E3896.6080405@windriver.com>
	<1445875841.5251.107.camel@pbcl.net> <562E58BE.9060003@windriver.com>
	<1445878220.5251.110.camel@pbcl.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <562E5AF1.3080807@windriver.com>
Date: Mon, 26 Oct 2015 11:55:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445878220.5251.110.camel@pbcl.net>
Subject: Re: Prelink problems -- need help!
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
X-List-Received-Date: Mon, 26 Oct 2015 16:55:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 10/26/15 11:50 AM, Phil Blundell wrote:
> On Mon, 2015-10-26 at 11:45 -0500, Mark Hatle wrote:
>>
>>
>> While some of the modern hashing techniques and such do improve run
>> -time dynamic
>> link performance, there is still a hit that we must take.  For
>> devices that need
>> quick boot times, quick startup, or are memory constrained, the
>> prelinker can
>> still help.  (Memory usage on very small systems is a good example. 
>>  Memory
>> usage can be reduced in larger applications by reducing the number of
>> Copy-on-write pages required to handle the relocation information.)
> 
> Do you have any concrete data on how much of a boot time speedup,
> and/or what reduction in dirty pages, you see on a modern image with
> prelink versus the same image without?

-last- time I got concrete numbers on a complex boot process.  It was on the
order of 1-5% boot time.. and a fairly large number of pages saved.. (which
reduced fragmentation as well as saved memory.)

We're not talking huge numbers for each, there is a statistics mode in glibc
that can be enabled to show the number of relocations and some of the costs
involved.  Once this is working again, I will be able to run that and give more
concrete numbers.

--Mark

> p.
> 



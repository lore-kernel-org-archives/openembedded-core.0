Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id E8C0760721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 06:46:35 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 62E6B68A01A; Wed, 25 May 2016 07:46:36 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id EE43B68A019;
	Wed, 25 May 2016 07:46:33 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 9DFCE67401CE;
	Wed, 25 May 2016 08:46:33 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
References: <57453968.9080600@mlbassoc.com>
	<60AB59B2-92D3-426A-8EB8-9FC717EC087E@gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57454A49.7030700@mlbassoc.com>
Date: Wed, 25 May 2016 08:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <60AB59B2-92D3-426A-8EB8-9FC717EC087E@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sip.bbclass?
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
X-List-Received-Date: Wed, 25 May 2016 06:46:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-25 08:13, Khem Raj wrote:
>
>> On May 25, 2016, at 8:34 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>>
>> I was just wondering why sip.bbclass is in OE-core (at least
>> the Poky version master:c7e614c438706) when nothing uses it?
>
> OE-core can have components which are commonly used in OE infrastructure, especially bindings
> may be checking all layers in layerindex would better answer your question

My impression was [perhaps erroneously] that for an object to be
in OE-core, it had to be _needed_ by some other object in OE-core.
Many recipes have been migrated out when there was no longer a
use for them, so why not .bbclass files as well?  Most other
layers that need .bbclass files that aren't in OE-core just have
their own classes...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


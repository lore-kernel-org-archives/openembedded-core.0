Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 503F0606CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 18:56:03 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id A241068A01C; Wed, 10 May 2017 19:56:03 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 355A968A019;
	Wed, 10 May 2017 19:56:03 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id E24F867402B0;
	Wed, 10 May 2017 20:56:02 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
	<6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
Date: Wed, 10 May 2017 20:56:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Wed, 10 May 2017 18:56:04 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-05-10 17:38, Alexander Kanavin wrote:
> On 05/10/2017 06:34 PM, Davis, Michael wrote:
>> Sitting on 2.3 wouldn't be too much an issue for me, but I can't speak for others that may be in the same situation.
>> Do these patches / new versions require 1.1.0 or break backwards compatibility with 1.0.2?
>> It would be nice if it could be handled by the PREFFERED_VERSION/PREFERRERED_PROVIDER.
>
> PREFERRED_ thing is not possible, unfortunately. 1.1 is API incompatible with 1.0, and so both need to be provided at
> the same time, with recipes explicitly telling which one they need. Most of the patchset is moving various recipes to
> newer, 1.1 compatible versions, so we minimize the need for 1.0.
>
> 1.0 will be provided for as long as upstream supports it, which should be another two years or so.

Why not do this in a "softer" way - make the new 1.1 package have the
obscured name (and not be preferred by default)?  That way existing
uses of the older 1.0 package can continue but users can migrate to
1.1 as they see fit?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


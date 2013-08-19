Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id 7238669686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 19:00:34 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 5001)
	id 84CE93B34559; Mon, 19 Aug 2013 21:00:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=unavailable version=3.3.1
Received: from [192.168.178.26] (dslb-088-070-141-046.pools.arcor-ip.net
	[88.70.141.46]) by gravedo.de (Postfix) with ESMTPSA id EDA5A3B34553;
	Mon, 19 Aug 2013 21:00:29 +0200 (CEST)
Message-ID: <52126B4C.5040004@gravedo.de>
Date: Mon, 19 Aug 2013 21:00:28 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1376928263-9092-1-git-send-email-morphis@gravedo.de>
	<1376928588.17787.64.camel@phil-desktop.brightsign>
	<52124792.6030604@gravedo.de> <8886217.PuVShUglzT@helios>
In-Reply-To: <8886217.PuVShUglzT@helios>
X-Enigmail-Version: 1.4.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: add PACKAGECONFIG_DISTRO variable for distro specific options
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
X-List-Received-Date: Mon, 19 Aug 2013 19:00:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 19.08.2013 18:58, schrieb Paul Eggleton:
> On Monday 19 August 2013 18:28:02 Simon Busch wrote:
>> Am 19.08.2013 18:09, schrieb Phil Blundell:
>>> On Mon, 2013-08-19 at 18:04 +0200, Simon Busch wrote:
>>>> In some cases as distribution just wants to extend the default
>>>> PACKAGECONFIG instead of rewriting it completely. Therefor having a
>>>> PACKAGECONFIG_DISTRO variable which is empty by default and included in
>>>> PACKAGECONFIG helps a lot.
>>>
>>> Can't those distros just use PACKAGECONFIG_append?
>>
>> They can. I tried with PACKAGECONFIG += which didn't worked and I
>> thought it would be the same with PACKAGECONFIG_append cause of
>> PACKAGECONFIG being weak assignment in mesa.inc. But as it seems +=
>> takes higher than the weak assignment and overrides PACKAGECONFIG where
>> _append only appends.
> 
> It's being set in the recipe with ??= which is the weakest form of assignment, 
> so this behaviour is expected. I just tested this in local.conf and it works:
> 
> PACKAGECONFIG_append_pn-mesa = " something"
> 
> BTW, outside of a recipe (or bbappend) you should always use a pn- override 
> with PACKAGECONFIG or you'll be affecting more than just the recipe you intend 
> to.

Thank you very much for the good explanation.

regards,
Simon

-- 
Simon Busch - http://mm.gravedo.de/blog/


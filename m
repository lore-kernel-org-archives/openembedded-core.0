Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id D691777087
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 10:28:15 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 1981868A01C; Fri,  5 Aug 2016 11:28:16 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id DF32068A019;
	Fri,  5 Aug 2016 11:28:14 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id D670D674028F;
	Fri,  5 Aug 2016 12:28:13 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1608050617280.13505@localhost.localdomain>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <57b0c57a-a81c-42fa-0f31-3ea9d2acff56@mlbassoc.com>
Date: Fri, 5 Aug 2016 12:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1608050617280.13505@localhost.localdomain>
Subject: Re: "parted" vs "sfdisk"
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
X-List-Received-Date: Fri, 05 Aug 2016 10:28:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-05 12:19, Robert P. J. Day wrote:
>
>   your personal opinions, if you would -- i'm working on some scripts
> to do automated installs on a target board, currently based on
> parted, but parted seems a bit dense at times, and awkward, and i'm
> thinking of switching to sfdisk.
>
>   for people who have done this sort of thing, do you have any strong
> opinions either way of parted versus sfdisk? i realize that's not much
> to go on, just curious about personal preferences, and why.

As you know, I went the other way - I started with sfdisk and
I find parted more intuitive and easier to use.  I also think
it has a better long-term support horizon.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id C1B556FEFA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 02:22:07 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 47F4B68A019; Wed,  9 Nov 2016 02:22:06 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id BB26068A019;
	Wed,  9 Nov 2016 02:22:03 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id E24C26740215;
	Wed,  9 Nov 2016 03:22:02 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <20161107182006.4207-1-marex@denx.de>
	<CAJTo0LaSLN1eVRH1ju1w5Ba3PLh6d+E0ZwmRimxcN1DjKRk6iQ@mail.gmail.com>
	<03d91527-2e2f-0694-8339-22fe7158880e@gmail.com>
	<CAJTo0Lb-xraoP7zCyWEw-06Q4BwjFjFMG+d5mbkgKRCyfzYbzg@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <60897462-4049-094a-d3ef-c9bbab6c63c0@mlbassoc.com>
Date: Wed, 9 Nov 2016 03:22:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb-xraoP7zCyWEw-06Q4BwjFjFMG+d5mbkgKRCyfzYbzg@mail.gmail.com>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Wed, 09 Nov 2016 02:22:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-11-09 01:45, Burton, Ross wrote:
>
> On 9 November 2016 at 00:43, Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
>
>     > I'm guessing that it is using the host compiler instead of the cross compiler.
>
>     isnt mkimage a host tool ? why are we building it for target ?
>
>
> If there's no chance that it will be ran on the target for in a SDK then patches welcome to force the recipe to native only.
>
> The recipe is using _append without adding whitespace, but fixing that doesn't fix the build.

I routinely build and use it on my targets, so no, it's not host only.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


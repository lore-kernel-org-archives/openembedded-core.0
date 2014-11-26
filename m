Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 540A47210C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 12:14:26 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 81D33F811E3; Wed, 26 Nov 2014 05:14:26 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5EFB4F811D7;
	Wed, 26 Nov 2014 05:14:25 -0700 (MST)
Message-ID: <5475C427.10008@mlbassoc.com>
Date: Wed, 26 Nov 2014 05:14:31 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <54758D01.3070601@topic.nl>
In-Reply-To: <54758D01.3070601@topic.nl>
Subject: Re: Why does building an image for machine X delete the bootloader for machine Y?
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
X-List-Received-Date: Wed, 26 Nov 2014 12:14:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-11-26 01:19, Mike Looijmans wrote:
> I do a:
>
> MACHINE=X bitbake my-image
>
> This DEPENDS on a virtual bootloader, which will produce a BOOT.BIN file in the deploy directory, which is tmp-glibc/deploy.images/X/
>
> If I then do a:
>
> MACHINE=Y bitbake my-image
>
> the BOOT.BIN in tmp-glibc/deploy.images/X/ is suddenly gone!
>
> If i do a
>
> MACHINE=X bitbake my-image
>
> then the the BOOT.BIN in tmp-glibc/deploy.images/Y/ is suddenly gone, and the one for the X machine appears again. The bootloader recipe is not being rebuilt at all.
>
> The machines have the same MACHINE_ARCH, they differ on only minor points (the FPGA).
>
> What is going on here?
>

What machines are you building for?  I've built for two different
i.MX6 platforms in the same build tree and I don't see this behaviour.
n.b. this was using the latest master Poky/Yocto

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


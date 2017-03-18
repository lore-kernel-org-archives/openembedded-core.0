Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB0477B32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 01:21:29 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 2E52D68A01C; Sat, 18 Mar 2017 01:21:31 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 8CFFC68A019;
	Sat, 18 Mar 2017 01:21:30 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 3FE7D674031D;
	Sat, 18 Mar 2017 02:21:30 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
References: <20170317195515.35729bb7@danielf.thecshore.com>
Message-ID: <3a6a7bd6-a5e5-b139-bc2a-53d3b6b41da5@mlbassoc.com>
Date: Sat, 18 Mar 2017 02:21:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170317195515.35729bb7@danielf.thecshore.com>
Subject: Re: Hints on submitting to OE-Core
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
X-List-Received-Date: Sat, 18 Mar 2017 01:21:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-18 00:55, Daniel Dickinson wrote:
> Hi all,
>
> I've got a pre-alpha 'distro' and some layers I think that could get to
> an interesting state.  The intent is to work them up to where they are
> suitable to be submitted as patches to oe-core rather than the
> current .bbappend and related files.
>
> There's rather a lot of reading (which is good in the sense that I like
> actually have documentation, although that's definitely an area I need
> to improve on for the layers I've got in the works), and I haven't
> nearly got through it all yet, but I was hoping for pointers on the
> most important bits to read for prepping patches submission.

Have you read this?
   http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

>
> Also, in the layers list I'll be asking about some build issues that I
> don't see with a manual bitbake, that look like missing preqs on a build
> server, unless the layer should be requesting installation of host files
> somewhere.

Some tools required by ${HOSTTOOLS} are missing:
   cpio chrpath gawk diffstat makeinfo

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


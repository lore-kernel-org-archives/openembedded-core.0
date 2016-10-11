Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id F211E6FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:45:54 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id E542F68A019; Tue, 11 Oct 2016 13:45:53 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 5C2D868A019;
	Tue, 11 Oct 2016 13:45:51 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 11A56674028F;
	Tue, 11 Oct 2016 14:45:51 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1476188384-16064-1-git-send-email-ross.burton@intel.com>
	<1476188384-16064-2-git-send-email-ross.burton@intel.com>
	<9eb3fd87-b56b-ce59-7c85-f0d4fa4d3500@mlbassoc.com>
	<CAJTo0LbYVgB53POjPZYWLSxXREWea3bnUUBK83vFv-MvTRG9_Q@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5f536002-f327-231f-ba5a-ab42bb963b90@mlbassoc.com>
Date: Tue, 11 Oct 2016 14:45:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbYVgB53POjPZYWLSxXREWea3bnUUBK83vFv-MvTRG9_Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] insane: display names instead of ELF machine numbers
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
X-List-Received-Date: Tue, 11 Oct 2016 12:45:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-11 14:36, Burton, Ross wrote:
>
> On 11 October 2016 at 13:26, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     Did you mean to swap the items?  The old version used
>       machine, elf.machine()
>     and this version uses
>       elf.machine(), machine
>
>
> Yes, because the string format changed to be clearer too:
>
> -        package_qa_add_message(messages, "arch", "Architecture did not match (%d to %d) on %s" % \
> -                 (machine, elf.machine(), package_qa_clean_path(path,d)))
> +        package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
> +                 (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine),
>
> The old message would say "20 to 62", the new message is "x86-64, expected PowerPC".

Much nicer indeed.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


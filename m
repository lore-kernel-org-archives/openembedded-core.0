Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 5825670101
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:46:56 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 95CD768A01C; Tue, 11 Oct 2016 10:46:56 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=ALL_TRUSTED,BAYES_05,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 093FB68A019;
	Tue, 11 Oct 2016 10:46:55 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 9C3A9674006F;
	Tue, 11 Oct 2016 11:46:55 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
	<39a3791d-d74a-21de-5806-edda4c26b33f@windriver.com>
	<lyd1j7s0j0.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <47d07770-136d-57f8-63b8-1abe95f5293e@mlbassoc.com>
Date: Tue, 11 Oct 2016 11:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <lyd1j7s0j0.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: [PATCH] glibc: Fix timestamp of plural.c after unpack
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
X-List-Received-Date: Tue, 11 Oct 2016 09:46:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-11 11:22, Enrico Scholz wrote:
> Mark Hatle <mark.hatle-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:
>
>> My understanding of the issue is that the extraction of the plural.c and
>> plural.y files happens so quickly that it is unclear to make if one is older
>> then the other -- so it sometimes uses bison to rebuild the plural.c.
>
> When this is really the case, this can apply to the workaround too.  So,
> there should be added a 'sleep 1' before the 'touch' or (better?) remove
> plural.c to enforce a rebuild.

I believe that's the opposite of the desired action, i.e. to always use
the packaged plural.c and never rely on the plural.y=>plural.c transformation.

>
>>> +do_unpack_workaround() {
>>> +	touch ${S}/intl/plural.c
>>> +}

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


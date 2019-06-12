Return-Path: <compudj@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id C56E77E4EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 10:58:22 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id BCF15249E50;
	Wed, 12 Jun 2019 06:58:23 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id DCzKlOe7fx2L; Wed, 12 Jun 2019 06:58:23 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 171E4249E38;
	Wed, 12 Jun 2019 06:58:23 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 171E4249E38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1560337103;
	bh=4qe3Ml9WsLUU610hc7zKErKNYU8DKcyenuSmhPdn0nQ=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=J/W4VoDPLsAzBFjpDutFQ4PVGHMEhxx9Z5QzCBQc4ymzmo8dOBbGhHgjqV5+q0ihD
	jqFFGDjL4Yxjz7EanAoNpFU1xJPrBsZcxMHt778yuKkSv1aOaW1/U8PQqbv4tEzRWv
	WV+pPubqrBCIYTziCYZq9V6vOqnkDXG5yIAE+EOSuiwd7PTlR77N+UlEBgl330KpoT
	Nfardw+1DoHYCNrRzFmTq+IcFALIdnpK04hhIz6ctiKsHQuusbmfBkvEoluTNEYKrN
	DvnHyqtWjDK0jiVjThSPboR6aLQQy3DSQU5Ve2p15CMraMKgKA93szODLc+OIx3Y1a
	INZDF1cpZG5OA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 42sFmIJdGLBq; Wed, 12 Jun 2019 06:58:22 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
	by mail.efficios.com (Postfix) with ESMTP id E8960249E32;
	Wed, 12 Jun 2019 06:58:22 -0400 (EDT)
Date: Wed, 12 Jun 2019 06:58:22 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <1859381600.42862.1560337102909.JavaMail.zimbra@efficios.com>
In-Reply-To: <20190612105114.GA23143@localhost>
References: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
	<be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
	<20190612105114.GA23143@localhost>
MIME-Version: 1.0
X-Originating-IP: [167.114.142.138]
X-Mailer: Zimbra 8.8.12_GA_3803 (ZimbraWebClient - FF67 (Linux)/8.8.12_GA_3794)
Thread-Topic: lttng-modules: Backport patches to fix compilation failures
	since kernel v5.1
Thread-Index: LGJiZCgSiQnpjDwVwT4SxfPBzRM5kg==
Cc: Jeremie Galarneau <jgalar@efficios.com>,
	lttng-dev <lttng-dev@lists.lttng.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lttng-modules: Backport patches to fix compilation failures since kernel v5.1
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
X-List-Received-Date: Wed, 12 Jun 2019 10:58:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- On Jun 12, 2019, at 12:51 PM, Adrian Bunk bunk@stusta.de wrote:

> On Tue, Jun 11, 2019 at 11:49:34PM +0100, Richard Purdie wrote:
>> On Tue, 2019-06-11 at 17:03 +0800, zhe.he@windriver.com wrote:
>> > From: He Zhe <zhe.he@windriver.com>
>> > 
>> > For the moment,
>> > 0001~0004 are on master branch only.
>> > 0005~0007 are on stable-2.11 branch, but v2.11 has not been released
>> > yet.
>> > 
>> > Signed-off-by: He Zhe <zhe.he@windriver.com>
>> > ---
>> > v2: Correct a typo in SOB for 0001*.patch
>> 
>> I just discussed this with lttng upstream maintainers a little. We're
>> going to have continual tension between keeping lttng-modules up to
>> date and new kernel versions.
>> 
>> How about we also have a git version of this particular recipe which
>> has a DEFAULT_PREFERENCE = "-1" but people can opt into with a
>> PREFERRED_VERSION when using newer kernels?
> 
> Yocto stable series will ship a _git AUTOREV recipe?
> 
>> That should keep people using very recent kernels happy, let us use a
>> stable release version and avoid us adding/removing large patchsets on
>> a semi regular basis?
>>...
> 
> The semi regular basis is only slightly moved, or how and when will
> replacing the already EOL kernel 5.0 with 5.1 in Yocto be handled?
> 
> IMHO it would be better to acknowledge that this is a case where staying
> at stable release versions is sometimes not the best option, and upgrade
> the normal recipe to -rc releases or even a git snapshot from a more
> recent stable branch when necessary.
> 
> E.g. right now it seems clear that the next Yocto release will have
> to use lttng-modules >= 2.11 in any case for kernel 5.2, so upgrading
> from 2.10.9 to 2.11.0-rc5 would be logical.

Please don't base distributions on -rc tags. They are not meant for this.

We always integrate support for newer kernel versions instrumentation back
into our current stable release. So as soon as 5.2 final comes out, we will
release a 2.10.x version including support for it in lttng-modules.

The current 2.10.10 has commits to support the currently known 5.2-rc
instrumentation changes.

Thanks,

Mathieu


> 
>> Cheers,
>> 
>> Richard
> 
> cu
> Adrian
> 
> --
> 
>       "Is there not promise of rain?" Ling Tan asked suddenly out
>        of the darkness. There had been need of rain for many days.
>       "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com


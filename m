Return-Path: <compudj@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF837D6AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 13:33:01 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 726EE2493D4;
	Wed, 12 Jun 2019 09:33:02 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id oMGul737osEP; Wed, 12 Jun 2019 09:33:02 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 166152493CB;
	Wed, 12 Jun 2019 09:33:02 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 166152493CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1560346382;
	bh=P9q5ejG7SWexsuXdGntCMgRwHBM/4tcCvmg5FJJ0Aeg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=qG5g+H94Ia6Cd2O8kTAZjrRXBzlN7AafuoIfUV6buE233TthWg4pwzbGOxEVQW9F5
	2eYvDfBeUq/H4EauJONgw4VBvC0q36y29GMaZMV2cSXMKoTzV10QAQOGSm6arEerJB
	S0lxzjQppZhTPSTqNC1JV+S/CbJ8FOYdwrvkLj6qAXivlNvHIFOUMFdQGYQhoIRMHL
	4+TVGwGRvnJb3+8kC0ArKQDcyU0JZ4L9DuP7Bb2QbOfIqTnLhIgqduWEeybFrnL6yH
	PT930OTrydqG9Cjp7AJO4iwZI5gFwoqju862AkbjYPdTx36kS+Vdn/XE43ZWRun2Zi
	Dg/mkCRlW3rGA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id rgDGawoG7-v1; Wed, 12 Jun 2019 09:33:02 -0400 (EDT)
Received: from mail02.efficios.com (mail02.efficios.com [167.114.142.138])
	by mail.efficios.com (Postfix) with ESMTP id F06DB2493C5;
	Wed, 12 Jun 2019 09:33:01 -0400 (EDT)
Date: Wed, 12 Jun 2019 09:33:01 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <1075062100.42992.1560346381924.JavaMail.zimbra@efficios.com>
In-Reply-To: <20190612132741.GB23143@localhost>
References: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
	<be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
	<20190612105114.GA23143@localhost>
	<1859381600.42862.1560337102909.JavaMail.zimbra@efficios.com>
	<20190612132741.GB23143@localhost>
MIME-Version: 1.0
X-Originating-IP: [167.114.142.138]
X-Mailer: Zimbra 8.8.12_GA_3803 (ZimbraWebClient - FF67 (Linux)/8.8.12_GA_3794)
Thread-Topic: lttng-modules: Backport patches to fix compilation failures
	since kernel v5.1
Thread-Index: t25soWHyR1elSTiw6Be8M60HASrDrw==
Cc: lttng-dev <lttng-dev@lists.lttng.org>,
	Jeremie Galarneau <jgalar@efficios.com>,
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
X-List-Received-Date: Wed, 12 Jun 2019 13:33:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- On Jun 12, 2019, at 3:27 PM, Adrian Bunk bunk@stusta.de wrote:

> On Wed, Jun 12, 2019 at 06:58:22AM -0400, Mathieu Desnoyers wrote:
>>...
>> We always integrate support for newer kernel versions instrumentation back
>> into our current stable release. So as soon as 5.2 final comes out, we will
>> release a 2.10.x version including support for it in lttng-modules.
>>...
> 
> Did something go wrong with that for 5.1?

Only failure to do a timely release on my end, sorry about it. Don't
hesitate to ping me when this happens. The patches were cherry-picked
into the stable-2.10 branch quickly after 5.1 was released (or while in
5.1-rc cycle), but Jonathan reminded me just yesterday that I was overdue
for a release.

> 
> This discussion started with patches on top of 2.10.9 for 5.1 support.
> If the missing release was just a one-time problem for 5.1,
> then the whole problem is usually confined to -rc kernels.

Indeed, I'll try to release stable tags more proactively after a kernel
version comes out in the future.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com


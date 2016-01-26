Return-Path: <compudj@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [78.47.125.74])
	by mail.openembedded.org (Postfix) with ESMTP id F28E877085
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 01:17:17 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 0030534036A;
	Tue, 26 Jan 2016 01:17:17 +0000 (UTC)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id xL0DUBWjx4OU; Tue, 26 Jan 2016 01:17:13 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 927FE3403A2;
	Tue, 26 Jan 2016 01:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id NEQ3EGqF7HNQ; Tue, 26 Jan 2016 01:17:13 +0000 (UTC)
Received: from evm-mail-1.efficios.com (evm-mail-1.efficios.com [78.47.125.74])
	by mail.efficios.com (Postfix) with ESMTP id 6BD2534036A;
	Tue, 26 Jan 2016 01:17:13 +0000 (UTC)
Date: Tue, 26 Jan 2016 01:17:13 +0000 (UTC)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Message-ID: <2142647634.4366.1453771033156.JavaMail.zimbra@efficios.com>
In-Reply-To: <1037243108.4336.1453770172960.JavaMail.zimbra@efficios.com>
References: <1037243108.4336.1453770172960.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
X-Originating-IP: [78.47.125.74]
X-Mailer: Zimbra 8.6.0_GA_1178 (ZimbraWebClient - FF43 (Linux)/8.6.0_GA_1178)
Thread-Topic: Bogus openembedded gcc patch
Thread-Index: 0s2VxOSvgpBHib7uhm3NOvhGdPmM1xm/K3to
Cc: lttng-dev <lttng-dev@lists.lttng.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Bogus openembedded gcc patch
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
X-List-Received-Date: Tue, 26 Jan 2016 01:17:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Re-sending with oe-core ML in CC.

----- On Jan 25, 2016, at 8:02 PM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:

> Hi,
> 
> We are noticing the presence of the following patch in various
> openembedded gcc versions:
> 
> 0024-PR-target-32219.patch
> 
> "From e0d15f4f8bf28c351b9215ca37f1caa24df0e1fd Mon Sep 17 00:00:00 2001
> From: Khem Raj <raj.khem@gmail.com>
> Date: Fri, 29 Mar 2013 09:18:54 +0400
> Subject: [PATCH 24/35] PR target/32219
> 
> * varasm.c (default_binds_local_p_1): Weak data is not local.
> 
> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> Upstream-Status: Backport"
> 
> However, contrarily to its "Backport" status, that patch is
> not upstream in gcc, and we're starting to wonder if this
> would be the patch that breaks handling of start/stop automatic
> hidden symbols we use in lttng-ust.
> 
> We are only experiencing problems on the various openembedded
> compilers, but on no other distro (with same compiler versions),
> which leads us to suspect a buggy distro-specific gcc patch.
> 
> We've been testing with openembedded gcc-4.9.2-r0.
> 
> The original gold linker issue that this patch was trying to
> address seems to have been fixed in the gold linke since
> then.
> 
> Refs:
> http://lists.lttng.org/pipermail/lttng-dev/2014-May/023112.html
> https://gcc.gnu.org/ml/gcc-help/2014-05/msg00042.html
> http://cgit.openembedded.org/openembedded-core/commit/?id=3cb2b003db7371b3a47d02c08352a262e1e419b4
> https://sourceware.org/bugzilla/show_bug.cgi?id=15435
> 
> Thoughts ?
> 
> Thanks,
> 
> Mathieu
> 
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com


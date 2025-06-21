Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6EAC7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:03:53 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.7834.1750514625040591525
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=uj7wnF6Z;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h3WSh1Ns0cwSJ0ONIzInthUjXOebiFcHT8MiJqZb1n0=; b=uj7wnF6ZYjbIy1rNdBluqGP1qd
	ufzaTXf/HZnfmKEu34POPjBqh5G9Wki6RRRK8MlG0gYlUcqbpczxRN1D+qDy/Z5OMikf8DvMdrg2f
	mfZ3an8Fbs9Wf3IknKM9K+Uk1CzlM8Fri0sjXZbLLKN/zaJE3zquajdUV0o5ekobKPOOrgX7x7RGl
	HKqaFfiVWYk0YYyBDytRjwubS2mGYbRqGyCzdtaa8oB3rJ9y0qdNtM/b4gk7qZbezUi3Ve/xRWjkH
	5UyIZk0X+oRtE4Sn+tcJ7II8sVcduyYVSK35C+RwJjh5O1G0DVMo+r//WgTde4ed4svHNi9eT/n9T
	OURCoujA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53794 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSyom-00000003hi0-3OJs;
	Sat, 21 Jun 2025 10:03:43 -0400
Date: Sat, 21 Jun 2025 10:03:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] is there a style guide for setting
 COMPATIBLE_MACHINE?
In-Reply-To: <DB5PR02MB102136D2C39B9F57170C624A7EF7FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Message-ID: <c36b725c-c45c-f2fb-d803-f069ca2c3feb@crashcourse.ca>
References: <6fa83a65-3ed0-3f4f-0227-cd360828fc38@crashcourse.ca> <DB5PR02MB102136D2C39B9F57170C624A7EF7FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 14:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219157

On Sat, 21 Jun 2025, Peter Kjellerstedt wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Robert P. J. Day
> > Sent: den 21 juni 2025 13:06
> > To: OE Core mailing list <openembedded-core@lists.openembedded.org>
> > Subject: [OE-core] is there a style guide for setting COMPATIBLE_MACHINE?
> >
> >
> >   i ask since there's quite the variety of styles in oe-core,
> > involving parentheses and anchors and so on -- here's just some of
> > them:
> >
> > COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemuriscv32|qemux86|qemux86-64"
> > COMPATIBLE_MACHINE = "^qemu.*$"
> > COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> > COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> > COMPATIBLE_MACHINE ?= "^$"
> > COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
> > COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
> > COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarch64)$"
> > COMPATIBLE_MACHINE = "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)$"
> > COMPATIBLE_MACHINE  = "^(beaglebone-yocto)$"
> >
> > what's the "proper" style so i can make sure it's documented
> > correctly.
>
> Given that COMPATIBLE_MACHINE takes a regular expression, what value you
> assign to it depends on what you want to achieve. In some cases you want
> to rely on it being unbound, e.g., "^qemu", which will match anything
> that starts with "qemu". On the other hand, when you want to exactly match
> specific machines, you should be sure to surround it with ^ and $.
>
> Looking at the examples above, many of them could be simplified by breaking
> out the leading "qemu" part, e.g.:
>
> COMPATIBLE_MACHINE = "^qemu(arm|armv5|arm64|x86|ppc|ppc64|mips|mips64|x86-64|riscv64|riscv32|loongarch64)$"
>
> On the other hand, some of them are strictly not correct. E.g., with the
> first one, "qemuarmv5" and "qemuarm64" are not needed as they are covered
> by "qemuarm", and "qemux86-64" is not needed as it is covered by "qemux86".
> This is most likely unintentional, so that regular expression should be
> corrected to:
>
> COMPATIBLE_MACHINE = "^(qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemuriscv32|qemux86|qemux86-64)$"
>
> or as per above:
>
> COMPATIBLE_MACHINE = "^qemu(arm|armv5|arm64|riscv32|riscv64|x86|x86-64)$"

  right, i already knew that a lot of that was not pretty. in
particular, this assignment:

COMPATIBLE_MACHINE =
"qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemuriscv32|qemux86|qemux86-64"

is technically just wrong since, as those REs are not anchored, the
machine identifier "qemuarm" could conceivably match the hypothetical
machine name "sqemuarm", correct?

rday


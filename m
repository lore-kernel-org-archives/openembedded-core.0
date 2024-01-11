Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF2FC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 13:04:11 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.10809.1704978247773175176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 05:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=yMJRJAQB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M86O5sis5L5TrvQqY17Z5Qpt41sXRf6/rx1+Q7I02us=; b=yMJRJAQBNFxb2xDkDxWIZFM3Ge
	o4DAY1ndmCSbq30ERcLGHepiEs+Y6Utuo8aJX9F/+YM2e5MtlhhmefffqGOPcnvr4EbG+Bxj0ApEX
	WxOMGhombSADP5FTMx2Y5rmNu+kPVMhAcQw4VCslvYyvo7qM96W7lL7ksVPaHqe2KPvZryDv4vO6z
	r20lVeSTVYijDrwxEsBx28gLqA48ARN/Zj3zIIYdejLzUaEBG+w6TRdW0caiQ+GZUWKmhVJEqX6Ke
	/7T2QIRJdg4mUhygRxHAW+dMvhaFexa3BAH8Itf64N8KDeBKEo4ud+PED6XQYeNoNrEckqas3k7bM
	NibsuwXg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49604 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rNuj1-0012qG-1e
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Jan 2024 08:04:05 -0500
Date: Thu, 11 Jan 2024 08:03:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: looking to collect "OE/YP best practices" docs for co-op student
Message-ID: <475a39b8-1157-f214-d877-f4ffb74e13d2@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 13:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193541


g'day, eh?

  in my current employment, i am in charge of a number of YP (well,
Wind River Linux) layers with a lot of legacy cruft^H^H^H^H^H content,
and i'd like to start cleaning it up little by little. i was gifted a
fairly junior co-op student for the term and figured this would be a
good way to put him to use and even turn him into a moderately
competent OE developer by the end of the term.

  so i wanted to put together a *really* comprehensive list of best
practices, starting simple, open a Jira epic, and start adding
increasingly sophisticated tasks for him to do day by day.

  i've started collecting a few docs but none of them really cover the
gamut of all the pedantic things one could do to tidy up OE/YP layers.
i was going to start off with just aesthetic prettification -- break
absurdly long assignments of multiple values into one per line, line
continuations, in alphabetical order, that sort of thing.

  the next step would be, i think, to get familiar with bitbake.conf
and some of the bbclass files, and start removing superfluous content
from various recipes. case in point -- a pile of packagegroup recipe
files unnecessarily set:

  PACKAGES = ${PN}

but that's the default so ... delete that sort of thing (as long as
there's no *real* reason for it to be there).

  this might sound like grunt work but, as the term went on, i'd ask
him to do more research and come up with cleanups of his own as he
understood more of OE. i'd like to make this a truly productive term
for this guy.

  any recommended docs that get to this level? i've already bookmarked
the standard YP docs, and a couple others.

rday


Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC3CC4829B
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 11:53:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.35650.1707652391356252639
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 03:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hwhPNuzZ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SaONXyKkSM9nnvQO4BKCmHY1tOcQqwy9VACXdRjU9iY=; b=hwhPNuzZp050dDAJtCcN+2QMm2
	9JzuMBU/oSS7ngWu2VxkuX0yL3cXteIo/1DWU//LuI7H8AUg6aPhGbJcEk5qAOtHLn69tCaOB0nur
	sYIqJNxdi5Wifs7jzBm/aj2bQrLD7CsrGIrzn8bsC+7c5oZ2kWQUXDFWJsBVWr25gUWMAZMo+6A/Q
	F2gG8o9E+NSNqHfYPc4xnnR+Sc8m7a+LfkPLUVN6ulELNUdYnlENHQdYK21+TiKE91fYXYw8KVtv4
	RLA55kgJbQFRDss0hZaKHyf0HgoEOjrfm5kVKK4Bhea5WHPmnQ8U2c4sw63tUpn1vyRNs7BBA2VgR
	bv/g/vkg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41282 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rZ8OP-009v18-2d
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Feb 2024 06:53:10 -0500
Date: Sun, 11 Feb 2024 06:52:54 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: why does cpio recipe RDEPENDS on ptest-runner?
Message-ID: <4deb850-6761-e375-ab3d-b1f8c2cc23@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 11:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195286


  in the midst of writing a ptest tutorial for some colleagues and
wanted to embellish it with live examples, and noticed this in the
cpio bitbake recipe:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/cpio/cpio_2.15.bb#n69

this is the first recipe i've seen that actually *needs* ptest-runner
as a runtime dependency. why is that? i always thought ptest-runner
was entirely optional even when using ptests.

rday


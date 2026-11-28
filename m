Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6660.1795871467879669837
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 05:11:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WuSFBSON;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 654C71A185E
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 13:11:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31608604C0;
	Sat, 28 Nov 2026 13:11:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E4F911E900F6;
	Sat, 28 Nov 2026 14:11:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795871464; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nIH1h3+gmXZADbuJMC7d/e5zQeAPAsS6nSHsnpVCzAk=;
	b=WuSFBSON0U4eSRAr3l2n41FOWzFMjyYWPeEKuDSEXO+2n/aav+kLb0r0CwxdvP3WRyNmPo
	XbuL7lkgU4//QrZKrxQJ6wsVfgrAj7YWkFAYudZgSUY91eHzOV6NrbDzKtxLqhlESXnfpk
	cTcWEDYIR6Yg/mPez+gtYSGwnh91EZA9WCUSEzDOCQ9JpF+TCQw+y9DmJTdlEvfe/g+A1r
	A4NMLbpbU5DmNZ6h6656BqTPr8aO907p9eJjE0XIaYXc3z8dGjSxWDaSdoBvet7QsH3Hr4
	shWQitSKuBdVq7UcxNUClSlIRrpJrpD8/oCXMB3T6BNUKqyxNqHtQC64w9xrcg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 14:11:02 +0100
Message-Id: <DN6VAWCCX6V2.7PNQ3T44RO7E@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] pseudo: Update to 1.99.2 version
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mark.hatle@amd.com>, =?utf-8?q?David_Nystr=C3=B6m?=
 <david.nystrom@est.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261126021504.2712290-1-mark.hatle@amd.com>
 <DN5SYWCJICB9.I7N9C1C4DHZI@bootlin.com>
 <8e691720-8af7-37ce-efb7-bfd1fbbbdba2@est.tech>
 <b88fee85-9692-4641-ba5a-db63b5bf5fa0@amd.com>
In-Reply-To: <b88fee85-9692-4641-ba5a-db63b5bf5fa0@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 13:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251496

On Fri Nov 27, 2026 at 4:28 PM CET, Mark Hatle via openembedded-core wrote:
> Ya, I had no idea about strtol.  I've updated master-next with this versi=
on, but I don't have a way to run it across the build system.
>
> @Mathieu Dubois-Briand is this something you can run as a test?
>
> The branch is 'master-next', commit is '3a6fc1521198fd2cbbb63e607e379a653=
872ca6b'

Thanks, I just launched a build with the master-next branch.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


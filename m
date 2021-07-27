Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.4089.1627404382383575435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 09:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=fwUAWoAy;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id EC4552E8920
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 11:46:21 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1627404382; bh=9cOk+1Cc5bp8PbLqYOy8fp/of5YlIECXc5hPPBIg5Ro=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=fwUAWoAy48bG8wsDVHPyoMPV1ret4zLMSLytTFARRnE+VhuT4BVCgXrmtl3I8RQts
	 +gi67ec5LHIZwFkufMJCnlXmOj/6QkvY/IhPNs7mPR0b1IYbkR2qZQNT32PqnadvsB
	 xh7dD+xd9iR3+ZWlQLPOOjCQHy3/yPbzw/zL5jRcSyt+4WzEt8pzngxqAXwO0ZQFvJ
	 6UkZdG4eg7MMO4j3ieEW+1on1la5KDlEy8bx/KYywjM1GjGvb2sU+TiTIW+58+E6Nn
	 ilafOY5bn4wL3YAjy9KCfLctX2Dx2Du59znD4gwwuNgAfMVfnFEHD0qY6E/fRMq6+O
	 R+JBwTdbnxEOg==
Date: Tue, 27 Jul 2021 11:46:18 -0500
From: "Seebs" <seebs@seebs.net>
To: "openembedded-core" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH pseudo 1/4] Remove -fno-strict-aliasing and -Wno-deprecated-declarations
Message-ID: <20210727114618.274bb93e@seebsdell>
In-Reply-To: <17ae8d28d09.af318d0d58783.8610860541762814287@ertelnet.rybnik.pl>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
	<20210727104927.18f26c21@seebsdell>
	<17ae8d28d09.af318d0d58783.8610860541762814287@ertelnet.rybnik.pl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Jul 2021 18:35:50 +0200
"Damian Wrobel" <dwrobel@ertelnet.rybnik.pl> wrote:

> Based on my experience, It's usually better to see this warning and
> fix the code instead of relying on the back magic.

Yes, but in the case of the strict aliasing stuff and function pointer
stuff, we really, really, *can't* not rely on the magic, because pseudo
*is* the magic.

-s

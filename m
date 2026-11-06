Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6151.1793972254806353351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 05:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=ocT8XyCL;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1793972252;
	bh=8CkPH+mqh4/7yz4JnDhXvBJ7S8L286vJj0Qs7HdaVbg=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=ocT8XyCL7AWQ8tuMWl4a6OacYsSU/QR7ln3qUEdG+iyg/NpAf/VK+2mM4KiTXWV2Y
	 egzBCIS3nGZL8H+jnAJptTTuCZmY420jJ8nHmjEknMH+nrP/gCbtD5JGXbNQkVtSZq
	 kPsauw4hqvfYMKWqynn6C6u3pb9MhN+PSbfk4VkcWnrqd+5v0RYxGuqePK3yRibKlK
	 xzwO2Tl6KXyzC8T6LwzpGBv/9ieHjRiveH0M+kPWxfyhJdIxPMHxQ2uYIEr9s5g20k
	 JF6d4KvYCrfrLU5EHRdxJP9Yr5Efdh/C+Om6S5a1IqCK4F1le0ShITQ7GbrKHDbbpV
	 X5h1eKEK7thjw==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 1EBCE5F8C9;
	Fri, 06 Nov 2026 14:37:32 +0100 (CET)
Message-ID: <4384d690cf5a228b835f1b3bae03f0d8209bf210.camel@emlix.com>
Subject: Re: [DRAFT PATCH v3 1/2] spdx: add entries for meta-layers
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Date: Fri, 06 Nov 2026 14:37:31 +0100
In-Reply-To: <DMO4G0Y6A3J0.3IIU7DV1YG5W6@pbarker.dev>
References: <20260915130509.2184318-1-dwagenknecht@emlix.com>
	 <20261106115455.4141199-1-dwagenknecht@emlix.com>
	 <20261106115455.4141199-2-dwagenknecht@emlix.com>
	 <DMO4G0Y6A3J0.3IIU7DV1YG5W6@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at mx1.emlix.com
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 13:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249648

Hello Paul,

On Fri, 2026-11-06 at 12:20 +0000, Paul Barker wrote:
> I don't think downloadLocation should be populated by default, it may
> refer to an internal network location for an organisations' private
> repositories
I already wondered about this when first implementing the approach. By
SPDX spec it is OK to have a private URL here (SPDX 2 documentation
explicitely noted private URLs being allowed for this property, in SPDX
3 I did not find such a clear statement but also nothing contradicting
it)

> and leaking those URLs may not be desired.
by being implicit (parsed from the current repo checkout) it's
different to private servers explicitely mentioned in SRC_URI, so I
agree it may not be desired and considered an information leak.
>=20
> This probably needs to be opt-in.
That would be OK with me, I'll make it opt-in in a next revision.


Best Wishes
Daniel

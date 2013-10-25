Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id B67C56D040
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 13:21:41 +0000 (UTC)
Received: from ad.chargestorm.se (212.20.242.100) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Fri, 25 Oct 2013 15:21:41 +0200
Date: Fri, 25 Oct 2013 15:21:38 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20131025132137.GA11683@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1381528914.29912.188.camel@ted> <1381529759.29912.191.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1381529759.29912.191.camel@ted>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] classes: tar 1.32 fixes
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
X-List-Received-Date: Fri, 25 Oct 2013 13:21:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Richard Purdie <richard.purdie@linuxfoundation.org> [131012 00:16]:
> > tar: --same-order option cannot be used with -c

> > with the commandlines we have been using. We can remove the -s option (which
> > is --same-order) to remove the error.

> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Could we backport this patch to dora?

I'm experiencing this issue on a couple of buildboxes that was recently
updated.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


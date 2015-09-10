Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id DAF5860053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 08:11:43 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZZwxK-000646-DF; Thu, 10 Sep 2015 10:11:42 +0200
Message-ID: <1441872696.2948.17.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 10 Sep 2015 09:11:36 +0100
In-Reply-To: <CA+aJhH2FPpXE+apKg2LGKE5iKmi9Aok-ne4Qi5pxNo1rSj03mA@mail.gmail.com>
References: <1441791241-29328-1-git-send-email-nathan@nathanrossi.com>
	<1441799773.1680.102.camel@pbcl.net>
	<CA+aJhH2N0jG9amPA9Y2GKuQcJ4yK6H_1omXTCGn7=OdeXJntgA@mail.gmail.com>
	<1441840133.2948.14.camel@pbcl.net>
	<CA+aJhH2FPpXE+apKg2LGKE5iKmi9Aok-ne4Qi5pxNo1rSj03mA@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot.inc: Add host compiler flags and openssl-native dependency
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
X-List-Received-Date: Thu, 10 Sep 2015 08:11:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-10 at 16:57 +1000, Nathan Rossi wrote:
> I think the best solution that would cover your request but also not
> add any potential confusion for users, would be to have the
> PACKAGECONFIG for u-boot but default to having the config enabled. And
> for users who want to completely remove the openssl dependency from
> their chain they are able to do so.

Yes, that would be fine.  Please also add a small comment next to the
PACKAGECONFIG[openssl] definition explaining why and when it's needed.

Thanks

Phil




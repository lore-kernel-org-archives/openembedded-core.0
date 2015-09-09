Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id BE53874197
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 23:09:00 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZZoU7-0004Ma-Mu; Thu, 10 Sep 2015 01:08:59 +0200
Message-ID: <1441840133.2948.14.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 10 Sep 2015 00:08:53 +0100
In-Reply-To: <CA+aJhH2N0jG9amPA9Y2GKuQcJ4yK6H_1omXTCGn7=OdeXJntgA@mail.gmail.com>
References: <1441791241-29328-1-git-send-email-nathan@nathanrossi.com>
	<1441799773.1680.102.camel@pbcl.net>
	<CA+aJhH2N0jG9amPA9Y2GKuQcJ4yK6H_1omXTCGn7=OdeXJntgA@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Sep 2015 23:09:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-10 at 01:42 +1000, Nathan Rossi wrote:
> Please keep in mind, openssl-native is already dragged in by other
> dependencies in order to build u-boot (e.g. rpm-native which is added
> to all recipes inheriting package.bbclass regardless of
> PACKAGE_CLASSES). 

The openssl dependency in rpm is already a PACKAGECONFIG though, isn't
it?

p.





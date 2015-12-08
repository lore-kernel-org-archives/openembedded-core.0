Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 60751605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 18:09:14 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1a6MhO-0001cs-Mv; Tue, 08 Dec 2015 19:09:14 +0100
Message-ID: <1449598154.1472.187.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 08 Dec 2015 18:09:14 +0000
In-Reply-To: <1449598093.1472.186.camel@pbcl.net>
References: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
	<0318ee439d61fd47991f71a073b1f6e7165f26a9.1449562195.git.raj.khem@gmail.com>
	<1449598093.1472.186.camel@pbcl.net>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 08/13] sysvinit: Fix build with musl
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
X-List-Received-Date: Tue, 08 Dec 2015 18:09:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-12-08 at 18:08 +0000, Phil Blundell wrote:
> On Tue, 2015-12-08 at 08:12 +0000, Khem Raj wrote:
> > 
> +Upstream-Status: Inappropriate[Linux specific]
> > 
> 
> 
> Er, isn't sysvinit itself fairly Linux-specific?

Oh, never mind, I see the comment about Hurd now.

p.



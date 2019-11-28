Return-Path: <cengiz@kernel.wtf>
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
	by mail.openembedded.org (Postfix) with ESMTP id A5C367F61C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 10:38:32 +0000 (UTC)
Received: from nexussix (unknown [84.44.14.226])
	(Authenticated sender: cengiz@kernel.wtf)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7F91920000F;
	Thu, 28 Nov 2019 10:38:32 +0000 (UTC)
Message-ID: <6444214b7e74abf19a4bb0ec1983c05b71e59d16.camel@kernel.wtf>
From: Cengiz Can <cengiz@kernel.wtf>
To: Phil Blundell <pb@pbcl.net>, Khem Raj <raj.khem@gmail.com>, Paul Barker
	<paul@betafive.co.uk>
Date: Thu, 28 Nov 2019 13:38:31 +0300
In-Reply-To: <20191127114904.bfiotnxlsebtpko7@pbcl.net>
References: <20191126133943.124402-1-cengiz@kernel.wtf>
	<20191126181929.sys6lo2fadf72wdn@pbcl.net>
	<16ea94ea570.2bfa.85c738e3968116fc5c0dc2de74002084@kernel.wtf>
	<20191127114904.bfiotnxlsebtpko7@pbcl.net>
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd-conf: add timesyncd.conf
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
X-List-Received-Date: Thu, 28 Nov 2019 10:38:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-27 at 12:49 +0100, Phil Blundell wrote:
> I believe so.  I couldn't immediately find anything on their website
> that
> said differently.

Ok. I've found it here: https://developers.google.com/time/faq

> The Google servers also do leap smearing which might or might not be
> a good thing depending on your point of view.  I'm not sure whether
> the pool.ntp.org ones do the same thing or not.

ntp.org's Discourse forum has posts mentioning that leap smearing is
not supported and Google specific only.

How often those leap seconds occur is out of my knowledge and
expertise.

So I guess I'm giving up on this and let distro bakers decide on what
to use.

Thanks everyone. 

Cengiz Can
@cengiz_io



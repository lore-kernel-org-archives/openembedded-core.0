Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 6B77F6E5CC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 16:32:45 +0000 (UTC)
Received: from elite.brightsigndigital.co.uk ([213.210.30.29]
	helo=phil-desktop) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1abWBB-0007pO-H4; Thu, 03 Mar 2016 17:32:45 +0100
Message-ID: <1457022764.3476.46.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Mar 2016 16:32:44 +0000
In-Reply-To: <1456361325-19298-1-git-send-email-armccurdy@gmail.com>
References: <1456361325-19298-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] boost.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
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
X-List-Received-Date: Thu, 03 Mar 2016 16:32:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-02-24 at 16:48 -0800, Andre McCurdy wrote:
> The original over-ride dates back to 2009:
> 
>   http://git.openembedded.org/openembedded-core/commit/?id=43e94412c4
> 5b4b79485a64010c76d89b245bb235
> 
> There are no obvious issues seen now when building boost in thumb2
> for Cortex A15.

Conceptually, this patch has the same armv6 problem as the glib-2.0 one
I mentioned earlier.  But actually, boost seems to compile just fine as
Thumb-1 for armv5te, so I suspect that in this case the override is
just plain obsolete and could safely be deleted altogether.

p.



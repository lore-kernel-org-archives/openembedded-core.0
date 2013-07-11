Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 945B860686
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 11:34:22 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UxF8d-0002r9-Rk; Thu, 11 Jul 2013 13:34:20 +0200
Message-ID: <1373542459.2389.323.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 12:34:19 +0100
In-Reply-To: <CAJTo0La1Npg5YwJ8ihzfbZvepOvg2HdjkbK_ir6WOvBVHBBkcQ@mail.gmail.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<a546f2c5f8ecec522cb8087015359f433fb5c998.1373443071.git.hongxu.jia@windriver.com>
	<CAJTo0LZTHz5hE8jx+6qNtePXj-LcMpsXEJ3zbwN4jS9npDHpLg@mail.gmail.com>
	<CAJTo0LbGRLcbb_9J1AdDM1ZFX18SYQi_h6VPwxN3SESDdnN0gA@mail.gmail.com>
	<1373539530.2389.320.camel@phil-desktop.brightsign>
	<CAJTo0La1Npg5YwJ8ihzfbZvepOvg2HdjkbK_ir6WOvBVHBBkcQ@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Thu, 11 Jul 2013 11:34:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-07-11 at 12:14 +0100, Burton, Ross wrote:
> On 11 July 2013 11:45, Phil Blundell <pb@pbcl.net> wrote:
> > I think you could still legitimately question whether having recipes in
> > oe-core that are "just for LSB" is sensible and/or desirable, not least
> > because dangling libraries that don't have any users are hard to test.
> 
> I was just pondering the idea of a "meta-lsb"...

Yeah, I was thinking about that too.  The obvious downside of this plan
is that this layer would end up containing a random-looking grab-bag of
recipes with nothing in common other than that they're needed for LSB
conformance and not in oe-core.  

In practice that's probably going to mean that the majority of them
would duplicate recipes from other layers (e.g. meta-browser in the nss
case) which doesn't seem like a very satisfactory state of affairs.

p.




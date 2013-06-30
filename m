Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 840DC6A467;
	Sun, 30 Jun 2013 10:47:24 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UtFAC-00074N-Te; Sun, 30 Jun 2013 12:47:24 +0200
Message-ID: <1372589229.889.0.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 30 Jun 2013 11:47:09 +0100
In-Reply-To: <20130629190437.GY3261@jama>
References: <20130503151507.1737A504ED@opal> <20130629190437.GY3261@jama>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Phil Blundell : image.bbclass: Don't mark do_rootfs and do_build as nostamp
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
X-List-Received-Date: Sun, 30 Jun 2013 10:47:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-06-29 at 21:04 +0200, Martin Jansa wrote:
> On Fri, May 03, 2013 at 03:15:07PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 8505008c115efb54d18e5f25441c7a938a32ffaf
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=8505008c115efb54d18e5f25441c7a938a32ffaf
> > 
> > Author: Phil Blundell <pb@pbcl.net>
> > Date:   Fri May  3 13:38:22 2013 +0100
> > 
> > image.bbclass: Don't mark do_rootfs and do_build as nostamp
> 
> FWIW with OEBasic signature handle one needs to call
> bitbake -c clean *image
> now in order to recreate it with new versions available, but that's fine
> for me (probably last OEBasic user), I've updated my bash aliases to do
> clean.

Right, that's true.  Or of course you can reinstate the [nostamp]
markers in whatever config file (distro presumably) you use to select
OEBasic.

p.




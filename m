Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ua6Uj-0006eR-GU for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 17:41:32 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ua6DI-0004sm-Vu; Wed, 08 May 2013 17:23:29 +0200
Message-ID: <1368026595.14512.342.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Wed, 08 May 2013 16:23:15 +0100
In-Reply-To: <518A6B25.5000108@r-finger.com>
References: <518A6B25.5000108@r-finger.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 15:41:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-08 at 16:11 +0100, Tomas Frydrych wrote:
> I think it would makes sense to move clutter related packages from
> oe-core into a dedicated layer:
> 
> * AFAIK nothing in oe-core requires cogl/clutter/mx,
> 
> * The packages in oe-core are effectively unmaintained, several upstream
> releases behind, and pretty much unusable,

I think this would be a fine idea.  As you observe, the recipes in
oe-core today are old, slightly hokey, and not a whole lot of use for
much.  We are currently maintaining our own clutter recipes in a local
layer but it would be nice to have something else upstream to lean on.

One particular issue for us is that the clutter recipes as they stand in
oe-core are very X11-centric.  We don't have X and, instead, use the
eglnative backend.  It'd be handy for us if some putative refactoring of
the recipes made them more friendly to non-X11 deployments.

p.





Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UbqoL-00083Q-9P for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 13:21:09 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UbqWn-0003u5-C3; Mon, 13 May 2013 13:02:49 +0200
Message-ID: <1368442968.6920.4.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 13 May 2013 12:02:48 +0100
In-Reply-To: <3529451.hQA8zCVn47@helios>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
	<3529451.hQA8zCVn47@helios>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Mon, 13 May 2013 11:21:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-05-12 at 20:55 +0100, Paul Eggleton wrote:
> That doesn't work well for software layers - it is not a good thing for 
> various recipes to get rebuilt just because you add meta-oe to your 
> configuration for example.
> 
> The protocol we've established is to add PACKAGECONFIG options to enable the 
> dependencies but have them disabled by default; these can be enabled as 
> desired in distro or local configuration when the layer satisfying the 
> dependency is also enabled.

That doesn't seem totally ideal either, since it means that oe-core ends
up containing a bunch of "joke" PACKAGECONFIG options that will break
your build if you enable them (unless you add some other layer at the
same time).  Personally I would have thought that unnecessary rebuilds
of the handful of packages that this would affect were probably the
lesser of the two evils, though obviously it's not my choice to make.

p.





Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UczYn-0002ot-8q for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 16:53:41 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UczHA-0000qP-Na; Thu, 16 May 2013 16:35:24 +0200
Message-ID: <1368714923.6920.136.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Thu, 16 May 2013 15:35:23 +0100
In-Reply-To: <5194C123.5090506@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <1368639038.18324.6.camel@ted>
	<CAP9ODKqQ-TXBwUqPVZ_oZOK2MLRQhSp_9Xb7a=dOiPaQ+zUw5A@mail.gmail.com>
	<1671648.4UWfFTD1eS@helios>
	<CAP9ODKpqFxzooVtRzzfDzOQcicXQYnJ3wp0qO-jHyt1fi+1XGQ@mail.gmail.com>
	<1368650968.16243.145.camel@pb-ThinkPad-R50e>
	<5194A04E.3000300@r-finger.com>
	<1368700555.6920.118.camel@phil-desktop.brightsign>
	<5194C123.5090506@r-finger.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 16 May 2013 14:53:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-16 at 12:21 +0100, Tomas Frydrych wrote:
> This would probably merit some sort of cogl-initial recipe to add.

Yeah.  If it was just a case of doing that then I would have done so;
the trouble is that you end up having to put garbage like

# We need to use the nopango build of cogl because we are a build dependency of pango
PKG_CONFIG_PATH_prepend = "${STAGING_DIR_HOST}/${exec_prefix}/cogl-nopango/${baselib}/pkgconfig:"
TARGET_LDFLAGS += "-Wl,-rpath-link,${STAGING_DIR_HOST}/${exec_prefix}/cogl-nopango/${baselib}"

in the recipes for everything else that participates in this dependency
chain and needs building before the "real" cogl.  Which is ugly.

p.




Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtZjC-00050E-Fa
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:35:50 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	08:31:12 +0200
Date: Wed, 17 Aug 2011 08:31:23 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110817063123.GE7904@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1313503017.git.anders@chargestorm.se>
	<bb23dd3cd4f1325370b9566e2a8359b6b5d1e842.1313503017.git.anders@chargestorm.se>
	<5AA93A51-0AF1-4B3E-8B9A-7E1A1A8C2C18@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <5AA93A51-0AF1-4B3E-8B9A-7E1A1A8C2C18@dominion.thruhere.net>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 4/5] ofono: conditionally enable bluetooth
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Aug 2011 06:35:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Koen Kooi <koen@dominion.thruhere.net> [110816 16:34]:
> Op 16 aug. 2011, om 15:57 heeft Anders Darander het volgende geschreven:

> > Use DISTRO_FEATURE to conditionally depend on bluez4, as well as enabling bluetooth.
> > 
> > Signed-off-by: Anders Darander <anders@chargestorm.se>
> > ---
> > meta/recipes-connectivity/ofono/ofono.inc     |    3 ++-
> > meta/recipes-connectivity/ofono/ofono_0.50.bb |    1 +
> > meta/recipes-connectivity/ofono/ofono_git.bb  |    4 ++++
> > 3 files changed, 7 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
> > index a14b35a..ab233dc 100644
> > --- a/meta/recipes-connectivity/ofono/ofono.inc
> > +++ b/meta/recipes-connectivity/ofono/ofono.inc
> > @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
> > 
> > inherit autotools pkgconfig update-rc.d
> > 
> > -DEPENDS  = "dbus glib-2.0 udev bluez4"
> > +BLUEZDEPENDS = "bluez4"
> > +DEPENDS  = "dbus glib-2.0 udev ${@base_contains('DISTRO_FEATURES', 'bluetooth','${BLUEZDEPENDS}', '', d)}"

> is that BLUEZDEPENDS helper var really needed?

I'll rework this patch and send an updated pull-request shortly.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB	



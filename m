Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7OXS-0007Fe-Ca for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 11:01:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2D9qM9w024998
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 09:52:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24411-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 09:52:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2D9qD6n024990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 09:52:15 GMT
Message-ID: <1331632334.15192.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 09:52:14 +0000
In-Reply-To: <63F58257-6C34-409B-948C-B4C1D0CAF211@dominion.thruhere.net>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
	<df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
	<63F58257-6C34-409B-948C-B4C1D0CAF211@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 01/17] leafpad: Package currently unpackaged files.
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
X-List-Received-Date: Tue, 13 Mar 2012 10:01:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-13 at 09:07 +0100, Koen Kooi wrote:
> Op 13 mrt. 2012, om 01:22 heeft Richard Purdie het volgende geschreven:
> 
> > This resolves the QA warning:
> > 
> > WARNING: For recipe leafpad, the following files/directories were installed but not shipped in any package:
> > WARNING:   /usr/share/icons
> > WARNING:   /usr/share/icons/hicolor
> > WARNING:   /usr/share/icons/hicolor/16x16
> > WARNING:   /usr/share/icons/hicolor/22x22
> > WARNING:   /usr/share/icons/hicolor/scalable
> > WARNING:   /usr/share/icons/hicolor/32x32
> > WARNING:   /usr/share/icons/hicolor/24x24
> > WARNING:   /usr/share/icons/hicolor/16x16/apps
> > WARNING:   /usr/share/icons/hicolor/16x16/apps/leafpad.png
> > WARNING:   /usr/share/icons/hicolor/22x22/apps
> > WARNING:   /usr/share/icons/hicolor/22x22/apps/leafpad.png
> > WARNING:   /usr/share/icons/hicolor/scalable/apps
> > WARNING:   /usr/share/icons/hicolor/scalable/apps/leafpad.svg
> > WARNING:   /usr/share/icons/hicolor/32x32/apps
> > WARNING:   /usr/share/icons/hicolor/32x32/apps/leafpad.png
> > WARNING:   /usr/share/icons/hicolor/24x24/apps
> > WARNING:   /usr/share/icons/hicolor/24x24/apps/leafpad.png
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb |    6 ++++--
> > 1 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> > index 68402c5..3d1bc43 100644
> > --- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> > +++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> > @@ -1,6 +1,5 @@
> > DESCRIPTION = "Simple GTK+ Text Editor"
> > HOMEPAGE = "http://tarot.freeshell.org/leafpad/"
> > -BUGTRACKER = ""
> > 
> > LICENSE = "GPLv2 & GPLv2+"
> > LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> > @@ -14,7 +13,7 @@ SRC_URI = "http://savannah.nongnu.org/download/${BPN}/${BPN}-${PV}.tar.gz \
> > 
> > SRC_URI[md5sum] = "254a72fc67505e3aa52884c729cd7b97"
> > SRC_URI[sha256sum] = "959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c"
> > -PR = "r1"
> > +PR = "r2"
> > 
> > SRC_URI_append_poky += " file://owl-menu.patch;apply=yes "
> > 
> > @@ -29,3 +28,6 @@ do_install_append () {
> > }
> > 
> > FILES_${PN} += "${datadir}/applications/leafpad.desktop"
> > +
> > +PACKAGES += "leafpad-stock-icons"
> > +FILES_leafpad-stock-icons = "${datadir}/icons/hicolor/"
> 
> I strongly suspect that that .desktop will reference leafpad.png as
> the icon, but I haven't actually verified that.

I can confirm it does not (it references accessories-text-editor).

>  This recipe should probably inherit gtk-icon-cache.

Probably although given the above it becomes less of an issue.

Cheers,

Richard




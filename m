Received: from ocean.emcraft.com ([213.221.7.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dima_ch@emcraft.com>) id 1REkAA-00019V-K4
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 17:59:10 +0200
Received: from vladimir.emcraft.com ([172.17.0.253])
	by ocean.emcraft.com with esmtp (Exim 4.76)
	(envelope-from <dima_ch@emcraft.com>) id 1REjSW-0002I5-9B
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 19:14:04 +0400
From: Dmitry Cherukhin <dima_ch@emcraft.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AEDF5974-B8CC-4B58-ACDA-2E2808B22C40@dominion.thruhere.net>
References: <f63c9c5991312f05bffee750086a0c7398770f8a>
	<1316607552-20870-1-git-send-email-dima_ch@emcraft.com>
	<AEDF5974-B8CC-4B58-ACDA-2E2808B22C40@dominion.thruhere.net>
Organization: Emcraft Systems
Date: Fri, 14 Oct 2011 19:14:03 +0400
Message-ID: <1318605243.23340.577.camel@vladimir.emcraft.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-1.fc12) 
Subject: Re: [PATCH] qt4: Added support for QtMobility 1.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: dima_ch@emcraft.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 14 Oct 2011 15:59:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-21 at 14:28 +0200, Koen Kooi wrote:
> Op 21 sep. 2011, om 14:19 heeft Dmitry Cherukhin het volgende geschreven:
> 
> > Added two recipes:
> > 1) qt-mobility-x11 builds the QtMobility 1.2 package
> >   on the basis of qt4-x11-free;
> > 2) qt-mobility-embedded builds the QtMobility 1.2 package
> >   on the basis of qt4-embedded.
> > 
> > Signed-off-by: Dmitry Cherukhin <dima_ch@emcraft.com>
> > ---
> > meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch |   19 ++++++++
> > .../qt4/files/qtme_connectivity_pro.patch          |   12 +++++
> > meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch |   11 +++++
> > .../qt4/files/qtme_staticconfig_pri.patch          |   18 ++++++++
> > .../qt4/files/qtmx_staticconfig_pri.patch          |   10 ++++
> 
> Could you please add patch headers to those patches describing what they intend to fix and what their upstream status is?

I removed all .patch files, new version of the patch is here:
http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/8708

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core





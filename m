Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id AD1FC71B04
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 5611132005BC;
	Tue,  9 May 2017 11:22:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ybSvHmnlpGxc; Tue,  9 May 2017 11:22:08 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A61F97.dip0.t-ipconnect.de
	[87.166.31.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 012EC32005D2;
	Tue,  9 May 2017 11:22:07 +0200 (CEST)
Date: Tue, 9 May 2017 11:22:07 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org, Jussi Kukkonen
	<jussi.kukkonen@intel.com>
Message-ID: <20170509112207.0cd65f2d@t510.zcs.saftware.de>
In-Reply-To: <20170130232002.4088d7d3@t510.zcs.saftware.de>
References: <1480508551-26893-1-git-send-email-obi@opendreambox.org>
	<1480508551-26893-2-git-send-email-obi@opendreambox.org>
	<20170130232002.4088d7d3@t510.zcs.saftware.de>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] connman: enable connman-wait-online.service
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
X-List-Received-Date: Tue, 09 May 2017 09:22:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Ping, again, for this very simple patch.

On Mon, 30 Jan 2017 23:20:02 +0100
Andreas Oberritter <obi@opendreambox.org> wrote:

> Ping.
> 
> On Wed, 30 Nov 2016 13:22:31 +0100
> Andreas Oberritter <obi@opendreambox.org> wrote:
> 
> > Fixes network mounts on boot.
> > 
> > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > ---
> >  meta/recipes-connectivity/connman/connman.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> > index 091e402..0480257 100644
> > --- a/meta/recipes-connectivity/connman/connman.inc
> > +++ b/meta/recipes-connectivity/connman/connman.inc
> > @@ -56,7 +56,7 @@ PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
> >  INITSCRIPT_NAME = "connman"
> >  INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
> >  
> > -SYSTEMD_PACKAGES = "${PN} ${PN}-vpn"
> > +SYSTEMD_PACKAGES = "${PN} ${PN}-vpn ${PN}-wait-online"
> >  SYSTEMD_SERVICE_${PN} = "connman.service"
> >  SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
> >  SYSTEMD_SERVICE_${PN}-wait-online = "connman-wait-online.service"  
> 



Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1SDC8Z-0004Hn-RE
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 11:59:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2T9oLPm029296;
	Thu, 29 Mar 2012 10:50:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28549-03; Thu, 29 Mar 2012 10:50:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2T9oBV8029290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 29 Mar 2012 10:50:12 +0100
Message-ID: <1333014610.14983.4.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 10:50:10 +0100
In-Reply-To: <20120328233549.GD32193@denix.org>
References: <1332915061-19304-1-git-send-email-denis@denix.org>
	<1332923884.28414.189.camel@ted> <20120328233549.GD32193@denix.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] bc: use update-alternatives to make dc play nice with busybox
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
X-List-Received-Date: Thu, 29 Mar 2012 09:59:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-28 at 19:35 -0400, Denys Dmytriyenko wrote:
> On Wed, Mar 28, 2012 at 09:38:04AM +0100, Richard Purdie wrote:
> > On Wed, 2012-03-28 at 02:11 -0400, Denys Dmytriyenko wrote:
> > > -inherit autotools
> > > +do_install_append () {
> > > +	mv ${D}${bindir}/dc ${D}${bindir}/dc.${PN}
> > > +}
> > > +
> > > +inherit autotools update-alternatives
> > > +
> > > +ALTERNATIVE_NAME = "dc"
> > > +ALTERNATIVE_LINK = "${bindir}/dc"
> > > +ALTERNATIVE_PATH = "${bindir}/dc.${PN}"
> > > +ALTERNATIVE_PRIORITY = "100"
> > 
> > 
> > I think you should just be able to do:
> > 
> > """
> > ALTERNATIVE_LINKS = "${bindir}/dc"
> > ALTERNATIVE_PRIORITY = "100"
> > 
> > inherit autotools update-alternatives
> > """

> Yes, quite right. I see plenty of other recipes do it the hard way though...


All the more reason to get some better examples out there! :)

Thanks for resending.

Cheers,

Richard





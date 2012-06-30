Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sky64-0000d5-3x
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 15:52:24 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:35781 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SkxvU-0003xG-Bk for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 09:41:28 -0400
Date: Sat, 30 Jun 2012 09:41:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20120630132935.GA3689@jama.jama.net>
Message-ID: <alpine.DEB.2.02.1206300940100.18253@oneiric>
References: <alpine.DEB.2.02.1206300923060.17865@oneiric>
	<20120630132935.GA3689@jama.jama.net>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: is it best practice to use ${sysconfdir} rather than hard-coding "/etc"?
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
X-List-Received-Date: Sat, 30 Jun 2012 13:52:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 30 Jun 2012, Martin Jansa wrote:

> On Sat, Jun 30, 2012 at 09:25:57AM -0400, Robert P. J. Day wrote:
> >
> >   i suspect i know the answer to this, but in the recipe file
> > usbinit.bb, we have:
> >
> > do_install() {
> >     install -d ${D}/etc
> >     install -d ${D}/etc/init.d
> >     install usb-gether ${D}/etc/init.d
> > }
> >
> >   i'm guessing that would more properly be coded:
> >
> > do_install() {
> >     install -d ${D}${sysconfdir}
> >     install -d ${D}${sysconfdir}/init.d
> >     install usb-gether ${D}${sysconfdir}/init.d
> > }
> >
> >   the end result is functionally identical, of course, it's all just a
> > matter of style.
>
> using sysconfdir is better as someone can define it to different value
> then 'etc' and the later will still work (be consistent across image)

  there are definitely a number of examples of hard-coded "/etc" in
the recipes, but i'm not about to run around cleaning them -- i just
wanted to make sure there was no compelling reason to do that
hard-coding.  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



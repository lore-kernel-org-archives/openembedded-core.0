Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTtk7-0002MM-Ar for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 12:14:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPB8Lwm004448
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 11:08:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04393-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 11:08:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPB8EQW004442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 11:08:15 GMT
Message-ID: <1322219300.10928.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 11:08:20 +0000
In-Reply-To: <1322219018.26081.70.camel@phil-desktop>
References: <cover.1321969615.git.otavio@ossystems.com.br>
	<65caf0c80f03e4fd3710b708541b0a7dd8f310ba.1321969615.git.otavio@ossystems.com.br>
	<1321982105.29435.302.camel@phil-desktop>
	<CAP9ODKrBxULKL=3ZHhGiOU4g7+uM=ke+43sDU=h67CvU_q7bAA@mail.gmail.com>
	<1322179246.10928.38.camel@ted>
	<1322219018.26081.70.camel@phil-desktop>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] xserver-xorg: do not disable-dga as VESA driver requires it
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
X-List-Received-Date: Fri, 25 Nov 2011 11:14:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-25 at 11:03 +0000, Phil Blundell wrote:
> On Fri, 2011-11-25 at 00:00 +0000, Richard Purdie wrote:
> > Looking at vesa.c, there is quite a chunk of code in there depending on
> > DGA.
> 
> I guess the question is, is this chunk of code actually doing anything
> useful/important, or is it just there to support DGA on VESA?  If the
> latter then people who don't need/want DGA (which is probably everybody,
> nowadays) can just take it out.
> 
> All that said, I would have thought that the VESA driver itself was
> pretty much a fringe interest in this day and age.  Is anybody really
> using that on a shipping system?  If it's just for qemux86 test harness
> purposes then maybe we could turn on the vesafb driver in the kernel and
> use the straight framebuffer driver in Xorg rather than the VESA one.
> 
> > Is there any harm to building DGA apart from an extra package? Its a
> > self contained module isn't it?
> 
> I don't think it's that self-contained.  Admittedly it isn't all that
> big either, but still.
> 
> > If so, we should just be able to turn it on, package it separately and
> > forget about it?
> > 
> > Of course the ideal solution would be for someone to convert the vesa
> > driver to use the xrandr API...
> 
> I don't quite understand what xrandr has to do with that.  How does this
> relate to DGA?

The vesa driver looks like its using DGA APIs to expose mode setting. A
comment to that end is also in a TODO list at the top of the file.

Cheers,

Richard




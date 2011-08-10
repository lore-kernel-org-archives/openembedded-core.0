Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qr5ex-0001UP-Ib
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 12:05:11 +0200
Received: (qmail invoked by alias); 10 Aug 2011 10:00:40 -0000
Received: from p4FDF1E31.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.30.49]
	by mail.gmx.net (mp006) with SMTP; 10 Aug 2011 12:00:40 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19OVw92R2NOEwFrlgNlC0RW1lJPtUddJOKMe2mw3P
	zxbnMOeWq+s0I2
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 12:03:50 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201108100121.11110.schnitzeltony@gmx.de>
	<CAMKF1sqTmTomP3WeF1UtfCec0NOd18QAHgYuLLKug=788voF2w@mail.gmail.com>
In-Reply-To: <CAMKF1sqTmTomP3WeF1UtfCec0NOd18QAHgYuLLKug=788voF2w@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201108101203.50897.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Howto create image with -O0 optimization
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
X-List-Received-Date: Wed, 10 Aug 2011 10:05:11 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday, August 10, 2011 01:41:05 AM Khem Raj wrote:
> On Tue, Aug 9, 2011 at 4:21 PM, Andreas Mueller <schnitzeltony@gmx.de> wrote:
> > Hi
> > 
> > I am debugging thunar to find the reason for segfault and modified the
> > recipe to be compiled without optimization -O0. Now I need to step into
> > shared libraries too but since they are compiled with optimization it
> > causes confusing step seqences.
> > 
> > So: How do I force -O0 optimization for whole images?
> 
> couple of ways. Set DEBUG_BUILD = "1" in your local.conf and recompile
> this will build stuff with -O1 which is better for debugging then -O2
> 
> otherwise you can override SELECTED_OPTIMIZATION = "whatever you want"
> in local.conf
> 
Thanks Khem. With your hook I learned that:

o Optimization-magic is found in bitbake.conf shipped by oe-core
o eglibc cannot be compiled with -O0 ( complains that it needs optimization )

So I now do a rebuild with DEBUG_BUILD = "1" in local.conf.

A bit off-topic: Is there a wiki for newbies like me telling howto setup 
environment for application/library debugging?

Cheers

Andreas



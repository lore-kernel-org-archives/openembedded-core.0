Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SCdeB-0008O0-0A
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 23:09:43 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SCdVS-0005JG-Up for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 17:00:43 -0400
Date: Tue, 27 Mar 2012 17:00:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203271537460.30650@oneiric>
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
Subject: first of several posts to clarify/document OE issues for beginners
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
X-List-Received-Date: Tue, 27 Mar 2012 21:09:43 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  the setup:  for better or worse, i and a local colleague are
submitting a proposal to give a 1/2-day tutorial on OE/yocto at this
year's ottawa linux symposium:

  http://www.linuxsymposium.org/2012/

and my plan is to start from the absolute basics and walk attendees
through the really simple operations they can do with OE, building up
to (ideally) using yocto to configure and build an image for a
pandaboard ES.  along the way, there will be explanations of how to
create and customize recipes and layers, how to define a whole new BSP
and so on.  but the most important part of all of this will be
stressing the fundamentals -- what one can do beginning with an
absolutely minimal OE/bitbake setup and slowly checking out additional
layers.

  to that end, i'm going to start with nothing more than a git clone
of oe-core and bitbake and demonstrate how much one can do with only
that.  obviously, with just that, you're restricted to generating only
basic QEMU images but that's enough to demonstrate a great deal of OE.

  so over the next several posts, i'm going to be asking about one
issue at a time, trying to clarify everything there is to know about
it, condense it, and eventually push it back into the OE docs
currently residing over at the yocto project.

  so the starting point is:

$ git clone git://git.openembedded.org/openembedded-core oe-core
$ cd oe-core
$ git clone git://git.openembedded.org/bitbake bitbake

first couple posts coming shortly ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



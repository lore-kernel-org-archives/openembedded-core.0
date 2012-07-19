Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SrynC-0006ft-Fx
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 00:01:54 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:33683 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SrycD-0005kd-GL for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 17:50:33 -0400
Date: Thu, 19 Jul 2012 17:50:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207191738300.22542@oneiric>
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
Subject: what are the major phases of do_patch() for the kernel?
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
X-List-Received-Date: Thu, 19 Jul 2012 22:01:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  short version: what happens during each major processing step of the
do_patch function for the kernel?

  longer version: i'm stepping through what happens when i do a
"bitbake linux-yocto", and documenting what happens at each step --
currently looking at do_patch().

  after having run the previous validate_branches target, what i
appear to have is the source directory containing the kernel source
with the (for me) standard/arm-versatile-926ejs branch checked out,
and no top-level "meta" directory.  so far, so good.

  now, i'm building core-image-minimal for qemuarm, so i'm being as
unexciting and non-exotic as possible -- not selecting any special
parameters or corner cases or anything.

  so as i peruse do_patch() in kernel-yocto.bbclass, i'm following
along to functions like createme and updateme and patchme, and with
createme, further into decheckpoint and check_defconfig and ... you
get the idea.  and i'm kind of getting lost in the weeds of details.

  given that i'm building an absolutely stock target with a supported
machine, all i really need for the moment is a very high-level
explanation of what each of those main routines does.

  so if my initial understanding is correct (that before i start
do_patch), i have the stock yocto kernel checked out to the
appropriate machine branch and nothing else), what does each
subsequent step accomplish?

  don't need horrific detail, just one line or less as to what's
accomplished by each step like:

  * createme
    * decheckpoint
    * checkdefconfig
    * check_branch
    * metaize
  * updateme

... etc, etc.  and at the end of the patch step, i know that i'll have
that untracked top-level "meta" directory, still not sure what will
have been done with it yet.  i guess that's for the next step, which
appears to be "kernel_configme".  but one thing at a time.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



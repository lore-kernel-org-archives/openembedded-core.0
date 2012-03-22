Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SAgXs-0003WL-Dr
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:51:09 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SAgPH-000404-2P for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 07:42:15 -0400
Date: Thu, 22 Mar 2012 07:42:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203220731420.16149@oneiric>
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
Subject: proper way to bounce between two (or more) build directories?
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
X-List-Received-Date: Thu, 22 Mar 2012 11:51:10 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  haven't seen this mentioned anywhere and i know it's simple but i
want to confirm this.

  say i run oe-init-build-env to initialize a new project, part of the
effect of that is to prepend the OE and bitbake related directories to
PATH.  i work there for a while, then want to put that on hold to
start a second build.

  i rerun oe-init-build-env to set up that second build, which works
fine but, unsurprisingly, that prepends the OE directories to my PATH
*again* (but i really have no choice, it has to be done).

  after a while, i want to go back to the first project.  am i
expected to run oe-init-build-env yet again?  (prepending directories
yet again?)

  as best i can tell, the only change i need to make in switching
build directories is to reset the BUILDDIR env variable.  is that all
that's necessary?  i don't see anything else in my environment that
would have to be reset.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



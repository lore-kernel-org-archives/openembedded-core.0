Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SCe9s-0000K1-DT
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 23:42:28 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SCe1A-0006ta-GZ for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 17:33:28 -0400
Date: Tue, 27 Mar 2012 17:33:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203271728430.7513@oneiric>
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
Subject: verifying all necessary OE-related software on your dev host
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
X-List-Received-Date: Tue, 27 Mar 2012 21:42:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  assuming all i've done so far is:

$ git clone git://git.openembedded.org/openembedded-core oe-core
$ cd oe-core
$ git clone git://git.openembedded.org/bitbake bitbake

the only thing a beginner might want to do is check that the dev host
has all essential S/W for OE work.  i know that's documented in the
yocto QS guide here:

http://www.yoctoproject.org/docs/current/yocto-project-qs/yocto-project-qs.html

is there any automated way to check for this?  is there any OE/bitbake
equivalent to "please check that all necessary commands are
installed"?

  is there anything else at all that a user might want to verify
before starting to build their first image?   nothing leaps to mind,
but i just want to make sure i'm not missing anything.

rday

p.s.  subsequent questions will get more interesting, i promise.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



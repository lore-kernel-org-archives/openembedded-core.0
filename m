Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SnS2r-0000sg-63
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 12:15:21 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:50797 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SnRs7-0005sw-Kb for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 06:04:15 -0400
Date: Sat, 7 Jul 2012 06:04:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207070547020.17784@oneiric>
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
Subject: wanting to clarify patch mechanics
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
X-List-Received-Date: Sat, 07 Jul 2012 10:15:21 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  not sure if there's a more comprehensive coverage of how OE patches
work than the brief discussion in the bitbake user manual, but i'd
like to clarify the variations just so i can document them.

  here's what's in the bitbake manual that seems to be the entire
coverage of patches:

SRC_URI= "file://relativefile.patch"
SRC_URI= "file://relativefile.patch;this=ignored"
SRC_URI= "file:///Users/ich/very_important_software"

and so, to questions.

  first, what is this "this=ignored"?  does that still exist?  is it
equivalent to "apply=no"?  i don't see a single example of
"this=ignored" anywhere throughout oe-core, but i see a single example
of "apply=no" in net-tools_1.60-23.bb.

  speaking of apply, it would seem that "apply=yes" is redundant, is
that correct?  there are a couple dozen examples of that throughout
oe-core, mostly in the bash recipe file.  is there anything subtle
about that parameter, or is it truly superfluous?

  there's no mention of the "striplevel" parameter in the manual,
which i think would be useful, and that its default value is "1".  and
i can see the warning that "pnum" is deprecated in favour of
"striplevel", but at the moment, i see not a single usage of "pnum"
and wonder if that warning can just be tossed and support for "pnum"
abandoned entirely.  (there's not a single usage of "pnum" anywhere in
the entire yocto pull, either.  just an observation.)


  i think that's all i had for now.  anything else about patches worth
writing down?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



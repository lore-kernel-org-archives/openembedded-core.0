Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SDYlC-0000qR-Hl
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 12:08:46 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SDYcR-0006f4-8f for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 05:59:43 -0400
Date: Fri, 30 Mar 2012 05:59:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203300551220.28382@oneiric>
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
Subject: require/include a .bb file in the same directory?
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
X-List-Received-Date: Fri, 30 Mar 2012 10:08:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  couple questions about the require/include directives.  first, can
you include *any* valid text file?  not just your standard .inc file
(even though that is of course the most common thing to do).

  and second, i'm looking at this example in meta/recipes-core/images,
where the recipe file core-image-minimal-mtdutils.bb is defined as:

require core-image-minimal.bb
IMAGE_INSTALL += "mtd-utils"

that looks perfectly reasonable since that required .bb file is in the
same directory, and this is clearly just defining a new image recipe
by adding one more package.

  but the explanation of include/require in the bitbake manual is:

"if the path specified on the include line is a relative path,
BitBake will locate the first one it can find within BBPATH."

  that suggests that, by some massively unlikely fluke, i might
unknowingly have an identically-named recipe file earlier in my BBPATH
variable and that earlier one is the one that would be included.  is
that correct?

  and if that's true, could i avoid that kind of mistake by doing:

require ./core-image-minimal.bb

i realize getting hung up like this is unlikely, but it's always
possible.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



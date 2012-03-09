Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1S5x3H-0004mL-8U
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 11:27:59 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1S5wuv-0005mm-EI for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 05:19:21 -0500
Date: Fri, 9 Mar 2012 05:19:14 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203090515010.15748@oneiric>
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
Subject: "IMAGE_INSTALL_append" versus "IMAGE_INSTALL +="?
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
X-List-Received-Date: Fri, 09 Mar 2012 10:27:59 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  the current yocto dev manual contains the following:

===== start

"4.3.4.1. Adding Packages

The simplest way to add extra packages to all images is by using the
IMAGE_INSTALL variable with the _append operator:

     IMAGE_INSTALL_append = " strace"


Use of the syntax is important. Specifically, the space between the
quote and the package name, which is strace in this example. This
space is required since the _append operator does not add the space.

Furthermore, you must use _append instead of the += operator if you
want to avoid ordering issues."

===== end

  but oe-core occasionally uses the form discouraged above, as in the
case of core-image-minimal-mtdutils.bb:

  IMAGE_INSTALL += "mtd-utils"

perhaps i'm misreading something, but it's definitely confusing to
read that section in the manual, then find examples like the above in
oe-core.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================




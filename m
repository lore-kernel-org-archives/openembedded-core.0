Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sq7rL-0004lk-10
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 21:18:31 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:40130 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sq7gS-0002E5-FI for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 15:07:16 -0400
Date: Sat, 14 Jul 2012 15:07:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207141456190.13961@oneiric>
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
Subject: is "LINUX_VERSION" actually needed for a kernel checkout?
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
X-List-Received-Date: Sat, 14 Jul 2012 19:18:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  pawing my way through the kernel recipe file and checkout code so i
understand it once and for all, and i'm curious about the setting of:

LINUX_VERSION ?= "3.4.4"

in linux-yocto_3.4.bb.

  for my example, i'm testing with straight oe-core and building for
qemuarm, so i can see the following relevant lines from the kernel
recipe file that will affect my kernel checkout:

KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
SRCREV_machine_qemuarm ?= "9aca8fec49787efbe44d0f137f31ee59edd94c49"
SRCREV_meta ?= "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"

SRC_URI =
"git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"

LINUX_VERSION ?= "3.4.4"

  as i read the docs (and i could be totally off-base), the KBRANCH
variable identifies the branch i want for my checkout, while the
SRCREV_machine variable identifies the particular commit on that
branch that i want (typically, it's a merge of standard/base into that
branch).  and of course, SRCREV_meta is the state of the meta branch i
want for further configuration.

  but at no time did i need to know the tagged kernel version that my
machine branch was based on, did i?  so for the purposes of what
happened above, i didn't *require* the value of LINUX_VERSION, did i?

  i can see that it will be handy in, say, creating meaningful
directory names for building.  but beyond that, what else is it used
for?  (i haven't got to the meta/ directory processing yet, so i have
no idea whether it's suddenly necessary there.)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



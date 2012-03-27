Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SCVWa-0005JB-Gw
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 14:29:20 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SCVNt-0005Hz-0g for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 08:20:21 -0400
Date: Tue, 27 Mar 2012 08:20:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203270815010.3125@oneiric>
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
Subject: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Tue, 27 Mar 2012 12:29:20 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm currently poring over the OE docs (including the ones at the
yocto site), and i'm trying to figure out how to simply add a package
to an image through one's local.conf file.

  the current yocto ref manual has an entire section about customizing
images:

http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.html#usingpoky-extend-customimage

but it discusses creating custom recipe files and custom tasks, and
using IMAGE_INSTALL and IMAGE_FEATURES and EXTRA_IMAGE_FEATURES, and
finally gets into using local.conf, suggesting:

  DISTRO_EXTRA_RDEPENDS += "strace"

is that, in fact, the accepted way if one simply wants to add a
package to an existing image build?  because as soon as the manual
mentions it, in the very next paragraph, it discourages its use.

  so what's the story?  it seems it should be a lot easier to figure
out how to do something that straightforward.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



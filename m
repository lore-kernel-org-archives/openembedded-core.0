Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1SRk1C-0002nH-OW for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 14:59:54 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1SRjrf-0005qI-RD for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 14:50:03 +0200
Received: from mca-01.iosb.fraunhofer.de ([153.96.14.101])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 14:50:03 +0200
Received: from dominik.fuerniss by mca-01.iosb.fraunhofer.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 14:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dominik <dominik.fuerniss@iosb.fraunhofer.de>
Date: Tue, 8 May 2012 12:43:35 +0000 (UTC)
Message-ID: <loom.20120508T143825-964@post.gmane.org>
References: <cover.1334940120.git.sgw@linux.intel.com>
	<086fa62c043e3cd4b9bc8d2377507ed842a3097b.1334940120.git.sgw@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 153.96.14.101 (Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1;
	WOW64; Trident/5.0))
Subject: Re: [CONSOLIDATED PULL 29/43] package.bbclass: Ensure kernel	modules get stripped
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
X-List-Received-Date: Tue, 08 May 2012 12:59:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> Kernel modules are not marked as executable but we do expect to strip them.
> This patch adds in missing code to ensure we do this. Without this images
> are getting sigificantly bloated in size.
> 


This patch causes problems with TI's dsplink and linuxutils as posted here 
http://comments.gmane.org/gmane.linux.embedded.yocto.meta-ti/340.




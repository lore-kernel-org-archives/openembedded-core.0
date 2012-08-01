Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SwieO-0007ip-Lv
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 01:48:24 +0200
Received: from rrcs-24-227-210-218.sw.biz.rr.com ([24.227.210.218]:32886
	helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SwiT9-0000qI-D3 for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 19:36:47 -0400
Date: Wed, 1 Aug 2012 18:36:36 -0500 (CDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1208011831540.5168@oneiric>
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
Subject: using an external (arm) toolchain - just checking i did this properly
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
X-List-Received-Date: Wed, 01 Aug 2012 23:48:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  having never used an external toolchain to build an OE image, i
figured i'd give it a shot to build for qemuarm so, based on *minutes*
of research to see what it would take to use one from code sourcery,
what i came up with was:

1) download arm-2009q1-203-arm-none-linux-gnueabi.bin and run it to
install arm toolchain into a personal directory

2) add the following to my local.conf:

  TCMODE = "external-sourcery"
  EXTERNAL_TOOLCHAIN = "/home/rpjday/CodeSourcery/Sourcery_G++_Lite"

and that would appear to be it.  i'm going to poke around the recipe
files to see *how* using an external toolchain is supported but is the
above fundamentally correct for just using this one?  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TdiLH-0001g4-AN
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 15:10:28 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:56365 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tdi7V-00055G-RL; Wed, 28 Nov 2012 08:56:09 -0500
Date: Wed, 28 Nov 2012 08:55:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <5890106.Vb1bZqkAH2@helios>
Message-ID: <alpine.DEB.2.02.1211280849310.26034@oneiric>
References: <alpine.DEB.2.02.1211272315510.29858@oneiric>
	<20121128130121.GC3477@jama.jama.net>
	<alpine.DEB.2.02.1211280808130.578@oneiric>
	<5890106.Vb1bZqkAH2@helios>
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
Cc: openembedded-core@lists.openembedded.org
Subject: Re: what is "packagegroup-core-nfs-server"?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 14:10:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  and to finalize the confusion, there's this from
meta/classes/image.bbclass:

# IMAGE_FEATURES may contain any available package group

which would appear to be untrue at this point.  i think a better way
to approach this would be to discuss the possible types of entries you
might find in IMAGE_FEATURES, which appear to be:

* actual package groups
* individual recipes(?)
* values processed totally independently by other recipes that are
neither package groups nor recipes (eg, "read-only-rootfs")

  i can see i have my work cut out for me today. :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================




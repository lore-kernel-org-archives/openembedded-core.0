Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SE8ET-0002NM-5Z
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 02:01:21 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SE85g-0008Ai-Az; Sat, 31 Mar 2012 19:52:16 -0400
Date: Sat, 31 Mar 2012 19:52:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <1607664.qKyoFqIBt3@helios>
Message-ID: <alpine.DEB.2.02.1203311949120.14842@oneiric>
References: <alpine.DEB.2.02.1203311910320.12870@oneiric>
	<1607664.qKyoFqIBt3@helios>
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
Subject: Re: is "fakeroot" still used as a variable "flag"?
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
X-List-Received-Date: Sun, 01 Apr 2012 00:01:21 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 1 Apr 2012, Paul Eggleton wrote:

> On Saturday 31 March 2012 19:12:12 Robert P. J. Day wrote:
> >   the bitbake manual lists "fakeroot" as a possible variable flag,
> > along with things like "nostamp", "noexec" and so on.  but i don't see
> > fakeroot being used as a flag anywhere in the source tree.  has that
> > changed?
>
> No, fakeroot is still used - it is a flag for functions indicating fakeroot
> (these days pseudo) should be enabled when the function is executed.

  whoops, never mind, i misread that section in the manual.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



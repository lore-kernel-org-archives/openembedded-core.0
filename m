Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1StFqo-0008Sk-14
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 12:26:54 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:49208 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1StFfk-00044G-JB; Mon, 23 Jul 2012 06:15:28 -0400
Date: Mon, 23 Jul 2012 06:15:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <3029261.gDFRhJt4pK@helios>
Message-ID: <alpine.DEB.2.02.1207230614460.20267@oneiric>
References: <alpine.DEB.2.02.1207221512360.968@oneiric>
	<1965034.biL4ROLyBP@helios>
	<alpine.DEB.2.02.1207230606590.20207@oneiric>
	<3029261.gDFRhJt4pK@helios>
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
Subject: Re: any current standard on avoiding use of both "_append" and "+="?
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
X-List-Received-Date: Mon, 23 Jul 2012 10:26:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 23 Jul 2012, Paul Eggleton wrote:

> On Monday 23 July 2012 06:07:58 Robert P. J. Day wrote:
> >   is this valid?
> >
> > meta/classes/rootfs_rpm.bbclass:IMAGE_ROOTFS_EXTRA_SPACE_append =
> > "${@base_contains("PACKAGE_INSTALL", "zypper", " + 51200", "" ,d)}"
> >
> > does one not need the leading space in this context?
>
> We're not adding to something that is space-separated in this
> instance. In any case, if we are adding anything with this statement
> (i.e. if PACKAGE_INSTALL contains "zypper") then " + 51200" is being
> added which does contain a leading space.

  ah, quite so, i failed to notice that.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



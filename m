Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TdbCU-0007mW-AT
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 07:32:53 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:52828 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tdayi-0004DF-V7; Wed, 28 Nov 2012 01:18:37 -0500
Date: Wed, 28 Nov 2012 01:18:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <50B592B2.1060903@linux.intel.com>
Message-ID: <alpine.DEB.2.02.1211280117550.30152@oneiric>
References: <alpine.DEB.2.02.1211272315510.29858@oneiric>
	<50B592B2.1060903@linux.intel.com>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 28 Nov 2012 06:32:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 27 Nov 2012, Saul Wold wrote:

> On 11/27/2012 08:18 PM, Robert P. J. Day wrote:
> >
> >    poking around core-image.bbclass, and noticed this:
> >
> > PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
> >
> > except i don't see the corresponding packagegroup-core-nfs-server.bb
> > recipe file.  there *is* a packagegroup-core-nfs.bb file; how is the
> > above processed?
> >
> It's defined in recipes-core/packagegroups/packagegroup-core-nfs.bb
>
> The line
> PACKAGES = "${PN}-server"
> provides the key you are looking for.

  ah, quite so, thanks.  i figured it was something obvious.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



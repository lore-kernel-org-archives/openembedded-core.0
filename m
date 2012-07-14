Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sq7dt-0004Q5-UB
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 21:04:38 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:40096 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sq7T1-0001jm-6y for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 14:53:23 -0400
Date: Sat, 14 Jul 2012 14:53:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CADkTA4PV2BJr+NhO9HNuAZoLQuhCVO1WBKOGMwdDMN=B-4PzDQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207141452350.13932@oneiric>
References: <alpine.DEB.2.02.1207140756410.8123@oneiric>
	<CADkTA4PV2BJr+NhO9HNuAZoLQuhCVO1WBKOGMwdDMN=B-4PzDQ@mail.gmail.com>
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
Subject: Re: should linux-yocto_3.4.bb have a "bareclone=1" parameter?
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
X-List-Received-Date: Sat, 14 Jul 2012 19:04:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 14 Jul 2012, Bruce Ashfield wrote:

> On Sat, Jul 14, 2012 at 8:00 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   building for qemuarm and noticed that the log.do_kernel_checkout
> > file warned me about SRC_URI not including "bareclone=1", which is
> > true -- unlike all of the rest of the kernel recipe files, it
> > includes "nocheckout=1" instead.  any reason for this?  should i
> > submit a patch to change that to bareclone?
>
> It's like that on purpose, I updated the checkout code to deal with
> non-bare clones, so I've left it as-is to see if anyone digs up any
> checkout problems :)

  ah, so it's just an experiment.  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



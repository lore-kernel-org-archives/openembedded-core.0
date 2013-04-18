Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1USrdg-0000ou-De
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 18:24:53 +0200
Received: from cpebcc8100de718-cmbcc8100de715.cpe.net.cable.rogers.com
	([99.240.144.66]:49841 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1USrMi-00028h-77; Thu, 18 Apr 2013 12:07:16 -0400
Date: Thu, 18 Apr 2013 12:07:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <51701918.8070001@windriver.com>
Message-ID: <alpine.DEB.2.02.1304181205270.25184@oneiric>
References: <alpine.DEB.2.02.1304180833040.10184@oneiric>
	<516FFE5F.7040901@windriver.com>
	<alpine.DEB.2.02.1304181018220.21920@oneiric>
	<51700C7C.3050100@windriver.com>
	<alpine.DEB.2.02.1304181136120.22645@oneiric>
	<51701918.8070001@windriver.com>
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
Subject: Re: tweaking insane.bbclass to handle MIPS SEAD-3?
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
X-List-Received-Date: Thu, 18 Apr 2013 16:25:05 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 18 Apr 2013, Mark Hatle wrote:

> On 4/18/13 10:44 AM, Robert P. J. Day wrote:
> >
> >    so if i read you correctly, all i need to do is copy the existing
> > routerstationpro.conf to, say, sead3.conf, and add the single line:
> >
> > DEFAULTTUNE := "mips32el-nf"         <--- add that
> > require conf/machine/include/tune-mips32.inc
> >
> >    that about right? i'll give that a shot right away just to see if it
> > builds.  can't test it without the kit but building will still be a
> > useful exercise.
>
> Yes that should work.

  it's chugging away as we speak, no config warnings. i wonder what my
former students ran into that they *originally* told me the build
wasn't entirely successful. still waiting to hear back but this looks
good, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



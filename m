Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SoGxJ-0003vh-55
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:37:01 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:45290 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SoGmW-0007CA-Id; Mon, 09 Jul 2012 12:25:52 -0400
Date: Mon, 9 Jul 2012 12:25:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <1803032.sCdKSRoOHk@helios>
Message-ID: <alpine.DEB.2.02.1207091224240.1542@oneiric>
References: <alpine.DEB.2.02.1207071435090.25344@oneiric>
	<CAK18fxFo2YtoGNQEtLNh8cVPvxKebGYYKQSEVCPxXmWsTfU3Gg@mail.gmail.com>
	<alpine.DEB.2.02.1207091120520.1353@oneiric>
	<1803032.sCdKSRoOHk@helios>
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
Subject: Re: setting EXTRA_IMAGE_FEATURES explicitly in .bb file can screw things up
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
X-List-Received-Date: Mon, 09 Jul 2012 16:37:01 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 9 Jul 2012, Paul Eggleton wrote:

> On Monday 09 July 2012 11:24:27 Robert P. J. Day wrote:
> > On Mon, 9 Jul 2012, Andrei Gherzan wrote:
> > > So IMHO the EXTRA_IMAGE_FEATURES variable in the image should be
> > > merged in the IMAGE_FEATURES above. I don't see the meaning of it.
> >
> >   yup, that was precisely the point i was making.  so given the
> > potential for confusion, what should be the "best practise" here?
> > based on my sketchy understanding, it seems the proper approach would
> > be to let recipe files use IMAGE_FEATURES exclusively, while
> > specifically reserving EXTRA_IMAGE_FEATURES for the developer's
> > local.conf file, and avoid the current unpleasant mixing.
>
> Sounds like a good idea to me.

  i'll send in a patch that does that, especially since
local.conf.sample specifically instructs the developer to use
EXTRA_IMAGE_FEATURES.   patch coming shortly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sl0KL-0003ow-Oc
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 18:15:17 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:36855 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sl09l-0002Hv-W5 for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 12:04:22 -0400
Date: Sat, 30 Jun 2012 12:04:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4FEF1CB7.3000908@windriver.com>
Message-ID: <alpine.DEB.2.02.1206301203050.15011@oneiric>
References: <alpine.DEB.2.02.1206300847330.17264@oneiric>
	<CAK18fxGKQrqrtZK2m3Qi9qECSXMVpzhOGzbua3or19UAoGrUSw@mail.gmail.com>
	<alpine.DEB.2.02.1206301057240.23189@oneiric>
	<4FEF1CB7.3000908@windriver.com>
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
Subject: Re: does it make sense to define INITSCRIPT_* without inheriting update-rc.d?
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
X-List-Received-Date: Sat, 30 Jun 2012 16:15:17 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 30 Jun 2012, Mark Hatle wrote:

> On 6/30/12 9:57 AM, Robert P. J. Day wrote:
> >
> > On Sat, 30 Jun 2012, Andrei Gherzan wrote:
> >
> > > No. It won't make a difference. Or actually it makes a tiny
> > > difference: check package.bbclass, function named gen_packagevar.
> > >
> > > On Sat, Jun 30, 2012 at 3:50 PM, Robert P. J. Day <rpjday@crashcourse.ca>
> > > wrote:
> > >
> > >         currently figuring out details of INITSCRIPT_*, and noticed that
> > > the
> > >        recipe file irda-utils_0.9.18.bb assigned values to both
> > >        INITSCRIPT_NAME and INITSCRIPT_PARAMS without inheriting
> > > update-rc.d.
>
> Anything using those variables should inherit the class.  Otherwise
> it may not work as expected down the line when things change.

  which is what i suspected.  i'll submit a patch to add the missing
line if it's really supposed to be there.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



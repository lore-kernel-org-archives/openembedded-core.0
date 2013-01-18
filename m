Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TwKKP-0006F3-Oi
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 23:22:38 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:52666 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TwK5V-0000uB-L7; Fri, 18 Jan 2013 17:07:01 -0500
Date: Fri, 18 Jan 2013 17:06:58 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <50F9C550.5040507@linux.intel.com>
Message-ID: <alpine.DEB.2.02.1301181705540.24165@oneiric>
References: <alpine.DEB.2.02.1301181633360.23942@oneiric>
	<20130118214509.GC29386@jama.palm1.palmone.com>
	<50F9C550.5040507@linux.intel.com>
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
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what means PROV_class-native = ""?
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
X-List-Received-Date: Fri, 18 Jan 2013 22:22:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 18 Jan 2013, Saul Wold wrote:

> On 01/18/2013 01:45 PM, Martin Jansa wrote:
> > On Fri, Jan 18, 2013 at 04:35:34PM -0500, Robert P. J. Day wrote:
> > >
> > >    perusing oe-core for examples to demonstrate the concept of
> > > "PROVIDES =", and i ran across this in recipes-devtools/dpkg/dpkg.inc:
> > >
> > > PROV = "virtual/update-alternatives"
> > > PROV_class-native = ""
> >
> > PROV is variable with no special meaning
> > class-native is standard override for native recipe (like
> > virtclass-native was before).
> >
> > > PROVIDES += "${PROV}"
> > >
> > >    i'm not sure what to make of that -- what's the purpose of assigning
> > > to PROV, then subsequently assigning to PROVIDES, but with that
> > >
> > > PROV_class-native = ""
> > >
> > > line in between?  i did a grep and saw nothing else like it throughout
> > > oe-core.
> > >

> I believe that idea is since it's PROVIDES += , not a straight
> assignment like = it's not a simple to override with the +=, so for
> the target case PROVIDE the virtual/u-a, but not for the native case
> of that package.
>
> If it was a straight assignment (using =) the ${PROV} would not be
> needed.

  i thought it was something like that, i just wanted to make sure.
as martin pointed out, there's nothing magical about the PROV
variable, so i could just as easily have used, say, RDAY instead of
PROV as it was purely temporary, right?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



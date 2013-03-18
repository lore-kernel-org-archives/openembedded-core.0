Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHcxP-0001fH-G0 for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 17:30:45 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2IGMquP018300; Mon, 18 Mar 2013 16:22:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ekb-6qPVbPKF; Mon, 18 Mar 2013 16:22:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2IGMlcq018282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Mar 2013 16:22:50 GMT
Message-ID: <1363623213.16482.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Mar 2013 16:13:33 +0000
In-Reply-To: <20130318151612.GC13277@jama.dyndns-home.com>
References: <1363618422-19390-1-git-send-email-olivier.guiter@linux.intel.com>
	<20130318151612.GC13277@jama.dyndns-home.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] neard: upgrade to 0.10
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
X-List-Received-Date: Mon, 18 Mar 2013 16:30:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-18 at 16:16 +0100, Martin Jansa wrote:
> On Mon, Mar 18, 2013 at 03:53:42PM +0100, Olivier Guiter wrote:
> > neard ver 0.10:
> > 	Added initial WiFi handover support.
> > 	Added Service Name Lookup support to nfctool.
> > 	Added NDEF building unit tests.
> > 	Added State support to Bluetooth handover agent.
> > 	Added neard and neard.conf man pages.
> > 	Added a copy of the NFC kernel header.
> > 	Fixed handover validation tests failures.
> > 	Fixed Tag and Device PropertyChanged signal.
> > 
> > Signed-off-by: Olivier Guiter <olivier.guiter@linux.intel.com>
> > ---
> >  meta/recipes-connectivity/neard/neard_0.9.bb |    8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/recipes-connectivity/neard/neard_0.9.bb b/meta/recipes-connectivity/neard/neard_0.9.bb
> > index 8e33a9d..3ece002 100644
> > --- a/meta/recipes-connectivity/neard/neard_0.9.bb
> > +++ b/meta/recipes-connectivity/neard/neard_0.9.bb
> > @@ -47,14 +47,14 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
> >  
> >  RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
> >  
> > -# This is valid for 0.9+
> > +# This is valid for 0.10+
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> >   file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
> >   "
> >  S	= "${WORKDIR}/git"
> > -SRCREV	= "1e20e396cb837017b7e5ef822bfdab6ce060d2cf"
> > -PV	= "0.9-git${SRCPV}"
> > -PR	= "r1"
> > +SRCREV	= "eb486bf35e24d7d1db61350f5ab393a0c880523d"
> > +PV	= "0.10-git${SRCPV}"
> 
> This should be "+git${SCREV}" PV increment is good time to fix
> that without need for PE bump.

Whilst I agree, this has been useful for finding some bugs in the way
some of the version replacement code works...

Cheers,

Richard




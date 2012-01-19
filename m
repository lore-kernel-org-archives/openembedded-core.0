Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rnpnp-0000nP-Ef for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 12:05:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JAvUJT000580
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 10:57:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32404-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 10:57:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JAvM0G000574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 10:57:23 GMT
Message-ID: <1326970642.2511.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 10:57:22 +0000
In-Reply-To: <15839BE5-A26D-453B-A13F-08ECB328E829@dominion.thruhere.net>
References: <cover.1326964778.git.sgw@linux.intel.com>
	<07e6db4cffae944800892d934c11be3876eeaa92.1326964778.git.sgw@linux.intel.com>
	<15839BE5-A26D-453B-A13F-08ECB328E829@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 12/33] pkgconfig: Move pkg.m4 from -dev to package
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
X-List-Received-Date: Thu, 19 Jan 2012 11:05:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-19 at 11:30 +0100, Koen Kooi wrote:
> Op 19 jan. 2012, om 10:22 heeft Saul Wold het volgende geschreven:
> 
> > [YOCTO #1908]
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> > meta/recipes-devtools/pkgconfig/pkgconfig.inc     |    2 ++
> > meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb |    2 +-
> > 2 files changed, 3 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> > index 641bfae..00c23d7 100644
> > --- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> > +++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> > @@ -31,3 +31,5 @@ do_configure_prepend () {
> > }
> > 
> > BBCLASSEXTEND = "native nativesdk"
> > +
> > +FILES_${PN} += "${datadir}/aclocal/pkg.m4"
> 
> Why is this done exactly? M4 files do belong in the -dev package.

Think about the use cases for having pkgconfig installed. In the
pkgconfig case, the -dev package isn't particularly useful. 

You can argue this one both ways though...

Cheers,

Richard




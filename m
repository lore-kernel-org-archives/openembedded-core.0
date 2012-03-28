Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SCqyn-0004NF-Tf
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 13:23:54 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SCqq5-0002Fr-3W; Wed, 28 Mar 2012 07:14:53 -0400
Date: Wed, 28 Mar 2012 07:14:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <26662553.TyMenuqT12@helios>
Message-ID: <alpine.DEB.2.02.1203280713020.2164@oneiric>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<6668552.CMpgp5lzfB@helios>
	<alpine.DEB.2.02.1203280659340.27661@oneiric>
	<26662553.TyMenuqT12@helios>
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
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 11:23:54 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1272610259-1332933287=:2164"

--8323329-1272610259-1332933287=:2164
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 28 Mar 2012, Paul Eggleton wrote:

> On Wednesday 28 March 2012 07:06:21 Robert P. J. Day wrote:
> > On Wed, 28 Mar 2012, Paul Eggleton wrote:
> > > On Wednesday 28 March 2012 12:51:46 Marko Kati=C4=87 wrote:
> > > > I always use "bitbake -c clean -c cleansstate package" for that pur=
pose.
> > >
> > > Firstly, cleansstate does a clean already, so no need to specify that=
 as
> > > well.
> > >
> > > Secondly, images are always rebuilt so provided you comment out the
> > > IMAGE_INSTALL_append or whatever you have done to change the image
> > > contents, you can just build the image again and it will be rebuilt
> > > as it was before.
> >
> >   i was testing the various solutions presented, and the first couple
> > worked just by changing the local.conf file (both adding and
> > removing), but the third using DISTRO_EXTRA_RDEPENDS didn't appear to
> > make a difference after i added the appropriate line to local.conf.
> >
> >   if i add the line:
> >
> > DISTRO_EXTRA_RDEPENDS +=3D "sysfsutils"
> >
> > do you know if this requires an explicit reconfiguration of some kind
> > to be picked up?  it's exactly these niggling details i'm trying to
> > clarify.
>
> Yes, it will. You would need to clean and rebuild task-base because unlik=
e the
> other methods the dependency gets built into a task package.
>
> This is one of the reasons you should not use DISTRO_EXTRA_RDEPENDS from
> local.conf - this is intended to be set from the distro configuration onl=
y.
> Please don't recommend this to be modified from local.conf - stick to
> CORE_IMAGE_EXTRA_INSTALL (or IMAGE_INSTALL_append, if you must).

  even though i realize this technique is not encouraged for
local.conf, as i mentioned, i just tested using it from scratch in a
brand new build and it still didn't add that package to my image.  if
it should have, then something isn't working.

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323329-1272610259-1332933287=:2164--

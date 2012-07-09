Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SoKpw-0002kr-NY
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 22:45:41 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:47109 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SoKfA-0003DS-CU for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 16:34:32 -0400
Date: Mon, 9 Jul 2012 16:34:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAK18fxFD1X6tPLsXG-vwRFu-EeEZDTdeKoTKRYAvYrKJfd-_mQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207091630380.24097@oneiric>
References: <alpine.DEB.2.02.1207081227430.27741@oneiric>
	<CAK18fxFD1X6tPLsXG-vwRFu-EeEZDTdeKoTKRYAvYrKJfd-_mQ@mail.gmail.com>
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
Subject: Re: more pedantry -- looking to clarify layers definition, BBPATH, BBFILES, etc.
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
X-List-Received-Date: Mon, 09 Jul 2012 20:45:41 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-801856245-1341866062=:24097"

--8323329-801856245-1341866062=:24097
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 9 Jul 2012, Andrei Gherzan wrote:

>
> On Sun, Jul 8, 2012 at 8:59 PM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>
>       =A0 (most of this is sort of self-evident but it's not documented a=
s
>       well as it could be so i just want to make sure i have it exactly
>       right.)
>
>       =A0 snippets of some layer.conf files:
>
>       oe-core:
>
>       BBPATH .=3D ":${LAYERDIR}"
>       BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb"
>
>       meta-hob:
>
>       BBPATH :=3D "${BBPATH}:${LAYERDIR}"
>       BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
>
>       meta-yocto:
>
>       BBPATH :=3D "${LAYERDIR}:${BBPATH}"
>       BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
>       =A0 =A0 =A0 =A0 =A0 =A0 ${LAYERDIR}/recipes-*/*/*.bbappend"
>
>       =A0 note how meta-hob *appends* itself to BBPATH, while meta-yocto
>       *prepends* itself. =A0is there no possibility that this will cause =
some
>       confusion based on how BBPATH is used to resolve the location of cl=
ass
>       or conf files? =A0i realize you should try to avoid that sort of
>       conflict but it still seems possible that someone might choose the
>       names of some files badly and the unpredictable ordering in BBPATH
>       will cause grief, no?
>
>
> I don't think this can cause any problems.

  are you sure?

> It's all about the order the files are searched. As long as you have
> proper priority set nothing can go wrong.

  but what if two or more layers have the same priority?  then what?
it may be that there's no issue here, i'm just pointing out the
possibility that, given the inconsistent way layers add themelves to
BBPATH (either prepending or appending) and the order one lists the
layers in bblayers.conf, is there absolutely no chance that someone
could experience unexpected behaviour given an unusual combination of
circumstances?

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

--8323329-801856245-1341866062=:24097--

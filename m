Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SDowW-0007HW-18
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 05:25:32 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SDonj-0004Aq-VV for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 23:16:28 -0400
Date: Fri, 30 Mar 2012 23:16:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZANmgkHrEitjH8mHjUx06kr8XY=+jwCoL0KMritHEbcYuew@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1203302315490.25150@oneiric>
References: <alpine.DEB.2.02.1203302010020.17135@oneiric>
	<CABcZANmgkHrEitjH8mHjUx06kr8XY=+jwCoL0KMritHEbcYuew@mail.gmail.com>
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
Subject: Re: why does "bitbake -e" check the license of a *non*-included recipe file?
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
X-List-Received-Date: Sat, 31 Mar 2012 03:25:32 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-727820163-1333163779=:25150"

--8323329-727820163-1333163779=:25150
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 30 Mar 2012, Chris Larson wrote:

> On Fri, Mar 30, 2012 at 5:17 PM, Robert P. J. Day <rpjday@crashcourse.ca>=
 wrote:
> > $ bitbake -e core-image-core
> > Loading cache: 100% |##################################################=
####################| ETA: =C2=A000:00:00
> > Loaded 1106 entries from dependency cache.
> > ERROR: This recipe does not have the LICENSE field set (rday) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| ETA: =C2=A0--:--:--
> > ERROR: Unable to parse /home/rpjday/oe/oe-core/meta/recipes-core/images=
/rday.bb: Exited with "1"
> > ERROR: Command execution failed: Exited with 1
> >
> > Summary: There were 3 ERROR messages shown, returning a non-zero exit c=
ode.
> > $
> >
> > =C2=A0the recipe file "rday.bb" is not being included in any of the oth=
er
> > images, so why should its lack of a license file cause that kind of
> > problem?
>
> It's a parse time failure, as opposed to during execution of an actual
> task, and all recipes have to be parsed to operate against any recipe.

  i suspected that was it, it just threw me the first time it
happened.

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

--8323329-727820163-1333163779=:25150--

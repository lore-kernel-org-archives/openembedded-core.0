Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SAhvV-0000ZF-Lz
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 14:19:37 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SAhmu-0001JY-1X for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 09:10:44 -0400
Date: Thu, 22 Mar 2012 09:10:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CADkTA4O7=3AxSoTJLp-fTRXiv=T0ybrM3N6m0Ti8BkHsy7Y4Ww@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1203220909490.29951@oneiric>
References: <alpine.DEB.2.02.1203220701270.14555@oneiric>
	<CADkTA4O7=3AxSoTJLp-fTRXiv=T0ybrM3N6m0Ti8BkHsy7Y4Ww@mail.gmail.com>
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
Subject: Re: AUTOREV vs AUTOINC?
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
X-List-Received-Date: Thu, 22 Mar 2012 13:19:38 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1612190178-1332421843=:29951"

--8323329-1612190178-1332421843=:29951
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 22 Mar 2012, Bruce Ashfield wrote:

> On Thu, Mar 22, 2012 at 7:05 AM, Robert P. J. Day <rpjday@crashcourse.ca>=
 wrote:
> >
> > =A0perusing the file meta/classes/kernel-yocto.bbclass and saw the
> > following snippet around line 287:
> >
> > =A0 =A0 =A0 =A0# nothing to do if SRCREV is AUTOREV
> > =A0 =A0 =A0 =A0if [ "${SRCREV_machine}" =3D "AUTOINC" ]; then
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# restore the branch for builds
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0git checkout -f ${KBRANCH}
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return
> > =A0 =A0 =A0 =A0fi
>
> You can completely ignore this, I've tossed it all out in pending
> updates. But if you set AUTOREV and dump the SRCREV .. you'll see
> that it actually is AUTOINC.

  cheerfully ignored, except that the poky ref manual should be
updated to reflect this.

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

--8323329-1612190178-1332421843=:29951--

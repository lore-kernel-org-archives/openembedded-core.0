Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SEp9F-0003v4-OC
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 23:50:50 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SEp0Q-0002pM-Pu for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 17:41:42 -0400
Date: Mon, 2 Apr 2012 17:41:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZANkiGGT2see21u3cTMa8QiAFaskRchhLEMAAo==zrfS4Xg@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1204021740540.6667@oneiric>
References: <alpine.DEB.2.02.1204021730530.6159@oneiric>
	<CABcZANkiGGT2see21u3cTMa8QiAFaskRchhLEMAAo==zrfS4Xg@mail.gmail.com>
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
Subject: Re: should all class files be inherited by *something*?
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
X-List-Received-Date: Mon, 02 Apr 2012 21:50:50 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1298240268-1333402892=:6667"

--8323329-1298240268-1333402892=:6667
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 2 Apr 2012, Chris Larson wrote:

> On Mon, Apr 2, 2012 at 2:34 PM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
> > =C2=A0poking around the meta/classes/*.bbclass files and one looked a b=
it
> > odd -- scons.bbclass. =C2=A0i was under the impression that class files
> > were supposed represent a *general* kind of functionality so i was
> > curious as to what this file represented.
> >
> > =C2=A0more to the point, it doesn't look like anything in oe-core inher=
its
> > that class. =C2=A0so what exactly is its purpose?
> >
> > =C2=A0and following up on that, another example of that kind of file is
> > oelint.bbclass -- again, i don't see anything in oe-core that inherits
> > it.
>
> There will *always* be classes that aren't inherited by anything. Look
> at devshell. Some classes will always be opt-in only.

  yes, i twigged to that seconds after i pressed the ENTER key.  it
*always* happens that way.  grrrrrrr.

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

--8323329-1298240268-1333402892=:6667--

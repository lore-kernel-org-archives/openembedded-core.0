Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SDLUq-0007sL-O0
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 21:59:01 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SDLM6-0005lA-8O for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 15:49:58 -0400
Date: Thu, 29 Mar 2012 15:49:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZANk4VfaVaSD=rLc8RjdcyaCUnN8oK3=oDXpBxZk_pSGfbA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1203291547020.6679@oneiric>
References: <alpine.DEB.2.02.1203291505580.4586@oneiric>
	<20120329212924.5d01d792@eb-e6520>
	<alpine.DEB.2.02.1203291533390.5968@oneiric>
	<CABcZANk4VfaVaSD=rLc8RjdcyaCUnN8oK3=oDXpBxZk_pSGfbA@mail.gmail.com>
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
Subject: Re: argh ... "_append" versus "+=" and IMAGE_INSTALL confusion
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
X-List-Received-Date: Thu, 29 Mar 2012 19:59:01 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1375061681-1333050591=:6679"

--8323329-1375061681-1333050591=:6679
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 29 Mar 2012, Chris Larson wrote:

> On Thu, Mar 29, 2012 at 12:35 PM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> > On Thu, 29 Mar 2012, Eric B=C3=A9nard wrote:
> >
> >> Le Thu, 29 Mar 2012 15:23:20 -0400 (EDT),
> >> "Robert P. J. Day" <rpjday@crashcourse.ca> a =C3=A9crit :
> >> > =C2=A0 so what is best practise here?
> >> >
> >> for this one you have an answer on OE's wiki :
> >> http://www.openembedded.org/wiki/I_want_an_image_with_package_XYZ_inst=
alled
> >
> > =C2=A0despite the fact that the current reference manual *explicitly*
> > says this?
> >
> > "Using IMAGE_INSTALL with the +=3D operator from the /conf/local.conf
> > file or from within an image recipe is not recommended as it can cause
> > ordering issues."
> >
> > =C2=A0i actually did my research before i asked that question, you know=
=2E
>
> The two aren't conflicting. The wiki page talks about creating an
> image or using bbappend, where +=3D works fine. You have to use _append
> in local.conf because it's postponed, occurs at the end of the parse.
> If you use +=3D there, the recipe will then set IMAGE_INSTALL, blowing
> away the global value you +=3D'd to.

  i'm confused ... the current ref manual specifically (as you can
read above) discourages the use of +=3D "from within an image recipe",
which is *precisely* what the wiki page is advocating.  so, yes, it
*is* conflicting advice.

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

--8323329-1375061681-1333050591=:6679--

Received: from [8.20.30.154] (helo=mx1.devonhealth.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <igeiser@devonit.com>) id 1U2AYx-00059O-KE
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 02:09:42 +0100
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.213.0;
	Sun, 3 Feb 2013 19:54:02 -0500
Received: from [10.0.2.240] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Sun, 03 Feb 2013 19:53:43 -0500
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from SOUTHSIDE.devonintlgroup.com ([10.0.2.2]) by
	kingston.devonintlgroup.com ([10.0.2.240]) with mapi; Sun, 3 Feb 2013
	19:53:43 -0500
From: Ian Geiser <igeiser@devonit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sun, 3 Feb 2013 19:53:42 -0500
Thread-Topic: [OE-core] OpenGL as a DISTRO_FEATURE
Thread-Index: Ac4CVmnkc2V5wIQ4RcKc7RYm8B5IJwAGyq6Q
Message-ID: <B57A220D1EE1644685BA9AD5C790D20526BE045F3D@SOUTHSIDE.devonintlgroup.com>
References: <B57A220D1EE1644685BA9AD5C790D20526BE045F3A@SOUTHSIDE.devonintlgroup.com>
	<50E181AF64EF4AF9835BF9FD769D9B93@intel.com>
	<B57A220D1EE1644685BA9AD5C790D20526BE045F3B@SOUTHSIDE.devonintlgroup.com>
	<510ED7B6.1010201@linaro.org>
In-Reply-To: <510ED7B6.1010201@linaro.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-WSS-ID: 7D11D91D4CW1016840-01-01
Subject: Re: OpenGL as a DISTRO_FEATURE
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
X-List-Received-Date: Mon, 04 Feb 2013 01:09:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Marcin Juszkiewicz
> Sent: Sunday, February 03, 2013 4:34 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] OpenGL as a DISTRO_FEATURE
>=20
> W dniu 03.02.2013 20:45, Ian Geiser pisze:
>=20
> > The case I have is 3 platforms: 1) Atom N450 2) WM 8950 3) VIA VX900
> >
> > The Atom has the normal mesa-dri drivers and can use the OpenGL
> > implementation from that.  The WM has only OpenGLES drivers and no
> > OpenGL implementation.  So in that case I want to use only GLES
> > support in the various packages that conditionally support it (in my
> > case Qt4).  The last platform the VIA has its own OpenGL
> > implementation that can completely replace mesa for packages that
> > support OpenGL. In the case of my distro I support Qt4 but it can use
> > OpenGLES or OpenGL.  The problem comes in when I start setting
> > preferred providers in the machine conf files.  In the case of my WM,
> > I have only gles and since the distro supports opengl, it needs a
> > virtual/libgl and finds it with mesa.  Now I can remove opengl from
> > my distro, but the Atom and VIA support opengl, and will not have it
> > available to Qt because it turns off.
>=20
> As they are different architectures you can try this:
>=20
> DISTRO_FEATURES_wm8950 =3D "here copy your default DISTRO_FEATURES but
> skip opengl"
>=20
> Replace wm8950 with MACHINE name. Ugly solution but should work.
Then I have 3 DISTRO_FEATURES lines in my distro.conf, or I have DISTRO_FEA=
TURES spread out inside of my machine.conf files.  Ugly solutions ship, but=
 elegant solutions get maintained ;)





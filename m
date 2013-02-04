Received: from [8.20.30.154] (helo=mx1.devonhealth.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <igeiser@devonit.com>) id 1U2AYs-00059G-Tl
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 02:09:32 +0100
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.213.0;
	Sun, 3 Feb 2013 19:53:57 -0500
Received: from [10.0.2.7] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Sun, 03 Feb 2013 19:53:42 -0500
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from SOUTHSIDE.devonintlgroup.com ([10.0.2.2]) by
	boddingtons.devonintlgroup.com ([10.0.2.7]) with mapi; Sun, 3 Feb 2013
	19:53:41 -0500
From: Ian Geiser <igeiser@devonit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sun, 3 Feb 2013 19:53:40 -0500
Thread-Topic: [OE-core] OpenGL as a DISTRO_FEATURE
Thread-Index: Ac4CZ0QO57HuBWnYQS+/zbQ9CoIEjwACYU9Q
Message-ID: <B57A220D1EE1644685BA9AD5C790D20526BE045F3C@SOUTHSIDE.devonintlgroup.com>
References: <B57A220D1EE1644685BA9AD5C790D20526BE045F3A@SOUTHSIDE.devonintlgroup.com>
	<50E181AF64EF4AF9835BF9FD769D9B93@intel.com>
	<B57A220D1EE1644685BA9AD5C790D20526BE045F3B@SOUTHSIDE.devonintlgroup.com>
	<510ED7B6.1010201@linaro.org>
	<F600AD7DF50F4C5793CA585286CEE7B4@intel.com>
In-Reply-To: <F600AD7DF50F4C5793CA585286CEE7B4@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-WSS-ID: 7D11D91C4CW1016839-01-01
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
X-List-Received-Date: Mon, 04 Feb 2013 01:09:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Ross Burton
> Sent: Sunday, February 03, 2013 6:35 PM
> To: Marcin Juszkiewicz
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] OpenGL as a DISTRO_FEATURE
>=20
> On Sunday, 3 February 2013 at 21:33, Marcin Juszkiewicz wrote:
> > As they are different architectures you can try this:
> >
> > DISTRO_FEATURES_wm8950 =3D "here copy your default DISTRO_FEATURES but
> > skip opengl"
> >
> > Replace wm8950 with MACHINE name. Ugly solution but should work.
> That means that Qt won't be built with GLES support.
>=20
> The best approach is to probe the hardware/libraries at runtime and
> adapt - i.e. if only GLES libraries are available use those, but a lot
> of software doesn't support that or simple probing isn't sufficient
> (Intel Pine Trail supports both but GL is best, Cedar Trail supports
> both but GL is terrible).
In my instance I know what hardware I am targeting at build time so I can m=
ake the choice there.  That is why I think MACHINE_FEATURES might be more a=
ppropriate.

That being said a grep through a few layers shows that this might not be a =
low impact change so Marcin's solution while not ideal might be the least a=
mount the churn.





Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZ4NW-0008WN-Jt for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 19:04:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LH162W023689
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:01:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23476-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:01:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LH10D6023683
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:01:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E009D8F.10301@eukrea.com>
References: <1308658461.20015.24.camel@rex>
	<BANLkTimMLo4g7uWsrhAr=hun4wZ6AaDjQg@mail.gmail.com>
	<1308663032.20015.29.camel@rex>  <4E009D8F.10301@eukrea.com>
Date: Tue, 21 Jun 2011 18:00:46 +0100
Message-ID: <1308675646.20015.35.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	p5LH162W023689
Subject: Re: Multilib Development Update
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
X-List-Received-Date: Tue, 21 Jun 2011 17:04:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-06-21 at 15:33 +0200, Eric B=C3=A9nard wrote:
> Hi,
>=20
> On 21/06/2011 15:30, Richard Purdie wrote:
> > On Tue, 2011-06-21 at 15:02 +0200, Frans Meulenbroeks wrote:
> >> As I already asked before: what is the benefit having this in embedd=
ed
> >> systems?
> >>
> >> If I am doing an embedded system I know the target hardware, and the=
re
> >> is no need to have e.g. both 32 and 64 bit libs.
> >
> > This has been mentioned before but there are embedded use cases where
> > the requirement is to have a low overhead OS using 32 bit libs and
> > binaries to save memory but the main application (like a database
> > server) runs in 64 bit mode with 64 bit libraries so it can take
> > advantage of system memory, extra instructions or so forth. This appl=
ies
> > to mips and powerpc as well as x86.
> >
> > The implementation is fairly self contained so if you don't want
> > multilib, you shouldn't even be aware its there...
> >
> will that feature allow to build a sdk running on both x86 and amd64 ho=
sts=20
> whatever is the build host ?

With OE-Core, you could already do this by setting SDKMACHINE and
building one, then setting SDKMACHINE to the other and building it
again.

Looking at the code, I am strongly tempted to replace nativesdk and
crosssdk with the multilib code though as I think it can reuse the same
functionality. That is a step beyond where we're currently at though :)

Cheers,

Richard






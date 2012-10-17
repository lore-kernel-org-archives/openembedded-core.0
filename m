Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TOWb5-0005gU-I9 for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 18:35:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HGMaf9007498;
	Wed, 17 Oct 2012 17:22:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06675-05; Wed, 17 Oct 2012 17:22:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9HGMSAu007492
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 17 Oct 2012 17:22:30 +0100
Message-ID: <1350490956.2185.121.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <Kai.Kang@windriver.com>
Date: Wed, 17 Oct 2012 17:22:36 +0100
In-Reply-To: <507CBF6B.6070202@windriver.com>
References: <cover.1350300631.git.kai.kang@windriver.com>
	<decff650be8ca9f3938423a38e869fb1d13baaec.1350300631.git.kai.kang@windriver.com>
	<1350334543.2185.19.camel@ted> <507CBF6B.6070202@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q9HGMaf9007498
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] nativesdk-packagegroup-sdk-host: add perl modules
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
X-List-Received-Date: Wed, 17 Oct 2012 16:35:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-16 at 09:59 +0800, Kang Kai wrote:
> On 2012=E5=B9=B410=E6=9C=8816=E6=97=A5 04:55, Richard Purdie wrote:
> > On Mon, 2012-10-15 at 19:32 +0800, Kang Kai wrote:
> >> nativesdk-perl is required to cross compile iptables when use
> >> meta-toolchain-gmae, and perl modules are needed too.
> >> Package nativesdk-perl-modules depends on nativesdk-perl, so just ad=
d
> >> nativesdk-perl-modules only.
> >>
> >> [Yocto 3100]
> >>
> >> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> >> ---
> >>   .../nativesdk-packagegroup-sdk-host.bb             |    3 ++-
> >>   1 files changed, 2 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-=
sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-=
host.bb
> >> index 63fea28..383820a 100644
> >> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-hos=
t.bb
> >> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-hos=
t.bb
> >> @@ -3,7 +3,7 @@
> >>   #
> >>
> >>   SUMMARY =3D "Host packages for the standalone SDK or external tool=
chain"
> >> -PR =3D "r11"
> >> +PR =3D "r12"
> >>   LICENSE =3D "MIT"
> >>
> >>   inherit nativesdk packagegroup
> >> @@ -20,6 +20,7 @@ RDEPENDS_${PN} =3D "\
> >>       nativesdk-libtool \
> >>       nativesdk-autoconf \
> >>       nativesdk-automake \
> >> +    nativesdk-perl-modules \
> >>       "
> > This doesn't feel right. Which tool has the perl dependency and why
> > doesn't that tool depend on (xxx-)perl-modules?
> perl is RDEPENDed by eglibc-mtrace, and nativesdk-eglibc-mtrace is not=20
> installed into toolchain.
>=20
> When use meta-toolchain-gmae to cross iptable, run 'autoreconf' require=
s=20
> nativesdk-perl. But only install nativesdk-perl
> can't make perl work properly, so install nativesdk-perl-modules as=20
> well. And package nativesdk-perl-modules requires nativesdk-perl,
> so I just write "nativesdk-perl-modules" here.

Let me rephrase the question. Why doesn't nativesdk-automake depend on
the correct set of perl modules for example?

We need to figure out which pieces have perl dependencies and then add
the correct module dependencies to those places.

Cheers,

Richard







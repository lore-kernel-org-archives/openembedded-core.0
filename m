Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuPuB-0003Q0-NB for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 17:23:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QFBgjs022413
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 16:11:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21192-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 16:11:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QFBWJ5022407
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 16:11:33 +0100
Message-ID: <1343315490.7600.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 16:11:30 +0100
In-Reply-To: <CALbNGRSutt-hFJHahbXaCrK0=mKXuRydkw8Z7Ju5tSNUokJHPg@mail.gmail.com>
References: <CALbNGRS3ZaawmC1+pt_ja2+90qyan1XC3V-9s8gsKyr-PsHWwQ@mail.gmail.com>
	<CALbNGRSztH9aBbW7BeLm0YwdGZ-mEvbVMUJJNUa5bLweCXCbmg@mail.gmail.com>
	<1343308890.29991.30.camel@ted>
	<CALbNGRSSkQKgys-2u=dJ4TmYmnwyV6XTsTQ6HFDSACX5hzWYYw@mail.gmail.com>
	<20120726144748.GD3621@jama.jama.net>
	<CALbNGRSutt-hFJHahbXaCrK0=mKXuRydkw8Z7Ju5tSNUokJHPg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q6QFBgjs022413
Subject: Re: autoconf broken? (was [oe] gtk+-native configure fails)
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
X-List-Received-Date: Thu, 26 Jul 2012 15:23:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-26 at 17:02 +0200, Andreas M=C3=BCller wrote:
> bitbake -e atk-native | grep ^DEPENDS
>=20
> says
>=20
> DEPENDS_GETTEXT=3D"gettext-native"
> DEPENDS=3D"gtk-doc-stub-native"
>=20
> Is it possible that
>=20
> DEPENDS_virtclass-native_append =3D " gtk-doc-stub-native"
>=20
> in gtk-doc.bbclass breaks dependency-chain?

Its entirely possible unfortunately :(

I'm not entirely sure how to fix this right now but I'm thinking about
it. I'm hoping droping that line in the class might be enough.

Cheers,

Richard




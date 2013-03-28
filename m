Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ULHEM-0003Aq-DR for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 19:07:19 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2SI0Dle030225; Thu, 28 Mar 2013 18:00:14 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pC9oDsd6Hphl; Thu, 28 Mar 2013 18:00:13 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2SI07c4030075
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 28 Mar 2013 18:00:11 GMT
Message-ID: <1364492999.28471.166.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2013 17:49:59 +0000
In-Reply-To: <658D26C6-1631-456F-BD30-320466130D6C@gmail.com>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
	<51540716.40400@linaro.org> <515465CE.6080803@linaro.org>
	<658D26C6-1631-456F-BD30-320466130D6C@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r2SI0Dle030225
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Thu, 28 Mar 2013 18:07:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-03-28 at 09:07 -0700, Khem Raj wrote:
> On Mar 28, 2013, at 8:46 AM, Marcin Juszkiewicz <marcin.juszkiewicz@lin=
aro.org> wrote:
>=20
> > W dniu 28.03.2013 10:02, Marcin Juszkiewicz pisze:
> >> W dniu 28.03.2013 06:51, Khem Raj pisze:
> >>> I have added gcc 4.8 recipes and the branch is here=20
> >>>=20
> >>> git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8
> >>=20
> >> =C3=9Cbercool! Will do tests with aarch64.
> >=20
> > After some hacking (see attachment) I got it built and booted
> > core-image-minimal.
>=20
>=20
> Nice
>=20
> >=20
> > Problem was with paths - lib contra lib64. Will look at it more next =
week.
> >=20
> > <aarch64.diff>
>=20
>=20
> Well I guess aarch64 is kind of_special_ here. look into multilib we ha=
ve done
> for other architectures. e.g. for x86_64 if you inherit multilib class =
it uses 'lib64'
> otherwise it uses 'lib' thats for historic reasons but for arm you coul=
d always use lib64
> why its not so ?

The build system should use whichever is configured as $libdir for any
given target.

Cheers,

Richard






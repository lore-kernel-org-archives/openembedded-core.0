Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THXuv-0005gW-S0 for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 12:35:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SAMccA008983;
	Fri, 28 Sep 2012 11:22:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08702-03; Fri, 28 Sep 2012 11:22:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SAMSSR008976
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 11:22:29 +0100
Message-ID: <1348827750.15753.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Fri, 28 Sep 2012 11:22:30 +0100
In-Reply-To: <CALbNGRTugOvs5r_VEeMLMraimF46Mu-Q7eLP2zfKuHSonTZ+qQ@mail.gmail.com>
References: <20120831003845.485CE10335@opal>
	<CALbNGRTugOvs5r_VEeMLMraimF46Mu-Q7eLP2zfKuHSonTZ+qQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q8SAMccA008983
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : sstate.bbclass: Detect overwriting files in sstate controlled directories
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
X-List-Received-Date: Fri, 28 Sep 2012 10:35:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-09-28 at 08:03 +0200, Andreas M=C3=BCller wrote:
> This previous addressed the wrong list - so again:
>=20
> I think it started with this one: I often do play around with
> different kernel versions/sources to bisect when a bug was born. Doing
> so I now get wallpapers with
>=20
> WARNING: The recipe is trying to install files into a shared area when
> those files already exist. Those files are:
>    /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/Mod=
ule.symvers
>    /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/CRE=
DITS
>    /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/ker=
nel-abiversion
>    /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/Mak=
efile
>    /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/ker=
nel-image-name
>    /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/uIm=
age
>    /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/REA=
DME
>    /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/COP=
YING
>    /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/REP=
ORTING-BUGS
>    /home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/src/kernel/Sys=
tem.map-3.5.0
> ...
> (log.do_populate_sysroot is 2.8 MB)
>=20
> Would it cause huge effort to add a variable which is in scope of
> recipe avoiding this warning because it scrolls out all other
> interesting messages?

There was some misconfiguration of the whitelist, this should be a lot
less noisy now.

Cheers,

Richard




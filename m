Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTz8H-0002uz-59 for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 18:00:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPGrc7L006917
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 16:53:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06345-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 16:53:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPGrUOt006911
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 16:53:31 GMT
Message-ID: <1322240018.24330.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 16:53:38 +0000
In-Reply-To: <27A3051A-BC1D-4937-B936-42760021F584@dominion.thruhere.net>
References: <27A3051A-BC1D-4937-B936-42760021F584@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pAPGrc7L006917
Subject: Re: opkg-make-index cache failing
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
X-List-Received-Date: Fri, 25 Nov 2011 17:00:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-11-25 at 16:38 +0100, Koen Kooi wrote:
> In OE-classic the opkg-make-index cache was working pretty well,
> do_rootfs only spent a few seconds doing opkg-make-index on
> incremental builds. In the OE-core world the situation is different,
> opkg-make-index will reindex every package on each do_rootfs run, so
> after a while building images starts taking *really* long, on my
> systemd (work/ on ssd, deploy on rotating media) it now takes
> =C2=B17minutes just do refresh the opkg indices.
>=20
> Since I can't blame sstate for this I suspect that pseudo gets in the
> way of the naive caching logic. Is there a simple way to turn off
> pseudo when running opkg-make-index?

You could try:

PSEUDO_DISABLED=3D1 opkg-make-index

or even

PSEUDO_UNLOAD=3D1 opkg-make-index

although the latter is a sledge hammer to crack a nut approach...

Cheers,

Richard




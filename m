Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qbf6N-0000ni-Cg
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 22:41:43 +0200
Received: by wyg30 with SMTP id 30so485629wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 13:38:01 -0700 (PDT)
Received: by 10.227.174.201 with SMTP id u9mr6804291wbz.53.1309293137238;
	Tue, 28 Jun 2011 13:32:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm414840wbb.48.2011.06.28.13.32.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 13:32:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309277475.20015.320.camel@rex>
Date: Tue, 28 Jun 2011 22:32:10 +0200
Message-Id: <AE12D97B-A9AF-4516-93D2-7A5655B46844@dominion.thruhere.net>
References: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>
	<1309277475.20015.320.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc-locale: fix localedef packaging
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
X-List-Received-Date: Tue, 28 Jun 2011 20:41:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 18:11 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-06-28 at 17:30 +0200, Koen Kooi wrote:
>> the ${PN} still needs some checking, since it will now inheriting the =
default FILES_${PN}
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> I merged a different version of this which drops PN-locale and fixes
> glibc too.

=46rom =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=3D=
yocto&id=3D0d0e14cda2ddd881d09798b0e6edd8086aa9b6d9

+libc6 -> libc6_dev;

So libc6 now depends on libc6-dev :(





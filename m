Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RBQZf-0004OJ-37
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 14:27:47 +0200
Received: by ywf7 with SMTP id 7so1489033ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 05:22:12 -0700 (PDT)
Received: by 10.236.155.1 with SMTP id i1mr13422551yhk.8.1317817331896;
	Wed, 05 Oct 2011 05:22:11 -0700 (PDT)
Received: from [10.1.10.77] (rrcs-97-79-162-178.sw.biz.rr.com. [97.79.162.178])
	by mx.google.com with ESMTPS id x65sm2069074yhg.18.2011.10.05.05.22.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Oct 2011 05:22:11 -0700 (PDT)
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted>
	<20110930164658.GB7364@jama.jama.net>
	<1317402578.12332.218.camel@ted>
	<CAP9ODKqb8RGLi_5-_+uegLmtZ7Wo-70oDJcF_R6yaSJ2q9mGwg@mail.gmail.com>
	<1317765609.14671.118.camel@ted>
	<CAP9ODKrfDeDMomqeJCeyJBWqD_KqdMO=WBvjVY5d_j+btn3DfQ@mail.gmail.com>
In-Reply-To: <CAP9ODKrfDeDMomqeJCeyJBWqD_KqdMO=WBvjVY5d_j+btn3DfQ@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <11F8FF03-4C38-4D33-9250-66B5C180698C@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 5 Oct 2011 07:22:06 -0500
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Wed, 05 Oct 2011 12:27:47 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 5 okt. 2011 om 07:10 heeft Otavio Salvador <otavio@ossystems.com.br> het v=
olgende geschreven:

> On Tue, Oct 4, 2011 at 19:00, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Really? hal doesn't really replace udev though, we can just use udev
>> directly in place of it for many things now?
>=20
> Yes, many moved from hal to udev.
>=20
>> Specifically which applications are people using with dependencies on
>> hal? As has been pointed out we can fix the xserver and that appears to
>> be the only thing remaining in OE-Core?
>=20
> OE-Core can be easily hal-less but I just ask for hal to not be
> removed from meta data as I and probably others hasn't finish the move
> to udev yet.

Put it in your own layer if you need it. No point in keeping obsolete stuff i=
n oe-core.


>=20
> --=20
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



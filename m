Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1Ud1gA-0004MR-7j
	for Openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 19:09:25 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4GGp5nl004317
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 May 2013 09:51:05 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.88]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0342.003;
	Thu, 16 May 2013 09:51:04 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Yi Qingliang <niqingliang2003@gmail.com>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] qt keyboard problem
Thread-Index: AQHOUTU/QwV9GD/l4UmrvhQctCU0cpkIB5SQ
Date: Thu, 16 May 2013 16:51:04 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8436FC944F@ALA-MBA.corp.ad.wrs.com>
References: <3388285.jCfN1Lj2u9@yiqingliang-pc>
In-Reply-To: <3388285.jCfN1Lj2u9@yiqingliang-pc>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Subject: Re: qt keyboard problem
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
X-List-Received-Date: Thu, 16 May 2013 17:09:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Yi Qingliang
> Sent: Tuesday, May 14, 2013 11:19 PM
> To: openembedded-core@lists.openembedded.org oe-core layer
> Subject: [OE-core] qt keyboard problem
>=20
> Hello, all.
>=20
> I'm running qt application on yocto's qt image. cpu is s3c2442, like mini=
2440.
>=20
> the problem is:
>=20
> key event issued by pressing gpio-key eat by 'getty' (from busybox),
> my application can't receive input event,
> if I remove respawn 'getty' for tty1 in /etc/inittab, everything ok.

This could be the same thing I have seen in a slightly different context.
If so, you can keep the getty's attached to VT's.  Just move the line in
inittab that starts runlevel 5 to the very end of inittab.  As long as the
getty's start first, you'll be okay.

Joe


>=20
> any idea?
>=20
>=20
> --
> Nanjing Jilong
> Yi Qingliang
> niqingliang2003@gmail.com
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



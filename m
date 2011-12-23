Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rdvb6-0002Tg-JR
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 04:15:04 +0100
Received: from mail168-tx2-R.bigfish.com (10.9.14.244) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Fri, 23 Dec 2011 02:52:33 +0000
Received: from mail168-tx2 (localhost [127.0.0.1])	by
	mail168-tx2-R.bigfish.com (Postfix) with ESMTP id 9A9053C0435;
	Fri, 23 Dec 2011 02:52:48 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371I542M1432Nzz1202hzzz2dh2a8h668h839h8e2h8e3h944hbe9n61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail168-tx2 (localhost.localdomain [127.0.0.1]) by mail168-tx2
	(MessageSwitch) id 1324608768200681_19215;
	Fri, 23 Dec 2011 02:52:48 +0000 (UTC)
Received: from TX2EHSMHS040.bigfish.com (unknown [10.9.14.239])	by
	mail168-tx2.bigfish.com (Postfix) with ESMTP id 2BC74580050;
	Fri, 23 Dec 2011 02:52:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS040.bigfish.com
	(10.9.99.140) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 23 Dec 2011 02:52:33 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Thu, 22 Dec 2011 20:52:44 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH oe-core] linux-dtb: add dtb into deploy cache
	package
Thread-Index: AQHMwJNYOzd8GQEnCkqoDd+rctmGmZXozFWA///tUXA=
Date: Fri, 23 Dec 2011 02:52:44 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010BBD7D@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324549428-22664-1-git-send-email-b19537@freescale.com>
	<4EF3A75F.1070705@linux.intel.com>
In-Reply-To: <4EF3A75F.1070705@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH oe-core] linux-dtb: add dtb into deploy cache package
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
X-List-Received-Date: Fri, 23 Dec 2011 03:15:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Saul,=20

> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Friday, December 23, 2011 5:56 AM
>=20
> > +do_deploy_append() {
> > +    install -d ${DEPLOYDIR}
> > +    install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb
> ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
> > +    cd ${DEPLOYDIR}
> > +    ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb
> > +${KERNEL_IMAGE_SYMLINK_NAME}.dtb }
> What machines did you test this on?  Is it possible that some kernels do =
not
> generate .dtb files?
[Luo Zhenhua-B19537] I verified on Freescale powerpc platforms, this will c=
ause error on targets which don't need dtb. I will post a new patch to fix =
the issue. =20


Best Regards,

Zhenhua






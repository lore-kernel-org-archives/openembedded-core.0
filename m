Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SyqQq-0000La-PV
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 22:31:13 +0200
Received: from mail216-ch1-R.bigfish.com (10.43.68.242) by
	CH1EHSOBE008.bigfish.com (10.43.70.58) with Microsoft SMTP Server id
	14.1.225.23; Tue, 7 Aug 2012 20:19:26 +0000
Received: from mail216-ch1 (localhost [127.0.0.1])	by
	mail216-ch1-R.bigfish.com (Postfix) with ESMTP id 0B97C2602B5	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2012 20:19:26 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail216-ch1 (localhost.localdomain [127.0.0.1]) by mail216-ch1
	(MessageSwitch) id 1344370764519066_7082;
	Tue,  7 Aug 2012 20:19:24 +0000 (UTC)
Received: from CH1EHSMHS017.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.237])	by mail216-ch1.bigfish.com (Postfix) with ESMTP id
	7B44FA0048 for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2012 20:19:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS017.bigfish.com
	(10.43.70.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 7 Aug 2012 20:19:21 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0298.005;
	Tue, 7 Aug 2012 15:19:20 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 16/28] kernel.bbclass: use ${base_libdir}
	and ${sysconfdir} instead of /lib and /etc
Thread-Index: AQHNdNnsrwASrNKRYEa3yQvvIrYD2w==
Date: Tue, 7 Aug 2012 20:19:19 +0000
Message-ID: <CAEsOVNexRgFnTa5aNpRgz=qhw4jJa32csXpvCSEedT+TurbjSg@mail.gmail.com>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
	<1344196136-7643-17-git-send-email-javier@dowhile0.org>
	<501FED7B.6050309@linux.intel.com>
	<CAMKF1sq39z0Tq2u9AuEsTx5USfAgzHtXwXggJyeukynOZu4ubQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq39z0Tq2u9AuEsTx5USfAgzHtXwXggJyeukynOZu4ubQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 16/28] kernel.bbclass: use ${base_libdir} and ${sysconfdir} instead of /lib and /etc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 07 Aug 2012 20:31:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5621C66BD05A3843862A2761ADF28D4F@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 7, 2012 at 3:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Aug 6, 2012 at 9:14 AM, Darren Hart <dvhart@linux.intel.com> wrot=
e:
>> if not, these will fail.
>
> and it does.

This is already reverted.

-M

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=




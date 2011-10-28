Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RJsoH-000484-JB
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 22:13:50 +0200
Received: from mail188-tx2-R.bigfish.com (10.9.14.244) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.22; Fri, 28 Oct 2011 20:07:38 +0000
Received: from mail188-tx2 (localhost.localdomain [127.0.0.1])	by
	mail188-tx2-R.bigfish.com (Postfix) with ESMTP id 34913CC0093	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 20:07:43 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail188-tx2 (localhost.localdomain [127.0.0.1]) by mail188-tx2
	(MessageSwitch) id 131983246381478_21339;
	Fri, 28 Oct 2011 20:07:43 +0000 (UTC)
Received: from TX2EHSMHS010.bigfish.com (unknown [10.9.14.247])	by
	mail188-tx2.bigfish.com (Postfix) with ESMTP id 05B7B42004B	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 20:07:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS010.bigfish.com
	(10.9.99.110) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 28 Oct 2011 20:07:35 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Fri, 28 Oct 2011 15:07:44 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 1/2] Add new strace-graph package to avoid
	making perl a dependecy for all of strace
Thread-Index: AQHMlYchXSoYbJnXKkys1U8GNYACDZWSPJmAgABGjwA=
Date: Fri, 28 Oct 2011 20:07:44 +0000
Message-ID: <CAEsOVNd+p0U59Gpf+mA_cywMhOcnspbhe9xB2JvS2fhF31T1_g@mail.gmail.com>
References: <1319700362.15601.2.camel@ted>
	<1319743874-9891-1-git-send-email-msm@freescale.com>
	<1319792127.22423.1.camel@ted>
	<CAEsOVNdwf8xYTp0K1JftUcMfmuuzMbMKahrP56Q1wx5yf4VPBw@mail.gmail.com>
	<1319817308.22985.448.camel@phil-desktop>
In-Reply-To: <1319817308.22985.448.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 1/2] Add new strace-graph package to avoid making perl a dependecy for all of strace
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
X-List-Received-Date: Fri, 28 Oct 2011 20:13:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E08700FF88D7C34E9951706A97306B76@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2011 at 10:54 AM, Phil Blundell <philb@gnu.org> wrote:
> That logic sounds reasonable, but I think Richard's point was that it's
> more conventional to use "=3D+" rather than an override for prepending.

I sort of forgot that +=3D and =3D+ are different. Shall I resubmit this pa=
tch?

-M=




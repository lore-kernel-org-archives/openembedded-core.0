Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TBTS7-0002lA-Uf
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:36:44 +0200
Received: from mail187-tx2-R.bigfish.com (10.9.14.246) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Tue, 11 Sep 2012 16:24:12 +0000
Received: from mail187-tx2 (localhost [127.0.0.1])	by
	mail187-tx2-R.bigfish.com (Postfix) with ESMTP id 5C0EF320174;
	Tue, 11 Sep 2012 16:24:12 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I936eI1432I1453Izz1202h1d1ahzz17326ah8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail187-tx2 (localhost.localdomain [127.0.0.1]) by mail187-tx2
	(MessageSwitch) id 1347380651187473_8263;
	Tue, 11 Sep 2012 16:24:11 +0000 (UTC)
Received: from TX2EHSMHS010.bigfish.com (unknown [10.9.14.250])	by
	mail187-tx2.bigfish.com (Postfix) with ESMTP id 27A01480046;
	Tue, 11 Sep 2012 16:24:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS010.bigfish.com
	(10.9.99.110) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 11 Sep 2012 16:24:09 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Tue, 11 Sep 2012 11:24:08 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Phil Blundell <philb@gnu.org>
Thread-Topic: [OE-core] [PATCH 11/32] sysvinit-inittab_2.88dsf.bb: Allow
	multiple serial port consoles to be defined
Thread-Index: AQHNkDnedzds9LzwYEuZ320iVlJd9g==
Date: Tue, 11 Sep 2012 16:24:08 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A66F68D@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1344892361.git.scott.a.garman@intel.com>
	<2e7dddfce4a40a56f671116a2001b13c57667c70.1344892361.git.scott.a.garman@intel.com>
	<1347364156.6856.18.camel@phil-desktop>
In-Reply-To: <1347364156.6856.18.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/32] sysvinit-inittab_2.88dsf.bb: Allow multiple serial port consoles to be defined
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 16:36:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <82372E3CBB73744386C430F793111876@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 6:49 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2012-08-13 at 14:14 -0700, Scott Garman wrote:
>> +pkg_postinst_${PN} () {
>> +# run this on the target
>> +if [ "x$D" =3D=3D "x" ]; then
>
> By the way, "=3D=3D" is a bashism; that should just be "=3D" for portabil=
ity.
> Or you can use '-z "$D"' which is also portable.

Ok - will send a v3 shortly.

-M

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=




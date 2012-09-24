Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGHMz-0002X2-7Z
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 00:43:17 +0200
Received: from mail79-db3-R.bigfish.com (10.3.81.252) by
	DB3EHSOBE009.bigfish.com (10.3.84.29) with Microsoft SMTP Server id
	14.1.225.23; Mon, 24 Sep 2012 22:30:28 +0000
Received: from mail79-db3 (localhost [127.0.0.1])	by mail79-db3-R.bigfish.com
	(Postfix) with ESMTP id D3AC012019B;
	Mon, 24 Sep 2012 22:30:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail79-db3 (localhost.localdomain [127.0.0.1]) by mail79-db3
	(MessageSwitch) id 134852582726835_7990; Mon, 24 Sep 2012 22:30:27 +0000
	(UTC)
Received: from DB3EHSMHS002.bigfish.com (unknown [10.3.81.254])	by
	mail79-db3.bigfish.com (Postfix) with ESMTP id 02161300053;
	Mon, 24 Sep 2012 22:30:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS002.bigfish.com
	(10.3.87.102) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 24 Sep 2012 22:30:26 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Mon, 24 Sep 2012 17:30:24 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 4/9] rpm: Use link time check for libssp
Thread-Index: AQHNmpQ3+VNspL2mSUu0Za4XTqV5FpeaUuaA///AOAA=
Date: Mon, 24 Sep 2012 22:30:24 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6A390D@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1339740433.git.raj.khem@gmail.com>
	<1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
	<1f0884d8428c923c1b18670877c85cb3dc09cfda.1339740433.git.raj.khem@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A3103@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAMKF1sroJWErkLfrrS0+zON1Vce64SJyznoTLuoM0NW+iW-QNQ@mail.gmail.com>
In-Reply-To: <CAMKF1sroJWErkLfrrS0+zON1Vce64SJyznoTLuoM0NW+iW-QNQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>, Patches,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] rpm: Use link time check for libssp
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
X-List-Received-Date: Mon, 24 Sep 2012 22:43:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CBEB7203CC370644B260C5247FF6D743@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 4:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Sep 24, 2012 at 1:36 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>
>> Won't this still break on systems without libssp where sstate-cache
>> was built on systems with libssp?
>
> these two systems are not same IMO so native sstate should not be
> shared here it will break more than rpm.

If you build a binary and it depends on libssp it's its going to break
if that changes between builds. Can we just always disable libssp?

-M

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=




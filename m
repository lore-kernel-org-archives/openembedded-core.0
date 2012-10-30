Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TTH9J-0002YZ-Px
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 20:06:54 +0100
Received: from mail43-ch1-R.bigfish.com (10.43.68.243) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.23; Tue, 30 Oct 2012 18:53:16 +0000
Received: from mail43-ch1 (localhost [127.0.0.1])	by mail43-ch1-R.bigfish.com
	(Postfix) with ESMTP id DBD55C0490;
	Tue, 30 Oct 2012 18:53:16 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bhbe9i1155h)
Received: from mail43-ch1 (localhost.localdomain [127.0.0.1]) by mail43-ch1
	(MessageSwitch) id 1351623194905141_26594;
	Tue, 30 Oct 2012 18:53:14 +0000 (UTC)
Received: from CH1EHSMHS018.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.245])	by mail43-ch1.bigfish.com (Postfix) with ESMTP id
	DA7A348007E;	Tue, 30 Oct 2012 18:53:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS018.bigfish.com
	(10.43.70.18) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 30 Oct 2012 18:53:14 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.121]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0318.003; Tue, 30 Oct 2012 18:53:14 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] cryptodev kernel module recipe
Thread-Index: AQHNts/Qc2/Ph/iHv0quNrquEzw2Eg==
Date: Tue, 30 Oct 2012 18:53:13 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A737291@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<508063AF.9030400@linux.intel.com>
In-Reply-To: <508063AF.9030400@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Dutta Yashpal-B05456 <B05456@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cryptodev kernel module recipe
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
X-List-Received-Date: Tue, 30 Oct 2012 19:06:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <774891137431C545BA98DF1855C85F30@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 3:16 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
>> +++ b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
>> @@ -0,0 +1,18 @@
>> +SECTION =3D "devel"
>> +SUMMARY =3D "Linux Cryptodev KERNEL MODULE"
>> +DESCRIPTION =3D "The Cryptodev package contains the kernel /dev/crypto =
module"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263"
>> +
>> +DEPENDS =3D "virtual/kernel"
>
> This DEPENDS in inherited from the module.bbclass, no need to duplicate
>
>> +
>> +inherit module
>> +
>> +SRCREV =3D "1c24a0aa996630518d47826a2e3fea129ea094c7"
>> +
>> +SRC_URI =3D "git://repo.or.cz/cryptodev-linux.git;protocol=3Dgit \
>> +       file://makefile_fixup.patch"
>
> Tabs to indent, spaces to align. Spaces here please.

Yashpal,

Can you address these two comments and submit a v2 of the patch if required=
.

-M=




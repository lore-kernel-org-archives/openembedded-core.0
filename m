Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U0p4Y-00071v-Eb
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 09:00:39 +0100
Received: from mail146-co9-R.bigfish.com (10.236.132.227) by
	CO9EHSOBE035.bigfish.com (10.236.130.98) with Microsoft SMTP Server id
	14.1.225.23; Thu, 31 Jan 2013 07:14:42 +0000
Received: from mail146-co9 (localhost [127.0.0.1])	by
	mail146-co9-R.bigfish.com (Postfix) with ESMTP id 1F61A500191;
	Thu, 31 Jan 2013 07:14:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I1dbaI1432I62a3Izz1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275dh1954cbh8275bhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946hbe9i1155h)
Received: from mail146-co9 (localhost.localdomain [127.0.0.1]) by mail146-co9
	(MessageSwitch) id 1359616480279572_8005;
	Thu, 31 Jan 2013 07:14:40 +0000 (UTC)
Received: from CO9EHSMHS010.bigfish.com (unknown [10.236.132.238])	by
	mail146-co9.bigfish.com (Postfix) with ESMTP id 406245C001D;
	Thu, 31 Jan 2013 07:14:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS010.bigfish.com
	(10.236.130.20) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 31 Jan 2013 07:14:40 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.50]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0318.003; Thu, 31 Jan 2013 07:14:39 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH] linux-dtb: Add extra padding to the blob.
Thread-Index: AQHN/4KhDaui9la2LECEn2yGrMU2Jw==
Date: Thu, 31 Jan 2013 07:14:40 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A866F3E@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1359383057-2560-1-git-send-email-vakul@freescale.com>
	<CAP9ODKokATZBMCOSKDy3-O0LXhJybeA_=ijd57dp-azBYGHg-w@mail.gmail.com>
In-Reply-To: <CAP9ODKokATZBMCOSKDy3-O0LXhJybeA_=ijd57dp-azBYGHg-w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Garg Vakul-B16394 <B16394@freescale.com>, Patches,
	the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb: Add extra padding to the blob.
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
X-List-Received-Date: Thu, 31 Jan 2013 08:00:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B5BBFDAA1164D74889A95D2B1ADDFCBD@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 9:00 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Jan 28, 2013 at 12:24 PM, Vakul Garg <vakul@freescale.com> wrote:
>> U-boot patches portal devices for adding new properties in portal nodes.
>> T4 devices such as T4240 have large number of portals. This requires ext=
ra
>> space in device tree blob. The large number of portals need more padding
>> space to be added.
>>
>> Signed-off-by: Vakul Garg <vakul@freescale.com>
>
> This might be overridable so it could be overrided in the machine and
> do not change the default for everyone.
>
> What do you think?

Agreed. I suggest just making this change:

-KERNEL_DEVICETREE_FLAGS =3D "-R 8 -p 0x3000"
+KERNEL_DEVICETREE_FLAGS ?=3D "-R 8 -p 0x3000"

Then the machines/distros themselves can override this var.

-M

>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=




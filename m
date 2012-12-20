Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1TlgV2-0006Sl-HN
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 14:49:24 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Tlfps-0003ME-CW from Noor_Ahsan@mentor.com ;
	Thu, 20 Dec 2012 05:06:52 -0800
Received: from SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 20 Dec 2012 05:06:52 -0800
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.171]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.01.0289.001; Thu, 20 Dec 2012 13:06:50 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Otavio Salvador <otavio@ossystems.com.br>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] freetype: Update EXTRA_OECONF to use host gcc.
Thread-Index: AQHN3q0qxUaiVE0k/0KAZWCNdymix5ghqEEQ
Date: Thu, 20 Dec 2012 13:06:50 +0000
Message-ID: <365E1805BC95084CBE82381A0B8699949169F33D@EU-MBX-01.mgc.mentorg.com>
References: <1356003444-22171-1-git-send-email-noor_ahsan@mentor.com>
	<CAP9ODKqw5pGY8GqQPVB=tBrVmW7ePCww1uxuTS2WLd94Egk-Gg@mail.gmail.com>
In-Reply-To: <CAP9ODKqw5pGY8GqQPVB=tBrVmW7ePCww1uxuTS2WLd94Egk-Gg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 20 Dec 2012 13:06:52.0245 (UTC)
	FILETIME=[E0E7E050:01CDDEB2]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] freetype: Update EXTRA_OECONF to use host gcc.
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
X-List-Received-Date: Thu, 20 Dec 2012 13:49:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I think the behavior is same on danny.

Noor

-----Original Message-----
From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On Behal=
f Of Otavio Salvador
Sent: Thursday, December 20, 2012 5:25 PM
To: Ahsan, Noor; Burton, Ross
Cc: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH] freetype: Update EXTRA_OECONF to use host gc=
c.

On Thu, Dec 20, 2012 at 9:37 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> * It uses host gcc in its configure script. When IA32 toolchain is=20
> installed it starts using its binaries instead of native gcc. Modified=20
> EXTRA_OECONF so that host gcc is used.
>
> Signed-off-by: Noor Ahsa <noor_ahsan@mentor.com>

Ross, I think this could be evaluated for danny too.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br



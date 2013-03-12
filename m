Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UFOED-0000sO-4n
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 13:22:49 +0100
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2CC6ATr010254;
	Tue, 12 Mar 2013 07:06:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2CC6AHO004658;
	Tue, 12 Mar 2013 07:06:10 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 12 Mar 2013 07:06:09 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [OE-core] [PATCH] soc-family: fix SOC_FAMILY override order
Thread-Index: AQHOHDtbHD9KocCEJ0SY43LMI4w7bJicW6WAgAFOrQCAAuwc4IAAt8CAgACtE8A=
Date: Tue, 12 Mar 2013 12:06:09 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594569C2@DLEE12.ent.ti.com>
References: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
	<CAP9ODKphM_vr-CgBbpm60tQixxepsCcMN60yGwofnhSRhrm-kA@mail.gmail.com>
	<20130308200628.GB15481@denix.org>
	<CAP9ODKreEY23jZvHhQGPa27EJdH85JzH9_QmWMNU+w7aQ9u_+A@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015944E4E0@DLEE12.ent.ti.com>
	<CAP9ODKrnp4VHmvOyq-D=k1oy62VT0R18Xk1KS80kAD+4JfqLJQ@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101594532C3@DLEE12.ent.ti.com>
	<20130311204549.GC31635@denix.org>
In-Reply-To: <20130311204549.GC31635@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] soc-family: fix SOC_FAMILY override order
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
X-List-Received-Date: Tue, 12 Mar 2013 12:22:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[snip]

> > I see.  This could be of some use and I'll play with it.  This
> should not be
> > required though for this patch since right now I want to fix
> the order
> > issue.  Any objection to the patch as is?
>=20
> BTW, this was already pushed:
>=20
> http://cgit.openembedded.org/openembedded-
> core/commit/?id=3D0b836b9d79255a5b2f358fe718c67638f52ecf72

I see.  Thanks.  What are the chances of this getting picked up into Danny =
or is this too risky of a change for the stable branch?

>=20
> --
> Denys



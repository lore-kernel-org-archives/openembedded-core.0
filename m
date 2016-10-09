Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECEA2719C3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Oct 2016 01:17:21 +0000 (UTC)
Received: from SAN-EXCH-DR.corp.ad.wrs.com (san-exch-dr.corp.ad.wrs.com
	[128.224.40.16])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u991HMsq027179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Oct 2016 18:17:22 -0700 (PDT)
Received: from SAN-EXCH-DR.corp.ad.wrs.com ([fe80::a5f3:e53f:df09:5848]) by
	SAN-EXCH-DR.corp.ad.wrs.com ([fe80::a5f3:e53f:df09:5848%16]) with mapi
	id 14.03.0301.000; Sat, 8 Oct 2016 18:17:01 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] linux-libc-headers: if_tunnel: remove
	include of if/ip/in6.h
Thread-Index: AQHSIBO0lSwR8czD50OEJkgWFlBfTaCfVR+A
Date: Sun, 9 Oct 2016 01:17:00 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A2F5C37@SAN-EXCH-DR.corp.ad.wrs.com>
References: <1475513685-18627-1-git-send-email-bruce.ashfield@windriver.com>
	<CAMKF1soRbsU8iV35jxKnRfrcvsobF20p_u14EfRZ5uee_9N+gg@mail.gmail.com>
	<CAMKF1src3Dj1p+E5p+6QEu213dkFSFMOtDKx3hoJFT+hKvHn9Q@mail.gmail.com>
	<CAMKF1soOP+440ZhymX8wFHu-Et=77NhscQqm4M8T2i=wQhmGNg@mail.gmail.com>
	<CADkTA4NT6ynC61Pd_qRhwL8phc3Wzx0kXw=bzaDUAa8Or485ng@mail.gmail.com>
	<3ea3b10b-1072-0d3a-8e6b-be082214e5d1@windriver.com>
In-Reply-To: <3ea3b10b-1072-0d3a-8e6b-be082214e5d1@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.118]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: if_tunnel: remove include of if/ip/in6.h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Oct 2016 01:17:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: MacLeod, Randy
> Sent: Friday, October 07, 2016 4:54 AM
> To: Bruce Ashfield; Khem Raj; Huang, Jie (Jackie)
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] linux-libc-headers: if_tunnel: remove incl=
ude of if/ip/in6.h
>=20
> On 2016-10-03 08:27 PM, Bruce Ashfield wrote:
> >
> > It's something we could drop in the future, but these are mods that hav=
e
> > been done since -rc4, and could very well be undone if they start
> > breaking things like this.
> >
> > The alternative is to try and fix the userspace applications, but I
> > currently don't see a fast way to do that (and I'm now officially on
> > vacation).
> >
>=20
> I've sent a fix to the net-tools list:
>=20
> https://sourceforge.net/p/net-tools/mailman/net-tools-devel/?viewmonth=3D=
201610
>=20
> Jackie will be back at work on Saturday and he'll revert
> Bruce's change, test all qemu builds and boot an image
> to test iptunnel before sending a patch to the list.

I just sent patches for this to the list.

Thanks,
Jackie

>=20
> In oe-core-2.3, we should probably drop net-tools completely or
> at least from packagegroup-core-full-cmdline.bb since iproute2
> replaces it:
>    http://xmodulo.com/linux-tcpip-networking-net-tools-iproute2.html
>=20
> ( and I'm now officially on vacation for a few days. :) )
>=20
>=20
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
> Canada, K2K 2W5


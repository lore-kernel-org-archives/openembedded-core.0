Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 859647C72F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 11:45:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x24BiJG2028943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2019 03:44:30 -0800
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.68]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0439.000;
	Mon, 4 Mar 2019 03:43:57 -0800
From: "Yang, Liezhi" <Liezhi.Yang@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] send-error-report: Add --no-ssl to use
	http protocol
Thread-Index: AQHU0nj/M17cAC/ODkSAbqFIrywwEKX7Wid7
Date: Mon, 4 Mar 2019 11:43:56 +0000
Message-ID: <A6E8CCFC-FCF3-460C-8549-95D92F89DA6E@windriver.com>
References: <cover.1551696484.git.liezhi.yang@windriver.com>
	<e58863c6dfe0bfb23665568e90d34da5e9734d0e.1551696484.git.liezhi.yang@windriver.com>,
	<CAJTo0LbfcTw39fgyXcMCctvxcPyZc-b2xGLYSw-mJr74_JeZpg@mail.gmail.com>
In-Reply-To: <CAJTo0LbfcTw39fgyXcMCctvxcPyZc-b2xGLYSw-mJr74_JeZpg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] send-error-report: Add --no-ssl to use http protocol
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
X-List-Received-Date: Mon, 04 Mar 2019 11:45:04 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Thanks, looks good, I will update it.

// Robert

Sent from mobile phone

> =1B$B:_=1B(B 2019=1B$BG/=1B(B3=1B$B7n=1B(B4=1B$BF|!$=1B(B18:57=1B$B!$=1B(=
BBurton, Ross <ross.burton@intel.com> =1B$B<LF;!'=1B(B
>=20
>> On Mon, 4 Mar 2019 at 10:30, Robert Yang <liezhi.yang@windriver.com> wro=
te:
>> +    arg_parse.add_argument("--no-ssl",
>> +                           help=3D"Use http instead of https protocol",
>> +                           action=3D"store_true")
>=20
> If you do this instead:
>=20
> arg_parse.add_argument("--no-ssl", help=3D"Use http instead of https prot=
ocol",
>      dest=3D"protocol", action=3D"store_const", const=3D"http", default=
=3D"https")
>=20
> Then you can just use args.protocol instead of having to pass around
> the protocol name.
>=20
> Ross


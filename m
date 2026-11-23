Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52711.1795436311693035881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 04:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=YmcH3rkI;
 spf=pass (domain: est.tech, ip: 40.107.162.64, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjq1wLkteFOoOrlfaqmzB+rFuT+0PKX4r/80xpWKnUujsXWWKVYdvC0ZRzAiSgdfSNa1kl0rYiJxBsjzH1vKPE4WCGeTjm6ug249g/aans3NJB3w552Au6d3QvpnhyEjlOl30YKhR9FAKjvn/RWVL8jpEIp2t0579/on1yubf9E1Ic0OPK+1HFSbLPWsKDMZBW4cRPkvcwORC+Q6ywlVooHpgKNWUbX8yokxCaambofdZHTStMW82NLwaXNgMMdadTdfmsRSxLfnFq2Ze2ZL4qNpEh3OoQmnd+jGPA9hl0Gcfcwh/bbjNL3xh3RwpOEjtkXcAtQH9U9xcpXBiCqeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poCEHguF8T2i/0EVDpu5KGLBZsxLO0elNI366jSGJTU=;
 b=of9sC3zz+gafHxSvDytId+iPGJS2rgoNUBum3nAFoEs7Bnpr2yS7ok8bMKthY0R10A0eYLPyXrkU6YjT7JilpxUIN1lZ5XSWRRtoK5wUTwaDYcU3KobgEWwaaB4ZprsowAX89UgYlcU10XV/ogvtVUYKmJm7VhurKMU5sH4dg6ksgcisdv0ONDEcEmyz4on7pbTcYKQObxDbWxVPJ39yxpuqiCAeo6ymZfoMC327/CZ5WNQCUcLHTYJ2cGKJ46AKNOA/S85cZTLNyL/hh9P1Aux45RPXy97kAdppBhbkrXtfDFNWAaGxBus3v8YvVGz/OZ/U1rUi2+NJ9O/vYtIsnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poCEHguF8T2i/0EVDpu5KGLBZsxLO0elNI366jSGJTU=;
 b=YmcH3rkIM4vuIdu12I1w2yqHQAGpMLJpQXOu9Dm42RxJqu5vhzLw4UqEiINY6h5aBvkBlsiGnpenJdAhw2cdIb3O0gV62NJDnWkItle9XEN0esAzMCvcta/xpXS4q8RjSyPMkS75KmfwEz+AeMNkdnQBe7ytPDZUynPTdgOtxyniG7QB/sOBpjJ95WOSaRb3upMpcSQen1QRyMkt/tYp3VsuwrUAZSxjP3q8m8cRFLtESF9JlD4PTAN2liRr5T6e9LcAyoAyBwt42jYoYnueDYNricaW96NIl0oeGlSH86AD9p2DRHg3x7rpUV/L18v5nv1nF6jdZzJwhxhnvhc8eg==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by VI0P189MB2685.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:215::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 12:18:26 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:18:26 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/gpg_sign.py: drop unsupported gpg-agent argument
 passing
Thread-Topic: [PATCH] lib/oe/gpg_sign.py: drop unsupported gpg-agent argument
 passing
Thread-Index: AQHdceUCKkAfj4Hw60ugFkgBBEgmCbc2336AgATFipE=
Date: Mon, 23 Nov 2026 12:18:26 +0000
Message-ID: <AS8P189MB1672130AB40C51FD4046B1B1B3452@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20261111140027.69866-1-adarsh.jagadish.kamini@est.tech>
 <DN000LWACEB0.1I4HB0QGTWT1X@pbarker.dev>
In-Reply-To: <DN000LWACEB0.1I4HB0QGTWT1X@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|VI0P189MB2685:EE_
x-ms-office365-filtering-correlation-id: 5926dbf5-0bc8-4ffd-3222-08df495be055
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info: 8mOmKrhVfSwsSALgPtoPilt4IXBQ7heFxTEp2fky/Xiw7DJAyTpr3ejBe/D84RFL2q+cPM7eDwp5l17gMLsFqHiDx7SAPB/mQgE4PgKrAG+1mjOcUrpuqScKIWMwnS08SqqbY1EFHuaR7/dL19G8w59XWNMLRu0HF6a3nkQ7Flw0KMXJk7/9jm4Not+qHwxZsolx61imgMD8PuUJyyChOfPFbi0CDW89/M0jG9nwcu1LoZtWsd3dS85Pmxz2NARYPdjMMQJhltOX6uf0DyGnKYCH57ogb3w4yP8NIVNtdCsRqqUatp+OOY3Be2yiKr5fwqsFW9NkVnW30YHIIciJo+bT5YK76KafMzzRXUUeHBggB4lBrUQKdwaGNExhztPaFOUHW9c07OFUIC6uqtxeQf2kJuN85b9hCaCtDtA1KV22U7ECpjMbpHvFvQygAgUgj+qHNtm/CrUHhKDCaet0XmLIr3hO+9k98Fby9pAVHIjHpPSXdryj05m8s9ZuO25pTT2heyWhoetU5wzvi4oIGhzyAOzOsbYROLGzb0MVrW7OzVC48cjQhmKeVJfj08AqRh3kmxFam0wrSjeQ2NMd6/sYHe1YSV2McK3fCu7OgiZVha8v6pIXijczPJ/GQidDGkDEXer1n0d7Veri/p8Grd+O19fxbqkeMn/1YPGLPXUPwjbSofKelT5MuvRdhriBxTATXCNARLyvYRIr5Nu2xQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DDE6ih5WFq9wjXT8bocvkNOzMMOGXWmWjHAcBaQoGaI+And5uUtOcUW2OZfx?=
 =?us-ascii?Q?5io5RTqP1hxKPw80n7wneLVQSs8/u9f6gTMZiDkGtaw0EHNYdG3a5gzmywzL?=
 =?us-ascii?Q?/1j9kwNxLwsqHOTIdbkIOaQbu1kEpf7Oa2Tqyt0hKv0f6reKcP+gmvVP/AnV?=
 =?us-ascii?Q?LkQ2rZObA8wSUhYclk/iy6MyO9w66vKcE9Yxf9KV3hYBavMJJVzX3tvaAIhI?=
 =?us-ascii?Q?f5jSwS08uPij4Ls6nrju3ehf9qkn4VDt1XK1+HZjphj9kTaPLoMZAH1oAhAi?=
 =?us-ascii?Q?oYMDdKE8cy9OaB7R3V9q+a6EY+vRCXYQikK61twnBLTPkrZH3Owxa08QF+Ie?=
 =?us-ascii?Q?78+f9VeF81veNkho3T/xi7JN8p3BwjX4NWy+wyhz9qWGqFW4o6gvaQJzzqX4?=
 =?us-ascii?Q?WZPoRJqFv8WzZDampPPr+Qd42U2W2vI3OnRbps6AveZuP0eYHBhoNZ2Clu2s?=
 =?us-ascii?Q?8hajl4nRgeqnb6m0blZzzqFh6CJc8eIYl2ZuLwHhroFLXC4iH5BGv1swYshz?=
 =?us-ascii?Q?/9ORR+utLOCuhdCP/WcnqIeJ8yrSEwCRDuHvRoDyj371NP2iCYpwhjLxMIF0?=
 =?us-ascii?Q?/rZCQjtDAMPjET3EWfa8HVIXIn8U9wHqA6ORpd648dig+Uii+UrwGB/OXUfL?=
 =?us-ascii?Q?Kvso3SZJ+XvL5IzDE0cJO7odTzULDE8rCRy8HgKYllUuKWCIq0/jrsXQtoVK?=
 =?us-ascii?Q?Qq/xlDniAhT7Z6hbL5j9S671jnNXTwVygDdsV4PyRhx3tLKmzoQE8LsnRd6r?=
 =?us-ascii?Q?3xsYmJoWqw2ZR+wuK3OCFoU9Bome92YVWudEj6gVYU8yqcVLK8VrrEfkAvs3?=
 =?us-ascii?Q?l0AObE99HTy6V3wDeEnL75Wvet1Gg780iGHIcnm4FJiHduUPuFZ2mHSEwwOs?=
 =?us-ascii?Q?9iQSMKvHsKaAX7dALeE5Xzh1JYMdT3zeA9WgG0SgHqil0u/kSMSN8C0rFoVm?=
 =?us-ascii?Q?Zy50nvw3et387tWBpQmYf+dPRkMGlVsC1D5iRoSbrJst+SFgERhZBrYZQl+N?=
 =?us-ascii?Q?GPeSL6ysPT0wOzss9kmkMjpT8kS4NkfXaFX0ugfxJHblGe367eIjCQOdFlrG?=
 =?us-ascii?Q?7ceCflBEpFs8OS0PPC/vc8wIzHJGi5ezwzPmZxLN9nQtmSL9eO7CxRFuCSgT?=
 =?us-ascii?Q?+yeR2qVxsq85FVCae9SS5xTm5XbYAZp2Xh8D0nYTa4IH4DrTkRpW9RMb03xo?=
 =?us-ascii?Q?ENjZvAfmgRaG4wqtsTucrAakKDsvwPtg21Wnqd4mapj1wh8aEJncS2BtcYY1?=
 =?us-ascii?Q?rfyfrRj+Yd1wn5pXEJ/Q57+zie/xnoKbi5kJmkWr6N1Hb78CxBhQkJ2/YBoB?=
 =?us-ascii?Q?nOC0vEGCNYbyMRcoYlJmCTO51m6nSKnLfm/VhcWxeO+J72uTsuyCoVYrTTvf?=
 =?us-ascii?Q?emKzalMqn89DIuUPmSnqNkcM0YBFZgbxEmv5yhXLgMJLVjia/gf0zJKHTsGB?=
 =?us-ascii?Q?n8DsnFQqqhxaxX5rA7MiwTJ8SaudZWlnhZ8vdSzTBwJ7KqkfQ3LlFKrYaw/q?=
 =?us-ascii?Q?0gaIBtjhdzvV7/kOU/BB3xSGYSbbBaQaehEm5Fd0c9sjzp6wMqp7ILXGCVJn?=
 =?us-ascii?Q?3wZdwjoYfLAnaYT/DivAnp4Bf4Kx6edfYhTqDOT/NiGxzKLJekiwWL2i/rOO?=
 =?us-ascii?Q?1x8poSdrJi8sCQruHlfk1AoraALR1Xeu47CIMjDK+9dFJ6FFimCghnrml/HY?=
 =?us-ascii?Q?Q97OawShXoTEOooGOxKHLZ4QktKeC5+/+yAFgte21V6mbIaFaEZj5DvELvdZ?=
 =?us-ascii?Q?NB1Zfox3uQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5926dbf5-0bc8-4ffd-3222-08df495be055
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 12:18:26.4359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ae/0/hW5oX5HMgKY4Zau9Eco7uRDuFUeHeIFXAwFdPyw9ZzSrxWS9n2Ms+yUvRAYd9P3v3EOPnrzDwcdPfSAUm/ndsFtRxJl/RklO1QJzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2685
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 12:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250909

Hi,
Thanks for the feedback Paul, I am measuring the performance impact with us=
ing mutex for gpg signing process. I also plan to evaluate the alternatives=
. I will get back when I have an answer.

Thanks!
Adarsh

________________________________________
From: Paul Barker <paul@pbarker.dev>
Sent: Friday, November 20, 2026 12:24
To: Adarsh Jagadish Kamini; openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oe/gpg_sign.py: drop unsupported gpg-agent argumen=
t passing

On Wed Nov 11, 2026 at 2:00 PM GMT, Adarsh Jagadish Kamini wrote:
> Passing auto-expand-secmem through --agent-program relies on GnuPG's
> unsupported regression test interface. Remove this use and leave agent
> configuration to the user, since the signing home directory is
> user-managed and an agent may already be running. Users can enable
> auto-expand-secmem in gpg-agent.conf to avoid secure-memory exhaustion
> during parallel signing.
>
> Tested with oe-selftest -r signing.
>
> [YOCTO #16480]
>
> AI-Generated: Uses Kiro (claude-opus-5.5)
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  meta/lib/oe/gpg_sign.py | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index ede6186c84..fec6fb27ea 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -18,12 +18,7 @@ class LocalSigner(object):
>          self.gpg_bin =3D d.getVar('GPG_BIN') or \
>                    bb.utils.which(os.getenv('PATH'), 'gpg')
>          self.gpg_cmd =3D [self.gpg_bin]
> -        self.gpg_agent_bin =3D bb.utils.which(os.getenv('PATH'), "gpg-ag=
ent")
> -        # Without this we see "Cannot allocate memory" errors when runni=
ng processes in parallel
> -        # It needs to be set for any gpg command since any agent launche=
d can stick around in memory
> -        # and this parameter must be set.
> -        if self.gpg_agent_bin:
> -            self.gpg_cmd +=3D ["--agent-program=3D%s|--auto-expand-secme=
m" % (self.gpg_agent_bin)]
> +        # Parallel signing may need auto-expand-secmem in gpg-agent.conf=
.
>          self.gpg_path =3D d.getVar('GPG_PATH')
>          self.rpm_bin =3D bb.utils.which(os.getenv('PATH'), "rpmsign")
>          self.gpg_version =3D self.get_gpg_version()
> @@ -43,7 +38,7 @@ class LocalSigner(object):
>          """Sign RPM files"""
>
>          cmd =3D self.rpm_bin + " --addsign --define '_gpg_name %s'  " % =
keyid
> -        gpg_args =3D '--no-permission-warning --batch --passphrase=3D%s =
--agent-program=3D%s|--auto-expand-secmem' % (passphrase, self.gpg_agent_bi=
n)
> +        gpg_args =3D '--no-permission-warning --batch --passphrase=3D%s'=
 % passphrase
>          if self.gpg_version > (2,1,):
>              gpg_args +=3D ' --pinentry-mode=3Dloopback'
>          cmd +=3D "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args

Hi Adarsh,

I think we need to consider other ways to handle this. Dropping the
argument completely and leaving this up to users risks the user seeing
"Cannot allocate memory" errors without a clear and obvious explanation
of what to do to fix them.

Is there any way to detect if the running gpg-agent has the
auto-expand-secmem option enabled?

If we can't make this safe by default, perhaps we need to use a mutex so
that gpg signing processes run one at a time. If that has a significant
performance impact, we can provide an option to disable the mutex with
instructions on what the user needs to do to enable auto-expand-secmem.

I'm also open to other suggestions on how to handle this.

Thanks,

--
Paul Barker


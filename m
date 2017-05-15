Return-Path: <mirza.krak@endian.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0106.outbound.protection.outlook.com [104.47.2.106])
	by mail.openembedded.org (Postfix) with ESMTP id 37E5C6FF69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 21:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=endiantech.onmicrosoft.com; s=selector1-endian-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ePWAo40SJrD00SSNSVXHUpaUrYZms7N14/p/7Bw+8jI=;
	b=eFc5tDR2/6XQnyBwWoFjJV5BuoVGz79L0SX11oP2JrhXXqlhwIgkhC4d7zEUtWsYmpZ5V7xTMAxvqEcETZKKlpPGwNe53ip62/r+QzDAs1moWELY99ZDWzdJkA5Zvjm7t6o5zhI9DuGsKRpHDtSlcAYjYG/xbky46qJ0SoDOxdo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=endian.se;
Received: from mail-qk0-f169.google.com (209.85.220.169) by
	HE1PR0601MB2281.eurprd06.prod.outlook.com (10.168.185.135) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1084.16;
	Mon, 15 May 2017 07:05:41 +0000
Received: by mail-qk0-f169.google.com with SMTP id k74so86606791qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 00:05:40 -0700 (PDT)
X-Gm-Message-State: AODbwcAkwvUPRBwE+usMMDDHke+tf+TZoqusMWaa20Wvklm6E1hk+UAa
	cyy/+Tts7TGH7vjc7sahTudIgoGKgA==
X-Received: by 10.233.235.12 with SMTP id b12mr3889649qkg.75.1494831924085;
	Mon, 15 May 2017 00:05:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.34.174 with HTTP; Mon, 15 May 2017 00:05:23 -0700 (PDT)
In-Reply-To: <20170510113147.26292.19160@do.openembedded.org>
References: <20170510093705.12171-1-mirza.krak@endian.se>
	<20170510113147.26292.19160@do.openembedded.org>
From: Mirza Krak <mirza.krak@endian.se>
Date: Mon, 15 May 2017 09:05:23 +0200
X-Gmail-Original-Message-ID: <CALw8SCUNKZ039BjF6fHAq8JCtsH-OptJrf+KhPUUsY9LG9vQ6g@mail.gmail.com>
Message-ID: <CALw8SCUNKZ039BjF6fHAq8JCtsH-OptJrf+KhPUUsY9LG9vQ6g@mail.gmail.com>
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [209.85.220.169]
X-ClientProxiedBy: DM5PR17CA0005.namprd17.prod.outlook.com (10.168.112.143) To
	HE1PR0601MB2281.eurprd06.prod.outlook.com (10.168.185.135)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bfd5b8c-3aa4-4f90-869e-08d49b60cc36
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:HE1PR0601MB2281; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2281;
	3:Q/xYw0Y27SQcduHJ52mXxXnAVGiUPyGm7cvPCVniq0bqOl4hhUnU8roW8D/Ho2VHknT+W2mTVcchRvJdAXA8vxoJonhWPJcPHMvry6EGqxByt3EUZGWuJPxJTpnQULZEvUepNBRwVYkYOYc6P4yE0/R9QJCVniVaWqad4JL95ClimWGckpaNtNjBSw5rzb7auNvOovSjy8Y20tmiZteRlELCgbaGWw6bnncjnB/1J3V4Tpn/l0pMPD7xGvsZuL1WBXbh7wMZTjQZVK6TipgEZULYc1C+ISCFqEyVVHFYbG4=;
	25:XCbojpV0monN0hVSyoinZnI6LYw0c9sEwGf42V1nkQTFY1GpkljZpc9bnEbtf2Om9BqbSDcvmQxnN8EKf31wsbFn/64U8+nuVVWlobKL7CR5MNH/lVrg1nKkKRBwvgHmrecizfT76Gml81CdvMFVWjQAfNVPtg3y09xl+iYMaC03oOICMT6pysOT/6yFqCy7zueVdoFAxlQTLWBdeuKh5LYu2ygwMa486ZU2EiNDLMjQYnH6ZeNIbn6hzBHTm1amrXhV8LtnF3cgzhtOLy2H760USFqGYkUCGh4jbL98oAeWqQ9tlSNi/wJfX7kUtaA23bTxUudjOcpUb+wmhVh8BL5SlpG+0WEHvAW/pWGC2MvTAtAgBcxFaQilwpDgR5hQEXyucJ9S7lxJdu6vkzuNGK4Ea9zYsvcma9nieDgoO5kCYr52CPnhN6tgxY/BLKCh2rMgW7tGx5ns3H/QmIWdoUL0uhV8Fu4H4m0WkgjUqTo=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2281;
	31:phJTZ16CJP4/qcHB2tn9r7aDdFNpYh5v46JPk8fsp71u4InuU40fsbavoM3iHElb1weo1fXbzfKYSYLYXHyWQlLNaEG1DoN9tfdFiBzSbYAykH9bkDznaQ5veD9FjHpqlR/4FKMr1DQBsP2d5OuR4PIhoCrrt9848Ao4GCjwCwS8u8hz/DpzyLudWFBHIpxGdUvz4MkyY8IDOW+MrT2yR4U2TDZjnF4wJhHKu668WSfdF19m5LgSly5BA0OSmcuixaRefNSPecOjW/Js/QWb/Q==
X-Microsoft-Antispam-PRVS: <HE1PR0601MB228188FFF9F40E796AE66E4C9BE10@HE1PR0601MB2281.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123562025)(20161123564025)(20161123560025)(2016111802025)(6072148)(6043046);
	SRVR:HE1PR0601MB2281; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0601MB2281; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2281;
	4:K1fNnOhtJyMMSr8VRr9mA8KXmt4e46QTM7Iln6QSa2ZACfz6KN1+0/LD/7Z2CspkdDpWQSeFvwULXfdX7b26biIqYBbv3SMwv2yMzV4oFgJ2GtHN/h5BW7KrJjfZRytUWJi7fbSEntutzcoVMrkfyzITmVt91cWKiK2fRcS2n23XaT6U3048NcO+qR/qayYtWyuFtBkitKpvw9OhtdIijzGtYieiB0W56wng/VLZpVWUydfENpfBz1ic+6Hx/EMwP1R74ieZ2sSLOYWMLRxcU6Ty1KlJP0FeZDmRjVH6VvE9oywCk0bXsUXdXg1/+oRQ/PhvnExq94ACNPmv7DR4EzhwJpaoiSahB3HPpTXbajE1Ytxldw/UgEY9gd3XczHp2W0D70+pTyn5pCjT9TzyWCWHNLiuyDsOdepql2SYa9sTi/o2rohgCIyPxLFOGcymBBggiymmrXAvO0HVYJgWy5M6ngwZXUcCJPAtGtDhHmb1gEk2Sbb7+dkk9UdjP2QAJeL5l2TcvMyRNe1YZNPAEc/7R9fHdCrXFH7mL7Z+sAQMqqMG3qZWzoWdsW6nO8OWtGhLOvPPlpd0UEeGv+1ZLPkQOVHldpAlRBkh1rmYE8aS1xjgDQDjs/wvCLdgdKiS+9ZKjPVcEyWj9fZO/TT264UtTqWqCA6ibKFUHLUjrsJWQMbk6el11KI2fUMgqD4uZDUECLwamp1u8ttx3ygTbcJj56nmkW4i7DSLIoUi1ZoUdtuQamLiHxY/TmQqXuQkvDNfVUmwmSKkOU1S9I5uiNhK23xKCTkdRjvsqg6/696H+JGDtV/vAR1plm+6ue3qX29E5RglilSYsY2Uy1GXFw==
X-Forefront-PRVS: 0308EE423E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(39450400003)(39400400002)(39410400002)(39830400002)(252514010)(42186005)(305945005)(7736002)(9896002)(6246003)(53936002)(110136004)(54356999)(15974865002)(107886003)(63696999)(38730400002)(8746002)(76176999)(50986999)(81166006)(50466002)(4326008)(478600001)(2906002)(2351001)(2950100002)(6916009)(6116002)(3846002)(74482002)(5820100001)(61726006)(498394004)(229853002)(23676002)(9686003)(122856001)(6306002)(59536001)(66066001)(61266001)(189998001)(5660300001)(86362001)(55446002)(142933001)(55456009)(18886075002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0601MB2281;
	H:mail-qk0-f169.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjA2MDFNQjIyODE7MjM6NDJqT1pBdXlCNy9NRXErNWdnSVRzZlVo?=
	=?utf-8?B?OVhXQytnb1MzUE9nY1Zid0E4dVhEeGxxMTN2cmtJanN1OUdEcnlqeUZud20x?=
	=?utf-8?B?RDNUZkRJUkU0c0huMzljK0lHc1pzQUk2aDVqQzF2YVJneEtjRlN3cjZvTHlh?=
	=?utf-8?B?NllCYU52Q01TZkF3bnkrNTN3alZKcjJFdXhaUk44bzY5dk04Q3lta1FyUkxs?=
	=?utf-8?B?Rkk5UTR2TTRQbTNwalJOdVBCc0dJdVpFYWNTQnZFSEtSVTMzNDZzYUtwaGR4?=
	=?utf-8?B?a3hNSXBDVmJGaTc5Slc2TjNKeDRRbFZtYkcxaGZ3Zm9TUFhNTXVwaFFpWEdD?=
	=?utf-8?B?UVVNUFRPM29QRXNHWEkwZS9RV2pOWkMrQ3ljSEFDclFEU1dnaXVNSmRRWlJX?=
	=?utf-8?B?UWtLREhZQVVxajcwNmcvSjlHeW5CMDNkZXlYZGdvOFdKZnRqMFRNbElHeVlx?=
	=?utf-8?B?VFdiS1U1Yzk4aUR1aDNzNmNpNUNEV1lkMjR6M0l4c0o5UjVTNGpBM1dmUENx?=
	=?utf-8?B?Zkd5SFhTQ0dVcjdLRmI0K0t2SE9nNHNDc2dyOWxRZ0pDbEY1aUJLQ0FId2Va?=
	=?utf-8?B?cGRUUWZ4MGdDeFBQak9kRXFJMFBtdnlnd1NWK3hlWW54aEpWeWNERlBWTlhO?=
	=?utf-8?B?YmRSaXQxQ0d4RlZocVdWZ2NOV0ZBK25Gd0xyN0lZaDkvclNRUEI1eDRRd1U1?=
	=?utf-8?B?WjVkc3Bjb3JvRDF1eGkvcUp5MGZNRGg1cUZaV3MyeG10TWxWY0JnQnhzRHpm?=
	=?utf-8?B?UUEyQlhTOXB2Vmd3ZkVoWjJPQ00zSDl4SzlHNmsyU0VNblkwRVBud3piVVpO?=
	=?utf-8?B?UXRNVEFZTFZzTUZtZjFpNzYzbmIyQXUrTzZxbng5UG9sRlhjNG9SSklQVEZK?=
	=?utf-8?B?c3NFeW9vYTliMXlCUkIycGF4cDhBWFRrdXpMcDRPcXZPTko2KzZWREN2M0tN?=
	=?utf-8?B?QkpocGZlaDk3UG82Z3NQa0JxWHpPTEkvTG9zMm45aGFTMFdwY2VVK3dtSEVo?=
	=?utf-8?B?emFFK1p5TlVWYkVHUmY3Z01GU0NsQnoyc0RRUmFzbmIxeUl3U2dJL0NXTHI0?=
	=?utf-8?B?RlBQWTQvWUlsYWN2YXlweHBMVVM3dC9kbzBNdHpwaExDamZLTW9RU0RhVkV1?=
	=?utf-8?B?Ukc2bm5yYitmVlByN1Z6SVYzL09QS2pxUjRXa0IxdFl4bnNJRmhKNUxSMDJV?=
	=?utf-8?B?SngvbzhmeDVIUHRCTzlyVWVHZ0MwdFJnaTNiZURpTUtIbm8zNndaakc1Yzlk?=
	=?utf-8?B?REQ3UUhPR2k5M053bTJlNkJWS0JWVldRY3NiNWFxak1ncnVCSDVNU1dsZnFJ?=
	=?utf-8?B?WWY4WmNRd3pUUDkwNm5OMWRvRm5LeGxQR1V0b2RLTXp0OVdpWFJ0N2ZOOXhJ?=
	=?utf-8?B?OXowQ3dwUlBMNmJNWStvc1RRMVhkTHJTSi9QT1BjcmhtN1V1VjVmUHowdTlH?=
	=?utf-8?B?YUdiY3h6ZkZjTkRaNURQQmRkbkI3UEpvZU9ycUsrZUhHdjJCVFB6Y0Jyckha?=
	=?utf-8?B?VG02OXdNSHgrbVlxQUJTQ29xbjQ3R3pNTUxwYU5oVmFudE81U2hzbkd5Qm5o?=
	=?utf-8?B?bTFXTmRkZUwwUDBjbnFvdTBmZlhPWUNxaW9mNjlFb1FPdmxUNTc2S2Nab1Y0?=
	=?utf-8?B?dERLbVBIVFQvL29FU1FPVi9aSUNZMzVzckF3TzcvYzBCOHk1cktDNkFPeDI0?=
	=?utf-8?Q?kW9RYd8pxAjqJweDEVrvVYusPQP9pjG74XyZn8Njb?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2281;
	6:lUdseYt2WY6tI3hGBI8GU9uv/m0Fh8SB4hCfTR56tk9ZHKzikpa+VU3Sc27hiBIGM8cp1Fhr6yRGNpRQowltH7dZmxHcJWPzkQFSektifAlehIHImgFAhn5EvlrCBj6+EWhaCOUtqPsi9h7QbV5+grKU1sVP89LliZMlp6ohzzTx+de+zIDioyMWAqW/T98b2LZ8+EYrXxhd7dq40e7SydixhDXGuQxqibaMzxp/PEXrEC0j8MBZhcePXQKIXmTVCjre8OGzrkl2jT/jxURdYdHERm6GYp+RvEaEiY+621XCrLbajizouj/Q/GPd5CoIbqdfYJwMmp/b0L5thMMr48Ez3Gauhs+eACehvwfSShnkKbWngjSeAcMbAX75BXIuj0vjaYSWAycz0cwnCJdUdoLVM6p5RP3VHlnIkzV/+ehlV4tq4Bbn7hXvlw37DKHl3jiZyukkBPgZUs617Bc8tNsKUpPwEGQIdO18NOXwGilOsr3pWQeg9nmhqCS4LnUdIvgvyDQOrU5LkDpdkRKRKw==;
	5:W0K+PMwku64XXzdCiAghvYUKxr59TVAP4oQBdoKKpG0F6XQDL1spHujav+qIY8JHkgSyBxrSneQo657vIGdrbMTV5jnUChVfsYf7hVjZ+xm0x1Qedz2wt8b+2GF828bH89VGr1rB76gSBind/+z2MA==;
	24:MjhDHjOHlYCgLShWFS2YyoEwRNs9UmQzoTBeCVC60TH9KSEbR2Ml7MpZ8RmHKmwoda3Vj4yMlqGyorSul3gcmZ4AoBFLNG1TIFxTtlmciR0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2281;
	7:DZ80gmwX6lfDXJp1UGuesRFYbvbVHZv9CVMRZ0ksym20YfJOH+asJfmn2v3Uk1VEm8LXfzITHZR6xPHaT+Usjmr+cCFXHUOkD8HkRb5wViV+jXjagpKb+CdH/nLWfqmFR6HS/+e1DGaDlMzqTxXlV8esQvWI5NVzdYso/qZzu3IanKa3dLMlCVAuzyNmZfOFyme3QjLxFYadrMZlFjzCHZmpdq6LWVn2pu5Cy13/oWuC7cbAPphpc6bDDe3wLNuc1cWFkCYht1YAa967+tqmL2wmek+bTYn+1t1OPqZU8bXOxZG6kjtL2e5lF4LVBp9Bo7sl95X7R8NmsB2+xJFyhQ==;
	23:CB/98DGcqmD6jr03wwPKO+Z17LHdvoiQqKSoaZmyUfn8obO/e4JmATI/2drrbvdCT8Buli0Oj7FfPo0cnghrwf3SHsI8fBhW6bogT/3Hf52KTR1aVDAD+pYNVwCQpypfvNmXAixGkfXz7e99uNacVQ==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2017 07:05:41.1363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2281
X-OriginatorOrg: endian.se
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFttZXRhLW9lLG1vcnR5LDEvMV0gb3BlbnNzbC1uYXRpdmU6IENvbXBpbGUgd2l0aCAtZlBJQw==?=
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
X-List-Received-Date: Mon, 15 May 2017 21:33:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2017-05-10 13:31 GMT+02:00 Patchwork <patchwork@patchwork.openembedded.org>=
:
> =3D=3D Series Details =3D=3D
>
> Series: [meta-oe,morty,1/1] openssl-native: Compile with -fPIC
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/6671/
> State : failure

I seem to have messed up here.

Why does the testing framework think that I was targeting master? Was
my subject prefix wrong?

--=20
Med V=C3=A4nliga H=C3=A4lsningar / Best Regards

Mirza Krak
Senior Embedded Engineer

Endian Technologies AB
Fl=C3=B6jelbergsgatan 11
SE-431 37 M=C3=B6lndal, Sweden
mobile: +46 730 28 06 22
email: mirza.krak@endian.se
www.endian.se


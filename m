Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126.1793035797398253418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 10:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=l230yCbW;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=l230yCbW;
 spf=pass (domain: arm.com, ip: 52.101.65.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zShDrMXfwntJQj08ACzHSkdyFhkpGPISFNxnfEK+ES4CThkRfCJlFDgghDOAeNWV8FIXBQyYHPHuSGj2mj1OemohfZpriAVhxv8n22xN8clJsURBFx8GWCDj1OW67ZYu5B+Ruf+ZX3UqVhvNJdF5T0D1JKLf6uvoZgenTKSTFPFuBFmEQ8Sses5PO41j6/dQXKW5Sr37wMTchKFFMmSQcDy+Id3mZUJW2A7x7xdHljEJ5liMJf0uvmpgVqY7hZJCnwJbg0XWcyXgeI33vFM/k0j7n3HbwNi94XHFgPV9lWVhyoMY/Wn6VgM6YmbHZgjgm2L1ZFHpAQf0VCvVphcRdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNNphgQjxZoofo3p8ddf3ChFyKD6kS6RxRY/82iJMDw=;
 b=mQBm6KpU/PHoIdrRZXhRY20aLbiUJ+rc6FGv5BX93Lcxsci0yuKpxOvfV0Jtue2bvnflSgW4RQeW2UAhs8vTs7rqq+T/7EDWKC4zQikpaIv9+Dgy3w4iow3d00aGagNplsDjf2rC0jwB/f9wK4KTkVWnexvrBocdM0mkudK363T1CzQe7LV1eeqhLA/ZhwGiDnG8eiWPAoiCuPn4zI1oD4ZsNe/qU4iUGttr5QiKbnpNhYJ4Qj+pDl4F4rmxaweGOwefZ2h1cGEQvNgJJwWJ9LOpnzi6sJ5cs6X2ieZ1dnV7GtiHFdTcI0aBEkkATwjuf6XCcJ3AoQkkIgYdjsgErw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNNphgQjxZoofo3p8ddf3ChFyKD6kS6RxRY/82iJMDw=;
 b=l230yCbW+SMbJdz/30yjtMIJGPzZSplZwMrOBhipmNHKn5L3vMby9e+U/BXyMedSk4rscCJfS8HPxF2ROFfWl3pCz1JoFJra+rG+hI6oL4/SGnEs7+CAn9HLumjfGZzTSNsQV465KiXp0HGZekcFOl0/8PAFYwnNPBAUX0TMdwk=
Received: from PA7P264CA0503.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3da::7)
 by DBBPR08MB5881.eurprd08.prod.outlook.com (2603:10a6:10:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 17:29:52 +0000
Received: from MI3PEPF00008557.eurprd05.prod.outlook.com
 (2603:10a6:102:3da:cafe::7a) by PA7P264CA0503.outlook.office365.com
 (2603:10a6:102:3da::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 17:29:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008557.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 17:29:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlHD4lA0i7gOjx6Fc0USZ65nCbZp5DynsWUAoUhYbKKYmvhZBARvBOPe0z/31IRdGeuE7ossW1K1caVkPFWvySvHOtWAky0MwfQv3yIFQ1anZ01mhVuto3925OF2w633+/wEq4h7XIjIh1OcS5ha3vjELgHdl5PREFyfdlF7xsRfflU4kOipxFMzJLaR95EnHO6sMWSQoO88O+gIDHeRY5Ji+5Ej+x9lJCrvVMAGNNILLcUm8Bb4mAWD2t0jLf8Q4KsG7ly/ZrIRttdJzHab8MqZc5WKpCYPYiHYnV0Uq3ITHAv8Cbzt0oE5HQqt7vfuAGTpbRqQd8r1m++p/ySBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNNphgQjxZoofo3p8ddf3ChFyKD6kS6RxRY/82iJMDw=;
 b=tYpDIAnyXhb0Qh8u5EFU35UuuiKNnlaKT9MxXqzAlHBQfJYSVSSoguIiLq3F47u2ijLcw6Og/pKDXoABymLGC622szbihTwraaPGpz1MzPntciu0kNZad9pH2NaacsVgyZdDBiCaoGGWAhez92tP9fM1InLWXPovg61/k4ETlHQeAPoiA94mpBmh7QjFV1aFVvHgVIdKhA4RFPOQCpHyyuWHZ2j+ZMECIpe8BaqtVfojS1W2NXf2CoL8XWFwOXUVRO04SeSsiLNOouGLh8S+1OB+1mkzI6flUvPeFsEWI4InzHK3s3hxG9KH0LY14JzuVvfD5//QYFzHzGaoNzBs1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNNphgQjxZoofo3p8ddf3ChFyKD6kS6RxRY/82iJMDw=;
 b=l230yCbW+SMbJdz/30yjtMIJGPzZSplZwMrOBhipmNHKn5L3vMby9e+U/BXyMedSk4rscCJfS8HPxF2ROFfWl3pCz1JoFJra+rG+hI6oL4/SGnEs7+CAn9HLumjfGZzTSNsQV465KiXp0HGZekcFOl0/8PAFYwnNPBAUX0TMdwk=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AM0PR08MB5377.eurprd08.prod.outlook.com (2603:10a6:208:181::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 17:29:19 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Mon, 26 Oct 2026
 17:29:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] rust-common: Use 64-bit time_t libc layouts
 for riscv32 musl
Thread-Topic: [OE-core] [PATCH v2] rust-common: Use 64-bit time_t libc layouts
 for riscv32 musl
Thread-Index: AQHdYf7PmjoWBvyqg0KGFWrP9meP9LcQGwaA
Date: Mon, 26 Oct 2026 17:29:19 +0000
Message-ID: <D17145EC-9A85-45FB-A93E-B6D66D5E4426@arm.com>
References: <20261022082433.1300083-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261022082433.1300083-1-khem.raj@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|AM0PR08MB5377:EE_|MI3PEPF00008557:EE_|DBBPR08MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c07324-3c4b-4e63-5780-08df3386be48
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|22082099003|18002099003|261026140227099003|3023799007|261009223027099003|56012099006|11063799006|261022075727099003|261022105027099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: T98reddPK3v5nCIytwwRAvgB614Va0iMbo0mzuYS9BV9w2fuVDS/GbcX7K+yE0ENnYPGi40qGvCzh5izjNhh7wXbjGyHNBWreFQoQzsGXHcSbLDTR+vgBTm0CUuB4DZxfLsyP/0A5ha8lM4ZBjkwcOCIdnF5+GqpP9uMXXux/YorLUSQsLloqunKVWuifX1HY9JMSSm+XY5TRkJrKDT9rknYef4yOKT/qITRqsb6tgiH/TVQWkOUB9bpKEH7SC/HKc+RhyXNuRFkSUF6Sh9DsT3UY5KvtkqWRXa6J/ZCLM1GIo7nu1ZEtOCxzP8agIrgzVJ6KfO/Wpozb1M5nAtZeREmQyijeclf/j8U1Dprz0JaoOUtWOhH+GFYIhvHGVtllv7+jh5rE9LzEvxxl/R61joo9p7bXjBwl994sZ6Bw2UdKWSZOc+LnXBVInyJuq8xRc9kUSx98BAwhGPpRXBObzTqn1y2hsT9Bg7ZH9MDe6ApC8R1tk1n6uX/Dq7az0MAKpchtOjSLIlrM4kDzyuQRZNqEmuzlEa0xN1B+j8+q25mSgNXoaFdf7g6scGohCrsIIQBg6Ugg0Mj2s5XAMFfoT/Wa7pR8+Q9yndIx0nRC7DWUl4AxgXvl4GtUefUm4bbR2WBxud4LeW/TVfk7SjtKhFC9/mAvAzs9SX1KuEfBpJMBPIDSlgHhqnH+dxE/7A76VxmYP1+ABRAiVGdS8vSO7cG60dI8dLEnwI6T4afvw8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(22082099003)(18002099003)(261026140227099003)(3023799007)(261009223027099003)(56012099006)(11063799006)(261022075727099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F4832D5C7B8EBD4D8D63134892CB74E8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ShZcQhzKU1XyFhk2D1GFD61k60G2CL8S/S0TpqD7e+jfY7s2C1BMaT/KMyLaKA4Y+9zaBQwX4o9ObljAgCtJgoi+o0H2VT6njFdZCpCVtbzg3ZBGWArH/Ww2o6DvWO/388Bz1fgsLMCDszJab6CnxM/pniQ2m+XtwrYOMvk0nWFI7OCfhHnRFeNwCEAX2HwN9EEoGl3iN8NC3PnPFns9ksCEdcE0sVxnwCradQw7ux/f5KC9DdzUa47LBu2QBTyaaJmMHISPSyIzbMiZ/XFrDPgVkNJuUoyAMDE3x/NoRjWWKmK9abxVTsslZlMRi5bZn90Xj8FAfjhoAqRU9Xjilg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5377
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF00008557.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b2a605d-3b51-4c06-6d18-08df3386ab03
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|35042699022|36860700016|23010399003|14060799003|82310400026|261026140227099003|11063799006|56012099006|261022075727099003|261022105027099003|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: UsRmxjUjekPmnOQvrtJvTXwvD6g9N4X70VzXGp2uvD1CJUPG2SoItxsaRlYT/CGTf2zV81FlQY4qorVbgh4TKSUplYSOn+KWrS6R9JHLyI1Hbvup++H28Anl5aCv2dQOYgo7v2aF+kWRq1Jv/boYtHsTwuCe2qp/EowZ3RxwS2nJKT/nVRiJVi6Fk7L4TvV24LcFevMklGGVEiJqbpsip5r3U7pBl65tify3A1bacfdh4TT6d0V6HiRYzLU3VFEmOODRX0N8hdJN2kfjIvDblD3dFpq6WLrVSkT+Sb63MsyTkiLtL6AG+MwSsIufRmHdLNuZzXsq1mFazqdRGJ+H4Z4Y2Hpyh5cWX95v+/Gmnc7Y7fNsmwfBZoq69JF+UWBKB9jclT54KyRFYIiBfGhPYQqrLwpimcJvXGcK+v3kfPvT95Cjko3BpXpyHu/n46oWK5zvyn7SElwvsva+YAbUWtYuBHZduuUk9A5yXR9Nu06/FCZU+MGvw4CCqk5NI9F8crNaDM4ok1EM/HYjinoVIUuALRIN9bwveNlORrB0gjPO7kIJBs/QsA9WtdB91Rdq3uLzs4X+ANS+nHt/LcJWH8DziIdRuLOTh3ddAdi4ijq17TUl6ko0L0nBbAZ/tikLKnK/G66zTF8tUtP5Wlk7swjBXUDwMyFscljEY5WNgVouYW9adD+ZWj2U6ofh2mG0T5t+s84yYU+LZ8ujqqF4Ng==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(36860700016)(23010399003)(14060799003)(82310400026)(261026140227099003)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yBMZ3yONUeKDz0Mjgeu8D/wXK3reOViWWtBCKLe/uzbl0pzQsigyJp4BGxFXpTTD8JcqldxHI5Rdid9KzuwZkXgJOYYgRQ4l/6gE+/6xvM4N/7cwPMLa9WWuUU2DkdN2/SjyvCP7YxtK7tGqvBv7Bvd+UXouBZg6u9Yspj+RGrvGG4mbNVJ/K4uc5CsAoW3FMUK2IWnORdUHarOZTtMH3C0ghRPViiRzCeRKfI8MvpphIvYVF6yKFt2MPkJShLVSsWfjJe0Pfv6wrGR6NNtyVXT7NIu1UDfdgeXT4ptDi0beuaYLKozRzAZYYAlPCapzSbRpvo2yDV7Qu1+hvahS0GFgdb8oQ06TXVPdqdhqa9LifkkmuJ9wAlGMpeUe8kg1d7U8sX7PHmQv4C9EwbPfdXdmF1gVeAn70TKN37w15A/s8LcmhBp8j6Ef3OKAdlgl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 17:29:51.9838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c07324-3c4b-4e63-5780-08df3386be48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008557.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 17:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248686

On 22 Oct 2026, at 09:24, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
> Until then, opt into them for riscv32 musl targets with the
> libc_unstable_musl_v1_2_3 cfg, which libc 0.2.189 reads. Earlier
> versions are not opted in: 0.2.174 to 0.2.188 read the
> RUST_LIBC_UNSTABLE_MUSL_V1_2_3 environment variable instead, but their
> riscv32 time64 layouts lack the timespec padding (up to 0.2.182) or
> fail to build with duplicate __pad1/__pad2 fields (0.2.183 to 0.2.188),
> and older versions have no musl time64 support.

Should we be setting this without a machine override, if it specifies what =
version of musl the crate should be targeting?  Seems wrong that only one a=
rchitecture will be targeting the correct version of musl.

Rss=

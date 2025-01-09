Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D00BE77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 17:20:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web11.2510.1736443239789917339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 09:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YvcVcKUQ;
 spf=pass (domain: arm.com, ip: 40.107.20.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVLtmhNM2KErvPNVaraYXw59fUm3POztYktqYTLAd3cef5M61y2T6UPY1iipuEwH0ZsqhRqUV/QWRM8VG0uNH6z+vBj9lE6wv1KQKgDyFoBEtwHe9UMCiYbktcnjzYQnFj/NQmdEnC3xdHEz0jHLK358AZ719rUG5JAKORee5pYuWGtOQ9VYlsXJdlDT9REyMLLOwGdfBIC3gvlKDuEbBUQVMhLL7Rt6iusYIFtwyJl3NwOkOsSZ7a0E3hqEwr5KwW/TUmPKF4AAuFayOkd4UQwOA4JmvJe50dLpUr85Of/BFuvOevf/f74KfBxeLukyp/v5ii90uTWNMwAhqCawyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnMpvPmBmYCdGM09sgu3WORqreHdioG5MLPIIAAi0WM=;
 b=rdqq/mUK3/eqUrZ0s91MeN1/V0t9T/oQ2j2onodSrtu0HML/DS9aRu4ovHdvgvVI8YqHZZLACLNIlivpjLEWoUHSVRvJqyGxONn1crlVsbsuuZXh5KFtL1JHc4HVrJi6kLIRO8ruCJI2oODq5DXInZ+Swu/faJDYFI602IWbCqQfWQI92HKZjbacyqPisb94qmlmz1xn3o3f5oJ6VrEHHHYxa4x3tuYccN4BkHSIU9bwvc2Yce/oZ45krzMIWX82fhHmcHdtdAqwjvdkNc7JlyRvi7/VVmN3Egt3bjpHmqa+23rjkoR13NyKLgbTjrJzploMLrnmzcsSfa6XhhYRnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnMpvPmBmYCdGM09sgu3WORqreHdioG5MLPIIAAi0WM=;
 b=YvcVcKUQK3N/KY6dzGibAFPH6p5dpPyiBHQjxcuRKH+prgzOjp0NYlGc00EomXOoKnRZTXNsYO/FXkT3bRyaXFN48n/nOsW2BvKDDwN8rseuITvp74QV5LOz4//1Yj3fMEJZfug/D7o1nLLy9qwBFoSblUnmr4kJaUG4XDOMolY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9902.eurprd08.prod.outlook.com (2603:10a6:10:476::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 17:20:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 17:20:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 08/20] procps: update 4.0.4 -> 4.0.5
Thread-Topic: [OE-core] [PATCH 08/20] procps: update 4.0.4 -> 4.0.5
Thread-Index: AQHbYalx1mB8bYq7UEO/pR6wBqPR7bMOsjYA
Date: Thu, 9 Jan 2025 17:20:36 +0000
Message-ID: <59E850B5-E443-498A-BF1E-1C19B284AA3C@arm.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
 <20250108084226.117178-8-alex.kanavin@gmail.com>
In-Reply-To: <20250108084226.117178-8-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|DU0PR08MB9902:EE_
x-ms-office365-filtering-correlation-id: 90452df5-becf-4d0c-0fe8-08dd30d1eead
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?WSxXYxaXeXbQlOrLFu+TMexvCt7DBREdKVcnaLJAaNTIYLSl0JDYgHiL5+YL?=
 =?us-ascii?Q?jrk/bM0P4I2XQj+rg4PDE9yur3gphjV8NZL8Z8L9GwuYK8M6PVblep+VluA0?=
 =?us-ascii?Q?RKJi3c0d51oe0SFo2R3HZnOSv8VWSWCH4xYHfzNAA4nAaOUUk25mnCCetN2/?=
 =?us-ascii?Q?0IQKqjNaKkiZZrL2Hywuv/lbkrsFy7VkSFB+AW2HeoMnKKXv0ploL6fiWvmA?=
 =?us-ascii?Q?TZr5G1989cT45uDNyaoWIdHR1Q8nTeD9sHqdnNZ6ZC94xBKBpdmYcSaPtEQ4?=
 =?us-ascii?Q?oOWFnmbOO94zFsj8L3i4yNGqngl670/n/F8bpYvj5C3AQQuGPTGudzKkRMZ3?=
 =?us-ascii?Q?S6Tr1IPyXR/nFi1jY1ykugnNrx1ofPQV7KZWsuUXMJFNBXUAH9mNPj2esQvK?=
 =?us-ascii?Q?cvS0tMhZIsUjypppxd6pcpCvxtpJOzC6AJSDJOOb7r8Ep5azQhIoeW32rNaP?=
 =?us-ascii?Q?lbETpfEG85GLCm0VfL5/05QqfUUPRu0QGuIDQMeNdoPMTTJVd/EQuc3IzSmz?=
 =?us-ascii?Q?gqqqRhQ5bUZSiyz2nB0IWu1BUkA2pxUop4BNhMEINOQCtJ72V75ckhIVEvn0?=
 =?us-ascii?Q?N/rzuWDRFBqfgihye8/chtwAGqvE5o79gUxZqWTxM3+MUA86u8QVTU0WvNpw?=
 =?us-ascii?Q?6yJG+RgPulF82cO3kykdsUyQ4G8cBieX9Kmv550In+6Bzhcx6qiwOBO7GU9N?=
 =?us-ascii?Q?kBkZRoWgDPE/uTH3BmBrc3LiQmrsmh+iveiV4uW9D6DQC7Csoz8DbvX7aKmW?=
 =?us-ascii?Q?y830XhnkxbuF3KYdGBHDjsaxnzHZbCujBcAfkmnfm6KGJTbtrSfRnkGckFIo?=
 =?us-ascii?Q?F7uluKcVWkaCU9axWABbww2MwCeBPw7z1tCjIRDmVboi7dLaeH561wiqMq/K?=
 =?us-ascii?Q?1tnMrvBYNPvSbSoctl8THA6+D6MXj5Nvktz66OLqJe+0gDj07bL1OMPMBef1?=
 =?us-ascii?Q?Q3RLo7TAxYK34PJiDAH5sEdx6bWC1HUwMRAI0X6/PRls5MRnD1DLb6hV0o9X?=
 =?us-ascii?Q?J11hiYeyJDcFtgWaIZu0wwHeGSYiZWk3Vwq+2AS/j0USXU9gEaHpXvIz1Vc6?=
 =?us-ascii?Q?TPIxoXi5KfsIvmnkH85ze3f99VNPE4sDVcy0O9WG4sk717opnDK5R5VsnHJz?=
 =?us-ascii?Q?+SbT1/mGyg/f1l2BRn9ZXBU6tfbIIXs3n1wdpckrArN1niQSFS5pZkOwy/hC?=
 =?us-ascii?Q?4+zG9ARNCHc082Gk0NAvesM6/mPJtrJXD+41W6KniAg9GeFhjVqgBxiLiBli?=
 =?us-ascii?Q?7XnKwB/j7KcN8Y/o7LptOB+JCEdbsW/pXXL9lhZosOSnGi8SzMbrqCyDksS0?=
 =?us-ascii?Q?gXxmlzwFkYHCn9x7dIBL422Ex7M9Y+cZo3FLD2kejO4gbQAe7yUzCltl1vU6?=
 =?us-ascii?Q?rNoHBABoh39k3KunipqTH38k4KMcfhlGEqEwXK04il4YJiEriD2C/R3eybUM?=
 =?us-ascii?Q?DdlkjsNv6aOQRYk6K0zd+No7udlfgiXU?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?adggcxI/0Lb/0M962VMec/WoLf7JaCnsu0eOFtuGxkO79pAvNuuL8q8ZoHLT?=
 =?us-ascii?Q?PvMjErn4w//YkjzaTnGWeZoOJnLtg8ki5D5RwlTfB1ZSFzd0pq8+oxGKPgwg?=
 =?us-ascii?Q?arhtuMlu/dh4oIZg8JjexYicSzaJ7a6fuobip21pPA76ycTIOmxKwkG8jCAT?=
 =?us-ascii?Q?3naLpZHwXzRwlZo5Kml6Za7SC/MvKzvPHqnn7tDplbMNxH0h+FiTN2DqiFgn?=
 =?us-ascii?Q?85QvbHhoFPVFDUa30NJGL7EvRwprav3q4TVfni66NxKclQJu+O/qZgMmc2dg?=
 =?us-ascii?Q?symeUiQdYg3UpfWo6kXL7+pXnKpJi2+XAWbP6Gzz/eXYd1Rg/7Bqh+JNDwje?=
 =?us-ascii?Q?Wu1+5DTnPL/mUsjn+FzimuZr5Y8eALqB1M6AThdpyjfMfw9PSZduuEsEn/+p?=
 =?us-ascii?Q?gPM9HsrzJzVtBcPFX6hFOSMijjD2nUlZpib+r32VUQKu0SVVUjhpZdyJVz0/?=
 =?us-ascii?Q?9Ib50Oi7/Yte4sWsurnz7RsHeu8Jb9IAVIAErVvTrjkemOetkYhR9+T3Lme8?=
 =?us-ascii?Q?1L77Lf0VnSIZVgKLR1F0lp7nY7FdWKZEpiUBTpXUi+EIHBWCv98P5C/a8CYk?=
 =?us-ascii?Q?TrWHRfrI/RMytjaNFk6egsBRyto5qFeM+fUofDU8wF+ZunnFkd/IWbHzxcPM?=
 =?us-ascii?Q?3oUitPyw1StCx6KUJRCVKg5GE5YOlWYooLpaBhOBfsupr0gsJ6YBU6Se14Gr?=
 =?us-ascii?Q?k+Fx8NqbK51cjOeoXmUD9xetoSAakicVplEZWB8s/RCrZYlz36ZkPpsQT/OM?=
 =?us-ascii?Q?t0FwddHvGz9uOXC7WHqAC9KfrWpX7Q4sYM0qIkS34N1SgWlylz17n6j2eNiw?=
 =?us-ascii?Q?U5giezjTIBaW5g81ZKbfW0PbP65SA7wvq0v+ccsi9k3jG7n5tkLucvM0A0+W?=
 =?us-ascii?Q?6LwPD69e/yAoxykptv9VgU/qVd9cvc1mbLPzq15zEV3ULjK9Dy05/WdvoI2N?=
 =?us-ascii?Q?UOHmWxtN/Vox8xO0lPd+7+zcIvBBme9vCVQR9OuZK5r+hQSEsypcJzrvpcxA?=
 =?us-ascii?Q?Q2joHb9tNCu840navKbSvJWoKbOTDEEIFaLLgvYT62Uyn85NnRuvOvjEGB6w?=
 =?us-ascii?Q?gAN8j/CSE/IK6c6VUnBPpbuF+IadKxLxcb5DfnYf3Aqr4rfYYQj0TDY7UCSl?=
 =?us-ascii?Q?MKhokZ5dYNimWhYsTMJB6C1iYTOHCtvqyk08UT7Fv1iyT422PSkwzTmU984u?=
 =?us-ascii?Q?JhQ73/kU7iIcdXgCtp8n5g88Kpz0kReldV4rThfc/EgAtN2ZnFOyXuEbkk0q?=
 =?us-ascii?Q?Rh3Zj1et9w92j0bX+kjkneGeZUTLmRortRT2QaV97phfnxNeN5usGY/KGq1M?=
 =?us-ascii?Q?b4OwY/n6y8p/95NT86ha+x9meNz2LM+/Nc0aKoeJWH/5XXkq7KbYmtXrL9YG?=
 =?us-ascii?Q?27ZBNiCOl6MF2dY5yVbkWpMGO9+cKOZISX6m6XYp/l8Cp1m7ktGvjXesQxTo?=
 =?us-ascii?Q?9TRDacmGQ/1zvFAZh5rpFezJecrjsEVRZ02mKOyLOL0y+Ty1OngmoghkRxZH?=
 =?us-ascii?Q?vTfKrjQ7YIBHhG/gkBF2cmiV1GYlNXlYJRYHrlyEI3uq3YH5glipQ5jP8n0o?=
 =?us-ascii?Q?YXfL7Gtcd22o0cIyL0L1FQwRwiJF7lS4I0sg2gRT?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <891DCCCA9B7AC347B0BE10266DDAF2F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90452df5-becf-4d0c-0fe8-08dd30d1eead
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 17:20:36.6951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /jF46pGKGf+KJC1UA8ufrIAPY39eVpuO8K92gpLjuYvsj2B1XRB36+fiinnov1v2eNKR17/vGv4/fNXJoqbGxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 17:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209628

On 8 Jan 2025, at 08:42, Alexander Kanavin via lists.openembedded.org <alex=
.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> Drop pidfd.patch (upstream significantly refactored the code; the patch c=
an be tested
> only with very old kernels; upstream submission has not been followed up =
since initial
> MR creation).

Not quite: the requirement is that the toolchain uses old kernel headers, w=
hich is what the Arm binary toolchains use as they are built on RHEL.

However, upstream has actually merged related fixes, so I can verify the ne=
w release works easily enough.

Ross=


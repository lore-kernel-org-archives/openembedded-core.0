Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35597.1793888853134098578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 06:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UgjHM3rq;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UgjHM3rq;
 spf=pass (domain: arm.com, ip: 40.107.162.23, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wqispAAEisYsttTiikUdUGKrGG71xBuQFr01goTbMwuhezdhHMwIs5UcURPv6Q8XZjKBi7jFWNwBO/7i6n2NSprHvCQFzZxonhcEoV9doa2ypKs8yD7xEDiiZnq6Rnz665XxTMLGK0lG9GC9uwWZ6XlwIpryRgoPw1LxrLZBiC6DY6ZLcgXmvcufa01381KAObmQk4ZgsVC+lvHRgKv0n6lAkD4ETTv8kpAm34HCg21Bto7dd7R+Rv3iaz1KoLsuMVn1OVJ9jW+NZ8XQ6zuhYWPg+bQNvCKlf6urkTJ/66B07b8BtLXvycstMqLbJZI1uSdXcL/biW+UM70g/+AgoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tf/m+43WYZvkBgTaynmpLLzH5A9XFBb3xhIDu8BUkg=;
 b=mfRwF1zg9Cc6D+KpZTWvXkkqztDCT9oRlOpTN3BjlZwYnIQ/KE4hF9hFPLAoHaDGVPpwu48UBLR+g07mXWt86a2eZdNPVHoNuMOxj/j2oANTK7ojUB/Om3O825GYKJXk8N+7fZBOQ4V6uouypZJM+WcwNQ8LhajFSjIzZuqIR2pvF3vB1BN+5sszCNMHMc/h1r7CxRmHhSl+IyM+1k0jhuk2VuOGQm/r+fLI+3zx7T9a66+FbwIkfzqUmWgdLPo0W+xW1YAya90ckSeL1NPPyXO0nv83WTq21Ilh1x/P+bjYg8saKfuJz/g6cM1D8N93KWxUBIBC0cVyHbD6kW5DaA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tf/m+43WYZvkBgTaynmpLLzH5A9XFBb3xhIDu8BUkg=;
 b=UgjHM3rquGdVwVocdiEKPdQDOdaxMgNR8muHwBpm67waGCc0geGh1V1ehBIOTD5s6FWdhKN62P8/xwItLTPU2nuSbmUWlesvrOfYYdc7zSv3nflXzcNXRD6h0faA9ukJC4tb61om/ihpkF+SqbLQ6OuuEYSQTGTv0PlMKXvWybg=
Received: from DUZP191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::28)
 by GV1PR08MB8500.eurprd08.prod.outlook.com (2603:10a6:150:84::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 14:27:27 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::46) by DUZP191CA0017.outlook.office365.com
 (2603:10a6:10:4f9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 14:27:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 14:27:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idrARPO9sx9ERbUzUo9Cz6WQKWV8I8ldehjEQH2/63RJ58U1G31ImdowPtiU08tDc7vqxr0xz36kHTJZ4HyVx4jxVVz5Eyf5TghSUlwsmgh767L94UU7G6FC/F4CbkZG0kFkjXN8QGSLNsdHhW5AyK7i7TDRruJXCoqjtHV3kY/UmskDZX/yNoFK48tPGunHxiYLDor5j5CPR/JC4evJyOedjAQ0D8ekqYooXnZ9cH51iFGtlb/5PghiGoYFzWaV7+nwC+dwQYgjWuEvUB3+Hr5wSCQQUbbPOAlWtIv9qf99PolltHV4y8TfSYYdO3pmKMurrERUUirzLbWMeA1liQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tf/m+43WYZvkBgTaynmpLLzH5A9XFBb3xhIDu8BUkg=;
 b=UzEhBJoJp0LrMLAm9UkO6W5jEN6K+/338N1M/wJQ7XMNKKQgTTAdmfsFK6KKU4ln3ivo/23LbbLYmRVrQ9pOs6Zq9nUnSjd3PQYrD6yZxc8R9EVdNa306W1JgpgTAeGQKgWYjwguSFkVDTbP7ZiKpRMaIaE/TfaPFs6Qh47SRBT6vxSFuGM+6tHM3cx/u5gH5iHI5HUtyUc6rfYBY94I26Wf3U+/ZhtjBHK4IUIpqZGqR0iL11ugVusWTKuYXsH+CuRJbBA+bphA3UBxvRjDxJtvlMPNbMosJ8QQw8SRRdcVFhiChNEJbckkRr58SUu7MwpMULcPX9ASEp0zzZZKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tf/m+43WYZvkBgTaynmpLLzH5A9XFBb3xhIDu8BUkg=;
 b=UgjHM3rquGdVwVocdiEKPdQDOdaxMgNR8muHwBpm67waGCc0geGh1V1ehBIOTD5s6FWdhKN62P8/xwItLTPU2nuSbmUWlesvrOfYYdc7zSv3nflXzcNXRD6h0faA9ukJC4tb61om/ihpkF+SqbLQ6OuuEYSQTGTv0PlMKXvWybg=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by AM8PR08MB5858.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:26:54 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Thu, 5 Nov 2026
 14:26:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj
	<khem.raj@oss.qualcomm.com>
Subject: Re: [OE-core] [PATCH] libx11: stage the X11 locale data in all
 sysroots
Thread-Topic: [OE-core] [PATCH] libx11: stage the X11 locale data in all
 sysroots
Thread-Index: AQHdat4LXzGKk8h//USqbCbMBwp34rcfjZ+A
Date: Thu, 5 Nov 2026 14:26:53 +0000
Message-ID: <A99758FB-3233-4677-9D5D-D9424C7B98D9@arm.com>
References: <20261102152246.3236176-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261102152246.3236176-1-khem.raj@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.3)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|AM8PR08MB5858:EE_|DB3PEPF0000885F:EE_|GV1PR08MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b51b3be-7828-445b-0078-08df3b48eaba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: ej5Hna+jJO1u8z7DV34+zXk0VGX9d4dpI9lPxPHVnU6bWXcsKCnYoCIU8nRjSLQWAinsW8WphVu/bMF6bRTZyN+rYsBsZZ8Z/q59gHt9qYQBQ/9aWiHURWaIq+M++Spl9X9B5sxxcIccEDcBj/B2Srhir2O+5/wTjPHiK4fsMfq1Ao4VhRhn0mZwSbRzpBFDO43jhvRpa0dATlWfkddJmU1/S2ZSrfQgn3dtX9xSt6IolQOpz+kvWQYfsTm89mFuYeuQWpJgyuf+QDY2xKvHYTpD3wAMS9d37m/+/4sb4PbpD4KNdtrgpeoIGEdmuNnUUuRZH1fVAy5dAZ3IUptgQi4vOOJ/3AGNI+S8t92rDeTmGcBjK9OeTTZOG1EdsA/BJSJnFCgbC/FBljWbo6wOdOzkcGot03E93SecKg6aG5GYLeTbk7IsXDhOhxx1Ibu3Iwc2fal7x8OAihPVjqu14Xe8/HGRYQlcZ5R9iOQXg1pEQ/WQ+z6AH4mPAr3cs3hhzjqs+4rGVzihiTMqPeMHX5T3wgxp8AxytCr0GRiFIv9DslBVj7lopzku9YRjC5SPsR7OYR2/1rMllZlB+aQivryDguCCT5h/yWS+sgO6PRVZfTYfq50226IVFNcx/CHvcNlb3E5ItqO2+2RA14zcTtsZTKveiOtPgVXXFEpEkZ5YDCS96f2LYsG3weZCKV/cuuHaZkEeL6oraXhCRbHolQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2378DD9087CE5645B6FE5FFE2F46CBE8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FgUkUIUQ0rQjmgcYBBwvXIwl3JDjhjGLGPaqyYgav4JvskODBv1DVwe0kLo7vTqnzKOjP5SHPlwhTl/5Xb9Pr7kHhZqhYgkaeexizhlht15Tcqtcqc0gbhOUBS4Tzu6auM8+crWzofC95TTWnYtmFFoHGmTfD+ycAPT6kAubRmuff/3Ul1NqBrGaCT8V1PiF13cr8/dnjFXABrlLa21kNiioP6tzB+EoUlgvqt+8KF7rEgB8kauQ0Cyh7LBx4WFw0e+bBMV+AqruMznglYoe7gomRKqHddzwFaWLJCKyF9ALtPM3RYftMGUSz7HZXcSZDQ32oYuGX4Sha+QF75XWoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5858
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2a1400f9-f0fd-4136-d6d6-08df3b48d6e8
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|14060799003|376014|35042699022|1800799024|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006|261022105027099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: RG24Eev/cYePhbsQAixzhT5jdz12XgHzLLZRam9xI5y/53gSBDcZ6j2sEF86jDGeNJ4aqfCEPZdRLJwmgotuqXiHSZYn/j6IzI+vec0ojzXtISOJNZ+EPpJURIhESdKgDM0lvFpS0GP+bIMtS+682KBC23aHF516WNmEGg6cZF1RFIl8aZmupZWC0Z06gDi4UeRlP1kJjBcERJlrRHrdDyKlFfjUbtEiXbeohAaUy7lR4OjF+pRS4jFd7Bp79csZZ8x2z7roe8Qv//sqBbq6s3ychqR+97ghXKHcrvd4MTVtLYGUR+I+mhDmHprwvBmQjRyHc5ohV+z6IFSyzRKlzyk/nFrwoC2lLKyGpBuhkV+v/O18DmCkVngPB+vSdL6TdZstlq8NMXEw3010lFbizlyGxthjs2/wG9AYi4wjPDpR1M+ErRJT97Uidvylu30JRZOdczxiEx3dF6jXugCNnkxQuGpIiOahFxor2nBvHAoX0L+Y0WIWf8wNsYlP2YthgSokHUPFtPXTwYyasII0Sqs12jNSP41NglVgZz/e1wAxmwUMG7tI6PW6R0tBB1l1aErTqTtuHqnphrfOl8ermJdzdZplyggE6KOWCBOcjrZ9fLBkk+zPvHm+8sYbO4rbGTp6d6B/Oy0AQF9guoklNJFls6ZJcJYY81PWKXoxenfLS2f+PT80/Ecrb8+2tY9rhCmJ33Qt7k7domWLw1d9GQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(14060799003)(376014)(35042699022)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(261022105027099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UMPOEE1dUftT2mlxVkPzqa01NsPbtn0SZK/lP/wrNzqntXyTIPrfI4/SocMxZnO0DaHV4QlPZOByIuYwnrQD997+y1MLUfdfp+Uu2sPXrthjm5MbPhByN7PfwjvY42xqyycK51J2hiQEQkbL8DFSd6/PapdxBiCCugW18VEjVNC/SyHv0Os2rmn/AdnTzAKw/wDVCDkypuWaopevY0eaNnKym+fU6LvGAe7KGuj1DDoShjd7mdq7dhgmRSAHEqXIb8emivun6dKbh4PjMPv5zNwf52VTEi6LoGqeXJr+lpIvQSj9f8d2TwPwe690xtcJJFix/xWMVsppPF5YNa8EcxLurg9u4DZeJPcKHUPB+SCuxj/s3AEO2aMh+1Siug9ymD/hJj3sk4u6E2r+lrK8+uOFPIBNzK/nGarVwl4FTLlBvExzOr9Q/f5Mb1VLtAJh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:27:27.0637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b51b3be-7828-445b-0078-08df3b48eaba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8500
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 14:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249557

T24gMiBOb3YgMjAyNiwgYXQgMTU6MjIsIEtoZW0gUmFqIHZpYSBvcGVuZW1iZWRkZWQtY29yZSA8
cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4g
LVNZU1JPT1RfRElSU19JR05PUkU6cmVtb3ZlOmNsYXNzLXRhcmdldCA9ICIke2RhdGFkaXJ9L1gx
MS9sb2NhbGUiDQo+ICtTWVNST09UX0RJUlNfSUdOT1JFOnJlbW92ZSA9ICIke2RhdGFkaXJ9L1gx
MS9sb2NhbGXigJ0NCg0KVGhpcyByZWNpcGUgaXMgdGhlIG9ubHkgb25lIHRoYXQgc2hpcHMgdGhl
c2UgZmlsZXMsIHNvIEnigJlkIHN1Z2dlc3QganVzdCByZW1vdmluZyB0aGUgZW50cnkgZnJvbSBz
dGFnaW5nLmJiY2xhc3MgaW5zdGVhZC4NCg0KUm9zcw==

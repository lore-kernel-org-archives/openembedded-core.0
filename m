Return-Path: <macpaul.lin@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE70C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 08:56:41 +0000 (UTC)
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 by mx.groups.io with SMTP id smtpd.web11.16515.1752828996882488332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 01:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=hTrvAPSO;
 dkim=pass header.i=@mediateko365.onmicrosoft.com header.s=selector2-mediateko365-onmicrosoft-com header.b=En7RnemP;
 spf=pass (domain: mediatek.com, ip: 210.61.82.184, mailfrom: macpaul.lin@mediatek.com)
X-UUID: 199e78f663b511f0b33aeb1e7f16c2b6-20250718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=khHtO5MKh+2HjoBJPG6guitD6oXvmSzCLDBnJbibxNY=;
	b=hTrvAPSO95KIHKUaSjy1VE5BVKyRcvYwvAkvlD56m0r0sXqXFsbzGQJi/Tg2I4xk+gg92qxvUAbJcz2li3DUgwTRkGPuRPaddOI8qCt19HeJoReA+JNao1gKPUrr0lZYlvUFnaOZ3X6LhdYBEjPBAKDDnfEkZMLwyyzNiRIBDm8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:97a21369-f940-4d5c-b4ff-7c50ace6263d,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:c83cec0e-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|110|111,TC:nil,Content:
	0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 199e78f663b511f0b33aeb1e7f16c2b6-20250718
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1478587514; Fri, 18 Jul 2025 16:56:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Jul 2025 16:56:30 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Jul 2025 16:56:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bespjI3g9H7rUdVdMibd1y1w07z624r2clUn02V0hzByRnwb5wCxf7LFhEJmDr1kNV01TRmUzx93TCSoI2uebLKpvVvf7vOq6VhOAbe2nXDSFDPHrZhP3l7R2sHB7E+J0yawBgpNqvnHWPT1EI1u5prK+3hkCk8RSC+bMmjHAxmM3DNpU6rMGCSgYwRQZWthUnX7HZNi6cg+PnOyqtBU7uA++UhYQiqZz993cLciYhZh1ElngJJdbRMZUXIpeK3QozUrGIEpwvQBH7MQZOngSV3VvfTAQC/scqWDjcOq+tzGl1XRNyZ7q31vRnFBEUND9/f++KS9uT97RW/gxgpTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khHtO5MKh+2HjoBJPG6guitD6oXvmSzCLDBnJbibxNY=;
 b=LLJQbGu4q9lYuP1CPN2UZW/2XxYlOXaXceSCiU3TArRhDx9xxbRDFWwoaCgjPuFk5gkkU1Q396r4gLV9Q7GQWYFdAA5+yL9KPE1kOPk7M6Q7eZoIZHJYXveFQTF2OnRRN84kMDdgWlMeIFxlMMeWb80WMuyYdLiTM3OlAhYLOiMg7/pEU+JZUl7TD15J69aDzlq7Jz6pnLzuPFqAY2O/VXkloQQ2nx7EI2H8XgR+qGxyCcNIz0Ztg2X6hK0H9Zk20HZ8d0nnYwhX2UpzKOrmF7uCpsS9Zf+zhIdOLqWaVd49VzYR7KWuLLnTuvM+AjNjdTKvVVQO7uob502kJ0G2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khHtO5MKh+2HjoBJPG6guitD6oXvmSzCLDBnJbibxNY=;
 b=En7RnemP7xx8v8VQk1sqUcD7z0yVnn1UVrrPusEuSwtV334oPEv6VN9mbn+aiAZh1ASzw30jQrzroU62/2pFW/f3IVBaGLglMVPCMFpLvHprw7k1qflfZlo7PzBziO6XwcXoyUT3WNAi+osrpwr6l43y5u3tWR9q20MAYE1c94E=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by SEYPR03MB7416.apcprd03.prod.outlook.com (2603:1096:101:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 08:56:25 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 08:56:25 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
Subject: Re: [OE-core] [PATCH 4/4] arm64: defconfig: Enable UFS support for
 MediaTek Genio 1200 EVK UFS board
Thread-Topic: [OE-core] [PATCH 4/4] arm64: defconfig: Enable UFS support for
 MediaTek Genio 1200 EVK UFS board
Thread-Index: AQHb976KjOjFV+6tPUWGYeRVphNVi7Q3k/2A
Date: Fri, 18 Jul 2025 08:56:24 +0000
Message-ID: <145f9b37aed9e49989a5c7ada34c43702a082316.camel@mediatek.com>
References: <20250718083202.654568-1-macpaul.lin@mediatek.com>
	 <18534B5BDFD1E7F3.21936@lists.openembedded.org>
In-Reply-To: <18534B5BDFD1E7F3.21936@lists.openembedded.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|SEYPR03MB7416:EE_
x-ms-office365-filtering-correlation-id: 8cef644f-c10e-44e0-b89d-08ddc5d8f9ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Vnh6ZGp6dDFWNlA2R1h5V1F5SnRBNU5KbDJuazFyZnl5cDVYWWsxd29VQ05T?=
 =?utf-8?B?RnZqaUNYNjhSdTIzU1N3SDd1V0JCYnBTMEFmLzhNUFY1cW1sVTZOUEYzSFls?=
 =?utf-8?B?TWs4a2gxOWo5TVVYU0NWVEFQKzdJNGhqbVpnN3RUMzBDeHBPNVpUY0cwUFI1?=
 =?utf-8?B?ZHBDSis1dmlzRHZWWkZIU1htSHdNVGxZZStTSUExWnkyNU4xcmZmVXlrNURZ?=
 =?utf-8?B?d1RYYThuTzlSV1ZTeFQ4blltUnI5djdZSjNxaEFia3NnL0R0cTBLeUJZSGdy?=
 =?utf-8?B?d1d5K1BOL2VqZUMwUE1SaERDaE52OSs5MS9WWkh2dENmOVhRcS92YUVTN2tW?=
 =?utf-8?B?ZEJvZ2JUb3ljUnFwdDFReURNNmw5MytlVmRvc1ZZcnQ4bVNQOXFIenFmRXFS?=
 =?utf-8?B?VkQ5Qmw0M0tCSFY4Q0hjdGVIeStnOTRCaWt1MER2YWVWR0ZKUnIwQ05mZEQ0?=
 =?utf-8?B?NU1SWUgrcnVPWDloOFk2RHdSZWFyRDV5U1J3cmVMUGxhc01tNThRUnNOWkFY?=
 =?utf-8?B?YTJZK0x3Z2RRVHJXbCtxUUdFM0NkaCtwbHV0dktycUdWK256bmxuajhGOXMr?=
 =?utf-8?B?SkttQzFVRUduei9BUThwWEF2ZVR2dlJPY1JaWm9ydzcxcDRuYW9Ec2U3ZHB0?=
 =?utf-8?B?bCtKaDVhQlpaY0hiUWlQRzQwM09nTkZKcm03NjAwbUtrK3lzakxiWjdlUGo4?=
 =?utf-8?B?eXR4R0dleUNxbjlrU0ZUYktxM0h2dXlidmR1d1M5WDBML0NlVThVTWFJUEdD?=
 =?utf-8?B?NXJ0ZGFmM0FXK1FZSjVOamNaZUVGSGMxQVc1U3NmQXhVOFhtTC9xbnVNU1RE?=
 =?utf-8?B?dlZSdXkwaW1wVmxvLzZWRzFSWHVmQjNVU3VoNFpPandxQldrL1hFVjVFazM5?=
 =?utf-8?B?S1pEQ1Q3TnM1RXpiNHE4VFZUR3lMcjhIS3FTWG8rbDVNRDdCRWh1U09DMllE?=
 =?utf-8?B?emhmaFh5NVc5elpnNWNZU29mVFhpVEpmVUU5cENQZnUySEVRNFpNTzZQUFNo?=
 =?utf-8?B?aGtXeGFhY3dGU2VWdUVCNWJLM3pSR25KVVpZeExpcGNpZmdnM29aRCt3YkpQ?=
 =?utf-8?B?bHZza0JXS2pDZnNEZC9IVWMzeXVsK0Vub0tBNWNDZldYbU5jVW9pZEEwdS9k?=
 =?utf-8?B?NmY0dVB4YUdDMUJUcVNlK1Frck5sdENDS281ZG85SkV3ZVFlQUtyRGxRK2lt?=
 =?utf-8?B?dUJtZGR2UUVEQks5eUJtVWl5anVVZkMwVVVPYTlZZ2NRNFNnY3dGVklBeW5P?=
 =?utf-8?B?b2RlRE92YTJGL3UrTXp3bGZDREt2ZzlLSzlTT2toOHQxK3JCS3NaVU1ONWVs?=
 =?utf-8?B?OFBMYXMwYUtqK1l2SEVtL0lWYk5CUUkxTVp3UTJ0UnBEWjA3b25QVU0xTFRw?=
 =?utf-8?B?UnRpZnZmaVhYalpHRGVzbWt5eklna2l4ZW42aW85YUlzYUd1SG52S2ptNkQx?=
 =?utf-8?B?bENGYlVXWEk2TCtMNDc0Zkh1amgvK2h6WEIxbVJuVXdibkZxMEhMVEhsRElo?=
 =?utf-8?B?R3BGTDB0Y2lzcWRuL1lJTjBzU1ZNRFg0dU9uUjdSL3RQVyt4OWpiY0FXQ3NJ?=
 =?utf-8?B?WVRIZ2liRWU4RlFFY0lpMWYwTjFPMFFaeWFwVFF6V05TbERQckNBc3pTTTVi?=
 =?utf-8?B?QkE1aExsQ2xKUUU1UDFIbDhnOFBzNlVGNm9Ja2YraWtUeU9nZEFXdmRTMTcr?=
 =?utf-8?B?R0lOcXlUbVlWUk9uSDYxcWFhdmNsUlNyWWdUcVVreThBRFBzR3h3QnBSQW5I?=
 =?utf-8?B?QUwvcy9UZ2luK2VVT3pEZEtmbWVyM1FVZnZtbEFwT2NONjNEQXhHVUVhMVox?=
 =?utf-8?B?VHFtQmtFZW5GSmpUMnp2QVZHRFBCcGVPMUNmWjloYThXSUROU2JPYTRGemY3?=
 =?utf-8?B?L0pwMlNRUjFOb0ZaNWhHZm5heDB2cUlUQzQ5ZjhMMlZXMlNxTzR3blNvcEkr?=
 =?utf-8?B?STNNUHZRTTFsY1hyOWNBaDBrYlNvMkpmYnlEQ2FnN3ZHNmpuUG94Si82L2Fz?=
 =?utf-8?B?RGF2dGpqanpnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bU9XRHUxU254SEdXbEQwd2wraExIQkk5Tzc3WFpRb2NmV2szWE9yazgzU1dP?=
 =?utf-8?B?aE8vYmt0YndzckYyVExMY0M1RVcyUVR1ZjBRZEltZVhwcEtmaXZ0TUFXQTVC?=
 =?utf-8?B?RXlqVXRTZko5WjFpNUNmczNMelE1YzVaSW4xMGxsemR0MnNkMU5EdlBCbTlv?=
 =?utf-8?B?V2RDZlpCZ1gyNnpVMXRHdSt2L0JLaTVLVWxVMjlHM0I0YllWdWRBYld1RlNI?=
 =?utf-8?B?aGxoWStWZVJUSm93VjdpdWpmUERNc3JaZ1NVRStRUW14MEtuUGd6R05ISHFa?=
 =?utf-8?B?dkZYaTFzbGg3RlRMcDJiakFWQ09OS2RvV0RpT1EvV0xIUDZhelRlczhSakZa?=
 =?utf-8?B?bUpRUFYzVmNjRXBQenNsRmZBWEV4NnRKS0pMRVExckJPcGRHR3EzWHB0SXFk?=
 =?utf-8?B?a2dRSDNZRURvRTRFZ1piUGszSTQ1S3F6Qmo1K2FSMEZVYUJkMDdLNGJoem41?=
 =?utf-8?B?LzlzTkFGNUVrMWM2NzQ4ajZ6bCtZNlFhQUJSNmZtMGNrQzlOWm41Z0FOUm5L?=
 =?utf-8?B?eCtFS1BpcmVpSHdhY251Y0VER3J4ZXJDYmFPRmxIcW9RbWEwRDlmNENNTnU4?=
 =?utf-8?B?OFlqOUZoMDZtSVRMZHVkVE4zdUNrZDhaV290SmxoUTV6WE83TU1JNU50U3Jz?=
 =?utf-8?B?TFczdE1LVGl3TlpoSVkxMHkybmNESmRtZU9heGtsT3pMMm1SUE9lZnJTVFhQ?=
 =?utf-8?B?NDFrY2hhSXcyL2xFdU5rSW1Nbm0xeGpucHdHRlNvMlMwbVZiS051MXhCWDho?=
 =?utf-8?B?VkhjZ0dHK1hWZE1YSk9oSmxQMkxydFo5S3FFNTBsMm9lU2lwYy81aTZBdGRh?=
 =?utf-8?B?K2RXc0RWWTI5SUZJRDVxTHkxVEpsaEk0bWRvYmJOc0VmL2hRSWE0NTZpdDUx?=
 =?utf-8?B?QU9KdTR3MUNnNVJlc2VXVFVqTHRZZCtGdDlYZVY2dlpWUi9NVDNtZk1BZ1Z1?=
 =?utf-8?B?OTh3amNrRWg5THdSYk9JN2o0aXFZNml6ZVlXU00rN0xaUmw0MjNGTCtVRXZR?=
 =?utf-8?B?ZXlDVThNaVNiUnRBbUxuSzFUTGx6Q3BkNS96YkhQTVBRblVaK1BWRFhYU0pL?=
 =?utf-8?B?aWQ3Qkt0Z3JzRitxU202bGxlc1ZhZ2R0Mm5LdmkyRXBhWkJuRkljaVNkdSsr?=
 =?utf-8?B?Qmh4ZnB6d21xbEJQV2o4R1lIREs3czVaVU5vbUovYVdaRG1SeUFYZjN6N0pD?=
 =?utf-8?B?S1YrZ0FZMUp3UWVVWGM0d0tDSzh3eWZzVkp4US9PVkt6djc1eUZGQlRFNC9n?=
 =?utf-8?B?L2JDU2NKN3BXQVZLeDZnSHVwODF4T2JLeVViUk9EN29BRDExVjNNZFlCVndD?=
 =?utf-8?B?a1VDNlBnVVZzcXlIR1dvVDd1NTdQU3V6TnYwYUdnTWgzcTBCY3hxL0hWZjdH?=
 =?utf-8?B?b0RNSDI5VmRKTXJPbm5uVXJHM0xLbHdqS2lCc2dxYXdLNTUyOWtGTzNRb2ZK?=
 =?utf-8?B?dkhja0J2N1BldGl2cjJ6bFlkT3BqRXNLK21MTHI3TXJ2cTJxWStLVHM0ZnJ2?=
 =?utf-8?B?cldVQlpBVUpzUTJleTNZaE5Ua3Z5b1grWHoxKzZta1VwNWh6MTNpSEZNNGlj?=
 =?utf-8?B?dzIrMGlXTTdIUnd0RjVreEE5elMyalhjNTNtK3p4a1ZPblE0RlZtZXE1RzdD?=
 =?utf-8?B?QytXSmFKc2M0ait1M1cyVzdUZjlBY2dzQWpZTmpWS3ptSzBrd1NhRlU1MU96?=
 =?utf-8?B?a3NzRFgyZ0hZWm1XVUlHRDJpK282Ty8wL3g4NEVNRVVDak1uaFRmdVRFdVBo?=
 =?utf-8?B?UHU0UnJEQVVWTUhmQ2dIT0xDWlJrLzJFM2w4Z21aanVVeGZ4NDZqUE52dUVX?=
 =?utf-8?B?Vmdkei9VZi9Bc2xtNGV5MEtqbGNMYkIwRzlxS0dCMHE3dVVwVXRxZG1telVs?=
 =?utf-8?B?S3FKQ3R2YVFxVWgrd0xmMllGMkZuTjZIUDhTd243bjVNeXF0MDI4NVFEd04r?=
 =?utf-8?B?aElxaHhyTGIyZWVHQkJoZUpmckhYN2tQUkJmdzVLTC9PTGhmaWpFb2p2bFdT?=
 =?utf-8?B?cWNvNjluT2tGM0RJMHJwNGo4Tzg2RnpOWDJTczJVWTFvTTdtN21Pa1hqUG13?=
 =?utf-8?B?UWJxajdySWd6YmEzZUc2Q3ZRaW9XcGNLOVcxT28zZzVCNjBzdmZ1MWxJdHNS?=
 =?utf-8?B?czJFem9ic1VkVjhHcDVkMldlTnVpU05aVUZCa0R2eEwybkhGN2xCMldzdk05?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02CA041F29E3BF42AB83A4E7EE9CB8AF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cef644f-c10e-44e0-b89d-08ddc5d8f9ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 08:56:25.0339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ReCbV2azOcOXGa+l32cb1kj2o7VM3nIIK3ynywiBertXdcgsOPE/zWNw2L4mUM0ihp8wnvKT5OXPrA/w5eIMCgGckJCahi1EOqmc45v1Hbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 08:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220587

T24gRnJpLCAyMDI1LTA3LTE4IGF0IDE2OjMyICswODAwLCBNYWNwYXVsIExpbiB2aWENCmxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IA0KDQpTb3JyeSBmb3IgdGhhdCBnaXQgc2VudC1l
bWFpbCBjbGllbnQgd2FzIGluY2x1ZGVkIE9FJ3MgbGlzdCBmb3IgDQp1cHN0cmVhbSBMaW51eCBw
YXRjaGVzIGluIGFjY2lkZW50Lg0KSXQgaGFzIGJlZW4gZml4ZWQgYW5kIHNob3VsZCBub3QgaGFw
cGVuZWQgbmV4dCB0aW1lLg0KDQpTaW5jZXJlbHksDQpNYWNwYXVsIExpbg0KDQo=


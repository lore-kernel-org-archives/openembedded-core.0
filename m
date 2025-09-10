Return-Path: <macpaul.lin@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A032CAC582
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 02:52:37 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web11.8147.1757472752399760639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 19:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=UvroGwB4;
 dkim=pass header.i=@mediateko365.onmicrosoft.com header.s=selector2-mediateko365-onmicrosoft-com header.b=o8tlZ3mU;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: macpaul.lin@mediatek.com)
X-UUID: 2a3943a68df111f0bd5779446731db89-20250910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=v1aNFXSYefvwyf2M6rzh94JEXpExIAwCYj7EwoaT1XU=;
	b=UvroGwB4COfzYuP3XzNj+tRnHeGyeBDQbqp/5gbuTWs3H9DDdNTTwKkSpKkiStzqnnaVV2cHobs3vCNJzgVFAL8mg25hRVkstOKX4K3+QoCwAyAymqDJhz1Q7Ri7ugkIX7RPIrrygShafqTHKni5qUGZz1vMuPMhzv3dTzP6Bkw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:2ed556e2-0a9e-4450-9781-88bf931c4f91,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:6cc6626c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2a3943a68df111f0bd5779446731db89-20250910
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 984222917; Wed, 10 Sep 2025 10:52:18 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 10 Sep 2025 10:52:16 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 10 Sep 2025 10:52:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5I0B4W0PB2qbsJyKmToeK+2uAQg3qNdxq1EA665WVIT3pgoq4pLcDYs7HsURPuRjUyKPqfHVcAvQ6yQE8X4iyly9FCFlehH0NODPwXI+FfUaBYdaE2a8+T1EJPffeH+SBCPTRXcssz2dkNToHR0jHsVKeAGATGv5mkIYsva2n2jQWykojUfxGj6e0LPgAr+UfO4x/8xnefE0xsIU+7OGM0uAnKPH533gbVzN0c+rnhOnW1Q9h6rYqP80cIJhQTkxksLuT6by+F3f4E+xMiuqfh8j0FMoOH1VNKLduBBLs3boSvktBmh56t8LdEzoVJqS8SLXfsKOJSNmc7g04vK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1aNFXSYefvwyf2M6rzh94JEXpExIAwCYj7EwoaT1XU=;
 b=mgs0Awf//MVMei7j9FV1wGbZT9uX6PvzU49HHmcAhvcUGAVXAUifvFxyGVqcpYSbsZ72clnCQIBO+Pan1Rw4gjpgr2J0zjQFSC5Bq2JAr+WdeBorWP7N2tKWSXpmu1TRNqeuz61hNG9IqmrcK2PBjvE31KfAm55nipQjRzvop8tBmgCbIMQTADDax+5CIwF2aRlyqmEbPqEYRGea7VDyOe/xb5yM9ayH5+24xUENGLRV6GO2/C+lhQt7rjPdGnpdplA1LsRashC6uSiHBh4wBtzksjaPyd6clm0N4CRPSy0JiHGMNoUX0l3uyGCQXKBdKcOd/qaY2wBq6keCON/kPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1aNFXSYefvwyf2M6rzh94JEXpExIAwCYj7EwoaT1XU=;
 b=o8tlZ3mUrHVxo4/d4b/in4Yp+NAiSdryjufZj2u2Q39oZoTt+J6F0seLURDVQJboV4/xkUssTaeYenK5abMYBYImDAbxpSXCH12cPHW8JrWMEuT1tWy6htTwFTnbe9PMHYUDxfQNS26bewi/zEriTKsCIoiDdTkZIRziBz/aaNU=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by KL1PR03MB7105.apcprd03.prod.outlook.com (2603:1096:820:d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:52:12 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 02:52:12 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "twoerner@gmail.com" <twoerner@gmail.com>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	=?utf-8?B?UmFtYXggTG8gKOe+heaYjumBoCk=?= <Ramax.Lo@mediatek.com>,
	"macpaul@gmail.com" <macpaul@gmail.com>,
	=?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
	=?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
	"alex@linutronix.de" <alex@linutronix.de>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [OE-core] [PATCH] wic: Add sector size support to WIC partition
 and bootimg_efi plugin for UFS
Thread-Topic: [OE-core] [PATCH] wic: Add sector size support to WIC partition
 and bootimg_efi plugin for UFS
Thread-Index: AQHcIY94hycQzWirh06LCgyRPw4H+rSLLloAgACKVoA=
Date: Wed, 10 Sep 2025 02:52:12 +0000
Message-ID: <b16cbe535ab4f0444d93ef91141ab60840889d72.camel@mediatek.com>
References: <20250909134117.2219965-1-macpaul.lin@mediatek.com>
	 <20250909183704.GA1381@localhost>
In-Reply-To: <20250909183704.GA1381@localhost>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|KL1PR03MB7105:EE_
x-ms-office365-filtering-correlation-id: 4ab683e6-9273-4176-0628-08ddf0150aca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QUx3NGphelk3U3NEbzZPZzFXQitJaUtyTlFvS3hTcDlkSFhWWnAxL3ZZNEhk?=
 =?utf-8?B?R3RlWTN3Z0JJTGJLYjZ3MDB0d251cHJvYnZyTkw0d3kvWU95WXRDYnJod1dM?=
 =?utf-8?B?aVJ1N0VjcDc4RmlreEpWYkxzUXRPMkNSZ3Z4anIxcmJ3RXJVV1ZIYVNRSDJH?=
 =?utf-8?B?UDFPdXdvS1Z0Z21DWncrYjNKdmR3SUZwZE0zVlNPTFpTdWkzNWNqQTJKOFJh?=
 =?utf-8?B?Z20ySENIZnFvYWdmdkZQTTBvbWNrQytXc2dHYmNYdTRpNmh0UWFuaWJqSk42?=
 =?utf-8?B?YlVQYjNWV21TTFFKNXRmdmpRZkRtV3ZlUHV0eFhFOHRZcmRtSy9FaWgxSEpQ?=
 =?utf-8?B?THNyalVWTkpHT1gxem01Ui8wY3dkTDRub0pGRFNvN0thaFNnQ1FvRG1VZ3Zl?=
 =?utf-8?B?b0JUWm05bDhTTFNiZ0V3eUNsUDFJNFV2dFJBckRKWFZqV2lrNVo4Um13b21Q?=
 =?utf-8?B?S2ZXTTRvNjBmdG9hNTFwR3NKVWZHT2I4ZUM1SFU0dDkwbUpwdGtEUXBiYkhD?=
 =?utf-8?B?M0F5T1BLNEtCZnNPd3AzaGxRTS8yeXY5aXZqTU9tOGF6WEh1OGR6b1FGVldm?=
 =?utf-8?B?N01iYjcwODRIQ3pwZXFPM2VrdHVGV21KSDlveFZTb1lQRWgxRDc1ZE1DZWJR?=
 =?utf-8?B?T0JMcnJmNkdsOU81SlhBMDh2VlhRbCtMbUZWUVV3bkZzTG1VY3paRUsvQ2FN?=
 =?utf-8?B?enN3dW9OSmkxRGVlSW9wMjZJdm43clExWXBaaUppK0VkazR4bUZTajFnWlhw?=
 =?utf-8?B?WTErbnRQNmtVV3phWEJSK2JLUnlHWTJHN1VPM2h0eEU4ZFlWb3o5eTRHSGU3?=
 =?utf-8?B?RHlPTnJJSjg1VWxlVzhzamJuVDNVK2JOOFJCZVlORWF4bnFhVUNHMUs3czlm?=
 =?utf-8?B?cXdkTDB3NnpJdUtzUHBjVU1mdjFtWmVzcklaR1BhTzBNNjRBTGJCazFEN3ZH?=
 =?utf-8?B?QSs4SFFrcUlXc2x1d0FjRmNSTndGcGdzdGZVY3NnUEF0MjA1R2ltR2hOTkQ2?=
 =?utf-8?B?SXhPOUh5dlpSYXVzN3ZlNE9LOXJacHE1S0dLV0FXbXUrdy9aOTFuLzdIWFEy?=
 =?utf-8?B?WU9FL2dycjVUMnlFVWcycE1pbS8ydXZaS2Y4aU05MnVjWlJKeFAyK25IdS9N?=
 =?utf-8?B?Y3d4SW1TZkZhOUxUYmtLV2FBbEJUSjRoSUxkSUg2Vk90a0NIbjcxM0NiYTBh?=
 =?utf-8?B?RzlIWW1OdzJpc0MrZU5NR0Q2cmU3eGo4N1daTVpJTXBmMXE2bVJqYnZGZjZX?=
 =?utf-8?B?eXZQU2ZXTXhCc3ZXTjg4NDNJSDZ1NkQ4VlAwSmp3dkdxRWMyNVhMY3Z1T2My?=
 =?utf-8?B?d1lPWTZ1YWluTlVjTlBZc0t6NG5xUEFWVEt2d1F6MHliaTBuN2o3QnNxTjh1?=
 =?utf-8?B?ZGVUelhiT3RXNmUzaEpRbGhmZytNRVYxenVJaXZXc1lRODQ1WDhaR3pIK090?=
 =?utf-8?B?VGZ4WDByLy9RNHNYY0ZGcSt0cjZ1aUlmTlpXcHhUc2k1M3FPdVAzbmxSaTQw?=
 =?utf-8?B?bVNYU1RmS09aaUlNcU10anhCWU9NaVdQYjhyZUpiNEI3TEcvaFJvclU3UGZv?=
 =?utf-8?B?bCsxT08yTGFEaGNFMWo0VFlmUzBpWWpNdDQ3SFgyQmU3U2locy9QQzZqTDVN?=
 =?utf-8?B?OXhwdnVOWVNGMGkrMDRjWFFZTnNHTStDSi9EdXRHWE16WW1FNnRRcEp0U1ps?=
 =?utf-8?B?MGpZNmJqYUFKN1Y2M0t0Y2syWVNsWGNLMnFlWFZCdmsxbjNpTFlGUERxN0JB?=
 =?utf-8?B?YmFSdjA0RWNyckR4WWxaY2psSTVzaWpPUHhTaFRKY0VuYWhrWU9tcXRVb3kr?=
 =?utf-8?B?Z1FDZDEwUXlRYWxzdlU0enRVRU9SZWFmdEdCTVcrV0tleSs1QStSMUV2MUVJ?=
 =?utf-8?B?RzV0eXRyZjg1eUlDUUdtWHJEUWtqai9mcDQxRlorYUFzQ1F3dk4vMmsvUWFn?=
 =?utf-8?B?Nm5WMHlib2MzUUZWeGpUaUNadEJmZTE1WTZCQURzeHY0N3hmNkNCUFJISGVM?=
 =?utf-8?Q?53cy3HRkZq9wuv6IBx9nceU9HycZD0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVFUejJ1dVRPK0lmTWtlS1poaTFGMUNBSlhYa3VoU2luR0Q4cjAxWW9UdjB4?=
 =?utf-8?B?ZkJER3Q4ZDNlOTVsckFMTzV1VXdvdnVrS0JLTU1saHZGdXYwTEp4WEFTczFp?=
 =?utf-8?B?UE5zekptSDQvaFhHMFZKa3BuL2lTd2dWWXVaQjdZbHRtL3FwY3oxajlEQkFG?=
 =?utf-8?B?VGM0KzlXR21KK3NnN3UvbmgwNHdRSTI0OUkxa0E4UmRaUm84WE9TWUxoeDFl?=
 =?utf-8?B?Rkl6dm5ZQTVtUnl0QTRZMDBsMDBTS2JJSkIxeHNJNEk4OWYxV2ZhZlNOSGdr?=
 =?utf-8?B?Z0hDTk5lM3BBN1I1cHl6a3ZNbG9wN0FXalhWVUNISnlLUmdNamlCbFBzdUt4?=
 =?utf-8?B?VzMyaDl4RDNnVWI5SldSOC9qWGJWSWN0NXhDbXQ5SWN6VEF3bFFPcWp6MHk1?=
 =?utf-8?B?QUZwNlpQNEFTNlVGNTdJMitvT0FXbTgweDZOQWFHZHVyRlJRREVocHdRU1Bx?=
 =?utf-8?B?SHBwWWhDakZnNUsyUGwraENuR21WVkVhWHFWZldTWTRBU0xHYnRBMHJuZlU0?=
 =?utf-8?B?TjRub0ZmWElpMHNPQkRPcEJyS015eFhFUytzZVZ2M0hFNWt4UnpTbEtTWDI1?=
 =?utf-8?B?TkhybjJGMkRPV2JEQUkxL3ZhQklkQXRGcll2NTBkLzhYTFBOT2xzN21XT1gy?=
 =?utf-8?B?bE5FNk5HcURtYzFMeStQbTdvNjJEeFVDS2VJREMyTmt4eGhpcXNiNGdqRity?=
 =?utf-8?B?K2VRRkJvdFdlak1JOGd0b1dnZnVFaDFSV0lEVjFhUHR0YTVTR1pvaUN5YkxC?=
 =?utf-8?B?ZjFwQm5ScUcvNDRUU25JK2FGNlpCODJ1SkNiRG5HZUxrMFZGOG8weDQyODNG?=
 =?utf-8?B?VzZIL3UvenpTUkdDWmE5YVBPZEJzQ2gxQ2FtRE5HLzRHcytpcHVqZWxvZjJt?=
 =?utf-8?B?VWZDUEZGM2FTcFZXNkllZDMyVGJoa1ArM3VRenVLNTRZMUZXeU8xSWNJZDEy?=
 =?utf-8?B?NUgvb1N6WHdWNyt4SkxkT0JNS3BDYm9PK2c0a2JmdDkrYzhoWkNXcXg1azdZ?=
 =?utf-8?B?eEJUYW45ZGtiblR5V0dqT0hNcm1OK1oxVEp5aTBpWWk0NzFVSGUwR0w2UUkz?=
 =?utf-8?B?V1FRdHFxZ05xZ0N6MWxxRVhtbU9la2E5UjFIRkkzR2c2b1dXZ2FhYUZPLzRi?=
 =?utf-8?B?NWxxRjJtdmFLdkNpb0JZeEU0WDR4a0FtYVBmQzN6TGlpOWY3ZzBSeXZKMVpS?=
 =?utf-8?B?ME95cGQ0bFJobFoxZHVuMGhLOGVMSFdqbGlKWHZXNGIvRnVTVU5IUVRQQ0V2?=
 =?utf-8?B?MmpvY3dxNkptT1duQXgyQVpvL1hhdmVqMWN0Z1MzOHh6SUlUUms3ekZpZmZO?=
 =?utf-8?B?b3FEZzgrazhsaUJ3dVVYRWZaTGhvSmNxRXZudFVKQmdoVVo2ei82NnBtUXdZ?=
 =?utf-8?B?OFZaeHQyTjdyN1lCeHhaVnRrSHVLUDVVemJUUXUrelA3R1FWSXBQc3NPazNK?=
 =?utf-8?B?bGZWaEUzSEZpOUxPSUNOSUVkYjN1L3ZzSkw3RXVrRlhsaG9PbzJNeGp0RjFx?=
 =?utf-8?B?bzNrK1ZtVEJ6aHZ1QnlkYzlnL3VDd3FOTG5VdlhEUjAvRThsTVZYVlhzMm9o?=
 =?utf-8?B?VFloVlZFQjJpUUUxSHdCeEtkT3poWjQ0OFRhUkY1K3VKV29FbC90UEdrV2g3?=
 =?utf-8?B?SGhGK1h6MkF1SGRncmRKYmZMdlQ4R256blRrZytDd2lWSitjVVAydVF1MSty?=
 =?utf-8?B?MkpRVTUrcWRnWE5jNm1GTjhSbkNnSjFlb1JLVTg0UTRNdG5NRzRpNWU4WmVZ?=
 =?utf-8?B?UlFUbXJQeFZPVk92N05BUGI5NEFaeU5icExINlZLVGkrZWp5djlkUlBNL2lL?=
 =?utf-8?B?c3d5Vkgvc3lSVTB3QnQ3emlGNGFncjgyMWhIRjloV1RTMmc0aTFmaUc0TmR1?=
 =?utf-8?B?OVlONWYxRUcrdWVvSlR6NERoYWI3M29lQnc0NnFMUlQ3QzhDT2NMYkNURXpD?=
 =?utf-8?B?YzFPU29Zek01YXQ5TS9uUW1EVU5udTJPalQ1ZkdNbVpRdlRobFBzR0psNk1L?=
 =?utf-8?B?Q2xiWmFEMVcxMnZjbTJqbjBEVm5rSktFbEpPcHBhQy9KdWZxaU5NWmNGYzlC?=
 =?utf-8?B?bUdvWjc2c1RiNTM3Vjhvc1k5ZmVYUjErUmNsMEk1TkMrN1V2K042Z1Vxdmxi?=
 =?utf-8?B?dzVHdXd2R2s4RnVIcXZjeTlYYkFMQnVyenZ2Q240QnpzQ2hVZE11V2JUdjl3?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77CED1B2FDF81F46AAF499ECE40D3B03@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab683e6-9273-4176-0628-08ddf0150aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 02:52:12.2180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vlTsK5WdyISDnqRwLBPpGg+DEtW+mzlMhhkTK04OvM+nPjOKh1NsR9r9AAQNsEB13XF7+vHOLCpzMI04/LDPlkP5k5D0DhgNkdwiTo+Y0WU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 02:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223140

T24gVHVlLCAyMDI1LTA5LTA5IGF0IDE0OjM3IC0wNDAwLCBUcmV2b3IgV29lcm5lciB3cm90ZToK
PiAKPiBPbiBUdWUgMjAyNS0wOS0wOSBAIDA5OjQxOjE3IFBNLCBNYWNwYXVsIExpbiB2aWEKPiBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+ID4gSW50cm9kdWNlIC0tc2VjdG9yLXNpemUg
YXJndW1lbnQgdG8ga3NwYXJzZS5weSBhbmQgcHJvcGFnYXRlCj4gPiBzZWN0b3Jfc2l6ZQo+ID4g
dG8gcGFydGl0aW9uIG9iamVjdHMuIFVwZGF0ZSBib290aW1nX2VmaSBwbHVnaW4gdG8gdmFsaWRh
dGUgc2VjdG9yCj4gPiBzaXplCj4gPiBhbmQgcGFzcyBpdCB0byBta2Rvc2ZzLCBlbmFibGluZyBj
cmVhdGlvbiBvZiBFRkkgc3lzdGVtIHBhcnRpdGlvbnMKPiA+IHdpdGgKPiA+IHZhcmlhYmxlIHNl
Y3RvciBzaXplcy4gVGhpcyBjaGFuZ2UgaXMgcmVxdWlyZWQgdG8gc3VwcG9ydCBVRlMKPiA+IHN0
b3JhZ2UuCj4gCj4gRm9yIHdoaWNoIGJyYW5jaCBpcyB0aGlzIHBhdGNoPwo+IAo+IERvZXNuJ3Qg
bWFzdGVyIGFscmVhZHkgaGF2ZSBzZWN0b3Itc2l6ZSBzdXBwb3J0IGluOgo+IG9lLWNvcmU6IDIy
NTVmMjhiNTc5YiAoIndpYzogYWRkIFdJQ19TRUNUT1JfU0laRSB2YXJpYWJsZSIpCj4gCgpUaGlz
IHBhdGNoIGlzIGZvciBtYXN0ZXIgYnJhbmNoLiAKV0lDX1NFQ1RPUl9TSVpFIHNlZW1zIG9ubHkg
YXBwbGllcyB0byBtb3N0IG9mIHRoZSBwYXJ0aXRpb25zIGluY2x1ZGVzCnJvb2ZzIHBhcnRpdGlv
bi4gSG93ZXZlciwgaXQgZG9lc24ndCBhcHBsaWVkIHRvIEVGSSBwYXJ0aXRpb24gYmVjYXVzZSAK
dGhpcyBwYXJhbWV0ZXIgZG9zZSBub3QgYXBwbHkgdG8gY29tbWFuZCAnbWtkb3Nmcycgd2l0aCB0
aGUgJy1TJyAKcGFyYW1ldGVycy7CoAoKSSdtIG5vdCBmYW1pbGlhciB3aXRoIGhvdyB0byBwcm9w
YWdhdGUgV0lDX1NFQ1RPUl9TSVpFIHRvIHRoaXMgcGx1Z2luLgpJZiB0aGVyZSBpcyBhIGhpbnQg
SSBjb3VsZCB1cGRhdGUgYSBuZXcgcGF0Y2ggYXNhcC4KCkhvd2V2ZXIsIHNob3VsZG4ndCB3ZSBj
b25zaWRlcmluZyBvZiBzdXBwb3J0aW5nIDIgc3RvcmFnZXMgb24gdGhlCmRldmljZXM/IEZvciBz
b21lIGJvYXJkcyBzdXBwb3J0cyBib3RoIGVtbWMgYW5kIFVGUy4gVGhlIEVGSSBwYXJ0aXRpb24K
bWlnaHQgZXhpc3RzIG9uIGEgYm9vdCBzdG9yYWdlIGFuZCByb290ZnMgZXhpc3RzIG9uIHRoZSBv
dGhlciBzdG9yYWdlPwoKQW55d2F5LCB0aGUga2V5IHBvaW50IGZvciB0aGlzIHBhdGNoIGlzIHRv
IGFkZCAnLVMnIG9wdGlvbiB0byBta2Rvc2ZzCnRvIGVuc3VyZSB0aGUgc2VjdG9yIHNpemUgaXMg
Y29ycmVjdC4KCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxp
bkBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+IMKgc2NyaXB0cy9saWIvd2ljL2hlbHAucHnCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArKysrKysKPiA+
IMKgc2NyaXB0cy9saWIvd2ljL2tzcGFyc2VyLnB5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAxICsKPiA+IMKgc2NyaXB0cy9saWIvd2ljL3BhcnRpdGlvbi5wecKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+ID4gwqBzY3JpcHRzL2xpYi93
aWMvcGx1Z2lucy9zb3VyY2UvYm9vdGltZ19lZmkucHkgfCAxOAo+ID4gKysrKysrKysrKysrKysr
Ky0tCj4gPiDCoDQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvbGliL3dpYy9oZWxwLnB5IGIvc2NyaXB0
cy9saWIvd2ljL2hlbHAucHkKPiA+IGluZGV4IDZiNDlhNjdkZTkzOC4uMzUzNDdiMmRmOGFkIDEw
MDY0NAo+ID4gLS0tIGEvc2NyaXB0cy9saWIvd2ljL2hlbHAucHkKPiA+ICsrKyBiL3NjcmlwdHMv
bGliL3dpYy9oZWxwLnB5Cj4gPiBAQCAtODg1LDYgKzg4NSwxMiBAQCBERVNDUklQVElPTgo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpcyBsYXJnZXIg
dGhhbiAtLWZpeGVkLXNpemUgYW5kIGVycm9yIHdpbGwKPiA+IGJlCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhaXNlZCB3aGVuIGFzc2VtYmxpbmcg
ZGlzayBpbWFnZS4KPiA+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgLS1zZWN0b3Itc2l6ZTogVGhl
IHNlY3RvciBzaXplIGluIGJ5dGVzLiBUaGUgdmFsdWUgbXVzdAo+ID4gYmUgYW4KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVnZXIgYW5kIG9u
ZSBvZiA1MTIsIDEwMjQsIG9yIDQwOTYuIFRoZQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdCBpcyA1MTIuIFRoaXMgZW5hYmxlcyBhIHZh
cmlhYmxlCj4gPiBzZWN0b3IKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNpemUgZm9yIEVGSSBwYXJ0aXRpb25zLCB3aGljaCBpcwo+ID4gc3VwcG9y
dGVkIG9uCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkZXZpY2VzIHN1Y2ggYXMgZU1NQyBhbmQgVUZTIHN0b3JhZ2VzLgo+ID4gKwo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgIC0tc291cmNlOiBUaGlzIG9wdGlvbiBpcyBhIHdpYy1zcGVjaWZpYyBvcHRp
b24gdGhhdCBuYW1lcwo+ID4gdGhlCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzb3VyY2Ugb2YgdGhlIGRhdGEgdGhhdCB3aWxsIHBvcHVsYXRlIHRoZQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFydGl0aW9uLsKgIFRoZSBtb3N0
IGNvbW1vbiB2YWx1ZSBmb3IgdGhpcwo+ID4gb3B0aW9uCj4gPiBkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9saWIvd2ljL2tzcGFyc2VyLnB5Cj4gPiBiL3NjcmlwdHMvbGliL3dpYy9rc3BhcnNlci5weQo+
ID4gaW5kZXggNzA1Zjk4OTc1MDg0Li4wYmZkYWJlMWJmMjIgMTAwNjQ0Cj4gPiAtLS0gYS9zY3Jp
cHRzL2xpYi93aWMva3NwYXJzZXIucHkKPiA+ICsrKyBiL3NjcmlwdHMvbGliL3dpYy9rc3BhcnNl
ci5weQo+ID4gQEAgLTE4Miw2ICsxODIsNyBAQCBjbGFzcyBLaWNrU3RhcnQoKToKPiA+IMKgwqDC
oMKgwqDCoMKgwqAgc2l6ZWV4Y2wuYWRkX2FyZ3VtZW50KCctLXNpemUnLCB0eXBlPXNpemV0eXBl
KCJNIiksCj4gPiBkZWZhdWx0PTApCj4gPiDCoMKgwqDCoMKgwqDCoMKgIHNpemVleGNsLmFkZF9h
cmd1bWVudCgnLS1maXhlZC1zaXplJywgdHlwZT1zaXpldHlwZSgiTSIpLAo+ID4gZGVmYXVsdD0w
KQo+ID4gCj4gPiArwqDCoMKgwqDCoMKgwqAgcGFydC5hZGRfYXJndW1lbnQoJy0tc2VjdG9yLXNp
emUnLCB0eXBlPWludCwgZGVmYXVsdD01MTIpCj4gPiDCoMKgwqDCoMKgwqDCoMKgIHBhcnQuYWRk
X2FyZ3VtZW50KCctLXNvdXJjZScpCj4gPiDCoMKgwqDCoMKgwqDCoMKgIHBhcnQuYWRkX2FyZ3Vt
ZW50KCctLXNvdXJjZXBhcmFtcycpCj4gPiDCoMKgwqDCoMKgwqDCoMKgIHBhcnQuYWRkX2FyZ3Vt
ZW50KCctLXN5c3RlbS1pZCcsIHR5cGU9c3lzdGVtaWR0eXBlKQo+ID4gZGlmZiAtLWdpdCBhL3Nj
cmlwdHMvbGliL3dpYy9wYXJ0aXRpb24ucHkKPiA+IGIvc2NyaXB0cy9saWIvd2ljL3BhcnRpdGlv
bi5weQo+ID4gaW5kZXggMGM5YjFhNWI5NjIwLi5kNjRiMmU3MzFmNWIgMTAwNjQ0Cj4gPiAtLS0g
YS9zY3JpcHRzL2xpYi93aWMvcGFydGl0aW9uLnB5Cj4gPiArKysgYi9zY3JpcHRzL2xpYi93aWMv
cGFydGl0aW9uLnB5Cj4gPiBAQCAtNDksNiArNDksNyBAQCBjbGFzcyBQYXJ0aXRpb24oKToKPiA+
IMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5yb290ZnNfZGlyID0gYXJncy5yb290ZnNfZGlyCj4gPiDC
oMKgwqDCoMKgwqDCoMKgIHNlbGYuc2l6ZSA9IGFyZ3Muc2l6ZQo+ID4gwqDCoMKgwqDCoMKgwqDC
oCBzZWxmLmZpeGVkX3NpemUgPSBhcmdzLmZpeGVkX3NpemUKPiA+ICvCoMKgwqDCoMKgwqDCoCBz
ZWxmLnNlY3Rvcl9zaXplID0gYXJncy5zZWN0b3Jfc2l6ZQo+ID4gwqDCoMKgwqDCoMKgwqDCoCBz
ZWxmLnNvdXJjZSA9IGFyZ3Muc291cmNlCj4gPiDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuc291cmNl
cGFyYW1zID0gYXJncy5zb3VyY2VwYXJhbXMKPiA+IMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5zeXN0
ZW1faWQgPSBhcmdzLnN5c3RlbV9pZAo+ID4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvbGliL3dpYy9w
bHVnaW5zL3NvdXJjZS9ib290aW1nX2VmaS5weQo+ID4gYi9zY3JpcHRzL2xpYi93aWMvcGx1Z2lu
cy9zb3VyY2UvYm9vdGltZ19lZmkucHkKPiA+IGluZGV4IGNmMTY3MDVhMjg1YS4uYTFiMDBkOTFi
ZjUzIDEwMDY0NAo+ID4gLS0tIGEvc2NyaXB0cy9saWIvd2ljL3BsdWdpbnMvc291cmNlL2Jvb3Rp
bWdfZWZpLnB5Cj4gPiArKysgYi9zY3JpcHRzL2xpYi93aWMvcGx1Z2lucy9zb3VyY2UvYm9vdGlt
Z19lZmkucHkKPiA+IEBAIC00MTUsOCArNDE1LDIyIEBAIGNsYXNzIEJvb3RpbWdFRklQbHVnaW4o
U291cmNlUGx1Z2luKToKPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoCBsYWJlbCA9IHBhcnQubGFi
ZWwgaWYgcGFydC5sYWJlbCBlbHNlICJFU1AiCj4gPiAKPiA+IC3CoMKgwqDCoMKgwqDCoCBkb3Nm
c19jbWQgPSAibWtkb3NmcyAtdiAtbiAlcyAtaSAlcyAtQyAlcyAlZCIgJSBcCj4gPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGxhYmVsLCBwYXJ0LmZzdXVpZCwgYm9v
dGltZywgYmxvY2tzKQo+ID4gK8KgwqDCoMKgwqDCoMKgICMgVmFsaWRhdGUgcGFydC5maXhlZF9z
aXplCj4gPiArwqDCoMKgwqDCoMKgwqAgaWYgcGFydC5zZWN0b3Jfc2l6ZSBub3QgaW4gKDUxMiwg
MTAyNCwgNDA5Nik6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dnZXIuZGVidWcoIklu
dmFsaWQgJy0tc2VjdG9yLXNpemUnIHNwZWNpZmllZCAoJXMpLgo+ID4gIiBcCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJBbGxvd2VkIHZhbHVl
cyBhcmUgNTEyLCAxMDI0LCBvciA0MDk2LiAiCj4gPiBcCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJTZXR0aW5nIHRvIGRlZmF1bHQgNTEyLiIs
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBh
cnQuc2VjdG9yX3NpemUpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXJ0LnNlY3Rvcl9z
aXplID0gNTEyCj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAgIyBTdXBwb3J0IHZhcmlhYmxlIHNl
Y3RvciBzaXplCj4gPiArwqDCoMKgwqDCoMKgwqAgIyBta2Rvc2ZzIC1DIGV4cGVjdHMgbnVtYmVy
IG9mIGJsb2Nrcywgd2hpY2ggaXMgKHNpemUgaW4KPiA+IGJ5dGVzKSAvLyBzZWN0b3Jfc2l6ZQo+
ID4gK8KgwqDCoMKgwqDCoMKgIHNpemVfYnl0ZXMgPSBibG9ja3MgKiAxMDI0Cj4gPiArwqDCoMKg
wqDCoMKgwqAgYmxvY2tzID0gc2l6ZV9ieXRlcyAvLyBwYXJ0LnNlY3Rvcl9zaXplCj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgwqAgZG9zZnNfY21kID0gIm1rZG9zZnMgLW4gJXMgLWkgJXMgLUMgJXMg
JWQgLVMgJWQiICUgXAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IChsYWJlbCwgcGFydC5mc3V1aWQsIGJvb3RpbWcsIGJsb2NrcywKPiA+IHBhcnQuc2VjdG9yX3Np
emUpCj4gPiArCj4gCj4gSWYgeW91IHdhbnQgdG8gZG8gc2FuaXR5IHRlc3Rpbmcgb2Ygc3VwcGxp
ZWQgdmFsdWVzIHRoYXQgc2hvdWxkIGJlCj4gZG9uZSBlYXJseQo+IGluIHRoZSBmcm9udC1lbmQg
cGFydCBvZiB3aWMsIG5vdCBpbiB0aGUgYmFjay1lbmQgcGx1Z2lucy4gT3RoZXJ3aXNlCj4gZXZl
cnkKPiBwbHVnaW4gd2lsbCBuZWVkIHRvIHBlcmZvcm0gdGhpcyBzYW1lIGNoZWNrICh1bmxlc3Mg
eW91J3JlIHN1Z2dlc3RpbmcKPiBkaWZmZXJlbnQgcGx1Z2lucyBzaG91bGQgYWxsb3cgZGlmZmVy
ZW50IHNldHMgb2YgdmFsdWVzPykuCj4gCgpUaGlzIGlzIG5vdCBmb3IgdGVzdGluZyBzdXBwbGll
ZCB2YWx1ZXMuIEl0IGp1c3QgdHJ5aW5nIHRvIGF2b2lkIHVzZXIKbWFraW5nIGEgd3Jvbmcgc2Vj
dG9yIHNpemUgZnJvbSB0aGUgdG9wIHdrcyBmaWxlLsKgCk9rYXkgSSBjYW4gZHJvcCBzdXBwbGll
ZCB2YWx1ZSBjaGVja2luZyBoZXJlLiBCdXQgdGhlIGJsb2NrcyBkZXBlbmRzIG9uCnRoZSBzZWN0
b3Igc2l6ZSwgdGhlIGNhbGN1bGF0aW9uIGNvZGVzIHNob3VsZCBiZSBrZXB0LgoKPiA+IMKgwqDC
oMKgwqDCoMKgwqAgZXhlY19uYXRpdmVfY21kKGRvc2ZzX2NtZCwgbmF0aXZlX3N5c3Jvb3QpCj4g
PiDCoMKgwqDCoMKgwqDCoMKgIGxvZ2dlci5kZWJ1ZygibWtkb3NmczpcbiVzIiAlIChzdHIob3V0
KSkpCj4gPiAKPiA+IC0tCj4gPiAyLjQ1LjIKPiA+IAo+ID4gCj4gPiBUaGFua3MgZm9yIHRoZSBy
ZXZpZXcuIApXaWxsIHRyeSB0byB1cGRhdGUgdGhlIHYyIHBhdGNoIGxhdGVyLgoKQlIsCk1hY3Bh
dWwgTGluCg==


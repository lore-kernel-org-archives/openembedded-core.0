Return-Path: <macpaul.lin@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6518ACAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 07:21:05 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web11.26777.1757920855790143932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 00:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=OAnvOEgO;
 dkim=pass header.i=@mediateko365.onmicrosoft.com header.s=selector2-mediateko365-onmicrosoft-com header.b=kPFSenA2;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: macpaul.lin@mediatek.com)
X-UUID: 80c62704920411f0bd5779446731db89-20250915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MhCa7Tw7lffbiVD+Pwk68neHcp3KdxmpztTnQ/E5n/0=;
	b=OAnvOEgOuPlVSL8EgRBvNkHXtAJ1gzminy/0dWJSen9VHVt7apFAW98oGWW34WWL9agSKhuWUXA6MrG4+ffD+dindkGQgyrUIWS1RxoXOOlgsE455vP/h67RQkCxNOFA/4SkN1kiWxuEaycTsMEfx/16jZe8GUkwOFen+W6/+EQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:4e420955-913b-4cef-97ae-1bcb4f919099,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:91484ef8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 80c62704920411f0bd5779446731db89-20250915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1881210390; Mon, 15 Sep 2025 15:20:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 15 Sep 2025 15:20:46 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 15 Sep 2025 15:20:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgcySNe2ItnRTIG4nv67nXNtSfYm8dlnbuTGGKoeQuqdNyf+m1HHfYPJk68hTXAuD431JruqhFByfRKd8vhgLkKsqjahjeocwryYTigEuUMyUrZxNHhVFDlhFagnrb1CqowadTl3wAKIVZ5yqDYpE4SYOY25tkPyWCi20grwNA798TeKVgRMq8k3JOmX2e59+7l4Soww1tGM9dBLRc+sXtQaUG7Yi+6/Mm3Uv/UiqpX5GJyXCNarAs6o3OFmOYiQq0NthXrq5x086nmh2MGb3ycVye7aLA7xwQLXPpvntq/4pfLFi+QVJRMSSjXyoGu1IyV3ogSBBje+cF/EqMxRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhCa7Tw7lffbiVD+Pwk68neHcp3KdxmpztTnQ/E5n/0=;
 b=Tz9WcOF4JqUDJo7uLZTRPdtsLFLkrnezTa/EQUvkGyg/FaVXXueoHcwtnwMp+cjx0UJWuMRIlpjWiFSyuW431XtxmTJM7MTVO7lvf+amkyFIzZ+YVvyXYjlx3vJFFDUuQkYbwj4pPEzIISvX8PlLHBclu4+gCI4dt3B4XRRNpOai8Sg1/AZFTfmiIk9FKFi6sdZAt1KlwXelya6pLbDJ1KQnIt6KMmsj5bPbiGfGZ710CuE31Nig2wnW+exMe3Sb8ANuO/ecOx3OdcI7GalMwiHAzoZfmJNOser0jykFsgPbvd94P1ZyBo9eLhXbi51FbAvZ2/uVHyfieO2WnT0gEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhCa7Tw7lffbiVD+Pwk68neHcp3KdxmpztTnQ/E5n/0=;
 b=kPFSenA2mrYV7uRBGnRx9Wp3HieW1AGFH3hvLBY5GHc5Le71ubQBa1LC3cpYgQDsO2WZv1NoCWbdQD2ZcIpuQfnI3wi8ZZlMpO/Yq03PRWehKc+W7WHoY+ZHod8Iuh+MggDZW4KZXmouzWDY+drbrAEIbxlllyklPb5CofwZcp4=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by TYSPR03MB8517.apcprd03.prod.outlook.com (2603:1096:405:5a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 07:20:43 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 07:20:43 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"alex@linutronix.de" <alex@linutronix.de>, "otavio@ossystems.com.br"
	<otavio@ossystems.com.br>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "macpaul@gmail.com" <macpaul@gmail.com>,
	=?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
	=?utf-8?B?UmFtYXggTG8gKOe+heaYjumBoCk=?= <Ramax.Lo@mediatek.com>
Subject: Re: [OE-core] [PATCH] wic: Add support for variable sector size when
 creating ESP
Thread-Topic: [OE-core] [PATCH] wic: Add support for variable sector size when
 creating ESP
Thread-Index: AQHcJgug/thD3swzVE2fbrrt5dPPNrST1mUA
Date: Mon, 15 Sep 2025 07:20:43 +0000
Message-ID: <74ae25984f2d8953e5a997368fbe82f5a0ea5094.camel@mediatek.com>
References: <186561788A8CC1BB.5932@lists.openembedded.org>
In-Reply-To: <186561788A8CC1BB.5932@lists.openembedded.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|TYSPR03MB8517:EE_
x-ms-office365-filtering-correlation-id: ef1c0ffd-786f-4db6-6831-08ddf42861da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UVJ0VkZOQ25PcXBCZU13ak1mT3E4ZERKL3pSeWN5UG1SZ0hvaE41TE41Nk92?=
 =?utf-8?B?U2FqeXVJbmttYjl6TGNFZkxDOC92YlE1WnphM2lJblRrZ3NjOTM3WjYzYmU0?=
 =?utf-8?B?QlE2V2hRdDgwMGRZMng0Q0JPQlNydENjSG9ENUFmZWVQR1dRTjRIUmlLOXBW?=
 =?utf-8?B?ZGsveVdiMDM5eVk4ZEtHUWNTYzkySDBsVWhoUnhrQlZyMXk4TkVZdWYrRG5q?=
 =?utf-8?B?TzNnVDBKc3Fqd3FDcC9WSHBlNTVra0xLSzcxR0sxb1hOcW5VUUl0cmFFSEI0?=
 =?utf-8?B?MmNHMzQrODJmZDQwQXRUdFdkQlNXY3NUbVpYZUM5L05Vb2RBZEl2aXR2WmRh?=
 =?utf-8?B?TCtURWNMYllJbXhQaEtBVFFTeXFMaDZ5bytaR2xlamU5aEZCSnovbUtMc2s5?=
 =?utf-8?B?cEJTK2hjMWtvaUlVczZnaFI0d3JGN3VIc3Zxc2pjM1hReEtwQVNrcTlZWDBo?=
 =?utf-8?B?UndlbzRxazEzeWlPMEtqOW5tQkpudEtVK1NrZHV4MkxJZVMyTms4UFRoR09n?=
 =?utf-8?B?d1dXR2NjRjR1WkZaVnBxdVZJd3hzZlo3Ylp5MTM0ZnZGUU1maGlQbFQ3Wmp5?=
 =?utf-8?B?bDdXRVNKVVlEdmVwOFV3NXZOSmtKMEJndHpjWDRhVEsxL21HN2QzbVVBM2pO?=
 =?utf-8?B?b3RmdVVVK2NCQTMrNS91bzRtNi9WTTB0aEl3bHlKa2IvalhLZGNGOExxNWJo?=
 =?utf-8?B?ZEpabEZoWjhVNGZHcHNORHRjbXhNeWhBOHAyNzlFdVJTSlhCTXJpQm1SOGZv?=
 =?utf-8?B?QzNSMXVYcVFySVhZeFdKNFErYlFrZ05qTUVpYmNHRXZrVjNIUjU3eGZMTTh6?=
 =?utf-8?B?bVB1ZzF6MEVqS2lpVlloUlJMa1o1cW9YL282bjN2VHQ4SC9HUjNQVFRjbmxO?=
 =?utf-8?B?MzYvUnRxbTJIakYyM3ZsdFh3cjJyNzhUTnQvMlVPdWFkTlZUTWtJclJHT2V1?=
 =?utf-8?B?d3AzYUMydVpLV3lyNnNrUWpKT2tqSVJsaTJWMXp3L3lPQXRDV0dGTDZTWS81?=
 =?utf-8?B?SXB6SkE2cldzaG0zZFZXbVNIWmZuajc3dEErTnpTNWtaNGMxb1FKY0lpN2kr?=
 =?utf-8?B?cDdFY2VqR2srMERTeVhZak5tMS9pMDZuSEVJWXdrT0M3bHZGRkVnOVFVRTkw?=
 =?utf-8?B?enNINGVVWUxrcE40OVlubDhkbElFaTA5YTJwOU94ckovTHBzR05jVzUxWUt2?=
 =?utf-8?B?TXZ4YUdpL1hNRHBGMUpjNkJwUDYzTk5zRTBhODg4M1JLeTZrRjhnVjhaVmJi?=
 =?utf-8?B?K0F3TWJQbTVRNnRYanpkRVM3YTNiT3NFMVhORC9xOHhCWGJyZUkvdHRHZWZP?=
 =?utf-8?B?dTJWT3ZmKzFtb01LVVcwc2R0R05reEZ1RnB1OXhPS1k0Y0NTZ3ZmQjM3ZlNi?=
 =?utf-8?B?b2pzbDFsM0xmUTZXaU1wSlhibElPQ011MEprM3dYNXBmcUgyWGMrUDBGbmR4?=
 =?utf-8?B?TzVybTdnZDIxV0ZmR2FHZTQwQVNSSVBxczZ2YTNRbTJ3ZDRseHVualp0TFZG?=
 =?utf-8?B?OFRCMHJSaWVibFNOUWprVGFBSDJtT241eHRnZnVwR21rWEluQ0FRZVpQVXVE?=
 =?utf-8?B?ZUFvY29jeURGbU42WncyaEJCd3V6WXYzSXFJeUdUYmczdS9ISVhVR2FpODd4?=
 =?utf-8?B?a0VSVUw2dTNCQitvTjQzSGZsbG93eGhPYUJGR0NHZFhEckpZTFU5SUFmR1Jp?=
 =?utf-8?B?U3VQYS80alNIcFpmV00zL1E3Z0dqZGRpaGtIVTJLVGFtQUU5Y0JnNCs1aGxF?=
 =?utf-8?B?cTA0c0F2S1kzeklVM2dzem1jcWR4a3h5T1U3cXliVEhuWVRJYzF3RzNjbHQ4?=
 =?utf-8?B?RWxRVHgzYkw4bmxCNU5qd3dCcVRMNnRPcjlkN3pRSFNPZXlSNGRON3lwUmo5?=
 =?utf-8?B?cEszM1FxelBkTlVqL1ZXSUI0K0pGaEwvU0J4NnMxR3FtbzVKQnh4cm1qTHQr?=
 =?utf-8?B?RE80WnZocXJram4yU0gxaUdDUm14Lzd2eE1RZjlROHhBVitXZzFQU0pFYklK?=
 =?utf-8?Q?JtpFcEiOtF00GVfgK9iXXF/1reezyU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTN3N2FjeTAydjJiU2lJRVIyWW1LZDR3bElBcmhyR0taK2hKRTRKYzkyZHUw?=
 =?utf-8?B?TWpoOWFlKzJhMXZYY1VteloydEI3TnpCcnAzUXBhUDU3a2ZLY1hPcjhWZ3Yw?=
 =?utf-8?B?dUtuaXlvWXIrcnRpYmJlMHZMVVB5ZWN5UklBWmpJQnlKcndJWFIyWTR6VzV0?=
 =?utf-8?B?TlhCbi9hVEFWMndmbHRhbkVud0RwR2pPUkhva1EyZFAxdnpaQ2NPa2pIaUE1?=
 =?utf-8?B?dWNwazd3cUZjTXIrdVJ0THRiK3ZGc2dITUpVMjZuVS8rNjlnc2FWSmRubDBC?=
 =?utf-8?B?ckEvaFpvclFuYjcrZXRqQmJlNzRSVTFwWFBlU09YRmFKaklMQVY3aGJ6MzUx?=
 =?utf-8?B?NmxVZzNUQjEyd0NFdSswODQvOEdGMDZDa1RCNXFubTBnUUg2TXZ2UWVqS2tQ?=
 =?utf-8?B?WXduNmhXd01kVzlTb01xaTUxd0o4cmI1TGtPbXNWVjd3S1EyVEtlR2JqbjdG?=
 =?utf-8?B?Q2F4bFNQWnFIOU03cUljWW5hM0U3Wko4QjcwdmRXSllqRjhQMVIyL25zcity?=
 =?utf-8?B?U0M3TnBuVG00L0htQTZ4ZmV2djM5MFAvOVNHVkZmWE9sTjJKQjNRek5xL29C?=
 =?utf-8?B?S2xma3BoSWFKb0xWUmhJY05qRzN6S05rd1Nnc2R2NXV0S3lKYlBwTFVkNGIy?=
 =?utf-8?B?eUxkUXQ4VTZpdGVmMncvQ21Eam8ybnpFKzNWeHh4dVM1RUZUNms3ZFFaL2ln?=
 =?utf-8?B?cjZnQWFrOFNaYUhsK09DcjZEUjV6UEdaT0Nhc0phMHExQWhWMUc5anhaZTh3?=
 =?utf-8?B?SWJVTDNxZ3RRampXbjJQQnNFa2c1dWp4di9SK1pFNEFXd25YeXE4VGZ0UGRx?=
 =?utf-8?B?WWdBUHNBRmVjYk1CQTFnYnFGcUovOEwxUzdyKzRjc3ZUSXJQcUs4ZEJSR2Rx?=
 =?utf-8?B?cWRTSGhvZTFVUW55cmFRanpSWnRZK05SWGIyZjh4alRzYUVjcGJ6RzQvMGRi?=
 =?utf-8?B?TGxON0lNSUk3Y3dzcmJFU3lVOVBBeGxBeitQOWtqNWFFZU1pajYrMFNqZGJ1?=
 =?utf-8?B?MDdmdkVMUmZTbWd5dUZZVDRxUVlleUtHMlZoaFlzRXZMVkNpNGFackFIbW5h?=
 =?utf-8?B?ZmJibVoycnRHbEgvZ1R0cHJDZjF6R2tPRFBpVXBYU2FtNW1mUVJrRy9ROXNo?=
 =?utf-8?B?WWpyY3dWLzA0d1lkUEUrWXh3SGdJaDltOFNnWmQyeE9NV2I2TnEyeUp4a2pE?=
 =?utf-8?B?RzVhRWlWbEtEVlcrRmRZcnBsMFJrRk9jNy9OVEFLSVpUTlhOa3gycTJLTHJz?=
 =?utf-8?B?M2NJV1ZOb2FWdlBHNjZTWUtVd0pqd1IzTFVUcWlyVnBYYjY1YVhZYVFWR1B0?=
 =?utf-8?B?Z01VbGZkM3NnQUUyWEpSbjNYaGRUaEozc0JaRXI1eXFxazhOZ0hqZzFQOVYr?=
 =?utf-8?B?R0t4S2FSQkVTRWtrM1NZSjhUdENYTWVIU1JtVlFTKytscVd0TGJtdlVGclBZ?=
 =?utf-8?B?eE11VGNubGxVQXlmZXlraG5Xem9oUkQxdVVubUR1dGp4a2NSa0c3VHVNcHpI?=
 =?utf-8?B?QkEvS2xhODZwY3FaajVEb0tRQmNKdFFDUGtkOExQVHc0MTVHU1ZQY0VDWUQ4?=
 =?utf-8?B?bVF2TVgxS0ZEc0RRMjg5RFo3TkdBTWFmVk1rR0tNWnRCR2tuNXNFOGVUN3FE?=
 =?utf-8?B?ZnFHZFdJQjR5MUhnTEVMRVpxM0tMVncxbTZwTW5RT0YxRUlsM25ITU9lbEtp?=
 =?utf-8?B?QllKSXhETDR2cjF3WkFBYkJKSUNOWWE0YWRSc1dtOWdjMnBnZm8yNTcvSWdn?=
 =?utf-8?B?Ulgyd0dCcTdhWHRHYXg4SExxc1pQb1pNSzdqalpvVll0bTRWaGpkNWU2QjVF?=
 =?utf-8?B?TTUxSjdzZzA0VkdjNzhsTDZleUthODJpdndNK3JRa3FoMzlnclNwOUxQeXk1?=
 =?utf-8?B?NXFUMGZMNjZ1Q24vRFpPcWt1Y3poNlhPQS9sR0pGNVJZU0VSNkhZSVpFSDlm?=
 =?utf-8?B?Z1F1OExFbkNHaHJKOEh4RFV1Z1pCNEFRNjM4NllXTU9seEFMejVsbjdObWpp?=
 =?utf-8?B?T1N2T0xZZm9WeERXS2g0SEdkNzRCRnJCM2djOE40OU9Gd3RZTmRNL3Z6cnBT?=
 =?utf-8?B?V21vcnBPZHdGamZIcGxIdHZoT3d1SDhUNCsxL1k2K0lGc0UxclpReko2N1Bk?=
 =?utf-8?B?bHBMT1ZRTW10NFdDVk5IaU5MNVdRRm9ybTNFajd5cTZCVGZlV2RWdm5jcUVN?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF2CFF6D92498E4BB9588FFD665BDE6C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1c0ffd-786f-4db6-6831-08ddf42861da
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 07:20:43.3962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKmaqdk9QvADPoSx/BJD5Y7ybSvI2mZej+0VO7Etq5USBow5suzMDzSHPVgm/3mjPu5GvG7h8bzqA5vRikQLAIBXbrsZJr6XWQVE/9YCrgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8517
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 07:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223388

T24gTW9uLCAyMDI1LTA5LTE1IGF0IDE0OjM5ICswODAwLCBNYWNwYXVsIExpbiB2aWENCmxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBk
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2
ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IERlcml2ZSBzZWN0
b3Jfc2l6ZSBmcm9tIHRoZSBXSUNfU0VDVE9SX1NJWkUgQml0QmFrZSB2YXJpYWJsZS4NCj4gUmVj
YWxjdWxhdGUgYmxvY2tzIHRvIGFsaWduIHdpdGggdGhlIGNob3NlbiBzZWN0b3Igc2l6ZS4NCj4g
V2hpbGUgdGhlIGRlZmF1bHQgc2VjdG9yIHNpemUgb2YgbWtkb3NmcyBpcyA1MTIgYnl0ZXMuDQo+
IFBhc3MgLVMgPHNlY3Rvcl9zaXplPiB0byBhbGlnbiB0aGUgc2V0dGluZyBvZiBXSUNfU0VDVE9S
X1NJWkUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYWNwYXVsIExpbiA8bWFjcGF1bC5saW5AbWVk
aWF0ZWsuY29tPg0KPiAtLS0NCj4gwqBzY3JpcHRzL2xpYi93aWMvcGx1Z2lucy9zb3VyY2UvYm9v
dGltZ19lZmkucHkgfCAxNSArKysrKysrKysrKysrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IENoYW5nZXMgZm9yIHYyOg0KPiDC
oC0gZHJvcCAtLXNlY3Rvci1zaXplLCB1c2UgZ2V0X2JpdGJha2VfdmFyKCJXSUNfU0VDVE9SX1NJ
WkUiKQ0KPiBpbnN0ZWFkLg0KPiDCoC0gZHJvcCB2YWx1ZSBmaWx0ZXIgb2Ygc2VjdG9yLXNpemUu
DQo+IMKgLSBkcm9wIGNyZWF0aW5nIG5ldyBzdWItdmFyaWJsZSBmb3IgJ3BhcnQnLg0KPiANCj4g
Q2hhbmdlcyBmb3IgdjM6DQo+IMKgLSBBZGQgLXYgb3B0aW9uIGJhY2sgZm9yIG1rZG9zZnMuDQo+
IMKgLSBSb3VuZCB1cCB0aGUgdmFsdWUgb2YgYmxvY2tzIGluc3RlYWQgb2Ygcm91bmQgZHdvbi4N
Cg0KU29ycnkgZm9yIHNlbmRpbmcgYSBwYXRjaCB3aXRoIGluY29ycmVjdCAtLXN1YmplY3QtcHJl
Zml4Lg0KVGhpcyBwYXRjaCBzaG91bGQgYmUgdjMuDQpBIHVwZGF0ZWQgcGF0Y2ggaGFzIGJlZW4g
cmVzZW5kIHdpdGggLS1zdWJqZWN0LXByZWZpeD0iUEFUQ0ggdjMiDQoNClRoYW5rcw0KTWFjcGF1
bCBMaW4NCg==


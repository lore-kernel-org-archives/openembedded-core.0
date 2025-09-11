Return-Path: <macpaul.lin@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE95DCA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 09:15:28 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web11.41896.1757582121201784980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 02:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=GC4HWRtO;
 dkim=pass header.i=@mediateko365.onmicrosoft.com header.s=selector2-mediateko365-onmicrosoft-com header.b=Soq8cBl+;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: macpaul.lin@mediatek.com)
X-UUID: d21d41ae8eef11f0bd5779446731db89-20250911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LPSQDMTSGOmttlNzi4giVuFkAM7+2MT1e1MR2xX0EY0=;
	b=GC4HWRtOTczPNH247K5DjXDfSp2YuNRSUdNemZSblLV3Y9uc3RBmvJXPZCsZroNWeehwrWUBDnqaO/NwsNX2rj3u6lAco0KQEXlGKzbOgxQzjsKLEhpS7SWMsDqjq+c/mCeVxkOJQClpcXRmpRatg3Z4HP96K5ZnuQiMMCVmRIc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:0b734012-c47e-432a-a755-ca6824eb8467,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:2c59716c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d21d41ae8eef11f0bd5779446731db89-20250911
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1427075493; Thu, 11 Sep 2025 17:15:12 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 11 Sep 2025 17:15:10 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 11 Sep 2025 17:15:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJpYRnmuv3rYDMie1rI7sMo88VqXzfv661JDi73s2Hehjra5LvEAKSmHbQ7tc+LYTlrs6OJZqLO2vsWwnwmPyzvljP989TTE2bP3pJ07F+Ab2URCLxOvh7RbpeTa9h5TaR9qyzBI4I/iXZPFrDO95LZYcsdxTWAcsNtzFaKvPnT9S1Sz3lEN9A3S/sJSEU8BGZZPjUNLOtupRtQ4hlRz0nkmwVGt6FPg5kYKYMWLopgW3HIrLpm1km0u+rTbZnAzNIYkG5fhx7VwRn3i6LArNkSZ2+Wj6Pzo7Iw9dC4FuWDxvbGCbVbpYii70equLbzXFYNi9XgDck2o145Qq+v3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPSQDMTSGOmttlNzi4giVuFkAM7+2MT1e1MR2xX0EY0=;
 b=q9Ja8xbu+tsR2/R8X4UB/oclDEtqkVnxoA+NUkDqUi+VuviPzY3uiIOeJm2A41z2xQ4bCbu4WiutW5+38/rfkzsZZIQs70MhEg9lQzf684vdDI5B2BZ6FRXphn8uEWpQcRrHJKrwRoHTHAQiBledV2vpvmLXkiWwkH7OCBeyyZ77IWsvDlE/xKqtIKw0wtyc64lfX0pe7F60TdaLinN74zWfOTCnjagjjdrF4503SwsIIneD4PmZ1nCWxSyjFKJ1eBqwAF5JUI5sL5+9N4yR9Gd0GxIlOL5CnRQwxQdU2F590fXUnJzDJwik0LhA2eBtJuvbbBYz0PVWoOPYDLHqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPSQDMTSGOmttlNzi4giVuFkAM7+2MT1e1MR2xX0EY0=;
 b=Soq8cBl+eTYeHSJTGSXGMGxTHvHG42EaKn842w4pFBvqaBFyYyItsiZOuPpRofdwyRUMy/7RkrRba5vbcj6UAzW2ru8fFUFt0+SACCeNa2T38SRgCw2Q4ENq8aIKrnWRsS84wGTEkVOYif5xYWeN+XRR/bExL6qYrdmPsjPRqM4=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by TYUPR03MB7231.apcprd03.prod.outlook.com (2603:1096:400:357::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 09:15:08 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 09:15:08 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"alex@linutronix.de" <alex@linutronix.de>, "otavio@ossystems.com.br"
	<otavio@ossystems.com.br>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "macpaul@gmail.com" <macpaul@gmail.com>,
	=?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
	=?utf-8?B?UmFtYXggTG8gKOe+heaYjumBoCk=?= <Ramax.Lo@mediatek.com>
Subject: Re: [OE-core] [PATCH v2] wic: Add support for variable sector size
 when creating ESP
Thread-Topic: [OE-core] [PATCH v2] wic: Add support for variable sector size
 when creating ESP
Thread-Index: AQHcIgOks59VkvTDv0OSbUrBBysDVLSMCTYAgAGrlAA=
Date: Thu, 11 Sep 2025 09:15:07 +0000
Message-ID: <099dfd149a0490621efb10c45d7a038b03f2b673.camel@mediatek.com>
References: <20250910033310.2424072-1-macpaul.lin@mediatek.com>
	 <DCOYACHAEF9A.31YT5ZQTUYPRR@bootlin.com>
In-Reply-To: <DCOYACHAEF9A.31YT5ZQTUYPRR@bootlin.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|TYUPR03MB7231:EE_
x-ms-office365-filtering-correlation-id: 3f8e9d4b-51c2-4290-c581-08ddf113b3ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VzdRcEVGbE1LMDdtQVFHVzA2S3AvTWIySEY0VUIyOWtuWFFnb25IRGJaUXhP?=
 =?utf-8?B?bGMxYzhBN2tITU5TWlk1US9lcE96YmpzVWR1VGJoUVJNcVI1QXo2UVk4b1JF?=
 =?utf-8?B?QzZBMjNJcElhQXpRVFRXTnZRbWkzbjNhcElnWW1OaTZGK2NYNVhHOEpuMkhD?=
 =?utf-8?B?OUpDV2tJbW8yVFVkdEhTVWowb3hGT0gwR2JCYytPTHVpVmU2N3FISkY2c0Zj?=
 =?utf-8?B?SzVHK3JJOW1ZRk9zQXJuSXhlTmNzenBMaVpyK2FJaW1kMkdjMW1DYWpZZVNw?=
 =?utf-8?B?d0dPajFObTJPcVhuTVFORUlObFlGS1puajBGZTNvS0xBMElmdzNMSTQxMjA5?=
 =?utf-8?B?aFl0aTludk5uYzFTNC9rL3g4dDJmdkFjVnUwcXJkQTNBeC9wY3hQQmsrVFlD?=
 =?utf-8?B?QytrS2ZtclFvakZNRGRTeUVNZnhNcnhlQmZyaFJkSFdka3ViZElBSFRheW8v?=
 =?utf-8?B?dzNHSXVTeVA2bVRPaWZvNkdra09TKzlyRHhZaFBacFR0TGk4UGloWGpEQ1lM?=
 =?utf-8?B?WEdGUVRybkRsNWh1TUMrdEpxekNiempWWFVlVlphNXRCb0Z6RmhTMlArV20y?=
 =?utf-8?B?bU5RdFZYc1F4YWhnMy90WTB5Y2x4OGtSUkhpNGtzWHJWV2JHcGRoVzhpS3Vu?=
 =?utf-8?B?UDhHUExZZVhJL2xnajREOU03b1VoY3BTY25pWTA0ZnZzaDZxdHRwRHdMWnpx?=
 =?utf-8?B?NkQ0OFozdjFNN1krWjY3VlpJN3VnR1I4eHVHMG42d01ETm1pNVpWSVo5YnlI?=
 =?utf-8?B?aExmSW5KL24zaTByZTFpaVVzaEdxTmRZZDEvWUY3czlKRzFqT0tJeHFsVmlu?=
 =?utf-8?B?eHM4Q3BlemYyR2cxSDI3MlpmVTY0VmdUNU9YMW15NUJpSmJLUGg2bENzblcr?=
 =?utf-8?B?MWxzK2lLenpOU3hlRFQwRjNBdHVFRDEwWFB3ektZQnU2QitVdnRkV3BmdnhN?=
 =?utf-8?B?TXZOcVRhZXgzTGQvNnltTm10SUI4V3JnZG9EQ0VVUzdEY1lhcU9rU052cDlk?=
 =?utf-8?B?MnZ3bjVVcjd5NURXM1pmL1V6aXpYL2gzTmZPQmlpVEh4SVQvNDc2S1VmRG9K?=
 =?utf-8?B?dXJ1RUt2T00zdmlWTjhDR0I0MUU4T21YU3M0SVFSRFhvR2tXQ3NZTlJJNVJI?=
 =?utf-8?B?YkY3RzRYZHEyekhlZm81MnAxK2c5cG9EN3k4aUpGV1NjeGVIMmx6RzVEU3Ny?=
 =?utf-8?B?eDRvVEQ2WldwR2luT0tVcDI3QUJzdm1QYys3RHlTUjllVHN3YlVyYXhOZ1E1?=
 =?utf-8?B?T2hLbkIzRlZxcC9ncWJHcTlUbkZmQ0lRd0JVQTlHMk9tUGVJSERaUDExZkJB?=
 =?utf-8?B?dU1NZ24yYkNXRDdvbTBubmhyc1ZqWGxHbWRjZ1BIZVN5VUU3UitKaUViSUFx?=
 =?utf-8?B?ZkZHWFp5Q0Z2L3VFbXZpQUlxenJvNENzM3g3Y0J0VUx2aDFETzNEQ2tkcmV2?=
 =?utf-8?B?Y29IWjlYdTZBOVpMZTZsbmFFSFNlNy9iVjE4Y1pRdzlIN2tqS21OdUJZU0xG?=
 =?utf-8?B?bmJjUXJ0bWl6UnRvSmkzd0xRUXpNWUM2MERjSkorK04vWk5CTXQydllobEZl?=
 =?utf-8?B?bkhqNXJnZ25KdGVsMWZqU3lRNkZESndpYmxUNW56ZnBhZ0lxcENXWEtXUmUw?=
 =?utf-8?B?OFN6TlVyY0I0Z2U1UlRJME1HM1RvbUJBaTdvcm4raDlYenVmYy9mZlhObHN3?=
 =?utf-8?B?YmVVM3pORkVPM083M3pINUtEekJvREVvenhrR3JGTXJNUk13Szd3Z1JhalUz?=
 =?utf-8?B?MzBGcmkySzlWR2NaV0U2RWR2cENZbmZ5RjhYcXFkMkxvNXZhblQ3Mi9iU2ZW?=
 =?utf-8?B?VWVHL1d0RjVFVVdSWXU5TFoyTWx1SmRIVmlNK2dhZXFJMlphZUZHT2RjWllz?=
 =?utf-8?B?VWR3OXUyN0dCcnlyb0ZIb0orYktaRWVZaWRpT3J6YmlXZzlEZHNHcjY3WUR2?=
 =?utf-8?Q?Ipwn9EAIRt4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVlZcm9MK0NTbW13TDZraWFYc1Axb3N2cTUwZmlHSWlKVG5MS0NKVDFlQnNl?=
 =?utf-8?B?WnBJeDFpdTBvaTMyaWEvYVBEc2JKQnlRcGY0Y3F3WStVVHQydmVNckQwQnlj?=
 =?utf-8?B?WFg1T0c1blo1ZmcwWXNYTGJ5WmNOeFE3UDJ2cWxYcnZEdlIyTVpEZDg0OFFl?=
 =?utf-8?B?Nk9IM0dva0RocmFsd2o0b25IQlBOR0hDbjNrY0FOUEtFT3hwMktUZzEzUFVW?=
 =?utf-8?B?OGJnS2loblFIY1ZHK0tPdEE0SDF4U0VzTTlpNEdWdGVYOEZ1ZlNESjl5Sno2?=
 =?utf-8?B?ZndtQjFZNXhsSFJ0V2xyVHNSaEdUUG1pdXFuNTJWYjY5YU1JNTFiczdGS2JW?=
 =?utf-8?B?TEhvVEpLOWh1QTZ6VERaL2twS3p4bzlXYklnbHpNVXJGYjN5K3BEaHp6dmtI?=
 =?utf-8?B?cXp6Q1BZVUtWczlBckxEOEpMUUQzaHM1dktYZjFPTmRaZTJjMHVHQmNOUzIv?=
 =?utf-8?B?RFZ0YWpkZnZsWHplcHYxZlpHaS92MXc3RDdLcmZOMDg0YzhBL1dwQXFPMlVn?=
 =?utf-8?B?amx0dzk0UFEySGlGSXViS3dDUVJneDhHZ1o1VEpmejdqV2IwOGFqQTdIcjh0?=
 =?utf-8?B?NHorVXFkQ2Z3L1J0VmdKeWwwSlZDRHBTbE9PWXVVOTl4cno0YlZBQ0x0MXpP?=
 =?utf-8?B?TWYvc1cwcGZtdTBRS2FqUU5MZkZ4R0RVSmFkWGNDR0llbFl1bnhrY2FLLzlJ?=
 =?utf-8?B?em02NFpBR2lDNWNvOEQwc1c2QWFCSk1BWlltSk1sVWhDYWhKSHZpUmZHeTdw?=
 =?utf-8?B?TzFBMlZWSllQSi9Bc2RlVkZXa3BjMTcxY0hGU1YzVUc5bURGQ1BFMnF6YmRT?=
 =?utf-8?B?TDJjTU9xRjNPRVBJdUdVL0EyUXl4N3gyQzVDc0ZGZ2tGQUJmbVJuT2hNeU5O?=
 =?utf-8?B?by9QZWNsN0tCenUxZkVUY2FSUjVZL2IwaFo2akQ1aXRTOGZDaDVRREJHOTBv?=
 =?utf-8?B?anQwTTVQdnpXcW1QdUN2cVhXbkVIUTFlRWdDODZiUFhER3ZRZ091dy9RVzZK?=
 =?utf-8?B?NzlQZTNJcHVSNmZPRjQ5N0pTT0xPMFRneTYrRVNwYlVrbklyWTJmVTg1Qjl4?=
 =?utf-8?B?bVpCRHpTeWdUN3BuaUF6ZnVuN0JKc0k3aFk3WElzZXFFeTJuQ0lwM0FIZzJk?=
 =?utf-8?B?VDFIcWdKR2VMTW9NaEhoTHRzMUhZd1hrMEh5ZG84WDV1MTNDME1nMlBiOTQy?=
 =?utf-8?B?Rk5ncGNqNFJ2UkljQURjZkR1QjFuMUtsa2V5WXpFUk1UdUFScnZxZk1rM2pZ?=
 =?utf-8?B?K21ScDhmUUhDQUwxTGlac0pvRVZ0NUdCZTBUbExlS2VYR0pFU1dKVXdoMHI2?=
 =?utf-8?B?VDdwSEtvNkkzSEE0R3M0RWhOR3NRbUZVRzZtbW1Hd0h3RDBMYVQ4Um9UTVNv?=
 =?utf-8?B?djFiRTl5ZnNFVFYrcVo5MGFpbHdZSjBrbkZEVlFXK09qQzhSaFY0OFhTdFcw?=
 =?utf-8?B?OVhOZ2J3ZG1DemZzY0lkQStnTGN6b1NOWFhoR0tjV05WZUFybG1pR0VwYXpn?=
 =?utf-8?B?L0tNTm5hTGlSdlRON0pOaDZINStmK0lwWHFwWU1weVloWW9lRFg4SG94ZnVN?=
 =?utf-8?B?cEZzZllkdHhkcy9CTks5QXdSc2hwU0JvY0UvSFQ2ZUZ1OVVWV0UzekwxbmtF?=
 =?utf-8?B?eHdEcnJmbTRqU21LVG5jOEhwYlRVcHV4bHVLSXlkNmtabmdLT2xHR0x0cEVn?=
 =?utf-8?B?SXpnTEJJR0pwZ2grdnlIcWZIeVN5bURNNXRlMkt6RG5aNUd6UmJJV0htZDBD?=
 =?utf-8?B?RDJuZ3FmTWFFbDRBVzhKMmJiQmNCRjBqMjVlZ3hQQ3UzTlJIYTRtWVRzcVl0?=
 =?utf-8?B?K05MQVdrQU1aWnpBUnlRU0NoYjhjblFiQktuM1paSUVkYmYyNU02RlVZb0Ir?=
 =?utf-8?B?dGhpQ1ppQkZoM0RCOEdheldaTjVmdVIzNjg5Z3JSMUY0SDJPcmQ4dHorUzcz?=
 =?utf-8?B?NU1RMlV4SjMzZXNHVjRKbU1vZnBZcTlod3hXQTA1VTk4aEJ3RjBDN3Q2NnRZ?=
 =?utf-8?B?ZUNxOXFCSjE3VDJDTTBia2VINkJFamE1ZGRnQ1h0TkNFSm9EYUR6QTQxK2ZR?=
 =?utf-8?B?bm82NjI5cHFMMHpNeXlTMWdoTzNmSStURklneHZ5UWp5andSY1ltVlkvZytk?=
 =?utf-8?B?OUZCZUYyMjRqSUJVMlYxMy9NWm80WXV3aHJlbVdrczJJdUVjZFNpNkVzQVhU?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7D82C492A638E40A9678988FA37133C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8e9d4b-51c2-4290-c581-08ddf113b3ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 09:15:07.9422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xXqpuVoIxOyxJH2T2gqmqA3Md2zT9S4vTEITfprzoixE4fKF3cO02HMWLdiy0Dw2aLyPXa5Vk0OgwAKO5nAMEfUoJUQhqGcqZCw8znDHWsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7231
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 09:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223266

T24gV2VkLCAyMDI1LTA5LTEwIGF0IDA5OjQzICswMjAwLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQg
d3JvdGU6DQo+IA0KPiBPbiBXZWQgU2VwIDEwLCAyMDI1IGF0IDU6MzMgQU0gQ0VTVCwgTWFjcGF1
bCBMaW4gdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gRGVyaXZlIHNl
Y3Rvcl9zaXplIGZyb20gdGhlIFdJQ19TRUNUT1JfU0laRSBCaXRCYWtlIHZhcmlhYmxlLg0KPiA+
IFJlY2FsY3VsYXRlIGJsb2NrcyB0byBhbGlnbiB3aXRoIHRoZSBjaG9zZW4gc2VjdG9yIHNpemUu
DQo+ID4gV2hpbGUgdGhlIGRlZmF1bHQgc2VjdG9yIHNpemUgb2YgbWtkb3NmcyBpcyA1MTIgYnl0
ZXMsDQo+ID4gcGFzcyAtUyA8c2VjdG9yX3NpemU+IHRvIGFsaWduIHRoZSBzZXR0aW5nIG9mIFdJ
Q19TRUNUT1JfU0laRS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYWNwYXVsIExpbiA8bWFj
cGF1bC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiANCj4gSGksDQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2guDQo+IA0KPiBJdCBsb29rcyBsaWtlIHRoaXMgaXMgYnJlYWtpbmcgc29t
ZSBidWlsZHMsIGFzIFdJQ19TRUNUT1JfU0laRSBtaWdodA0KPiBub3QNCj4gYmUgZGVmaW5lZC4N
Cj4gDQo+IEVSUk9SOiBjb3JlLWltYWdlLW1pbmltYWwtMS4wLXIwIGRvX2ltYWdlX3dpYzogRXhl
Y3V0aW9uIG9mDQo+ICcvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvZ2VuZXJpY3g4Ni0NCj4g
NjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvZ2VuZXJpY3g4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1h
Z2UtDQo+IG1pbmltYWwvMS4wL3RlbXAvcnVuLmRvX2ltYWdlX3dpYy4xMTIyNzc5JyBmYWlsZWQg
d2l0aCBleGl0IGNvZGUgMQ0KPiAuLi4NCj4gPiDCoCBGaWxlICIvc3J2L3Bva3lidWlsZC95b2N0
by13b3JrZXIvZ2VuZXJpY3g4Ni0NCj4gPiA2NC9idWlsZC9zY3JpcHRzL2xpYi93aWMvcGFydGl0
aW9uLnB5IiwgbGluZSAxOTksIGluIHByZXBhcmUNCj4gPiDCoMKgwqAgcGx1Z2luLmRvX3ByZXBh
cmVfcGFydGl0aW9uKHNlbGYsIHNyY3BhcmFtc19kaWN0LCBjcmVhdG9yLA0KPiA+IMKgwqDCoCB+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY3Jfd29ya2Rpciwgb2VfYnVpbGRkaXIsDQo+ID4gYm9vdGltZ19kaXIsDQo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqANCj4gPiBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAga2VybmVsX2Rpciwgcm9vdGZzX2RpciwNCj4gPiBuYXRpdmVfc3lzcm9vdCkNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoA0KPiA+IF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiA+IMKg
IEZpbGUgIi9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9nZW5lcmljeDg2LQ0KPiA+IDY0L2J1
aWxkL3NjcmlwdHMvbGliL3dpYy9wbHVnaW5zL3NvdXJjZS9ib290aW1nX2VmaS5weSIsIGxpbmUg
NDE5LA0KPiA+IGluIGRvX3ByZXBhcmVfcGFydGl0aW9uDQo+ID4gwqDCoMKgIHNlY3Rvcl9zaXpl
ID0gaW50KGdldF9iaXRiYWtlX3ZhcigiV0lDX1NFQ1RPUl9TSVpFIikpDQo+ID4gVHlwZUVycm9y
OiBpbnQoKSBhcmd1bWVudCBtdXN0IGJlIGEgc3RyaW5nLCBhIGJ5dGVzLWxpa2Ugb2JqZWN0IG9y
DQo+ID4gYSByZWFsIG51bWJlciwgbm90ICdOb25lVHlwZScNCj4gDQo+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3ly
aWUvKi9idWlsZGVycy80L2J1aWxkcy8yMzY3X187SXchIUNUUk5LQTl3TWcwQVJidyFrRkhWbmdx
c1pWLWhNSGtaTHBCSzFPQTk0S1Y4TlljV1F6STZNSTVSY09LVkptaWRjV2w2Y1V0Slhva1RpNk1B
WWhjMVZhS2xYRExzR1RfOUdLdElnSE83dV9EeW1YUSQNCj4gDQo+IENhbiB5b3UgZml4IHRoaXMg
ZXJyb3IsIHBsZWFzZT8NCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0KPiANCg0KT2ggbXkgZ29k
LiBJIGhhdmUgb25seSBBUk0gZW52aXJvbm1lbnQgdG8gdGVzdC4NCkkndmUgY2hlY2tlZCBzY3Jp
cHRzL2xpYi93aWMvZW5naW5lLnB5DQpUaGUgY2hlY2sgc2VlbXMgb25seSB0byBhc3NpZ24gc2Vj
dG9yX3NpemUgaXMgTm9uZSBvciB0aGUgb3RoZXIgdmFsdWUuDQpOb3Qgc3VyZSBpZiB0aGlzIHdv
dWxkIGhlbHAgZm9yIHg4NiBwbGF0Zm9ybXMuDQpXaWxsIGluY2x1ZGUgdGhlIGNoZWNrIGxvZ2lj
IGluIHYzLg0KDQo+IC0tDQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxpbg0KPiBFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQoNClRoYW5rcw0KTWFjcGF1bCBMaW4N
Cg==


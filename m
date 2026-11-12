Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61.1794497220065422424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 07:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LBfqth5z;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LBfqth5z;
 spf=pass (domain: arm.com, ip: 52.101.66.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Mkx/4LfYaUPJIOeum261WhQWR1TjDtiYhpeKNBf7Y4V80uQlDTOIyFNtsiE4OJx5su2LnA2bUjcTMDaUmCA07Db9oAzzciBkRRaDBtTgg6zdFodZxfPSwN9X9y4RuJT9MNLvvN6f2u1hPD4GkQ6ueh6iG5sjiDhoehP00gWxlz9oAl5xI0RyQOxBHPiCbvkzyb5+Xs2BToiKQIPPtVKNjKW+qhMeZ2kQHi/Q37cBxu0Fjq2RutBQX0skp1r1JT0HEOYLh7xFNCsvU04lllXk6PpBcu5B2dtkfCpaVaV8Urqy487zYK8xz/PQ3ZyM0E8gYQI7NyyekKitFx7Rb4OwzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK05NKgGCRELGBTEBpcB6elPH0hNx4zSv6qkl1+t2Ug=;
 b=t2KPHTnloO86b9xa+aTpaPuCfEgI8nVvjvLn42A9duWaOCQpjSpN7GYi5fN7BOnNGXIX+XFe6CRKs4tnc39XZZ4bBjXwghzIPwmW9CpxbnpFGI3w1QakNQ9gtkeK8HqNZAtMkdf5qs+Zg+5fCRTTyLDVv7MAoV/KQpdM1AD77lbd2p8YCzQ8kRrMDzG9ol9umgPMav9F5GINiNHTOS5pOcRn50W2AjgEQHdecrYMCYUIFUTAhszQWQKNuP9qirpdgxUkujQLS7x63efOqV134o8Q1QbpPS3l7LHlBzM6X1AmZ+Vgpkkg4RCDUIC8EHe7pVJrsK8zzAui9UAbBUG5lQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK05NKgGCRELGBTEBpcB6elPH0hNx4zSv6qkl1+t2Ug=;
 b=LBfqth5zC1boUc3wP5PhRNtQrC6pihBFxBq0qDWe84u7qfzb5Rian/9YSk5mNkXoQ7skWF7ikjDWPxdqhYRLl7ERlg2XEg+vE+j9AUwBPTnzWgSSwXzJ+9CGl7WxPlW4j/REL+Dagsbtsm0A8lMWgP3EPZWKvNP+r9G9i5bYF1A=
Received: from VI1PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:802:2::43)
 by GV2PR08MB337037.eurprd08.prod.outlook.com (2603:10a6:150:39a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 15:26:53 +0000
Received: from MI3PEPF00008481.eurprd02.prod.outlook.com
 (2603:10a6:802:2:cafe::44) by VI1PR04CA0072.outlook.office365.com
 (2603:10a6:802:2::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 12 Nov 2026 15:26:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008481.mail.protection.outlook.com (10.167.240.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 12 Nov 2026 15:26:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T81XZg/XzKhNG3JbMo+3ld6uqGLaWz6xLOV4hTURZ3BMkB1RqjkbSMk4Pu+n7B9AytBKSoz8W91mjB8jMaPUERYpHwkU75W5+PWZwNAq0AhcdqduKxh/0HuNt11OKbzQ2Xbk0G4yn4sN112AHgHw6NqsidBSEtmiGTRea6NU2eXy0Js35/ev9tvQ5OYDgUL2Klefl39XJfa2yiuFcyJ5FBNOh3nnv/QaJd1mIMP8CUTsn/TfNKGN0IopwOWc5+zLwqTG5yqai7ho8x9ftAyDGKSf3lJBz+pqr2tAY3lms7LOG3rtH73iWC3HbmyrxgCHrc2MBRsaUQyYpxsAdQsrYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK05NKgGCRELGBTEBpcB6elPH0hNx4zSv6qkl1+t2Ug=;
 b=bCZnxZ5sBRChx5clfBQpPXNoD2DQ1QDnmyjhzdj0Ujye8pqr4j2tcoB8Ti+taqX1YZdp3iZeASuKF/kRROVCq/eNW/qZluDXl2xSElT5KMOZ2+HFGHqbmRbv0HuzX59nuipwC8Y8Qp7VLckww11JdzvUri5bxwO2rcROnL+DelHstgONzkp4CO+XosnOxvUHwH+B1VdCSpDXLVtJMWWkKBJibKftFdXzqk4xRVX1mY7p7fjRQvdK8/8vEMF1zr4wVqX5VZ6G7DFo2RAQRNR8L99xH2mpHLVJ9jWvgE3Q8pYFkgKNkiQ4gAAte+P6EALawoCRpG3qvEeue7hnWhLhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK05NKgGCRELGBTEBpcB6elPH0hNx4zSv6qkl1+t2Ug=;
 b=LBfqth5zC1boUc3wP5PhRNtQrC6pihBFxBq0qDWe84u7qfzb5Rian/9YSk5mNkXoQ7skWF7ikjDWPxdqhYRLl7ERlg2XEg+vE+j9AUwBPTnzWgSSwXzJ+9CGl7WxPlW4j/REL+Dagsbtsm0A8lMWgP3EPZWKvNP+r9G9i5bYF1A=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by PAWPR08MB8934.eurprd08.prod.outlook.com (2603:10a6:102:33e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 15:26:19 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.012; Thu, 12 Nov 2026
 15:26:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "roosesweb@gmail.com" <roosesweb@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Thomas Roos <thomas@roosesweb.de>
Subject: Re: [OE-core] [PATCH v2] python3-cython: upgrade 3.2.9 -> 3.3.1
Thread-Topic: [OE-core] [PATCH v2] python3-cython: upgrade 3.2.9 -> 3.3.1
Thread-Index: AQHdcoaWpCANtqR6SE+oDkSTJ4HPZbcqjzoA
Date: Thu, 12 Nov 2026 15:26:18 +0000
Message-ID: <97217559-8A94-4D6B-9149-9BB4E6389592@arm.com>
References: <20261108192525.1082675-1-thomas@roosesweb.de>
 <20261108214236.1294076-1-thomas@roosesweb.de>
 <DMT4AZG7HHGE.3SZFW7TTHZV29@bootlin.com>
In-Reply-To: <DMT4AZG7HHGE.3SZFW7TTHZV29@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.4)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB9410:EE_|PAWPR08MB8934:EE_|MI3PEPF00008481:EE_|GV2PR08MB337037:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6423d0-1807-411f-b599-08df40d16146
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|4143699003|11063799006|56012099006|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: qwi28IqQNlMjVRRMZ9QEln28BsexUHS23QYZe+C85t/enDB/H9+hmPk9BXAi07I0rnQ+95qDvL/zSoYulIfKbhqppWzRt9b2/S8QawAT59lC8zRm5QG5uyJJjnjK6hQyr7WC+e0NhYJFDY0r2NWQR4D+L+xhjymZsYpz6r5Mgi0s54VBdXD/yqBmqfxH7zblrCqKCEYUjOWt37b2+l15AxfihKPCb2Hsr8NGsOQhzvxBdwnW4hxkxlAo4VBlMGmaxijE+BeuIZUqh5VjTe8XGvrMudwxB8I1WKK5IuwUINOhASjorh555npzN5xTSn4s1T8X3CIUY1fA8QfHmWtdu1R5Df4wLwNe0KGK9W5IyabzZEdeFDYYELLApj6FUX1mdky6F4LCa4tztwPj7TIGeBtp4EHe3UVyY0mKRXSiKdHZ+E/15fJd3BifHNfD14/FhtC0fTLY4394hDyRXea2k7RXhD6D+DpkTkraiTUto05co37xtBYj4SPBCO5ef36qd1DQFFwuTxGxXI2lFZ21v8sjT+GVXWAgZlwcWoE1XsHNzgklaC5/6Y34JmPg2Mrs+LaJ9TikJoPF4pEyCCZp/cyGEvteurmbflCLwrp7eQyBArmfZ37qreGnf8OD56aNcVmxvmtzsvQhem6SOLQ9SEHQdQkUJXvzriH5Gkyx2SS/p1BepNTrM2MS1FrJd8AYqCKPZ62Glji1thU+OVTfANw0IkaiHNCHQKLHCQnsB7g=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <60FE7AAE46218B4DA905F9AB7ED50ABD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BMNFFgBGvAIMrq8hLAyl3V/T2nf//qCz+EPR51etzkuXL4s8apuTWEjaCbH7MN6nO7Wu1zAcePicnq9hvQEIkwk4/0oeb359OWDnOiGm5CnjWO0uz+F0IKqorBT7eezskTjTWHczLk7c34au/MxMAfhvYw/BEb8iSLuw2Axo38/yotDK3pMrXid0Y6UewXlECeWintgAnG29lDQFAdHgt9ZRPQxyqb5ZF6f/I/Q+UxxHFzPDowM3juQ498fkOcyfiwfQRRuLk7LNdRTs5hRzadKgdA1X9OuodrAf9cRQDV9DLFkCRNwaPkiEJzNWt7GmKTUu/AhBUibtJfWg6OHiAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8934
Return-Path: Ross.Burton@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF00008481.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 60c06906-4725-4c1c-d70d-08df40d14cad
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|14060799003|376014|23010399003|1800799024|82310400026|36860700016|10067099003|11063799006|4143699003|56012099006|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261009223027099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: muny85cYmQQcBkDqy9iwyQ8HN51PotXMSbTrrhaGN1WByIXot74TVLYr2z+dgEvnWJ19c0mHKZLdEPQ6kK2KyxZ2+irhDaVDIR3Yj8WdgQgbYcNBZ61yc1M5Lrfgbj/Dvt4UBWZwAw2EjL/d1HtAJ30mOF1IfOfwq00+N8sPwWHiCr+kJjY+ly2VqYQLtdZKDzKVZMqlExY4LV0XdmkPqBZL0lhdWKuWdSdBpdwXoBJmcTZ5yvc8W2DHKOjaIcwKuCJzTQjy1ESCXfifu76/psU1BT4N8lKkW0fLOkNu9Q1R7L+rvqHAYvFsrukn6RIo/rptbYIFpbsAKxWEteOT8wbirSiUlENYmfafW9ZQtSkWB+woEYZf/NO6OCWiFiL+cqrfvP8oBhDLVmPbtvFbxnoycGUCZkwOgLK3CyjVu78FZ8G0XF6ujf8Slow6zk4pq2MBmLJYTh/NjrKhEOAFWOhJ3trrLq+plR1YSerYSMy3y92mg8qKZLBUk0ocadyi8qlDErAyXd2LNVHXG8jMV+KpzI4+8QpXOWSMUq6FySkM2wmc/AInJ218DKAiD6aGvtXlmci1l/Hmf7yrDFZ4RGFaRH1X8ikG3UZE3gC671kQEn1SHA0Mgr8CyfB2HKEY51Nlw9OjStLK6GQsras0v97XqHllaaIW+kgCvRj95sa1VYsu9j8JiKzStUYJifs7ccqhSujHCu3YDQjcpu7SSQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261009223027099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QzPFN0ehX9n9TRosZ9zx2wMNl+UUfzuUb9IeCYGIqjAR8OoQy4BLrFh3ospa5YdWvbVPUgvbx1EpkfPFHmYkgMCuYMBwT4w77RyDsV/V7xPqwWX8CXbDGsEURCRg9wv9/hOqAVJgmGYxInVSoswD/wWZ4U3KKcgdcTg4nz7Ip+eBINYCvtUug7RsUQi8Auvuv5nnQIBJHQPP+DyD0iE0g+W/+JLEV0Dtyb7653f3TNGqp2pgxtufHlso3sLtUztZkM5sayUO8RPB/CE98FQ1pv5civH2COcjPAzccR1uE8gwaS4lRfUwSspkq7A4erq9x5eXv9KvqzFwr0N8UjGf/1vcGsYPz3kgbKMnFQ140LxO3ZTteJEF+qAMEyXgip64nrhnn/b+jg5Na1qrwJUjxOVE4f3PKnt39EwWM7IcEi85+GsrjqU3v1E6BIhAzfz5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 15:26:53.2119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6423d0-1807-411f-b599-08df40d16146
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008481.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB337037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 15:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250107

T24gMTIgTm92IDIwMjYsIGF0IDA5OjE2LCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUu
ZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gd3JvdGU6DQo+IEl0IGRvZXMgbG9vayBiZXR0ZXIs
IGJ1dCBpdCBsb29rcyBsaWtlIHdlIHN0aWxsIHNlZSBzb21lIGludGVybWl0dGVudA0KPiByZXBy
b2R1Y2liaWxpdHkgaXNzdWVzLiBJIGhhZCBpdCBvbiBteSBicmFuY2ggZm9yIGEgZmV3IGRheXMs
IGFuZA0KPiBzdWRkZW5seSB3ZSBoYWQgYSBmYWlsZWQgdGVzdDoNCg0KSeKAmXZlIGZpbGVkIGFu
IHVwc3RyZWFtIHRpY2tldCBhdCBodHRwczovL2dpdGh1Yi5jb20vY3l0aG9uL2N5dGhvbi9pc3N1
ZXMvODEzNi4NCg0KUm9zcw==

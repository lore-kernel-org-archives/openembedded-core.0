Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1926.1792740019556803780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 00:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=wGNkmqKi;
 spf=pass (domain: est.tech, ip: 52.101.65.57, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYywhZnUO/qYpHkR+2bjr1tdI8bFfoJbMRIFw0i5zmyqzQhSL80DaRMQBJaHVj0wGgl8gRGJku/e/mBB/eNa3wwUGcfNqmqrTF4vh5qbK1ak8o0wt/WIh/3/NIqm/8AEwwLDHlVRGi3lNWZx1XWrfkAxmb0jGyjIzMkpOsfKVARTf/1sfjWGdaYtvWJ+cOIbIqBX5YlCGgoEAe3+vNSSog5yNhzmZFq/Yl+Tb2prprZb9LMKtEAreavJ4xDtob6eFfhrxtLYuGBApy5QFgJGsmQ7AI16XMoXW+P6clYlmYYBJoftwIk/gUxIl8cSJx6NWTaQ1YHt0uIn0FKRg4Dn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdaLxnSgvs++S++q3R955PUDQ0x8UprqqL6UypLokEg=;
 b=hhyExItyJlEHZniU/ayRpesUslprVmLkraQkiSilQnqUxZlRcyZPQBLMEB/vFnz0iimrFNEGbY2ASyGpzAC1s6gpY27+z8AlwR2NkErC4+HJjU8fdFenX4SF9fvf5wfjcU1h5/5UN6PHoWKdugTXesWtmFY/ggy0xy58X8kbZcK2wwQt53NNLEuimJsXaCA6BbHVSziRgS7O3hNauAeLwI51mmZEWv0XFQuRi9LOZJwLlrqamw6XZfjnKBPX5boQKAC4u421yYlXIOQ6QttTrojBmTfN9vpKCR6HPRTcyTWX2yLbonhuLm5vlLSmTWtlfJp2Dfhstk2A+8LqpmE3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdaLxnSgvs++S++q3R955PUDQ0x8UprqqL6UypLokEg=;
 b=wGNkmqKiiK5pdv1GEda2Z0YFXmCTf8bv131IhJ1+C0Equu6OYlU7YN2D5Vuw9/KRhkUDe1YGar0pVMLg7GiKlaMTK076EY3lu9a2JuYdU7NexnxqcpCuhh0WwnVA0LkcGYAWIG8WtKl5SyqY76QLiIOnQlrNxuoO2KCBpV6XWvr4A5DQh48ypycHV0s7YUl7PS2+R5vKMJ6cvuP5ta0eAOdYUkmvdnLGoVLB8bNcyTcvF8fHzzqHfYjsqxQj1kntrIIPx/Gs2Qr5FIIbAMjRadmj/Q723GgDNrfEPEAiuzTGjxbJPLWjb1bBaYnE1AB6wUc59DabSpFHpUjw2fNWnQ==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM0P189MB0593.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 07:20:14 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0522.017; Fri, 23 Oct 2026
 07:20:14 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v4] libsoup: add ptest support
Thread-Topic: [OE-core][PATCH v4] libsoup: add ptest support
Thread-Index: AQHdYI5FqAJ7jUr68kmQCZH0aRCXrLcJgh0AgAE6mas=
Date: Fri, 23 Oct 2026 07:20:14 +0000
Message-ID: <PA3P189MB3239F53C2112E7E99F1C4978FE642@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20261014085044.14497-1-pratik.farkase@est.tech>
 <20261020122642.28387-1-pratik.farkase@est.tech>
 <1325FBB0-1DC4-48A2-A4AB-72F22FEE1D33@arm.com>
In-Reply-To: <1325FBB0-1DC4-48A2-A4AB-72F22FEE1D33@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|AM0P189MB0593:EE_
x-ms-office365-filtering-correlation-id: 7f289212-be43-40d2-2768-08df30d614e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003;
x-microsoft-antispam-message-info: v0wpHhYth84hhn7MwWFDJuNvKQmQFOVOQto3eFf8GqlTV3UA/tAi9M7wSdbHbQ07Mn4TpQppz8cVB9OTl7Kb0bXiX3waTggRAkumZE/FtJPERtBGJPYSNXBNMj1IkCJkBHS8g/XZpYD/zD9MQYACgvbagHcUMXU13S6CS9kWw9TADHqp0YIOsEcccyUu0joIn59LyrR46rCV6wYsTwx0MiEV7+PMESTOS7ueHL2sit18H20H0Y45D1y62BuJbPC1Tt5TNv1YbF0klk3HqjAaJL3bvUe9iUKicS/QQGuzFEGrSvh6YkEIVjaZTVE+GlUk+973RRFifU43HTs9gj3VawaZnwJiKWq+Edo4bOEJc0ZjcVciPD3YrqZNHeK8xI7MYZu9+Njl3Mly8e8yOCNxbFoOoyzkyEW6yquqxvFUGM7LMSDHZEJwmJX9KGADWd5nn1ksnOP+djzu598TgWsZKZMxHWioD+aA7OHsxx4ImiJEsg9MkvXmgbLJJQ42pR5mTrvQY3bPS9C1KLTQURUIllgFaSPjjOypoLK2sbNxcKVE8h34UMh2BZxsPF0KytLwkv/b0aer67UzoWbRjbII/RuYEivheSFw4AfiK9NbIr4z5KXA0SiRds2Diq/kBckOfcC4ObJmqXp6X8E6KUPF/y/F2rzheQYorz+SJySSY72ziZfyii9TN2qMJ5DeeidITZARsT40y0yD6gLH2zQUmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VwJDAKl9yOcnb/EbBJTk+hvLVp2q0BrA/m7bzK1cOdAZesoWeFu+g+s9wQUp?=
 =?us-ascii?Q?ZxSj3tIOrYy5JCrCHhpNOBQft05LTByRYXd94QPVNbgG0KIUStRt3LcoHVqV?=
 =?us-ascii?Q?3TUlp+1JX6OFYaXSK24Y1azuH+JwuSM3ke0GPVA4nk129joSm96cIH8dq6D1?=
 =?us-ascii?Q?fjy607He+iUpHx31zBhRuVN2ajScLvdEhFsrT2idFBrlm9C0QBaDWlxGQMyx?=
 =?us-ascii?Q?oNfFcu9Z9xIN9+A427oVAWUB5eH6hbw32dfDRiQW5jtIRG4ODcm6qI7/D0GK?=
 =?us-ascii?Q?nfWV+8L6OWGoh/Nk02q9f4mRJmL+2v1eEahBWo9eLM5QqzPFRwP7d/CNkZlV?=
 =?us-ascii?Q?P5lCzQO1oFmK6yA4r2Ti5ECLvKK/M7QXfpXKez5dA4vj5lKxRM95F2YC7xeU?=
 =?us-ascii?Q?OFa3T8VkVVEOJW+E0NqJQG0raVDc3L6/tRirkkXbwOAGmu3bNkG8q0muilyH?=
 =?us-ascii?Q?CFyhuCngvK8sFbKyMxlkWa4BzYa4I2RKPYOFfe/9vb7ArsfqoF+mCexLEMKC?=
 =?us-ascii?Q?TgHCLrz8Wf3iLydn2Ph+ep2rD299+EpwJvZqp8A3XhYGjChnCWr9T0x4dPso?=
 =?us-ascii?Q?jIbJKMJu5jLXSKcMvgzB+eQ3M2M6YLc4uownwF290bbNU/1t4yjlFXVOqWfV?=
 =?us-ascii?Q?8DbFhawkehAiwHmqF7rHdsnX4R8YweXcxCP8E/SNofCKcic8qvgNodU1+1AV?=
 =?us-ascii?Q?wMAqEHvBJOg8812x+8rUo1xIolUH3a2Y1UJSHCpI6XOtsKuqi8UQXjneIa7G?=
 =?us-ascii?Q?3dZ3IdO+dnuMQ8eCdWOm2fZXif/N1vklqp9qHbZwmk04FTMkfgQJ7X4EGSJq?=
 =?us-ascii?Q?rO3qb3kUMWNfeDNcmpQUC3GaaAVV/ozF/cYcF5XtzuUlh2+wroRte5V/Ljqc?=
 =?us-ascii?Q?5CT9m2RFykgCC9YbU4OYUA5fDmgkWupkzHNjzVpxpNJXy4xAJ0JclzQv8R6g?=
 =?us-ascii?Q?/gvhwePVKd9UDDK63O6hUGCzP2kEGSxyXcbif4jTkJCPqWK8hugDk7oxtFcn?=
 =?us-ascii?Q?3pPMMDL7cg3idzsX+XhTwc9cEbw+swIYcfvnqutmfk0nx1iFC37v4VYrhp/8?=
 =?us-ascii?Q?NceFCJImz0SFAfDj+rkZT/goXmoaLvXevBv9skXcE8MH0xJtBwTDCjCuzFJq?=
 =?us-ascii?Q?msBJUVAgsp71dg1wGAr4ZcDgMhoeUCUM5SIXQu3/pl/pzBsjLgjMf5atCxuX?=
 =?us-ascii?Q?WCTCqbExPzgql1WajQzwnL1an9gMX+UwnjzV9qkk7Pakjn0p/cWms4cKZ5LA?=
 =?us-ascii?Q?t9KWbSFYnSZrNwt3Wymld1iBjq/VPUmoqgutvaGv+Y8mJSpirW80eqD0uEWO?=
 =?us-ascii?Q?Ie5wbd87UiGRV3VrzmCJDDhOfbFs3BVkiWJET7WIuEITte5dSqlCzL1ogvvQ?=
 =?us-ascii?Q?cNEuP8nENvc7WRTu9MtMsWSDuxvmdRn6N9j345GJjqbCqqOV8sCAJEUXngf1?=
 =?us-ascii?Q?sN6NtBPJkq+wV3F2+0VJDhz5SsdsH3ovrepaQWZlQE2U15JGEH+DgRbvQpWK?=
 =?us-ascii?Q?cPDpX+j2/Uv2SdzpUO0uuJ1pSuDUwHmosUzrw4VphmfjtXv6I2u7QQYuCgdu?=
 =?us-ascii?Q?gNxosqn430nMPKlI+KacvtH13JNNpUpLXzylFHT7moFi03Y2A25vi8QW494W?=
 =?us-ascii?Q?PkcGpRUI9yR57E70mJ8pz6Z8CCliRE+lj3e6OVh06cJ0K7wx4fKCXBDDoUxG?=
 =?us-ascii?Q?E+z5p5UL1jEo6dIFvUI0qkf4/uQcs1prwyCdOZQ5u3ToqpUY3fefasT66det?=
 =?us-ascii?Q?cKlrUEsk5w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f289212-be43-40d2-2768-08df30d614e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 07:20:14.0967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6CF/60xIuXx3QU1XO8MU/M+G+bx4n029f8kPSmU6Yft3htGxIsf/HYliMvDJXwc4T8HySwB0XjFSZ7NUqQ/jag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0593
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 07:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248485

Not at the moment Ross, I will file it.

Best Regards,
Pratik

________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Thursday, October 22, 2026 2:34 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v4] libsoup: add ptest support

On 20 Oct 2026, at 13:26, Pratik Farkase via lists.openembedded.org <pratik=
.farkase=3Dest.tech@lists.openembedded.org> wrote:
>
> +# These tests abort under ptest and leave the binaries in place:
> +# - header-parsing-test: a g_hash_table_size() assertion in
> +#   do_param_list_tests() does not hold (returns one entry instead of th=
ree)
> +#   with the current glib.

This feels like something that should be fixed.  Is there an upstream ticke=
t or fix for this? If not, can you file a bug?

Thanks,
Ross

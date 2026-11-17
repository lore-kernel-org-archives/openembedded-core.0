Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16808.1794919047032907590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 04:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=W6gcm94B;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=18356; q=dns/txt;
  s=iport01; t=1794919047; x=1796128647;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=DF1V/DFx7Um2aw0DNHOTxd1+MXAer6zvraCyzGnAq98=;
  b=W6gcm94BnYf8ZNZq2aF3Lv5YSEA2Ae+wj9fvjXdBILmxRdZVWwZzdOH/
   4cmAX/JHpGp7JbJjYJZdsvafYbW+HKdVjDmUzYzshCWS78UIzWTvkn4D7
   rY/l5LNjK81ChA3cf+SjOxkgxmho2qRiZjbr1RthOdFqMWPXVKWDHaAqV
   43Fjf1DSzBc7tzCYpKuMud1+hqBRDJr6+swK9R7iK/OywE8KtJt1an2oE
   AwfidhQ7PdBwgWT4sZHdPXmy/jovq0CtqvHAn7p3ka8zbY0pGaieQpMad
   Z6mP93KivJjajfaBX6NL2WzM4qZflMBcwoUQqtPOUCYM8KBDDWNVvpMQr
   g==;
X-CSE-ConnectionGUID: mWeXO8X5ST2priLGzyjNhA==
X-CSE-MsgGUID: 5EaXikTcSuqKyxYanr6NkA==
X-IPAS-Result: =?us-ascii?q?A0CcAwD+SPxq/40QJK1aHgEBCxIMZYEgC4E9ATBTgQkCg?=
 =?us-ascii?q?RESSQOIIAOFK4ZZgiEDniaBfg8BAQENAi4BFQ0EAQGFBQKOHwImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgEBAQEDARE5AT0CA?=
 =?us-ascii?q?QgRBAEBAS4nCh0IAgQBEggagmGCHRZBAwECDq5JcwKKHXiBNIEBgykBPwJD3?=
 =?us-ascii?q?A8VgTiFQoMEGwEBBSZJbIJdgSMYARuEYicbG4FygVeCaj6BBYFcBBiBDRAaE?=
 =?us-ascii?q?YQUgjAEgiJ6EhuBUWoJik2BQAEBgU+HWlJyIgMmMywBVRMXCwcFgSUQMwMgC?=
 =?us-ascii?q?i8tAhQNIg8aBS0dcAwnEikXER5YGwYFEiAqQEMwK4ESgQVdgSsoXgIfRi0Vg?=
 =?us-ascii?q?XYCglGBI10CAUlBDgdFUwklPgUSRyQiCBIJARMaLAqBGjU8CSY/FQxbDAsaB?=
 =?us-ascii?q?RpHCAILAgx0KBEQEx0eJC8FGiY+GwqBDicgbT03Bg8ZAwSBNQWSMwdbgjZiF?=
 =?us-ascii?q?nkHJE9+DR4MAgIDCBkRB5M1Lo8To3kKKIN5in6BJo0+iDIXhASUGpJUC5h9I?=
 =?us-ascii?q?41nlTUshS4CBAIEBQIRAQEGgWg8gVlwFTuCZwkJQRkPlzfCFXkCAQEHAy8BA?=
 =?us-ascii?q?QcCBw4DC4FokAACJoFWAQE?=
IronPort-PHdr: A9a23:VjOK8RXflTBFTF4+qDdSPGOtMq7V8K3PAWYlg6HPw5pHdqClupP6M
 1OaubNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:wrgH3q55qHUtohvc1wRg0AxRtGHGchMFZxGqfqrLsTDasY5as4F+v
 mFKC23TaKvZNGOketAgPYy/pEMD7Z/Xy4RgTAo/qyA0Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztNtPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eOLIVysEnMTx1y
 aYAMjEpQQKShcS26efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0Qn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZC8aIKPJ4DSHZ49ckCw+
 0/Pz2X6PhohKcW82Cq0+3S22MnMtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:Rta9pKy7vZjM+NXFdRRIKrPxJegkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5uxoWJPtfZquz+8K3WBxB8bvYOCIghrSEGgP1/qH/9SkIVyDygc/79
 YuT0EdMqyLMbESt6+Ti2fIcadE/DDEytHUuQ609QYKcegeUdAZ0+4PMHfjLqQZfnggObMJUL
 Cnyo5soT2mdX4LbsK9KEUkcoH4zeHjpdbNWzJDIwQoxjWvoFqThYLSIly1zx0eWzRAzfMY93
 TZkwv236Ons/uq4B7R3W3e4v1t6ZXcI914a/Cku4wwEHHBmwyobINuV/mppzYuutyi714sjZ
 3lvwogF94b0QKQQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINidAfD4UZIhqA+7E
 sL5RPai3NkN2KFoM3P3amOa/isrDvznZMWq59Xs5WYa/pGVFYel/1GwKofKuZwIMuz0vFWLA
 ApNrCc2N9mNXWHcnveom5jhPaoXng1A1O6Z3JqgL3P79CT90oJknfxA6ck7y09HJ5Rceg228
 3Udqtvj71AVckQcOZ0A/oAW9K+DijXTQvLK3/6GyWtKEgrAQOFl3fM2sR82Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmJlG6ArETmmxVSnkjpg23ek1hpTsAL7wdSGTQlEnlMWt5/0ZH83AQv
 62fJZbGeXqI2fiEZtAmwf+R55RI38DV9B9gKdwZ3ue5sbQboH6vO3Sd/jeYLLrDDY/Q2v6Rm
 AOWTDiTf8wmHxDmkWI9yQ5d0mdDnAXp6gAYpQy19JjvbQwCg==
X-Talos-CUID: =?us-ascii?q?9a23=3ABVyAxWrGusCkJ+CYmki7Z8HmUcUaf036nEeNGHP?=
 =?us-ascii?q?iEXxobJKHWF22+Ioxxg=3D=3D?=
X-Talos-MUID: 9a23:/tBa9QqgcDgpzTeHAeoez2xPPfdp4JilM10UsoQWisCCL3JWOB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Nov 2026 12:37:26 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id D1A6E180001AE
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:37:25 +0000 (GMT)
X-CSE-ConnectionGUID: /P6AhHtbQeykRoCEYc+92g==
X-CSE-MsgGUID: D4OWA6xhSES909u/Chz3Kg==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,218,1787011200"; 
   d="scan'208,217";a="92799853"
Received: from mail-eastus2azon11011027.outbound.protection.outlook.com (HELO BN8PR05CU002.outbound.protection.outlook.com) ([52.101.57.27])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Nov 2026 12:37:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fToSLMPCZI1kcXqXCDoJPBaFHC9alwE0o7ACMupoCnJ5qEv/gTupzL6oMlI1oi8jXgJ5UY4IMQOKeyf/gUxXT5pOIjkfnuBWLQxWkTnDwxVZQJs0UmAGnfqV2Zo2NuTFagvuWG5Wu4llaLhvfG+tBngRNwsASny3hqVG1FncJYGzBt27PYUzOZkWRdly8fjNRaCpym2DeP9BIFtN5aodbKP6OQ6/95FWS7jncH3EAcBfPP8Yu4OPCni+1Q7cFaKlfKxVxLmYZLdi/y+XgewbP84Fz5DJviEGpDl6uFo+Tu8baHuUYigBLp2rtFGyngHysQRc16i6DkZuj/BmOJjM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF1V/DFx7Um2aw0DNHOTxd1+MXAer6zvraCyzGnAq98=;
 b=BFtYCE4rluEc9Mz6bXd4jymq0ur0Y2PKIvgy897Hk8Y2ahyhKNx+Sb3UdNRihU7DCpmS2Z9xpzbSIDZdiqHpp5DfricctS0Tmfqf3cmYzcAacOoOfkNmNRLN7YmiD5DGkPWSzdryabRNLfQ9qhaT5f3lzmRMSD0aEqD4NC6zZoyTarKwpAuXuYRnn34e3qiHnjBigyjTQV+wzOp7jaAlzaFMc/LFAgj0U9aYLEfQ71jtvDEO9I6LlQY/0ss8AXqMpRRjfeOs4gBkWFyHHGB2kj07fcEe4S9YU/qsBvSkJcWNjPOtEMdawMsJJd5w/5KiaYeWKTDb3xfKj50rzx9zWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 by DS4PPF6CF7B12C6.namprd11.prod.outlook.com (2603:10b6:f:fc02::2c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 12:37:23 +0000
Received: from PH0PR11MB5952.namprd11.prod.outlook.com
 ([fe80::baf6:8034:a18e:56e1]) by PH0PR11MB5952.namprd11.prod.outlook.com
 ([fe80::baf6:8034:a18e:56e1%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 12:37:23 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH ] attr: fix CVE-2026-54371
Thread-Topic: [OE-core][wrynose][PATCH ] attr: fix CVE-2026-54371
Thread-Index: AQHddJsj0UIA+jyMB0GnKOrjRORNGbcyNeDt
Date: Tue, 17 Nov 2026 12:37:23 +0000
Message-ID: <PH0PR11MB5952BB16E51A97E70C1A794AAD7B2@PH0PR11MB5952.namprd11.prod.outlook.com>
References: <20261105053506.165590-1-hthakar@cisco.com>
 <DMVDDQCWAXQF.20EAFWN8LK8T4@smile.fr>
In-Reply-To: <DMVDDQCWAXQF.20EAFWN8LK8T4@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5952:EE_|DS4PPF6CF7B12C6:EE_
x-ms-office365-filtering-correlation-id: 30ad0784-92a0-4240-5fd5-08df44a78764
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|3023799007|13003099007|8096899003|5023799004|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|38070700021;
x-microsoft-antispam-message-info: CMCV4P3srjqOqHFy2/48TrN8A5tBPfWwQepbf5CgnbODrVcnVFx8frTlUwVWn43KVCTCMp2Oc1B3Ofgt7yUX3aDz8TFpdEgYkUr67t7HtN3T5/rJc3Rn/OSL47Xab3wLfL8tqzbB1QOR0srpSoAxG67q2yEKaYLmn++5M43Gw6bhoZzueTuaUrH1p6fBOl065Dl+4rGLrQAbUCOYsUbV6DDEvhlD99vVF/3fQ+pJbblYczCFr9B77lhrtyy69oUyPchBsPQVlOXVoeQOK8fweZ8T/1O4Oq226aByptCujQyOaKYVEt1Ja5Z5UtoneEYwKO9JFLJfN0nJ1h+KKJemzJSQDt/JgdnFK7fzTbqDhhqknUjjgOzHwa6Ok9DuHfQax754dbfiDlMn5m/xTKv0Jm1Y29IDBrl3dswh601gfJzQ/KEz9K1LHRkguvvC4C1uDx6urJaBDx+kC1BIg3aRy9nVrKRU9WakdJ+Jpz9XuHMj8UhS0pVw+px4rjmXQAxXXDkBns5OU5ERJThEGIX2Vb4CXsprtI1cVkoIarKkBNfD7HQ5mLLFgZJkxdOctuPlhfX2am8TrXF4v3fW0+jvIxSPsMEslFSUqiHXdngtJjfmOCDs4yi9NmWmqQWEIuw+lGW4kU7buzXvSvuX/TQlnjCTlpPc2OZBbrpm64X8OJw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(13003099007)(8096899003)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?QnvHeyZwEw9ncMmxlucsY47HZj0BBeBYeJneDpYOF7eCRLUsfi8TQXlX?=
 =?Windows-1252?Q?3CzUjqMMw7/2xEHsi9bAcSASTkbgY6GswN7s2niISDsQ14+23V92/U9h?=
 =?Windows-1252?Q?8mLfIPcyAwRA7bfjRjsRI5wt0BU9E9djYLYNWRiUEbsQsg0LdAljfg3K?=
 =?Windows-1252?Q?0GmpHC6lELS1CeNsgc0TmIshaFDNWYDI9CQH2v8x9/AVJoIv3VoXr+L4?=
 =?Windows-1252?Q?3ZZWAyf38c/5Tn2Y9+KOyynYSdGlNSkL+Ucc42QyXbe7d2i4NWpwv8pg?=
 =?Windows-1252?Q?jozdyUb75KY9/UNhhSpDJicxEqiEMoTssGnthcs5EuGtILQg5+gwc3PY?=
 =?Windows-1252?Q?MfKkx9BRVfmSMM8YLqypLjJsikTzGEUd+dPqLG2Cv0nCrWYY2+5LOe/u?=
 =?Windows-1252?Q?Frm6dJY0mFrNA3MJzsRR4QVE2A4AMMVCBMzqtg8ww2wz853q+kyP2yd/?=
 =?Windows-1252?Q?exvNomJlNiNBvFc+Dq3BYyaVbLL5HaFF+tJZyAz8Bi5U3Pkd91KWan9J?=
 =?Windows-1252?Q?t+1XFr5nDalM+PnAlJpjJ/kkeGyrQc+LqlIGoX4Pxu1dnrBsO7H+wNPx?=
 =?Windows-1252?Q?Pvko1YSFiMQcRKBDbJCimazwcGLld/rqUm49mFbasHUA9K81syzrv3zq?=
 =?Windows-1252?Q?eXU+J1bUmfDj/WW+amLMb0E4fE2DqM4Kj2FF8Mv0U4g15k4K1jSkppTm?=
 =?Windows-1252?Q?8jUbCnoi2h/mcDjLbliY+Lx/vLCahMqIH9TKGcReWE6xd4CzJ5fe0Nn4?=
 =?Windows-1252?Q?ZHZrgwWGCvA1AERnLdo0f1QFPI29/A0O7rGHXVBDc6pOK4sd9V3Gvwky?=
 =?Windows-1252?Q?LoxL4z7+V+5gE5slX+R8SRayMM530N3kBjQkdXbdOMFks8LXcBE2Rckd?=
 =?Windows-1252?Q?DozTq4ww2M09h3bD9PkyrkkU5DIECItbNb8hDi3W+zUvqi1yajv2wl0S?=
 =?Windows-1252?Q?DD1Aqm8BFvUmjqoCAxWyQ/ZN6D1w35GQE/zjIuN4npew+CJEwPYloN9R?=
 =?Windows-1252?Q?2JXMvjVIGOdvQ5GMqH17rPVHEjyd8i//eDg8CiGzznLGd7uC+TXd8u4s?=
 =?Windows-1252?Q?6WErNfut6jKsqxbAf21Z/Q26gZtHS6BAuj4zRQCeWNqDUo4153tDQiYu?=
 =?Windows-1252?Q?lFQPsODhGx26dBw3ZwloAIWizbiCNP694ndLYpabB3dnklvxODOsdbOa?=
 =?Windows-1252?Q?K0Nnlqu2xF82GeP8Z+C4s+S4Z6XFcP5oBDMXr7h1yzFwGOekGJV/Tdtk?=
 =?Windows-1252?Q?Y3X0VZMnodUIGVMlz8LbuinWWqr0tZ/d356l+htMnuBnDztizDOn309k?=
 =?Windows-1252?Q?vyja4gbgKYF7fuzjyRW/Fq6X7b/iaIr6k7i6bmNm3Q8UmT6/32LrnzCY?=
 =?Windows-1252?Q?4CMMNZB0pw3ZHNs4If5swlRELtO+fqgBiIQdMW6YcEHpnfUsb6Mi6tLr?=
 =?Windows-1252?Q?Veqd9eEvfDm0bekf83G8H+45oD+Ohhp5b1P1O7sznsdgq1ocAEVfMqRa?=
 =?Windows-1252?Q?0iVOTy3WbeU9VOwZG3/QGrYEZ7kICWknTcsQRvlx+PGNZo/EVluN/S1d?=
 =?Windows-1252?Q?ok4timWvbeRx6I3Xxq7M6n0/swY7g3AqXwslwR7zfuQgcUpXt276vBBx?=
 =?Windows-1252?Q?d/Q5ZwP+WqLiKI8WRT+9S0Le6ZcM0AGHUC3bm4z/Hub/EwnY8vO5qnef?=
 =?Windows-1252?Q?klWf5Q6916bNEdsmCQUZ1KKMK8FLUatjuh9uSR2SbLDXl+jM9XqodhWf?=
 =?Windows-1252?Q?tVVSXRYoq4/eG4MSUTlanV9Q5NsrcPxll9PR/wTysAyLpNvOhS9xu0ul?=
 =?Windows-1252?Q?SsES+C4jzfrVi6lmROLAW38sp/FLH0WPmfyevqys3qXJgKxu?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5952BB16E51A97E70C1A794AAD7B2PH0PR11MB5952namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fdNsjRgG4kD2xqoBPtxslLukgOpw0nJRAQwwIwT2wX/wAjvZX2zBwEY+zFmGr+N8yXRCJaaizycPpcczAA4ciqS50zNuea7nnU8Lyqj/PgPuJawguY4e/y8YPualWyF5Pc97pqfj7r0snPCWmuqccLV8KieQhnAfdo/z9a1oP0Ktd/8LgMS7SezHB/8lstKWh+wfMhOt7wvt/VstGXNNd+lqj4PxYjFwq2PK4Jqv7VHrC2jPZughm3tsv5HwBOCrVMJWv82wKCFq2zgKNzecWLO9q/jpMaUCLGcu8LTc0ZsIbDH1yZflvPGJ7/Zyr/3m+qVxmI9Dax9ITNm2k1GwxA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ad0784-92a0-4240-5fd5-08df44a78764
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 12:37:23.1171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NIMba5cVDYEQLb+K2EvDgGtF9PWcKgJ9MVA+MXQydohbTh5og5KsvgVkp67+JI/uqAuyz7cEA0tymIzb+QIpxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6CF7B12C6
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-4.cisco.com [173.37.147.252];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250443

--_000_PH0PR11MB5952BB16E51A97E70C1A794AAD7B2PH0PR11MB5952namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the review. I agree that upgrading to 2.6.0 makes more sense giv=
en the size and scope of the backport.

I haven=92t identified any definite upgrade-related breakage so far.

I=92m preparing the 2.6.0 upgrade for Wrynose and will share it for review.

Thanks,
Hetvi
________________________________
From: Yoann Congal via openembedded-core <yoann.congal=3Dsmile.fr@lists.ope=
nembedded.org>
Sent: 15 November 2026 06:19
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH ] attr: fix CVE-2026-54371

On Thu Nov 5, 2026 at 6:35 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS P=
RIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> getfattr traversal and setfattr restore operations can follow
> attacker-controlled symlinks and access unintended files. This can
> lead to privilege escalation when invoked by a privileged process.
>
> Backport the upstream hardening commits [7] and [8], identified by
> the Debian tracker [10], while retaining attr 2.5.2. These fixes use
> interfaces absent from 2.5.2, requiring the following prerequisites
> in their dependency order:
>
> - [1] Add the visibility attribute header. The compatibility helpers
>   introduced by [3] include this header and use its hidden annotation
>   for internal declarations.
>
> - [2] Add xattrat syscall wrappers. These provide the getxattrat(),
>   setxattrat(), listxattrat() and removexattrat() entry points used by
>   [3] when the C library does not provide them.
>
> - [3] Add xattrat compatibility helpers. The hardening fixes use these
>   interfaces for directory-relative extended-attribute operations.
>   They provide fallbacks for older kernels and unsupported
>   O_PATH/AT_EMPTY_PATH combinations, using /proc/self/fd where needed.
>
> - [4] Add the directory-fd-based walk_tree implementation and callback
>   interface required by [7]. This allows getfattr to access entries
>   relative to directory descriptors instead of repeatedly resolving
>   their complete pathnames.
>
> - [5] Defer restoration until command-line parsing is complete.
>   This ensures -h and the -P option introduced by [8] take effect
>   even when specified after --restore.
>
> - [6] Add openat2 detection and a syscall wrapper. Commit [8] uses
>   this interface with RESOLVE_NO_SYMLINKS to resolve restore
>   directory components without following symbolic links.
>
> The main fixes then convert getfattr to directory-relative xattr
> operations [7] and harden setfattr --restore [8]. Restore retains
> upstream compatibility behavior: -P protects directory traversal,
> while -h prevents dereferencing the final component. Physical
> directory resolution fails rather than silently falling back when
> openat2 is unavailable.
>
> Replace the existing walker in place, avoiding the upstream
> old-walker rename and duplicate implementation. Include the relevant
> test changes from [9] to stabilize root-test output on SELinux hosts.
> Read the ptest TESTS list from the generated Makefile so conditional
> tests are installed according to the configured build.
>
> [1] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D21b5e=
5b9d394612f44e384c8fa024aea5e8dac68
> [2] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3Dc62e9=
b55edd512ba3f87eaaaf5b822bd2a76bfe9
> [3] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3Dc4622=
83577f1a6479229c43184ad6af5921f439b
> [4] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D9b37b=
117c5d5703aa7481f4c34f73b24c010ad25
> [5] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D4fce1=
7388e014a06cca16914ab3b7e4a0d117856
> [6] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D1cea2=
fc5e8b5c8a5f29abf1141399e01a57a3154
> [7] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D641ea=
6fcc556c1f34b77efb9cd3f876dff0a0a07
> [8] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D3fb06=
b9ba314d37035d0877e6de313de754f1ac8
> [9] https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D30333=
5494a326026bc37e8d83ca47fa1a4d8dde6
> [10] https://security-tracker.debian.org/tracker/CVE-2026-54371
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../attr/CVE-2026-54371-dependent_p1.patch    |  48 ++
>  .../attr/CVE-2026-54371-dependent_p2.patch    | 197 +++++
>  .../attr/CVE-2026-54371-dependent_p3.patch    | 710 ++++++++++++++++++
>  .../attr/CVE-2026-54371-dependent_p4.patch    | 638 ++++++++++++++++
>  .../attr/CVE-2026-54371-dependent_p5.patch    |  63 ++
>  .../attr/CVE-2026-54371-dependent_p6.patch    | 140 ++++
>  .../attr/attr/CVE-2026-54371_p1.patch         | 390 ++++++++++
>  .../attr/attr/CVE-2026-54371_p2.patch         | 476 ++++++++++++
>  meta/recipes-support/attr/attr_2.5.2.bb       |  10 +-
>  9 files changed, 2671 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p1.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p2.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p3.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p4.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p5.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371-depende=
nt_p6.patch
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371_p1.patc=
h
>  create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371_p2.patc=
h

Hello,

This is quite a big patch ("2671 insertions(+)"). Looking at it, I think
this might be just backporting most of the risky parts of the 2.6.0
upgrade, but then, we might just be better off simply upgrading to
2.6.0. Do you have thoughts about that? Are there definite breakage on a
potential 2.6.0 upgrade?

Obviously, a 2.6.0 upgrade would need serious thoughts/discussion but
this might be the way forward.

Note: This is a similar situation to the acl series (CVE-2026-54369 and
CVE-2026-54370, acl 2.3.2 vs 2.4.0), see [1].

[1] https://lore.kernel.org/all/DMVCJFB6GMSJ.278YTTU78ZCM0@smile.fr/

Regards,
--
Yoann Congal
Smile ECS


--_000_PH0PR11MB5952BB16E51A97E70C1A794AAD7B2PH0PR11MB5952namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for the review. I agree that upgrading to 2.6.0 makes more sense giv=
en the size and scope of the backport.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I haven=92t identified any definite upgrade-related breakage so far.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I=92m preparing the 2.6.0 upgrade for Wrynose and will share it for review.=
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hetvi</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal via open=
embedded-core &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> 15 November 2026 06:19<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH ] attr: fix CVE-2026-54371</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu Nov 5, 2026 at 6:35 AM CET, Hetvi Thakar -X=
 (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wro=
te:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt;<br>
&gt; getfattr traversal and setfattr restore operations can follow<br>
&gt; attacker-controlled symlinks and access unintended files. This can<br>
&gt; lead to privilege escalation when invoked by a privileged process.<br>
&gt;<br>
&gt; Backport the upstream hardening commits [7] and [8], identified by<br>
&gt; the Debian tracker [10], while retaining attr 2.5.2. These fixes use<b=
r>
&gt; interfaces absent from 2.5.2, requiring the following prerequisites<br=
>
&gt; in their dependency order:<br>
&gt;<br>
&gt; - [1] Add the visibility attribute header. The compatibility helpers<b=
r>
&gt;&nbsp;&nbsp; introduced by [3] include this header and use its hidden a=
nnotation<br>
&gt;&nbsp;&nbsp; for internal declarations.<br>
&gt;<br>
&gt; - [2] Add xattrat syscall wrappers. These provide the getxattrat(),<br=
>
&gt;&nbsp;&nbsp; setxattrat(), listxattrat() and removexattrat() entry poin=
ts used by<br>
&gt;&nbsp;&nbsp; [3] when the C library does not provide them.<br>
&gt;<br>
&gt; - [3] Add xattrat compatibility helpers. The hardening fixes use these=
<br>
&gt;&nbsp;&nbsp; interfaces for directory-relative extended-attribute opera=
tions.<br>
&gt;&nbsp;&nbsp; They provide fallbacks for older kernels and unsupported<b=
r>
&gt;&nbsp;&nbsp; O_PATH/AT_EMPTY_PATH combinations, using /proc/self/fd whe=
re needed.<br>
&gt;<br>
&gt; - [4] Add the directory-fd-based walk_tree implementation and callback=
<br>
&gt;&nbsp;&nbsp; interface required by [7]. This allows getfattr to access =
entries<br>
&gt;&nbsp;&nbsp; relative to directory descriptors instead of repeatedly re=
solving<br>
&gt;&nbsp;&nbsp; their complete pathnames.<br>
&gt;<br>
&gt; - [5] Defer restoration until command-line parsing is complete.<br>
&gt;&nbsp;&nbsp; This ensures -h and the -P option introduced by [8] take e=
ffect<br>
&gt;&nbsp;&nbsp; even when specified after --restore.<br>
&gt;<br>
&gt; - [6] Add openat2 detection and a syscall wrapper. Commit [8] uses<br>
&gt;&nbsp;&nbsp; this interface with RESOLVE_NO_SYMLINKS to resolve restore=
<br>
&gt;&nbsp;&nbsp; directory components without following symbolic links.<br>
&gt;<br>
&gt; The main fixes then convert getfattr to directory-relative xattr<br>
&gt; operations [7] and harden setfattr --restore [8]. Restore retains<br>
&gt; upstream compatibility behavior: -P protects directory traversal,<br>
&gt; while -h prevents dereferencing the final component. Physical<br>
&gt; directory resolution fails rather than silently falling back when<br>
&gt; openat2 is unavailable.<br>
&gt;<br>
&gt; Replace the existing walker in place, avoiding the upstream<br>
&gt; old-walker rename and duplicate implementation. Include the relevant<b=
r>
&gt; test changes from [9] to stabilize root-test output on SELinux hosts.<=
br>
&gt; Read the ptest TESTS list from the generated Makefile so conditional<b=
r>
&gt; tests are installed according to the configured build.<br>
&gt;<br>
&gt; [1] <a href=3D"https://cgit.git.savannah.nongnu.org/cgit/attr.git/comm=
it/?id=3D21b5e5b9d394612f44e384c8fa024aea5e8dac68">
https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D21b5e5b9d39=
4612f44e384c8fa024aea5e8dac68</a><br>
&gt; [2] <a href=3D"https://cgit.git.savannah.nongnu.org/cgit/attr.git/comm=
it/?id=3Dc62e9b55edd512ba3f87eaaaf5b822bd2a76bfe9">
https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3Dc62e9b55edd=
512ba3f87eaaaf5b822bd2a76bfe9</a><br>
&gt; [3] <a href=3D"https://cgit.git.savannah.nongnu.org/cgit/attr.git/comm=
it/?id=3Dc462283577f1a6479229c43184ad6af5921f439b">
https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3Dc462283577f=
1a6479229c43184ad6af5921f439b</a><br>
&gt; [4] <a href=3D"https://cgit.git.savannah.nongnu.org/cgit/attr.git/comm=
it/?id=3D9b37b117c5d5703aa7481f4c34f73b24c010ad25">
https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D9b37b117c5d=
5703aa7481f4c34f73b24c010ad25</a><br>
&gt; [5] <a href=3D"https://cgit.git.savannah.nongnu.org/cgit/attr.git/comm=
it/?id=3D4fce17388e014a06cca16914ab3b7e4a0d117856">
https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D4fce17388e0=
14a06cca16914ab3b7e4a0d117856</a><br>
&gt; [6] <a href=3D"https://cgit.git.savannah.nongnu.org/cgit/attr.git/comm=
it/?id=3D1cea2fc5e8b5c8a5f29abf1141399e01a57a3154">
https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D1cea2fc5e8b=
5c8a5f29abf1141399e01a57a3154</a><br>
&gt; [7] <a href=3D"https://cgit.git.savannah.nongnu.org/cgit/attr.git/comm=
it/?id=3D641ea6fcc556c1f34b77efb9cd3f876dff0a0a07">
https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D641ea6fcc55=
6c1f34b77efb9cd3f876dff0a0a07</a><br>
&gt; [8] <a href=3D"https://cgit.git.savannah.nongnu.org/cgit/attr.git/comm=
it/?id=3D3fb06b9ba314d37035d0877e6de313de754f1ac8">
https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D3fb06b9ba31=
4d37035d0877e6de313de754f1ac8</a><br>
&gt; [9] <a href=3D"https://cgit.git.savannah.nongnu.org/cgit/attr.git/comm=
it/?id=3D303335494a326026bc37e8d83ca47fa1a4d8dde6">
https://cgit.git.savannah.nongnu.org/cgit/attr.git/commit/?id=3D303335494a3=
26026bc37e8d83ca47fa1a4d8dde6</a><br>
&gt; [10] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-5=
4371">https://security-tracker.debian.org/tracker/CVE-2026-54371</a><br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../attr/CVE-2026-54371-dependent_p1.patch&nbsp;&nbsp;&nbsp; |&n=
bsp; 48 ++<br>
&gt;&nbsp; .../attr/CVE-2026-54371-dependent_p2.patch&nbsp;&nbsp;&nbsp; | 1=
97 +++++<br>
&gt;&nbsp; .../attr/CVE-2026-54371-dependent_p3.patch&nbsp;&nbsp;&nbsp; | 7=
10 ++++++++++++++++++<br>
&gt;&nbsp; .../attr/CVE-2026-54371-dependent_p4.patch&nbsp;&nbsp;&nbsp; | 6=
38 ++++++++++++++++<br>
&gt;&nbsp; .../attr/CVE-2026-54371-dependent_p5.patch&nbsp;&nbsp;&nbsp; |&n=
bsp; 63 ++<br>
&gt;&nbsp; .../attr/CVE-2026-54371-dependent_p6.patch&nbsp;&nbsp;&nbsp; | 1=
40 ++++<br>
&gt;&nbsp; .../attr/attr/CVE-2026-54371_p1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 390 ++++++++++<br>
&gt;&nbsp; .../attr/attr/CVE-2026-54371_p2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 476 ++++++++++++<br>
&gt;&nbsp; meta/recipes-support/attr/attr_2.5.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 10 +-<br>
&gt;&nbsp; 9 files changed, 2671 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371=
-dependent_p1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371=
-dependent_p2.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371=
-dependent_p3.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371=
-dependent_p4.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371=
-dependent_p5.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371=
-dependent_p6.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371=
_p1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/attr/attr/CVE-2026-54371=
_p2.patch<br>
<br>
Hello,<br>
<br>
This is quite a big patch (&quot;2671 insertions(+)&quot;). Looking at it, =
I think<br>
this might be just backporting most of the risky parts of the 2.6.0<br>
upgrade, but then, we might just be better off simply upgrading to<br>
2.6.0. Do you have thoughts about that? Are there definite breakage on a<br=
>
potential 2.6.0 upgrade?<br>
<br>
Obviously, a 2.6.0 upgrade would need serious thoughts/discussion but<br>
this might be the way forward.<br>
<br>
Note: This is a similar situation to the acl series (CVE-2026-54369 and<br>
CVE-2026-54370, acl 2.3.2 vs 2.4.0), see [1].<br>
<br>
[1] <a href=3D"https://lore.kernel.org/all/DMVCJFB6GMSJ.278YTTU78ZCM0@smile=
.fr/">https://lore.kernel.org/all/DMVCJFB6GMSJ.278YTTU78ZCM0@smile.fr/</a><=
br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB5952BB16E51A97E70C1A794AAD7B2PH0PR11MB5952namp_--

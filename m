Return-Path: <chunrong.guo@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0139.outbound.protection.outlook.com [104.47.32.139])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC017827A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PaqUevdwWytm8ZGAESRr7hjQgSXHIendxb1kVZ+JPo4=;
	b=iiu+MIOWN//MK1szITK88T0nJItj7qhgLYM1dGp6uyB9NwnjbKvLo4fF2OhR3xVAutZwYjuHEYpPa278eFt6tLzMAJr0xO4w92zCwzCJ0qll/XPleHe58Sx7TVBeOoBP+cGi66nijjm+XiYHOsZJXoi5yTD/KbO7W1Bwk/yprTw=
Received: from CY4PR03CA0086.namprd03.prod.outlook.com (10.171.242.155) by
	DM5PR03MB3178.namprd03.prod.outlook.com (10.174.240.31) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1178.14; Mon, 19 Jun 2017 08:32:36 +0000
Received: from BL2FFO11FD027.protection.gbl (2a01:111:f400:7c09::123) by
	CY4PR03CA0086.outlook.office365.com (2603:10b6:910:4d::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1178.14 via
	Frontend Transport; Mon, 19 Jun 2017 08:32:36 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD027.mail.protection.outlook.com (10.173.161.106) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1157.12 via Frontend Transport; Mon, 19 Jun 2017 08:32:36 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v5J8WOHR028076; Mon, 19 Jun 2017 01:32:34 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Jun 2017 16:32:16 +0800
Message-ID: <1497861136-27345-3-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1497861136-27345-1-git-send-email-B40290@freescale.com>
References: <1497861136-27345-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(39840400002)(39410400002)(39450400003)(39400400002)(39850400002)(2980300002)(189002)(199003)(9170700003)(36756003)(50226002)(2351001)(54906002)(105586002)(189998001)(106466001)(47776003)(81166006)(4326008)(305945005)(5003940100001)(356003)(8676002)(5660300001)(8936002)(6666003)(77096006)(107886003)(110136004)(38730400002)(104016004)(76176999)(50986999)(6916009)(498600001)(2950100002)(8656002)(42882006)(48376002)(53936002)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR03MB3178;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:sfv; MX:1;
	A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD027;
	1:EPyN0hWm3YZKqDq6YBBcwLtdiix//XgCsJyVLN3v41Dh/MFmja8BcEF1dl8GCT8iWfovYuQd1bT5JaubZeV8I8OsOYt6+aSgL/Lp1Eusb4hsYcT3UbeRoMj9EQBzRW6eBTNrJFy2anyeo1KI5oEQnQ17AohfY+iD4wZej/1/jCG+XkA/oHzvqSkCAAbfgKoYZszHcErjbSBT4YHOAE+zx9NCjMWSYgXA4izGwWCbwi4eW42QoEaosAQiLQGQOQyJp9gZVB3uCwhCMBTf57fu3ZdO//b4Ajdopdrl1TxA+5tuB84wWD0lOPv2S4KU9Bf0aPemIvA9BjTSlKmLNpkV7zWXBFk+c1Mu6EucSonjlhSonT2cP2JcjT+ec7i1u3PaoR64XK5BjX/BYVg0GDLUkp2CT86UtQeEMNEKAmf1TaOolQ3c43BwMIzTO16bFRGMPsRdCZMuVnu9c2nXukFSlkKmHE1qQFwohu25jnj6GXSkj1/1B7f7R5PsfpYdX3ORm81NiJmOEGsv5yo8hmJ4e6wL8pD8avvctKNdwl17N3I=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f2295cf-4710-4432-0106-08d4b6edbd28
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:DM5PR03MB3178; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB3178;
	3:+3RxSItMB77LKlId61KYYXQZWSV2B6UjBxMBxoIFoeBhppaJ/hDteEIXRG8TT2Hc9OR5tDDZX9UaB7xN+LyA5gFPnmGAwEV0xmOlZQk6SvqjwgPuwbBhqN7qqu3YXcGT1rYd1gEpnOEf2cRK+f0vzLgKiUahV8mHMxbOs2pS/o0e/PbQjFxjLrug+N7TbJHJv09QjCW7UNu35+PIr9wI06cIAcghm8E2MB/gpjP2/CZbvnZlkUnKuY3Lkmgg9eKsaIpLn5UPN73svnBISxsviSZWuXC/NybRNTzArAiAaK5QExG82DdB4fop8fqKik/WNa0dhzPdNVGHRgsiEnirJlY5rrdU5niIdBQo/gmi1xHH6jRfI5W5lX4xgAAzdsyhMs7c+2yPVEexGerIM0EqmXs4Mdr2RuoyYZgs7RtEX3Cj5nGO6DNKXTzk7dcjWySswoIpU3owC+NWenO29kP4mA==
X-MS-TrafficTypeDiagnostic: DM5PR03MB3178:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB3178;
	25:ODrSDUn95Ydkf4FW99GI/49bLM4z83ELofpv7ySL0HVW8GGhkf7QAlz0wEvMQeLIfevRfjFWT5jQgZ+eS6HdZJiAwcr+6/dcGtZNdHiuuHYP/jJDCALpdqIbSlyqUA4Fg6nf3rA2s/Of2veztBzdD4Sr2iQt3H22XpjkwZeFfQOy4g5pi+AJHEaKYmsrHVIqxuAphlr8Tco+5799REbZnvPjMjPxa/jXDCLrkn+MRdwRGZHe8ez/HGak7cuVwes57g7bMxCXX5kKb7486aFCxD5pqFguyUT/v5cdgkG3oMcn/mz2C3EYChXEfJMDp4E7QI7H+Jtk43IJveVkOnTKIQVX83qxbl681CotPVDwNyKlxTVMUY7HMIUjobTfFNWbTpcSqy03bz4mmOmKLP6RabEHkTzpkWn/wqP84UUzsBunXDiccVT2C2D51KxkIhpkC4gtJubXCNsNrNY+9n8F/fDZy43x/rKkbmLqyapq9cA=;
	31:aHU9GfkBgzXpAb8pzN3ykIu/jilZgVl4Vyl10vDk8SFJwGtsByG6tyIYwU2+2Fuf7C/Mer81WfJ0vypuOVBZHXgfnq7+fO45WxJ90xyvBq8XMLr8EUfuXA/nvUUfd2gJqyUin2GVUe6Ekb6426/5PdySuv1ZS3g6kEQlsPTF4XvMOhwEGTTAnJ6FxtAsc4mz25V/gDzbOh1gPSwbMO0liHeGMBraY53AobQmkm62bOYsxdRNdKTPJva/gQplIn+t5of075+WPH2ImBiN8/KIaw==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB3178;
	20:ACOVnuUw/3oHH4SfiXltJYhRPYv3z62ufwPYWNbH6bZV2B+e+1MDDaRklQ3WM1nMZlIvRIsPAPML0b6bLEMAq8KTlaG1B2ZYaQ23yPwOu6kjWDc1ahRk1qWwLy06L9/epQboKoV2+3ck0zSyNmtb0/W8BFlVShJxHsMFgE2QNRlJjT4pfh9Cuyi/6ImyqGXhtNvnA0OUIz8V16AfJBWKfMzrEzk0+5mSO+rEal9r7HSVDqERC9BF46xV6oES1Sz49i6WP69xwNvFJBaj2ovS/vHsGAhAm22WpgDNYwySACcCZOCKN4MciiLzFIOxVq5N7llbsy2L/vpoyZZALTMoepqzfWD1qVfj/6hXvO5SACg4vk/vR5ML7kzzJeZUER/LBVz3nZmxdQsryQwP74OHhMEsBrrLR67WZoSBp4HyGP3NMHXICOQndOguAjXofPTAppdBjWwy0qikgQ6jQRRpmmovYkMK+M84rZ7mOYzX4multmX9QFbsH162lKFqkPV+zs5orxAIc1w1npSQ+UIMQJrh98eY91L6C/s7+L6hMQK9A3nsCjI2P9ua3lsVSMZiwxQLDvmrbirYPlHCVivHCh+z8uHw0fBeC/dY6fvembg=
X-Microsoft-Antispam-PRVS: <DM5PR03MB317817878A3EDDF49801574984C40@DM5PR03MB3178.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13016025)(5005006)(8121501046)(13018025)(3002001)(93006095)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061750153)(20161123555025)(20161123562025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR03MB3178; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR03MB3178; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR03MB3178;
	4:hE/B7YZcC0S5/s3xDss1EtQtXVl5peoOhCD3YdVxWt?=
	=?us-ascii?Q?ypiOhkeawOVVB+ctSoudKy1PEzYl5jLE3IUk/jovf51is1oi2o1yyiJCeUdv?=
	=?us-ascii?Q?+20p1xeyvPIY31AJu0SQ6+Vn+X4HT5Mj+dIkL8jCzL28NVgDHmL7qTjLTlA3?=
	=?us-ascii?Q?ds5DTJaIv8r+JER5oZDFcAq/IMT8w+bL/KpQzmvldgBy1jrisxIoAux8L13g?=
	=?us-ascii?Q?MVQf5lEvsduRw/Tiovu5QrlwK5V5c2OxZStK71ubkO+9/ubOHiy+yfgwziLc?=
	=?us-ascii?Q?TUtL1ok2Su0wSWJ887seeOthEocM1+9PDcWh0ZoePKMc8GH5eCQafMzjBQ8h?=
	=?us-ascii?Q?BQyDOopbob7TI1JbHXHmnddzvR2zdhoLw2m4LapbuPxs+WZchmKON6cJ8YS9?=
	=?us-ascii?Q?vDNybvFTEnVJhn4Ku6cm8HfA0wmFCL1X+iPeitwVI+0Dh5c4EunYc+UWW7ZK?=
	=?us-ascii?Q?iYs12g9neAcGlcQLyP1kkvesFOrh2f8/Zbibk0Bgl/jwhqVkJpHFWf0UrSuQ?=
	=?us-ascii?Q?QJBNk8PO27hCBNkiXsYM0MzyUutygjKSjGC64cXmvyNQSmTlKbXUJfkLk1ac?=
	=?us-ascii?Q?Nw0xDeoNpIr0DuSRkA22zNzGwCzvKdmfAFDVrO3fTXU6IbEXbaHhgfUH56AP?=
	=?us-ascii?Q?1P02YVDH5ZjZwOmgtdxNAka6mw91jHJe3isi1VXrow25CrmAfxu3eWy2Wdyh?=
	=?us-ascii?Q?Ov7DdmSY2DvlTcSZU/mynNZLJ+b8HlZX651ejAee8SHBv9LojsxRWYKgqVb9?=
	=?us-ascii?Q?NC/hMvreBI4CGX0K/po9FYm0SFUWo2eEfHP64sNgFpMHu6oDB6UvsJMTasB1?=
	=?us-ascii?Q?CRH3PIWNTkSyghgrosMyGJqrtNPd2sZbWR29eAd0JNmI7d7qtn+B9BfxdgVJ?=
	=?us-ascii?Q?AZOOHeFnjUW0i5Gx81Z5FecLriMn0fuy4OT9kt1eLQthNVpqF1/TnF0K9n8W?=
	=?us-ascii?Q?jXv5Os6WcrDn4gDDZPeKNtn5WX+erBsPXZlE6yOpi99Q4342ayOb3WfMbC78?=
	=?us-ascii?Q?41/3k/kKkEOegMUjKt6aZrta3K2ZT4Sqb6Y6uukc4FIZVZDAvVL4vZVwQzWd?=
	=?us-ascii?Q?/Eaxij8YLqq/+aCi+NmofHjY8FK9a5FqE+N6vrziI8mmm8Iap4wrQpsw9aNC?=
	=?us-ascii?Q?5QH+H8d74LA12m42Xd04v9MKouE7PFT3P30oowGbL12J76UnCuDrwEEOCAE0?=
	=?us-ascii?Q?ngKofLFBXNln/NOJLSAsaqGTTmfo2MYKu12BrytjrD6KcOyPUXrrkyJg=3D?=
	=?us-ascii?Q?=3D?=
X-Forefront-PRVS: 0343AC1D30
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR03MB3178;
	23:a+A3MJpj/zaFz5NfGy7UCa10pwoqBON5w5JTyKnDK?=
	=?us-ascii?Q?X4OLtmfOF9cmDcp91nUdKgBN+tl7jupfs0fkMGptBg3OnYxkYFOVr+VAYBfx?=
	=?us-ascii?Q?MgqglbWfkhnrPKVP97Vtg7o7pOToiiN7ky9ADCZYirZxo5iIl4RCn8KlBOHM?=
	=?us-ascii?Q?obxVdF3CaPDcEWW+At9cZzMWRWcbEsuVAQyaFelN4ya80PEE2uvsnwjcnCiN?=
	=?us-ascii?Q?AxXrs+Z3vxrsS760JTQzeEx1KN5uRJ4OfrYjyyI4NlwuRBicxwEXB99Xv0Sl?=
	=?us-ascii?Q?2eJgx4BzqzlwtSfAaei/kGEV6I/BjlxJccW9jmxCqmT0K53cn2Vq8L7Lb86S?=
	=?us-ascii?Q?MOFOI/MGi+gJQLVsSNlHstEpDK5YYrbTF+K6aeqzGRDTSojzc766NAgVM4hr?=
	=?us-ascii?Q?I48BZrCFw/Di1IKKYQSAQNCMHbTTbdAq8klSiSuHJBpCi+AO5X9ZE8ugg0XP?=
	=?us-ascii?Q?6J+WfsKMmo7kgkU57UuK11A/CNfSyzZLUyoA+2RiEkgbdl6oJVRn6XYn9Fjb?=
	=?us-ascii?Q?ZVZw7Uuzk7e9JUa3ibWpZXMpuR2qnIBpgICGZzkCT4LSEz1Zk4E0ksPeC5Mm?=
	=?us-ascii?Q?d2wW6RNBaioWHwtzTJV037l/bnFKnFWApoFznatnSVKhhaywiIIHaL64fqAH?=
	=?us-ascii?Q?Dvw48iBFZJIV9f0ZBWVly67zXGuDB1c08a0nXvOVk3AqYlWk/awjGlarPoAG?=
	=?us-ascii?Q?+neEsPUGn7XIHuK/MxgQJK0df02KYVMmqeffjIKvwzbV1vLMEFBkT0zqkuq5?=
	=?us-ascii?Q?LA38KvCBu03bJKrkxQh1rep+eMnawk/hiJul9e3fTbU0gSGp9Xv8bPYpdDV4?=
	=?us-ascii?Q?Z8PF5FrFqZeJX4QJmUQYl5Z+j8NRSNHbCvv//jn2sM2azEVkXLzwo4kyT9ib?=
	=?us-ascii?Q?qDRhu/HQcYNn1HeybTeY1nBnBGqCpyF2nUfD55fGV5WJbYfQKXfEd1i2rT9l?=
	=?us-ascii?Q?iZ6iyMrS7+v8hfv0veZ7ytKWwaeJapfGXMoJm+EWCiYayWreTrhBMeKwsO6q?=
	=?us-ascii?Q?Nlla/8oHkhiDxGDaZI6GbnBdMXqByN04SPFCL13oU1B6PRwg1E7iXrUzTQeO?=
	=?us-ascii?Q?ldYpf/Z3BUymkbUOB08k6iGl7BhrDSOt/OPqGdfv/XlRQCTuw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR03MB3178;
	6:ylF+6Zc2m1JqRXc08aWac69EghG6aTuBexTc+H+2Uc?=
	=?us-ascii?Q?BR/2U9m3XCQgQX5JY7jxF14RhonvxqHox1TCN31GVK7FevI4S0yIJWIE+y24?=
	=?us-ascii?Q?TGaSm8tphH/4lbJVGepuLcbOtNFPUV2IUkgyqEKPGcQB/ZqDuI4b7+vVUKjz?=
	=?us-ascii?Q?wayuzDozpluHfeJXXD+/pvb93LZ/bKR8xLL/r6gcRLPNutIBZXSie9i1H52a?=
	=?us-ascii?Q?S7WEPV1HgPxYrgOGm7K94rdxkIU7E8ETfXzbCAuXWMIj6b9VlOPnN0y1PsU9?=
	=?us-ascii?Q?s+jYkS9Zqna43C9WmMqgde+nbG9nRRgfjqYFv9159zX/5RipgbpBGh1GGYE9?=
	=?us-ascii?Q?jB5yJaXB53PWsxO1Cso+w7PHJWcNpBc0wrpdvidXUpUU27r0XgnMG6GRQsEk?=
	=?us-ascii?Q?duHpHmeoxK/S0KO42dAyrInqx3tnYOa6PPeY5DoBCQvXqPjmiWJGbXJU0Geo?=
	=?us-ascii?Q?eyumtrnXBQ4JvrItBXkuFQzPNQTKaGf/IA/1PpjjZBAF8POsnu+E8ar2wT0k?=
	=?us-ascii?Q?+vsdN3bjzFniV1cV55RS+DD5EaNEF79nfuHOJ2Yu04zLwMHptIhXMqBJC8nk?=
	=?us-ascii?Q?jeQm5PWr5QaO44Mwdo0OuIkPnzOH+GqcBB9lETEfGBjDwIoxKnckCKi5zbWp?=
	=?us-ascii?Q?iU9kS63cGpa/7MT5uGxGWOIAY4bqqoYh3EYvbvMFzdiRB9fXtVkbfCpIM3QI?=
	=?us-ascii?Q?5XYmObDTF/1nKfTzSgH0tQzthc+uuVgzI3rvicLet35Z3MnwMlq3jgQYxKtU?=
	=?us-ascii?Q?PwtlXcg9qS6lINyQv3XpqX3gYsubk9B5g65wXAWbXefFyrdO1CvB1Bm9rZSw?=
	=?us-ascii?Q?cZiu6z8KBy/a0V+tg6FA9U1gHGAkHXXMV2s66v8TSxqugCtp76EWMxr2Cd3j?=
	=?us-ascii?Q?8FIXRvmZeTMmMBhlpvNgAoJYNUndJF2rHJdq9fEab+Jcrz4SWpPaCqb+sZrj?=
	=?us-ascii?Q?2IRQ1Q7RxJxCt5Lu70W8ATRlDHb9e/ICk/02rsXX+Bj64+qkvWmmM5UHPmYJ?=
	=?us-ascii?Q?zd7jNdtUOWBbAE8SJ3yeWMHP7tLVXV00xT/1BR1SnNm1SAmaYuSY3Blsqlsn?=
	=?us-ascii?Q?4pM9c=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB3178;
	5:Alwik9B29VaVzV+0oRvrZZ5Zv7Pu8YaIIPTtqKx0VM74yWMlH+PQNJeaOn4+j0wXgAkGB1WpWDPqk818/rIqxWVsfR2mGqZAmS4gcEv9TuPk17JxztU99cbDACzM2N4oHgQ4OyUrCMIKT9WWesrf+2qRS/9TxgUJh/QnV/tH5Vfu4aKNL7JXENJ8T+qX8Tir6J3x3acZAb55WYf+tMBGlEhKffT50ZSUTBVEOGVPmv9NYx2y2ccCaiAfdrHS122pid/dRlHRMypdTnPYkXOeo2sFYTC07IwUgnBkKDV7ujdmMj+WUNm1nxyfqGlu5bNvaQKc3EJJW0Am4p54vNm1qINxJooBot8fJDgroUWbJscWx+B9Zh+qDo+tRcv0fI6SqlSMFtel5fdJH674Zm7NYjidFWhYHAuX165n0LEAsjUF9y9swTTwb1veiZjHC0myAwJKqEBDHuzMdOdpTLL1YkI6M9+R+FY3rH9iCfgPRQj1xMBhRqjtIqPY3luf9Nuw;
	24:0TlsRAVRXGQ5XO1w/ibQnaAj2/9EfswWYGBXEDtDeKngz0A4rbQJ6UrMDcW0W0fM+DB7dWJ9eEOOBR7lORKgLDT7jakb1sLZzIfF3bMdWR4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR03MB3178;
	7:gAxn3WCQC8zGkHzHylrJYOPdoJbgEIK/O0+gvUhvZbV0XeQLxZYyYXBRiGUSRvEC1vN19YJ11CiFyXGT52RIHXsqNbFPUs57MQQUNreiJk0pqn8q5JOZqAYQniKR4MM+rlZH5M77Mxvi9dy8KSaI3E6fdsFPaJH5ZFSYKrowP4P6UmyOO5DW/4aJEJNTFcUmPKyeLcQOXUZr+z+XJfQdpQb9sMMUEqpRbxGhVZOeZg+8mHVJfaZ9wB6fYRkhbGsgrrQ3f/pudfeMBVkrufmoHO/qY1oShxbvrUFATTP3cud5HL8gQlNqTzybfabmjCT8qZ+beYS5mk/EJ7oMvF5ten+wVzXClBFAEpvZog4zeAnSMZG0jyYjqQc1N13PhfSeW3XsloHoQ51xiFhcuD4iqnKGp+5HArwUSOSFIfFtO0g0D5g0E/XJxhp0i75dJY8+YijgFndaONzyKMMovcW+salh+yQ2BXxYrexrF1uKcNJSuFdYGuCkr68biG9VbI1gDuabclQ707Sz/SjSH4tyfwU0ZDc0mr1nMGvZech/c6pPb7b5vDsyT6bLdAYe+KaoRGIRFNzgu3McW6z37TrYO01WsYyLgdWjxnmk2SQJxcmDWmxAox56a/wQr0Dn/ZbbkSyJqQloi/4o2g1w+/rtugoiW3CmcbZzbujcknah3mCe72ajsRnYOb+nSUWYR4FBgitQOXGI5z9jM8nbzlNoCGDhsc0Pygm8nWtsWu7r4tGfVOG4nUtkOa2Qd04DQE+cMtXX1Bu3o1Xx5JxWXJWugidKqpdS5Ih2FZ/Nqg6mkd0=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2017 08:32:36.1542 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3178
Cc: chunrong.guo@nxp.com
Subject: [PATCH v3 3/3] kernel-fitimage: fix KERNEL_DEVICETREE includes subdirectory issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Jun 2017 08:47:55 -0000
Content-Type: text/plain

     * For example:
       KERNEL_DEVICETREE ?= "freescale/fsl-ls1046a-rdb.dtb"

       ${DTB}= "freescale/fsl-ls1046a-rdb.dtb"

       but only fsl-ls1046a-rdb.dtb  should be used in fit-image.its

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9fa836f..08644ea 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -347,6 +347,7 @@ fitimage_assemble() {
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
 			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
+                        DTB=`basename ${DTB}`
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
-- 
1.9.0



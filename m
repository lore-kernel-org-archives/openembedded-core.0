Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0048.outbound.protection.outlook.com [104.47.32.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6218A77E9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:36:06 +0000 (UTC)
Received: from BN3PR03CA0102.namprd03.prod.outlook.com (10.174.66.20) by
	CY4PR03MB2789.namprd03.prod.outlook.com (10.173.38.19) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 07:36:06 +0000
Received: from BL2FFO11FD014.protection.gbl (2a01:111:f400:7c09::186) by
	BN3PR03CA0102.outlook.office365.com (2603:10b6:400:4::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14 via Frontend Transport; Tue, 23 May 2017 07:36:06 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD014.mail.protection.outlook.com (10.173.160.222) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Tue, 23 May 2017 07:36:06 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4N7Zo6h015402; Tue, 23 May 2017 00:36:04 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 15:34:22 +0800
Message-ID: <1495524863-28699-6-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
References: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131399985666749397;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39860400002)(39380400002)(39850400002)(39410400002)(39400400002)(39840400002)(39450400003)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(50466002)(356003)(6916009)(106466001)(6666003)(48376002)(2950100002)(2351001)(86362001)(575784001)(53936002)(2906002)(38730400002)(105606002)(110136004)(33646002)(8676002)(97736004)(77096006)(81166006)(85426001)(5660300001)(6306002)(4326008)(104016004)(8936002)(50226002)(36756003)(230783001)(47776003)(76176999)(189998001)(50986999)(8656002)(498600001)(305945005)(5003940100001)(54906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR03MB2789;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD014;
	1:ild/loPEwpE4dxTHQfHNZo1KAITDPleiNN+qQg6z9cX5ZcHWNqGGnW97oao4WsF6OUpam/HieSpwDIwX4TBkoEIzA0Ts850PO3jmjeuOv8e8BjwIJPE/5f5SIMBufELvqFV79YvBwhaobC+vqL3MDi5z0pNkoLQbseEeEbtrwefNHP7voBCu+jUrhS+Oc/oXpKmm4An0SmeyDoCFdGQgJ/LMgUZbUrxiZiTEXslV6qODNc697H61aC6yC45J2uaSBIL7ISPP8SQUAjVmNd5yaDba3z7BGsoPQi7jvnOP4NXaTEB3uHXmTEpv9TG0FsEVH6A04HHWxTg7Tz9FpF5L4jmbpiaK6mzHFS1Mki7738eHzEy6+WuTmE5SXTiQXs/i/lZUwEoZ29q5xDjrmcsFVHvoqW3lXg6OlT3jvJiaKmYMUivMGP6Xn+scS7K9M/QccjG41MNmEJvHYQsgej18Kz4FKvTNvJ4CiFN8+9x32x+4CCXl0hNic1INDK1m4BPerviNToCkJqFJGLlZluidc4TMfE1G2Tby09o9Wp1NvG2AtERb4HGXCGDN4BmmRYTjuBLzvW+y/dZ41MrtBC19kJBz4DjslsFhdLfw9vmhpBQF0JghLXxtzBOI7A9aN6968k63iFVWPamaohwds64zYYjFKoEsf0GxXF2zl+bcB1OdAK8Y1m9aXYkdHx08gl6UIUNFZpfEkA9reZiXbUG5mVNGw03wxjQbvB03v0vh0dy9YBqYER5cGJfP0NHy64zG6nQ1L0o4rMa3dQhFTo5G5A==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR03MB2789:
X-MS-Office365-Filtering-Correlation-Id: d51b8f94-a230-4328-b115-08d4a1ae5f9a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:CY4PR03MB2789; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2789;
	3:iUMNzMPOoc4U6c1ae2JABN+W7fr0t7o3tgjGN1wFmv0aAzUkeTbry8oxCa4pbh44jN3CFZpBNtu+7bRyG7H5h6tmrkpnZm2kDSMaoEYaaSD6wqzO4Td9ipiZaolU9YfivPckQIKbFXlNAEMQojZ1y49oSTwSQvjo1OCYM94BfNXAub5livv3mSczK7X/vcxT2uTXbHZf2qXnzzftlH7+yOdsigqZ3QYoUPmRqzk7CAGl1wz323ndYucj3l+pCmkR5virXpxBw6+SbsaqITTKtEE09s/WOzMd6zUDOD7gE2/WRKMNxgeUC7+siQBjI6dfn8a2yiQpU6OSN7Ks2+OGmUHROyKdEdBdWGl2oTw4gqlqiDoWbd2jADq7F4iWmAr8kUBLaAGanvMDxaupNClajsceL/DMWyReJ0Kt6XyTal+i1ZxsGxbbI5RO1oQ6CgGO;
	25:7z1+qbE2rE5+LSpaCgkyo/vQ3U6wwjs1fKVJiurzqxQo7lc7pmwylQ79QAJmegNwGPxqsU1QXa0eGDEXFMOQHdOpMo2OAPi73OLL22lwxPjphwugSPcrynSs43onKRk2NnVYSlkIAlpehUkYqsi7ZiTTwBSmgcsirN5wTYizDcrDATkh4xljozG5ff3RElr9l5rj2u08U21IhVcrPTNvmwAPTRNatGaRKJgfTpaneaTVfjqgggz0nNicOAOlk89iIbcBaRXQCBRFbbqtpClNLzWJThjeJorhv3ftJxJf8iBjmrX7HmUQhNIbkKpAcHv71cNiIVv92iU9Yhlv/Ajsjvmv6jT08EfbACqs9P8RLyqxOVxL0TTAVnn2tNG6xKcUr/4FVxJg0qSqHTpMy+NWGxNRvtgQ/g9DLgOlsKJqE30U57tRvXr5Ep9xw2R5du09F3RTS4Tgc7rsNNv0T3SIbVo/nQYMiAA2Mvvuef/Y7FE=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2789;
	31:4v23G2BxVhuybSWqUzVmWYV8I2Izd94Kc2U5TkhJoAWqxZWMYb97ITh1knFFMK1tFfSZ54PNO2CTbSG85yH4Eq39DXMeoGGo9/CY+DMNyVbeil5LPf6PT8LkgYNINN5yUiNcCvC+8vCuQZ3hR4ZsJWrdClvJ/NZxRIDnvrTb8dwZUtwD6R07A2JNFwF7kJl/ukIJThF6kk88wPiMkRAbdmMfjZtZMaI1A9EOyderSUKheSWjyrPgvY3gG5dXwsNx
X-Microsoft-Antispam-PRVS: <CY4PR03MB2789FFB70419EFA482E31708E9F90@CY4PR03MB2789.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13024025)(5005006)(13017025)(13023025)(13015025)(13018025)(8121501046)(93006095)(93001095)(10201501046)(3002001)(6055026)(6096035)(20161123561025)(20161123563025)(20161123565025)(20161123556025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123559100);
	SRVR:CY4PR03MB2789; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY4PR03MB2789; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR03MB2789;
	4:LVb9Ys2BVkL85ZoICZRsOXbXOrG+1t2R106pk0dhuo?=
	=?us-ascii?Q?sw/VO0StLxJcCGSFxEotHmLURz7DCWGOUdU8IX7WqLJd8LT3cL0v6I4QvIpA?=
	=?us-ascii?Q?QxrnrALjaySTDQq9lUxk5T8Lbx8rtMtoS42cJPjxjYmUfnALxsMNLT0PPr6Q?=
	=?us-ascii?Q?0RnI9ezvzvfvpwswaDmgCobrhdJ1QrL/GuD+A9dxkeoRj1HY8hqKfKSfPc1D?=
	=?us-ascii?Q?aNwOjoAkG0ww7suEUtAAYpFo6L9eYoEatV1my6cL2NsRnLlbTIjg8ELprYF+?=
	=?us-ascii?Q?uGmMVWYUE7Qsj4DFB8vg0is20Em6aaTEzqN7WiCKs7sLCGkaOWZ+vTrKZbvL?=
	=?us-ascii?Q?W7ZRhshX+O5mCbg5wYcl8+IGXTFZPnbkkdBCWD22dJbfHWjIfi/ScJ4B5kCk?=
	=?us-ascii?Q?fe+cgF7c20SKnPIEBt9+9iSVulQst9f64OGX4nzgprCtQvGMW2NwWHWDyPBz?=
	=?us-ascii?Q?q/hFR/MRvKHYbKoIT2NldO0Wqr/N+NQM/KusLzG7CD7TlPvmIRd95zDJHHhZ?=
	=?us-ascii?Q?ZMsPc5qieQt2w3P5nhCa7E5MAIeskTdjr/45zu6qaAgSR+NjsUDl+4cqRHfB?=
	=?us-ascii?Q?92WI8JDIhvTBcDVSZaOoxC8jQmaro1uoTmvvJhdj3ZCXBziZdqazVPgMYDPi?=
	=?us-ascii?Q?i0FZy3OdrLbmUsUGsIrSA/KEfDRHRhpT2nGEezZnDM2A3EN4LzEr85jIBdGz?=
	=?us-ascii?Q?9PGq8MqmYkYcNF62V4nQOmt34IttdCn1arw+3sA/aN6CqhQHPKAy4hPuwRSC?=
	=?us-ascii?Q?Y+34RqyEex9VmEGbWB4XdbcdK3r9poz/03fa5HLAOxQocILQp4bTzNKAmyaK?=
	=?us-ascii?Q?ZbmT4v/i2Tj/gD7J5h/kJQFPoX6q3l9uXH+X6e0njgimAoYYsHvJmVd1ZB0k?=
	=?us-ascii?Q?C3Ti19tloWgu2sAUY9AFzkwNSQM5gaGqw+zFTkdym2ZDP3GyIej9d2eA6b7B?=
	=?us-ascii?Q?hJJslqeCZLU9C7K/T9Vn4RQt0lfF6hTGyi8Oc2wg=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR03MB2789;
	23:Sks4+RF4hGY5DLUWQCgRefpgH0znAACtu/khSVZYM?=
	=?us-ascii?Q?4R6npOkMqKMvhy8JaNbvE0r6Jz4/I6wvJeW5x9Gu8cVCQgLTPu/2ybSbWPM8?=
	=?us-ascii?Q?lGwUjkVdZXhMqbVT5PWtOBkkmLBJ/TqTRoI1tGnHjB3a6QjbYpQiSF8G9TOk?=
	=?us-ascii?Q?SKhuWIL6MAZHHfruAiB0iMg9Bvn+W8yF9dXTlT6f6DwI9/Gu5PwHTijtquT7?=
	=?us-ascii?Q?wuF4eB80bt2zzPWfWRjzGcS+yYlsUdMVaxXtp8wE0ZW17UZpIG8ktAQCwjCA?=
	=?us-ascii?Q?adYF6lILfGkq7q/rmj9kRbNX2lPyD76atS0Pf538Sl/KuWBCCDpylBzW0pzG?=
	=?us-ascii?Q?+iRBiapU/+A9ulETMiVhdLbYzx0s5XEdmmYe93xW79tdJRhNKrQOCEaFey9k?=
	=?us-ascii?Q?Wt+oEmNDj27xb9bbSzCVVgDih17QjUImqYV3Ep1gRUz4BqwPG0jjj5/Rdszp?=
	=?us-ascii?Q?3z/m0h6rHU3P2ftdztJklOT+rjjmc8A9svbqfUdVy0rMQRickvsZs5bwcD70?=
	=?us-ascii?Q?bqJkwdBEAlGD2MdB9otI/AZ2LYzTfE9Yu5ffKQk5Dxk6JhiO5fhU3jY2353E?=
	=?us-ascii?Q?ScwVGyip1QCQ/OGd/nFBzchOhB6SLpokFnoy7QC5h+ZU4savmni9gAXWi69E?=
	=?us-ascii?Q?lT+g56t2J/kvitPCrPKnDhnsXeq1Ys1s1hGRvI2BRlUah0ZkgH1McNQSoRtZ?=
	=?us-ascii?Q?fFO71/8YNNJIOZSiEA7IDC8LAJuu69UZA3lZmoNqxqacZaXVXXwLiRCpj/ev?=
	=?us-ascii?Q?EWmfOctLsgj7P4VbyHns2qTsgh6650NphodEcgSkl34WwHOhBK2AO8/E7KT7?=
	=?us-ascii?Q?EFUU0fGvLC3U5Ab4r9596NcipnQDqnGml0eAVqhyo/wdnZrUiczO3yEs7jKT?=
	=?us-ascii?Q?iGBGgn8e9ewqyojyA6BnJc+O1zOO+k3o/Jv0ZR4CraOe8V0mViMLyJzy8ofr?=
	=?us-ascii?Q?QsRIY4cJpDWgRZ8q80+5F8QqkMlRlTxR4uhm0cOV7ehsC+AsazQntzZ/YFqh?=
	=?us-ascii?Q?ldQ8UifilKmTTmpTORbUzDXj3iwwcaSNc4+0cbEFoql+oH5H37p13Dp/t7Bn?=
	=?us-ascii?Q?Oy/4pNKB+zaV5KtKAEYLg+YmmGsHOhcW1rQ+VRKbVHCcoK9DTZDTYdGqyMw8?=
	=?us-ascii?Q?HjP+T/QAK+KCmaxSVf2R+93SafXQqht3DTzYKu7gwnIm8g1t3Xv0+IkbUzED?=
	=?us-ascii?Q?sIsvgvvCeJokQgR5Eylh1qSUYzdPuQn/+HyNZknQEjxgqGd1b7H2G1ZnVAlm?=
	=?us-ascii?Q?H9BPYdy+719sUmRuc2VamcGSQ/FafWMtEikLCgg8o2u6K9iKjR5QrE96aYne?=
	=?us-ascii?Q?RQFgAHwUzFVBTwU4W7oLCidRhS2VnC4XkLv/m/2H811?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2789;
	6:ppNcyXzgs6jevn4ACvlj0Mtnfd82N7kCBD35hV8tsDFaZZtjwARjDdgTcdA97fZZj4+2kDbpx6Es6RKR37r7MbVBoiRFMorZUrU1/v2h6/BHpTfsvTKieo3IabbhIDint6gSfzBEhc9zN5FPlsyvFt38PxevsZsjFUEhuSpX3GUlwb8Yhp79c1g5OL/jMQZVGSLs/1n4PoTiDSlyLP5BVG15v8qOvzXxrLzvRO5gBLvPEmv2Hj9nOJuPrDSQ+gVHUuiCUV4Ee5dYxqa/jmikY0NheoUzUwTwJCyftBJV0/z8s8uIzu0Jp5MqBUwYBYWGEPpl/WjTKQMc0VaYo+QVZSZkcQGm5w3lKpEIZLxozm0Th4PqEwsHyKT1L6i3YOZhZnbih8Vn9uPUpJwJUTR4bjr0JQfFzjxnG/YKp+ZdHKcoT58UWBXK7WdTL0l4ALvb37ERdGR5P6evaKmws8lfB2Vqpjg9gSqNpvNbnDAYjBXBB5HoRPlbV0L6snCOuji/yChoGbmKoVZ7IbeW1kzbLw==;
	5:TMoT/W53X1xlmUfybxkbImzFc0jzCOheQZ7fEeOgFvW+BRA5eOMrL5IPy8br7szG85E4saG4sc3wVYZAfV6oQh+pL4GGVADyH7vjENSEA1ND8WE9pYmx3hGSLwLDFFXDROSzFL6Rb0Dx5q23yhbZ5SUUCWUGhcU9iXEs3NjZ7PHz9cF5hb2mbZ2GqF77pXQF;
	24:g9bayKFTJGbT2pSv4wrEmgfc6xONoBr/D9SZ7oG2p8Ezhxj3O1jrwmWNlWfYWYjzbmH099DwFxcxLtPPrRocSNTEyqPs6MzdKSxvLk54jcM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR03MB2789;
	7:diR4Z6IRb++/9tnv5R9rW+uAEZ3Cx64NV9G4Ll8A9weocgTlLHVQgYYGqEssPl45Y/KZqT+vJBfH1dUGmz6I9xZaE/dHf1/bKzgbwbqcz2KB3vcix8ig1x4zwdzn3s3aUgq6Z83r9TBY7FmP8hrdewUJ+FyqW3QGhIXv7ZX+U0dQl2QdR+wNOewwB0FQp858pvWECl6Oxcu+qpcohXRtR2oLkIIIBFJkEyP8v68KCqFLJCtpDlsCKLVg0QhMsrSpu8HhDCwGMJS81z1pRaCyvHnLfO//PTR6p/JxSPGSaNFnQSQdWzqLMRLxJ/OGbrv72dWRS+m+gx8i2MHfoFNPmg==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 07:36:06.4877 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2789
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH v2 5/6] gstreamer1.0-plugins-bad: Fix gst-player failed to load external subtitle uri
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
X-List-Received-Date: Tue, 23 May 2017 07:36:07 -0000
Content-Type: text/plain

gst_player_set_uri_internal shouldn't free suburi which maybe set
by user to load external subtitle before start play. It just need
reset playbin's subutri property to NULL no matter if there was a
previous one or not.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...fix-gst-player-failed-to-load-external-su.patch | 50 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
new file mode 100755
index 0000000..0d42243
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
@@ -0,0 +1,50 @@
+From a085090ec68efccd4d82c7cf4ea6f18fb475c4d8 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Thu, 2 Mar 2017 14:36:56 +0800
+Subject: [PATCH] gst-player: fix gst-player failed to load external subtitle
+ uri
+
+gst_player_set_uri_internal shouldn't free suburi which maybe set
+by user to load external subtitle before start play. It just need
+reset playbin's subutri property to NULL no matter if there was a
+previous one or not.
+
+Upstream-Status: Backport[1.11.3]
+https://bugzilla.gnome.org/show_bug.cgi?id=779453
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ gst-libs/gst/player/gstplayer.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/gst-libs/gst/player/gstplayer.c b/gst-libs/gst/player/gstplayer.c
+index fc5463a..3757a09 100644
+--- a/gst-libs/gst/player/gstplayer.c
++++ b/gst-libs/gst/player/gstplayer.c
+@@ -582,12 +582,7 @@ gst_player_set_uri_internal (gpointer user_data)
+         (GDestroyNotify) uri_loaded_signal_data_free);
+   }
+ 
+-  /* if have suburi from previous playback then free it */
+-  if (self->suburi) {
+-    g_free (self->suburi);
+-    self->suburi = NULL;
+-    g_object_set (self->playbin, "suburi", NULL, NULL);
+-  }
++  g_object_set (self->playbin, "suburi", NULL, NULL);
+ 
+   g_mutex_unlock (&self->lock);
+ 
+@@ -667,6 +662,9 @@ gst_player_set_property (GObject * object, guint prop_id,
+       g_free (self->redirect_uri);
+       self->redirect_uri = NULL;
+ 
++      g_free (self->suburi);
++      self->suburi = NULL;
++
+       self->uri = g_value_dup_string (value);
+       GST_DEBUG_OBJECT (self, "Set uri=%s", self->uri);
+       g_mutex_unlock (&self->lock);
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 82cd91c..91e1a51 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
     file://0004-player-Add-get-track-number-media-info-API.patch \
     file://0005-player-Add-overlayvideorenderer-video-sink.patch \
+    file://0006-gst-player-fix-gst-player-failed-to-load-external-su.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1



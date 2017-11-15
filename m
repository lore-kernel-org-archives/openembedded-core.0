Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 542 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Nov 2017 17:53:27 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0085.outbound.protection.outlook.com [104.47.40.85])
	by mail.openembedded.org (Postfix) with ESMTP id E4D6E7847F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 17:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pOm6f0axURtHbxDrBF7QZwNRsfkPFn8TvsCc9Jy9Ry4=;
	b=w17UuXD3LUgnEwZ7aFaO9QVcERmYyM2Vft7mxoFWgBzhvM9wagQn1qG0RbXLy9wki2cO5YyKbdvrjl1Ah4o9ymSbvLSBVoJ4XygTM93ywUlzB0QShkEpsWhpodmT8bxVG08jGvJl56Pxjhets8Fwq/s2FEqxnuDgbYNp2puBJyU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from willamette.Home (71.35.172.156) by
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.239.5; Wed, 15 Nov 2017 17:53:27 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2017 09:53:02 -0800
Message-Id: <20171115175303.3557-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CO2PR07CA0084.namprd07.prod.outlook.com (10.174.192.52) To
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 926f976a-a36c-43d1-968d-08d52c51c6bf
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:DM5PR0101MB2940; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	3:PeWlrAL8mPABM35hmGnvmGXBLx2NphoVCLH+6Xfa7Ox4eLPfPTbrioYw4Rmpbs/lJlYiDNt5/kJdk9FcnSsw5dlvaPI9y8pubowlFXDSF9/RyqrWSq5uTrIrqz9BzRV/OzH0/FSbReE6czD/AIEelmXWcK3n3v9lmMToafDSJizc80N1Y4kpwqmCHpep7KPy3SjmnzLfo/xFIQOn0Jj+tXJgA4ZcrkoWCor9f92d6qvYOKh7Zc2Ou8h5pP4PD5yE;
	25:ugJC+AxQf++adxniuQXO7A8aFmqCgFOiVJajOgCtSXcPL6hJHj51jcV444tG0q+tPhnpP0crW0Zfbsh432WC8N+MgQQ+YiGMCT+BZu2ZDawPKVsGuhlLc03msVaSTDJR+yfRaaDoXLx1wj1wNJUzz1t4zXxhRzXMu7H6niRubVmOUc6LXp9gvUoBjMFmVXpUzlO17JgNhIKRurBTHWUmWFaq1wMTaC8+GIXQ1Bqiz5difXjQWFUyFzJrECvonIZg+LdN/gRVt0lrJgZfrr25IVRC+UMuF/MChIMOYTTpnx9elWwcvEEKDeawYZ50A+6y/MtwpzxMquYS5WQmYZZDWg==;
	31:3uHfJvoHTzRWKjgsl4uVIbbqbjbeqg4mgRXDNmuSfFh+rbt2fGD9m38/6iBNvvcd0jh7a090eOEG28znFvJF+NUlqqyRk3VWy1Qi5rrE9UiEfBOqLyhJN0FA5LofhBG1hWRMCf1eEvoP9gTHaCvGmyRzIvxjye3l91w3I3UzTr/G5kbZDXVByAyFLUmmv1XcOop6FdBVgbARcjzfa+cNUcf0wloZciRB/EgSYo8ORRE=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2940:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	20:7bLk/dZYcrododDpDUj6cQZyq1go2UMCcfhGT3pzFNPOkQnIAxVgSq2Bihk2Aei9MEqIrnxVFcMrvd7vcC1dZxblcoLQz85YC/OQpwboOdILwb5zZ1hRm/aSoWud/gqNlc0Z+Sl418DEObl4AKwUwx9EJoaYPUBm9x47ZgSa2hxv2TF7dQg1P4TohZX75+FggReNSxR97SXayp7Wtn6qUw3Chh2dYdkQusg6ydaWKb1u6WvXHDtICAoq7VK6Ih1HHOePjiJ8hCcm6ajvKJ7OaOujNVZ4Ph1EPqXQRC2J4aXg1DA/RZYah3dSLxtH9CTHwSPcMWKMrNdOrPucjra7QrXsFnipk9qxCPrJayBMsvCFydwX+FiNJpiYnhLi8Tx8d7H/nnlFs6ppPFt30R9eK8Nqf9vebmfQwBwjVWvTMWY=;
	4:ZXSXpseGzYWrs+u6dzk6KyKchcv5gcheaEfQQw5ZpybnCJ4iHgzaZwFJhFMhp/qH35/cv8uqsOqr9NdxKfKxErnt9VwuTe5saV+ku3Rkc1IAdTH0yKlofKxXLldWm0ppjJESk9NrXfcq85ENQUaWc8wwzc4xV649FyYCsSflwy8nsOqeLgH8MdV+uefnNvv2ioOl6PHwpPxJ1bImdnTw0UPMQ+1E7sg/1QZ/Y0TG+XovHW8ckIRxSHyMOpn2u0M1oSwj2mOUvfCJprZWHcJoxg==
X-Microsoft-Antispam-PRVS: <DM5PR0101MB2940316C897502122675D646AB290@DM5PR0101MB2940.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93001095)(3231022)(3002001)(10201501046)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2940; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2940; 
X-Forefront-PRVS: 0492FD61DD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(39830400002)(376002)(346002)(199003)(189002)(54906003)(53936002)(478600001)(69596002)(36756003)(101416001)(21086003)(8676002)(6512007)(81156014)(86362001)(81166006)(50986999)(316002)(5003940100001)(16526018)(16586007)(6666003)(6916009)(107886003)(68736007)(1076002)(33646002)(25786009)(4326008)(189998001)(8936002)(2906002)(47776003)(305945005)(6116002)(6486002)(2351001)(50466002)(6506006)(7736002)(3846002)(106356001)(105586002)(5660300001)(50226002)(2361001)(66066001)(97736004)(48376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2940;
	H:willamette.Home; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0101MB2940;
	23:+m78aHfT9sE+D9fMspGVJ+iJ38JDiCAmBBvGao7?=
	=?us-ascii?Q?J58KdZjO/5xdxI/vbMm1Su3cbXbYcaQJ33xb08Kpr3FJb5y9udHEu/wncQ04?=
	=?us-ascii?Q?ZqdhOFKVyeb+PLw3AGAI4HCu1jyqztB53NJ521zNl7Wee+yuo89AgXOxvj9x?=
	=?us-ascii?Q?Q0g3+VX6pLheoTNGDeiUARxqgGtvniC91ffraCls6qPHr//zAsygju5HxUOk?=
	=?us-ascii?Q?YYXOtU44AwKIWZmUC5dcYcKBcpPzYUSBUXQnp19Pu1ivYdIDXUvNeVIHIojC?=
	=?us-ascii?Q?aaOM/TReMV2J/Vg+pgJlCuvaeUFqIwlp2Rd2jqsprT/h4fjz2OJ5s0TKT+Sk?=
	=?us-ascii?Q?ochw+ItUUUd1ko5bUhFMM5VVwTQJn/Y6mgdIP/xsC6IiTzfInxOWY08apk7z?=
	=?us-ascii?Q?raQpY2QYKNK/0fLiFqsE0m/91YX+8oN29dlG/npzvhYZKaYBhz1do3q2opB9?=
	=?us-ascii?Q?i2JiQC4+IeKGRZ2g2BwDub4HFHgEDzkdgyBman8CEQ/EOS2JfT8LS+2Ohc65?=
	=?us-ascii?Q?pFh5lgcBZU9d4dW9eURB3gm8Ij65V0Gf/+3JeRWSN/LsJxBam5byLKLLgwRj?=
	=?us-ascii?Q?BZsXBsd3C9vVm2gTgr6En3mVUrwRQjOlYfofLwolfph026MaJFpDY+x9w8Js?=
	=?us-ascii?Q?ddZYnzcFxjMqontWD2B6GFkpWlm3rUlyBdUSIW6fGmPWSPtFGHMW6TKGnd5U?=
	=?us-ascii?Q?zXvOQX8FEVvSDLzu60T3KhT5x+yYHQRCS1U8ia/BEx+yYguKCjI3hchUOPZy?=
	=?us-ascii?Q?NfMD14K8RI3CXEayuOH9bpVrhrtnAFnTMLDeuDTLly/RV3IrstEgEuXDED4B?=
	=?us-ascii?Q?J6get1FFFBXILxiTQ9E0lw8Ssc02Mvib8Nuyx/20tdHHAWRPrbiox/NitHkA?=
	=?us-ascii?Q?WxhFA2+5vgVcYOhrAJiUf7a7OVafd2+QyFN+Gs/ft5rBzt7nREUXJaXq+Sau?=
	=?us-ascii?Q?75FDEyu6xNOZ1rIs1pXJrXZwVr6w5TxJXDr4oahe3fq9mnUE1Yl8CVcLdNyr?=
	=?us-ascii?Q?4bh1g9BXHJ+NJIOV6ZdcvbBvO2YqEXhxBu3WnJsSFT1/ZwlZDShHqav0DC50?=
	=?us-ascii?Q?uTayV9Hw4yJYn8aRRNuYCEaG7C9mHZICyEkXgFdS+//WiFXWxKK9M2oITM7R?=
	=?us-ascii?Q?aabJ2d6UcSSfSZ3ERzyA28nBtUi+pO1RUwDxPH8JtdvjINwDf+SCY2BYe7XE?=
	=?us-ascii?Q?Bvn1UsDVkpnTz9EA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	6:TXpL1m8t+P61n23GcYax5A6R68zVwfwvsVLd/S0GXq1nj1pdhyOg91VzeJ/3DX+SywDGk4l5Z3wwSzrp5Px+mv1FkJQDj0ACPfIE3O2oSdIMJI6FUQVRmrGriSMwHatLicUs3BTDxKrncYz8OL8lNQEAzSJE4jL5BLiW5T9/8b6OT2lCPQhbjYBG4/tyfcXlY8md7P0Tz6kqmqxQgGDFscuaQniiMBCN8zUJJ741EUjT1hPKdpETcAvpB9FS+FaiwQUapxLsCBeVUZcLrvny6M4rbBrZAWPBgm0k7tIKTXd03CxmYAP1t0lucWoqwIDZRwyHnYbmboklAwLkvZ53UfiIMi9T46eSvP/QuZsd5t0=;
	5:C11wzIEIY/g5qY/a2qKQlur9qUhRnU+Igrn9I2HnZOvKcYqjZzT8PdhrfGMKSVB3V/WZziS2W55NnG4243Gw5VVIJHLA2tuq6gIL0gpDCtRHQ9OWVSNYwPdDkJLEE1QRqIcsjkCWpDO3QkRIkkh/kJO4tOoe5/v056Y58rBsITA=;
	24:cH6N/ZaCgQxdbpaxDgo3z5wg8Dp1ExGDywR0mFDhowp8pPJjWEBxDu6fouxr9ni2gEefUPogoNgUJHLjJl6GS7DU05wwnL3apVZqvJ4PlL4=;
	7:+x5MXoiaB5pggrMI1hr0Nw6Wf3EFMYXTR3eHXVp3Ia83YIst9VFshHKLDlRaf/mmBsA+QVoCHJ2oZEDz587zeOrYFAt8fHghm013TU1PCVWUtvllRDAKcmZWToIsHIpDhgLG1OBeCRYJqiyAntPiXFQX7L1w3LIat+JT3XJZLSgcdnAv39xa1KXo9YMf5xZJ4sUKOkcQQH7/UXqZaOsflL/agWQieChk2MlhJDygDgfUapXxERTgGjqE4V+yhPzo
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2017 17:53:27.9023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 926f976a-a36c-43d1-968d-08d52c51c6bf
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2940
Subject: [PATCH 0/1] [poky-contrib] meson bugfix
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
X-List-Received-Date: Wed, 15 Nov 2017 17:53:28 -0000
Content-Type: text/plain

This patch is intended to be applied on top of Alexander Kanavin's poky-contrib
branch akanavin/meson in preparation for meson moving into OE-core.

Martin Kelly (1):
  meson: export native env only for native build

 meta/classes/meson.bbclass | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

--
2.11.0



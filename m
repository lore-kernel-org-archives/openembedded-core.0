Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3652.1795172327657083198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MarSFRjc;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=38298; q=dns/txt;
  s=iport01; t=1795172327; x=1796381927;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=Ah2Hqp6SwOfjqHVcO2c304abMJ4H52OtPw/N5I9lpXA=;
  b=MarSFRjcIJwa2Tza+KP3twF7gNmIuwKpK9quR5+UKNVPK9qJ8q2KhSlV
   3+V+QrbjELj/tsWbFrs7syee4oyWGHfB7myadeM4HdCJnDEWbXP+HK5+m
   mx/14TTWcg172MpuDQWTmqwnth7wuPg9PXT0AAjb9U/SL/ihwKFaq4xb1
   O+PTHHVUzg1vQoc8je1N6b4jmdjXDousEk/PDM4TjrAuNbW6DbTFKG9CG
   H+FJo0OQ/tl2ami3VClbud3JQje3ca6HBwONaddmYtBT67M19XEXkaO0g
   dIvOptXYQr7OCFC1Lbn4gaZx5G9FIU4f56oFRnTXFVdKSRcXlTEqvBkdh
   w==;
X-CSE-ConnectionGUID: 2WMENd3/Rc2l5H+s6ebOyA==
X-CSE-MsgGUID: 7jcp2WwKR/uKa1h8e0Nq9A==
X-IPAS-Result: =?us-ascii?q?A0B7AwDlJgBr/4oQJK1agS6BK4E9MVOBC4EjSYRXg0wDh?=
 =?us-ascii?q?SuGWYIhA5FQjFmBeAYPAQEBDQEBLgEVDQQBAYUFAo4hAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQMBEQgHAQUkATkEA?=
 =?us-ascii?q?gEIEQMBAQEQEQEIAwInCh0IAgQBEggSCIJhgh0WQQMBAg6dWpAScwKKHXQBg?=
 =?us-ascii?q?QQzgQGDKQE/AgUPL9wPFAGBOIVCgx8BASuBNYJdgSMYAYR9JxsbgXKBV4IyO?=
 =?us-ascii?q?D6BBYFcAQECAYEkEAEZER6DOT2CMASCInoSG4E5HmQJikyBQAEBgU+IJlJyI?=
 =?us-ascii?q?gMmMywBVRMXCwcFgSUQMwMgCi8tAhQNIg8aBS0dcAwnEikXER5YGwYFEiAqQ?=
 =?us-ascii?q?EMwK4ESgQNdgSsoXgIfRi0VgXYCglGBI10CAUlBDgdFUwklPgUSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxbDAsaBRpHCAILAgx0KBEQEx0eJC8FGiY+GwqBDCcfH?=
 =?us-ascii?q?hsOAh8QBg1tPTcGDxkDBIE1BZMAB0IZgiYRWwcBehMBByMBFzgwBhMIMToIL?=
 =?us-ascii?q?wKSeWqPEkejMgoog3mMJI0+ggSGLheEBIFXiz2ZWguYfSONZ5VphSYCBAIEB?=
 =?us-ascii?q?QIRAQEGNoEyPIEoHgwHcBWCbgEBATEJCkAZD5IkhRPJJ3kCAQgyAQEHAgcOA?=
 =?us-ascii?q?wuBaJAAAQEmgVYBAQ?=
IronPort-PHdr: A9a23:dabC4x25ipqMpv4YsmDPmlBlVkEcU/3cNwoR7N8gk71RN/7l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:PM0cJqjogGdRDIkbSk16OhhKX161OBEKZh0ujC45NGQN5FlHY01je
 htvUWDQPPmCYDfxLYx2PITn9UsG6J7Wn4dqSwA5+S83F39jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjb8UoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVCxcNaJ20Vs
 sYTcjRQTlOY2e+856OSH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQUaj/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKEIoDbHJgFzxbwS
 mTuoGbyGkslK/+ljiem+yus1uKXuzqqcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:s2PgIKzEeIvFLx4hRQXhKrPxJegkLtp133Aq2lEZdPULSL36qy
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
X-Talos-CUID: 9a23:2DhZb2NF3jPiHO5DAhZC2WgYQYcfeSfZkVeTOBG1A0F4YejA
X-Talos-MUID: 9a23:j/2l3AoswWAPFYnrSHsez25gP98y3LuNMgcQspxfu5mJbQppah7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:58:46 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 5D81D180008CB
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:58:46 +0000 (GMT)
X-CSE-ConnectionGUID: 5vSE34L0S9a6uqEIQUVhug==
X-CSE-MsgGUID: 2T005bT7RMSSrrTruP2seg==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208,217";a="68095244"
Received: from mail-centralusazon11010019.outbound.protection.outlook.com (HELO DM1PR04CU001.outbound.protection.outlook.com) ([52.101.61.19])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwVDtCp550Ftjxn8SK/XBiL1SwtfGVhs0OI20qkWH1Cyo8YsQ8Oo2Q2akdNwg/FrkgaskYCAX27UGBnLNVxhZUWhuW3DoXAQa8684PsE1Kuc+UGp9SWgn/240f1+qZ2vHSzyHGoG7ORUqwrlJMh2MPWGPPLPzai3d2vyN3q4Cfd2dk291jDkrzxtMdBGyuz0SCOI0BgJ3WxuQGoaI9xj4rbHCgYZyz82CpQMmN0tFVZ7uxoWMEfg8Js0+lsHd43pq3k9OQApun4Wmg/pgPjcbY8Hp56USciJ+YzEfnzYUr0HtrkOiMS2ZzYyV+3MEzCte2m/MH2Ng18qMAuEvyKNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah2Hqp6SwOfjqHVcO2c304abMJ4H52OtPw/N5I9lpXA=;
 b=jOFjYuKIPmGURfXwxCesIFaBg1iNnkCkHGlCYZ6a9RAvjwl1fyw+ljZLgS86X3udy1YeftWN7oiB6LSwiNFZs9jbT3Lk9wRfF7AxRO7b7aWdAFfg/WCEpQl6g6TaYGMRHcf+038QM4sbaZy9EJC0k89hx4Av+CNNBn2meQviT9fDQBHOioU9UPmiuhAG8MuWIOBF/uSFcmiNQ7Wr1TeKQt8SakUn84q3YPN5fCOBHZytk87+bqQN1NLfFIhaqzdpu7IjmLIABM41E5kMMRACvocX/vcvZh58RvQL4KG2JXpaH79CLlkB31g8D+g6ILDF/QJM6yHQooNmtmkn3U17DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4SPRMB0074.namprd11.prod.outlook.com (2603:10b6:8:1cc::23) by
 SAWPR11MB9570.namprd11.prod.outlook.com (2603:10b6:806:4e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 10:58:38 +0000
Received: from DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7]) by DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 10:58:38 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter.marko@siemens.com"
	<peter.marko@siemens.com>
Subject: Re: [OE-core][scarthgap][PATCH v2] ruby: Fix CVE-2026-97229
Thread-Topic: [OE-core][scarthgap][PATCH v2] ruby: Fix CVE-2026-97229
Thread-Index: AQHdeCAQf57hjP41wka3+2DndNjVMbc2ymhD
Date: Fri, 20 Nov 2026 10:58:38 +0000
Message-ID: <DM4SPRMB007468FB9A1574B88082E0D5C4782@DM4SPRMB0074.namprd11.prod.outlook.com>
References: <20261111110448.3303353-1-deeratho@cisco.com>
 <20261119120513.2285226-1-deeratho@cisco.com>
 <AS8PR10MB5073D7299AE21DFCCCA60610FD792@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073D7299AE21DFCCCA60610FD792@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d172db35-ebaa-4328-990c-5e3a8ab70639;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-19T12:16:28Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4SPRMB0074:EE_|SAWPR11MB9570:EE_
x-ms-office365-filtering-correlation-id: 62a8bac9-aa78-4005-c960-08df46f53b1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|261022105027099003|38070700021|261026121527099003|10067099003|260925022911599003|261026140227099003|260925021311599003|4143699003|260925021911599003|11063799006|56012099006|261021123027099003|261022075727099003|261022113327099003|261028144727099003|261102123227099003|261021121427099003|18002099003|6133799003|22082099003|13003099007|8096899003|3023799007|261009223027099003;
x-microsoft-antispam-message-info: zK+7M8927Hi+BSMbwrKoILO6LTzOZnSU5SQD5O3RdUN748+XENZX3sF5xt2P3BhGAoFKRbSWW+ygClubgCOaAQLlKcK8y3w7O8uFa3m6pquanigHnMboK8gLchbrGNGpzvNqBJhZPZgEGK5Vnqb9FieSAC3LMk1mseVMI/BPOcqh0oz+XYHZK1xqdKXlcLDu7glRTUO0T+bthGsLSeXrhcO+CGvD6sCUGoMvmeDqzwtoLxR7Pfui89L07jMCMht3h8j5+9C9M4roVm5/lR5q92EudHqd00d66IOkiV9hPpSpnFjLhPGxjJbi/b887TbPxWlswemAjD62AhD2JwsHB/mBoyZDenxoy/W0n8WX+0ubMqjK5xtl7ooFrjX05govAGOQksEWd2QtUdNqvGVWnjcCmlLoLMTBHoKT9T4QkCDDOJ0aQS53vVnfI6Hpcjo1F9rJUk6u+EuxQeF8obCQhiI4jSo+iqXy3let60EvURrAhcyEbfyRgBFhnR2xxBfu5NdBv8gOkPUeeRWQ5tknCUlw6ZaUia20QZGcl7K3tE4hacOrd0kfUS1YXU4+E2Oej3v3MRqVRArUJv8+YOm9NECacQjpDdWRYWch5I2RuiJ4zV6BNbAd1orN+/Wdg2OxUFj1C+XsVjr9BtdOeceRGciBnitgfKP0zv9sjlArjtc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4SPRMB0074.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261022105027099003)(38070700021)(261026121527099003)(10067099003)(260925022911599003)(261026140227099003)(260925021311599003)(4143699003)(260925021911599003)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261022113327099003)(261028144727099003)(261102123227099003)(261021121427099003)(18002099003)(6133799003)(22082099003)(13003099007)(8096899003)(3023799007)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?U3dQQVA1SlVLTjBnLy9COVhUZ0RTTlYvdEFSSXBqT2VmbngvSmNJSDlC?=
 =?iso-2022-jp?B?UGthSzNWTnRNREdRbzlCRlQxTTZ6YWdEbCsrOVlaR3dhcGYvNEVNTlMy?=
 =?iso-2022-jp?B?VEthZ09sdWUwUEVQWitFd0VRbjNRMUpVZk1JbGZuTlhNK0VOWEZkS1Ey?=
 =?iso-2022-jp?B?dzJXQklTbmxqMHdaeEg5aGhyWC9aQ1g5QXhDNkF0bnlnSjV0cExITTBP?=
 =?iso-2022-jp?B?Tm1aUHB6Z201RW9FMG9zVHNXK0dVWm1jcEp6NWZ1Z2xkZUpXaDd4UDhn?=
 =?iso-2022-jp?B?T0NHbDcwa3Ztdy9VRUZ6QVptQkVMdlp5WWViWjAyakJmT09XV3puWENt?=
 =?iso-2022-jp?B?SUJRenNPVDRqNjUxWnBHZXF2bjJxYmlXQXo5Q09XRnZ5MUZMa0U0alZY?=
 =?iso-2022-jp?B?L01aajA5N25kZ2dPWGZaNW5FMmd2TDhub1NpcHFtRFZrZll3OTViMGxX?=
 =?iso-2022-jp?B?RnJRd3NEbnNIb0ZYWlpsSFBrUUFYOUZJWUJBaEViVk1UK3V4bGtKNVY0?=
 =?iso-2022-jp?B?cGNFNno2bjJsTWhUcWF3dnpjQVBhL1h1MWdtMUs1Q1MweTh2Vi9jTi83?=
 =?iso-2022-jp?B?K2c4ZUpodWRENFVBcXlEV1VUOWhsM0dzWjFGc1A2MEVsZEpHdHVQQVlp?=
 =?iso-2022-jp?B?K2sxU2xkWWtVY1BWelFKVnVMMitidXhDSUd0N2lrbGJyQlhkM3lhM0lG?=
 =?iso-2022-jp?B?djNLY1pJZjRIazI1VXlTYTN1allLa0RQd1hiQzJDY0Nvck5OQTJTcVZF?=
 =?iso-2022-jp?B?blR2cUxzcGxnekd3ZmRic3dFRm5zM0RSM3BNcEthdFhIR3U1S1pUSGE4?=
 =?iso-2022-jp?B?a3Y5eVAza3RqV0paVElDektVOFJMbUJXYUlZVGpOcFlwZjRUUXNxSmU3?=
 =?iso-2022-jp?B?VzlVQUQ5ejVnc2JmbURta3NDeUZYWWxpblVtY3ozSlo5eUhFR1l0N3Rm?=
 =?iso-2022-jp?B?b1RxUGNnZEQxTDM5Y1p5b0ZtZ25hVTZUV0tTL3BucFhVcEZLSThQdGhW?=
 =?iso-2022-jp?B?WmwzYnRyYlZLZDB4OXM4U0JuNFhtUCt2QllhOHhrWmpjSGlCRmE1R1VR?=
 =?iso-2022-jp?B?OVdDeWtnaHdxRjBjZThtMjdBS1JkOTNxbjZJVnJEUUhBY1ZFZ0RrZUx6?=
 =?iso-2022-jp?B?WWZsNUIvblVuZnZwL1lqN3FVczBQSjNEZkhvYWtncVd1b2UvUG9NcDhO?=
 =?iso-2022-jp?B?STFML052VUlVM25UakZsZTJQYTJPNk0yVmxBdm9HdDd5bm9KSitRWGFm?=
 =?iso-2022-jp?B?NHh3eHVleCtPS29GSWNxNDNvcE9UKzBta2VtRzViNkxmb25ubG5lc3lz?=
 =?iso-2022-jp?B?ajhPelFSalRzcHBMbFRCYnNzZGtVaHVpZkNIQWpIZThpYktqeXpJVGFR?=
 =?iso-2022-jp?B?NlpvbUM3MXdGcWdzcmpIOWloVU0yeWNIVzJTa2tEY2pmckZuVFpEZGY0?=
 =?iso-2022-jp?B?QXdMd2JPZkpHa3RLSVRTREcxNVhHOENLVjFhL1dGRUZ3cjlhb2w5dnFo?=
 =?iso-2022-jp?B?Q0twd1VnUSsyYWc4RlJMTlNHM3JSMHZISEU0SFRjYVB6dW5mNnFsaDZv?=
 =?iso-2022-jp?B?OWYrK2xJOWdXekFVQlo4aytUSDRMZnpwUGpKdGZzZEpJamI5a1hvT2VR?=
 =?iso-2022-jp?B?RTdIbmlXNWRENU5sNnRlU21tNytiT3pROXhRclVLNU90N2tpc1BCV2ta?=
 =?iso-2022-jp?B?VTc4QUhSaDJkOWJ1VXdVOWJuQmw1QzZhbTNXbFNLd0IrT1ZteGREa29q?=
 =?iso-2022-jp?B?cklzWjRxNWJnd0dhTDZpNFVSYlAwRHk0QmkyRFVuZk9mdFdmdlRkRHNO?=
 =?iso-2022-jp?B?M09kMTNWWnYybWdXU0RlYVJzK3luZnM0cHUwR1dzTlQ2NFF0VWNlUm15?=
 =?iso-2022-jp?B?NUJ0OWxzZ1JOM1RPWlJHbFkvSVpVUzBIdFVucndUVHJSVVR4RHAwNnJw?=
 =?iso-2022-jp?B?QjNpeWRTaHBlNDVDMVc5SVAyRUpidnd3d1FyZFA2cllGRmZtYW5TNFpS?=
 =?iso-2022-jp?B?SXpMOVg5dHJkVTAyLzJlSnBzN1dQRUpoTENZOTdPSmc1d0F4cTBZanFm?=
 =?iso-2022-jp?B?Qi9tNUVQK1RsR2RtK2JhYVk1UEQxc1Rmc1VWV2hkNnVseXNWeTBxbDVM?=
 =?iso-2022-jp?B?QWdUU0gwRnpoOTNzb3RqMGRkUUlSVGZSM1kwNWpRRkp3VlZhdCtuSWZq?=
 =?iso-2022-jp?B?UHllUGEvY1F5U3hzTVpWb2thWkhxTEcrRzJFTEpQM3hmcWlrWFhXR1NP?=
 =?iso-2022-jp?B?T0g5WUo2c2FDTzJwaTVxbmVmaFF5V3Yxd1lpaVpLSVVrTWgvRHlsV0VL?=
 =?iso-2022-jp?B?TE1zM09rWmdQcEVoOUNYVHVTcFRVK2VLOHZrYzJBYzdwbC94Tjlkb1RW?=
 =?iso-2022-jp?B?dW9QREprQ2hLYndTOUtLeUJ5VFE5ZTZuVVI5dGxlYzFzZy9yUFE4Z2pl?=
 =?iso-2022-jp?B?UHhPV2sySW9IOFRuWHFaZnRUV3JKQlc2TDFSSmhyd092TXhEbkV5UkpW?=
 =?iso-2022-jp?B?UWl2VXlk?=
Content-Type: multipart/alternative;
	boundary="_000_DM4SPRMB007468FB9A1574B88082E0D5C4782DM4SPRMB0074namprd_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gvEO+dL4am/ovqyR34E5W4W0vtnkCBAPfgLwP+rtk9rs3SqNXeOT9txsmR+GVKrLofB2uI9Z8wFSc6g7lE2qrwy5ERfGVKCmSqZ8Hb+IYYNZzFRxf4dJh2V9e0L7jyriXApvYwKPUGYAdklteeLwDYhC8y5tIEY6kb+cP7ip9KE17MQUsuODXHDBo6wH5x+umLOAYYHFZRPECprIDkl/12uPL4KE0fSytVpHHcXSH82McCMKGQz6PbjTx6WZAuefxJ/MgB19KtIMqMJTiLgfMm/cqDqfpxxXPzk6ctUE7eWBL0yaplmIs8gE1shsOa79HfKT1topoxjHJSdTZ3trJw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4SPRMB0074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a8bac9-aa78-4005-c960-08df46f53b1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 10:58:38.2303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SpL2vKnHuTCg/VnEZxEZxZcZgvKWSdNeKrlGfmGeWX14hAohIOv+RDF1B35hzT3+QRxhiPgPglz9biykBPQuGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9570
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250772

--_000_DM4SPRMB007468FB9A1574B88082E0D5C4782DM4SPRMB0074namprd_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Peter,
Thanks for the suggestion. I agree that upgrading Ruby to a stable release =
will bring in additional CVE fixes and bug fixes.
I=1B$B!G=1B(Bve upgraded Ruby from 3.3.10 to 3.3.14 and submitted the patch=
 for review:
ruby: Upgrade 3.3.10 =1B$B"*=1B(B 3.3.14<https://lists.openembedded.org/g/o=
penembedded-core/topic/122364478>
Could you please review it and share your feedback?
Regards,
Deepak

________________________________
From: Peter Marko via openembedded-core <peter.marko=3Dsiemens.com@lists.op=
enembedded.org>
Sent: Thursday, November 19, 2026 5:48 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2] ruby: Fix CVE-2026-97229

We should rather upgrade to stable 3.3.13 release, there are many more CVEs=
 fixed there (and in 3.13.11 and 3.13.12).
Peter

> -----Original Message-----
> From: Deepak Rathore via openembedded-core
> <deeratho=3Dcisco.com@lists.openembedded.org>
> Sent: Thursday, November 19, 2026 1:05 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][scarthgap][PATCH v2] ruby: Fix CVE-2026-97229
>
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream Ruby 3.3 fixes for
> CVE-2026-97229. The three backported commits are referenced in
> [1], [2], and [3]. The upstream fix discussion is referenced in
> [4], and the public CVE advisory is referenced in [5].
>
> [1]
> https://github.com/ruby/ruby/commit/fa98ef030a54595d4387998b2fb48a412fc5c=
6
> 3c
> [2]
> https://github.com/ruby/ruby/commit/b03e500193371ae87dc4536d855008b42a9
> cd1a7
> [3]
> https://github.com/ruby/ruby/commit/f6496bca68ca445bcc1ced04818bfa4220b2b
> c7f
> [4] https://github.com/ruby/ruby/pull/19020
> [5] https://www.ruby-lang.org/en/news/2026/10/23/regexp-fixes-for-gitlab-=
cves/
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> ---
> Changes since v1:
> - Restore the full upstream cherry-picked commit hashes in all three
>   embedded patch messages.
>  .../ruby/ruby/CVE-2026-97229_p1.patch         | 97 +++++++++++++++++++
>  .../ruby/ruby/CVE-2026-97229_p2.patch         | 79 +++++++++++++++
>  .../ruby/ruby/CVE-2026-97229_p3.patch         | 31 ++++++
>  meta/recipes-devtools/ruby/ruby_3.3.10.bb     |  5 +-
>  4 files changed, 211 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-
> 97229_p1.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-
> 97229_p2.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-
> 97229_p3.patch
>
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
> b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
> new file mode 100644
> index 0000000000..4f68c23671
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
> @@ -0,0 +1,97 @@
> +From 59296a88f6d19fe07e1e0301fa4abeb53f89d117 Mon Sep 17 00:00:00
> 2001
> +From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
> +Date: Fri, 25 Sep 2026 11:44:12 +0900
> +Subject: [PATCH] Avoid overflow in the quantifier expansion size check
> +
> +Nested bounded repeats let the int product tlen * qn->lower overflow, so
> +the check that keeps the compiler from unrolling a large repeat could pa=
ss
> +for an enormous one, hanging the compile or emitting wrapped jump offset=
s.
> +Compare against the limit by division instead.
> +
> +CVE: CVE-2026-97229
> +Upstream-Status: Backport
> [https://github.com/ruby/ruby/commit/fa98ef030a54595d4387998b2fb48a412fc5=
c
> 63c]
> +
> +Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> +(cherry picked from commit 7cfe8dc82f9f1b3f9c37c78e362fcbdf3c0b84f4)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + regcomp.c                | 16 ++++++++++------
> + test/ruby/test_regexp.rb | 12 ++++++++++++
> + 2 files changed, 22 insertions(+), 6 deletions(-)
> +
> +diff --git a/regcomp.c b/regcomp.c
> +index 7bba1455e3..4eaccfaaa8 100644
> +--- a/regcomp.c
> ++++ b/regcomp.c
> +@@ -739,6 +739,10 @@ is_anychar_star_quantifier(QtfrNode* qn)
> + }
> +
> + #define QUANTIFIER_EXPAND_LIMIT_SIZE   50
> ++/* (tlen * n <=3D QUANTIFIER_EXPAND_LIMIT_SIZE) without overflowing int=
: tlen
> ++   and n are each bounded by ONIG_MAX_REPEAT_NUM, but their product is
> not. */
> ++#define IS_EXPAND_LIMIT_OK(tlen, n) \
> ++  ((n) <=3D 0 || (tlen) <=3D QUANTIFIER_EXPAND_LIMIT_SIZE / (n))
> + #define CKN_ON   (ckn > 0)
> +
> + #ifdef USE_COMBINATION_EXPLOSION_CHECK
> +@@ -1003,7 +1007,7 @@ compile_length_quantifier_node(QtfrNode* qn,
> regex_t* reg)
> +     mod_tlen =3D tlen;
> +
> +   if (infinite &&
> +-      (qn->lower <=3D 1 || tlen * qn->lower <=3D QUANTIFIER_EXPAND_LIMI=
T_SIZE))
> {
> ++      (qn->lower <=3D 1 || IS_EXPAND_LIMIT_OK(tlen, qn->lower))) {
> +     if (qn->lower =3D=3D 1 && tlen > QUANTIFIER_EXPAND_LIMIT_SIZE) {
> +       len =3D SIZE_OP_JUMP;
> +     }
> +@@ -1029,8 +1033,8 @@ compile_length_quantifier_node(QtfrNode* qn,
> regex_t* reg)
> +     len =3D SIZE_OP_JUMP + tlen;
> +   }
> +   else if (!infinite && qn->greedy &&
> +-           (qn->upper =3D=3D 1 || (tlen + SIZE_OP_PUSH) * qn->upper
> +-                                      <=3D QUANTIFIER_EXPAND_LIMIT_SIZE=
)) {
> ++           (qn->upper =3D=3D 1 ||
> ++            IS_EXPAND_LIMIT_OK(tlen + SIZE_OP_PUSH, qn->upper))) {
> +     len =3D tlen * qn->lower;
> +     len +=3D (SIZE_OP_PUSH + tlen) * (qn->upper - qn->lower);
> +   }
> +@@ -1080,7 +1084,7 @@ compile_quantifier_node(QtfrNode* qn, regex_t* reg=
)
> +     mod_tlen =3D tlen;
> +
> +   if (infinite &&
> +-      (qn->lower <=3D 1 || tlen * qn->lower <=3D QUANTIFIER_EXPAND_LIMI=
T_SIZE))
> {
> ++      (qn->lower <=3D 1 || IS_EXPAND_LIMIT_OK(tlen, qn->lower))) {
> +     if (qn->lower =3D=3D 1 && tlen > QUANTIFIER_EXPAND_LIMIT_SIZE) {
> +       if (qn->greedy) {
> + #ifdef USE_OP_PUSH_OR_JUMP_EXACT
> +@@ -1150,8 +1154,8 @@ compile_quantifier_node(QtfrNode* qn, regex_t* reg=
)
> +     r =3D compile_tree(qn->target, reg);
> +   }
> +   else if (!infinite && qn->greedy &&
> +-           (qn->upper =3D=3D 1 || (tlen + SIZE_OP_PUSH) * qn->upper
> +-                                  <=3D QUANTIFIER_EXPAND_LIMIT_SIZE)) {
> ++           (qn->upper =3D=3D 1 ||
> ++            IS_EXPAND_LIMIT_OK(tlen + SIZE_OP_PUSH, qn->upper))) {
> +     int n =3D qn->upper - qn->lower;
> +
> +     r =3D compile_tree_n_times(qn->target, qn->lower, reg);
> +diff --git a/test/ruby/test_regexp.rb b/test/ruby/test_regexp.rb
> +index 010be01960..debded0683 100644
> +--- a/test/ruby/test_regexp.rb
> ++++ b/test/ruby/test_regexp.rb
> +@@ -2107,4 +2107,16 @@ class TestRegexp < Test::Unit::TestCase
> +       re =3D~ s
> +     end
> +   end
> ++
> ++  def test_nested_repeat_expansion_overflow
> ++    assert_separately([], "#{<<-"begin;"}\n#{<<-'end;'}", timeout: 30)
> ++    begin;
> ++      # A nested repeat whose expanded size overflows int must not be
> ++      # unrolled: the compiler used to hang or emit wrapped jump offset=
s.
> ++      ["(?:.{90000,}){90000}", "(?:.{46341,}){46341}"].each do |src|
> ++        re =3D Regexp.new(src)
> ++        assert_nil(re.match("x" * 10), src)
> ++      end
> ++    end;
> ++  end
> + end
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
> b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
> new file mode 100644
> index 0000000000..a15e6964c4
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
> @@ -0,0 +1,79 @@
> +From 83e9b083d47536b4e10f3e8685af5c89646efab9 Mon Sep 17 00:00:00
> 2001
> +From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
> +Date: Fri, 25 Sep 2026 12:10:25 +0900
> +Subject: [PATCH] Reject a compiled program too big for its offset type
> +
> +Concatenated large repeats reach a program past INT_MAX from a few hundr=
ed
> +kilobytes of source, and the offsets emitted into it wrap.  Cap the size
> +while the program is emitted, which does not depend on the length pass t=
hat
> +overflows along with it.
> +
> +CVE: CVE-2026-97229
> +Upstream-Status: Backport
> [https://github.com/ruby/ruby/commit/b03e500193371ae87dc4536d855008b42a9
> cd1a7]
> +
> +Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
> +(cherry picked from commit cf35145fc46bc278e0ab0003478fc4afe6564819)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + include/ruby/onigmo.h | 1 +
> + regcomp.c             | 4 ++++
> + regerror.c            | 2 ++
> + regint.h              | 5 +++++
> + 4 files changed, 12 insertions(+)
> +
> +diff --git a/include/ruby/onigmo.h b/include/ruby/onigmo.h
> +index db290cd47a..8c8ee5a7ea 100644
> +--- a/include/ruby/onigmo.h
> ++++ b/include/ruby/onigmo.h
> +@@ -687,6 +687,7 @@ ONIG_EXTERN const OnigSyntaxType*
> OnigDefaultSyntax;
> + #define ONIGERR_NEVER_ENDING_RECURSION                       -221
> + #define ONIGERR_GROUP_NUMBER_OVER_FOR_CAPTURE_HISTORY
> -222
> + #define ONIGERR_INVALID_CHAR_PROPERTY_NAME                   -223
> ++#define ONIGERR_TOO_BIG_COMPILED_PROGRAM                     -226
> + #define ONIGERR_INVALID_CODE_POINT_VALUE                     -400
> + #define ONIGERR_INVALID_WIDE_CHAR_VALUE                      -400
> + #define ONIGERR_TOO_BIG_WIDE_CHAR_VALUE                      -401
> +diff --git a/regcomp.c b/regcomp.c
> +index 4eaccfaaa8..986b53eb55 100644
> +--- a/regcomp.c
> ++++ b/regcomp.c
> +@@ -223,6 +223,10 @@ unset_addr_list_add(UnsetAddrList* uslist, int offs=
et,
> struct _Node* node)
> + static int
> + add_opcode(regex_t* reg, int opcode)
> + {
> ++  /* Every instruction passes here, so this is where a program that wou=
ld
> ++     outgrow its offset type is stopped, while it is still being emitte=
d. */
> ++  if (reg->used > MAX_COMPILED_PROGRAM_SIZE)
> ++    return ONIGERR_TOO_BIG_COMPILED_PROGRAM;
> +   BBUF_ADD1(reg, opcode);
> +   return 0;
> + }
> +diff --git a/regerror.c b/regerror.c
> +index b18fc2e88b..0ff581ad42 100644
> +--- a/regerror.c
> ++++ b/regerror.c
> +@@ -165,6 +165,8 @@ onig_error_code_to_format(OnigPosition code)
> +     p =3D "group number is too big for capture history"; break;
> +   case ONIGERR_INVALID_CHAR_PROPERTY_NAME:
> +     p =3D "invalid character property name {%n}"; break;
> ++  case ONIGERR_TOO_BIG_COMPILED_PROGRAM:
> ++    p =3D "too big compiled program"; break;
> +   case ONIGERR_TOO_MANY_CAPTURE_GROUPS:
> +     p =3D "too many capture groups are specified"; break;
> +   case ONIGERR_INVALID_CODE_POINT_VALUE:
> +diff --git a/regint.h b/regint.h
> +index 75abfba235..8de93f5bdf 100644
> +--- a/regint.h
> ++++ b/regint.h
> +@@ -394,6 +394,11 @@ typedef unsigned int  BitStatusType;
> + #define INT_MAX_LIMIT           ((1UL << (SIZEOF_INT * 8 - 1)) - 1)
> + #define LONG_MAX_LIMIT           ((1UL << (SIZEOF_LONG * 8 - 1)) - 1)
> +
> ++/* Program offsets are RelAddrType, and the compile_length_*() function=
s sum
> ++   into int, so a larger program would wrap both.  The quarter leaves r=
oom
> ++   for the sums the offset arithmetic makes out of those lengths. */
> ++#define MAX_COMPILED_PROGRAM_SIZE  ((unsigned int )(INT_MAX_LIMIT
> / 4))
> ++
> + #define DIGITVAL(code)    ((code) - '0')
> + #define ODIGITVAL(code)   DIGITVAL(code)
> + #define XDIGITVAL(enc,code) \
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch
> b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch
> new file mode 100644
> index 0000000000..d39bc52874
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch
> @@ -0,0 +1,31 @@
> +From 4cca9e5cadd7b56525d012ff783c6abcf52094ba Mon Sep 17 00:00:00
> 2001
> +From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
> +Date: Fri, 23 Oct 2026 10:22:03 +0900
> +Subject: [PATCH] Keep the program size error from OP_END with subexp cal=
ls
> +
> +With a subexp call, the result of unset_addr_list_fix overwrote the erro=
r, so a
> pattern over the limit compiled without raising RegexpError.
> +
> +Follow-up to cf35145fc46.
> +
> +CVE: CVE-2026-97229
> +Upstream-Status: Backport
> [https://github.com/ruby/ruby/commit/f6496bca68ca445bcc1ced04818bfa4220b2
> bc7f]
> +
> +Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> +(cherry picked from commit 16d8a554b2ad279e08128b5e1dc4b342fccd33d7)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + regcomp.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/regcomp.c b/regcomp.c
> +index 986b53eb55..b1f63e6534 100644
> +--- a/regcomp.c
> ++++ b/regcomp.c
> +@@ -5971,6 +5971,7 @@ onig_compile(regex_t* reg, const UChar* pattern,
> const UChar* pattern_end,
> +   r =3D compile_tree(root, reg);
> +   if (r =3D=3D 0) {
> +     r =3D add_opcode(reg, OP_END);
> ++    if (r !=3D 0) goto err_unset;
> + #ifdef USE_SUBEXP_CALL
> +     if (scan_env.num_call > 0) {
> +       r =3D unset_addr_list_fix(&uslist, reg);
> diff --git a/meta/recipes-devtools/ruby/ruby_3.3.10.bb b/meta/recipes-
> devtools/ruby/ruby_3.3.10.bb
> index 936bc73e32..0cd0822ac9 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.3.10.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.3.10.bb
> @@ -27,7 +27,10 @@ SRC_URI =3D "http://cache.ruby-
> lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
>             file://0006-Make-gemspecs-reproducible.patch \
>             file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv=
.patch \
>             file://0007-Skip-test_rm_r_no_permissions-test-under-root.pat=
ch \
> -          "
> +           file://CVE-2026-97229_p1.patch \
> +           file://CVE-2026-97229_p2.patch \
> +           file://CVE-2026-97229_p3.patch \
> +           "
>  UPSTREAM_CHECK_URI =3D "https://www.ruby-lang.org/en/downloads/"
>
>  inherit autotools ptest pkgconfig
> --
> 2.35.6


--_000_DM4SPRMB007468FB9A1574B88082E0D5C4782DM4SPRMB0074namprd_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Peter,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks for the suggestion. I agree that upgrading Ruby to a stable release =
will bring in additional CVE fixes and bug fixes.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I=1B$B!G=1B(Bve upgraded Ruby from 3.3.10 to 3.3.14 and submitted the patch=
 for review:</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/1223644=
78" id=3D"OWA3bbe5c8b-700e-0e50-8833-3a7e44894da2" class=3D"OWAAutoLink">ru=
by: Upgrade 3.3.10 =1B$B"*=1B(B 3.3.14</a></div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Could you please review it and share your feedback?</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Deepak</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Peter Marko via openembedded-core &lt;peter.marko=3Dsiemens.co=
m@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, November 19, 2026 5:48 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH v2] ruby: Fix CVE-2026-97229=
</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">We should rather upgrade to stable 3.3.13 r=
elease, there are many more CVEs fixed there (and in 3.13.11 and 3.13.12).<=
br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Deepak Rathore via openembedded-core<br>
&gt; &lt;deeratho=3Dcisco.com@lists.openembedded.org&gt;<br>
&gt; Sent: Thursday, November 19, 2026 1:05 PM<br>
&gt; To: openembedded-core@lists.openembedded.org<br>
&gt; Subject: [OE-core][scarthgap][PATCH v2] ruby: Fix CVE-2026-97229<br>
&gt;<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream Ruby 3.3 fixes for<br>
&gt; CVE-2026-97229. The three backported commits are referenced in<br>
&gt; [1], [2], and [3]. The upstream fix discussion is referenced in<br>
&gt; [4], and the public CVE advisory is referenced in [5].<br>
&gt;<br>
&gt; [1]<br>
&gt; <a href=3D"https://github.com/ruby/ruby/commit/fa98ef030a54595d4387998=
b2fb48a412fc5c6" id=3D"OWAcc365f26-434e-7357-69dd-2397d9c75f5d" class=3D"OW=
AAutoLink" data-auth=3D"NotApplicable">
https://github.com/ruby/ruby/commit/fa98ef030a54595d4387998b2fb48a412fc5c6<=
/a><br>
&gt; 3c<br>
&gt; [2]<br>
&gt; <a href=3D"https://github.com/ruby/ruby/commit/b03e500193371ae87dc4536=
d855008b42a9" id=3D"OWAf241bc4c-d62f-82af-26a0-f81c34526bd2" class=3D"OWAAu=
toLink" data-auth=3D"NotApplicable">
https://github.com/ruby/ruby/commit/b03e500193371ae87dc4536d855008b42a9</a>=
<br>
&gt; cd1a7<br>
&gt; [3]<br>
&gt; <a href=3D"https://github.com/ruby/ruby/commit/f6496bca68ca445bcc1ced0=
4818bfa4220b2b" id=3D"OWA9bfbe780-191f-555a-09f2-cb80b1be5fd9" class=3D"OWA=
AutoLink" data-auth=3D"NotApplicable">
https://github.com/ruby/ruby/commit/f6496bca68ca445bcc1ced04818bfa4220b2b</=
a><br>
&gt; c7f<br>
&gt; [4] <a href=3D"https://github.com/ruby/ruby/pull/19020" id=3D"OWAfb233=
cd2-48aa-822b-ec9e-cc8c589c005e" class=3D"OWAAutoLink" data-auth=3D"NotAppl=
icable">
https://github.com/ruby/ruby/pull/19020</a><br>
&gt; [5] <a href=3D"https://www.ruby-lang.org/en/news/2026/10/23/regexp-fix=
es-for-gitlab-cves/" id=3D"OWAb95298d5-7728-b926-5d3d-6aa93ed49a8c" class=
=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://www.ruby-lang.org/en/news/2026/10/23/regexp-fixes-for-gitlab-cves/<=
/a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; ---<br>
&gt; Changes since v1:<br>
&gt; - Restore the full upstream cherry-picked commit hashes in all three<b=
r>
&gt;&nbsp;&nbsp; embedded patch messages.<br>
&gt;&nbsp; .../ruby/ruby/CVE-2026-97229_p1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 97 +++++++++++++++++++<br>
&gt;&nbsp; .../ruby/ruby/CVE-2026-97229_p2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 79 +++++++++++++++<br>
&gt;&nbsp; .../ruby/ruby/CVE-2026-97229_p3.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 31 ++++++<br>
&gt;&nbsp; meta/recipes-devtools/ruby/ruby_3.3.10.bb&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 5 +-<br>
&gt;&nbsp; 4 files changed, 211 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-<br>
&gt; 97229_p1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-<br>
&gt; 97229_p2.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-<br>
&gt; 97229_p3.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch<b=
r>
&gt; b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4f68c23671<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch<br>
&gt; @@ -0,0 +1,97 @@<br>
&gt; +From 59296a88f6d19fe07e1e0301fa4abeb53f89d117 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Hiroshi SHIBATA &lt;hsbt@ruby-lang.org&gt;<br>
&gt; +Date: Fri, 25 Sep 2026 11:44:12 +0900<br>
&gt; +Subject: [PATCH] Avoid overflow in the quantifier expansion size chec=
k<br>
&gt; +<br>
&gt; +Nested bounded repeats let the int product tlen * qn-&gt;lower overfl=
ow, so<br>
&gt; +the check that keeps the compiler from unrolling a large repeat could=
 pass<br>
&gt; +for an enormous one, hanging the compile or emitting wrapped jump off=
sets.<br>
&gt; +Compare against the limit by division instead.<br>
&gt; +<br>
&gt; +CVE: CVE-2026-97229<br>
&gt; +Upstream-Status: Backport<br>
&gt; [https://github.com/ruby/ruby/commit/fa98ef030a54595d4387998b2fb48a412=
fc5c<br>
&gt; 63c]<br>
&gt; +<br>
&gt; +Co-Authored-By: Claude Opus 5.5 &lt;noreply@anthropic.com&gt;<br>
&gt; +(cherry picked from commit 7cfe8dc82f9f1b3f9c37c78e362fcbdf3c0b84f4)<=
br>
&gt; +Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; +---<br>
&gt; + regcomp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 16 ++++++++++------<br>
&gt; + test/ruby/test_regexp.rb | 12 ++++++++++++<br>
&gt; + 2 files changed, 22 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/regcomp.c b/regcomp.c<br>
&gt; +index 7bba1455e3..4eaccfaaa8 100644<br>
&gt; +--- a/regcomp.c<br>
&gt; ++++ b/regcomp.c<br>
&gt; +@@ -739,6 +739,10 @@ is_anychar_star_quantifier(QtfrNode* qn)<br>
&gt; + }<br>
&gt; +<br>
&gt; + #define QUANTIFIER_EXPAND_LIMIT_SIZE&nbsp;&nbsp; 50<br>
&gt; ++/* (tlen * n &lt;=3D QUANTIFIER_EXPAND_LIMIT_SIZE) without overflowi=
ng int: tlen<br>
&gt; ++&nbsp;&nbsp; and n are each bounded by ONIG_MAX_REPEAT_NUM, but thei=
r product is<br>
&gt; not. */<br>
&gt; ++#define IS_EXPAND_LIMIT_OK(tlen, n) \<br>
&gt; ++&nbsp; ((n) &lt;=3D 0 || (tlen) &lt;=3D QUANTIFIER_EXPAND_LIMIT_SIZE=
 / (n))<br>
&gt; + #define CKN_ON&nbsp;&nbsp; (ckn &gt; 0)<br>
&gt; +<br>
&gt; + #ifdef USE_COMBINATION_EXPLOSION_CHECK<br>
&gt; +@@ -1003,7 +1007,7 @@ compile_length_quantifier_node(QtfrNode* qn,<br=
>
&gt; regex_t* reg)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; mod_tlen =3D tlen;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; if (infinite &amp;&amp;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qn-&gt;lower &lt;=3D 1 || tlen * qn-=
&gt;lower &lt;=3D QUANTIFIER_EXPAND_LIMIT_SIZE))<br>
&gt; {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qn-&gt;lower &lt;=3D 1 || IS_EXPAND_=
LIMIT_OK(tlen, qn-&gt;lower))) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (qn-&gt;lower =3D=3D 1 &amp;&amp; tlen &g=
t; QUANTIFIER_EXPAND_LIMIT_SIZE) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D SIZE_OP_JUMP;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +@@ -1029,8 +1033,8 @@ compile_length_quantifier_node(QtfrNode* qn,<br=
>
&gt; regex_t* reg)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; len =3D SIZE_OP_JUMP + tlen;<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp; else if (!infinite &amp;&amp; qn-&gt;greedy &amp;&amp;<b=
r>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qn-&gt=
;upper =3D=3D 1 || (tlen + SIZE_OP_PUSH) * qn-&gt;upper<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &lt;=3D QUANTIFIER_EXPAND_LIMIT_SIZE)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qn-&gt=
;upper =3D=3D 1 ||<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I=
S_EXPAND_LIMIT_OK(tlen + SIZE_OP_PUSH, qn-&gt;upper))) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; len =3D tlen * qn-&gt;lower;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; len +=3D (SIZE_OP_PUSH + tlen) * (qn-&gt;upp=
er - qn-&gt;lower);<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +@@ -1080,7 +1084,7 @@ compile_quantifier_node(QtfrNode* qn, regex_t* =
reg)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; mod_tlen =3D tlen;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; if (infinite &amp;&amp;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qn-&gt;lower &lt;=3D 1 || tlen * qn-=
&gt;lower &lt;=3D QUANTIFIER_EXPAND_LIMIT_SIZE))<br>
&gt; {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qn-&gt;lower &lt;=3D 1 || IS_EXPAND_=
LIMIT_OK(tlen, qn-&gt;lower))) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (qn-&gt;lower =3D=3D 1 &amp;&amp; tlen &g=
t; QUANTIFIER_EXPAND_LIMIT_SIZE) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (qn-&gt;greedy) {<br>
&gt; + #ifdef USE_OP_PUSH_OR_JUMP_EXACT<br>
&gt; +@@ -1150,8 +1154,8 @@ compile_quantifier_node(QtfrNode* qn, regex_t* =
reg)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D compile_tree(qn-&gt;target, reg);<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp; else if (!infinite &amp;&amp; qn-&gt;greedy &amp;&amp;<b=
r>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qn-&gt=
;upper =3D=3D 1 || (tlen + SIZE_OP_PUSH) * qn-&gt;upper<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;=3D QUANTIFIER_=
EXPAND_LIMIT_SIZE)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qn-&gt=
;upper =3D=3D 1 ||<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I=
S_EXPAND_LIMIT_OK(tlen + SIZE_OP_PUSH, qn-&gt;upper))) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int n =3D qn-&gt;upper - qn-&gt;lower;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D compile_tree_n_times(qn-&gt;target, qn=
-&gt;lower, reg);<br>
&gt; +diff --git a/test/ruby/test_regexp.rb b/test/ruby/test_regexp.rb<br>
&gt; +index 010be01960..debded0683 100644<br>
&gt; +--- a/test/ruby/test_regexp.rb<br>
&gt; ++++ b/test/ruby/test_regexp.rb<br>
&gt; +@@ -2107,4 +2107,16 @@ class TestRegexp &lt; Test::Unit::TestCase<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re =3D~ s<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; end<br>
&gt; +&nbsp;&nbsp; end<br>
&gt; ++<br>
&gt; ++&nbsp; def test_nested_repeat_expansion_overflow<br>
&gt; ++&nbsp;&nbsp;&nbsp; assert_separately([], &quot;#{&lt;&lt;-&quot;begi=
n;&quot;}\n#{&lt;&lt;-'end;'}&quot;, timeout: 30)<br>
&gt; ++&nbsp;&nbsp;&nbsp; begin;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # A nested repeat whose expanded size=
 overflows int must not be<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # unrolled: the compiler used to hang=
 or emit wrapped jump offsets.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [&quot;(?:.{90000,}){90000}&quot;, &q=
uot;(?:.{46341,}){46341}&quot;].each do |src|<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re =3D Regexp.new(src)<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert_nil(re.match(&quot=
;x&quot; * 10), src)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>
&gt; ++&nbsp;&nbsp;&nbsp; end;<br>
&gt; ++&nbsp; end<br>
&gt; + end<br>
&gt; diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch<b=
r>
&gt; b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a15e6964c4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch<br>
&gt; @@ -0,0 +1,79 @@<br>
&gt; +From 83e9b083d47536b4e10f3e8685af5c89646efab9 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Hiroshi SHIBATA &lt;hsbt@ruby-lang.org&gt;<br>
&gt; +Date: Fri, 25 Sep 2026 12:10:25 +0900<br>
&gt; +Subject: [PATCH] Reject a compiled program too big for its offset typ=
e<br>
&gt; +<br>
&gt; +Concatenated large repeats reach a program past INT_MAX from a few hu=
ndred<br>
&gt; +kilobytes of source, and the offsets emitted into it wrap.&nbsp; Cap =
the size<br>
&gt; +while the program is emitted, which does not depend on the length pas=
s that<br>
&gt; +overflows along with it.<br>
&gt; +<br>
&gt; +CVE: CVE-2026-97229<br>
&gt; +Upstream-Status: Backport<br>
&gt; [https://github.com/ruby/ruby/commit/b03e500193371ae87dc4536d855008b42=
a9<br>
&gt; cd1a7]<br>
&gt; +<br>
&gt; +Co-Authored-By: Claude Opus 5 &lt;noreply@anthropic.com&gt;<br>
&gt; +(cherry picked from commit cf35145fc46bc278e0ab0003478fc4afe6564819)<=
br>
&gt; +Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; +---<br>
&gt; + include/ruby/onigmo.h | 1 +<br>
&gt; + regcomp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | 4 ++++<br>
&gt; + regerror.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | 2 ++<br>
&gt; + regint.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; | 5 +++++<br>
&gt; + 4 files changed, 12 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/include/ruby/onigmo.h b/include/ruby/onigmo.h<br>
&gt; +index db290cd47a..8c8ee5a7ea 100644<br>
&gt; +--- a/include/ruby/onigmo.h<br>
&gt; ++++ b/include/ruby/onigmo.h<br>
&gt; +@@ -687,6 +687,7 @@ ONIG_EXTERN const OnigSyntaxType*<br>
&gt; OnigDefaultSyntax;<br>
&gt; + #define ONIGERR_NEVER_ENDING_RECURSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; -221<br>
&gt; + #define ONIGERR_GROUP_NUMBER_OVER_FOR_CAPTURE_HISTORY<br>
&gt; -222<br>
&gt; + #define ONIGERR_INVALID_CHAR_PROPERTY_NAME&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; -223<br>
&gt; ++#define ONIGERR_TOO_BIG_COMPILED_PROGRAM&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; -226<br>
&gt; + #define ONIGERR_INVALID_CODE_POINT_VALUE&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; -400<br>
&gt; + #define ONIGERR_INVALID_WIDE_CHAR_VALUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; -400<br>
&gt; + #define ONIGERR_TOO_BIG_WIDE_CHAR_VALUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; -401<br>
&gt; +diff --git a/regcomp.c b/regcomp.c<br>
&gt; +index 4eaccfaaa8..986b53eb55 100644<br>
&gt; +--- a/regcomp.c<br>
&gt; ++++ b/regcomp.c<br>
&gt; +@@ -223,6 +223,10 @@ unset_addr_list_add(UnsetAddrList* uslist, int o=
ffset,<br>
&gt; struct _Node* node)<br>
&gt; + static int<br>
&gt; + add_opcode(regex_t* reg, int opcode)<br>
&gt; + {<br>
&gt; ++&nbsp; /* Every instruction passes here, so this is where a program =
that would<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; outgrow its offset type is stopped, while i=
t is still being emitted. */<br>
&gt; ++&nbsp; if (reg-&gt;used &gt; MAX_COMPILED_PROGRAM_SIZE)<br>
&gt; ++&nbsp;&nbsp;&nbsp; return ONIGERR_TOO_BIG_COMPILED_PROGRAM;<br>
&gt; +&nbsp;&nbsp; BBUF_ADD1(reg, opcode);<br>
&gt; +&nbsp;&nbsp; return 0;<br>
&gt; + }<br>
&gt; +diff --git a/regerror.c b/regerror.c<br>
&gt; +index b18fc2e88b..0ff581ad42 100644<br>
&gt; +--- a/regerror.c<br>
&gt; ++++ b/regerror.c<br>
&gt; +@@ -165,6 +165,8 @@ onig_error_code_to_format(OnigPosition code)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; p =3D &quot;group number is too big for capt=
ure history&quot;; break;<br>
&gt; +&nbsp;&nbsp; case ONIGERR_INVALID_CHAR_PROPERTY_NAME:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; p =3D &quot;invalid character property name =
{%n}&quot;; break;<br>
&gt; ++&nbsp; case ONIGERR_TOO_BIG_COMPILED_PROGRAM:<br>
&gt; ++&nbsp;&nbsp;&nbsp; p =3D &quot;too big compiled program&quot;; break=
;<br>
&gt; +&nbsp;&nbsp; case ONIGERR_TOO_MANY_CAPTURE_GROUPS:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; p =3D &quot;too many capture groups are spec=
ified&quot;; break;<br>
&gt; +&nbsp;&nbsp; case ONIGERR_INVALID_CODE_POINT_VALUE:<br>
&gt; +diff --git a/regint.h b/regint.h<br>
&gt; +index 75abfba235..8de93f5bdf 100644<br>
&gt; +--- a/regint.h<br>
&gt; ++++ b/regint.h<br>
&gt; +@@ -394,6 +394,11 @@ typedef unsigned int&nbsp; BitStatusType;<br>
&gt; + #define INT_MAX_LIMIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; ((1UL &lt;&lt; (SIZEOF_INT * 8 - 1)) - 1)<br>
&gt; + #define LONG_MAX_LIMIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ((1UL &lt;&lt; (SIZEOF_LONG * 8 - 1)) - 1)<br>
&gt; +<br>
&gt; ++/* Program offsets are RelAddrType, and the compile_length_*() funct=
ions sum<br>
&gt; ++&nbsp;&nbsp; into int, so a larger program would wrap both.&nbsp; Th=
e quarter leaves room<br>
&gt; ++&nbsp;&nbsp; for the sums the offset arithmetic makes out of those l=
engths. */<br>
&gt; ++#define MAX_COMPILED_PROGRAM_SIZE&nbsp; ((unsigned int )(INT_MAX_LIM=
IT<br>
&gt; / 4))<br>
&gt; ++<br>
&gt; + #define DIGITVAL(code)&nbsp;&nbsp;&nbsp; ((code) - '0')<br>
&gt; + #define ODIGITVAL(code)&nbsp;&nbsp; DIGITVAL(code)<br>
&gt; + #define XDIGITVAL(enc,code) \<br>
&gt; diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch<b=
r>
&gt; b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d39bc52874<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch<br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +From 4cca9e5cadd7b56525d012ff783c6abcf52094ba Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Hiroshi SHIBATA &lt;hsbt@ruby-lang.org&gt;<br>
&gt; +Date: Fri, 23 Oct 2026 10:22:03 +0900<br>
&gt; +Subject: [PATCH] Keep the program size error from OP_END with subexp =
calls<br>
&gt; +<br>
&gt; +With a subexp call, the result of unset_addr_list_fix overwrote the e=
rror, so a<br>
&gt; pattern over the limit compiled without raising RegexpError.<br>
&gt; +<br>
&gt; +Follow-up to cf35145fc46.<br>
&gt; +<br>
&gt; +CVE: CVE-2026-97229<br>
&gt; +Upstream-Status: Backport<br>
&gt; [https://github.com/ruby/ruby/commit/f6496bca68ca445bcc1ced04818bfa422=
0b2<br>
&gt; bc7f]<br>
&gt; +<br>
&gt; +Co-Authored-By: Claude Opus 5.5 &lt;noreply@anthropic.com&gt;<br>
&gt; +(cherry picked from commit 16d8a554b2ad279e08128b5e1dc4b342fccd33d7)<=
br>
&gt; +Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; +---<br>
&gt; + regcomp.c | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/regcomp.c b/regcomp.c<br>
&gt; +index 986b53eb55..b1f63e6534 100644<br>
&gt; +--- a/regcomp.c<br>
&gt; ++++ b/regcomp.c<br>
&gt; +@@ -5971,6 +5971,7 @@ onig_compile(regex_t* reg, const UChar* pattern=
,<br>
&gt; const UChar* pattern_end,<br>
&gt; +&nbsp;&nbsp; r =3D compile_tree(root, reg);<br>
&gt; +&nbsp;&nbsp; if (r =3D=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D add_opcode(reg, OP_END);<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (r !=3D 0) goto err_unset;<br>
&gt; + #ifdef USE_SUBEXP_CALL<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (scan_env.num_call &gt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D unset_addr_list_fix(&amp;u=
slist, reg);<br>
&gt; diff --git a/meta/recipes-devtools/ruby/ruby_3.3.10.bb b/meta/recipes-=
<br>
&gt; devtools/ruby/ruby_3.3.10.bb<br>
&gt; index 936bc73e32..0cd0822ac9 100644<br>
&gt; --- a/meta/recipes-devtools/ruby/ruby_3.3.10.bb<br>
&gt; +++ b/meta/recipes-devtools/ruby/ruby_3.3.10.bb<br>
&gt; @@ -27,7 +27,10 @@ SRC_URI =3D &quot;http://cache.ruby-<br>
&gt; lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0006-Make-gemspecs-reproducible.patch" id=3D"OWA50294c0=
0-ed63-009b-b93a-3de00ac5dba1" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">
file://0006-Make-gemspecs-reproducible.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.=
patch" id=3D"OWA077cb60d-d4e9-c380-c852-ef584c08c625" class=3D"OWAAutoLink"=
 data-auth=3D"NotApplicable">
file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch</a> \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0007-Skip-test_rm_r_no_permissions-test-under-root.patc=
h" id=3D"OWA714ed195-a378-159e-1cd6-f5f1894a6f24" class=3D"OWAAutoLink" dat=
a-auth=3D"NotApplicable">
file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-97229_p1.patch" id=3D"OWA2b6e5133-65b5-94c9-8588-bf7e2f=
5c614a" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-97229_p1.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-97229_p2.patch" id=3D"OWAc145f59f-f2da-ba85-f49f-8ef06d=
893ecc" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-97229_p2.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-97229_p3.patch" id=3D"OWAab979c46-f8e0-f4fe-63eb-4b9e53=
17b15d" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-97229_p3.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&gt;&nbsp; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.ruby-lang.or=
g/en/downloads/" id=3D"OWAf40a6963-ef7a-6be5-714a-6d3567dd0f9a" class=3D"OW=
AAutoLink" data-auth=3D"NotApplicable">https://www.ruby-lang.org/en/downloa=
ds/</a>&quot;<br>
&gt;<br>
&gt;&nbsp; inherit autotools ptest pkgconfig<br>
&gt; --<br>
&gt; 2.35.6<br>
<br>
</div>
</body>
</html>

--_000_DM4SPRMB007468FB9A1574B88082E0D5C4782DM4SPRMB0074namprd_--

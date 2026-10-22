Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16007.1792643543618360390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 21:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IOtXfuMP;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12601; q=dns/txt;
  s=iport01; t=1792643543; x=1793853143;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=o8YDcGLlsTUM9CTvWCN1+4ylSLh6ZsWYrD2tcRAyueQ=;
  b=IOtXfuMPV2pXDMleqQx4Moqr/YpdvawpSvuZ7fk3km75odkscpzhaPaI
   J8SsoUExa0sNjAR4f6kVA6ajq9QZKEnDGP2DQit5iBogOvOQN3KepNFaI
   xOhEhHg+CFDha2FfuZkaK7KEyUD827g4ChaZsE80eTfw7F5mKjhnJQ7WP
   egzGMBmGHNT1YmVgKfnZn9GmnAzVvE5tdJOn4BDJsDyJx3KBiptTgQ3OA
   H+kRuVXRMgQ/0/Qx1HgPwcFMIyi6dqxZT2THwA7sOD6a7kkNDXmZiwfK3
   z2Z9b8uAw2VMDlxW4pDuXCfmtkrDy8n0+hby2Q/i2eJNyWdxx2eH68cLl
   Q==;
X-CSE-ConnectionGUID: LW5cwVHjTuaYS0/sjcujfQ==
X-CSE-MsgGUID: /n3y5bXNS52oWiSGum/Jyg==
X-IPAS-Result: =?us-ascii?q?A0DbAwAfkdlq/5H/Ja1agS6BK4E9MVOBCQKBERJJiCMDh?=
 =?us-ascii?q?SuIegOeHIF+DwEBAQ0CLgEVDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQMBSgEtEAIBCBEDAQEBAR0RJ?=
 =?us-ascii?q?wodCAIEAQ0FCBKCaYIdFkEDAQIOqVwCih14gTSBAYMpAd0SFAGBOIVAgwMbA?=
 =?us-ascii?q?QEFJklsgl2BIxgBhHwnGxuBcoEVQoJpPoEFgVwCAgGBNBoRHh6DV4IwBIIie?=
 =?us-ascii?q?hIbgT+BAwmNAAEBhmFSciIDJjMsAVUTFwsHBYElEDMDIAovLQIUDSIPGgUtH?=
 =?us-ascii?q?XAMJxIPHRcRHlgbBgUSICpBQzArgRYjGTZrgQldgSspYAECH0YtFYF2AoJRg?=
 =?us-ascii?q?SNdAgFJQQ4HRVMJJT4FEkckIggSCQETGi4LgRo4PAkmQRUMWwsLGgUaSAgCC?=
 =?us-ascii?q?wIMfygRCW09NwYPGQMEgTUFkHEHW4MJAYENAStPgS4BBg8ZBhGTNo9BgXyMZ?=
 =?us-ascii?q?JUXCiiDdop8gSaNPogyF4VbpRQLmH0jjWeVYIUuAgQCBAUCEAEBBoFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+SJIUTySd5AgEIMgEBBwIHDgMLgWiQAAImgVYBAQ?=
IronPort-PHdr: A9a23:lLXzrBNUneT3uyTXaTcl6nc2WUAX0o4cdiYP4ZYhzrVWfbvmpdLpP
 VfU4rNmi1qaFYnY6vcRk+PNqOigQm0P55+drWoPOIJBTR4LiMga3kQgDceJBFe9LavCZC0hF
 8MEX1hgl0w=
IronPort-Data: A9a23:1p08hqLnt1TZ7iCxFE+RiZQlxSXFcZb7ZxGr2PjKsXjdYENS3zRWn
 2AcXjuPbvfcajPycotyPtzjoEtTupXXztJjHFYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2Qtajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1KMxw9IrM4+NpqCFB1r
 bsDKjsQbB660rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEmojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsi+e9a4aPIoziqcN92UDDt
 z/Mz0LCX0sdC92k5ieAtVC9ibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Ms0CSB3MPSXhKb9lOWNIKeAHGH
 2ShxrvBLTduq7aSD3ma89+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:PbFC46EjW3EGYaAspLqF6JLXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhJk3I+ertBEGBKUmsk6KdkrNhTItKPTOW91dAQ7sSl7cKrweQfxEWs9Qtqp
 uIEJIORuEYb2IK8PoSiTPQe71Psbv3lZxAx92us0uFJjsaEp2Imj0JcTpzZXcGPDWua6BJc6
 a0145snRblU3IRaciwG3kCWMb+h/CjrvjbSC9DLSQKrC2Vgx2VyJOSKXWl9yZbfyJEwL8k/2
 SAqArk+6Wlvci8zx/Xx0XT455VlNaJ8KoDOCWLsKcoAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6lvKF1vF4ifF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZ0Uw9p9txuZ
 g7nV5x9qAnSC8orh6NoOQgZCsa0HZcZkBSyNL7ukYvFbf2roUh9bD3snklS6voVxiKmLzPWN
 Mef/00oswmMW+yXjT+onRlxsCqUzAYGxeLRVVHh+muugImxkyQCyAjtZAidrBqzuNhd3FJit
 60QJhAhfVASNQbYrl6A/pEScyrCnbVSRaJK26KJ0/7fZt3cU4lhqSHqInd3tvaM6Ag3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTITH+mVTrgx8lC79wh04eMCIbDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7vmIXH1EYhE0gXiU91ZKGUYUscSptEnMmj+7/7jO8nvrKjWYfzTLL3iHXItXX7+GG
 IKWHzpKMBJ/imQKzbFadjqKgXQk2DEjOVN+fLhjp0uIaA2R/lxjjQ=
X-Talos-CUID: 9a23:Se4CRWxZQauZyna+DBVaBgUwJZ0ubUP9zkvNKn6DUSFySraIS1GprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AsqIEAg33JVA/X+Pi8aXHUU/ghzUjpKL1GR0HobM?=
 =?us-ascii?q?95pODCi1LFCqYyxamTdpy?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Oct 2026 04:32:22 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 2DF0F180001C6
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 04:32:22 +0000 (GMT)
X-CSE-ConnectionGUID: YDC3bKa8R1WKS4WPCD1REg==
X-CSE-MsgGUID: TgZbH085RV+Q6XLJePcY2g==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,171,1787011200"; 
   d="scan'208,217";a="76585782"
Received: from mail-northcentralusazon11010019.outbound.protection.outlook.com (HELO CH1PR05CU001.outbound.protection.outlook.com) ([52.101.193.19])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Oct 2026 04:32:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6MevDaj2FLwdOMexs7ANGmfs+w/d1IAJl2WCQWXzJFd0pzBKAnWqnwtlb49McLW5u7nAFJbAniafnbOGGVhgHw80l3w1MKCpyydmjOnOUkcv2nuDHEKf1aYi2kZqtxTLCm7kq0grssCK23UnIIAau3mhvD6hU9ZQhO3k4LOSNAmE2doX5e1Ywv2Tn1Av5qVZ9DjSQUNXNjzzjOR4pc3HcOVnGWZDtp8Eos2R+g0tfldF88FpxnBgNR3LGn1Dw/4KyLfCeAPBqDW/IcCnVXJ3QzdFDQl2ZrKeE4QmotFzAS6mqt6tp4De2NhsKiLuPzm6pW2Q/2vgR1cUG0ZAJmz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8YDcGLlsTUM9CTvWCN1+4ylSLh6ZsWYrD2tcRAyueQ=;
 b=M5mddiAv49R/sHlBVPFYNcfkHHcPe0qA3JuGZXTGjm+CtlUIdz3ShBlXOAqMmNwLP/iNjXpq97DKonRMv6jKpg6863I8g3nRYrKCx3c1lenDLp25pq4StdXWVN1omQTnljjv9qR3zWzbCypJFasXfrXD5/9acKVf54gdvYtStXlDyA9iRY6Ge2mH2HrfPRJNP/4Q0drztYrBdFDSBjlYg8DLZJnwWG7SqsyRM6UJscq3S5cjoEJCScehZj9ETNKV8QKuhJ3kRF/YSKkBpnDju7Vw3BLCjdr0zRCFl+fT55RCc+py1qngYJ7UZMBgtQtBGDJbT0/x+WuKwTt59qxwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Thu, 22 Oct
 2026 04:32:19 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 04:32:18 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-105841
Thread-Topic: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-105841
Thread-Index: AQHdXR+41fmoMbDTjkK8H8b17cspGrcE7JcAgAQVWuc=
Date: Thu, 22 Oct 2026 04:32:18 +0000
Message-ID: <PH7PR11MB859823D3EBE3DCFD9F617F1EAD652@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20261016033726.426908-1-hthakar@cisco.com>
 <DM8VHO5HY4L5.2OTI5CNBGV9OT@smile.fr>
In-Reply-To: <DM8VHO5HY4L5.2OTI5CNBGV9OT@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|DM4PR11MB6360:EE_
x-ms-office365-filtering-correlation-id: 5ba15385-a6d3-4f70-e7ee-08df2ff574a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|10067099003|18002099003|8096899003|13003099007|38070700021|11063799006|261009223027099003|4143699003|261021121427099003|56012099006;
x-microsoft-antispam-message-info: Mc309HiLzFU2kvbxQ9XetKCgleaZnSVt8IbDaOaAadqqTIuTsm9NkjxvQGor1nPJpqDmqFqSH+7v/yToLSJ3VkCU4K0pP0Ld6IMJ4K+XnK7jAf8/a1CIICXRGLUx7pn/WTLszPDvfbHnL8bez1GmoMxqBVVSwkL50HDelhR+2T1kbu18qMJIDlgEQpsfw3MA5aqpPF+rJQNV3PN78GCSegRSQMsomp7PZXyvePcC1nAft68OKVkkb8LI01kTaW2VaQHXjiDhBzjta97sGAubsS43Kd7Bpup2dzq3zgrjy0TW/E3PwTavLNqXJGaLa3FseKJZuFa5QMWk5h26OvKU2BN+o2JT3lrpqoq4iS/pzYbMIUENRgzOXIEOi/vZmnQvqxhzW+L4a1+5dOMXNhFwYeyiMQ1ARCqJttb78oTF3HsR7ofH6dzP8/yPdR8ohQlJAzW38u4I+Exaf8q+4pA1AmD6tiyWGdMdO2S3DFTw8vwYscyATMcVe67pv006yn2Ds14uLmCndN77N5RWO0jE+xTyLfRVFcEzCt4Ew05NKth+835cLUA8ZvsNsoIAEQrAa66kus+5u+oX+SdrX5+GHIH7QZuaXNOTo8dFwiuOczoKbJ+DtMSIiKmP6bRnhikPxiVgoPgBw2aMaMFVKNQUaImBOFLN2z1PHhVF8AR73HE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(10067099003)(18002099003)(8096899003)(13003099007)(38070700021)(11063799006)(261009223027099003)(4143699003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EofXcKcYTnJkzxFiSYRc/o38D+de7afYvK3cAKql1mWI6eo0Yv1A6F7Sk5?=
 =?iso-8859-1?Q?K7oITllivkNiCmLEaWLlC5SmKToSTOQH9JL9BEJFHfEMnx1hYXeLHIknDk?=
 =?iso-8859-1?Q?/38rKIBT9qfG+QOya6IjR9IbqM9jbi9JS6UBX9AmjENyDraci4AILSEeBX?=
 =?iso-8859-1?Q?Qe720gL7xe8pYyK4kOpf1v3tuct5gmrCqvFWwF5xoahNWxDyhMDNkoaivP?=
 =?iso-8859-1?Q?qPFA0WQeLD61mWkI8y64pc7uhSB7WU23HOM8V8Js2HAQu3ornzC+t0lmfM?=
 =?iso-8859-1?Q?zj1qGZmQRS7J++Ua0Pu5QT3+znX6u85sC7woNIfcbXNxdmjLFX6grepvRk?=
 =?iso-8859-1?Q?qCX1JUWz5HSw4ZF5sIZt/K134ISHcgBlNkIUSLbmK1nnL4KQfmmCaI8ksM?=
 =?iso-8859-1?Q?/wC6Bw20V3AbrGLFTzoWOjLPXSf/YxfTQwhW+SkI62ib2l3eGeMHIF1dQk?=
 =?iso-8859-1?Q?GXSVBBqfizE5dcEQmtcs499UjAMLlo0r5EirGntF1WhA0OIVglo7vxoURF?=
 =?iso-8859-1?Q?6fAEWUCqgU1gyL2h9KUwviEi/MAGu/3w3M4DhFVYfRaXj1Qm1/CvvPq744?=
 =?iso-8859-1?Q?Ktdp3HKwHWzpSjiR/ijFNGZRwtTJ4WOGjnVfh6+ozt86g4194yKM8u/WhY?=
 =?iso-8859-1?Q?KZ0BqEJwOxfw6ld1pQVZX0sByWLC67wZj/GB1oMpzcqgUoNHxOwCQARWal?=
 =?iso-8859-1?Q?4kswS+JFxOBqMsDqFA+W/A9uFvWGlZFj6xu8XovSqMkaCQmgw1f4smivw/?=
 =?iso-8859-1?Q?Q3WOt9+zwT5UvVDyNihlpwAfPHYhyEYf6CUX0b4pVWzbtoIT8kLaZtVm+l?=
 =?iso-8859-1?Q?wiwuuIoTj6Kiiv1ZHToK4Nvf4OCr4yT8tTu3hHNM9PP0GLlugy374YwrZ/?=
 =?iso-8859-1?Q?e3oYbw9g+TAklzQHXAgrAyb3JTGj2Qe3piGjcgedeZciedccNd8LPU9iol?=
 =?iso-8859-1?Q?VECFSGqN65KTe6KTiEONM0AQ744WMkTHeei5j4sK8q1uO4fM2KQv096N0R?=
 =?iso-8859-1?Q?+Q40q6u4BnddI+Zm0ZptujR2scYYADqZ7JfIG43zFwboypSzH2wASMGtRI?=
 =?iso-8859-1?Q?8HG64on0lYMqz0iESR/5FBQq6NWSHpG9zjFBMSG0R27RgAksPcKqOVVfsY?=
 =?iso-8859-1?Q?Tf1IaGPIfut0O0BcSDC2w/bwRctZG0nbvUpgE7QsPN97RDfXPujdxNoahe?=
 =?iso-8859-1?Q?KpDd5XFCUw5W+0JcZ+ESW81oJvXQp8ZuaWPn58s2SbHuQriSde6ymjp3zu?=
 =?iso-8859-1?Q?U4emXNXJCKQmamkO12cVhhil2cX/cQ/mtygBoNdX04ffBjwUY3RAjGzSNf?=
 =?iso-8859-1?Q?sPHWH6vP1dNzv/3cU+S8FChG0gLniS3D6wuMLuR0qYXKOcuC+HptAfpz9l?=
 =?iso-8859-1?Q?1LtPybdrAsxpkYe75tYNgoUL4KylOiEqz+kpvYiqCrCWAg1pOuVU/RsNyJ?=
 =?iso-8859-1?Q?XclCqKb4TvPM8S412M81RU7ETJioLWykL13g1skbxpCEjPzZRKZKrcZAcL?=
 =?iso-8859-1?Q?8tf20+Tk+wsjBk/inM5L8TAKYOMT4DFGED1NV/e9kcTQFcgkRhwfJV5LVf?=
 =?iso-8859-1?Q?8ErfKAKK7BEF+z7LwB2vT6TKtgaKVzwrbJca7KDoWvrl54YsY2KMV0lpbP?=
 =?iso-8859-1?Q?E0vJdSYttQbl81TdhnWwnycjl6AatFjSw2Y8+6ivOpovgCyt5b97Gkx9uZ?=
 =?iso-8859-1?Q?jH8glR6gYIKxNhUf2w8i6Ths9c+uEZlkrzSaVr1c+BVAphTL8dOFdbgiix?=
 =?iso-8859-1?Q?oBRJzIscXqNwrn2ZShM0ZRzZzMcGxcMxngkwIsETzPbbhm?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB859823D3EBE3DCFD9F617F1EAD652PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 3xr9CezNWzbnfd5tOw4JPfbVy//uoGe/7d8gXUM0JIDOzCsXZ6GaJZVgjEWS1MLYfz+lhYX2rNg++GoZKe6PNbn8xnQPgWEAINtdnCYw+ZgGLXWl5asBLP+t8mSe5gzeNbRNyAZtMOkgCO3BS4bmm5zxwvZenOc8YlISv6Tzq9gOthfM7VqoWYYU8BKZPZj6E5iAiUM9KTH851zBgMTqa/0jmoZ2+QNguB3Jdf0MAur3yB6VMWYRXES3nyyargmZzQ2k55umL/WuXTALBoA4RBAIrd4wibC3yxc+hew8n8rn/3ram0twbfXxGJ6qGK9rnw0IlEOErm8SkS+FZ0iXCA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba15385-a6d3-4f70-e7ee-08df2ff574a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 04:32:18.0223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNPM4GOapVjeQoqTSIwZJfPJ187lVU+J/ZqgdD01fS2yLp6RmAhMiUH7wupIgAwAIeSwM2lFtu/ChrUmTCwWsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-2.cisco.com [72.163.7.163];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 04:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248410

--_000_PH7PR11MB859823D3EBE3DCFD9F617F1EAD652PH7PR11MB8598namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the review.

You are correct that the advisory [2] does not directly reference the
upstream commit [1]. I will correct the commit message to clarify
that the patch is backported from the upstream commit addressing
the vulnerability described in the advisory.

I will also check the status of all three CVE fixes in master and
blacksail and submit the required upgrades/backports for those
branches.

[1] https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec9=
6121215bd
[2] https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-os-command-inj=
ection-via-lrz-pipe-mode

Regards,
Hetvi

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Monday, October 19, 2026 19:39
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-105841

Hello,

On Fri Oct 16, 2026 at 5:37 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359ae=
c96121215bd
> [2] https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-os-command-i=
njection-via-lrz-pipe-mode

Where does [2] reference [1]?
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch | 267 ++++++++++++++++++
>  meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
>  2 files changed, 268 insertions(+)
>  create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.=
patch
>
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch b=
/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
> new file mode 100644
> index 00000000000..268218fb8a6
> --- /dev/null
> +++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
> @@ -0,0 +1,267 @@
> +From 9eef71ce20fda2b345ef8431359aec96121215bd Mon Sep 17 00:00:00 2001
> +From: Uwe Ohse at akiar <uwe@ohse.de>
> +Date: Mon, 10 Aug 2026 17:55:28 +0200
> +Subject: [PATCH] remove topipe 'feature'
> +
> +CVE: CVE-2026-105841
> +Upstream-Status: Backport [https://github.com/UweOhse/lrzsz/commit/9eef7=
1ce20fda2b345ef8431359aec96121215bd]
> +
> +Backport Changes:
> +- Retained sys2() and exec2() and their declarations because 0.12.20
> +  still calls them in its separate, opt-in ZCOMMAND handling. Removing
> +  them as upstream does causes undefined references when linking lrz.
> +- Omitted NEWS because its 0.13.0 release-note hunk conflicts with the
> +  0.12.20 release history and is not needed for the security fix.
> +
> +(cherry picked from commit 9eef71ce20fda2b345ef8431359aec96121215bd)
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

That upstream commit is not in master nor blacksail as far as I know.
Can you send the proper upgrades/backports?

NB: I suspect the same goes to the rest of the series, so I'll wait for
your ping before reviewing it.

Thanks!
--
Yoann Congal
Smile ECS


--_000_PH7PR11MB859823D3EBE3DCFD9F617F1EAD652PH7PR11MB8598namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
Thanks for the review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
You are correct that the advisory [2] does not directly reference the</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
upstream commit [1]. I will correct the commit message to clarify</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
that the patch is backported from the upstream commit addressing</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
the vulnerability described in the advisory.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I will also check the status of all three CVE fixes in master and</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
blacksail and submit the required upgrades/backports for those</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
branches.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
[1] https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec9=
6121215bd</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
[2] https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-os-command-inj=
ection-via-lrz-pipe-mode</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hetvi</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedde=
d.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, October 19, 2026 19:39<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 1/3] lrzsz: fix CVE-2026-10584=
1 </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Hello,<br>
<br>
On Fri Oct 16, 2026 at 5:37 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [2],<br>
&gt; using the commit shown in [1].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b=
345ef8431359aec96121215bd" id=3D"OWAf08916ef-f217-c379-d2f6-098c7f07897d" c=
lass=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec96121=
215bd</a><br>
&gt; [2] <a href=3D"https://www.vulncheck.com/advisories/lrzsz-before-0.13.=
0-os-command-injection-via-lrz-pipe-mode" id=3D"OWAbd822b43-1428-9c47-805a-=
72b328da658b" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://www.vulncheck.com/advisories/lrzsz-before-0.13.0-os-command-injecti=
on-via-lrz-pipe-mode</a><br>
<br>
Where does [2] reference [1]?<br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch | 267 ++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 268 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026=
-105841.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patc=
h b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..268218fb8a6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch<br>
&gt; @@ -0,0 +1,267 @@<br>
&gt; +From 9eef71ce20fda2b345ef8431359aec96121215bd Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Uwe Ohse at akiar &lt;uwe@ohse.de&gt;<br>
&gt; +Date: Mon, 10 Aug 2026 17:55:28 +0200<br>
&gt; +Subject: [PATCH] remove topipe 'feature'<br>
&gt; +<br>
&gt; +CVE: CVE-2026-105841<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/UweOhse/lrzs=
z/commit/9eef71ce20fda2b345ef8431359aec96121215bd" id=3D"OWA0d2e59cd-216e-b=
144-230e-e133f22785b6" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">ht=
tps://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec9612121=
5bd</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Retained sys2() and exec2() and their declarations because 0.12.20<=
br>
&gt; +&nbsp; still calls them in its separate, opt-in ZCOMMAND handling. Re=
moving<br>
&gt; +&nbsp; them as upstream does causes undefined references when linking=
 lrz.<br>
&gt; +- Omitted NEWS because its 0.13.0 release-note hunk conflicts with th=
e<br>
&gt; +&nbsp; 0.12.20 release history and is not needed for the security fix=
.<br>
&gt; +<br>
&gt; +(cherry picked from commit 9eef71ce20fda2b345ef8431359aec96121215bd)<=
br>
&gt; +Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
<br>
That upstream commit is not in master nor blacksail as far as I know.<br>
Can you send the proper upgrades/backports?<br>
<br>
NB: I suspect the same goes to the rest of the series, so I'll wait for<br>
your ping before reviewing it.<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH7PR11MB859823D3EBE3DCFD9F617F1EAD652PH7PR11MB8598namp_--

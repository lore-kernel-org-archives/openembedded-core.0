Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36544.1795586068027131640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VLRiK2W9;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6753; q=dns/txt;
  s=iport01; t=1795586068; x=1796795668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=JAdNxqeEIb5eAOxLdEyD6DuXw+MdSeld2bEf4N5ez/4=;
  b=VLRiK2W9un//FtWE+2g4hWFzI2bost4rXdokA0ppyaBma0qOSJIXj/UY
   jQMg3XnsvoF7N+1tpUE5B8nkfRh99pmFBT2/tYiklpW7dePuLSdQDbLce
   Gvwz76QlSJISdsMoW920ita+zq0f7N35mD2sqXdVpR2s9QW4D3FlgizA/
   xw62SPMuraldlC1PnEIjB6/cynlJwrNpWBlNxdHh079G1Okfnyze2skGp
   pTizT620qBFNpCZDD/E/siZStVwE1Sq8ynFx1kHvBFr23DBXM0YAZp0rK
   3/RSzM9kCApYMVT4/2AjqV+pSKlbgBr3UC0xkrWTkq9Ph+GJ+Lfp80IEY
   g==;
X-CSE-ConnectionGUID: YS0Zsdq6RHGBnP4hXs4pFg==
X-CSE-MsgGUID: R6oOGHzdRlCV5o7UNqCvaA==
X-IPAS-Result: =?us-ascii?q?A0DCAwBydwZr/48QJK1agS6BK4E9MVOBCQKBERJJBIgfA?=
 =?us-ascii?q?4UriH2eKYF+DwEBAQ0CLgEVDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQEBAQMBERVSEAIBCBEEAQEBLicKH?=
 =?us-ascii?q?QgCBAENBQgagmGCHRZBAwECDq5VcwKKHXiBATOBAeA3BhWBOIVCgwQbAQEFJ?=
 =?us-ascii?q?klsgl6BIxgBhH4nGxuBcoFXgmo+gQWBXAQYgR0rhBSCMASCInoSG4I7CYwIA?=
 =?us-ascii?q?QGBSYhSUnIiAyYzLAFVExcLBwWBJRAzAyovLSNLBS0dcAwnEikXER5YGwYFE?=
 =?us-ascii?q?iAqQENbgRKBA12BKyhdAQIfRi0VgXUCglGBI10CAUlBDgdFUwklPgUSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxbDAsaBRpHCAILAgx0KBEQEx0cJC8FGSY8GwqBD?=
 =?us-ascii?q?CcdHhkOAikGFiELNG09NwYPGQMEgTUFkycHW4RVT4FEH4pfiGgujxKBfKF9C?=
 =?us-ascii?q?iiDeYp+gSaNPogyF4QEjRSZWguYfSONZ5VhIYUNAgQCBAUCEQEBBoFoPIFZc?=
 =?us-ascii?q?BU7gjMBATITQBkPlzfJJ3kCAToBAQcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:6cgrtRHfL6nQ2WGJ0TZr+p1GfhMY04WdBeZdwpMjj7QLdbys4NG4e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:rIftYal/uOtlqy++lFEBpaTo5gzYJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOCm2DOKyNN2LyL9BxbI+w9xsAv8XQy9RgTVNqrSk9F1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsf/b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbwjotRsDXgQz
 9w3AjY1MhCznL6u7r3uH4GAhux7RCXqFIobvnclyXTSCuwrBMidBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEUUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FYYOOIY3WGZoF9qqej
 liY+EPWIgMWDti092eCrU+Kn8TRlAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjZCRT9aY9tgv8gzLdA36
 mK0cxrSLWUHmJWeSGmW8fGfqjbaBMTfBTZqifMsJefd3+TenQ==
IronPort-HdrOrdr: A9a23:w4F246+th51DTtJe0Vtuk+HYdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBfpTnhAsW9qXO1z+8S3WBjB8bSYOCGghrmEGgM1/qZ/9SNIVybygcZ79
 YeT0EcMqy/MbEZt7eG3ODQKb9Jq7f3ktHMuQ6d9QYQcegAUdAY0+4NMHfhLqQAfng/OXNWLu
 v62uN34xCbVTA8aMO9CnMZX+7FieHqufvdCyIuNloM0iXLqSmnxoLbPnGjsys2Yndi0L0i+W
 /Kn0jD4Lm/s/a08xnY12XCxZVbktnsx7J4dY2xY84uRQnEu0KNXsBMSreCtDc6rKWE81Axiu
 TBpB8mIoBa927RVnvdm2qv5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksbus1m2q
 4j5RPai3MXN2KEoM3O3amOa/hYrDvznZPkq59Ls5Vra/pbVFaWl/1GwKoaKuZaIMuw0vFWLA
 AnNrCu2B8RSyLbU1np+k9y3derQnM/Wj2CQkQEp4ip9gI+pgEi86Pdr/ZvwkvpM/kGOsR5D+
 ioCNUbqJheCsARdq5zH+EHXI++DXHMWwvFNCaILU3gD7xvAQOGl3fb2sR82AiRQu1C8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBGGwRy7kxM1S74Vw/uSUfsumDQSTDFQ118ewqfQWBcPWH/
 61JZJNGvfmaW/jA5xA0QHyU4RbbXMeTMoWsNAmXE/mmLOHFqT68ujANPrDLrvkFjgpHmv5H3
 sYRTD2YN5N60i6M0WIySQ5m0mdDHAX0agAZ5QypdJjvbTlHrc8xjQotQ==
X-Talos-CUID: 9a23:JP6S62zqjTonQWfyf4QTBgUlIZgXaXHEkk3wDGW+MTppeKbJUXGfrfY=
X-Talos-MUID: 9a23:in3muAvQqgVhMGgxPc2nvm9lE+hI8aiUDGszzJJZhu+dHjJ5EmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:54:27 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id EDE1D18000258
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:54:25 +0000 (GMT)
X-CSE-ConnectionGUID: dbOhrqIQRS2nGVbTrKBvGQ==
X-CSE-MsgGUID: z6kIIvPJQ1G95xRBLrXgZQ==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208,217";a="68529366"
Received: from mail-eastusazon11012009.outbound.protection.outlook.com (HELO BL0PR03CU003.outbound.protection.outlook.com) ([52.101.53.9])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:54:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnoypnBoa7b6xXUv3HotKYfVbw/RIcG0vMAsag9CToGsTCL+jPoagXCSdeQWgc81ZRA0s4kWw/N1O36J4pSfwbAWUXHXsU2x4MV5msVMt/qmo+WBdzwpyg1X7H2n9tGm/8sL8XBLOjARCMTTUNKnGwJQYKr7CjrWIy0ORk5SAeDDi7JzQ68wEKj3pJp7rGx3vMSaLsoUuOzpYEghAxBFFPK/GKPIG02EnMdOVrFCZ4S/KoInfhxo7GyGlnw9aMZWzOqYZ8Zp60Oyqq3QhPeSIBMn2HN+ITmG1ZgO8d09p9Kf21Fl3aM8rCbFu4oxTHKKHWCZnt8Yh7tKYZ1i1cK84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAdNxqeEIb5eAOxLdEyD6DuXw+MdSeld2bEf4N5ez/4=;
 b=oGR8xqtPm+IJn6AUxPknk1URaRooAu20wTowytvRc6/fmBeOaX8JKhoKL/t0C63bnS2vHWwKNk9Wx/8hRbQvWxCYrL38ize/DjcygiCSXm7V4a0qySctvMoo8AXNQzpZPbLNAG3xp7j2DQ/ryQuIsUALXRmuTkozsQK+4hMVTRZM/mMTqlU1Vi9WNXg1q0o29yCSMIEznvRIjjpC/iGoCbvhrrFmFXg82o47XpbFv8RRRvy03kBeUuWaw03O+SPsLQohVgLfJ+byiAG0fUSguJu1b0vi0BfyiYM3Y3jajJ/yE6FskYaGAY6z3wXGgeWLAiVElQzndVpgzAgxsR/YfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 by DS6PR11MB458385.namprd11.prod.outlook.com (2603:10b6:8:499::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 05:54:23 +0000
Received: from PH0PR11MB5952.namprd11.prod.outlook.com
 ([fe80::baf6:8034:a18e:56e1]) by PH0PR11MB5952.namprd11.prod.outlook.com
 ([fe80::baf6:8034:a18e:56e1%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 05:54:23 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584
Thread-Topic: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584
Thread-Index: AQHdXSHLjg7gDsBQhU+IrpXDsy9xObcFOYMAgBvH+6OABPH7gIAR2kYAgAa486g=
Date: Wed, 25 Nov 2026 05:54:23 +0000
Message-ID: <PH0PR11MB59520D6D4347D955A82201BAAD432@PH0PR11MB5952.namprd11.prod.outlook.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
 <20261016035236.442896-2-hthakar@cisco.com>
 <DM91CIFZHG6C.1EYHKXIN5ULNT@smile.fr>
 <PH7PR11MB8598B4AAA920FDDFE1174602AD762@PH7PR11MB8598.namprd11.prod.outlook.com>
 <DMQR3DP72ES8.3KANJDXOTSO63@smile.fr> <DN0EZPT21YQ7.72UEI7OFXYMK@smile.fr>
In-Reply-To: <DN0EZPT21YQ7.72UEI7OFXYMK@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5952:EE_|DS6PR11MB458385:EE_
x-ms-office365-filtering-correlation-id: 790834da-8d5f-455f-271e-08df4ab88e3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|261009223027099003|13003099007|8096899003|261022105027099003|261026140227099003|261026121527099003|38070700021|261022113327099003|261022075727099003|261028144727099003|56012099006|4143699003|10067099003|11063799006;
x-microsoft-antispam-message-info: amOb5kbjTTOmyWY9bFyhrhcOAKlZYGy/xDP+9UPf3qKKbC7eA5qW2VKcBUpfM4/klJFHmtncnWzutWAK90GQAeMYD6PU0OEELnyE3RUq0H3ZYSDacwV2yOBEn/i3/qcUrTBZ6i6V6PJOl5vLQPZrhUYNIo6QDVXIznzjdOzNG2NgaoxKg7yUKcU8eltOrPQj8bbIqcgIsl/vXR5Sjsk65KNGRJtAUkyZENMK4Iy/LsJanXG9FOZa1/X9gZCqjN/if+IK6MS9PAvDo6GvGzVte08V3Z8GM1wmzM3uu/CRQx2gko4zaOepWuxARDvvBfWbAHmFWydv/2WXg/GT3TLvgSP2L2E7HvjH4nCi/H/tZuMnrtzi+XZZ6eL0qG/aMs4gsEUKsx95rtFh1gn9T8wdqIUgkuY+9dZLzbOxZHtcfVtKMQlR7F69nxmvgxH7v4Hcs1aTxy1Va+ZQioK8PnAnHKxVm7NFBBdoOYP9UknWIHraXNWsLUcGBh8qNuxaPENMPeHksBzh+JPwCQYrULtCZn0tqgd+8LtmuO1/ReX5/Gf7wm/Sdq7djWw3JzFJjS6+p/ALJ+u/jWwMpPT9MabNt+DJpNOtIcxB1FL0zBbKNWQIf55aBSRIGAw5emg9CMPkUJwaHBtJKZETdueCtao0BKZATMjhN6eHN034Az22PCJmZFbf33UrPZQNEebCIoQ8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(261009223027099003)(13003099007)(8096899003)(261022105027099003)(261026140227099003)(261026121527099003)(38070700021)(261022113327099003)(261022075727099003)(261028144727099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YCnmAuC8tEs18atnWvmO/prboKrMTPCR8FR+oLtnlC/ZavJCCNjEz6sm90?=
 =?iso-8859-1?Q?c50Hv0s6FtwpzRkzaSWgYYEH9byIoffg7M/sUCYZ3N3wRKhkp7hPGMxeMx?=
 =?iso-8859-1?Q?08gGnMuvYctV6s3J5Dr2rNkafNN3fmKQ6hORvvjf4xb4bjy1HoPhXs/ktq?=
 =?iso-8859-1?Q?RCNyl4IS7yjWjJn5A3G6UVRDLGjvDyfXERPxv75I33IMuyA7IE+JCO3FI/?=
 =?iso-8859-1?Q?J1vCofj1g8tryYAvZC9K6JeOlOBi6ktOBETYo82BBhpMyVJpUlfEVOy+MN?=
 =?iso-8859-1?Q?Fk+/b38xaxsq/bu8jqSv0iMn0Fbh7Ha59gS5tbt+nwDhBin+hl1mo82315?=
 =?iso-8859-1?Q?qL5wd1NXMkI/FwCKjngbdnBfrHgXxQja5LFPLychwA/Phnl8X4rsTfdZ58?=
 =?iso-8859-1?Q?Hh7JpX6iHFqfwsGvuXogPy8tai0wQOf20b6bGnsr24LX1fbVhYuuTPg+6L?=
 =?iso-8859-1?Q?aH5KNeNr/ftV55osOxLzZy6FwDHuY0Gnwv3rS+nEFneGk30CEw7EQEokTu?=
 =?iso-8859-1?Q?dLoQruRdJltnWuL0IxEVmHBFa5i6vhKPXvhy3lTB4HxZMbGo8WjVN4BYvR?=
 =?iso-8859-1?Q?enmcyufv/dgjOPtzbpRuaqCG3VpbAcJKKyDBv08jY0AOS4jtbFL736JRS5?=
 =?iso-8859-1?Q?et9EXXJbuZoq9yorZdSFuQZoOeMxrFxga3yyHll3YPH5wxIf3RH3vt0k2Q?=
 =?iso-8859-1?Q?aAqiSMHBBPYZbK3/v7yKxas4H0Bj/WgQIumIBeb123Ut9g+TUto8ZyE0O8?=
 =?iso-8859-1?Q?Y2dQ+ADowv+bbX3N7WruSfoJ+xXdS4xpY2y+TXDBGWgNXJw52iSm/Y3+vU?=
 =?iso-8859-1?Q?H3DF6Wo1g122wdEECC7dRcZspF4e1m259TWehgw91wkaO9VNDeZE0JrZWB?=
 =?iso-8859-1?Q?Qo0rivIR/nJUtLZIblUuB8/dLKGKLZjG8p2W8bWGourg4x/zX4kssvE2iK?=
 =?iso-8859-1?Q?4b0UsIqSrFmY2sKstC8seY5lM5T9/FK4A038NtUS0M/zwAF7FlLDOlAWv2?=
 =?iso-8859-1?Q?Na+nMcDjHlqk7H2M6mCxT6I0ctqubkpmeWJK1vFHRgOpIBL/vIaKub8jgs?=
 =?iso-8859-1?Q?ODRXNh+VeJXGCKP2aeK07/oid5EMN9MAwAZfdsGa0rSHH8idwKVmsQTLtJ?=
 =?iso-8859-1?Q?fDP727otkOOjn/FVIbCtTQtSxdkDeQRm8p56TieeafvW4lAcowHHz0GsS3?=
 =?iso-8859-1?Q?/sn8pkrZVdHYhN+IZp0k0NjX9JsStMCcrZmi0MCvZ/SlgvHwvtiXLUjHnz?=
 =?iso-8859-1?Q?Q4M/xG1T/nra1TExSlbtITi+SsxpsMb2LNoj0tK6W/I3TKBHAB9pq7TB1X?=
 =?iso-8859-1?Q?KwAbfwUIlsIFaL2PL3HEfSkatKX/OLEAdER2nfELLi5AVlCCLsXcoj/4Rf?=
 =?iso-8859-1?Q?REgLKrU/gkMAwYnC5PWvuvP6ZP0tizLZO8uEM3E9D3IjNiMkrXYapXLksZ?=
 =?iso-8859-1?Q?hWZRNee1Dv8nIzXXyb7p6rit7QIeyYsnxPhtsRGNiszmmXmH8ahL8iZjIR?=
 =?iso-8859-1?Q?Uu59FSDsjKeBGshU/H91g32lApj48vvaV46XWEZBNDVPkIuW/dU/S1QRIq?=
 =?iso-8859-1?Q?m+9orn6k+6gfoabk+J3PuXiyhlZm2vFI8FlGVi2zoKkPmZZQQVmLVNZJ6C?=
 =?iso-8859-1?Q?cD69uwORXGTip1jES/vBW+J9gvNyrc1KmbXrsOXk/fEcC+zmnKJn3Wq86z?=
 =?iso-8859-1?Q?Pkmgtys8mK3WdpRk9JuSHzUtrnuvm1ojKbtOJk21MIzcZCR52wKMe/9cun?=
 =?iso-8859-1?Q?zTU6TY8FSU0m3MaetHuSf1LJkEX4RWOmz157mqNOB9M5t2?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB59520D6D4347D955A82201BAAD432PH0PR11MB5952namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LtcJL5J1Uv79am8OSSxDvD2/SLIUVpgV7hrm11IjbRhGLofSnYzZhR15te7r/ctyt6DkdDxMA1wKP84gklBpmds5CeYx4Uw4bnRmlqq1XxL0E2GpaqBDCRx6vhzYR2Ke6IfyeAsgFjYv3CR3gnGLp7Xc26dmeb/k9OyT7Pxa8kecNgW/j6w12plUBIUpj8RrveXhmX4ay7XN1scIqSZUBkWnI01tybxD0q+i/Eyc+EvEyR+sgCxEpNrQrF5y81DlRTSQm3ZW9Zd4BIoMounUl3o+jwbiCuQ6xTOzG39jhsTJopbaPAPCz29FLF/g/VJ+YSP41JGpTe6vu8CJzonqVw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790834da-8d5f-455f-271e-08df4ab88e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 05:54:23.0146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZvlN2wRh5RDbhdSH6oGO+2yNVnTDjFsWmbuFgAnAHptykqAVVdzXB75R8+quD+duhwwslFLftA0Up9BuIlk3FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB458385
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251160

--_000_PH0PR11MB59520D6D4347D955A82201BAAD432PH0PR11MB5952namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
The corresponding backport series for blacksail has now been submitted upst=
ream [1].
As requested, I have also resubmitted the patch series for wrynose [2]. Cou=
ld you please review the updated series?
[1] https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D53833
[2] https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D53876
Regards,
Hetvi

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Saturday, November 21, 2026 04:38
To: Yoann Congal <yoann.congal@smile.fr>; Hetvi Thakar -X (hthakar - E INFO=
CHIPS PRIVATE LIMITED at Cisco) <hthakar@cisco.com>; openembedded-core@list=
s.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584

On Mon Nov 9, 2026 at 3:30 PM CET, Yoann Congal wrote:
> On Fri Nov 6, 2026 at 12:00 PM CET, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) wrote:
>> Hi Yoann,
>
> Hello,
>
>> I have submitted the corresponding OpenSSH backport patches for
>> blacksail upstream [1] .
>> Could you please review  the wrynose series when you have a chance?
>> [1] [blacksail] openssh: Upgrade 10.5p1 -> 10.6p1 -
>> Patchwork<https://patchwork.yoctoproject.org/project/oe-core/patch/20261=
105042209.1168511-1-hthakar@cisco.com/>
>
> I had to reject this blacksail patch. This mean that I can't
> review/accept this wrynose series until equivalent fixes are sent to
> blacksail by backports.

Hello,

I will now drop this series. Please send a new submission if the above
situation changes.

Regards,
--
Yoann Congal
Smile ECS


--_000_PH0PR11MB59520D6D4347D955A82201BAAD432PH0PR11MB5952namp_
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
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
The corresponding backport series for blacksail has now been submitted upst=
ream [1].</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
As requested, I have also resubmitted the patch series for wrynose [2]. Cou=
ld you please review the updated series?</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
[1] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?ser=
ies=3D53833" id=3D"OWA17865d27-837d-8b7e-6d1e-0df60a9d7551" class=3D"OWAAut=
oLink" data-rich-text-autolink=3D"">
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D53833</a>=
</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
[2] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?ser=
ies=3D53876" id=3D"OWA12ba71fb-9121-8d06-75b6-44f025b0e110" class=3D"OWAAut=
oLink" data-rich-text-autolink=3D"">
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D53876</a>=
</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Hetvi</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Saturday, November 21, 2026 04:38<br>
<b>To:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;; Hetvi Thakar -X (hth=
akar - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;hthakar@cisco.com&gt;; ope=
nembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembed=
ded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-1=
06584 </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Mon Nov 9, 2026 at 3:30 PM CET, Yoann Co=
ngal wrote:<br>
&gt; On Fri Nov 6, 2026 at 12:00 PM CET, Hetvi Thakar -X (hthakar - E INFOC=
HIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt;&gt; Hi Yoann,<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt;&gt; I have submitted the corresponding OpenSSH backport patches for<br=
>
&gt;&gt; blacksail upstream [1] .<br>
&gt;&gt; Could you please review&nbsp; the wrynose series when you have a c=
hance?<br>
&gt;&gt; [1] [blacksail] openssh: Upgrade 10.5p1 -&gt; 10.6p1 -<br>
&gt;&gt; Patchwork&lt;<a href=3D"https://patchwork.yoctoproject.org/project=
/oe-core/patch/20261105042209.1168511-1-hthakar@cisco.com/" id=3D"OWA28a22f=
d6-7d87-3133-c236-dd01b57faa9a" class=3D"OWAAutoLink" data-auth=3D"NotAppli=
cable">https://patchwork.yoctoproject.org/project/oe-core/patch/20261105042=
209.1168511-1-hthakar@cisco.com/</a>&gt;<br>
&gt;<br>
&gt; I had to reject this blacksail patch. This mean that I can't<br>
&gt; review/accept this wrynose series until equivalent fixes are sent to<b=
r>
&gt; blacksail by backports.<br>
<br>
Hello,<br>
<br>
I will now drop this series. Please send a new submission if the above<br>
situation changes.<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH0PR11MB59520D6D4347D955A82201BAAD432PH0PR11MB5952namp_--

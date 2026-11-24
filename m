Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14529.1795513822724268867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RISUHAKU;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=42053; q=dns/txt;
  s=iport01; t=1795513822; x=1796723422;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=M0CIgz7QnfUPTKT9nN7CTiJfFlfBhq/zYhtMq2OQ2sU=;
  b=RISUHAKUtBBHf2UbwzF2laWKuAPJjc2EWyw0LX25+EACN5UmRTY6Vw04
   5qvzZg+yMjQG7NVmOxf9E6g7LL10ZKMCukh2OloO4ndRWGcBylV1We5k/
   f+t5836hWnQuZh+EHI53u4dEHSp/+keBvE5+HKReMR8Fp48uQlqPmDjdo
   BbGFP6xhYsUlDHm4fTXJ5kwNqfXhKWGwRXw8vSFIJ7RIN895mL6EkFmO2
   QxYvmF2LClZV1vfB3eIbrgxOiu/Cg9k6fZn8MT7WZ7jktrYmwGchv0WpX
   lktmG8DFqJveamseUIIqV4wwDUYf8lRxKmFjzs6qDmSJRE9iGoZG3wuus
   Q==;
X-CSE-ConnectionGUID: ki6ckd84TzSUViZodcjqTw==
X-CSE-MsgGUID: ywYI001ORpeBJgsDZtfYqg==
X-IPAS-Result: =?us-ascii?q?A0BzAABHXAVr/5T/Ja1aHQEBAQEJARIBBQUBZYEXCAELA?=
 =?us-ascii?q?YE8MVOBCQKBERJJA4ggA4RMX4ZZgiEDgn6IaJJDFIFkBg8BAQENAi4BFQ0EA?=
 =?us-ascii?q?QGFBQKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGT?=
 =?us-ascii?q?w2QEgEBAQEDAREIawQCAQgRAwEBASEBDScKHQgCBAESCBqCYYIdFgcDNwMBA?=
 =?us-ascii?q?g6vUXMCih14gTSBAYNpAkPcDxQBgTgBhUGDHwEBK4E1gl2BIxgBO4RCJxsbg?=
 =?us-ascii?q?XKBV4IyOD6BBYEaQgQYgR0QGwUZg3aCMASCInoSG4E5HmQJjAwBAYFPiElSc?=
 =?us-ascii?q?iIDJjMsAVUTFwsHBYElEDMDKi8tI0sFLR1wDCcSKRcRHlgbBgUSICpAQ1uBE?=
 =?us-ascii?q?oEDXYErKF4CH0YtFYF2AoJRgSNdAgFJQQ4HRVMJJT4FEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMWwwLGgUaRwgCCwIMdCgREBMdHiQvBRomPhsKgQwnHx4bDgIfE?=
 =?us-ascii?q?AYWIQsbbT03Bg8ZAwSBNQWTKAdbgwgLBwEsThMBCiEES0ktCEcYEZMdj19Hg?=
 =?us-ascii?q?TWCIZ5rcQoog3mMJI0+ggGGMReEBI0UhwaSVAuYfSOCNosxhAqRK4VaAgQCB?=
 =?us-ascii?q?AUCEQEBBoFoPIFZcBWDIglKGQ+OKwIBFoNgKIRrySd5AgkDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiQAIF+AQE?=
IronPort-PHdr: A9a23:fuBWKx3JSJvQlfkjsmDPmlBlVkEcU/3cJAUZ7N8gk71RN//l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:rRCzH6+KGLHRdX7qUfUCDrUD2X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2saCjuPP/mKZWHxKN5/bYrnoRhX78fVx9c2S1FlrHtEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhIs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k1PNMT+eonXV1cz
 sEmKQIKYhuBnt6plefTpulE3qzPLeHxN48Z/3UlxjbDALN/GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP00n1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OW2boCIK4TTG625mG6Ju
 VPnpzygJSsCOfa9xiGpwG6it/bAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/AQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBMRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:OjyigqujzulwVIBgpPtHB6+r7skCf4Aji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwR5VoIUmxyXcH2/huAV7CZnirhILGFvAY0WKP+UyFJ8S6zJ8g6U
 4CSdkwNDSTNykBsS+S2mDReLhQoqjjzEnrv5ai854Hd3ANV0gU1XYANu/tKDwOeOApP+tfKL
 OsouB8i36Lf3MRYs6nBn8DcdTiirTw/q7OUFotPTJizBOBow+JxdfBfiSw71MzQjlPybAt/S
 z/lRDl5qKsive/yhXN/W7e5ZZblbLau5V+7cq35fQ9G3HJsEKFdY5hU7qNsHQeu+e08msnl9
 HKvlMJI9lzw2m5RBD0nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxri7VY6tt0U6t
 MJ44vZjesUMfrzplW42zH6bWAsqqNymwtlrQcntQ0bbWLZUs4JkWVQxjIMLH5KJlOK1GluKp
 gfMCib3ocWTXqqK1bEo2Jo3NugGl43HhuAXww+n/b96UkMoJi8pHFomfD2WRw7hcgAo5Uo3Z
 W2Do140L5JVcMYdqR7GaMIRta2EHXERVbWPHuVOkmPLtBNB5vhke+/3FwO3pDjRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo8ERgMyweJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H5NSNX4dWssIvctTYSPFnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGCP+Ic1Rh3rbLEMQQCKhLE8FVnaPia6YSpKqjdT74LJ9Q7Fxjg==
X-Talos-CUID: 9a23:LbdorWxUFqROvKvY8Iy0BgUXG54ucXGNkEvCGHKGCFRuRLaXUGOPrfY=
X-Talos-MUID: 9a23:UtIJ0QT15KFMHC+xRXT9mwBDbJ8xxJ62BWovno4qidWKBDV/bmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:50:21 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 630F2180002C3
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:50:21 +0000 (GMT)
X-CSE-ConnectionGUID: FfrmRFNyQlKvVuhZVii7EA==
X-CSE-MsgGUID: Bxr4/Tc6Svun2CMv7oE4Ng==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208,217";a="85729125"
Received: from mail-southcentralusazon11012038.outbound.protection.outlook.com (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.195.38])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:50:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqytcsxjGm7/VxUoI+WCD4TxiqfuuY6yzaZ3YH/7QWD8bmfvT4CKhfBv+1h2LEgfDq723tyBotzmKzZmYrv7W6g9D5P4HWWCSqrLMFyxrsZ+TKzJWw3PhhRK/ApIEnC+331V9TBPBe8w0jEwF6O3+xoJzEprHGp6xtfEXbV3XEY0PcJJCwDHBreagnIvnmZfXHVAMbH/SWwOOPV6FPICNJSLh0oZcsoTA6Bi05dq1g43zKqNm8YkzvDOVKP28dyrQ5lN9SMBwq+1518DHDuVGUtR/G6pqqT2WtfczrtwOO46B/ty8PhSzcTHltxcOyY/tipDrQmwDbGC9llIVQCGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0CIgz7QnfUPTKT9nN7CTiJfFlfBhq/zYhtMq2OQ2sU=;
 b=yga3b2jybpRv9l2Oro/e5DBOTywizTKQ8LNjSn6Jtd0lqbnNiRNAGnec/KjXaNW8o6anDbnFYsyZyoiNzYzUTzT59XcENbRIHw4d8jIXO6NfDxIE81TU2g08jzcsdbnkF7efj7ziWR0uiCVN2g0fXpqqy5v5E3JTciMPOtGlwRL5vIbMbtMaLddlRDpOV4HKcouMq83rEomi4CDd/s05l56HdJpA6PAbsXlfY7Y6t69Xyvg3GD5HWxU47PlXzlrVWb5jbUKFcRDWoSiZoR6hNDNgBpHUsKnZm/kO9trpvEfKOrGtoWCd6Gi48gBgAf2n2TgXBRS6bbx8qccIbH3nBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 09:50:17 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%7]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 09:50:17 +0000
From: "Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<yurade@cisco.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 1/1] glibc: Fix CVE-2026-121758
Thread-Topic: [OE-core][wrynose][PATCH 1/1] glibc: Fix CVE-2026-121758
Thread-Index: AQHde+RrMOk0R7aebE2+bgT30x4Mbbc8+aCf
Date: Tue, 24 Nov 2026 09:50:16 +0000
Message-ID: <PH8PR11MB81075370E0E13483AD923554DE442@PH8PR11MB8107.namprd11.prod.outlook.com>
References: <20261124062123.4168678-1-yurade@cisco.com>
 <20261124062123.4168678-2-yurade@cisco.com>
 <AS8PR10MB5073E76DEB08FCF83CDC3FBCFD442@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073E76DEB08FCF83CDC3FBCFD442@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8107:EE_|BN9PR11MB5228:EE_
x-ms-office365-filtering-correlation-id: 584c68ea-d0d2-41da-eac8-08df4a10583c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261026121527099003|261022113327099003|261022075727099003|261102123227099003|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|10067099003|5023799004|11063799006|4143699003|56012099006|260925021911599003|260925021311599003|260925022911599003|261009223027099003|22082099003|18002099003|13003099007|8096899003|3023799007;
x-microsoft-antispam-message-info: 5uYgcapDmywuhcIvOIXg/UpSJdSN2gywm2jV0p7GjpN1AJCx6ElBmAZZO8z9YtYQaQjdICHc0ZL88SbDAE6r2jHLN0/qKhyOEoDwDmg/kbO+r3Tu4WI+xYQt22Q+jea08r7ZzC0p5fSeXTIvgavArH93+azOp9ck8ojZuEAJXcakQy4m+SeFP+fsyzv+f2VNWo6wcicMROsgAjJ2pPqLtqEKL4lZIJILlVd3/UYx4vMSxTu7fBrAN60ZkwUOGTOLp6+/CASXBZCPNrqogKf+Vy8cMS1KlievihntwHfby15jj7T9KJW1awYFMb5qCz5Xf+booQ0YUpiKhdSdHJ4hEFjHYMLeWBzrjhdab8gpg9efE1eaiyWVLG3HbPDV8+LTgklBNnN44Q9vwImC1gkIpgc0ZSqp5MCN//NqVZn0n0FOPAEHXCv2z9FnXQ4SY9LR3IvHzArcB6g4NgsRpkMq9N+Vecn7LF+25j4V9MOlSJmv8Z1uHh2yEJfNTIFc1OVn193M0vjVcFWyWsBSXdJY75dQIdWKeUvldwC+rs+IicvobcSyqptilNNbADQUK9kj/IffvII+iVrYAwslpB/pYtRcTdpsxu1/zGCpG4H/y3ud6x6ItYEvTwR0dfmRiwwG0kP/+nlGxi02LVUvpERBg7d7plyMJEgEcKC1fsPu+Uw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261026121527099003)(261022113327099003)(261022075727099003)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(260925021911599003)(260925021311599003)(260925022911599003)(261009223027099003)(22082099003)(18002099003)(13003099007)(8096899003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ad/JZRBtq/mRLwaq6lOuJJJXt46yTpLe1E2EU1xzvgT0o4VO4GVrJGzwVz?=
 =?iso-8859-1?Q?OaMxzZHCVVo9P0Gaxtz+KMtySYtES7mN4OR5tptVIxVh9AzRymA6g169GF?=
 =?iso-8859-1?Q?gSgljxSNgW+s7occe2k32XwYKW4AhZeSiVNFh5MwKRF/i2zVLP4qVh38cy?=
 =?iso-8859-1?Q?fGN/snkRqpXTyplduZ4uXyZe1/w0ZZ65ocUh+fsL0iV2IfHj97XqhFBUa5?=
 =?iso-8859-1?Q?PRbw44FmL9j9QkkZoDgrxd7F9FxqGHXUBB6OFO3Mc5aE3IeZ9bRQKKU0to?=
 =?iso-8859-1?Q?XsNNxUA4hzDbp1a3Ry3nTqib2m3iCw0DHp1Dj2LgqxrLfmIXoFmmCOzW2Z?=
 =?iso-8859-1?Q?vbpiFBXZEfYYNGr5ADybWpwng7ViwvtF2ltbLVTq/P1YRnt6gwMKWD4Ejw?=
 =?iso-8859-1?Q?iBldzA2+V8IIH4A48ThrhD8zOxyRGhfeo0b9qYaEzTTXOxnHYzYTL/8Z+m?=
 =?iso-8859-1?Q?PHfMO2u6gGzbn+tj9OByvTvTXB8vnKAI/0C5xqj9tnUJGbnyozM9GN4ZPn?=
 =?iso-8859-1?Q?IgYnM6oc2A98L3rbg4KDHHIPbOWrYlBb/nrqcCbYufm9dzzdBORRbeQ5FT?=
 =?iso-8859-1?Q?q3Dlf/jSZjT2S4ECWryENFhGCZPKaRHtZEQozddkl7y5Lrvr1vgkNgCDLZ?=
 =?iso-8859-1?Q?0M9Kx5b3GWr5SmISHehK1DmKrQAVaOsZAC6UeGWdrolc2tZWUCeQWqkIJx?=
 =?iso-8859-1?Q?CYyqus91QmgBLcYOO8EC2B1p/nEVfxe8c4rXFfilvJLPYEADRummAInBX0?=
 =?iso-8859-1?Q?IvG1izdZfCawUQP1Nm+2ck/P4LH6uwDXacD/CRLCVMj3gS/jgarjRD0jtt?=
 =?iso-8859-1?Q?Vtf4l+HmwowFfjRqEYTZ2vOF2zo8oIo29RBJ0A7Q+WR7zAPeQSZuR35JGc?=
 =?iso-8859-1?Q?m85KGSGdbbzTjtXvO7muVI5nqJXoWLmb8dRo9ItDdzAOepItSvIHzEcloF?=
 =?iso-8859-1?Q?TJaFXokw5mMRt4LO2vsCArQfIWsyEjNY9ok62eKTnkYUjjVcWFVMXygtsY?=
 =?iso-8859-1?Q?cnwqtE5xHWMhm7/nGsC2i2aDVShpDWWcfpA+sVUzigeXiivvLZCh/GiyMW?=
 =?iso-8859-1?Q?IR4P16ha8s2Jxy3BxBBRZovbTmGXfHAPwzNZ6iA5pJ7Sef65punZP8ifPM?=
 =?iso-8859-1?Q?dlSxwkw4XZ61nzqR+TZ0PL4m6ySvyZ0dP0a2F4F3X8TzzGC/N2/2kYpmV/?=
 =?iso-8859-1?Q?eNdxCl6NE088UwCpWS/+W/UrknWkhnLbOzLUqDxfNaOs0EfOubzDOfEe0p?=
 =?iso-8859-1?Q?aSf+L9d9jdqCSnvQfUudws68BlJqim+jbhq6Ivnp+BOp68OZ3By9EkWcGk?=
 =?iso-8859-1?Q?1i1pnGNzva8rrxWbAjms5i/QGuFIV1i5FvSIV2+SxOiNSBfpM3xiUEAJ87?=
 =?iso-8859-1?Q?3W5xb82Fu+MBV7EvShCsGAdFvcqrYAcYdDIJJ6lqFZ+IfhcgAYnEp9Z5hc?=
 =?iso-8859-1?Q?LXpSP3n8uBpSbbGb+AqaZMpaX32jsxvD7SkJebjkZNOEKJUfcnQjLvZJQz?=
 =?iso-8859-1?Q?cQA9zcGPuxUVAB4nyMuE25rX+2YKH3vn5mD8PgnOlLgWC5U4btury2SlAi?=
 =?iso-8859-1?Q?JgWeGFKWelMs3cfzH7DZaAB0f/7+GAuyHFfRZ/SUUoUWmSWTwEN5OXBWxg?=
 =?iso-8859-1?Q?uRuthjZbT1B7ZdRbjCx/TVE4BY+BQA6QhcUdZyc6ZBoGBE9elPAuoLjoz3?=
 =?iso-8859-1?Q?VbVP/Shy/JaqT3LRwkpZiomfCotP0IqQToQu4l4x0ZxyCm+tyjoaG3RmUf?=
 =?iso-8859-1?Q?JV+c+o4ly8rjcWdCNWRyDAroKzaKCin68ktaJiKAHzbkMr1whVdZ8CeyLN?=
 =?iso-8859-1?Q?GjfNu9RxrQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH8PR11MB81075370E0E13483AD923554DE442PH8PR11MB8107namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UNge3MLliO+gy58VkbKgXCaqsPcayfhlRPYbpLg1YU2SDwztafOxtMafC7Ri3/SmzUMpCRdb5Y9T+ZmpSq7Y+mOhSD2kXz/7cGGIe5liZ384weXtGB4/euCQFnFeHnTvaUT9yy9RWudl9DTIiZfF76CTksg0aZcCFW2LQnHuBbZbyp/wksUcen0n0JmVjAK8YWNywOPXxcsG/1YCHB/9k5hyFv6YPKGvaNNRRFODXEwoGcmQbtnE3OTQDVTxb61ws6rkkr93of5YuyhQ7T7YDxJHzvz0+KPTHSSVT5RoHGkktTyab6fFn1cPH4suMffEezRqsAI94xC9DMaeBX6ZCg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584c68ea-d0d2-41da-eac8-08df4a10583c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 09:50:16.9419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37HFE5I6NOeiF89YjWhbnOwvWnHPg1D1Erh07iS1AkLWKY90WAqUmaBzxZmepVm37gJcIAfBSnYZ/Nq+v2/1ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-3.cisco.com [72.163.7.164];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250998

--_000_PH8PR11MB81075370E0E13483AD923554DE442PH8PR11MB8107namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Peter,
Thanks for the clarification. I will update the git hash to the commit incl=
uded in the glibc 2.43 release branch.
I'll submit the updated patch shortly.
Regards,
Yogita


________________________________
From: Marko, Peter <Peter.Marko@siemens.com>
Sent: Tuesday, November 24, 2026 12:51
To: Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco) <yurade=
@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@li=
sts.openembedded.org>
Subject: RE: [OE-core][wrynose][PATCH 1/1] glibc: Fix CVE-2026-121758

Please update git hash instead of backporting patch.
This commit is included in https://sourceware.org/git/?p=3Dglibc.git;a=3Dsh=
ortlog;h=3Drefs/heads/release/2.43/master

Peter

> -----Original Message-----
> From: Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco) via
> openembedded-core <yurade=3Dcisco.com@lists.openembedded.org>
> Sent: Tuesday, November 24, 2026 7:21 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][wrynose][PATCH 1/1] glibc: Fix CVE-2026-121758
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1]
> https://repo.or.cz/glibc.git/commit/170ee485fa89b95c3bb7d5606c9812c6c100c=
9b
> e
> [2] https://ubuntu.com/security/CVE-2026-121758
>
> Signed-off-by: Yogita Urade <yurade@cisco.com>
> ---
>  .../glibc/glibc/CVE-2026-121758.patch         | 281 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.43.bb         |   1 +
>  2 files changed, 282 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-121758.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-121758.patch b/meta/r=
ecipes-
> core/glibc/glibc/CVE-2026-121758.patch
> new file mode 100644
> index 0000000000..6a01b903c5
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2026-121758.patch
> @@ -0,0 +1,281 @@
> +From 170ee485fa89b95c3bb7d5606c9812c6c100c9be Mon Sep 17 00:00:00
> 2001
> +From: JT Wang <skyman-wftw@hotmail.com>
> +Date: Thu, 12 Nov 2026 05:08:42 +0000
> +Subject: [PATCH] iconv: ISO-2022-CN-EXT: fix SO handling without a
> designation (bug 34774)
> +
> +In the FROM loop, the SO (0x0e) handler advances inptr before
> +checking whether an SO designation had been announced.  Without a
> +designation the SO byte is an error, but by the time the error is
> +reported the byte has already been consumed.  Consequences:
> +
> +* With //IGNORE, STANDARD_FROM_LOOP_ERR_HANDLER skips one more
> byte
> +  after the already-consumed SO.  If the SO is the last input byte,
> +  inptr ends up one past inend; the loop condition inptr !=3D inend
> +  then no longer terminates the loop, and the converter keeps
> +  reading past the end of the input buffer and may convert
> +  out-of-bounds bytes into the output, in addition to the
> +  *inbytesleft wraparound described in the report.  This is also
> +  the path taken by iconv -c, which sets the ignore flag for the
> +  conversion.  If the SO is not the last byte, the byte following
> +  it is silently dropped.
> +* Without //IGNORE there is no out-of-bounds access, but iconv()
> +  returns EILSEQ with the SO already consumed, so *inbuf does not
> +  point at the offending byte and the reported remaining length is
> +  one byte short (or exhausted when the SO is the last byte).  A
> +  caller that skips the offending byte on EILSEQ and calls iconv()
> +  again then decrements an already-exhausted length.
> +
> +Move the increment after the error handler: the ignore path skips
> +the SO exactly once, and the non-ignore path leaves the input
> +pointer on the SO byte as POSIX expects.  Sequences with an
> +announced designation are unaffected.
> +
> +Also update the stale comment in that branch, and extend
> +tst-iconv-iso-2022-cn-ext with FROM-direction regressions covering
> +the error paths, a trailing SO with //IGNORE placed next to an
> +inaccessible page, and a designated-SO positive case.
> +
> +CVE: CVE-2026-121758
> +Upstream-Status: Backport
> [https://repo.or.cz/glibc.git/commit/170ee485fa89b95c3bb7d5606c9812c6c100=
c9
> be]
> +
> +Signed-off-by: JT Wang <skyman-wftw@hotmail.com>
> +Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
> +Signed-off-by: Yogita Urade <yurade@cisco.com>
> +---
> + iconvdata/iso-2022-cn-ext.c           |  10 +-
> + iconvdata/tst-iconv-iso-2022-cn-ext.c | 180 ++++++++++++++++++++++++++
> + 2 files changed, 184 insertions(+), 6 deletions(-)
> +
> +diff --git a/iconvdata/iso-2022-cn-ext.c b/iconvdata/iso-2022-cn-ext.c
> +index cce29b19..a8fe5522 100644
> +--- a/iconvdata/iso-2022-cn-ext.c
> ++++ b/iconvdata/iso-2022-cn-ext.c
> +@@ -248,12 +248,9 @@ enum
> +       }                                                                =
           \
> +     else if (ch =3D=3D SO)                                             =
               \
> +       {                                                                =
           \
> +-    /* Switch to use GB2312, GB12345, CNS 11643 plane 1, or ISO-IR-165,=
   \
> +-       depending on which S0 designation came last.  The only problem  =
   \
> +-       is what to do with faulty input files where no designator came. =
   \
> +-       XXX For now I'll default to use GB2312.  If this is not the     =
    \
> +-       best behavior (e.g., we should flag an error) let me know.  */  =
   \
> +-    ++inptr;                                                           =
   \
> ++    /* Switch to the character set designated last for SO.  A faulty   =
   \
> ++       input file may contain an SO byte without a prior SO            =
   \
> ++       designation; treat such a lone SO as an illegal sequence.  */   =
   \
> +      if ((ann & SO_ann) !=3D 0)                                        =
      \
> +        switch (ann & SO_ann)
> \
> +          {                                                             =
     \
> +@@ -276,6 +273,7 @@ enum
> +        {                                                               =
     \
> +          STANDARD_FROM_LOOP_ERR_HANDLER (1);
>              \
> +        }                                                               =
     \
> ++    ++inptr;                                                           =
   \
> +      continue;                                                         =
    \
> +       }                                                                =
           \
> +     else if (ch =3D=3D SI)                                             =
               \
> +diff --git a/iconvdata/tst-iconv-iso-2022-cn-ext.c b/iconvdata/tst-iconv=
-iso-2022-
> cn-ext.c
> +index 96a8765f..ff5f22c7 100644
> +--- a/iconvdata/tst-iconv-iso-2022-cn-ext.c
> ++++ b/iconvdata/tst-iconv-iso-2022-cn-ext.c
> +@@ -25,6 +25,7 @@
> +
> + #include <support/xunistd.h>
> + #include <support/check.h>
> ++#include <support/next_to_fault.h>
> + #include <support/support.h>
> +
> + /* The test sets up a two memory page buffer with the second page marke=
d
> +@@ -37,6 +38,177 @@
> +    character sets and may run out of buffer space while doing the
> +    operation.  */
> +
> ++/* FROM-direction regression tests for bug 34774: a lone SO (0x0e)
> ++   without any announced SO designation.  The error paths must leave
> ++   the input pointer on the offending SO byte, and //IGNORE must skip
> ++   it exactly once.  */
> ++
> ++static void
> ++test_lone_so_plain (void)
> ++{
> ++  iconv_t cd =3D iconv_open ("UTF-8", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 0x0e };
> ++  char out[8];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  TEST_VERIFY (ip =3D=3D in);
> ++  TEST_COMPARE (il, (size_t) 1);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_so_after_ascii (void)
> ++{
> ++  iconv_t cd =3D iconv_open ("UTF-8", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 'A', 0x0e, 'B' };
> ++  char out[8];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  TEST_VERIFY (ip =3D=3D in + 1);
> ++  TEST_COMPARE (il, (size_t) 2);
> ++  TEST_VERIFY (op =3D=3D out + 1);
> ++  TEST_COMPARE_BLOB (out, op - out, "A", 1);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_lone_so_ignore (void)
> ++{
> ++  iconv_t cd =3D iconv_open ("UTF-8//IGNORE", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 0x0e, 'A', 'B' };
> ++  char out[8];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  /* With //IGNORE the offending SO must be skipped exactly once and th=
e
> ++     following ASCII must be converted.  Note that glibc still reports
> ++     EILSEQ here: the ignore arm of
> STANDARD_FROM_LOOP_ERR_HANDLER does
> ++     not reset result, which stays __GCONV_ILLEGAL_INPUT, and the
> ++     iconv() wrapper maps that status to -1 plus EILSEQ
> ++     unconditionally (iconv/iconv.c).  */
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  TEST_VERIFY (ip =3D=3D in + 3);
> ++  TEST_COMPARE (il, (size_t) 0);
> ++  TEST_COMPARE_BLOB (out, op - out, "AB", 2);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_caller_skip_no_underflow (void)
> ++{
> ++  /* A caller that skips the offending byte on EILSEQ and calls
> ++     iconv() again.  With the fix, the first call reports the SO as
> ++     unconsumed input, so the skip drops the SO itself and the rest of
> ++     the input still converts.  */
> ++  iconv_t cd =3D iconv_open ("UTF-8", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 0x0e, 'A' };
> ++  char out[8];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  /* The SO is the offending byte and must still be unconsumed; do not
> ++     run the caller-side skip unless this precondition holds, or the
> ++     test itself would advance past the end of the input.  */
> ++  TEST_VERIFY_EXIT (ip =3D=3D in);
> ++  TEST_VERIFY_EXIT (il =3D=3D 2);
> ++  ++ip;
> ++  --il;
> ++  op =3D out;
> ++  ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) 0);
> ++  TEST_COMPARE (il, (size_t) 0);
> ++  TEST_COMPARE ((size_t) (op - out), (size_t) 1);
> ++  TEST_COMPARE_BLOB (out, op - out, "A", 1);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_lone_so_tail_caller_skip (void)
> ++{
> ++  /* A lone SO at the end of the input.  Before the fix the first call
> ++     consumed the SO and left the remaining length at 0, so a caller
> ++     skipping the offending byte decremented that length to
> ++     (size_t) -1.  */
> ++  iconv_t cd =3D iconv_open ("UTF-8", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 'A', 0x0e };
> ++  char out[8];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  TEST_VERIFY_EXIT (ip =3D=3D in + 1);
> ++  TEST_VERIFY_EXIT (il =3D=3D 1);
> ++  ++ip;
> ++  --il;
> ++  op =3D out;
> ++  ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) 0);
> ++  TEST_COMPARE (il, (size_t) 0);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_designated_so (void)
> ++{
> ++  /* Positive case: with an announced designation the SO switches to
> ++     the designated set, consumes exactly one byte, and the following
> ++     7-bit GB2312 pair converts.  ESC $ ) A designates GB2312;
> ++     0x52 0x3b is the 7-bit form of the GB2312 code for U+4E00.  */
> ++  iconv_t cd =3D iconv_open ("UTF-8", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 0x1b, '$', ')', 'A', 0x0e, 0x52, 0x3b, 0x0f, 'Z' };
> ++  char out[16];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) 0);
> ++  TEST_COMPARE (il, (size_t) 0);
> ++  TEST_COMPARE ((size_t) (op - out), (size_t) 4);
> ++  TEST_COMPARE_BLOB (out, 4, "\xe4\xb8\x80Z", 4);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_trailing_so_ignore (void)
> ++{
> ++  /* The shape from bug 34774: a lone SO as the last input byte with
> ++     //IGNORE.  Place the input right before an inaccessible page so
> ++     that a read past the end faults.  */
> ++  struct support_next_to_fault ntf =3D support_next_to_fault_allocate (=
2);
> ++  ntf.buffer[0] =3D 'A';
> ++  ntf.buffer[1] =3D 0x0e;
> ++  iconv_t cd =3D iconv_open ("UTF-8//IGNORE", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char out[8];
> ++  char *ip =3D ntf.buffer, *op =3D out;
> ++  size_t il =3D 2, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  TEST_VERIFY (ip =3D=3D ntf.buffer + 2);
> ++  TEST_COMPARE (il, (size_t) 0);
> ++  TEST_COMPARE_BLOB (out, op - out, "A", 1);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++  support_next_to_fault_free (&ntf);
> ++}
> ++
> + static int
> + do_test (void)
> + {
> +@@ -122,6 +294,14 @@ do_test (void)
> +
> +   xmunmap (ntf, ntfsize);
> +
> ++  test_trailing_so_ignore ();
> ++  test_lone_so_plain ();
> ++  test_so_after_ascii ();
> ++  test_lone_so_ignore ();
> ++  test_caller_skip_no_underflow ();
> ++  test_lone_so_tail_caller_skip ();
> ++  test_designated_so ();
> ++
> +   return 0;
> + }
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-
> core/glibc/glibc_2.43.bb
> index 5d2344389f..09e4e0b837 100644
> --- a/meta/recipes-core/glibc/glibc_2.43.bb
> +++ b/meta/recipes-core/glibc/glibc_2.43.bb
> @@ -61,6 +61,7 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>             file://0020-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
>             file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selft=
est.patch \
>             file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS=
.patch \
> +           file://CVE-2026-121758.patch \
>  "
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
>
> --
> 2.53.0


--_000_PH8PR11MB81075370E0E13483AD923554DE442PH8PR11MB8107namp_
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
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Hi Peter,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thanks for the clarification. I will update the git hash to the commit incl=
uded in the glibc 2.43 release branch.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I'll submit the updated patch shortly.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Regards,<br>
Yogita</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Marko, Peter &lt;Peter.Marko@siemens.com&gt;<br>
<b>Sent:</b> Tuesday, November 24, 2026 12:51<br>
<b>To:</b> Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco) =
&lt;yurade@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;open=
embedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> RE: [OE-core][wrynose][PATCH 1/1] glibc: Fix CVE-2026-12175=
8 </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Please update git hash instead of backporti=
ng patch.<br>
This commit is included in <a href=3D"https://sourceware.org/git/?p=3Dglibc=
.git;a=3Dshortlog;h=3Drefs/heads/release/2.43/master" id=3D"OWAdf217642-163=
e-809a-e554-ba8063f9b663" class=3D"OWAAutoLink" data-auth=3D"NotApplicable"=
>
https://sourceware.org/git/?p=3Dglibc.git;a=3Dshortlog;h=3Drefs/heads/relea=
se/2.43/master</a><br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco) =
via<br>
&gt; openembedded-core &lt;yurade=3Dcisco.com@lists.openembedded.org&gt;<br=
>
&gt; Sent: Tuesday, November 24, 2026 7:21 AM<br>
&gt; To: openembedded-core@lists.openembedded.org<br>
&gt; Subject: [OE-core][wrynose][PATCH 1/1] glibc: Fix CVE-2026-121758<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [2],<br>
&gt; using the commit shown in [1].<br>
&gt;<br>
&gt; [1]<br>
&gt; <a href=3D"https://repo.or.cz/glibc.git/commit/170ee485fa89b95c3bb7d56=
06c9812c6c100c9b" id=3D"OWA8fb0785e-3826-742b-ac1b-4a32144bba09" class=3D"O=
WAAutoLink" data-auth=3D"NotApplicable">
https://repo.or.cz/glibc.git/commit/170ee485fa89b95c3bb7d5606c9812c6c100c9b=
</a><br>
&gt; e<br>
&gt; [2] <a href=3D"https://ubuntu.com/security/CVE-2026-121758" id=3D"OWA6=
2819fbf-0992-d001-0697-d21d8fd61ccb" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
https://ubuntu.com/security/CVE-2026-121758</a><br>
&gt;<br>
&gt; Signed-off-by: Yogita Urade &lt;yurade@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../glibc/glibc/CVE-2026-121758.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 281 ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-core/glibc/glibc_2.43.bb&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 282 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-121758=
.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-121758.patch b/met=
a/recipes-<br>
&gt; core/glibc/glibc/CVE-2026-121758.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6a01b903c5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glibc/glibc/CVE-2026-121758.patch<br>
&gt; @@ -0,0 +1,281 @@<br>
&gt; +From 170ee485fa89b95c3bb7d5606c9812c6c100c9be Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: JT Wang &lt;skyman-wftw@hotmail.com&gt;<br>
&gt; +Date: Thu, 12 Nov 2026 05:08:42 +0000<br>
&gt; +Subject: [PATCH] iconv: ISO-2022-CN-EXT: fix SO handling without a<br=
>
&gt; designation (bug 34774)<br>
&gt; +<br>
&gt; +In the FROM loop, the SO (0x0e) handler advances inptr before<br>
&gt; +checking whether an SO designation had been announced.&nbsp; Without =
a<br>
&gt; +designation the SO byte is an error, but by the time the error is<br>
&gt; +reported the byte has already been consumed.&nbsp; Consequences:<br>
&gt; +<br>
&gt; +* With //IGNORE, STANDARD_FROM_LOOP_ERR_HANDLER skips one more<br>
&gt; byte<br>
&gt; +&nbsp; after the already-consumed SO.&nbsp; If the SO is the last inp=
ut byte,<br>
&gt; +&nbsp; inptr ends up one past inend; the loop condition inptr !=3D in=
end<br>
&gt; +&nbsp; then no longer terminates the loop, and the converter keeps<br=
>
&gt; +&nbsp; reading past the end of the input buffer and may convert<br>
&gt; +&nbsp; out-of-bounds bytes into the output, in addition to the<br>
&gt; +&nbsp; *inbytesleft wraparound described in the report.&nbsp; This is=
 also<br>
&gt; +&nbsp; the path taken by iconv -c, which sets the ignore flag for the=
<br>
&gt; +&nbsp; conversion.&nbsp; If the SO is not the last byte, the byte fol=
lowing<br>
&gt; +&nbsp; it is silently dropped.<br>
&gt; +* Without //IGNORE there is no out-of-bounds access, but iconv()<br>
&gt; +&nbsp; returns EILSEQ with the SO already consumed, so *inbuf does no=
t<br>
&gt; +&nbsp; point at the offending byte and the reported remaining length =
is<br>
&gt; +&nbsp; one byte short (or exhausted when the SO is the last byte).&nb=
sp; A<br>
&gt; +&nbsp; caller that skips the offending byte on EILSEQ and calls iconv=
()<br>
&gt; +&nbsp; again then decrements an already-exhausted length.<br>
&gt; +<br>
&gt; +Move the increment after the error handler: the ignore path skips<br>
&gt; +the SO exactly once, and the non-ignore path leaves the input<br>
&gt; +pointer on the SO byte as POSIX expects.&nbsp; Sequences with an<br>
&gt; +announced designation are unaffected.<br>
&gt; +<br>
&gt; +Also update the stale comment in that branch, and extend<br>
&gt; +tst-iconv-iso-2022-cn-ext with FROM-direction regressions covering<br=
>
&gt; +the error paths, a trailing SO with //IGNORE placed next to an<br>
&gt; +inaccessible page, and a designated-SO positive case.<br>
&gt; +<br>
&gt; +CVE: CVE-2026-121758<br>
&gt; +Upstream-Status: Backport<br>
&gt; [https://repo.or.cz/glibc.git/commit/170ee485fa89b95c3bb7d5606c9812c6c=
100c9<br>
&gt; be]<br>
&gt; +<br>
&gt; +Signed-off-by: JT Wang &lt;skyman-wftw@hotmail.com&gt;<br>
&gt; +Reviewed-by: Adhemerval Zanella&nbsp; &lt;adhemerval.zanella@linaro.o=
rg&gt;<br>
&gt; +Signed-off-by: Yogita Urade &lt;yurade@cisco.com&gt;<br>
&gt; +---<br>
&gt; + iconvdata/iso-2022-cn-ext.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; |&nbsp; 10 +-<br>
&gt; + iconvdata/tst-iconv-iso-2022-cn-ext.c | 180 ++++++++++++++++++++++++=
++<br>
&gt; + 2 files changed, 184 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/iconvdata/iso-2022-cn-ext.c b/iconvdata/iso-2022-cn-ext.=
c<br>
&gt; +index cce29b19..a8fe5522 100644<br>
&gt; +--- a/iconvdata/iso-2022-cn-ext.c<br>
&gt; ++++ b/iconvdata/iso-2022-cn-ext.c<br>
&gt; +@@ -248,12 +248,9 @@ enum<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else if (ch =3D=3D SO)&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp; /* Switch to use GB2312, GB12345, CNS 11643 plane=
 1, or ISO-IR-165,&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; depending on which S0 designati=
on came last.&nbsp; The only problem&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is what to do with faulty input=
 files where no designator came.&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XXX For now I'll default to use=
 GB2312.&nbsp; If this is not the&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; best behavior (e.g., we should =
flag an error) let me know.&nbsp; */&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp; ++inptr;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* Switch to the character set designated last fo=
r SO.&nbsp; A faulty&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; input file may contain an SO by=
te without a prior SO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; designation; treat such a lone =
SO as an illegal sequence.&nbsp; */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((ann &amp; SO_ann) !=3D 0)&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (ann &amp; SO_ann)<=
br>
&gt; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; +@@ -276,6 +273,7 @@ enum<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STANDARD_FROM_=
LOOP_ERR_HANDLER (1);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; ++&nbsp;&nbsp;&nbsp; ++inptr;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else if (ch =3D=3D SI)&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +diff --git a/iconvdata/tst-iconv-iso-2022-cn-ext.c b/iconvdata/tst-ic=
onv-iso-2022-<br>
&gt; cn-ext.c<br>
&gt; +index 96a8765f..ff5f22c7 100644<br>
&gt; +--- a/iconvdata/tst-iconv-iso-2022-cn-ext.c<br>
&gt; ++++ b/iconvdata/tst-iconv-iso-2022-cn-ext.c<br>
&gt; +@@ -25,6 +25,7 @@<br>
&gt; +<br>
&gt; + #include &lt;support/xunistd.h&gt;<br>
&gt; + #include &lt;support/check.h&gt;<br>
&gt; ++#include &lt;support/next_to_fault.h&gt;<br>
&gt; + #include &lt;support/support.h&gt;<br>
&gt; +<br>
&gt; + /* The test sets up a two memory page buffer with the second page ma=
rked<br>
&gt; +@@ -37,6 +38,177 @@<br>
&gt; +&nbsp;&nbsp;&nbsp; character sets and may run out of buffer space whi=
le doing the<br>
&gt; +&nbsp;&nbsp;&nbsp; operation.&nbsp; */<br>
&gt; +<br>
&gt; ++/* FROM-direction regression tests for bug 34774: a lone SO (0x0e)<b=
r>
&gt; ++&nbsp;&nbsp; without any announced SO designation.&nbsp; The error p=
aths must leave<br>
&gt; ++&nbsp;&nbsp; the input pointer on the offending SO byte, and //IGNOR=
E must skip<br>
&gt; ++&nbsp;&nbsp; it exactly once.&nbsp; */<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_lone_so_plain (void)<br>
&gt; ++{<br>
&gt; ++&nbsp; iconv_t cd =3D iconv_open (&quot;UTF-8&quot;, &quot;ISO-2022-=
CN-EXT&quot;);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);<br>
&gt; ++&nbsp; char in[] =3D { 0x0e };<br>
&gt; ++&nbsp; char out[8];<br>
&gt; ++&nbsp; char *ip =3D in, *op =3D out;<br>
&gt; ++&nbsp; size_t il =3D sizeof in, ol =3D sizeof out;<br>
&gt; ++&nbsp; errno =3D 0;<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (cd, &amp;ip, &amp;il, &amp;op, &amp;ol),=
 (size_t) -1);<br>
&gt; ++&nbsp; TEST_COMPARE (errno, EILSEQ);<br>
&gt; ++&nbsp; TEST_VERIFY (ip =3D=3D in);<br>
&gt; ++&nbsp; TEST_COMPARE (il, (size_t) 1);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv_close (cd), 0);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_so_after_ascii (void)<br>
&gt; ++{<br>
&gt; ++&nbsp; iconv_t cd =3D iconv_open (&quot;UTF-8&quot;, &quot;ISO-2022-=
CN-EXT&quot;);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);<br>
&gt; ++&nbsp; char in[] =3D { 'A', 0x0e, 'B' };<br>
&gt; ++&nbsp; char out[8];<br>
&gt; ++&nbsp; char *ip =3D in, *op =3D out;<br>
&gt; ++&nbsp; size_t il =3D sizeof in, ol =3D sizeof out;<br>
&gt; ++&nbsp; errno =3D 0;<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (cd, &amp;ip, &amp;il, &amp;op, &amp;ol),=
 (size_t) -1);<br>
&gt; ++&nbsp; TEST_COMPARE (errno, EILSEQ);<br>
&gt; ++&nbsp; TEST_VERIFY (ip =3D=3D in + 1);<br>
&gt; ++&nbsp; TEST_COMPARE (il, (size_t) 2);<br>
&gt; ++&nbsp; TEST_VERIFY (op =3D=3D out + 1);<br>
&gt; ++&nbsp; TEST_COMPARE_BLOB (out, op - out, &quot;A&quot;, 1);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv_close (cd), 0);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_lone_so_ignore (void)<br>
&gt; ++{<br>
&gt; ++&nbsp; iconv_t cd =3D iconv_open (&quot;UTF-8//IGNORE&quot;, &quot;I=
SO-2022-CN-EXT&quot;);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);<br>
&gt; ++&nbsp; char in[] =3D { 0x0e, 'A', 'B' };<br>
&gt; ++&nbsp; char out[8];<br>
&gt; ++&nbsp; char *ip =3D in, *op =3D out;<br>
&gt; ++&nbsp; size_t il =3D sizeof in, ol =3D sizeof out;<br>
&gt; ++&nbsp; errno =3D 0;<br>
&gt; ++&nbsp; /* With //IGNORE the offending SO must be skipped exactly onc=
e and the<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; following ASCII must be converted.&nbsp; No=
te that glibc still reports<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; EILSEQ here: the ignore arm of<br>
&gt; STANDARD_FROM_LOOP_ERR_HANDLER does<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; not reset result, which stays __GCONV_ILLEG=
AL_INPUT, and the<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; iconv() wrapper maps that status to -1 plus=
 EILSEQ<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; unconditionally (iconv/iconv.c).&nbsp; */<b=
r>
&gt; ++&nbsp; TEST_COMPARE (iconv (cd, &amp;ip, &amp;il, &amp;op, &amp;ol),=
 (size_t) -1);<br>
&gt; ++&nbsp; TEST_COMPARE (errno, EILSEQ);<br>
&gt; ++&nbsp; TEST_VERIFY (ip =3D=3D in + 3);<br>
&gt; ++&nbsp; TEST_COMPARE (il, (size_t) 0);<br>
&gt; ++&nbsp; TEST_COMPARE_BLOB (out, op - out, &quot;AB&quot;, 2);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv_close (cd), 0);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_caller_skip_no_underflow (void)<br>
&gt; ++{<br>
&gt; ++&nbsp; /* A caller that skips the offending byte on EILSEQ and calls=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; iconv() again.&nbsp; With the fix, the firs=
t call reports the SO as<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; unconsumed input, so the skip drops the SO =
itself and the rest of<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; the input still converts.&nbsp; */<br>
&gt; ++&nbsp; iconv_t cd =3D iconv_open (&quot;UTF-8&quot;, &quot;ISO-2022-=
CN-EXT&quot;);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);<br>
&gt; ++&nbsp; char in[] =3D { 0x0e, 'A' };<br>
&gt; ++&nbsp; char out[8];<br>
&gt; ++&nbsp; char *ip =3D in, *op =3D out;<br>
&gt; ++&nbsp; size_t il =3D sizeof in, ol =3D sizeof out;<br>
&gt; ++&nbsp; errno =3D 0;<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (cd, &amp;ip, &amp;il, &amp;op, &amp;ol),=
 (size_t) -1);<br>
&gt; ++&nbsp; TEST_COMPARE (errno, EILSEQ);<br>
&gt; ++&nbsp; /* The SO is the offending byte and must still be unconsumed;=
 do not<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; run the caller-side skip unless this precon=
dition holds, or the<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; test itself would advance past the end of t=
he input.&nbsp; */<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (ip =3D=3D in);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (il =3D=3D 2);<br>
&gt; ++&nbsp; ++ip;<br>
&gt; ++&nbsp; --il;<br>
&gt; ++&nbsp; op =3D out;<br>
&gt; ++&nbsp; ol =3D sizeof out;<br>
&gt; ++&nbsp; errno =3D 0;<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (cd, &amp;ip, &amp;il, &amp;op, &amp;ol),=
 (size_t) 0);<br>
&gt; ++&nbsp; TEST_COMPARE (il, (size_t) 0);<br>
&gt; ++&nbsp; TEST_COMPARE ((size_t) (op - out), (size_t) 1);<br>
&gt; ++&nbsp; TEST_COMPARE_BLOB (out, op - out, &quot;A&quot;, 1);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv_close (cd), 0);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_lone_so_tail_caller_skip (void)<br>
&gt; ++{<br>
&gt; ++&nbsp; /* A lone SO at the end of the input.&nbsp; Before the fix th=
e first call<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; consumed the SO and left the remaining leng=
th at 0, so a caller<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; skipping the offending byte decremented tha=
t length to<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; (size_t) -1.&nbsp; */<br>
&gt; ++&nbsp; iconv_t cd =3D iconv_open (&quot;UTF-8&quot;, &quot;ISO-2022-=
CN-EXT&quot;);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);<br>
&gt; ++&nbsp; char in[] =3D { 'A', 0x0e };<br>
&gt; ++&nbsp; char out[8];<br>
&gt; ++&nbsp; char *ip =3D in, *op =3D out;<br>
&gt; ++&nbsp; size_t il =3D sizeof in, ol =3D sizeof out;<br>
&gt; ++&nbsp; errno =3D 0;<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (cd, &amp;ip, &amp;il, &amp;op, &amp;ol),=
 (size_t) -1);<br>
&gt; ++&nbsp; TEST_COMPARE (errno, EILSEQ);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (ip =3D=3D in + 1);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (il =3D=3D 1);<br>
&gt; ++&nbsp; ++ip;<br>
&gt; ++&nbsp; --il;<br>
&gt; ++&nbsp; op =3D out;<br>
&gt; ++&nbsp; ol =3D sizeof out;<br>
&gt; ++&nbsp; errno =3D 0;<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (cd, &amp;ip, &amp;il, &amp;op, &amp;ol),=
 (size_t) 0);<br>
&gt; ++&nbsp; TEST_COMPARE (il, (size_t) 0);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv_close (cd), 0);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_designated_so (void)<br>
&gt; ++{<br>
&gt; ++&nbsp; /* Positive case: with an announced designation the SO switch=
es to<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; the designated set, consumes exactly one by=
te, and the following<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; 7-bit GB2312 pair converts.&nbsp; ESC $ ) A=
 designates GB2312;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; 0x52 0x3b is the 7-bit form of the GB2312 c=
ode for U+4E00.&nbsp; */<br>
&gt; ++&nbsp; iconv_t cd =3D iconv_open (&quot;UTF-8&quot;, &quot;ISO-2022-=
CN-EXT&quot;);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);<br>
&gt; ++&nbsp; char in[] =3D { 0x1b, '$', ')', 'A', 0x0e, 0x52, 0x3b, 0x0f, =
'Z' };<br>
&gt; ++&nbsp; char out[16];<br>
&gt; ++&nbsp; char *ip =3D in, *op =3D out;<br>
&gt; ++&nbsp; size_t il =3D sizeof in, ol =3D sizeof out;<br>
&gt; ++&nbsp; errno =3D 0;<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (cd, &amp;ip, &amp;il, &amp;op, &amp;ol),=
 (size_t) 0);<br>
&gt; ++&nbsp; TEST_COMPARE (il, (size_t) 0);<br>
&gt; ++&nbsp; TEST_COMPARE ((size_t) (op - out), (size_t) 4);<br>
&gt; ++&nbsp; TEST_COMPARE_BLOB (out, 4, &quot;\xe4\xb8\x80Z&quot;, 4);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv_close (cd), 0);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void<br>
&gt; ++test_trailing_so_ignore (void)<br>
&gt; ++{<br>
&gt; ++&nbsp; /* The shape from bug 34774: a lone SO as the last input byte=
 with<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; //IGNORE.&nbsp; Place the input right befor=
e an inaccessible page so<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; that a read past the end faults.&nbsp; */<b=
r>
&gt; ++&nbsp; struct support_next_to_fault ntf =3D support_next_to_fault_al=
locate (2);<br>
&gt; ++&nbsp; ntf.buffer[0] =3D 'A';<br>
&gt; ++&nbsp; ntf.buffer[1] =3D 0x0e;<br>
&gt; ++&nbsp; iconv_t cd =3D iconv_open (&quot;UTF-8//IGNORE&quot;, &quot;I=
SO-2022-CN-EXT&quot;);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);<br>
&gt; ++&nbsp; char out[8];<br>
&gt; ++&nbsp; char *ip =3D ntf.buffer, *op =3D out;<br>
&gt; ++&nbsp; size_t il =3D 2, ol =3D sizeof out;<br>
&gt; ++&nbsp; errno =3D 0;<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (cd, &amp;ip, &amp;il, &amp;op, &amp;ol),=
 (size_t) -1);<br>
&gt; ++&nbsp; TEST_COMPARE (errno, EILSEQ);<br>
&gt; ++&nbsp; TEST_VERIFY (ip =3D=3D ntf.buffer + 2);<br>
&gt; ++&nbsp; TEST_COMPARE (il, (size_t) 0);<br>
&gt; ++&nbsp; TEST_COMPARE_BLOB (out, op - out, &quot;A&quot;, 1);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv_close (cd), 0);<br>
&gt; ++&nbsp; support_next_to_fault_free (&amp;ntf);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static int<br>
&gt; + do_test (void)<br>
&gt; + {<br>
&gt; +@@ -122,6 +294,14 @@ do_test (void)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; xmunmap (ntf, ntfsize);<br>
&gt; +<br>
&gt; ++&nbsp; test_trailing_so_ignore ();<br>
&gt; ++&nbsp; test_lone_so_plain ();<br>
&gt; ++&nbsp; test_so_after_ascii ();<br>
&gt; ++&nbsp; test_lone_so_ignore ();<br>
&gt; ++&nbsp; test_caller_skip_no_underflow ();<br>
&gt; ++&nbsp; test_lone_so_tail_caller_skip ();<br>
&gt; ++&nbsp; test_designated_so ();<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp; return 0;<br>
&gt; + }<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-<br>
&gt; core/glibc/glibc_2.43.bb<br>
&gt; index 5d2344389f..09e4e0b837 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc_2.43.bb<br>
&gt; +++ b/meta/recipes-core/glibc/glibc_2.43.bb<br>
&gt; @@ -61,6 +61,7 @@ SRC_URI =3D<br>
&gt; &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0020-fix-create-thread-failed-in-unprivileged-process-B=
Z-.patch" id=3D"OWA50e4e478-f7b3-331f-0d51-97c1adf69843" class=3D"OWAAutoLi=
nk" data-auth=3D"NotApplicable">
file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selfte=
st.patch" id=3D"OWA44ec7ec7-74ae-c14a-12f3-6082c06837d9" class=3D"OWAAutoLi=
nk" data-auth=3D"NotApplicable">
file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.=
patch" id=3D"OWA948db7e2-9a9b-8b40-29d7-ec45a5641280" class=3D"OWAAutoLink"=
 data-auth=3D"NotApplicable">
file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch</a> \<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-121758.patch" id=3D"OWAb03ce9d2-d2cc-04ba-84ab-460a730e=
e76b" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-121758.patch</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.53.0<br>
<br>
</div>
</body>
</html>

--_000_PH8PR11MB81075370E0E13483AD923554DE442PH8PR11MB8107namp_--

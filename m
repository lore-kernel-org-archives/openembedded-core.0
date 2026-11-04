Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7761.1793794309978448220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 04:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LODa2jFy;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=25086; q=dns/txt;
  s=iport01; t=1793794310; x=1795003910;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=JIzofT8cW994ACd4iniU1wSlOpBFoTuq0mVM0EhiFfk=;
  b=LODa2jFynzrKr6k4L/uciNBUslI8a31Wb5F4i3invTc1nnBcDCYlWPpG
   0DX8SF0yCBXDuWOlud0p8jcb9wlOaDvpQRQk9sjRUfjebn3pu+khXcceH
   p0U1ffZtHdYZRYdnZYfQUHYlegQI6FLSWMN93xrrWsrUyUZAjAN4OV5I4
   a+vQVcaC06cPixY2qBX1Jeqgavx7B4YHRhpCxhrtafjyk+F3yS0ZQFCud
   NiCBBNfaQ4/mWL4/yGu8QV5Jhz09VCHe76Y9qakmRVsJMzWGrheTtAjfC
   ikAp+XwO71el6JVxgdooQDQctlSiB5x+fNxM+t0s+6kW+YOUFoBJmIYpp
   A==;
X-CSE-ConnectionGUID: 27DNYCDaS2SJRvb1WjgaDA==
X-CSE-MsgGUID: N4/+8zTpSk+TlbChzY1eKg==
X-IPAS-Result: =?us-ascii?q?A0BmBQBHIOtq/5IQJK1agS6CaDFTgQkCgSNJiCMDhSuGW?=
 =?us-ascii?q?YIhA5FMjlMPAQEBDQIuARsHBAEBhQUCjhwCJjgTAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgEBAQEDAYEIAgEIEQQBAQEuJwodCAIEA?=
 =?us-ascii?q?RIIDIJvgh0WQQMBAg4GsHECih14gTSBAYNjAdxZFYE4gxGBdTqDAxsBAStJb?=
 =?us-ascii?q?IJdgSM0hGInGxuBcoFXgmk+gmEBAQIBF4EdK4QUgjAEgg0VehIbgkIJghmDG?=
 =?us-ascii?q?4ZbAQGCJoYcUnIiAyYzLAFVExcLBwWBJRAzAyAKLy0CFA0QEg8EFgUtHXAMJ?=
 =?us-ascii?q?xIPHRcRHlgbBgUSICpBQzArgRKBB12BKyheAh9GLRWBdgKCUYEjXQIBSUEOB?=
 =?us-ascii?q?0VTCSU+BRJHJCIIEgkBExosCoEaNTwJJj8VDFsLCxoFGkcIAgsCDHQoERATH?=
 =?us-ascii?q?R4kLwUcJkAbChRtPTcGDxkDBIE1BZFBB1uCHgEtRVo0ASsEHi2BFlYPBBAZk?=
 =?us-ascii?q?moBCY9PR6MyCiiDeIwkjT6IMheEBIFXiz0EmVWZCCONZ5VhAgYbFoR1AgQCB?=
 =?us-ascii?q?AUCEAEBBoF/JYFZcBU7gmcJCkAZD44uFoNghRPJJ3kCAQgyAgcCBw4DC5Fog?=
 =?us-ascii?q?X4BAQ?=
IronPort-PHdr: A9a23:jRMQMx0K5uhWpHTxsmDPmlBlVkEcU/3cNwoR7N8gk71RN/3l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:2UpQVa+UOv5tYcFhPKr8DrUD2X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mUeWzrVP6qLazGmf9h1b4+09RlUsZPTm9ZrSwU4/ytEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpIs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lsYqE+y81bCFoUz
 t4iNjpUURKMjs6flefTpulE3qzPLeHiOIcZ/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cPXWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oi9YIqLJ4TQFa25mG6++
 iWFr3bFGioZd+CbwxGF4EP1i8zAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7IQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBPRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:ZoUMM6OEpbUi58BcT8j255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UkssREb9exoS5PwP080lKQFrbX5Uo3SJzUO1FHYSL2KqLGSvwEIeBeOudK1t5
 0QCZSWYeeYZTMV/KSKhTVQUexQveVvm5rY49s2uk0dNT2CHJsQljuRZDzrdXFedU1tP7Z8Pp
 ya4cZMujqnfloqTunTPBM4dtmGjefm0Lb9bzA7JzNP0mSzpALtxK/xEhCe0BtbaDVS3Lck/1
 HClgzy9o+jv/u4xhK07R6c031RorTc4+oGIPbJptkeKz3qhArtTp9mQae+sDc8p/zqwEo2kf
 HXyi1Qf/hb2jf0RCWYsBHt0w7v3HIF8Hn502KVhnPlvIjQWC86McxcnohUGyGpqHbI/esMkp
 6j7Vjp86a/Pimw2xgVIOK4ES2Co3DE5EbKV9Rj1kC3H7FuMIO55rZvjX+9WK1wbB4SrrpXUd
 VGPYX7+Otcd0+cYjTyu2lix8HpY1EIdy32GXTrfqeuomVrdLcT9TpD+CQS801wh64VWt1K4f
 /JPb9vk6wLRsgKbbhlDONEWsevDHfRKCi8e156DG6XXZ3vAUi946Lf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwbrBdeV1JNG/xjRSCHlNA6dh/129tx8oPnxVbDrOSqMRBQnlNahuewWBoneV+
 yoMJxbDvf/JS/lGJpP3Qf5R55OQENuGvE9q5I+QRaDs8jLIorluqjSd+vSPqPkFXI+Vmb2Eh
 I4LU7OzQV7nzeWs1PD8WzssinWCz7CFLpLYd3nw9Q=
X-Talos-CUID: 9a23:/xhqdm1qjj49RXUjCB8mfrxfQJ8JVEz24H7reXSaM3hjEYKXRla80fYx
X-Talos-MUID: 9a23:b5ZCMAk0qlmLsKOlEGa9dnpEaIArs7aSEHsO0qkCseKEJx0pNhSS2WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 12:11:48 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 99F901800015E
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2026 12:11:48 +0000 (GMT)
X-CSE-ConnectionGUID: 63IlIRfCT4e6SZ+vNQMwQQ==
X-CSE-MsgGUID: LlqOxNd5Tka/b8TqVdYzfQ==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.27,195,1787011200"; 
   d="scan'208,217";a="91624295"
Received: from mail-westus3azon11012022.outbound.protection.outlook.com (HELO PH8PR06CU001.outbound.protection.outlook.com) ([40.107.209.22])
  by alln-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 12:11:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWYpNIUH+/GdLiqu0dyBHwt/HQeol23t8W5c57c3/I7aPO7egg45JB5XbRIufnOnbqGrY7i4BUEDLsj+0njrAunSM9A5xj30Bq2XWKJ/8pzS8oIcwnAp6EzTmvyXfqVnHDI8LtINeouUSLbCPS/5Bo8X1tJsLcwlcesctXlxXNsWds5fItRU/h/Hrg0N9RZh9lPexlZe1AP+TWvit5/T5WmM9q2F34X4RBycOv/Bk3WOzIdmIKmCL9D2BR4OP291n2ESvJiqSXU4UNlABA+RGpXsbRQrCr4Cz1PlrbQTQajaVksows8wNyKy/2rWQfq6hUsZCMJFXfTJpugBEmlnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIzofT8cW994ACd4iniU1wSlOpBFoTuq0mVM0EhiFfk=;
 b=SVOmiopw5ost276r6wdRCHk2YYS/0+bcEDligdtm0C1QNZELS71cXvxwWUSpe/JiUCSHinXizF7jLykuc5apcz7J5/c2uzNwxYRp7lHf/8545CBQ1UNAZCzL1GSmeoQHUZd5RuRI/bPDyyTAqsHSvQQp2g0NhJHvNcKo9f449y2YmQV07F3Nx5ep4+mUgfA4/o9XdLFtt/3byM2qUHCs4a3wQmfHgMS1WguLfAhoLByE5/kC2RVYuVWKcTIXptGwzz2LezIO3ExJ3wC8QMRMSGIr46sVVgK0KGWYK+PdM3sccHP6cx+Cr8I+xFNcooU5wgo/X51Qj2cvotyTFCWyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by SJ5PPF1611BC49E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::812) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 12:11:45 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 12:11:45 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
Thread-Topic: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
Thread-Index: AQHdS4frhCCAqvcIU0uOsV0baGdy0rb/TigAgAa+x6qADNOVgIAADuXdgAAPoQCACRMmMoAAQGkAgAHBWFM=
Date: Wed, 4 Nov 2026 12:11:45 +0000
Message-ID: <PH7PR11MB85988863CA88E4CA045D62EDAD682@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20260923173850.21338-1-peter.marko@siemens.com>
 <DM5RBD9MJT2O.2M12R8AMW5OLY@smile.fr>
 <PH7PR11MB8598B39DBADCDF5C628594DDAD672@PH7PR11MB8598.namprd11.prod.outlook.com>
 <DMGCPPR45G7N.2FMNA6HS4W3G6@smile.fr>
 <PH7PR11MB85983BF338795A95B47297DEAD6F2@PH7PR11MB8598.namprd11.prod.outlook.com>
 <DMGF1CY7LWZQ.3N9SFE4FLRK56@smile.fr>
 <PH7PR11MB859851658A7D586768D2A604AD692@PH7PR11MB8598.namprd11.prod.outlook.com>
 <DMLGS7DZ86PF.3RG2UJSCTM4TV@smile.fr>
In-Reply-To: <DMLGS7DZ86PF.3RG2UJSCTM4TV@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|SJ5PPF1611BC49E:EE_
x-ms-office365-filtering-correlation-id: 43760901-0fe5-4066-a6dc-08df3a6ccbb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|22082099003|18002099003|8096899003|13003099007|38070700021|56012099006|11063799006|4143699003|261102123227099003|261026121527099003|261022113327099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|261021135927099003|261021123027099003|261021121427099003|261009223027099003;
x-microsoft-antispam-message-info: 4WKhtN0cVK20PwnGinemleeuKALHZlqDtvQ1fozhAilxPJ4Jwt7HdvqpQY1+B1/lmgRMiSh78tk0JUGcppqIEL4bwnvJ7gxd2ZdVNjujXxgVS3562+qmZLNDO8Fz/m2xFFBh2dqvCyuMD+SkBB4BJU2VxIMM3DDT3dQpdnXLy4g2Avxg8LBHoMXdhd4xx+K9Y4cgf/gRkg4eOfLNZ4FJY6cVMwkiI4K2uQC6tmeiyrc19LLkvJ6D6eY6ODlg4/+8YOEJQO/dmae8oueHUhHqMYGnw5Sguw7Q+9z4DKKDlyt+mLHVmRSu50jfRVvADdC6pE3DbsaTq9S8yvWI1gUTAboPXqSdPoKV6ARepS8VoeNBTu6P4wDkjsh2EpM5IwEfqYj688vuWuce2ajpvc8Umq99gM7O237CAM1TKyvwNszuK5VOGgDhFaF/gknpinyl3me2hu5+7vr+pCX+Skp9HWs1T7jJWaMGhLteUPUGqyUBGofI3z6nwKh5E2VeLQgeyAUMODH6H9Wws26+cnAU7chdoSv1WjnScuMITzPC/7yI5RX2u9HEEZbBMLAsvsfmFw3B6/NWgRh/lj15LoJ0a+aVZq9oxqWoBx6cwNy8CE5PFhcSlQOQ8i+rCWE4meGhjLARRvb4R+1nf7kJyNEm13jyF5B5MlX8It6FlxIC1SU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(8096899003)(13003099007)(38070700021)(56012099006)(11063799006)(4143699003)(261102123227099003)(261026121527099003)(261022113327099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?j2tbQLbfWD8RsZBNEKzHQF04l8hUgDxJQF5BHfuQs6NnyTS8TIfyXrOY?=
 =?Windows-1252?Q?6DtE0HloZyXtXltA75mtwIikS7JWU4PAf768BgJtBUrjjcioq7l/WoSW?=
 =?Windows-1252?Q?Q5TuUGtSjnJ8VoKNP73jGkGgv+UL3N/IGcLTAYt+pleNzag31Jf34WZf?=
 =?Windows-1252?Q?ZDwZbBN1Q2orfD8W8VUB4FtBCrPya+Dcd4QT9cj6V47laO9FRrgNZ2aw?=
 =?Windows-1252?Q?AfIr921qKJhtbwoaSapw/oih6vKjdbpchhz+lFmMcFQr5SFWTryPYCjD?=
 =?Windows-1252?Q?LQUEWQDZVH1am7tITzR4EzHbSbG/5Ue5KfzKcINAb7VP3gNnWkcX2xux?=
 =?Windows-1252?Q?u7R79z3b0Rt0bqpRqb4ZIhIn2cUYB9QFzxuB6CbTPgRKbuw+s/XOlsom?=
 =?Windows-1252?Q?mThgRs0UqyuDaeLAMaVo7b5FSq4P4k4kPZiwmlqwSM9UWssziRpIIhU6?=
 =?Windows-1252?Q?kQEQ/qvja89ymu2fBpHuEkpyREsvWI103ECxwOk+4hfrENq4FLOQKYVC?=
 =?Windows-1252?Q?CBf1v9ikYqUg/2QnwzFTBFsRQ+Eo7Tuo744NLB3AhvvSiH8quEYut/gn?=
 =?Windows-1252?Q?uKzL6EeGTEHsDIxBEG8yLAgKoGjbN+UEFZ0Z+Pv9UCyawRAmOSQErx+g?=
 =?Windows-1252?Q?1SLgpSwA9cMC/VmkbO0l9NzncsXztuym92dN8XI0g0em2EWLuRWybEYq?=
 =?Windows-1252?Q?x/4rhQfB4xGmlwcyuXAr5RJGTNxshXgbJYVRvK3APBokNlTRtAVOHkzM?=
 =?Windows-1252?Q?Mwcu0yjYfm/4J9x4p4mhnecO7RT2njJcKfrwTfYYurWqyuxqnoYhbVAK?=
 =?Windows-1252?Q?8c3moqRjuPMVIEHHhBPbX4v/ZysNYesYBKNEik2rP3wL3IJ+nwHb81tF?=
 =?Windows-1252?Q?wytTS4+SHCAe6jIAtkunPgoc9knTCAuDTGVDKJFlSfOrkLM8bpu1NYCb?=
 =?Windows-1252?Q?uLGUR3/TPu0CObI+NkApY9WJ9yR6JaEwh4IKreB4ovCs4eJ8cqD7Dij8?=
 =?Windows-1252?Q?QJSIG83mjh/TLQlaJVukAa55EaM3BMDbhF/LFeEQtIS/bfGm2tBO18BU?=
 =?Windows-1252?Q?CSTW9RFN9tbqa50A6hL86e/Av77Rpy/KeKqcCeM4+RkAgi9SEF9KHjLr?=
 =?Windows-1252?Q?V+nAw3n0trovizJ+7XbnI1wOfn/vfaxLBoNUhlMGQnsmSP5mn01/iFqg?=
 =?Windows-1252?Q?XXJR6ryA1evvANFB8Pc3twTSj3Ch7MzLzMAMzMJcpd9cw10GnHouCXAQ?=
 =?Windows-1252?Q?mtfjw9KKIvl+46M18Ed4qu/RqIHb4aW72iEakf1OqLPG42syTR/voLJe?=
 =?Windows-1252?Q?cbMdOxKHjfszgHaswf9RR25T0wHJBz5H1deVJOTBfJa/hUxJmZFpbSGr?=
 =?Windows-1252?Q?Z2p63XZuD+8tbGRhwoHcdkhmBefsG9VWT2myDhVYZzMJdrtCMqs3mvuQ?=
 =?Windows-1252?Q?wBuGcPfObvY/OLnH/gDCSGnoTok6LDJpCACRgxrycAHUxK2hwWJshhNJ?=
 =?Windows-1252?Q?ZM9AVPh3RQscoyNyJ0pJbC+/MLHnQFw2dj/sodDysn+9sBfXe8gz3Kl1?=
 =?Windows-1252?Q?gENRbfHnrBDzEPkENgpu2vGBPctIMJ/E2V1cCZq0BFg5WgxxjOk0VLUG?=
 =?Windows-1252?Q?hLFl/mCcUJCbKsJvE97OFLZe/hE/iBeUYuNv7Fk3l6PAtu88SIOVgZP2?=
 =?Windows-1252?Q?4xQ3UxtQF/iNk2rEJl1SFM/mgjoKh7A+/RZE7DcDGez71timC9Ed5Ipi?=
 =?Windows-1252?Q?SqrvAtn5bfcIVZxpQtMScZBa5qpFKf9sw4dEh8r4Dj5Nc/AXIMst56CT?=
 =?Windows-1252?Q?fWAUtjIQ1CRVt6Omo2WNeqRObNSoJnjYM9gBAcXRspHEVRbp?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB85988863CA88E4CA045D62EDAD682PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UzbMIB+LbgfmnMG+vHB7xzfmLRHj7hVe11jTfccbBb5gipTpk2CTqB/qL0kJ4RQ0knwW8K6HMLbft30hg3eu25yQ+I05TtQL0bN/jnLmCnzxVy6tAIobModZ7OoHwwJpdO47ZajOyoItH62w7ftEQ/E91zzoZUyKLyp2mH/i8/+h/d5jL0ICCilRFLv7t1OCBZoJ3SN33WDAornjQgnMDCYYp0cgbt+7FEwoR10ROfJvWgDgq/W+i6dM/QL1o8Nu8IpAP2cPyRZwN8SOfObp+F4d6eg/Xc1DGYTboZmZD7JmXgl7sW+/REGxpXh5ELnXHnll+DkFCn58y8+4BkOL8Q==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43760901-0fe5-4066-a6dc-08df3a6ccbb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 12:11:45.7977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +KV4ehKRvyEMOEHD1I7dTt2umzMOhJBnfxo1HJ+zyZBIDtuhUIXbO8MyUDM00NlnIquSTpwMPZLP9E7PFu4ulg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1611BC49E
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-1.cisco.com [173.37.147.229];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 12:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249374

--_000_PH7PR11MB85988863CA88E4CA045D62EDAD682PH7PR11MB8598namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
I will prepare and submit the updated patch as discussed.
Could you also please confirm whether we need to revert all the earlier pat=
ches proposed by Paul, as discussed in the thread below?
https://lists.openembedded.org/g/openembedded-core/topic/121397520
Regards,
Hetvi

________________________________
From: Yoann Congal via openembedded-core <yoann.congal=3Dsmile.fr@lists.ope=
nembedded.org>
Sent: Tuesday, November 03, 2026 14:52
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openembed=
ded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches fro=
m u-boot

On Tue Nov 3, 2026 at 6:33 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS P=
RIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> My reason for adding CVE_STATUS for is that u-boot-tools uses
> tools-only_defconfig, which disables networking. The affected TCP and
> NFS code is therefore not compiled into the tools.
> not-applicable-config accurately describes this configuration.
>
> I understand the preference for sharing source patches between u-boot
> and u-boot-tools. However, the tools remain unaffected by these CVEs
> regardless of whether the source fixes are applied, so I believe the
> configuration exclusions are technically valid.
>
> The same approach is already used in the wrynose branch [1], which
> excludes all three CVEs. The fix for CVE-2026-29009 was also applied
> separately to u-boot on wrynose [2].
> Additionally, For CVE-2026-29007 and CVE-2026-29008, I have not
> located a merged upstream fix or a formal patch submission for either
> CVE in the U-Boot community.
>
> For these reasons, I believe retaining the CVE_STATUS entries is
> appropriate for u-boot-tools on Scarthgap. They accurately reflect the
> configuration being built and keep the CVE assessment consistent with
> the approach already accepted for Wrynose.

The new proposed approach would have to be deployed on wrynose as well
(if applicable, I have not checked).

I think that having the precise reason for a non-applicable CVE is not
worth doing the CVE work twice (once with a patch, once with the
CVE_STATUS). If we can fix both u-boot/u-boot-tools with a single patch
it's more efficient.

I still think we should merge the sources (upstream+patches) between
u-boot/u-boot-tools and fix the CVEs only once if possible.

>
> [1] https://github.com/openembedded/openembedded-core/blob/wrynose/meta/r=
ecipes-bsp/u-boot/u-boot-tools_2026.01.bb
> [2] https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&id=
=3Ddff41dcd5e54cad46ba91ecc45faefb0c8db9089
>
> Regards,
> Hetvi
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: 28 October 2026 16:26
> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openemb=
edded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org=
>
> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches f=
rom u-boot
>
> On Wed Oct 28, 2026 at 11:04 AM CET, Hetvi Thakar -X (hthakar - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
>> Hi Yoann,
>>
>> Thanks for clarifying. For patches 9=9611, I understand that source
>> fixes are preferred. However, networking is disabled in u-boot-tools,
>> so building it would not compile or exercise the affected code. How
>> should these fixes be verified?
>
> By sharing the sources with u-boot which will compile those parts.
>
>>
>> Regards,
>> Hetvi
>>
>> ________________________________
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoa=
nn.congal=3Dsmile.fr@lists.openembedded.org>
>> Sent: 28 October 2026 14:37
>> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <ht=
hakar@cisco.com>; peter.marko@siemens.com <peter.marko@siemens.com>; openem=
bedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.or=
g>
>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches =
from u-boot
>>
>> On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
>>> Hi Yoann, Peter,
>>>
>>> Thanks, Yoann. Continuing the discussion here as suggested.
>>>
>>> As i explained in the other thread [1], the existing u-boot fixes are
>>> not currently applied to u-boot-tools. My CVE_STATUS changes address
>>> cases where the affected code is not compiled into the tools build.
>>>
>>> I understand that the proposed separate include would allow both
>>> recipes to share the CVE patches without adding them to
>>> u-boot-common.inc and affecting downstream users.
>>>
>>> My concern is whether we need this additional include and shared patch
>>> list for cases that can be handled through recipe-specific CVE_STATUS
>>> entries. Could we consider the held exclusions on that basis?
>>>
>>> If maintaining one shared source patch set is the preferred approach,
>>> could you clarify how we should handle patches 2=9611 of my series?
>>> Should we revisit them after the shared include is settled and retain
>>> only the exclusions still needed?
>>
>> The general idea is that by sharing CVE patches with the main u-boot
>> recipe, CVE would be also "fixed" in u-boot-tools (even if said patch is
>> not compiled).
>>
>> For 2-8, patches are in u-boot so no need to ignore them:
>> * [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040
>> * [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254
>> * [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255
>> * [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256
>> * [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257
>> * [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258
>> * [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259
>>
>> For 9-11, there are no u-boot patches so ignoring them in the
>> u-boot-tools recipe, would be fair (but patching them would be
>> preferable):
>> * [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007
>> * [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008
>> * [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009
>>
>> Regards,
>>
>>>
>>> [1] https://lists.openembedded.org/g/openembedded-core/message/247868
>>>
>>> Regards,
>>> Hetvi
>>> ________________________________
>>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yo=
ann.congal=3Dsmile.fr@lists.openembedded.org>
>>> Sent: 16 October 2026 03:44
>>> To: peter.marko@siemens.com <peter.marko@siemens.com>; openembedded-cor=
e@lists.openembedded.org <openembedded-core@lists.openembedded.org>
>>> Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <h=
thakar@cisco.com>
>>> Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches=
 from u-boot
>>>
>>> On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedded=
.org wrote:
>>>> From: Peter Marko <peter.marko@siemens.com>
>>>>
>>>> After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
>>>> patched in u-boot showed-up in CVE reports for u-boot-tools.
>>>>
>>>> It does not make much sense to share git repository but not share all
>>>> patches on top of it, so move adding all patches from u-boot recipe to=
 a
>>>> common include file where also the git repository is defined.
>>>>
>>>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>>> ---
>>>>  meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
>>>>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
>>>>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
>>>>  3 files changed, 10 insertions(+), 14 deletions(-)
>>>
>>> Hello Peter, Hetvi,
>>>
>>> There is a bit of back-and-forth around u-boot-common.inc. So I thought=
 I
>>> would give my vision and get your thoughts.
>>>
>>> Fundamentally, there is confusion about the usage of this .inc file:
>>> * This is the common part of u-boot and u-boot-tools recipes (what the
>>>   above patch uses)
>>> * But, also, this may be used by downstream layers to reuse u-boot
>>>   recipe parts. We basically did the revert of Peter's patch a few mont=
h
>>>   ago for this reason[0].
>>>
>>> With Paul, we would like to have a single set of patches common for bot=
h
>>> u-boot and u-boot-tools, but that can't be in u-boot-common.inc as ther=
e
>>> is a risk of breaking downstream layers.
>>>
>>> Our idea is to create a new inc file "u-boot-common-patches.inc" (I'm
>>> not attached to the name) that contains only SRC_URI +=3D "CVE_*.patch"
>>> and a big warning explaining that is file is only supposed to be
>>> included from layer-local recipes (namely u-boot and u-boot-tools).
>>>
>>> This whole situation is not ideal but think the above would solve our
>>> issues and still be acceptable under stable policy.
>>>
>>> What do you think?
>>>
>>> Regards,
>>>
>>> [0]: u-boot: move CVE patches out of the common .inc file - openembedde=
d-core - OpenEmbedded Core layer
>>>      https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8=
ff03147dd532a88cf3ce08d61fab057522
>>> --
>>> Yoann Congal
>>> Smile ECS
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>
>
> --
> Yoann Congal
> Smile ECS


--
Yoann Congal
Smile ECS


--_000_PH7PR11MB85988863CA88E4CA045D62EDAD682PH7PR11MB8598namp_
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
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I will prepare and submit the updated patch as discussed.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Could you also please confirm whether we need to revert all the earlier pat=
ches proposed by Paul, as discussed in the thread below?</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/1213975=
20" id=3D"OWAcd6806d0-ec4b-d3bc-cf06-1a14805dd520" class=3D"OWAAutoLink" da=
ta-rich-text-autolink=3D"">https://lists.openembedded.org/g/openembedded-co=
re/topic/121397520</a></div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Hetvi</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal via openembedded-core &lt;yoann.congal=3Dsmile.fr=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, November 03, 2026 14:52<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; peter.marko@siemens.com &lt;peter.marko@siemens=
.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@li=
sts.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patc=
hes from u-boot
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Tue Nov 3, 2026 at 6:33 AM CET, Hetvi Th=
akar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; My reason for adding CVE_STATUS for is that u-boot-tools uses<br>
&gt; tools-only_defconfig, which disables networking. The affected TCP and<=
br>
&gt; NFS code is therefore not compiled into the tools.<br>
&gt; not-applicable-config accurately describes this configuration.<br>
&gt;<br>
&gt; I understand the preference for sharing source patches between u-boot<=
br>
&gt; and u-boot-tools. However, the tools remain unaffected by these CVEs<b=
r>
&gt; regardless of whether the source fixes are applied, so I believe the<b=
r>
&gt; configuration exclusions are technically valid.<br>
&gt;<br>
&gt; The same approach is already used in the wrynose branch [1], which<br>
&gt; excludes all three CVEs. The fix for CVE-2026-29009 was also applied<b=
r>
&gt; separately to u-boot on wrynose [2].<br>
&gt; Additionally, For CVE-2026-29007 and CVE-2026-29008, I have not<br>
&gt; located a merged upstream fix or a formal patch submission for either<=
br>
&gt; CVE in the U-Boot community.<br>
&gt;<br>
&gt; For these reasons, I believe retaining the CVE_STATUS entries is<br>
&gt; appropriate for u-boot-tools on Scarthgap. They accurately reflect the=
<br>
&gt; configuration being built and keep the CVE assessment consistent with<=
br>
&gt; the approach already accepted for Wrynose.<br>
<br>
The new proposed approach would have to be deployed on wrynose as well<br>
(if applicable, I have not checked).<br>
<br>
I think that having the precise reason for a non-applicable CVE is not<br>
worth doing the CVE work twice (once with a patch, once with the<br>
CVE_STATUS). If we can fix both u-boot/u-boot-tools with a single patch<br>
it's more efficient.<br>
<br>
I still think we should merge the sources (upstream+patches) between<br>
u-boot/u-boot-tools and fix the CVEs only once if possible.<br>
<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/openembedded/openembedded-core/blob/=
wrynose/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb" id=3D"OWA9751382f-=
178c-98f7-153b-4445746f5230" class=3D"OWAAutoLink" data-auth=3D"NotApplicab=
le">
https://github.com/openembedded/openembedded-core/blob/wrynose/meta/recipes=
-bsp/u-boot/u-boot-tools_2026.01.bb</a><br>
&gt; [2] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
h=3Dwrynose&amp;id=3Ddff41dcd5e54cad46ba91ecc45faefb0c8db9089" id=3D"OWAb4d=
bdc55-20eb-d270-ceee-0157ddc9dec0" class=3D"OWAAutoLink" data-auth=3D"NotAp=
plicable">
https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&amp;id=
=3Ddff41dcd5e54cad46ba91ecc45faefb0c8db9089</a><br>
&gt;<br>
&gt; Regards,<br>
&gt; Hetvi<br>
&gt; ________________________________<br>
&gt; From: Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
&gt; Sent: 28 October 2026 16:26<br>
&gt; To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) &=
lt;hthakar@cisco.com&gt;; peter.marko@siemens.com &lt;peter.marko@siemens.c=
om&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@list=
s.openembedded.org&gt;<br>
&gt; Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patche=
s from u-boot<br>
&gt;<br>
&gt; On Wed Oct 28, 2026 at 11:04 AM CET, Hetvi Thakar -X (hthakar - E INFO=
CHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt;&gt; Hi Yoann,<br>
&gt;&gt;<br>
&gt;&gt; Thanks for clarifying. For patches 9=9611, I understand that sourc=
e<br>
&gt;&gt; fixes are preferred. However, networking is disabled in u-boot-too=
ls,<br>
&gt;&gt; so building it would not compile or exercise the affected code. Ho=
w<br>
&gt;&gt; should these fixes be verified?<br>
&gt;<br>
&gt; By sharing the sources with u-boot which will compile those parts.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Hetvi<br>
&gt;&gt;<br>
&gt;&gt; ________________________________<br>
&gt;&gt; From: openembedded-core@lists.openembedded.org &lt;openembedded-co=
re@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembed=
ded.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
&gt;&gt; Sent: 28 October 2026 14:37<br>
&gt;&gt; To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisc=
o) &lt;hthakar@cisco.com&gt;; peter.marko@siemens.com &lt;peter.marko@sieme=
ns.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@=
lists.openembedded.org&gt;<br>
&gt;&gt; Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all pa=
tches from u-boot<br>
&gt;&gt;<br>
&gt;&gt; On Tue Oct 20, 2026 at 7:16 AM CEST, Hetvi Thakar -X (hthakar - E =
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt;&gt;&gt; Hi Yoann, Peter,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks, Yoann. Continuing the discussion here as suggested.<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; As i explained in the other thread [1], the existing u-boot fi=
xes are<br>
&gt;&gt;&gt; not currently applied to u-boot-tools. My CVE_STATUS changes a=
ddress<br>
&gt;&gt;&gt; cases where the affected code is not compiled into the tools b=
uild.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I understand that the proposed separate include would allow bo=
th<br>
&gt;&gt;&gt; recipes to share the CVE patches without adding them to<br>
&gt;&gt;&gt; u-boot-common.inc and affecting downstream users.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My concern is whether we need this additional include and shar=
ed patch<br>
&gt;&gt;&gt; list for cases that can be handled through recipe-specific CVE=
_STATUS<br>
&gt;&gt;&gt; entries. Could we consider the held exclusions on that basis?<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If maintaining one shared source patch set is the preferred ap=
proach,<br>
&gt;&gt;&gt; could you clarify how we should handle patches 2=9611 of my se=
ries?<br>
&gt;&gt;&gt; Should we revisit them after the shared include is settled and=
 retain<br>
&gt;&gt;&gt; only the exclusions still needed?<br>
&gt;&gt;<br>
&gt;&gt; The general idea is that by sharing CVE patches with the main u-bo=
ot<br>
&gt;&gt; recipe, CVE would be also &quot;fixed&quot; in u-boot-tools (even =
if said patch is<br>
&gt;&gt; not compiled).<br>
&gt;&gt;<br>
&gt;&gt; For 2-8, patches are in u-boot so no need to ignore them:<br>
&gt;&gt; * [Patch 02/11] u-boot-tools: Ignore CVE-2024-42040<br>
&gt;&gt; * [Patch 03/11] u-boot-tools: Ignore CVE-2024-57254<br>
&gt;&gt; * [Patch 04/11] u-boot-tools: Ignore CVE-2024-57255<br>
&gt;&gt; * [Patch 05/11] u-boot-tools: Ignore CVE-2024-57256<br>
&gt;&gt; * [Patch 06/11] u-boot-tools: Ignore CVE-2024-57257<br>
&gt;&gt; * [Patch 07/11] u-boot-tools: Ignore CVE-2024-57258<br>
&gt;&gt; * [Patch 08/11] u-boot-tools: Ignore CVE-2024-57259<br>
&gt;&gt;<br>
&gt;&gt; For 9-11, there are no u-boot patches so ignoring them in the<br>
&gt;&gt; u-boot-tools recipe, would be fair (but patching them would be<br>
&gt;&gt; preferable):<br>
&gt;&gt; * [Patch 09/11] u-boot-tools: Ignore CVE-2026-29007<br>
&gt;&gt; * [Patch 10/11] u-boot-tools: Ignore CVE-2026-29008<br>
&gt;&gt; * [Patch 11/11] u-boot-tools: Ignore CVE-2026-29009<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [1] <a href=3D"https://lists.openembedded.org/g/openembedded-c=
ore/message/247868" id=3D"OWAedf6bc02-3f25-3d67-e838-21ea61dfed35" class=3D=
"OWAAutoLink" data-auth=3D"NotApplicable">
https://lists.openembedded.org/g/openembedded-core/message/247868</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt; Hetvi<br>
&gt;&gt;&gt; ________________________________<br>
&gt;&gt;&gt; From: openembedded-core@lists.openembedded.org &lt;openembedde=
d-core@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.opene=
mbedded.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
&gt;&gt;&gt; Sent: 16 October 2026 03:44<br>
&gt;&gt;&gt; To: peter.marko@siemens.com &lt;peter.marko@siemens.com&gt;; o=
penembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openemb=
edded.org&gt;<br>
&gt;&gt;&gt; Cc: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at =
Cisco) &lt;hthakar@cisco.com&gt;<br>
&gt;&gt;&gt; Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use al=
l patches from u-boot<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.ope=
nembedded.org wrote:<br>
&gt;&gt;&gt;&gt; From: Peter Marko &lt;peter.marko@siemens.com&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; After sharing CVE_PRODUCT between u-boot and u-boot-tools =
CVEs<br>
&gt;&gt;&gt;&gt; patched in u-boot showed-up in CVE reports for u-boot-tool=
s.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It does not make much sense to share git repository but no=
t share all<br>
&gt;&gt;&gt;&gt; patches on top of it, so move adding all patches from u-bo=
ot recipe to a<br>
&gt;&gt;&gt;&gt; common include file where also the git repository is defin=
ed.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Peter Marko &lt;peter.marko@siemens.com&gt;=
<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot-common.inc&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 10 ++++++++++<br>
&gt;&gt;&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |&nb=
sp; 2 --<br>
&gt;&gt;&gt;&gt;&nbsp; meta/recipes-bsp/u-boot/u-boot_2024.01.bb&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 12 ------------<br>
&gt;&gt;&gt;&gt;&nbsp; 3 files changed, 10 insertions(+), 14 deletions(-)<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hello Peter, Hetvi,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; There is a bit of back-and-forth around u-boot-common.inc. So =
I thought I<br>
&gt;&gt;&gt; would give my vision and get your thoughts.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Fundamentally, there is confusion about the usage of this .inc=
 file:<br>
&gt;&gt;&gt; * This is the common part of u-boot and u-boot-tools recipes (=
what the<br>
&gt;&gt;&gt;&nbsp;&nbsp; above patch uses)<br>
&gt;&gt;&gt; * But, also, this may be used by downstream layers to reuse u-=
boot<br>
&gt;&gt;&gt;&nbsp;&nbsp; recipe parts. We basically did the revert of Peter=
's patch a few month<br>
&gt;&gt;&gt;&nbsp;&nbsp; ago for this reason[0].<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; With Paul, we would like to have a single set of patches commo=
n for both<br>
&gt;&gt;&gt; u-boot and u-boot-tools, but that can't be in u-boot-common.in=
c as there<br>
&gt;&gt;&gt; is a risk of breaking downstream layers.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Our idea is to create a new inc file &quot;u-boot-common-patch=
es.inc&quot; (I'm<br>
&gt;&gt;&gt; not attached to the name) that contains only SRC_URI +=3D &quo=
t;CVE_*.patch&quot;<br>
&gt;&gt;&gt; and a big warning explaining that is file is only supposed to =
be<br>
&gt;&gt;&gt; included from layer-local recipes (namely u-boot and u-boot-to=
ols).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This whole situation is not ideal but think the above would so=
lve our<br>
&gt;&gt;&gt; issues and still be acceptable under stable policy.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What do you think?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [0]: u-boot: move CVE patches out of the common .inc file - op=
enembedded-core - OpenEmbedded Core layer<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://git.openembed=
ded.org/openembedded-core/commit/?id=3Df4ced8ff03147dd532a88cf3ce08d61fab05=
7522" id=3D"OWAa0f1ebfa-45fe-0630-407f-a33a4dc3a60e" class=3D"OWAAutoLink" =
data-auth=3D"NotApplicable">
https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8ff03147dd=
532a88cf3ce08d61fab057522</a><br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Yoann Congal<br>
&gt;&gt;&gt; Smile ECS<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Yoann Congal<br>
&gt;&gt; Smile ECS<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_PH7PR11MB85988863CA88E4CA045D62EDAD682PH7PR11MB8598namp_--

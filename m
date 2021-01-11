Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.34791.1610374655186622391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 06:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=Mo5gj2Js;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 6Hn2qD+jbzYnZpRsrq97TnkUykliL/UrQicmoLxA4UbSo118DNPiJvxNKYDHQaIhpinrZP6gJa
 Y0VEyjsxiouQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="177962163"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="177962163"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 06:17:31 -0800
IronPort-SDR: o+Pu22eeDMzJQXj62S6Dt/WJbqT575z2+CbDOnz2s7rtJZzWsLKdSq8QOpP4H8As1RnI8+g+/c
 y+9AFSuS77AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="352618119"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jan 2021 06:17:31 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Jan 2021 06:17:30 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Jan 2021 06:17:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Jan 2021 06:17:30 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 11 Jan 2021 06:17:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgbkDi7zo3oJlYpq5EondH2IFTMI9OIb1Wgb5KKeUWWV5YJWze8FGY/wSsBeBa5YuEkrWwUFyIpkMzGseOY4zm9YwscKbxNOIVAnZoAevZmjEaAwjulaFYX/4zkR8/rDHfJzHISAXMeoxaWT2vw5X19WPICxaVUqVHc7tJRfquYa3f6SdzwzvdBOtj7KZ1mTVoQF8WzXUBxXbMLm4gvcFYaSpo51S90BNKbWNvDRw2zgrhPSs89RkphPBZ2QMQEtSpBqhyR5AqrjeDSVnc/zNbf7ZmYKuxh5pqewy1Hm1xQfmT6AVwM6WgsQGOiwFVfJPRntq0lhKQZ7fiOpA/G/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1VNPl2rLcqCFA1lR6T7Zx+gagX5OtCdD777RwfTg84=;
 b=IrreDpTjC2TZE4Bs/pHC44YJfgqKDUBEnkXyXLQmRl1tCu0K5kly+w53EJvxjWvAvPhIBVDp46rGuR3Wba8nEq4/DErrYEa871pKyD7TMdC/Y0ebZUtFshxSboPNWmZoHdzY78suRBg2O1wTEShYhlCAFoNZ/F/sTSIbjQiN9puyab0GhgTWTYQ+gBQokUTIcYGXV5soL6y1VShFHVCH854e+Nfi3ijSW6Y1Ic28y++BPQSqG0ywIFXGFvZFW1ERbHeVO7t1g81jlKyKYZNx9JJ9x/U2smoQ8tx6xln33RndpQWq++TOKnuO5phRLxdH7MVotLFoupHEgimzBSDUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1VNPl2rLcqCFA1lR6T7Zx+gagX5OtCdD777RwfTg84=;
 b=Mo5gj2JsRuF0BVRznP22M3twdFFUg9ZL1KkUZrvXViSIho4EZS7H9g3s3682fmgcC20seUlKHs2Nl7uponHU5Dx3TlwcNDhgJFBwax0QqYKcaOojJX79Z1rDANE1OH3FMZ+SRbwjsw9tHyk2HwG6Cz53PmYbDQVL4Wi1/eq9oTM=
Received: from MWHPR11MB2000.namprd11.prod.outlook.com (2603:10b6:300:2b::23)
 by MWHPR1101MB2142.namprd11.prod.outlook.com (2603:10b6:301:56::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 14:17:29 +0000
Received: from MWHPR11MB2000.namprd11.prod.outlook.com
 ([fe80::5107:5d2b:c993:d232]) by MWHPR11MB2000.namprd11.prod.outlook.com
 ([fe80::5107:5d2b:c993:d232%10]) with mapi id 15.20.3742.012; Mon, 11 Jan
 2021 14:17:29 +0000
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: Paul Barker <pbarker@konsulko.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/6] wic: Add workdir argument
Thread-Topic: [OE-core] [PATCH 1/6] wic: Add workdir argument
Thread-Index: AQHW6AUxhujxlb/okEqFMl815jRZBaoiXkxg
Date: Mon, 11 Jan 2021 14:17:29 +0000
Message-ID: <MWHPR11MB20008B3181D901FA9C20BC8CB9AB0@MWHPR11MB2000.namprd11.prod.outlook.com>
References: <20210111103247.11685-1-pbarker@konsulko.com>
In-Reply-To: <20210111103247.11685-1-pbarker@konsulko.com>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: konsulko.com; dkim=none (message not signed)
 header.d=none;konsulko.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.7.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f9498df-ab15-47ff-da16-08d8b63ba0f3
x-ms-traffictypediagnostic: MWHPR1101MB2142:
x-microsoft-antispam-prvs: <MWHPR1101MB21428D064CCFD2A0EAAD2B45B9AB0@MWHPR1101MB2142.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OGsiZkTyD8PDR+Z9VCzy57nY1UgBIsiwQ2vCJYFzGLEL+CG0XdSupAiM+RPVIqbHHJxsA/hBJhWv3sNalBRh0BDh+ubWlqjvZuZqrD+dRScqHic22Wrc468XJiyYRZsb4oIjMLnlLubEkUZjamb5IBwcA8JBrM/OgQbJlPyVdRY5XJeyM62ScX4EvAbwMqd9mXO1qH5sUwBAycejjnnCO3qBDx6YhwoANC5HBPbSzkArKgCP3NbqQFSFytUDNG977UIMV9+92B0LNSPSMu18LmOopIJi692i3GXkQ85qklKPkw27t25wb3yUJy9iHOjn6ZqoQm4Jw2yzr+aBRs1OOcaPWvHFGR3vZ/zssIio6J6IR0cLrYCRk8taAFGbUeOBc3UpMe0qflDK3EQcRZsLOw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB2000.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(71200400001)(8936002)(8676002)(86362001)(64756008)(186003)(76116006)(52536014)(2906002)(83380400001)(66556008)(66476007)(5660300002)(66446008)(478600001)(66946007)(9686003)(7696005)(55016002)(6506007)(33656002)(316002)(26005)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?tZCT/RCaf0OuwL8KV6srEay0mWR6t14O5i2Ek+w8FGxMBiimScyomkB120do?=
 =?us-ascii?Q?G6U5WWsrP7WE2Y8Dl/HqacPxBnAkRhwVnzt17rSSiA+TxvwhKfoxTkP0z2+9?=
 =?us-ascii?Q?foEXc1cOFE0lYTLeMV+IO/oHlZu0mszKM6/XlQXZbmVZvMgItBu+g/flzI4i?=
 =?us-ascii?Q?ukRVJlspuYfWjzYDwxI+yttI3XbISovD0ACzgW4za9SVxrsddZ4pJl+t1+hi?=
 =?us-ascii?Q?NZHmmCjtfTlWaDMsNabctpp7TqDkrOFH1tNV78dc/DvgpuH38AIo8SlX8ew8?=
 =?us-ascii?Q?kIjRKRB+ml5UpnSHIVM3+SGSMJxWbqdx0A7aapAbWPNdM0E1SM8OT+V9Tz5I?=
 =?us-ascii?Q?wzfDCSNoYhDTFLOkQCBm3BDaDU8frNHYStRMb4XlC7tW30eSNHMBsV1nJnco?=
 =?us-ascii?Q?NB/Z3jgk73Xcgq5nEGrjqrrm5KJC3ogMIXyPUwsAjwOPOu1MrY6+ZimmuAt5?=
 =?us-ascii?Q?BOX+5uLkxJbUeg01SuBwfDbTblRYoCc11ZyxvhCEsQ1uhy2rfySJ3ZUZJFUz?=
 =?us-ascii?Q?2yVhElKI4ChvTxkWWCBrmd8Dg+PTNiKaGuQ2LfiOVEzFhqqrm9btKQkft17K?=
 =?us-ascii?Q?JO67TgHi2m/oKStITBgmzcmveXQzLiQ/JFeX0l3E7ZP/qCwJt5/4pn28WNf/?=
 =?us-ascii?Q?KHfwzUsXSQu5Clj31IAGKFxPuzqy2mE0XcK4lo/OU6iZTNQb8LXjjzBZPXDd?=
 =?us-ascii?Q?gCqLCanTyMHPErkmczQPQaCj+M9bAkAsIbyLxKAOA0buE2UVtItU/DiNOGXD?=
 =?us-ascii?Q?V0vjP4qpfaot0b9m49YlrzaClS/7VD8yWmADWESmM1OgbrYdk29dEzfRBn+p?=
 =?us-ascii?Q?fUYJ2R0XkRBijfOE/VeDOHjCR0sMcWpZ2O04bghVPbM54CNDLYNB9tIKmGNH?=
 =?us-ascii?Q?PxFGZEdMa5QHHpI7qZEOO2hwH8+f8ydDuYkmz985Zt3SHiCCR4qld1uz6lZc?=
 =?us-ascii?Q?TCwOnyLxAK6pWMAtQnz6qPc4TsZDbVEkscVPYeV4PN0=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB2000.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9498df-ab15-47ff-da16-08d8b63ba0f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 14:17:29.2226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pBBrVe+E34fgP3r8XtJm/dc838RUJwlkRtoZth74XF8ro7RrC1iJRf3B9MH4LGPQx7mjbzOflwxsJiS8//8bPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2142
Return-Path: chee.yang.lee@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You might want to update scripts/lib/wic/help.py with description for this =
new features too

>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of Paul Barker
>Sent: Monday, 11 January, 2021 6:33 PM
>To: openembedded-core@lists.openembedded.org
>Cc: Paul Barker <pbarker@konsulko.com>
>Subject: [OE-core] [PATCH 1/6] wic: Add workdir argument
>
>This allows the path for the temporary workdir used by wic to be set when
>running wic from bitbake or directly from the command line.
>
>Signed-off-by: Paul Barker <pbarker@konsulko.com>
>---
> scripts/lib/wic/plugins/imager/direct.py | 2 +-
> scripts/wic                              | 2 ++
> 2 files changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/scripts/lib/wic/plugins/imager/direct.py
>b/scripts/lib/wic/plugins/imager/direct.py
>index 0ca67b77d5..b329568c7a 100644
>--- a/scripts/lib/wic/plugins/imager/direct.py
>+++ b/scripts/lib/wic/plugins/imager/direct.py
>@@ -62,7 +62,7 @@ class DirectPlugin(ImagerPlugin):
>
>         self.name =3D "%s-%s" % (os.path.splitext(os.path.basename(wks_fi=
le))[0],
>                                strftime("%Y%m%d%H%M"))
>-        self.workdir =3D tempfile.mkdtemp(dir=3Dself.outdir, prefix=3D'tm=
p.wic.')
>+        self.workdir =3D options.workdir or
>+ tempfile.mkdtemp(dir=3Dself.outdir, prefix=3D'tmp.wic.')
>         self._image =3D None
>         self.ptable_format =3D self.ks.bootloader.ptable
>         self.parts =3D self.ks.partitions diff --git a/scripts/wic b/scri=
pts/wic index
>24700f380f..a741aed364 100755
>--- a/scripts/wic
>+++ b/scripts/wic
>@@ -312,6 +312,8 @@ def wic_init_parser_create(subparser):
>
>     subparser.add_argument("-o", "--outdir", dest=3D"outdir", default=3D'=
.',
>                       help=3D"name of directory to create image in")
>+    subparser.add_argument("-w", "--workdir",
>+                      help=3D"temporary workdir to use for intermediate
>+ files")
>     subparser.add_argument("-e", "--image-name", dest=3D"image_name",
>                       help=3D"name of the image to use the artifacts from=
 "
>                            "e.g. core-image-sato")
>--
>2.26.2


Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.79])
 by mx.groups.io with SMTP id smtpd.web11.10797.1604048544524471924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 02:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PgNosuSK;
 spf=pass (domain: windriver.com, ip: 40.107.76.79, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFryZvqRVXx7LwFwQwC2x3TyVRKNRyinnHMeMT8byb6hKx53p6CTxde/jCpxBARiMPMoo5tyfxSSStLBxd0B1pWTKbDJR1ChsqIWUmOoKXMy4usDIpkRqejUj6D5Hfn2t9hkpZVaAp0/4OpCWX9lMYuHAq9oZly9/mDLOO+lnBfr16CCFSdjDpK6aasoK6DpgC50b5aMQALzrAJh7P1oAEgR6B5s+nqJYroiilR1mnhAp5TV7DI5BKkCzz9Oe/WZKx+5lespYUqJ+2MXS15l73F767iVh4BnAV90unZPUfWr/QI501n3mMIBJZMv4wm5CeqBmg66TTIUg7/ppDN7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6KScewDJjj3DWr3Au7djmhOhMOjIcDfD/Rq0rvNnEE=;
 b=T+cdlM1ar8lpHhU25+bKHgRYAQnmPnFKUujDIcq/+nDx3Z4JKsEegM+zwuqPGqqeq0NUHdCOz5A1ZGzsqjoGqPmzoy8XS0Nw3EvbfF8kNBQeyqeMYAbh0izrEgMI3Uu4pfgD5M++wKBRMWpaHL8oqerQik6e/DSTtmopiYofpG2PlCxHfHa+uPnAR8tFMrzCemU81LrOOYgbnEkaJIgRYEnftKC3uq2Cyk70UtbUBGZOIDhWsONCV5Ro+Hg5s3+vAIaLvjJWSeKtoq2B4M6k7QDBCjNZ5dJeeNE6VmeAxCAKwfIlQoYqtCfW4LtLcGLHbDF86g2ZYmI2BVA85TROxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6KScewDJjj3DWr3Au7djmhOhMOjIcDfD/Rq0rvNnEE=;
 b=PgNosuSK/5JF9st0lH/ILNqSKlwaekxGo3ZWTuOQbszETyNur5gvbAzaEfXnNlvw1CBjDZpMdqv0HA4OEZVn5COF/txwHO4G7AOea37HNAilN0BsDqHEaEmrD8oWaEm2r7snM1WJTM6RfDhyIkkqc7nPPZgx0v8pJz8Aaq2/msE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB0048.namprd11.prod.outlook.com (2603:10b6:301:6a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 30 Oct
 2020 09:02:22 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 09:02:21 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] update_udev_hwdb: clean hwdb.bin
Date: Fri, 30 Oct 2020 17:02:04 +0800
Message-ID: <20201030090204.14465-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <164262D5F0C9DF23.31617@lists.openembedded.org>
References: <164262D5F0C9DF23.31617@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::33) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.7 via Frontend Transport; Fri, 30 Oct 2020 09:02:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baf56281-d659-4440-dfc2-08d87cb28304
X-MS-TrafficTypeDiagnostic: MWHPR11MB0048:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB0048E47CFE79343601B391D4F1150@MWHPR11MB0048.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jY7KGmzzUJGcgH7xMfUhbYOGwXRUJ3SHGt17JHYY8BdUebr/0N4GrWYkFL+ynSAeuDqP5ZY+UFnkXQPdWzdATjIcs9cwjOh6iX1OMdbZTkqAoAxTrd7O3rsLy0hyl6XfxXWThZsUOftKLBzs7KreSpjee39CFKRG5+5TRZ6wW35qv4b6DHpUGE1zXecDcE6Lai0AdQZp0m+uhzsOSFmp1jYTMl1jl2t53IHne6YhQBIvE99liJXgI7IeVgSnYULSsirsmptTrXtY8SbFAwK61vvqYsKH4fp8oc7z9VW7m/k9LlBch9PV5I/F+9NDFrWouRm8spjqAgqtKJn+ChDcuA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39850400004)(6512007)(15650500001)(66476007)(66556008)(66946007)(2616005)(316002)(52116002)(36756003)(6666004)(6486002)(26005)(83380400001)(8676002)(186003)(16526019)(2906002)(9686003)(5660300002)(6506007)(1076003)(8936002)(86362001)(6916009)(478600001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gM8bZCfjA3A2v26rXDn7WVSrlkY2DNZIF9AxdY9CBKdffOAycUcC5Ha1Y5r/JuEaFVEbjKCbyYPSbOCgnBacygDafyEcs0gt8np2aor0SQTl2POaBciI63d77M/zxp3v3A/SbyB+zdzaMSKnSK9ntNz7+gWkdjGcYriLH+p0ir9+9Ep0wO+6SXdikx2Ab0P7Zc+6bPa8gXsIBEaPfVyEyNSUinGdl1jn0/14pGE7Rvv8CCVQrsHI/SCPDqyX7QTEv6zRDie25GwLd45Va6fb7Z7IUjQtSyrSStLulav9WTqsrc6X4yV/39YViDAq5MuXYov3VBOTE2KDfrtXTGQt73k1xs5IhpZIeYsjxKW9stp0yi/tVcm98JQDqzSXRLiC1luRgVQWEbcPW8Hhs3nAd59nl9/SV5Q8IyROLsobUKb01X4I0qmNdtZLzidRwUznAgVlFsBH2/8pbva7NPvAgiFcr6/0AFDux3pEBKCasBAwNCT5Gvqmf3Mw1lR0TlyRo2+bkx8LoII9MpICbtEWNzb4RfiqXMw04NC1YwLraURQc1TGNVIwj48TtmH1nvqper5GJpoMlXe9Hr170TmqFS9AUEPzptDfPcxNXkL29EhOM6LSH1tJzBdiXGS+e+aEjErpbzFz1Kk3RFPvOuRGIw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf56281-d659-4440-dfc2-08d87cb28304
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 09:02:21.8835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBKUrABwTbPfIdDs5Lip1mNmoS842j0VYqlmewSPJguQoZYqpzjK/AqGlAl3OkPyAsGWpzQz3+ASpUM8CR/6Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0048
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Steps to reproduce:
echo "IMAGE_INSTALL_append =3D \" udev-hwdb lib32-udev-hwdb\"" >> conf/loca=
l.conf

When install both udev-hwdb and lib32-udev-hwdb as above,
there comes below do_populate_sdk error:
 $ bitbake core-image-sato  -c populate_sdk
 ERROR: Task (/path/core-image-sato.bb:do_populate_sdk) failed with exit co=
de '134'
 NOTE: Tasks Summary: Attempted 5554 tasks of which 0 didn't need to be rer=
un and 1 failed.

 $ cat /path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r5/pseudo/p=
seudo.log
 [snip]
 inode mismatch: '/path/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-=
r5/sdk/image/usr/local/oecore-x86_64/sysroots/core2-64-poky-linux/lib/udev/=
hwdb.bin' ino 427383040 in db, 427383042 in request.
 [snip]

It is because both udev-hwdb and lib32-udev-hwdb will generate
${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/udev/hwdb.bin during do_populate_sdk
and it triggers pseudo error.

So clean hwdb.bin before generate hwdb.bin to avoid conflict to
fix the above do_populate_sdk error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 scripts/postinst-intercepts/update_udev_hwdb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postins=
t-intercepts/update_udev_hwdb
index 102e99b947..8076b8ae6f 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -17,5 +17,6 @@ case "${PREFERRED_PROVIDER_udev}" in
 		;;
 esac
=20
+rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
 PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefi=
x}udevadm hwdb --update --root $D ${UDEV_EXTRA_ARGS}
 chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
--=20
2.26.2


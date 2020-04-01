Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.696.1585719826371796139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 22:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=nUCy4HQo;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: ZQWrrNBRGcy5JmhYg46uJERmU3DXt2fdpznAKqWtX1whFH4+pL8udCgr12uAjwaCAbv8wWklV0
 qY6wLusEU2IA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 22:43:46 -0700
IronPort-SDR: cULK/3X8eUXmesnmXphxqBBdrlq1ZdTP9wsoKiquyDHmcJ9p1jwiMp6RNKrytfB+CLaQT6XKGh
 CcpwkFFs5q7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,330,1580803200"; 
   d="scan'208";a="249297814"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
  by orsmga003.jf.intel.com with ESMTP; 31 Mar 2020 22:43:45 -0700
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 31 Mar 2020 22:43:45 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX160.amr.corp.intel.com (10.22.226.43) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 31 Mar 2020 22:43:45 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.56) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 31 Mar 2020 22:43:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjfOej+4CBGPLkhaJf2JF4mRVrQ8UdlBXfkE/O8pYajcrBN3CBlXsKACuaJubtM5gQGilg46YL8KUal3aKq5i8WB7pIvhKA0BE76uZtwy0N1BmXJDafgSUS7iRJA48EAk7OhM04266gdhy+L7eZqUjWDzOJ1RclTki4QmLqf0jznHKUfcoMwShT4JnCQuDWEdSBgtXkxY88mNN7Dp8wLHHBg9LAq6BuLV5eRhLyOOcuFXZnJp7q4XA8JOj5RlUhl7fE6Y8n7feFHrBhNT9MQrzNQfC62SwMzb3hKb1pNDUasKO4BefSfr9+QLze+UO8b1snuMicvwDN9mlDj/M9y+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VCifSBX0yY22djdFE7tuzQFvp3Qc/VAAzhgvZUWy0A=;
 b=H+UQXPT5vIGGe3lle6t2SEeBWmWY6rXekypWggQGFBm2QxZGPllaBfoLj/iLK9bpt30zBGZ0AxRQEP7ZHmpBvjA1EztvgQxHhmZNK9CZcw0Z2wf+myPuD1pv5dkDunxCymQu8zSUasa1eEk1kR5MkBnkDDEhNbUOy1t444qP56LDiCn/c+bi3ez1FWymoZid3WHqC82rRsvj/6NxVsSwlOKDW5zKt++t7QkhcBLUDUwsdP6J99jhY6kWdr9eepx8nNjy8PgGVc+1XpgFn5V5JN46GlbE+Ta7eMt3www612gRVzrJ3y6t0re5Z5iY3RQWBEFw0ga69CLR/+rsJ677HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VCifSBX0yY22djdFE7tuzQFvp3Qc/VAAzhgvZUWy0A=;
 b=nUCy4HQoMTEeWMEIjX7JphzbUbDR88M2+c6mYwxzvjsyalPN2/JXhYYtbUDiUR07J8V3+3v48AGSpvVYo5//qYWduIdrCStFe7O7YSDGSRDfRpGRuk+vcOsXoDoIPATt5TmBd1/Ss0WGj1rrOKHSExHsVZGWZlacohRyzHP+5uY=
Received: from BL0PR11MB3251.namprd11.prod.outlook.com (2603:10b6:208:64::23)
 by BL0PR11MB3281.namprd11.prod.outlook.com (2603:10b6:208:66::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Wed, 1 Apr
 2020 05:43:43 +0000
Received: from BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c]) by BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c%6]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 05:43:43 +0000
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton <ross@burtonini.com>
Subject: Re: [OE-core] [PATCH] selftest/imagefeatures: Enable sanity test for IMAGE_GEN_DEBUGFS
Thread-Topic: [OE-core] [PATCH] selftest/imagefeatures: Enable sanity test for
 IMAGE_GEN_DEBUGFS
Thread-Index: AQHWB+e8zD71QfznW06Iv6AruvJDfqhjwHZQ
Date: Wed, 1 Apr 2020 05:43:43 +0000
Message-ID: <BL0PR11MB32518181F1F1AB56CA939A3EC8C90@BL0PR11MB3251.namprd11.prod.outlook.com>
References: <16019B7602D587BE.16702@lists.openembedded.org>
In-Reply-To: <16019B7602D587BE.16702@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ee.peng.yeoh@intel.com; 
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89b438da-b095-4a0a-a399-08d7d5ffa39e
x-ms-traffictypediagnostic: BL0PR11MB3281:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB3281B9EA2EA631CBCCAE7613C8C90@BL0PR11MB3281.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3251.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(39860400002)(346002)(136003)(376002)(396003)(366004)(26005)(66946007)(86362001)(66556008)(64756008)(9686003)(66476007)(966005)(76116006)(478600001)(66446008)(52536014)(33656002)(8936002)(7696005)(81156014)(53546011)(71200400001)(6506007)(81166006)(316002)(5660300002)(2906002)(55016002)(8676002)(186003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aFLJHpRYhcCKY2Fs5X2BE3NtFXbwBcO2IwcK2W5ICuWVPvph5EpOH5T3AOfhSqz8w05IEAOg1N2t72ncj3Sw21YDIw50W6sXPtLQqQ4kKO/fam1Juuz8ODfMOJAjwltBfxLzzjrHG5y4EzyiVWaalUiih4iTTXtrvordLhkSIQ/BYA+kQqHYWhNtyuENIIv+g3WpucRx31/jIBIF1eQR5PaeL+bLVnlckkysKjf/By3nEcAC1TEXOjBCf2yIOUl0KiCNaUuv4NnX8AgF8YG9Xtd/twx96P1AHABQQdxXQntfK/xJcqfuD0BeDAXaHIGeF3CT2asiVX5tkg4C+GEwG6mYLgDTwidez6Zuu5nUPuVlTQptzarghC1DjcB9wrqKbCE7aIZR7huL/1O2+ojd+ZhM/D6bBMxVqZTcgyeXRT7/xzrrYKKnfh0RDEQSs5cu6HqN0T3qQHPtVpsGCRJty47vTiIzCRnIWlstDL2/WrU3FktxDye0M7qrtKBOsTG2MPuqqNFQMyqyFsfgGxtZ1Q==
x-ms-exchange-antispam-messagedata: ZPwc4o2Bl35YAPkUaVdlurjZs3LIaZCI9P1wzOkn48aCL4Oemjifkl/xqrLZilY+H0MvIf7otwJyYU9CkIX8NTpSknAt6JVWdUWirunMYy+T2sha4RIqAXWbYFD60zQBwh6YxqGbCjL9G5OCozIoIg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b438da-b095-4a0a-a399-08d7d5ffa39e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 05:43:43.2405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4IoT1zgMajpaaUlGbMtRjS/bsyGXr/IMAT11UfIGfUPlP9etqJ9SDpyyoDts2kCeZ8E/0FcIabPfmxuwvUG2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3281
Return-Path: ee.peng.yeoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

This is a following up patch for enable sanity test for IMAGE_GEN_DEBUGFS. =
You provided the review for this patch in the past. Could you take a look a=
nd give us your inputs? Thank you very much for your attention and help!
https://lists.openembedded.org/g/openembedded-core/message/106075?p=3D,,,20=
,0,0,0::Created,,IMAGE_GEN_DEBUGFS,20,2,20,72347194

Thanks,
Ee Peng=20

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Yeoh Ee Peng
Sent: Wednesday, April 1, 2020 1:38 PM
To: openembedded-core@lists.openembedded.org
Cc: Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Humberto Ibarra <humberto.ibarr=
a.lopez@intel.com>
Subject: [OE-core] [PATCH] selftest/imagefeatures: Enable sanity test for I=
MAGE_GEN_DEBUGFS

Add new testcase to check IMAGE_GEN_DEBUGFS. Test makes sure that debug fil=
esystem is created accordingly. Test also check for debug symbols for some =
packages as suggested by Ross Burton.

[YOCTO #10906]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 33 +++++++++++++++++++++++=
++++
 1 file changed, 33 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/=
selftest/cases/imagefeatures.py
index 5c519ac..9ad5c17 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -262,3 +262,36 @@ PNBLACKLIST[busybox] =3D "Don't build this"
         self.write_config(config)
=20
         bitbake("--graphviz core-image-sato")
+
+    def test_image_gen_debugfs(self):
+        """
+        Summary:     Check debugfs generation
+        Expected:    1. core-image-minimal can be build with IMAGE_GEN_DEB=
UGFS variable set
+                     2. debug filesystem is created when variable set
+                     3. debug symbols available
+        Product:     oe-core
+        Author:      Humberto Ibarra <humberto.ibarra.lopez@intel.com>
+                     Yeoh Ee Peng <ee.peng.yeoh@intel.com>
+        """
+        import glob
+        image_name =3D 'core-image-minimal'
+        deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMAGE')
+
+        features =3D 'IMAGE_GEN_DEBUGFS =3D "1"\n'
+        features +=3D 'IMAGE_FSTYPES_DEBUGFS =3D "tar.bz2"\n'
+        features +=3D 'MACHINE =3D "genericx86-64"\n'
+        self.write_config(features)
+
+        bitbake(image_name)
+        dbg_tar_file =3D os.path.join(deploy_dir_image, "*-dbg.rootfs.tar.=
bz2")
+        debug_files =3D glob.glob(dbg_tar_file)
+        self.assertNotEqual(len(debug_files), 0, 'debug filesystem not gen=
erated')
+        result =3D runCmd('cd %s; tar xvf %s' % (deploy_dir_image, dbg_tar=
_file))
+        self.assertEqual(result.status, 0, msg=3D'Failed to extract %s: %s=
' % (dbg_tar_file, result.output))
+        result =3D runCmd('find %s -name %s' % (deploy_dir_image, "udevadm=
"))
+        self.assertTrue("udevadm" in result.output, msg=3D'Failed to find =
udevadm: %s' % result.output)
+        dbg_symbols_targets =3D result.output.splitlines()
+        self.assertTrue(dbg_symbols_targets, msg=3D'Failed to split udevad=
m: %s' % dbg_symbols_targets)
+        for t in dbg_symbols_targets:
+            result =3D runCmd('objdump --syms %s | grep debug' % t)
+            self.assertTrue("debug" in result.output, msg=3D'Failed to=20
+ find debug symbol: %s' % result.output)
--
2.7.4


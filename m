Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.2243.1587438615947652789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 20:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=LV5fxhqB;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: PhQ4zaC5ILnOLLv0C1Yacj5iKZcJmy9acbCcBgYXZ+pn+EC6jKHHQjpTt4iOu58xP8GsTWgvrN
 ShdX8KykbnqQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 20:10:14 -0700
IronPort-SDR: iZaYRmjZdpuAUUFIexcMH6AR9kGwR1o7AL27g4eAAGknDjTQvbNQuMiCAk19ff0kVhrZdeyam4
 zztl0UivHguA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,408,1580803200"; 
   d="scan'208";a="279467140"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
  by fmsmga004.fm.intel.com with ESMTP; 20 Apr 2020 20:10:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Apr 2020 20:10:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 20:10:13 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Apr 2020 20:10:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 20 Apr 2020 20:10:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYn8Oamv2gyllbgAezcWvahf/w012m7SsEJV+9r/Dp3J25FVlqFMwK+ORLmTr23psE4l1w8/07eSUjJOzae8hIhhJxrFD6wkjkRA0GSSQ+zBcjzjKelWx0YXQilrpaYMlz3dLc7Io5Bp6qK/BT+4LdSOZiyeYDsrPDyGNEg/1GPPHGUutsP+ea7vLZxAHBa4Izvr5zCwAaokyQc1NTytUkcE2VSTRsn8D9lhBiwR4LRyAeXfrT6jG1TpoqFfbG1YwPdYH+VbeKOzVzzTtryuYOXlfMWthgoA/HQ1DtBr86IhP5A3btam0VEFYOGx9C09WrMHHaePwx6auLPEgfXp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE0MUrt5c6rfzAco56BdFAbk7YfE26/1WGeu6M8OKnw=;
 b=cvEnzHURi84gmRVHfImLkAMfTyzIGSUzz9D59yiOynAGH7BW8prim0VZU5bYIgegwqy5IbpE5o/Qb4KELFaj5Cg0Zm1AejPfHhWRQA04TyB/AiAgdiyOpnehPr6YOvFMZHieNwhzbG8n1362u3s9RTzWVFpmy0s5NszUOzbnnBOjl0XesX5WygtyiJt63UtUwDIEMiQlLxUerxDPswgyX8M8p9j0V1sUV1betcFTJx91ya1NPNko6oEdcCG49FsmfSpUB6rNSVwnKa/roKxOplvL8J3XJ+Sbgzp7Q8nFvPGaOgWpEue5376StNjfPdXHFsx+nLJ0ygMYnjd6swVH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE0MUrt5c6rfzAco56BdFAbk7YfE26/1WGeu6M8OKnw=;
 b=LV5fxhqBFZoFr2oSAw9YWF1IRlD5lRHRqLElG7m9jKCeBG2Ag9NXMAH29VOuOvtM7MPWm+MCkEPHMB+wV9FB5+ZYmBzccEXxm5JUiAWKy9b6DzCduDtplgWthIaErrzqMKY/M3OaxVeTPE8hYQ9U7i89g9HaHTe1U+F8a4U1K80=
Received: from BL0PR11MB3251.namprd11.prod.outlook.com (2603:10b6:208:64::23)
 by BL0PR11MB2979.namprd11.prod.outlook.com (2603:10b6:208:7c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Tue, 21 Apr
 2020 03:10:11 +0000
Received: from BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c]) by BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c%6]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 03:10:11 +0000
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Subject: Re: [PATCH] selftest/imagefeatures: Enable sanity test for IMAGE_GEN_DEBUGFS
Thread-Topic: [PATCH] selftest/imagefeatures: Enable sanity test for
 IMAGE_GEN_DEBUGFS
Thread-Index: AQHWF4pdbOeixpkzj0+T5aPqMlACDg==
Date: Tue, 21 Apr 2020 03:10:11 +0000
Message-ID: <BL0PR11MB3251B150FE983465E845C1FFC8D50@BL0PR11MB3251.namprd11.prod.outlook.com>
References: <1585719470-55818-1-git-send-email-ee.peng.yeoh@intel.com>
In-Reply-To: <1585719470-55818-1-git-send-email-ee.peng.yeoh@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ee.peng.yeoh@intel.com; 
x-originating-ip: [192.198.147.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b26849f-7af2-4681-064f-08d7e5a18162
x-ms-traffictypediagnostic: BL0PR11MB2979:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB297936A1E268E52CDD7B12BDC8D50@BL0PR11MB2979.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3251.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(366004)(136003)(376002)(39860400002)(346002)(396003)(86362001)(52536014)(7696005)(6506007)(76116006)(53546011)(107886003)(6916009)(4326008)(66446008)(66476007)(66946007)(64756008)(66556008)(26005)(186003)(2906002)(9686003)(478600001)(71200400001)(55016002)(8676002)(5660300002)(316002)(8936002)(33656002)(81156014);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2dGdLwkc8nSgreb+3age7CRgUR3mAf5dOJb/2xQZfV09rrjZf/ZhlJcCnTq/K496uYVMbhzFPDy+uvi0uFfb1SsZ0G7JFzFonQfQ7Mu+G+YcmZxSCefOeCSvFTU4X5gaBLGwTlDDC6RAfB1FGG8mpsdjfNVardd7pWTi0ywjNW2skvpeBm6RUm80O1ADlbq6CiG5cPi8KHmWq5dIeUrAsPb7lX7JUoRPmeaE0vLSk2EkXVf4Pjx17SMdUFEhPwkUvGieCmO8NlAoQRicCgjF5mPkJL0RVpRlYN+jcYbtxkoyuVhun6ygKfNboUq1ABYSDmtBZYT8zxKQv+zN3veuZHlX26s1L1f2im450UPXfHRlqYbYGN0vkUzOZWw5CZ+dHA6co4te9D2rQvvMGxICP6ODwyBBIhzQ2C5YNCcKs/khhYc/zituVn2mfWIwuqLR
x-ms-exchange-antispam-messagedata: WuO4+GwAACxBHLfSq5S8A010YP1F5tBuwk4Z7hFNUU+c6lN7FVUgE34yiZjbJB938bn2FaVDYi1OE5ZDTbmMgMYCsHgYEBTvZF7A7lZSPEoiB4HVgrsmNHQcO0BHD0tyAbK2TZD9KSTgqBD0Q2mKlg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b26849f-7af2-4681-064f-08d7e5a18162
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 03:10:11.9065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WCkiDlXLrhS0Ijix9NRoW3Qql0uHCOnJ/SRij4EAKgl8Nau3bWA8GVVTxFcgxzOIijGwgZaIIKen4MwQ6v42OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2979
Return-Path: ee.peng.yeoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Anyone has any inputs or suggestions for this patch that enable selftest fo=
r IMAGE_GEN_DEBUGFS?
Thank you very much for your attention and help!

Best regards,
Yeoh Ee Peng

-----Original Message-----
From: Yeoh, Ee Peng <ee.peng.yeoh@intel.com>=20
Sent: Wednesday, April 1, 2020 1:38 PM
To: openembedded-core@lists.openembedded.org
Cc: Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Humberto Ibarra <humberto.ibarr=
a.lopez@intel.com>
Subject: [PATCH] selftest/imagefeatures: Enable sanity test for IMAGE_GEN_D=
EBUGFS

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


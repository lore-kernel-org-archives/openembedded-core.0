Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.3694.1604345067002020033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 11:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=GiB/c6RS;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: h/I4itO15yZppZJkOI4hdX78l0UvVf9ukhxNth7/vxWKI/98qOJzZ241CR9IT/qfqKhoofOyfb
 CR7EkbEbafVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="148219890"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="148219890"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 11:24:26 -0800
IronPort-SDR: zFH7/7XvG2anZ4JMLVotxpinfA4lOpc8UagKdWO8x55qaxB8rFXD2Bnj7qbN+oyrCH8oj1Dg3J
 1Uv5VWe1aw7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="362710127"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Nov 2020 11:24:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Nov 2020 11:24:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 2 Nov 2020 11:24:26 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.51) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 2 Nov 2020 11:24:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqLjWN2MOkNY6lXa4yC+JF2VvQGwXxdVoMhqMniuUkOL9rUdh3t/9SdLWWyeysgRnI65jEybd5GIrqeQQNbsefqGG4/EdhiBhOPybffECl3lmh3acGIxGXYug+5s+nArAzjvoLcIH9W4sm/oOzIEjveU2YmPz1fyr/UqWEcYAva0GVuAWmeOgZ1yvYK9glCkko1SS0H6y9bg2e5QdVUv53VOlKbYZ+fcAy4zwBGHvUNEpTMl6IvRnkgQC5nfF0RJ6/bzTTNQ7NQj+IT3VjznGaC9HMbXN7fba4lTTZ7CuNtcyj2RqENrFZqjTPfeob9KgXNlcv1CDtKyF0xkGUXaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWf1ArEmIbfiYLjqzAQK3TWydYL/H+j/PSy0CQ3qt5M=;
 b=R/3leT+bP1IQt9J1KawcWraAOXbWInGlkQT4m/tNchVtlcIhwvuWCHNJrWCGvrU1TcGN8/D8MVmEX61hgodRUBArkmqkPqIPCwZZqesFyjaRwUf86pQY0BqPJu5RaPkkZGe/DvmCnV2XTAMtjy+Uu7hN+m4tEnoapM2fF5oOsGSAIqKw6Dih1kdcB1mTOadsgNQH8ZRa5AF7u+n6E8fV+rdgX4zw4h8y5qWL2Zd38PqblfGFn/ehPThFjvYvKQaY8uP2MYYNPwrcGJpq+fDGqrsLjFx2/yeTJQbfOEUPSt/1hdzaWKvepaROKXaHsFPU5TbQf5sT5++6AKy3GlIC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWf1ArEmIbfiYLjqzAQK3TWydYL/H+j/PSy0CQ3qt5M=;
 b=GiB/c6RSDnLKMA3u9LHdWpJcTuRq+w6AIiqFCjDx7/Xbfz3rmRbTneEoh6mpQjoNnuFNRzyz0L9tydzJxbbECWy2tI0w+tiWtZHjw2TaVUjjLwTgGwJ2CP76aDSUR53/xRLv3ZInI5BgvjdTxJKp3ZfFsV8AeFAGzcPDZLIw1JM=
Received: from DM5PR11MB1993.namprd11.prod.outlook.com (2603:10b6:3:12::18) by
 DM6PR11MB3593.namprd11.prod.outlook.com (2603:10b6:5:138::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Mon, 2 Nov 2020 19:24:23 +0000
Received: from DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::d42a:302d:7896:7871]) by DM5PR11MB1993.namprd11.prod.outlook.com
 ([fe80::d42a:302d:7896:7871%2]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 19:24:23 +0000
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] imagefeatures: New test case, test_empty_image, added
Thread-Topic: [OE-core] [PATCH] imagefeatures: New test case,
 test_empty_image, added
Thread-Index: AQHWp4f0Om8QYRgMJ0iJkJgZKyvA0qm1TDrw
Date: Mon, 2 Nov 2020 19:24:23 +0000
Message-ID: <DM5PR11MB199365E67C81D8953C36EF75DE100@DM5PR11MB1993.namprd11.prod.outlook.com>
References: <163FF60EA8003772.25444@lists.openembedded.org>
In-Reply-To: <163FF60EA8003772.25444@lists.openembedded.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [113.210.197.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cea3d53e-2ec3-4ba2-3e8c-08d87f64e7a8
x-ms-traffictypediagnostic: DM6PR11MB3593:
x-microsoft-antispam-prvs: <DM6PR11MB3593BD3004476CCC90C803BFDE100@DM6PR11MB3593.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ih1GMZU2zQic193dEr/MVwVXyJphLslHFUDWfSbEyTuf713IFMgJZrHGYs9Df4j6uoiuzLmRpBa96C2JpD9aOPo9r1AeAFJ/UPVtoBInuoLnQ2URJL5R0NukUzHwEVmxc/hljzwfoX6dO9Jr9CTnCEevOPRgTvmk6JI26MyrEg8QXDKXVZEQdDuqWlg/2JYCeNAiAnHGb1e0isyWt8yAZVnnXLTXWFsX4UtR8GhDtOVzanMAgZjvndqFSiyu/bGYUdTy6axBRdXkfN3d8io9R8PrqL0IgYC8GnE5T4hY3C0sSGqCMlFToo1mCRkIFDYOr5U4DK8mwy07qmcUSH3Cdw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(71200400001)(26005)(7696005)(6506007)(478600001)(53546011)(316002)(110136005)(186003)(55016002)(2906002)(83380400001)(66476007)(8676002)(33656002)(5660300002)(52536014)(9686003)(8936002)(66946007)(64756008)(66556008)(66446008)(76116006)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 5BmxmfnlVY31LptHkXrq544zshykcP467SUHJCtqt7vftqp3TUO5VIfKn1Kutt+goSTSaRiCKL38BcZG9W8g8Vy0s5mUHy4evN/AElWeoDB7s3sa08pd/8C5G8Kp0eeo94YGndaBT4Ckz90wwnI88wtZ1SNRV4HEOV3cK2mf9CThHbLpS8Eb4Hwr1dfUpIIeTggrqgj+AgU0XOPLpI5MYiDg8tWuF5ud2l/LVqacCnd8kWeI8srSHFn4AGJb028PZdkaD3+WXHKmKBGges6lrz8rHh2CptufEheuFXYJKEZv/9q7JZYtupA3C6P+1R7Er8v/W9j4kpF80WuO9jQoqESXpsEXAKs8LtTCMc+UiCZtOhYIYVAmtkf4ATMl0yww3czmuIarC8D9dAQxvi3GU0lhEXUh5BXFRQlnAyPboA1QRACJoBcGHkKTKvxdsT+QTHRYLpuerXILp2pr7UzD0ZassVjEpfRM+wCEg7tyu+cB2tqz7Yw0TiFGLod+98EaJX9PVZ2gYCk1xrsoWqLbVht5k9NIbgLJXoeB+TL5Fmf92aguC8qkBujKIz4KyfeKDSuzkwAYk/ogms1zdyQjCCotsaXXtQ68xVagqElkd1yxpAueR0uCerfOGN4/kgLPtwzWwKihraB6G5MhoVE9bQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea3d53e-2ec3-4ba2-3e8c-08d87f64e7a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 19:24:23.1346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: asHAUdagZ6yX0Ukp7ifaB2BoGWG2MabHcd7Eh8dicIECphcJUJYtG/+mTKbdNA87fWLSAVNINY7PCr8xCz84M4wTBo1czr9QQyKG82V3pWCqQ1hCsn8P3lTR7fkNLvy+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3593
Return-Path: khairul.rohaizzat.jamaluddin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Just a gentle reminder, is anyone looking into this patch at all?


Thank you & Kind regards,
Khairul

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Jamaluddin, Khairul Rohaizzat
Sent: Wednesday, October 21, 2020 4:55 PM
To: openembedded-core@lists.openembedded.org
Cc: Jamaluddin, Khairul Rohaizzat <khairul.rohaizzat.jamaluddin@intel.com>
Subject: [OE-core] [PATCH] imagefeatures: New test case, test_empty_image, =
added

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

An empty image build file exists under the meta-selftest folder, test-empty=
-image.bb, which builds an image with no additional packages. However, ther=
e were no further selftest created to verify its emptiness

This change consists of the selftest related to the said image to verify it=
s emptiness and the 'import glob' moved as global import instead of local i=
mport.

The expected outcome of the test should be TRUE or 1 if the .manifest file =
content is empty.

[YOCTO #8455]

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@i=
ntel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/=
selftest/cases/imagefeatures.py
index f7a2533..415e031 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -5,6 +5,7 @@
 from oeqa.selftest.case import OESelftestTestCase  from oeqa.utils.command=
s import runCmd, bitbake, get_bb_var, runqemu  from oeqa.utils.sshcontrol i=
mport SSHControl
+import glob
 import os
 import json
=20
@@ -347,7 +348,7 @@ UBOOT_ENTRYPOINT =3D "0x80080000"
         Author:      Humberto Ibarra <humberto.ibarra.lopez@intel.com>
                      Yeoh Ee Peng <ee.peng.yeoh@intel.com>
         """
-        import glob
+     =20
         image_name =3D 'core-image-minimal'
         features =3D 'IMAGE_GEN_DEBUGFS =3D "1"\n'
         features +=3D 'IMAGE_FSTYPES_DEBUGFS =3D "tar.bz2"\n'
@@ -368,3 +369,12 @@ UBOOT_ENTRYPOINT =3D "0x80080000"
         for t in dbg_symbols_targets:
             result =3D runCmd('objdump --syms %s | grep debug' % t)
             self.assertTrue("debug" in result.output, msg=3D'Failed to fin=
d debug symbol: %s' % result.output)
+
+    def test_empty_image(self):
+        """Test creation of image with no packages"""
+        bitbake('test-empty-image')
+        res_dir =3D get_bb_var('DEPLOY_DIR_IMAGE')
+        images =3D os.path.join(res_dir, "test-empty-image-*.manifest")
+        result =3D glob.glob(images)
+        with open(result[1],"r") as f:
+                self.assertEqual(len(f.read().strip()),0)
--
2.7.4


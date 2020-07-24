Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.7704.1595552291541763546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 17:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=AeUfduMm;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: fpdzQznUv69wBMYZyEePC1vtkqu3kGpiXFF9CpwbVH1Or5yUYpLde46SOkJSyfBVTfn1hxKBWe
 qxfqVKeEkZmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="149833040"
X-IronPort-AV: E=Sophos;i="5.75,388,1589266800"; 
   d="scan'208";a="149833040"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 17:58:10 -0700
IronPort-SDR: cSobXQPTkl+XUVcBqu3rA7wjdUarn2qT2IV4/TZpVlsZaOuOURM/NRyYl9YFIrM11oQuztkWlI
 Hl8HE+EccXiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,388,1589266800"; 
   d="scan'208";a="432923165"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP; 23 Jul 2020 17:58:09 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 23 Jul 2020 17:58:09 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 23 Jul 2020 17:58:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 23 Jul 2020 17:58:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R95sLEVioN8fm8B4OwRhj0VnKpJAAH1hYzhArybBqVuO29EZm3VrW2kBcJGaY/qvtg+nKLBkET7U4kJg9O7gad2fSUoyCs085mFttPLxS/bTx/JpyV3t8Fa6BcijdNHW11pgSulKggOCc9FiR/5liQGPG4e19SFrFhyGRVvPghlBs0I3TV52aCaX8wY7Cwajh4MJbZ0HrmIDGZeZBOUjooNvg5KWMEYPNNR9fweN3XaNgFEx0eSMzAynNRgYJZR4vsWtUlNI3HgtC4GMzQ4gqMgiHQtfejBjT831+5Xn1OlApKnQ5DJWEb087zQAQ2gUx0CCili3pebKjTpipZ9RQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE+GmbZtG9K2yv7aKhxKblqAAdmCELbcaL14lWrTTY0=;
 b=LM7NB6wqJkzAzxZP5VGBYoFnu79DLCj0IM3vxBx/rluqDmHBFoah1ZV4z9yAbAOCQYoyPiXZgo5NqFz6WDNzPT9FTQIlFSE+eNGpmXBQECUZHSJTdtphImzbvKJDhuiflB37FjRb874tAdkXvC4o1QAzI7+fg/bE5obSI5qD4cRWPfvH/yBRxwNMA8OcJNhYql3ixK2ke/XAMacpoeyPhyXeGh8XKp5vTrBujHeUAZ2s6aot7x6dGUiNaUXTL3REXg23B371X11JZbyYcqQoQl2zwuE28Iyb9REy0sabNVF8+Yw9/dHKePhrqLZAoKp9TEOta7kpmf79+1pxA4DZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VE+GmbZtG9K2yv7aKhxKblqAAdmCELbcaL14lWrTTY0=;
 b=AeUfduMmbeSIDp7dzM/ESAgorwM5yKKT69M6ksl26YQLMEQ8w5b6k4fvQqW0/flO9dv+j2MGbDGW6y9KoV6BF9GCJWVQCW9luFty+4Msd07YGbVSyaSJmMwpAyp1x6X33jDA8gAu3LkfzH5cfJaJa2IxR+7t34rx+uzI/rbTlf4=
Received: from BN6PR11MB0066.namprd11.prod.outlook.com (2603:10b6:405:67::18)
 by BN6PR11MB4034.namprd11.prod.outlook.com (2603:10b6:405:7d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 00:58:06 +0000
Received: from BN6PR11MB0066.namprd11.prod.outlook.com
 ([fe80::202d:dbf0:6691:56d6]) by BN6PR11MB0066.namprd11.prod.outlook.com
 ([fe80::202d:dbf0:6691:56d6%6]) with mapi id 15.20.3216.021; Fri, 24 Jul 2020
 00:58:06 +0000
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: Khasim Mohammed <khasim.mohammed@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "nd@arm.com" <nd@arm.com>
Subject: Re: [OE-core] [PATCH] wic/bootimg-efi: Add support for IMAGE_BOOT_FILES
Thread-Topic: [OE-core] [PATCH] wic/bootimg-efi: Add support for
 IMAGE_BOOT_FILES
Thread-Index: AQHWYNcD4iT44HY2v0aQqUCuShczzakV5dvw
Date: Fri, 24 Jul 2020 00:58:06 +0000
Message-ID: <BN6PR11MB006610995289E54741817379B9770@BN6PR11MB0066.namprd11.prod.outlook.com>
References: <20200723095150.18257-1-khasim.mohammed@arm.com>
In-Reply-To: <20200723095150.18257-1-khasim.mohammed@arm.com>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.59.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1d95560-36de-437f-f56a-08d82f6ca043
x-ms-traffictypediagnostic: BN6PR11MB4034:
x-microsoft-antispam-prvs: <BN6PR11MB40341D3C94E0B52FE297941AB9770@BN6PR11MB4034.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YmmZTvHjSQpBfdpKDJuXYwcMrNBFWFxMe32aS6D886Ntg+e2zstvtbyuNQbYwEi5Qd9/U6y7gxiS1E1m0A/TMiE5U77u0IYS3kYa8TlVocGstvf5q7AmF1cUIsMKCcR1wkX8wR+zw6rSSmjkzImI5VtOSw/qCTtwLKyIBZZAqeS/ANOHHu6yhkGQ/Zo+QVrcBZpIh9m0G7UVlrtkuF6jf5YQ36UGKXijRq5hnnPyB5se9DD0Ucl4+s9wkXLFS809ShrNRQcHVY/u+hFcyyHLcMd7zfqSESvjqNQ9vrCqrp2joLLsgO7YHud9PK8sC+9CkFn0lqEcRWi6TENTaFNaZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0066.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(6506007)(478600001)(55016002)(64756008)(8676002)(52536014)(53546011)(110136005)(33656002)(76116006)(71200400001)(66556008)(66446008)(66946007)(66476007)(5660300002)(316002)(186003)(8936002)(2906002)(86362001)(4326008)(7696005)(9686003)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 8UI7/L//r+KkvX3iVgEJ6eHVUJH5QEJ2lguvM2iEcMK7/w9heLMtTswG3QhdSbv3We2Y2DUBtKeuWqs/dRImPthjBz7Pq0tSiPZRYv4XwVwY+ktS2Nsdz1GmcPHSKHJXJf0TDVcktsUygN5j4NWZIg4aI0RTVr9D6Ch1IQxSBv1f/mEgcQ79FHzi+JcNmKfNeXL9nfkIEM9HM1dfurK3etWdY43oTyATWYtFcEnSYK7dsAozWrJUTiMZ+Rapw+68WBXTb+Xn5mFz6isy9t/fCFpFnXllewDO9lFqRIo8PaF2wcg3jT9YlYIlbiUQ90W9Y60GXtMCZm6b49CrOzeVwk822s8n9UBzEa/xLPlYEz7JkbQkvbEwOSfA9h9NpszXayCUkl6h9QvB8rY+CMXh+y8ZPcjlYRvLzEA8ZGMo6Os0uB8QQWJXGI5FdusReYgoH7uF1NQQcQbrZCzsE0heU3EjNscYyS/J4A+dDw53duY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0066.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d95560-36de-437f-f56a-08d82f6ca043
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2020 00:58:06.2818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgEBtbhGVB21ZOdidNpU5Sg50BJTAr++r7xrqPP4/Lr/BvDxVkSfM5i90+TJ3PySvOTZe6QzyX4TRQQzNIEF8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4034
Return-Path: chee.yang.lee@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I think currently IMAGE_BOOT_FILES test run on bootimg-partition only.=20
Could you add test cases for bootimg-efi too?

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Khasim Mohammed
Sent: Thursday, 23 July, 2020 5:52 PM
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com; Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [OE-core] [PATCH] wic/bootimg-efi: Add support for IMAGE_BOOT_FILE=
S

List of files defined using IMAGE_BOOT_FILES are installed into the boot pa=
rtition when preparing an image using the wic tool with the bootimg-efi sou=
rce plugin.

The code snippet introduced is taken as is from bootimg-partition.py

Change-Id: I8dbb6b4e7c24870f587a6f31e6ae4a87d7033782
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wi=
c/plugins/source/bootimg-efi.py
index 2cfdc10ecd..14c1723577 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -13,6 +13,9 @@
 import logging
 import os
 import shutil
+import re
+
+from glob import glob
=20
 from wic import WicError
 from wic.engine import get_custom_config @@ -209,6 +212,57 @@ class Bootim=
gEFIPlugin(SourcePlugin):
         except KeyError:
             raise WicError("bootimg-efi requires a loader, none specified"=
)
=20
+        if get_bitbake_var("IMAGE_BOOT_FILES") is None:
+            logger.debug('No boot files defined in IMAGE_BOOT_FILES')
+        else:
+            boot_files =3D None
+            for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.=
label), (None, None)):
+                if fmt:
+                    var =3D fmt % id
+                else:
+                    var =3D ""
+
+                boot_files =3D get_bitbake_var("IMAGE_BOOT_FILES" + var)
+                if boot_files:
+                    break
+
+            logger.debug('Boot files: %s', boot_files)
+
+            # list of tuples (src_name, dst_name)
+            deploy_files =3D []
+            for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
+                if ';' in src_entry:
+                    dst_entry =3D tuple(src_entry.split(';'))
+                    if not dst_entry[0] or not dst_entry[1]:
+                        raise WicError('Malformed boot file entry: %s' % s=
rc_entry)
+                else:
+                    dst_entry =3D (src_entry, src_entry)
+
+                logger.debug('Destination entry: %r', dst_entry)
+                deploy_files.append(dst_entry)
+
+            cls.install_task =3D [];
+            for deploy_entry in deploy_files:
+                src, dst =3D deploy_entry
+                if '*' in src:
+                    # by default install files under their basename
+                    entry_name_fn =3D os.path.basename
+                    if dst !=3D src:
+                        # unless a target name was given, then treat name
+                        # as a directory and append a basename
+                        entry_name_fn =3D lambda name: \
+                                        os.path.join(dst,
+                                                    =20
+ os.path.basename(name))
+
+                    srcs =3D glob(os.path.join(kernel_dir, src))
+
+                    logger.debug('Globbed sources: %s', ', '.join(srcs))
+                    for entry in srcs:
+                        src =3D os.path.relpath(entry, kernel_dir)
+                        entry_dst_name =3D entry_name_fn(entry)
+                        cls.install_task.append((src, entry_dst_name))
+                else:
+                    cls.install_task.append((src, dst))
=20
     @classmethod
     def do_prepare_partition(cls, part, source_params, creator, cr_workdir=
, @@ -238,6 +292,12 @@ class BootimgEFIPlugin(SourcePlugin):
             (staging_kernel_dir, kernel, hdddir, kernel)
         exec_cmd(install_cmd)
=20
+        if get_bitbake_var("IMAGE_BOOT_FILES"):
+            for src_path, dst_path in cls.install_task:
+                install_cmd =3D "install -m 0644 -D %s %s" \
+                              % (os.path.join(kernel_dir, src_path),
+                                 os.path.join(hdddir, dst_path))
+                exec_cmd(install_cmd)
=20
         try:
             if source_params['loader'] =3D=3D 'grub-efi':
--
2.17.1


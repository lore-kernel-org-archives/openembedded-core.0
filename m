Return-Path: <chin.huat.ang@intel.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Sep 2019 02:21:39 UTC
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB426D470
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 02:21:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2019 19:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,499,1559545200"; d="scan'208";a="192600406"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2019 19:14:35 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Thu, 12 Sep 2019 19:14:35 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
	FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Thu, 12 Sep 2019 19:14:34 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (104.47.40.51) by
	edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Thu, 12 Sep 2019 19:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KcEVUIZqCh+QYq61CvVR9pluNydSZh+QG4xz6QZ35tNaDMKJrLzljAOkV0SIXFAcDd+ERuokXkdQcz5NZLXPL6EznCAInOhjojxUEp50FYWvJhYoTlmRW9RvwWXHovk12rw73mcpHfwCYf4W+g/pZRY3OPcn7Zjk4DSg+U8vxAS406VjBMwZ6cRAwG7aDh9KpgoF1cM/ErhN5psVmbdeG1lWjLTkjWtNlb+mL7aWr4y1wb3AppP+/Sq5qaDvkhUZQ3BhCK9QVUwzVv0qJJqvEoyHMfvitFcoD6ANNhG/gMxKYq6nZ8w8VtmGuMNNPHw763MB1CDADhW2MPzGbNfDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GwRkPUjgGU3/U1P0kh1AZf9y2sZAkMKqk246dJ3Ds+g=;
	b=LFGs3ugTPftM+nMjzop41U3Yd7MB3jnciK66A1d9i88XGH8YtPVsAWhHFxhLRMSB5ocmriOSL2y8Ubgc5Ra5eQaQODB9bzh5mxbWNFH4UHhjvO9rXaZQLsUDoqsk/V/fRrmPOn63lpXTXkAcwwuNBTe6yNLCf6KwdEoSyetqv1pnc2SWzNN4t0xyb4mxRsHrnBvdxsKV1HAGlnmkeCXRH5vJBlHSGvt9HraMvfa3QRXw5TOineV8CTs7crv5k9YCUjDaLFYykcHXdP58jv8ERwmWF+SN7SaRIZqXbAeW5mIxtdZjGQxNKBtCH4LXT6+pcb/9lPXXRzLOwRtr1Du6DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com; 
	dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector2-intel-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GwRkPUjgGU3/U1P0kh1AZf9y2sZAkMKqk246dJ3Ds+g=;
	b=B4XDfkqL41sYWSrmqRLJmMbHelkgGW8rIBDNLRxwis69XdDqYgjXr5p5tzEdO/ZPEmQFCfU5t06bmtthSSANDaI8cltTQNZ6j2AtWjNK5F+eqtu4gNLB02ORNB5xPKWheLYs4hGRxhntupBjiGgG3YpDEpz9VQKWg6siCdD1Oeg=
Received: from DM6PR11MB3436.namprd11.prod.outlook.com (20.177.220.29) by
	DM6PR11MB2796.namprd11.prod.outlook.com (20.176.100.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.18; Fri, 13 Sep 2019 02:14:32 +0000
Received: from DM6PR11MB3436.namprd11.prod.outlook.com
	([fe80::6c56:49b7:8bc0:10d6]) by
	DM6PR11MB3436.namprd11.prod.outlook.com
	([fe80::6c56:49b7:8bc0:10d6%3]) with mapi id 15.20.2241.018;
	Fri, 13 Sep 2019 02:14:32 +0000
From: "Ang, Chin Huat" <chin.huat.ang@intel.com>
To: "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/9] uefi.bbclass: add bbclass holding
	configuration for UEFI applications
Thread-Index: AQHVaIOWtzn1hzvat02uomBZo9HYt6co4K7g
Date: Fri, 13 Sep 2019 02:14:32 +0000
Message-ID: <DM6PR11MB343694FD68FA565D1B1C6628A3B30@DM6PR11MB3436.namprd11.prod.outlook.com>
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
In-Reply-To: <20190911093001.7849-1-dbaryshkov@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chin.huat.ang@intel.com; 
x-originating-ip: [192.198.147.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 707612c8-0cb6-4121-6db8-08d737f01d81
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:DM6PR11MB2796; 
x-ms-traffictypediagnostic: DM6PR11MB2796:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR11MB2796E34DD3C74DCD7B56CFA8A3B30@DM6PR11MB2796.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(396003)(346002)(366004)(136003)(199004)(189003)(13464003)(966005)(33656002)(76176011)(478600001)(26005)(2906002)(66476007)(11346002)(8936002)(2501003)(81166006)(486006)(186003)(71200400001)(71190400001)(66066001)(76116006)(6116002)(446003)(53546011)(64756008)(66446008)(66556008)(7736002)(25786009)(3846002)(6506007)(102836004)(74316002)(316002)(52536014)(66946007)(305945005)(81156014)(476003)(14454004)(99286004)(256004)(6436002)(4326008)(229853002)(55016002)(6306002)(9686003)(86362001)(53936002)(110136005)(5660300002)(7696005)(6246003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR11MB2796;
	H:DM6PR11MB3436.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5KbB3bmclOb2JlRwG9F36JCZYHoNxq5YeJLw2OMopertKst5JtKsxSBo5Wsqk5ne5ERkWoMak1iZSJahew4gxF997ajd/QDCbIh7Zfv+WLyJrxGiyXBXLd51c2oqm5Ybg1+XkvvOo85CML396O9wihc3A9KW6EFOJU2mbZ1FcYK+WmUIBmx3fZ3hEyWjmITNiaxnLobbDtGqVZNeVl7psI/mmq4wZ4Mjey8M1AU83Nf/4/FQQewEy98tUZO4NOx6csxXMCWDsT/BHbU71teMVNHt6ixAmPfM8GgJmp9RHduCAvEBUXfmfMWOVRIYPtGIpEySZaHnjrLpTGCB/Plpu2tnOKqMoToS2bA09DfhXYF3t29Dil1lvjaG4hCPpMfPgRXUz/yXSCrgQvlIp0wN9kW6nH4DPP2HlCGzjS4aYL4=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 707612c8-0cb6-4121-6db8-08d737f01d81
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 02:14:32.1615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uH8w4MwVtVNC4hrNC7LYH3OzR/Z3tlw8fS8ZXaRULsgKKVH+FxTin5pL7+Vn+J8RT6/P4WOZEpzQxMXTIZTUaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2796
X-OriginatorOrg: intel.com
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: Re: [PATCH 1/9] uefi.bbclass: add bbclass holding	configuration for UEFI applications
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2019 02:21:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> +        image =3D "bootUNKNOWN.efi"

It might be better to raise an error here.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> On Behalf Of dbaryshkov@gmail.com
Sent: Wednesday, September 11, 2019 5:30 PM
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [OE-core] [PATCH 1/9] uefi.bbclass: add bbclass holding configurat=
ion for UEFI applications

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Create new bbclass defining common variables for all UEFI-related packages =
(bootloaders, test applications, etc).

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/uefi.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/classes/uefi.bbclass

diff --git a/meta/classes/uefi.bbclass b/meta/classes/uefi.bbclass new file=
 mode 100644 index 000000000000..d3fc4b686676
--- /dev/null
+++ b/meta/classes/uefi.bbclass
@@ -0,0 +1,26 @@
+# Location of EFI files inside EFI System Partition EFIDIR ?=3D=20
+"/EFI/BOOT"
+
+# Prefix where ESP is mounted inside rootfs. Set to empty if package is=20
+going # to be installed to ESP directly EFI_PREFIX ?=3D "/boot"
+
+# Location inside rootfs.
+EFI_FILES_PATH =3D "${EFI_PREFIX}${EFIDIR}"
+
+# Determine name of bootloader image
+python __anonymous () {
+    import re
+    target =3D d.getVar('TARGET_ARCH')
+    if target =3D=3D "x86_64":
+        image =3D "bootx64.efi"
+    elif re.match('i.86', target):
+        image =3D "bootia32.efi"
+    elif re.match('aarch64', target):
+        image =3D "bootaa64.efi"
+    elif re.match('arm', target):
+        image =3D "bootarm.efi"
+    else:
+        image =3D "bootUNKNOWN.efi"
+    d.setVar("EFI_BOOT_IMAGE", image)
+}
--
2.23.0

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.6305.1591706836081881107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 05:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=sBg/gy2S;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: FHr4vyKZM1K4+FLK4WEGrIeeQXu6fRISuasMj0THAfJW1GyCdIDZFgTNNQsFND/gW1eCp3XKZm
 TO9Nr1wg8kUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 05:47:15 -0700
IronPort-SDR: z+/qTfTQwhHZX0sZsO3K22jZCI2i24vpHLQXxx+dxmmo8N2bcLHr64YCtXgUIRi6oKiBfW2gXG
 IKVgj8hOv7ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,492,1583222400"; 
   d="scan'208";a="472957397"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
  by fmsmga006.fm.intel.com with ESMTP; 09 Jun 2020 05:47:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 9 Jun 2020 05:47:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jun 2020 05:47:14 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jun 2020 05:47:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 9 Jun 2020 05:47:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeBbFgkVs5FL1OHRIzze1EYopXNXXwNSkZ0L4kOrvSl3SsNeWPmZIUJ0Mujiq1u9OFAmoX8tBFRZNlORHMi6Dx0JAW3CcbwiHQa3pXzaPlvMesHizruzWMzCO83iOun09IDZfelzqtWOsJNL8MBteJKS4HjJF6PQDtIcuDFpAY+QCG8LmQWRTCO9vkIHGJSevFIAykBkulvF6qm82V/Cf74PQsKST1opbG+dhyqBpOz7TAF+YaZfWn3rko9pO1cBVamIWRGHOifyc5HQWpBsE3yPZlGsXPNsiv+H2UMfVOkZOjgzfj3qDWnZEZLDPeT8iU7FygQht49aE0koVrssHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAp3yrftz5vzi92IuCYKPPTKD0qsVSzi0CdF7j5cM4E=;
 b=DVFLTppVlJOxu3bWR4J3g1wVFI8boJZPrCeFEJ0jK2dxlT5DSXqLiNZOcEBlrYWKrW8/IN/+EGAY+0QNabf88gzdvCDxv89VYz7WZtQhjgr5jSY/MeuvFabxZ3AWZMkpuOkNe4Gv92GujyETy9y1EI5Os3G9doMdj79PDDSayvbDZ2YITd8JHGAWQPe2sWbBqc3BXUuTy514yy/zuFWfolwnbyDdCbqzd3J0RlLTwOi8jc6GKyVUEGRlZbqlQRjorZaZT0eeopZUBTyi7Gn3xFjpgeQHFaxDO5Bih2qlduuOkXarT14K1RHE2hkzZuqymEfBr+1Dbhxl0PtOQ2eTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAp3yrftz5vzi92IuCYKPPTKD0qsVSzi0CdF7j5cM4E=;
 b=sBg/gy2SVStBn1bgramWbPfSWDIj7HciDvJUoFSrIGKTxhqfNa98gwfTeU8j0v1Eu1XgFBqeXHrLcHCv7js6aRzRU3eQ6IaIySRGG8qhv8ZOaxWMP1YbkzWQhk5yCQJGrWL6cgFCKO/Gz08ahenpJUTPzdU4v9ZBGHEcXEppQBw=
Received: from BN6PR11MB0066.namprd11.prod.outlook.com (2603:10b6:405:67::18)
 by BN6PR11MB1364.namprd11.prod.outlook.com (2603:10b6:404:48::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Tue, 9 Jun
 2020 12:47:11 +0000
Received: from BN6PR11MB0066.namprd11.prod.outlook.com
 ([fe80::2422:fa19:aa22:88eb]) by BN6PR11MB0066.namprd11.prod.outlook.com
 ([fe80::2422:fa19:aa22:88eb%3]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 12:47:11 +0000
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] qemu: fix CVE-2020-13361
Thread-Topic: [OE-core] [PATCH] qemu: fix CVE-2020-13361
Thread-Index: AQHWOBpOkTr5WubN00iVohNIPROHuqjQRv/g
Date: Tue, 9 Jun 2020 12:47:11 +0000
Message-ID: <BN6PR11MB006643A35F151FE1CA418A8CB9820@BN6PR11MB0066.namprd11.prod.outlook.com>
References: <16146F34B9581E55.10126@lists.openembedded.org>
In-Reply-To: <16146F34B9581E55.10126@lists.openembedded.org>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b26c845b-0264-4f87-83ce-08d80c733a59
x-ms-traffictypediagnostic: BN6PR11MB1364:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB13640A291DF44CEF6AE3C13FB9820@BN6PR11MB1364.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H/6ECVK+nY1ZuyKARHNV1eWmF1BGUbh0+OgnEJpvcKasZDwy15FvgGaeYZ3kjOkdOMpfYWOZujzM+16Jz4Ccgjs3rDyVMP6emN59OTzz4FHjAwkGSJ+TPv6YSEV5vN9QYCdShMKUWzJ2zmQdIn1LbEw1h/COw6u1nLGxyG5ksLL18tgoQDLGkBxBz6rLw43fhpVomyNI2FB4kPketGfgAT+FfXN1lVuY2e7l1+tKUwPxU1dsQD/9OClnCY2KMAMTjUZT11VGlotg+Yv8UcVX8YVqjBduqdI9leTpkUAz1jbCInNfN5i+5ZougT4CextBY63Z2VUNsGXlk6pc+tYhbAwIoRuxGV2sDOSwmxkT5I6pmPP+Hz+DSKVz/S6oR9fqP54JspYgGQUcx7jYxNVhCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0066.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39860400002)(366004)(396003)(6506007)(478600001)(5660300002)(33656002)(110136005)(66476007)(66556008)(76116006)(86362001)(66946007)(52536014)(64756008)(66446008)(83380400001)(7696005)(71200400001)(8676002)(9686003)(53546011)(26005)(55016002)(8936002)(2906002)(186003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Htf4bzkz1j1hgNM84p0KTOf2BIS8SRZvzEfD2R+5/okJ5bvjXHen5KC5nA+foRRGxF28IYIlvaChAItoRNt1/Do+dDH+vP2W/tVh0V1BoujBg/S1dqyIKNPckMNQGyXfyiR2OgkRBQHnE0JqzD6GZ7QOZ7BX/ZvwbwxM5RMCEsO/p9FZrKBa8QmRCkMiKM1+jNhzTCCBIeSrnwmW9XUInNa+BTkG4JeybGKnKbDV/PSudMFazG1k1f1+H4xZpmI2b38KwpEYucFf/YdxpGvlOQn+/dZkLd9HM5UTp86SG93zYt1zSwgk/LdnMjB1yfCkZJ+J8wZbqI4154vveAN6A4R7/jte4nW5up1j1wGWvBuuWa3GJR8FjQeXuOE5xnQKZ1X0vF3IO8L6qBPVvzoG4gt7NzvnNHT9yZigWt00Aa5ydCmspGvbOZ8qXZWDe8dRYFUeqJgkfwZcW3PYwhJYxP4a5OyF9tPa5ul0Ob7SZR68ViIIko5D3UHLYTLufU2y
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b26c845b-0264-4f87-83ce-08d80c733a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 12:47:11.2082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMicKrfBgpgN7ErORQ9V6AmefhxoD3SXSXlYO+oVXsYTfgaQqdwScDxNpnCQ5WJKkgRSStNQge4oMzGOKht2JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1364
Return-Path: chee.yang.lee@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping=20

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Lee Chee Yang
Sent: Monday, June 1, 2020 9:41 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] qemu: fix CVE-2020-13361

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 .../qemu/qemu/CVE-2020-13361.patch                 | 61 ++++++++++++++++++=
++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 126e7d4..3e50069 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
 	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://CVE-2020-11102.patch \
 	   file://CVE-2020-11869.patch \
+	   file://CVE-2020-13361.patch \
 	   "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch b/meta/re=
cipes-devtools/qemu/qemu/CVE-2020-13361.patch
new file mode 100644
index 0000000..e0acc70
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch
@@ -0,0 +1,61 @@
+From 369ff955a8497988d079c4e3fa1e93c2570c1c69 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Fri, 15 May 2020 01:36:08 +0530
+Subject: [PATCH] es1370: check total frame count against current frame
+
+A guest user may set channel frame count via es1370_write() such that,=20
+in es1370_transfer_audio(), total frame count 'size' is lesser than the=20
+number of frames that are processed 'cnt'.
+
+    int cnt =3D d->frame_cnt >> 16;
+    int size =3D d->frame_cnt & 0xffff;
+
+if (size < cnt), it results in incorrect calculations leading to OOB=20
+access issue(s). Add check to avoid it.
+
+Reported-by: Ren Ding <rding@gatech.edu>
+Reported-by: Hanqing Zhao <hanqing@gatech.edu>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20200514200608.1744203-1-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport=20
+[https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg03983.html]
+CVE: CVE-2020-13361
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/audio/es1370.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c index=20
+89c4dabcd44..5f8a83ff562 100644
+--- a/hw/audio/es1370.c
++++ b/hw/audio/es1370.c
+@@ -643,6 +643,9 @@ static void es1370_transfer_audio (ES1370State *s, str=
uct chan *d, int loop_sel,
+     int csc_bytes =3D (csc + 1) << d->shift;
+     int cnt =3D d->frame_cnt >> 16;
+     int size =3D d->frame_cnt & 0xffff;
++    if (size < cnt) {
++        return;
++    }
+     int left =3D ((size - cnt + 1) << 2) + d->leftover;
+     int transferred =3D 0;
+     int temp =3D MIN (max, MIN (left, csc_bytes)); @@ -651,7 +654,7 @@=20
+static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loo=
p_sel,
+     addr +=3D (cnt << 2) + d->leftover;
+=20
+     if (index =3D=3D ADC_CHANNEL) {
+-        while (temp) {
++        while (temp > 0) {
+             int acquired, to_copy;
+=20
+             to_copy =3D MIN ((size_t) temp, sizeof (tmpbuf)); @@ -669,7=20
++672,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *=
d, int loop_sel,
+     else {
+         SWVoiceOut *voice =3D s->dac_voice[index];
+=20
+-        while (temp) {
++        while (temp > 0) {
+             int copied, to_copy;
+=20
+             to_copy =3D MIN ((size_t) temp, sizeof (tmpbuf));
--
2.7.4


Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
	(mail-eopbgr1400131.outbound.protection.outlook.com [40.107.140.131])
	by mail.openembedded.org (Postfix) with ESMTP id C6E957ED62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:07:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Du171lRhbJkU2deVUzpM5S8IQjgTEIafQLJTwXlnDc/Wl3T5Ua48EXyrzb4rSXvg2w46WkjKDXyUe2Fr4XV5k7faJbTAXPUsp0bDHHnTshIYebCxS9bV4vHM7X+MNbstov2pjevpXbp0iqO0EmSU1dKLjNGhark0TFYqmgxFbavfY9Ytv7KRXJzwKBvRvCW4Z8CwCebzOX3ig5E59xfHH73t27UqvFHFUXYkhlseUH13KxLHk9X2wdCRLYbFuaPfYivjlIRTN3OTA9Zy6uAj1kMpIUVx+NjjU5JIzMbP7UftztGWK/MJRRFO6EjhWxLQHs7/BG1s8jAUzHuPQickMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3ObNlvTCmXzUkygw0FC4Zd7GY1L+w9dQczN00VGMVvA=;
	b=R9j+8ImaptuwQHpVggxL0y3Vr+A2IjtwIwYoHRa1EGO4Q6y+7qSO3HP7pOlvHWR3zD0R481dzDA4cF10vmJD7tiu+/YfY6Vr8rRRdjzGpGCnq6mxzZVl8/jPzypchSejZtTuEhpiCH2nO3ZGqymRvOQkHBeU94Z0sv54TS/LPI26sZf9Ow6rNz4Gq0c5v7vIhOa8EJrm0WhcSPFBizc6o5Vfzq4+HFjorHqe/iVyllpMGml/FfVBSZRazNmL/KzkE5RX3mff82qtmfCOyI5srHtj9b10BP+SZIELGhJYoMbklxYSwJL/Dj9CuBSXc32mNWhcyiDHX+l3LMpLEOXTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector2-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3ObNlvTCmXzUkygw0FC4Zd7GY1L+w9dQczN00VGMVvA=;
	b=hdXw1CHFx5IT+GjCyIr7SnGPNLIBF83EKzaWMERSgh0vl0JSNs66dVTYBIWcAR5hBAROUJUsy8Q7qqanlAc3/RPZUz+YG5ESh0lecaMe1e53BSw6bAYQDRmvl/98jZp02OsVzSHim/NWGH5MVozqI/Oi44IL7rXVUkxxfbT+QrY=
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com (20.177.101.86) by
	TYAPR01MB5199.jpnprd01.prod.outlook.com (20.179.174.76) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.21; Wed, 28 Aug 2019 05:07:46 +0000
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::6869:1670:e5fc:4dcb]) by
	TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::6869:1670:e5fc:4dcb%7]) with mapi id 15.20.2199.021;
	Wed, 28 Aug 2019 05:07:46 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] runqemu: Fix guest has not initialized error
Thread-Index: AQHVXV6IigcWfLonEkKGfKGntVg8nA==
Date: Wed, 28 Aug 2019 05:07:46 +0000
Message-ID: <20190828050833.14595-1-shohei.maruyama@cybertrust.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYAPR01CA0029.jpnprd01.prod.outlook.com
	(2603:1096:404:28::17) To TYAPR01MB3007.jpnprd01.prod.outlook.com
	(2603:1096:404:7f::22)
x-mailer: git-send-email 2.23.0
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dc7b7c5-5031-491b-25ce-08d72b75aa74
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:TYAPR01MB5199; 
x-ms-traffictypediagnostic: TYAPR01MB5199:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB5199F32B55FA903ED730A2DDD6A30@TYAPR01MB5199.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(199004)(189003)(6512007)(6116002)(6436002)(316002)(86362001)(2616005)(14454004)(476003)(486006)(5660300002)(36756003)(66946007)(8676002)(8936002)(5640700003)(25786009)(2351001)(3846002)(1076003)(53936002)(107886003)(6486002)(7736002)(46636005)(64756008)(2906002)(66476007)(66446008)(66556008)(26005)(52116002)(186003)(50226002)(99286004)(71200400001)(71190400001)(478600001)(102836004)(386003)(6506007)(14444005)(4326008)(256004)(2501003)(81166006)(81156014)(66066001)(6916009)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB5199;
	H:TYAPR01MB3007.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FYBIyC8CZ5glTfUnl6Zq6wftnxkllzm/aLMXUdYLLQs/K8ScIy39DLrmdzEZKQMiTOpA/m0oolVowJkQgqkrTDFWGrP2JkBHeiNMQcM8Uc1o2AME1xPGT7Vpfd8jwuIveSM4shyBZjd3fqA0MjAem/UY4OzuQW2TXwBAw1uz7OFl9CLQ4CN0Y88mGekjXlzRSa8kGzDfljG0DOhmLJVWNkOSiERwZ7coUIQaKhmNHCCGctx6z5OXteHCDrFhlwAMKa6r53FnkgCQvRE2S9KWTraTcLthM+sQlE/4/mSOZpJsGv+HXcKDCIlbkNvruLiKCKFFcgY8TS5ZmXyDWLf/bqUGtjE4MHBG9LZhRJNoHY7JFeACEfb7a/iwnuTH8xCdrdzG9bDhM7gQF4Zel+moYkb+WG36IDkKRFYAhNqrQ5Y=
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc7b7c5-5031-491b-25ce-08d72b75aa74
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 05:07:46.8320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SxMe8rz9vUpY5dP4NNx1KSO3fklHzbF2RD3DSfMQHKlSNG8iPSr9KOFmK7d33mHY+nCzmgYJpH5LalDQbvsMGwjViH7G2M4Y9/Av/ZKW8GcWCgCTVinFfiDJKhdpE6Wy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5199
Subject: [PATCH] runqemu: Fix guest has not initialized error
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
X-List-Received-Date: Wed, 28 Aug 2019 05:07:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

By default qemu use -device VGA,edid=3Don but in some case cannot use
display because of it.
---
 meta/conf/machine/qemuarm64.conf | 2 +-
 scripts/runqemu                  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64=
.conf
index 5c8aac1511..2c6d4dfc98 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -17,7 +17,7 @@ QB_CPU =3D "-cpu cortex-a57"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND =3D "console=3DttyAMA0"
 # For graphics to work we need to define the VGA device as well as the nec=
essary USB devices
-QB_OPT_APPEND =3D "-show-cursor -device VGA,edid=3Don"
+QB_OPT_APPEND =3D "-show-cursor"
 QB_OPT_APPEND +=3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entro=
py
 QB_OPT_APPEND +=3D "-object rng-random,filename=3D/dev/urandom,id=3Drng0 -=
device virtio-rng-pci,rng=3Drng0"
diff --git a/scripts/runqemu b/scripts/runqemu
index 28ecee97a7..d4ff5b9eb9 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -397,6 +397,8 @@ class BaseConfig(object):
                 self.kernel_cmdline_script +=3D ' console=3DttyS0'
             elif arg =3D=3D 'sdl':
                 self.qemu_opt_script +=3D ' -display sdl'
+            elif arg =3D=3D 'gtk':
+                self.qemu_opt_script +=3D ' -device virtio-gpu-pci'
             elif arg =3D=3D 'gtk-gl':
                 self.qemu_opt_script +=3D ' -device virtio-gpu-pci,virgl=
=3Don -display gtk,gl=3Don'
             elif arg =3D=3D 'gtk-gl-es':
--=20
2.23.0



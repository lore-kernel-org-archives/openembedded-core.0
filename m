Return-Path: <Arturo.Buzarra@digi.com>
X-Greylist: delayed 424 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Nov 2017 09:08:35 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.7])
	by mail.openembedded.org (Postfix) with ESMTP id 4772C7851A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 09:08:35 +0000 (UTC)
Received: from [216.82.251.39] by server-7.bemta-12.messagelabs.com id
	68/63-02224-D69140A5; Thu, 09 Nov 2017 09:01:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleJIrShJLcpLzFFi42Jx8l0noJsjyRJ
	lcOuUmcX57S/ZLO78fMfuwOSxeM9LJo9zG1cwBjBFsWbmJeVXJLBmLNvezlpwTbaif9omlgbG
	ZVJdjJwcQgIrGSUmHFDpYuQCshczSizZ3ckCkmATMJT42DsTzBYR6GOU6D4oA2ILC2RKrDr3h
	REiniXx58hndgjbSOLe4g9gcRYBFYm+q8eYQGxeAV+J01P+sEMss5bYsOsoUJyDg1PARuL7Mz
	MQkxGofML+YpAKZgFxiVtP5oN1SggISCzZc54ZwhaVePn4HyuErSCxdNExVoh6HYkFuz+xQdj
	aEssWvmaG2CoocXLmExaIrSoSz58vZ5/AKDILyYpZSNpnIWmfhaR9ASPLKkaN4tSistQiXRMz
	vaSizPSMktzEzBxdQ0MjvdzU4uLE9NScxKRiveT83E2MwDipZ2Bg3MF4dWH0IUZJDiYlUd4Hr
	5iihPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwlkuwRAkJFqWmp1akZeYAIxYmLcHBoyTCOwkkzV
	tckJhbnJkOkTrFqMvxbObrBmYhlrz8vFQpcV5NkCIBkKKM0jy4EbDkcYlRVkqYl5GBgUGIpyC
	1KDezBFX+FaM4B6OSMK8eyBSezLwSuE2vgI5gAjoimh3siJJEhJRUA6Pe1nV2CR//zlS/wssd
	WXop4KGSwQKTlYufNFa2Hm87OVObZd3RXd+FAv5kreF3TRRsW/WqcSqf8VexLxE9gurptbPmH
	/I9++5rgf+5A7aWl/Uvvyi9KnFxX4a53bb+Bk/P3peP3fWuP89TCDp2y/euyo6T9Vl/4jYWsv
	W9bDtvlcusoSDCUarEUpyRaKjFXFScCABM1wYhGQMAAA==
X-Env-Sender: Arturo.Buzarra@digi.com
X-Msg-Ref: server-4.tower-164.messagelabs.com!1510218092!54498410!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 105912 invoked from network); 9 Nov 2017 09:01:32 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-4.tower-164.messagelabs.com with SMTP;
	9 Nov 2017 09:01:32 -0000
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 9 Nov 2017 03:01:29 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0361.001;
	Thu, 9 Nov 2017 10:01:28 +0100
From: "Buzarra, Arturo" <Arturo.Buzarra@digi.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>, "'maxin.john@intel.com'"
	<maxin.john@intel.com>
Thread-Topic: [OE-core] [PATCH][jethro] bluez5: fix out-of-bounds access in
	SDP	server (CVE-2017-1000250)
Thread-Index: AQHTU+JFjMngKn8LBki6veju5w2hxKMLyKTw
Date: Thu, 9 Nov 2017 09:01:28 +0000
Message-ID: <1F1C12BB7E7BAA40ACCAD76309F0BEC30171A45D@dor-sms-xch01.digi.com>
References: <20171102134726.6925-1-arturo.buzarra@digi.com>
In-Reply-To: <20171102134726.6925-1-arturo.buzarra@digi.com>
Accept-Language: es-ES, es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.111]
MIME-Version: 1.0
Subject: Re: [PATCH][jethro] bluez5: fix out-of-bounds access in SDP	server (CVE-2017-1000250)
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
X-List-Received-Date: Thu, 09 Nov 2017 09:08:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

(ping) for this backport patch.

Thx.
-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Arturo Buzarra
Sent: Thursday, November 02, 2017 14:47
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH][jethro] bluez5: fix out-of-bounds access in SDP =
server (CVE-2017-1000250)

From: Ross Burton <ross.burton@intel.com>

All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to =
an information disclosure vulnerability which allows remote attackers to ob=
tain sensitive information from the bluetoothd process memory. This vulnera=
bility lies in the processing of SDP search attribute requests.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7351e0b260876b9bbc8660c2bb4173ab4c130f8b)
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 .../bluez5/bluez5/cve-2017-1000250.patch           | 34 ++++++++++++++++++=
++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-100025=
0.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-con=
nectivity/bluez5/bluez5.inc
index d1af31ea45..d5b86c7925 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -19,6 +19,7 @@ PACKAGECONFIG[experimental] =3D "--enable-experimental,--=
disable-experimental,"
 SRC_URI =3D "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Al=
low-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
+    file://cve-2017-1000250.patch \
 "
 S =3D "${WORKDIR}/bluez-${PV}"
=20
diff --git a/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch=
 b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
new file mode 100644
index 0000000000..9fac961bcf
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
@@ -0,0 +1,34 @@
+All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable=20
+to an information disclosure vulnerability which allows remote=20
+attackers to obtain sensitive information from the bluetoothd process=20
+memory. This vulnerability lies in the processing of SDP search attribute =
requests.
+
+CVE: CVE-2017-1000250
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 9e009647b14e810e06626dde7f1bb9ea3c375d09 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Wed, 13 Sep 2017 10:01:40 +0300
+Subject: sdp: Fix Out-of-bounds heap read in service_search_attr_req=20
+function
+
+Check if there is enough data to continue otherwise return an error.
+---
+ src/sdpd-request.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sdpd-request.c b/src/sdpd-request.c index=20
+1eefdce..318d044 100644
+--- a/src/sdpd-request.c
++++ b/src/sdpd-request.c
+@@ -917,7 +917,7 @@ static int service_search_attr_req(sdp_req_t *req, sdp=
_buf_t *buf)
+ 	} else {
+ 		/* continuation State exists -> get from cache */
+ 		sdp_buf_t *pCache =3D sdp_get_cached_rsp(cstate);
+-		if (pCache) {
++		if (pCache && cstate->cStateValue.maxBytesSent < pCache->data_size)=20
++{
+ 			uint16_t sent =3D MIN(max, pCache->data_size - cstate->cStateValue.max=
BytesSent);
+ 			pResponse =3D pCache->data;
+ 			memcpy(buf->data, pResponse + cstate->cStateValue.maxBytesSent,=20
+sent);
+--
+cgit v1.1
--
2.14.2

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


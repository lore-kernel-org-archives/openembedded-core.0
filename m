Return-Path: <amarnath.valluri@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C06B876E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:18:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 06 Nov 2015 05:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844168234"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 05:18:28 -0800
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.151]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.208]) with mapi id
	14.03.0248.002; Fri, 6 Nov 2015 13:18:27 +0000
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe][PATCH 1/2] nginx: Add support for altering
	build	configuration
Thread-Index: AQHRGJV9qVcKOSQOyUKTqrXbzt+Mq56O+g11
Date: Fri, 6 Nov 2015 13:18:26 +0000
Message-ID: <D3C33C4430ACA6488F343D1125FCCECC38033958@irsmsx110.ger.corp.intel.com>
References: <1446815913-9343-1-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1446815913-9343-1-git-send-email-amarnath.valluri@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.135]
MIME-Version: 1.0
Subject: Re: [oe][PATCH 1/2] nginx: Add support for altering build	configuration
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
X-List-Received-Date: Fri, 06 Nov 2015 13:18:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

sorry for noice: please ignore these patches. Wrong list
________________________________________
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Amarnath Valluri [amarnath.vall=
uri@intel.com]
Sent: Friday, November 06, 2015 3:18 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [oe][PATCH 1/2] nginx: Add support for altering build   =
     configuration

Passing EXTRA_OECONF to ./configure, this allows to alter build
configure

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb b/meta-webse=
rver/recipes-httpd/nginx/nginx_1.9.5.bb
index a251523..1c9bff7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
@@ -27,6 +27,8 @@ inherit update-rc.d useradd
 CFLAGS_append =3D " -fPIE -pie"
 CXXFLAGS_append =3D " -fPIE -pie"

+EXTRA_OECONF =3D ""
+
 do_configure () {
        if [ "${SITEINFO_BITS}" =3D "64" ]; then
                PTRSIZE=3D8
@@ -55,7 +57,8 @@ do_configure () {
        --pid-path=3D/run/nginx/nginx.pid \
        --prefix=3D${prefix} \
        --with-http_ssl_module \
-       --with-http_gzip_static_module
+       --with-http_gzip_static_module \
+       ${EXTRA_OECONF}
 }

 do_install () {
--
1.9.1

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki
Business Identity Code: 0357606 - 4
Domiciled in Helsinki

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.



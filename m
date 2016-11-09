Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.45])
	by mail.openembedded.org (Postfix) with ESMTP id EB50571979
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 11:58:41 +0000 (UTC)
Received: from 1c4RWb-0004bW-VP by out10b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1c4RWc-0004d6-Tp; Wed, 09 Nov 2016 03:58:42 -0800
Received: by emcmailer; Wed, 09 Nov 2016 03:58:42 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1c4RWb-0004bW-VP; Wed, 09 Nov 2016 03:58:41 -0800
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0294.000; Wed, 9 Nov 2016 12:58:41 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "Richard Purdie (richard.purdie@linuxfoundation.org)"
	<richard.purdie@linuxfoundation.org>, "Armin Kuster (akuster808@gmail.com)"
	<akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH] curl: Upgrade 7.50.1.bb -> curl_7.51.0.bb
Thread-Index: AQHSOa5efZsyE1G8mkKD7MeVQUhAm6DQi6cw
Date: Wed, 9 Nov 2016 11:58:40 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48ABEB644D@SESTOEX04.enea.se>
References: <1478601718-12481-1-git-send-email-sona.sarmadi@enea.com>
In-Reply-To: <1478601718-12481-1-git-send-email-sona.sarmadi@enea.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.1.188]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Upgrade 7.50.1.bb -> curl_7.51.0.bb
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
X-List-Received-Date: Wed, 09 Nov 2016 11:58:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi guys,

curl 7.51.0-r0 addresses all these CVEs. I wonder if we can upgrade krogoth=
 and morty to curl 7.51.0-r0 as well? Both package versions are using same =
share library version i.e. libcurl.so.4.4.0 so I assume full ABI compatibil=
ity.

tmp/work/i586-poky-linux/curl/7.47.1-r0/sysroot-destdir/usr/lib/libcurl.so.=
4.4.0
tmp/work/i586-poky-linux/curl/7.51.0-r0/sysroot-destdir/usr/lib/libcurl.so.=
4.4.0

For more info see:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10617

Thanks
//Sona
-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Sona Sarmadi
Sent: den 8 november 2016 11:42
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] curl: Upgrade 7.50.1.bb -> curl_7.51.0.bb

The upgrade addresses following CVEs:
CVE-2016-8615: cookie injection for other servers
CVE-2016-8616: case insensitive password comparison
CVE-2016-8617: OOB write via unchecked multiplication
CVE-2016-8618: double-free in curl_maprintf
CVE-2016-8619: double-free in krb5 code
CVE-2016-8620: glob parser write/read out of bounds
CVE-2016-8621: curl_getdate read out of bounds
CVE-2016-8622: URL unescape heap overflow via integer truncation
CVE-2016-8623: Use-after-free via shared cookies
CVE-2016-8624: invalid URL parsing with '#'
CVE-2016-8625: IDNA 2003 makes curl use wrong host

Reference:
https://curl.haxx.se/docs/security.html

Fixes [Yocto #10617]

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/{curl_7.50.1.bb =3D> curl_7.51.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)  rename meta/recipes-suppo=
rt/curl/{curl_7.50.1.bb =3D> curl_7.51.0.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.50.1.bb b/meta/recipes-suppor=
t/curl/curl_7.51.0.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.50.1.bb
rename to meta/recipes-support/curl/curl_7.51.0.bb
index a21419a..e1a996b 100644
--- a/meta/recipes-support/curl/curl_7.50.1.bb
+++ b/meta/recipes-support/curl/curl_7.51.0.bb
@@ -14,8 +14,8 @@ SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar.=
bz2 \  #  SRC_URI +=3D " file://configure_ac.patch"
=20
-SRC_URI[md5sum] =3D "015f6a0217ca6f2c5442ca406476920b"
-SRC_URI[sha256sum] =3D "3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c267484=
334280096e5156"
+SRC_URI[md5sum] =3D "09a7c5769a7eae676d5e2c86d51f167e"
+SRC_URI[sha256sum] =3D "7f8240048907e5030f67be0a6129bc4b333783b9cca1391026=
d700835a788dde"
=20
 inherit autotools pkgconfig binconfig multilib_header
=20
--
1.9.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


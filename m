Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id F382872332
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 12:30:54 +0000 (UTC)
Received: from SESTOEX09.enea.se ([fe80::94d8:372f:210c:b4da]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0224.002; Fri, 16 Jan 2015 13:30:53 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Maxin John <Maxin.John@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] curl: upgrade to 7.40
Thread-Index: AQHQLATxMy+nyZdYEU+bcLwxdhDCrJzCt9aA
Date: Fri, 16 Jan 2015 12:30:53 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E482581DE20@sestoex09.enea.se>
References: <1420805212-62823-1-git-send-email-maxin.john@enea.com>
In-Reply-To: <1420805212-62823-1-git-send-email-maxin.john@enea.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Cc: Maxin John <Maxin.John@enea.com>
Subject: Re: [PATCH] curl: upgrade to 7.40
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
X-List-Received-Date: Fri, 16 Jan 2015 12:30:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Maxin,

Is this related to (URL request injection CVE-2014-8150) http://curl.haxx.s=
e/mail/archive-2015-01/0019.html?
If yes, wouldn't it be better to mention this (the CVE) in the commit messa=
ge?=20

//Sona

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Maxin B. John
Sent: den 9 januari 2015 13:07
To: openembedded-core@lists.openembedded.org
Cc: Maxin John
Subject: [OE-core] [PATCH] curl: upgrade to 7.40

Bump to version 7.40

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/curl/{curl_7.38.0.bb =3D> curl_7.40.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)  rename meta/recipes-suppo=
rt/curl/{curl_7.38.0.bb =3D> curl_7.40.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.38.0.bb b/meta/recipes-suppor=
t/curl/curl_7.40.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.38.0.bb
rename to meta/recipes-support/curl/curl_7.40.0.bb
index 85bd3be..209ed94 100644
--- a/meta/recipes-support/curl/curl_7.38.0.bb
+++ b/meta/recipes-support/curl/curl_7.40.0.bb
@@ -14,8 +14,8 @@ SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar.=
bz2 \  #  SRC_URI +=3D " file://configure_ac.patch"
=20
-SRC_URI[md5sum] =3D "af6b3c299bd891f43cb5f76c4091b7b4"
-SRC_URI[sha256sum] =3D "035bd41e99aa1a4e64713f4cea5ccdf366ca8199e9be1b53d5=
a043d5165f9eba"
+SRC_URI[md5sum] =3D "8d30594212e65657a5c32030f0998fa9"
+SRC_URI[sha256sum] =3D "899109eb3900fa6b8a2f995df7f449964292776a04763e94fa=
e640700f883fba"
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


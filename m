Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 74D0A72C60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 03:14:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56732968"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Jan 2015 11:10:47 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0S3DaEt026214
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 11:13:36 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 28 Jan 2015 11:14:26 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jan 2015 11:14:10 +0800
Message-ID: <1422414850-28982-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [master][PATCH] openssl: upgrade to 1.0.1l
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
X-List-Received-Date: Wed, 28 Jan 2015 03:14:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


| Changes between 1.0.1k and 1.0.1l [15 Jan 2015]
|
|  *) Build fixes for the Windows and OpenVMS platforms
|     [Matt Caswell and Richard Levitte]
|
| Changes between 1.0.1j and 1.0.1k [8 Jan 2015]
|
|     (CVE-2014-3571)
|     (CVE-2015-0206)
|     (CVE-2014-3569)
|     (CVE-2014-3572)
|     (CVE-2015-0204)
|     (CVE-2015-0205)
|     (CVE-2014-8275)
|     (CVE-2014-3570)
|
|  *) Ensure that the session ID context of an SSL is updated when its
|     SSL_CTX is updated via SSL_set_SSL_CTX.
|
|  *) Fix various certificate fingerprint issues.
|
|  *) Do not resume sessions on the server if the negotiated protocol
|     version does not match the session's version. Resuming with a differe=
nt
|     version, while not strictly forbidden by the RFC, is of questionable
|     sanity and breaks all known clients.
|     [David Benjamin, Emilia K=C3=A4sper]
|
|  *) Tighten handling of the ChangeCipherSpec (CCS) message: reject
|     early CCS messages during renegotiation. (Note that because
|     renegotiation is encrypted, this early CCS was not exploitable.)
|     [Emilia K=C3=A4sper]
|
|  *) Tighten client-side session ticket handling during renegotiation:
|     ensure that the client only accepts a session ticket if the server se=
nds
|     the extension anew in the ServerHello. Previously, a TLS client would
|     reuse the old extension state and thus accept a session ticket if one=
 was
|     announced in the initial ServerHello.
|
|     Similarly, ensure that the client requires a session ticket if one
|     was advertised in the ServerHello. Previously, a TLS client would
|     ignore a missing NewSessionTicket message.
|     [Emilia K=C3=A4sper]

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../openssl/{openssl_1.0.1j.bb =3D> openssl_1.0.1l.bb}                  | =
4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1j.bb =3D> openssl_1=
.0.1l.bb} (92%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.0.1l.bb
similarity index 92%
rename from meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.1l.bb
index 2da18ae..840b995 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1l.bb
@@ -38,8 +38,8 @@ SRC_URI +=3D "file://configure-targets.patch \
             file://run-ptest \
            "
=20
-SRC_URI[md5sum] =3D "f7175c9cd3c39bb1907ac8bba9df8ed3"
-SRC_URI[sha256sum] =3D "1b60ca8789ba6f03e8ef20da2293b8dc131c39d83814e77506=
9f02d26354edf3"
+SRC_URI[md5sum] =3D "cdb22925fc9bc97ccbf1e007661f2aa6"
+SRC_URI[sha256sum] =3D "b2cf4d48fe5d49f240c61c9e624193a6f232b5ed0baf010681=
e725963c40d1d4"
=20
 PACKAGES =3D+ " \
 	${PN}-engines \
--=20
1.8.3.1



Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D566161773
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:03:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PP7M2jkpz40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:03:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582318991;
	bh=HRfFIBJ1Qb6eywBVQ1gyHNlv3zzH0URBjCyusPSXiP0=;
	h=From:To:Subject:Date:From;
	b=ByygJtPwO38C6eaF0MfcvXvGMqsilH8dXhBbQ5dxPW1N8Ynjh+wXhjiIg6AfPi3mD
	WPp2Bk8pQZaHfVORjY92w7T+4pI5VSXnTXJsYSZXraMkom0mHtJkEeWqFLQc9+Nc/Z
	YqLrRWagS1wx8v8/bKrmzMj33GqX5dvJckQk+AvSScy4JSKZmiP9GmtXvgY2AMDKqa
	Kz/bWp2ixkWBnxP0iTt1bSKdmh0fRRN9qow+JubVs58Rkvnvs1vIGDxco+GFYIyqle
	8c4c0otnAmttNr6QNBvj3vigQ4/eJGnj7Ha1PjDXSxMvnECxiJ79tivn28UoeTdB2X
	98kcEkRqD47qACE3COCWkoXO3hu/hpKlsM6k/t5bU6ubjWBWPn/mpewQEVA+bcJpsj
	GdB1FJQUZYEDeYpLEZqIIZwJzcKpFvY3TU5taHGTejoSbUdiyxsdxbSI7b67tSyGFS
	I2pzDBALrWGpdYnfaMBOhbwAkKjPypZyf5+yjWHKesYa5SLZuqpiuH8hXAM/qKVlL3
	KD6uXKsvNyrF9wvA2pMXGwp6ky8pjQbZSezquxGmppFF+H+yzorcwJ5+NtSg9na0eJ
	MkoYI+vXlyXEfA58kbVcdoRTBjkK3MRx05UGG+66CfbjGwUmLiY37H1OJOm2rSpwUG
	PJmGReRdk81iAiru1j2YCYnc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 23:03:10 +0200
Message-Id: <20200221210310.3596-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH v2] libsoup: set CVE_PRODUCT
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
X-List-Received-Date: Fri, 21 Feb 2020 21:03:11 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
index b095397ec2..b33a47be6a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
 SRC_URI[md5sum] = "cac755dc6c6acd6e0c70007f547548f5"
 SRC_URI[sha256sum] = "75ddc194a5b1d6f25033bb9d355f04bfe5c03e0e1c71ed0774104457b3a786c6"
 
+CVE_PRODUCT = "libsoup"
+
 S = "${WORKDIR}/libsoup-${PV}"
 
 inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
-- 
2.17.1



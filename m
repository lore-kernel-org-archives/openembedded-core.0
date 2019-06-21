Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 952006C0EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:09:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k11so5829887wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Ext8moSQkZhwmlACCNstX9bIw5qf3V7kKQCStxz+pNw=;
	b=bKt6cMUtIYZKeVwKMc5RcV6a362XhKAcChsy6oB3cXlsz63O31zjBacCXFraJ3oiYT
	6flhdxqFUKmmvIr2dUEzhRm/8SvqwE5p7M+aoXrBX5lx8RcaWHA9s7680pT/5C3Zz55S
	JVnoNMQAlopCBiNfP2XAC7Q/YcH9uKp2Fqv1ll40RVGYGJUNZ4hP76hJ1dzq+CFWmUPa
	SWyc8h/1r3JillwY7IGF5udgNXSv8WTfQCW6ypxwAnI0Wn7D1a+phdI3COzBk3IUKlWo
	FN+s+QGEPR8a2WK2ECbl/p7g+vhSK/v1lfKSARJb+mnwfp2sOtcJRb//GwvNMYD0PJVh
	xs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Ext8moSQkZhwmlACCNstX9bIw5qf3V7kKQCStxz+pNw=;
	b=AdnEFzpXVwJ2NsaqrqmWGl9lBsq4ibQ69VpBSxGBPPLgAEiFA4ojFN6hSKacSbxn/b
	tLwlnHhJAPW+sCsRUKm/D9uRAM2JsAVwujnG1uRh754AMlB2IEshPVB4BMRGZpeaSyAB
	T9el0XjB3nrOcvMm9ZtL8awhnHi8y7FEtl8ZPLZm2JKyW0KElsdxy87PjBSGl45r657E
	oS+UFdmG0Lhpy4wz/arUmNy2SRxluiNdPDKSkG3QkvLvK5kKf2dlzIDa+4BEqOuu/zTF
	+L2qxE5UqPx6QBdFl8/DcN4e8QTaafUMZRrDEjUGpVLLNtu4MVP+woWDvSWTSSpDk4A7
	vjzw==
X-Gm-Message-State: APjAAAUZqNUPxYgJoHCfrvcocHSHLI+rZLE927NVSYk05JnP+fhKyOHE
	RHMv3n+OyLAMY71gVVIgujcavDCAn+E=
X-Google-Smtp-Source: APXvYqx2LUAaea/ib4TzA147ip6pp05PGZTTjUIztwyAc/n5hU5GTxDE4qz6oUXsHqnLFvbk+tQDWw==
X-Received: by 2002:adf:e910:: with SMTP id f16mr2751837wrm.183.1561108196388; 
	Fri, 21 Jun 2019 02:09:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id b6sm1560707wrx.85.2019.06.21.02.09.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jun 2019 02:09:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 10:09:54 +0100
Message-Id: <20190621090954.2313-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pigz: bump alternative priority
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
X-List-Received-Date: Fri, 21 Jun 2019 09:09:56 -0000

As pigz is compatible with gzip, but better performing, if it is installed it
should be used by default.  Currently gzip has priority of 100 but pigz has
priority of 80, so gzip is still used by default.

Change the pigz priority to 110 so that it wins of gzip.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/pigz/pigz_2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pigz/pigz_2.4.bb b/meta/recipes-extended/pigz/pigz_2.4.bb
index 6d62ce6cc55..8c65ec34f06 100644
--- a/meta/recipes-extended/pigz/pigz_2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.4.bb
@@ -38,7 +38,7 @@ do_install_append_class-native() {
 	ln -nsf gzip ${D}${bindir}/zcat
 }
 
-ALTERNATIVE_PRIORITY = "80"
+ALTERNATIVE_PRIORITY = "110"
 ALTERNATIVE_${PN} = "gunzip gzip zcat"
 ALTERNATIVE_${PN}_class-nativesdk = ""
 ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
-- 
2.11.0



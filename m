Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id C4DC36FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 00:29:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 0A2FC2057D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 20:20:33 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute2.internal (MEProxy); Tue, 19 Jul 2016 20:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=apQtIC8QKSEUG7eSsGsPTNR9BQw=; b=qw3k+
	AaVip23kTg6q97gACpksRcmRs3bYWlVqWRDtppGxKp7y92wAuHO2mjlKqaxGOCwg
	+Q1dIr7G9rEjMMJ8JFn3zOaLLi4biqi9hKv4KM0yPrXKoN+AJP7QuP5w1PTx6vCJ
	fUNQlofmo7oaC5udV4/Nlrffezml8ZU8uI3ohI=
X-Sasl-enc: ouFdS+ALSdN5TlZioVjF7SKJoCwHjMySgz0E9ivVpVih 1468974032
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 73095CCD81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 20:20:32 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 03:20:21 +0300
Message-Id: <2ff582728a1916c2cd6b44340250b98fd0648569.1468973641.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1468973641.git.tanuk@iki.fi>
References: <cover.1468973641.git.tanuk@iki.fi>
In-Reply-To: <cover.1468973641.git.tanuk@iki.fi>
References: <cover.1468973641.git.tanuk@iki.fi>
Subject: [PATCH 1/3] libsndfile1: 1.0.26 -> 1.0.27
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
X-List-Received-Date: Wed, 20 Jul 2016 00:29:28 -0000

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../libsndfile/{libsndfile1_1.0.26.bb => libsndfile1_1.0.27.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.0.26.bb => libsndfile1_1.0.27.bb} (83%)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.27.bb
similarity index 83%
rename from meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb
rename to meta/recipes-multimedia/libsndfile/libsndfile1_1.0.27.bb
index 80435d4..ec41719 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.26.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.27.bb
@@ -7,8 +7,8 @@ LICENSE = "LGPLv2.1"
 
 SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ec810a0c60c08772a8a5552704b63393"
-SRC_URI[sha256sum] = "cd6520ec763d1a45573885ecb1f8e4e42505ac12180268482a44b28484a25092"
+SRC_URI[md5sum] = "fd1d97c6077f03b5d984d7956ffedb7a"
+SRC_URI[sha256sum] = "a391952f27f4a92ceb2b4c06493ac107896ed6c76be9a613a4731f076d30fac0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
-- 
2.8.1



Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 151536BAAB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:36:20 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id e11so14697923plt.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=m2Ja2c1YMt58UpVNnNavEEeblNhvXPEijyzG6CwwrSo=;
	b=nSrbn8tw2PiL3NQ5bb/GC0r2jcAVV0pYs14YtbxwYCP7J35mr2y4bCAeV355XIHgJl
	+pPhP11SbJ5R3lcW0EalbIwSP2YPsqsg8VvRDGHpKp2VCoNeEUmHkuekZyF72Cv+UtLF
	Pwcrq5wi90ymz84PypirukVE13f8ZDocfV4o9hKGCwpSAVhL2WSoTWoEfmeCQDPOM9OY
	FUML2JMTglfJwz3zvUPQuM4cUZPiNpOQ5pZtnLBobNtC+7F6mFKKjgbSTRSoizHVMO1o
	2lyECib/Po7YW7Os5tHoiX2gVXdAljZ4zQ1fkwI9LHX//poZ/8w+9QJoZkruouf/seiU
	e2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=m2Ja2c1YMt58UpVNnNavEEeblNhvXPEijyzG6CwwrSo=;
	b=Mp8on3p1RkOLbXPRnxtRftDOMOxTjS2PPwxjcP2k7dTRExxzvTb8V2gMNQe0F6+UiT
	fVUuSQT2f8YcQNoafSl4loESQg/FdXATIIbk3yUBdAWUnLQ1vd3vZg4/qf1MuujSvu0J
	KLn9ctV5jhb0vIvHaJLwpgoEys5rbJkVK/ChVsjX7IARuweq+FpUxaCUHD7BlC4UMnNm
	uL+7AkUFvRO4JJfaHdwcRZ8AtuV4QP5rIuZETlWZsIXTQgucecYTL2+u+jgmA8ay5GVT
	0S5fltaDyIFSNcef72QUtIquBI9PBTqw6tGkJ3qWsUoTXA0V9hLvFvtlbRIRWptz1yt+
	qOVQ==
X-Gm-Message-State: AJcUukc+XWSNqaXwjbZvMr5FCjrAluYQS0bowQ8M1VhAe9Ktuxv/TNPc
	/f5N0EEh1xYvRGImbsY0ckGLIjGF
X-Google-Smtp-Source: ALg8bN7ORr0rXe0zI2nVycQsQILEocqn3jwSl72M9snIv5kz0GhjXbQHyFpTudG3MYrXY6HQGDMdnA==
X-Received: by 2002:a17:902:fa2:: with SMTP id
	31mr44283434plz.75.1546446982035; 
	Wed, 02 Jan 2019 08:36:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:b176:14d6:5577:24f])
	by smtp.gmail.com with ESMTPSA id
	v89sm62973472pfj.164.2019.01.02.08.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Jan 2019 08:36:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 08:36:13 -0800
Message-Id: <1546446977-27510-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
References: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 4/8] nss: update to 3.41
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
X-List-Received-Date: Wed, 02 Jan 2019 16:36:21 -0000

Bug fix only update.

    Bug 1252891 - Implemented EKU handling for IPsec IKE.
    Bug 1423043 - Enable half-closed states for TLS.
    Bug 1493215 - Enabled the following ciphersuites by default:
        TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
        TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        TLS_DHE_RSA_WITH_AES_256_GCM_SHA384
        TLS_RSA_WITH_AES_256_GCM_SHA384

    Bug 1412829, Reject empty supported_signature_algorithms in Certificate Request in TLS 1.2
    Bug 1485864 - Cache side-channel variant of the Bleichenbacher attack (CVE-2018-12404)
    Bug 1481271 - Resend the same ticket in ClientHello after HelloRetryRequest
    Bug 1493769 - Set session_id for external resumption tokens
    Bug 1507179 - Reject CCS after handshake is complete in TLS 1.3

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/nss/{nss_3.40.bb => nss_3.41.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.40.bb => nss_3.41.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.40.bb b/meta/recipes-support/nss/nss_3.41.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.40.bb
rename to meta/recipes-support/nss/nss_3.41.bb
index afc5081..5ab22b1 100644
--- a/meta/recipes-support/nss/nss_3.40.bb
+++ b/meta/recipes-support/nss/nss_3.41.bb
@@ -31,8 +31,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-SHA_HTONL-bug-for-arm-32be.patch \
            "
 
-SRC_URI[md5sum] = "f7aec858d192ae03d0e9a35a730c70fa"
-SRC_URI[sha256sum] = "0562087b8bda072bf5964f8acf851f9c0997a59c384f4887cb517b3b628b32dd"
+SRC_URI[md5sum] = "eec62a289387a7ce2fd9cca1f76600f3"
+SRC_URI[sha256sum] = "ab2e18f5d0dd0079c0005396f9beb9a41e9a1bbc7e6c1d0a99affcef0471712d"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4



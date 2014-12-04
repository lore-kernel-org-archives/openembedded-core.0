Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id BBD8760601
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 15:22:45 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so28243426wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 07:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Emb6VOizO4ONKj4qdLL+b0yZpbLCoSlIEIHVLmpJsO8=;
	b=gsaq8ZWMgj/kkDPhrfg6vPCE7de4vLr+PDGgrSWz25Y9iKk9z55fy1p0ioZgm6EjuD
	cj8jFhGRWjDxliu0S2peHpfEHkc9Iop4HrUzBAeL8WtVMqtezfH7rcrj+387+k38bY6F
	A5SXDh/6tsdMbN1GzcPzEeasY2iLdwnzXKzDFzwAzb6odkN+rGoS4Dw891CSTdPEyW4z
	R0nhG3ubmmaxvrvURd1uP6j0JsQZeP5jj33X8G/Ppzbl/zipNiPB6xhUM037R8bzT6gj
	xuOK0TQuk4d7KtBYgkuPkyu2Zr29vW/czGZ14bZMISn9hjRzLSQY5reVzuBvSmvlWYMg
	K7VQ==
X-Gm-Message-State: ALoCoQnyPBuBamNjhuv22+gwHuxWi2mMnJ1bVECUoR5KAkVHH/PO6gAp4uck8RseQcA/oKn4mRYs
X-Received: by 10.194.189.240 with SMTP id gl16mr16192548wjc.119.1417706565734;
	Thu, 04 Dec 2014 07:22:45 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	ry19sm40907706wjb.3.2014.12.04.07.22.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 07:22:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 15:22:14 +0000
Message-Id: <1417706534-19738-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1417706534-19738-1-git-send-email-ross.burton@intel.com>
References: <1417706534-19738-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] default-distrovars: add gcc-source recipe to the GPLv3 whitelist
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
X-List-Received-Date: Thu, 04 Dec 2014 15:22:47 -0000

gcc-source is a convenience recipe to save duplicate copies of the GCC source
tree and should be whitelisted for GPLv3 avoidance along with the rest of GCC.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 8d24d66..04037c3 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -25,7 +25,7 @@ IMAGE_FEATURES ?= ""
 # directly part of the distribution. 
 HOSTTOOLS_WHITELIST_GPL-3.0 ?= ""
 WHITELIST_GPL-3.0 ?= "less"
-LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan gnutls libtasn1 libidn libgcc libgcc-initial gcc-runtime"
+LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan gnutls libtasn1 libidn gcc-source libgcc libgcc-initial gcc-runtime"
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
 # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
-- 
1.7.10.4



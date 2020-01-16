Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id F06837F87C
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:54 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id ay11so8460037plb.0
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MbC+28CJ0R4ktw15sXcSXlIpCNhQQSSUJI+kIrgcdoI=;
	b=K34j7E7ndEF2t1y1FxalmYmBLHC6NQUai41/bSmJaMs8ThXIbSJCDQAHZVVJZ9WXG0
	aZBSalMyV+gCzLMd37GdcQi9nS7XQ87SRb1pz4eGwgQdScPO+iHCTJ1VZ0KPx9r0MaV9
	rBFkbAvYvoqp05CvI3XTFwpd8L4SrPoqHptAlbKYrvKaDFOX7ZiMGn9b89a+BDOCW0C6
	iK+K764dy6EMVWP9+dpiSur75ia4y4+1/C8lgo9OBIYfiHLdyDiXkLQje3BeazJyjtIK
	KVU8RWgQGZqvEgX7VZSiqimH1m8Duh70uJU9y3sqCaWU5gHR8GntIvJ6mkqJ51bIMTFa
	MI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MbC+28CJ0R4ktw15sXcSXlIpCNhQQSSUJI+kIrgcdoI=;
	b=FTKkRgFK5zNXZ0TB7JlHtHY4r5Cd17IcZFT248baWSFKKp0+tuYDd5OPElYDqIpZZq
	pcUpN/htZwLuA03pSGqO0TTvFepqjzOcWdPvFeDnMhhIOu/A65zK1ODQtarXeJas4fql
	TSF+0DbmzhGNvNlgnFRhYhEhFhhPMXu3MOB56b8HN31+a7XsuCNjNq6plwYNLnd5D56j
	pi9D/+APRIXnSrh24BiJo3la+tBNvGKv8U3tUA+8NI6aZx0WkEVdpqOJlzk9oMJ8Lo34
	h7PNVA1JTXJiF482vXFaWoQg596YSSYvwDAHGYIQUljkljJFSRCwNbIZ7WqTZ6TM/lzj
	q9wg==
X-Gm-Message-State: APjAAAUEvBkgmNP0xOlp9Y/EhoLIP7O6yoFH/ABHRKkDgd4Qwh8Pq3Ha
	gdOH7AfVSvGxDPapCdIdbmy301Mz
X-Google-Smtp-Source: APXvYqxhEUor4JFgd+eVgck3TBPTmdg+yrf8Hxhj/ZrBzyqYYyprNFgswbUmlTOvOF7eE58mm6LFEQ==
X-Received: by 2002:a17:902:b40b:: with SMTP id
	x11mr21722280plr.268.1579188055927; 
	Thu, 16 Jan 2020 07:20:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.55
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:20 -0800
Message-Id: <c214c6c7c0f011c933da8b271630fd6833d84685.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 11/32] libpam: set CVE_PRODUCT
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:55 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index c124e3bb02..ad6ac4b701 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -164,3 +164,5 @@ CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-password"
 CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
 CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-account"
 CONFFILES_${PN}-runtime += "${sysconfdir}/security/limits.conf"
+
+CVE_PRODUCT = "linux-pam"
-- 
2.17.1



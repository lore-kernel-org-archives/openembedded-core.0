Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id F38EA7FCAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c9so278602wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=105JvljESjAK0RJIxdfp4prPqfE8KTfY9cfqiiWjgZo=;
	b=jcjJoAK0KZToa242Gq6J1qLntF9X5EFpwzvjUNd48SS/X1rcGIYgHIm1g1bB2M2BY7
	IEuHyeQfOBXUsHdF8zI21xCDvCdkAvcsGldR2QBAvs1VzeZu5GIVyN2g0UZKZEFU7WvE
	+6NfYEJciMo5LnbL7ehRVvQBCy//sAqBLG1mWzsYPnIH0KWLxx0VVrEViN2JbMBvEzdq
	9uvsFeF3NDP58k/rmfS+uHddO6wPwgeYBMSDFAcA7Pa461GvUeBIFqiMGGand4q3p0ur
	nIjLyMdOSrQRek84RvgtI0GNbb1goYUS8NSvt2uGmH79gQz5Tpm/xWieZ/axCHtCyQt+
	XrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=105JvljESjAK0RJIxdfp4prPqfE8KTfY9cfqiiWjgZo=;
	b=gw8nfL3SJ8veJte97Q38VyE2kv8Lm0+madUxyIanFQ4gcLu7x9h+FSB/3Jhutn+J2M
	4Dwn/pw5XIx5XFYxGxkDDdH40j5bxY+7B4r6KVnzeg5ml8uLEA3OkVXG0U+0HQHf3iK/
	9h2gudnnprgSVc8SQ1wAuoS+Vw0V2Nadp0xRjb2BLsCHcjXVrGIefPX5WHxouBQcI6i+
	NSjZNI2ghz+dm9vk0vU4DSdEgwkHEyRCIq045qIzHFdqRBZapFGv29LMmYHpKw1/Il5m
	vQH1qOHMgR8utoFiMWcM0HQySPMOY47mUCRvnuSV8QPOAtqrYEg27WrFVLhZO/3a197z
	ZiHQ==
X-Gm-Message-State: APjAAAVpyR3+URsbmtKDWuCXLd0ruX3+w+REQFqlypDEyVpnJYrSKEqy
	k50Xjmg4G3LuKFBs6REHxjVXq8pP
X-Google-Smtp-Source: APXvYqw9zBTLEpZ7ijueG/kAkOM7Cb+plVC6OcXVzwIiTcLmx/xD4jJ96GC/HITS8KOHDRwlXfEJ5g==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr534606wrm.13.1579541132214;
	Mon, 20 Jan 2020 09:25:32 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:56 +0100
Message-Id: <20200120172510.22648-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/24] ptests: exclude lttng-tools
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:32 -0000

These tests are producing failures that appear and
disappear randomly. This requires investigation
by someone with expertise, so let's disable until then.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 49cb9046c6c..f42e90bd187 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -58,6 +58,7 @@ PTESTS_FAST = "\
 #    rt-tests-ptest \ # Needs to be checked whether it runs at all
 #    bash-ptest \ # Test outcomes are non-deterministic by design
 #    mdadm-ptest \ # Multiple failures; mdmon crashes in at least one of the tests
+#    lttng-tools-ptest \ # Random failures that are difficult to reproduce
 #"
 
 PTESTS_SLOW = "\
@@ -67,7 +68,6 @@ PTESTS_SLOW = "\
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
-    lttng-tools-ptest \
     openssh-ptest \
     openssl-ptest \
     perl-ptest \
-- 
2.17.1



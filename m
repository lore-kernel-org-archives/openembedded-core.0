Return-Path: <nathangutzmann@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 914136FEF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 16:13:58 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id fl4so3673835pad.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 08:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ctfrxVmbGcou7hKpU+HqibrG2Afw9T/RE/FEGbPowww=;
	b=MDylKauYSMZiJtcsj2L1JcCeN73pmbFI7Mi6PRNKSYT8WS8e2DuGFQ8L40A838hQXV
	U52TvR4eIdEboWwbqmt6nkaHqqLewOeEq8IHIuKCvh7koCu20yaBVBCmKNnOnowZV9ig
	/Bl8xbFrtdhq2bBy9VCh4Gxu7mr0EGj65tMOtqCyhkwvXShQP9ijKR065xG47CwgrD1K
	/X+k6S+OXqjOfctwvDxiu/91DwhJ9o1czIqIhEdnMcAf6atwybWyzzdWDiJ/5yhHGHN+
	DprvklRX0GbxIXOM7g7iIAZT8iHXXi2e/wr9f23nvreJHDWYORX12s8yb0+f6JtPdGU7
	ErBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ctfrxVmbGcou7hKpU+HqibrG2Afw9T/RE/FEGbPowww=;
	b=NrpAMJNtHK7zmIF7Ux2cYbWcHugzWrtxVLiHIp2lJJX/lvA2YUMj9WWvt2OX1Ujm35
	2hBMkrQZ9S2gi6YSRl5iCApyRZg7rQAh2cQcc9jc0zNlwpJufww1ZjyS0tblL7FUZ/yM
	pAMWqnDCJDb0BOefKCaTnvShvAq3BzB4nqI+7GSD1bZG0MF4xgi/1LEBxCd1LTakBQu1
	+0Q/FOFCh270/kk32rulcwQKtLd9+ifpA5Y3AJBGAUriQxozf/AZX0fcHokxKLnIY3yU
	XkT+zq7YB3z8G5XAk/8vbINf0VA8BicPoUBVk/QYsl/GSGQz4M7oUJzZ4qHXgzODk4zv
	woaA==
X-Gm-Message-State: AD7BkJKEyYi0+aAgKL6LeYiajR58rRl4w557eHz9OZ/WCfq1Z6AhEOX1rYbcXqeJscZZVw==
X-Received: by 10.66.100.196 with SMTP id fa4mr51465514pab.37.1457540039006;
	Wed, 09 Mar 2016 08:13:59 -0800 (PST)
Received: from ngutzmann-fedora.int.pason.com ([69.58.16.39])
	by smtp.gmail.com with ESMTPSA id
	q4sm13408696pfi.75.2016.03.09.08.13.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Mar 2016 08:13:58 -0800 (PST)
From: ngutzmann <nathangutzmann@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 09:17:31 -0700
Message-Id: <1457540251-8951-1-git-send-email-nathangutzmann@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH v2] nettle: The variable named p in the patch file was incorrectly named.
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
X-List-Received-Date: Wed, 09 Mar 2016 16:13:59 -0000

The variable in question should have been called ecc->p. The patch has been updated
so that the compilation of the nettle recipe would complete successfully. The backport
originated from this commit https://git.lysator.liu.se/nettle/nettle/commit/c71d2c9d20eeebb985e3872e4550137209e3ce4d

Signed-off-by: ngutzmann <nathangutzmann@gmail.com>
---
 meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch b/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
index 1c4b9a9..a956f42 100644
--- a/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
+++ b/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
@@ -40,7 +40,7 @@ Index: nettle-2.7.1/ecc-256.c
        u1 -= cy;
 -      u1 += cnd_add_n (t, rp + n - 4, ecc->p, 3);
 +
-+      cy = cnd_add_n (t, rp + n - 4, p->m, 2);
++      cy = cnd_add_n (t, rp + n - 4, ecc->p, 2);
 +      u0 += cy;
 +      u1 += (u0 < cy);
        u1 -= (-t) & 0xffffffff;
-- 
2.1.0



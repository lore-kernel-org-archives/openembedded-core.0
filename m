Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 13F0E7E713
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:39 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q21so259369pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nUH7MkGfM3M2BiD7pDQVoBZUwXRw47CBguDNEuVxBTA=;
	b=V1PJwbFVBb9CCKvCHBC4DYQUq+XfIdXA3FmaYhYmMzvcvmZuXBVGGNQ/e3toPEV03j
	HPHjthPmbykuseVOZrh6Y16MDBntJYxd7MfbyKqQnCI6U4CdKTp0ZLyDQQq0RRokVfgD
	BiSmFddq/qBAISLFxwQUH5kz5dxQsAmNtj9zu6NF/GvSf9xhsnD2P8Tz/VnFPsRUHXEj
	Hz1RkOvbIJork5BHuJqfLeVY79pSRWXTu7TuUCVIfwoqyP48Uv0V91AQ3tV6OT6lFA33
	Xp1Cq9FqylXDkKGhg2DQZRIUm5ydj8/L1H0KPP7IDyJgTTvzlyckg4GE1Ko9VOxrNZet
	D+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nUH7MkGfM3M2BiD7pDQVoBZUwXRw47CBguDNEuVxBTA=;
	b=peJg99cDlgkA3ox5oHN8hNaFi3KB/sP8VPTW3a/AAz+KTlmFkIBu3KcHvAIp9aLSvG
	CVtCuiQStQXOrwhnisuZuzQUmfFMQ+YJxXNYmHdEhtBqf8O4NsWn7kyb8TQK1kG28nA4
	DY++OGOd6gBUMm1bMgQAEOrMO1u4uauRuIj7hCUGVNIyP66cQ3XoLa+DdghlA+6EieWm
	S6Bbjk3QF2fqPST2XoRWu26IMTFducKDXNFL9jwEM1mikZZVmmt/ClgjvlgQZfkjawti
	M+Tf+gOujNvCS7b60nWC90QiZGYLXqdJJyGB2S2E719V9ZAI+69ZdivUTYuG385Jin9S
	bjAw==
X-Gm-Message-State: APjAAAXRlSMRfjgufSimpJ7y/gnPug09ZL3G/qAYVAJUc/DxKYT//jIm
	nI3fn8PkmR53K4H0f/SrWst9ISJietc=
X-Google-Smtp-Source: APXvYqy4FG0688/HK81rKLWa85YANM+4KTONRLRkAiFM+jtkTywctA6K5ebzw+Ncdp4CNXiZEmeIwA==
X-Received: by 2002:a63:31d8:: with SMTP id x207mr782925pgx.428.1569293380882; 
	Mon, 23 Sep 2019 19:49:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:47 -0700
Message-Id: <05e4f56159ad4cff83bec10f1355be3ce5864201.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 07/50] libid3tag: CVE-2017-11551 is the same as CVE-2004-2779
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:40 -0000

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: 0663e5f8f906803685f018061d51fd6277916e50)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
index 8d09ce7..10e0890 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
@@ -6,6 +6,7 @@ https://sources.debian.org/patches/libid3tag/0.15.1b-13/10_utf16.dpatch
 Upstream-Status: Pending
 
 CVE: CVE-2004-2779
+CVE: CVE-2017-11551
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
-- 
2.7.4



Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 45E4A7DF2B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:23 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id t87so8435087pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JRI0uU7uOx+0Dgi8YNhQ3RLo3tHtLrV9AW9dHLPI8DY=;
	b=BAJghpTNYOl1Had92Lwgkp7EisRo6pNcxgePYlT/qp20Bo7zXw2hjjzcUpCY0gjAwU
	kveYQqhe4p1ahgfLOBb1ULEued2M54QR3RhTLT+Q3saz56oG+DLuhXs8A5T425W+Q9xb
	RXh8H7vYOAd4Ni/PzuHkMja26n29ptxBBkk94TAqnZ6Ga8uMMCW9o9OHGSI98KZhDVZ1
	C2ERdPjObJmI7F+cgc3yLaqxMMewx45qTjLkdiwU7ulGpAWpDgMjJSVLVQcX9yA0jzaN
	/iq8PSAN+DRoii48ZGZ6olEaToBqjd2CoNEH9tsFytS66QuJ2F7rv4s7LOn0E57v/Dzs
	2Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JRI0uU7uOx+0Dgi8YNhQ3RLo3tHtLrV9AW9dHLPI8DY=;
	b=q6bn5O/RhNBILMYhZFr+nQi4X6stWVLHP39UelXGBiyW50d2BPNEp/L5dITJCAIwC9
	9Q5iHGBcK3etygiO6uR+xzQs9ZDQwMogkTnxam0F776LEH8i6fyLc16de7eT9y2UMNxw
	h2i3ZLuiBqGbOxaD2ql3u+MWrZtoaSl0IIUAtQzhUcs/Z+lQJblpWYASTmtoFs6fqCSL
	H6Fh47R0wl4NSQ57NE0lLUvnFrbyI5CvkIlxoNguakX+n3Cj4MfxszmzArGxCiPeVNy8
	V9aa6DGt9flJmlsPNO3TRg8hKW9dfnUH3vJE8haIiNFC02FLZZ33U/t0gqTpSvEO5C53
	j0zg==
X-Gm-Message-State: APjAAAX5QoykOwZeZPqVhGSbcoUnj2Fti0dL3N+WMFtJVxSzSTnfv4Sv
	wceyhKlUchKEuaFPI8WFQ3CHhKDn
X-Google-Smtp-Source: APXvYqzuc2TPTKSx2BBjsQVIv/cnli1KXHsA4SF/q1Fj145e8ja5h6ti3m/V3ocvOwIMgxvFFdcTxA==
X-Received: by 2002:a63:a54:: with SMTP id z20mr35517272pgk.27.1557809664336; 
	Mon, 13 May 2019 21:54:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:54:00 -0700
Message-Id: <6694be65f542eb35f4d1ed432d7ae89d7f1453cd.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 18/23] squashfs-tools: set CVE_PRODUCT
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
X-List-Received-Date: Tue, 14 May 2019 04:54:23 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index e871f1c..5a8b5f7 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -44,3 +44,5 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_armv6 = "arm"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "squashfs"
-- 
2.7.4



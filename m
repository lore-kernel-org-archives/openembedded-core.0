Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id EF5B2605F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:38:45 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id t23so3821681wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=92FKO0YkEQvuYmeZgwdX8ZzSH2Iqbydn2qHTG6Pr6bE=;
	b=kgqdT/J9+PTmhW8qeg6oTAwOBsTTmvH/E74EvI+0l2HtXLNibAMimkuVdlbzjmAW+3
	t9/nbMTsBgD8w6dXpWIWEIOiqrB1+xsDlznEvzqC81icASu4brWZTfxJx6Rhyr+NjThD
	NpVdZa8+pU0cYOjtef8cqwjw6Es/e55eaKdgSEXPKTE3yEQ/T+4C0q6XpF9ME+Z47xuJ
	l/O+gAJ4sU+FAnzziip1dGFN+IDOP7aOrt2L8DOapSd/WYk8rgZAdrc4Nx0/N5nN8UVm
	kznsA4ou+4MOcrbC6dnCjpy7KkHI82qjYLr3+SkVPn485yYTDkKXkQAPUUxfpBfpWvgw
	fETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=92FKO0YkEQvuYmeZgwdX8ZzSH2Iqbydn2qHTG6Pr6bE=;
	b=JnwDTDROs2TQxvpAgdOXTnES0RtM046Mn0s7mZ4GWXuhnDtWZEJxTwL1WIVEHEWNkT
	ODcq1fusXGU2SZkFeZ4yjMq+x+fHKNOgIXnAbas4FJvo7sKK5SqXlmxbgIkjGgGdeF+k
	unDUmVQS0TOUdn1JlviK8i+qB+cn1SL+TP73KLl4fAITHnV1fS1p/9amRXnViuFpJbPm
	jLPDgwSDF8evpBeMVWCZ83JBrrSY6oTxxu/DRmIz/fpKPcwHE6m5lzZe9D83Iexzj7Ju
	RCGfchTYKoO3P3pp3O5zjHJjau+to9o2rV6DWKt4d0+tgcJ01cdMBrgTbr0NLVMTOvxO
	AY7Q==
X-Gm-Message-State: APjAAAWURcGhHxmw/ZNKV9tgRFVz9dAOXe4/Qh6i1RrmRQwDPYny7Lef
	S3t9IJT38fDodPQMpT2dcsFohbWc
X-Google-Smtp-Source: APXvYqyfSrZHvgyAvF69uShvF+p9u46S5GQh3RCW9HaKX+TCBeK4+baCRCXP+4xwFC297Aoaj2WseQ==
X-Received: by 2002:a1c:a947:: with SMTP id s68mr10459092wme.61.1580288888528; 
	Wed, 29 Jan 2020 01:08:08 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:17 +0100
Message-Id: <20200129090738.1398-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/24] libva-utils: fix upstream version check
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
X-List-Received-Date: Thu, 30 Jan 2020 13:38:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libva/libva-utils_2.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.6.0.bb b/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
index 0037fdfd854..03b38027a13 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.6-branch"
 SRCREV = "8ea1eba433dcbceb0e5dcb54b8e3f984987f7a17"
 S = "${WORKDIR}/git"
 
-UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 DEPENDS = "libva"
 
-- 
2.25.0



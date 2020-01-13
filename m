Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2CFBA7FCA8
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:49 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id bd4so3947003plb.8
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l5x1enb7HhvDLuWd/dAzUu9AVo/DeMOiBHkgrt/5PDc=;
	b=fQGQfKwHUduIcqwcjEx5jQ2y2v6kQQbp7zkiX8aMFExAl2fHqUZAJQzOcIHIfUouza
	qnd0QMhgjGXUqhJRwumKaKFJT+WFFjU6XC0Rw9cS+UVQ8vJ30PoZj0PdYt/eKITmZZ8Q
	8IswqpTYObBCgsZRA0qtD/GWf+zB50xnPG2DQ4l3wyekZyvHVcCIcfvxdSzHXt1oyXVp
	42sP7o9WMLv8XJpEuTYe0Th8QmJXtcTxPdmE2IfrFoCk7EDfp/3VLpwzidZrrsCvFFib
	LSa8P17s05b862bv5CPrpEjZE7mR/fs52igPgGYfeWWnVJ/XMJmXXDP3ytyUfZ2drTCR
	NXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l5x1enb7HhvDLuWd/dAzUu9AVo/DeMOiBHkgrt/5PDc=;
	b=QO8IM2dRG/1w6jvpqX+6tozNqAfpcek6q+izb5eojbZXKvOJwZc9kFsHs6bEKDb1sI
	cMIY94NfGz9kY/46zO5hbIVKqu+xOMYrBLajRj9voH6I/RQFFLXgs7FbqjTiTIl10fWo
	5rlsMFRsNTqa3pZSe9Zw36J4+ZXkzFTvhhbPW6tb1C9T3yhAlw5baL2aJiBu0dzltVTN
	peYYiru5qJjKInj+Uk3YiIa6zoyDcKPcbn1CbnoL34Yn3KruVWc0JFr/m78PSBHcC+zd
	/L3qRTSpVp98+6WpsAbJH21RJQ8TNEk3JlyYnJEbR3SKnhei9ZjonS5YO/upINTuEbNG
	u/Fw==
X-Gm-Message-State: APjAAAU9tXY6CN2nKqBoFTazxVCCmst0sWq7yGmNsKnxIqv22/MH9nTk
	AJGw2CLFeRLb9h2G13N7+2oKmtsE
X-Google-Smtp-Source: APXvYqwAF5xma3DCTp74excvfiYO9C8KEWC4T8/4wFVD+8J3qHLxOaepPhPjWqQGGqA/9+7hrA3MQg==
X-Received: by 2002:a17:90b:438e:: with SMTP id
	in14mr22255912pjb.83.1578929450118; 
	Mon, 13 Jan 2020 07:30:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:14 -0800
Message-Id: <d1a16e6f0edda5d9f03191d187788fc8b666bd7f.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 15/28] cve-check: failure to parse versions should be more visible
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:49 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f87bcc9dc6..1c8b2223a2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -222,7 +222,7 @@ def check_cves(d, patched_cves):
                             to_append_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
                             to_append_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
                             to_append_start = False
                     else:
@@ -233,7 +233,7 @@ def check_cves(d, patched_cves):
                             to_append_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
                             to_append_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
                             to_append_end = False
                     else:
-- 
2.17.1



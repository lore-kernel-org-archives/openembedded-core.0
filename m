Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A23C37D2BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:19:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w15so794507wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q+ASVQzWCVPqbu7pCRSuURQZVrIWtgNDAYl6ptFEluw=;
	b=TXnAA6D1YxNYBmNvAXzS8RmVBZ9L/Wy1EuazjjY+VpmYx1A3vAk2ZDMa/N05gWypff
	srMuvpvjBCMsz7/BdX3GXB63LIsIkkWr6xR/1BRwD+kJEpA7XGXJB+ddqStnFTmidmgl
	ky5Bkyr50vCrQun6CXQofKRIdsHI0B2lVhkvdACLSIhoFFaMcCslW6+3QC33xj2+eJC+
	52cuHTr7NL7NEZvX2egOm0Nm/V6SmmVB6R4b5HGlYbQ3XnkZhTIPb+PwsRga9Y8LsLyD
	2UFGk7ms+/FE+PzGm8OlCZGNcMIiYAqPyOHjC0Z3sVq2i2Jxc1qSFg7hMUvErGRkaKGN
	Qu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q+ASVQzWCVPqbu7pCRSuURQZVrIWtgNDAYl6ptFEluw=;
	b=oanVEcpKB6i8D5NQujGm4p+cvSu9nOuPMQO5kILyR3vyrjlFpm/XgUTU+/CVjEeHsE
	BW2bvdH3I2FsyLxQ1CLifq6jkRO4nAkjvf+f0AyU1SrKsCciiEYWwnXyMA7Po2Gv72e8
	YxztWovOKGY3wzZl+Ok6p8+VVCxlKCUAZ6borrG710qO+9wWX72lHqBeXnN4WA3Dsph7
	Haw81oTPPpzQtkpJclzUytP+2yEML65atzcaUR0RyrAytmVyAfFHE0wJFB5bhUrNPrIH
	O+omvUKZL8CuDtXummqbdjVBa5KrQdFMaxseSgadaLdZqf18T/S6ZQnCgfqCiP2EkxLV
	gxBA==
X-Gm-Message-State: APjAAAVh8JqTtwqOesEX/l5ulMS/D0XEjPzyipbJd2Kh0e6j8zoZGUo4
	WfcMqukPd1UNsYE2m67hs/1kQbtvnLo=
X-Google-Smtp-Source: APXvYqyCgmDlL2Zt03EpLbVBgFpc0q6qwSNusGm5vqp9kfIE6EWf8dyS7oWx7La3tlWI/1ftWA7wGA==
X-Received: by 2002:a1c:a184:: with SMTP id k126mr2946795wme.71.1556036370010; 
	Tue, 23 Apr 2019 09:19:30 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t76sm22599142wmt.8.2019.04.23.09.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:19:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 18:19:13 +0200
Message-Id: <20190423161916.25572-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423161916.25572-1-alex.kanavin@gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/9] python3-mako: update to 1.0.9
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
X-List-Received-Date: Tue, 23 Apr 2019 16:19:29 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-mako.inc                  | 4 ++--
 .../python/{python3-mako_1.0.7.bb => python3-mako_1.0.9.bb}   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.0.7.bb => python3-mako_1.0.9.bb} (97%)

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
index e265bde85f2..97c624bbc66 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi
 
-SRC_URI[md5sum] = "5836cc997b1b773ef389bf6629c30e65"
-SRC_URI[sha256sum] = "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"
+SRC_URI[md5sum] = "d739720f3f0d6a1cb6a96ea7a4760c3e"
+SRC_URI[sha256sum] = "0728c404877cd4ca72c409c0ea372dc5f3b53fa1ad2bb434e1d216c0444ff1fd"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.7.bb b/meta/recipes-devtools/python/python3-mako_1.0.9.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-mako_1.0.7.bb
rename to meta/recipes-devtools/python/python3-mako_1.0.9.bb
index 22ceeeb395e..17803f1b00d 100644
--- a/meta/recipes-devtools/python/python3-mako_1.0.7.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.0.9.bb
@@ -1,2 +1,3 @@
 inherit setuptools3
 require python-mako.inc
+
-- 
2.17.1



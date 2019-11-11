Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9489B7FA45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:23 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 15so9945702pgt.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UnB+qFtf7XRTf1acXkY+pelryarBLz4L3x6kJa6PSfw=;
	b=HFguDZmhdxpSxuKvKHnLH7F78p6HOJgtzI5TVdNd1hj5xy+ZTBjKsAJVr1C5V7+W4i
	YhzjTmykLSrK3chYifC8C8866oyFnkHNX/dKBkTqhoZjrYfiIBLV91h/YQE8i0ho1IUI
	UVCmeXir+vy4hfmNrFIhVafCp4fhOPRJ67AfM3xj+H7u9KPTGR6Jhj1dZFZUbSJrpneD
	BHZa9wsj0vYV6aI+gpE+BQwKJnd0D3Gp0qONfRfmq4jeZj3zHJVlrDUpQX37jv368DBN
	oEep832O5H72X6IA12b7vies9/GBrS+/18J61Hv1hWh04CwZfkIXRIuv/OJt1i8FFNs1
	1LJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UnB+qFtf7XRTf1acXkY+pelryarBLz4L3x6kJa6PSfw=;
	b=Pu+/Q8p5zpVbHxOw7sxjdM8h6RCETTq8vrRcLNatFNGfx7rEq4qYsDw1bNvFWCCe55
	04VMa9bg7W6vADQl/gnKHXsE9fAAB81Ee5TEsiySR0jIRlTlX4G4IQFX+knILYAyBTES
	FLcPSg4qRdWqNsUsh7AY9CQh3Zf8uMWyLNfRZF8vXKm22SEptRzNCPhAMzjaq592CF2R
	tDK/e8aWBt89qDPVTFMD7Tq0GmrssVAIjzLH0urH+J4xUOFn+XZAGNGy+IK1fas/Tsfd
	U6RUNPkQBOrSSKQbii8PoTjvdokd4zO+/4pWWwcetnQqpol00nHIiE1NBukDDYWVbnhw
	vZcA==
X-Gm-Message-State: APjAAAVGPXJBo1IUO/UN2VnW2LmD5yD9O7R5xJoON+vBEPYCu1Yh3eRa
	pj7hJl0Sjeq1+9aTW4X1zC7k/IPH
X-Google-Smtp-Source: APXvYqy6qm1uPL2jLF8Nu3zsPnywlLcJ95GkoN7rRxLfkd63m2dnfYdVDNNJZ+Kfwqa+2f+nsEkqqQ==
X-Received: by 2002:aa7:9157:: with SMTP id 23mr31573974pfi.73.1573497024070; 
	Mon, 11 Nov 2019 10:30:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:58 -0800
Message-Id: <41b1d53cea0302f1c3954c6ab048366c908cf754.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 16/21] patch: the CVE-2019-13638 fix also handles CVE-2018-20969
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:23 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
index f60dfe8..d13d419 100644
--- a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
+++ b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
@@ -6,8 +6,8 @@ Subject: [PATCH] Invoke ed directly instead of using the shell
 * src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
 command to avoid quoting vulnerabilities.
 
-CVE: CVE-2019-13638
-Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
+CVE: CVE-2019-13638 CVE-2018-20969
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 
 ---
-- 
2.7.4



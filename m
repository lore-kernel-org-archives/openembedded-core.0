Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id B6B507FCA8
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:43 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id az3so3935686plb.11
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cvs32w7sfHeJ8iQayPAIR0wu1Wg0DxGXf0vMxGJtZqk=;
	b=nTs9QKWQconsrjetOUwwcUmoz1/39eR5PY0Tj63SL0be3HMYF2/O3d2CuwqZ2+paBP
	J6zQ0V1IwPRG9rO1sT6ERwsXAGyoQyJTCPTrKY57tHr7ch1zB7QCPkIyLlr8kTniDDEf
	ks4NBD+23UdWbj+q4Lka1RAn/7rEkCshzUq1QlMaPOGsWKyPIhIIjoHJLTeoWaWH7ArL
	1K/gqEQo2cFVhsqGqsi/9TKp9+Gu60mE8axOrn5SiLobdKDPP8pBZiIWH16l4UZBPvjB
	ElSqruNrYq7JGeTEKLJLL2hEUVQtkIvrvxPvbLBYyGUsTnw6/n7LDuVXx9GD4NErDWDZ
	2Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cvs32w7sfHeJ8iQayPAIR0wu1Wg0DxGXf0vMxGJtZqk=;
	b=YoOnSb8pHqeZkThZgUPccpCtdv+lQTP0xRG/sqpBdw3QI4AAcL5N6QD0jwsDrA+8XB
	ZotAr4hWmRzyuOgzJDI7pj+fxnSmiidKK3h2nEOQpCIFjzvUpbQ1Ny1LOjg8jVEjd7FJ
	wCAEzrTel9m/cRA9u9sUDmi9Z3ulPw9pxOTr5/WyyHMzhkd926lg1UDzhIH3+GLxsX04
	38JiOAlxpz8+Yo11RlUI8ByBBtybWlCrs1QwfNocIlIGKWB1K+kCzWdW1c7dyLaRlH2c
	N5R2TYHgfU+EIVdwbGo2I5LBgVQ+dcP2bfX876m56096+L0v92ZhvGHY+DFvEGGvmhJ7
	3dZQ==
X-Gm-Message-State: APjAAAX0JSCcA3BtaXxS5mft7EyXTJ+vUMfNNqIRNn9WRiho6G5vtKS0
	tA/i2KES4dVIWQfJFrMau8M3EEkJ
X-Google-Smtp-Source: APXvYqw61GVHhxWTaNVAR4nDz5ktPkc+KV8222rx3A0mgFM9obfAGk5jQ1QBc7zHkX3KmjJt2GJYBw==
X-Received: by 2002:a17:902:7046:: with SMTP id
	h6mr13830329plt.231.1578929444706; 
	Mon, 13 Jan 2020 07:30:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:10 -0800
Message-Id: <afc529aa689daed18af29ecc64f3dae1fcbdc282.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 11/28] procps: whitelist CVE-2018-1121
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:44 -0000

From: Ross Burton <ross.burton@intel.com>

This CVE is about race conditions in 'ps' which make it unsuitable for security
audits.  As these race conditions are unavoidable ps shouldn't be used for
security auditing, so this isn't a valid CVE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/procps/procps_3.3.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-extended/procps/procps_3.3.15.bb
index 9756db0e7b..a20917b223 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -64,3 +64,6 @@ python __anonymous() {
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
 }
 
+# 'ps' isn't suitable for use as a security tool so whitelist this CVE.
+# https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
+CVE_CHECK_WHITELIST += "CVE-2018-1121"
-- 
2.17.1



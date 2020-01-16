Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id C214A7F946
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:58 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id l24so10045011pgk.2
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cvs32w7sfHeJ8iQayPAIR0wu1Wg0DxGXf0vMxGJtZqk=;
	b=hMhlgom53crJEr2Wvayjsuvhr43MJb7AjKcUZ4C+jTZwpmvIa/Tr1IrUCg/Tpq/YYf
	4ntaxVHjEBENs1BrGIlsQkIlZZfHBudGwYeTGTlxsMD50z/bRPz/DrMNF1CObBAdvzVr
	AzMzWyMEN9VBjT3+G7AKhVvS5LK4BNXrBKwlaLWavEaEV2hgtevKU5waFvoGSZ4yBc3Q
	xN1Xi7SVupcesXNQe9Ccim4XfAlJfUi1Uyrpt31T3JnhYBzEXSKrvLCYitoJRfofk7Hg
	QzonQXyrGWfX32vzsqQ2TFpTsAM03F7Llk+s4U6qmgG60UWozhuRoMAtgF3MpemgCbCy
	agHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cvs32w7sfHeJ8iQayPAIR0wu1Wg0DxGXf0vMxGJtZqk=;
	b=p3gA7AzGVykm4Axa05965ZPlFHThC9c0/N1v9jXgZh7ZX7GdRMSy0unUnE+yVZx+1t
	E8nmnbdqTrnntCOBIWP0rAZyvAoJiVHeaOmKg5H4sQJZZ4hB8c1f/2M1f8dOTGefuzT9
	wHlXiJXpn6cUmqKh8oPhs2Xh98CWoHOPWBDVzEJAUx3PQcPW6bsKa7mqAjAi2eeAkT9u
	ZO8AgCUPlo6bkdPvx2QZMRQMZKklO8N2mseG2MKh8kS/F+GMIeOJ2SMvbtaMiBGFDtbD
	Rj2i+dooTMODSw5iG3GbzuXCynsl+S7IzYnvYw7Id4KfVy5nXNFAH+fIacrJ2wTn+pcz
	tomw==
X-Gm-Message-State: APjAAAXYP8417CpfHF45DuS69v0cuFbgZPNFcqHauUU0wN5MMw17dLCf
	ByZ4att76PUUitr+JSyxeCFth+tQ
X-Google-Smtp-Source: APXvYqwhMj9vnH8dwUAX8A5JnjpOKdseNWuNSzTq6A0u4YPu7JR20rODOsw73AnscX/Oan1h0EmWzw==
X-Received: by 2002:aa7:8d8f:: with SMTP id i15mr37337878pfr.220.1579188059830;
	Thu, 16 Jan 2020 07:20:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.59
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:24 -0800
Message-Id: <afc529aa689daed18af29ecc64f3dae1fcbdc282.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 15/32] procps: whitelist CVE-2018-1121
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:59 -0000

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



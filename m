Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id E18DD7C767
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 16:04:08 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v16so10858843wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 08:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uiEWHSRvu9tKfELOtdP7Tje96gfZIYFxxfBH+PfwPe8=;
	b=OAqr/eRSxbZLeV4SOm19XXBSRah/LW7MnM7mYJCmG1i3eOUU8n7Mt5f34Lt0nBPcgo
	EJIJ+rfz1/7hogfC2drnkiW2OGuna4HNjrZ6aMTxh9Xz2JOfd38733mD0s0ULPnoQQkk
	J2vgGr4KInnznxuSECmuAIikaFpPWGTeEsI7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uiEWHSRvu9tKfELOtdP7Tje96gfZIYFxxfBH+PfwPe8=;
	b=TWx5AHrdFCYph085nRN6cmnUyw2fTksASF8KnZo0DbcqUMClFzrVeJ1WSlLuVKqti0
	a0SUNssTRch5uks/e05BdZnbriVWS73ji+BQgcfwoAy3eVUVKwrMhvpkVTP9+G05RZ6N
	++aYezZSJfuNiP6qme7kAXUwwFbem8QEKyfmELTiOz4tRuHIliHa5rQKSsVx6Dc1AodZ
	MWPPfnQpbIQWR3Di8on0BXyFIxop9vvxGa/KN5Vw5KFg0hcMtTLiu4PvBrbzfXZTsi2Y
	g113KSc8LTj1tgcg5unhPZIvzejgk1TmfTvZNDfVUwAQ5YL1/G+j8aHAsENnkKNkebPg
	HN2g==
X-Gm-Message-State: AHQUAuZonhqeU88DmdrxOQsmgH1N4FK0ZvrTBA5AN68W0I8KSVzRYzmH
	ZA14dQRKeaA5bsh80NCBwJqJy15q348=
X-Google-Smtp-Source: AHgI3IaEKBh8Cke67xO3zyn++5qAn7zXc21+d7g8yq7Jiuwz8LoEm9HBvnc6ZUddIUviIiezV1jdJg==
X-Received: by 2002:adf:8143:: with SMTP id 61mr7126302wrm.47.1550246648788;
	Fri, 15 Feb 2019 08:04:08 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e17sm3810424wrs.79.2019.02.15.08.04.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 08:04:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 16:03:55 +0000
Message-Id: <20190215160356.9764-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
References: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/5] lib/buildstats: Improve error message
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
X-List-Received-Date: Fri, 15 Feb 2019 16:04:09 -0000
Content-Transfer-Encoding: 8bit

Just stating the recipe counts are different isn't helpful, showing
the differences makes it much easier to understand what changed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/buildstats.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index d9aadf3cb80..f7db3eaf92e 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -263,7 +263,7 @@ class BuildStats(dict):
         """Aggregate other buildstats into this"""
         if set(self.keys()) != set(buildstats.keys()):
             raise ValueError("Refusing to aggregate buildstats, set of "
-                             "recipes is different")
+                             "recipes is different: %s" % (set(self.keys()) ^ set(buildstats.keys())))
         for pkg, data in buildstats.items():
             self[pkg].aggregate(data)
 
-- 
2.20.1



Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4D8795CF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:19:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c14-v6so11015336wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=p+J2Ki+wuzi+TzjsMPhkmpwzUa6PZJF+Y3SwbQvdQb4=;
	b=y6ddnQHuBFMKiNIXG1WXDtV5hbcwXBBz9GiI1BFOx0PmzwA8c2UcJROz74fP8QVyI5
	OGc6oIpWAVwmn0nN95bGAlIxS53xcG/VsogGqD+T9my15YixLhlyjj1PTv0yufgD7idl
	RPStFLGMUEUJLrA/NefVX+ggAMjy9ECd66yimOfQb+ngR1kh3IjXX5+VuTfqzocHP49p
	Vd9EIQ4YQof9QHBJ+yleRCxUDnSZhOxya3JTOpZ6P2ea4ySTt/mGj9A4aiWPCZS2Z+Tw
	5f9Mwu0tZQc4K5fdSw8XTVH8EQCH6bNBVWUOrSt+qYZuaxM4iuiHkZ7CM0mOGXMeFIyH
	eDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=p+J2Ki+wuzi+TzjsMPhkmpwzUa6PZJF+Y3SwbQvdQb4=;
	b=tB4uEsJ8i582WYnsA1USIY9EJZR9vWqJd+IQyNSie2HmrK13gEhqHLQUVHWb8STIdJ
	eIfiBl3R7U4OQNS5tWzbb8gx0V15SYefORClO1895aQDlFquLWtJ96Fvy6BsRTzMsEYR
	LN3DDFUTzW9rJSoQoncZBYa0bapaS4qly9mP4HK1+tVk89bZxzRCI9Tn6TY+mgH4+jhQ
	XValAYCQ/SWm2mYIsfDynMrNNLvXHx+ncTMRR9yGmW3ZWp6zk5SZs91cVAIC31TLIUvv
	BOBscmCaBUnp8pFp2udfuDYz4yGw2jfXL9s0VCPBnoYu9i5ocpCmHLCOw6LYasZIRxyg
	raTw==
X-Gm-Message-State: APzg51Dx9im23qLylelkH8NgXxp19lPyehWMRBVT8PaAO+C287hT/ld6
	49fXBPC0+hTawGuHDHoAneAg10td4TA=
X-Google-Smtp-Source: ANB0VdYtPCzN2s5ANMVnE5hkuvaUBgvj5KIZITDClKPLTeuflrfewqY3Z8Jtio4I7s4H+D23fQMM9g==
X-Received: by 2002:a1c:2807:: with SMTP id o7-v6mr1836795wmo.60.1536232744102;
	Thu, 06 Sep 2018 04:19:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x15-v6sm4860834wrt.53.2018.09.06.04.19.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 04:19:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:18:59 +0100
Message-Id: <20180906111900.23712-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] mobile-broadband-provider-info: update patch status
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
X-List-Received-Date: Thu, 06 Sep 2018 11:19:03 -0000

I pushed this upstream, so mark the patch as such.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mobile-broadband-provider-info/multilibfix.patch                   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch
index 9e75b7bdc5e..7e97e8ec356 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch
@@ -2,8 +2,9 @@ The mobile-broadband-provider-info.pc file is installed into a non-arch director
 yet contains libdir which can vary depending on which multilib is configured.
 The .pc file does not require libdir so remove this to fix multilib builds.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [8109fcd3c7299fae859fb891ff416927581a9955]
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
 Index: git/mobile-broadband-provider-info.pc.in
 ===================================================================
 --- git.orig/mobile-broadband-provider-info.pc.in	2018-08-07 13:09:31.811364063 +0800
-- 
2.11.0



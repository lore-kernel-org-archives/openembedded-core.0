Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 41F707CB20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id t18so29941202wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FVJIJzZdDY1PbiQpVO1m4EB3NEh+6Qi1yYbjfhEySYw=;
	b=HcBMyHETmzGj2NtRC29AVNoYfiTjyNEOF/X4RA3V43CiYXlh2CXnUToN2LvE86sEwB
	hZWz3Vhuj1UZw8N0hGMRXMK+Zl1ESFzo8wkWYEJqbb3HVKndft6y2rov+rOeHjsf8XgF
	mYMm40iBaZ2RxvynaXGb7pK3CAH18Bt2YxFuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FVJIJzZdDY1PbiQpVO1m4EB3NEh+6Qi1yYbjfhEySYw=;
	b=k7N04qorCpGj4Rnx/PGeKrtcYThwOU9rhra3tQvWV0AaBNVjz1T1WjcaRiU5XS2KMf
	2A4WDFQQa3nrnBXUMn7vENs6dVjVIlJTI287OVs0Ae5BIenLegeRtFmei8FTLdmKPJpH
	qnAeCKdtLfiJauHsbOxWa5kl/QqsyMd0b4hfmJJpLVwNTQ+Ya5JnvI0FzIi3ham61nis
	Xi/P/2F86XNUwYn8ugZv2EHuVd0tlZbEeG6nWTxwGJD1ueFLoy5rMOOXf+x2G6nJsdg5
	76wPWTRie4u0Q79I7aOY+XCNHB5tliBGJITT3//PM201tCUuzWdtUzZgi2mOdTnEZ0KP
	V+fg==
X-Gm-Message-State: AHQUAuYgzEzDPK+kCFWFTzS0r4Ws+uvXFF/zhObc0GCXqKBlqLU3GmVw
	zVmqJw6KMHFc/IIgsbdajXjyfK73P2c=
X-Google-Smtp-Source: AHgI3IabdqKS83FyN96mI5gfIgFP7dewiX2ETvi4iON8n/HPjo6i6+mIWuooG9bjJNQe6MVu6H9bmg==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr10215889wmb.80.1550752907617; 
	Thu, 21 Feb 2019 04:41:47 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:30 +0000
Message-Id: <20190221124130.25733-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 14/14] gnu-config: upgrade to 20181128 revision
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:47 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 4745f19ceee..e597ebedbc1 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "30d53fc428ea42af9d6f4d355db0022e3918a824"
-PV = "20180713+git${SRCPV}"
+SRCREV = "058639be227bbe8f03cc39f79f7ce84918012143"
+PV = "20181128+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.20.1



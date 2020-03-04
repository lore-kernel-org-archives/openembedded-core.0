Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB74619AF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 22:24:50 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id nm6so1550212pjb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 14:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7+5m7h4iMSVVMcIh9OhzH5RZnFD6DctznfDrFCRS5v0=;
	b=DloHSIKdvMSzMxKjvEeoNRQs7FpJ6DidiZ7in515hKenXVq9b5VKGopsIWtU6ynPZt
	V+F3fI2sYHnijHLfNYoXsF/ToqYjp49GXQiMdhK1d1NmNifh/IhUq7psfrUV+CiWcbrI
	XOdvKnFfHWPS2CO1ofVckxdZeVJ8G32LXOWMe4yQ8VXq//9fR1RIHjzBKRTFSmMIH0Sz
	/ojxSZRDE7J5wdhRrexIBfd3jHVfctaOYP/6EXDfpHkv7IfL8EOBX3wZkUg4rfirW7Yu
	iQ0f12BosCC3W8YP0oVOtHmV6D5mTEPc+6UtybuP9ni279GT499eYrSPh9JNeyy9pi0G
	jHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=7+5m7h4iMSVVMcIh9OhzH5RZnFD6DctznfDrFCRS5v0=;
	b=OGlbaL7skI79wjOoKu3RQN3gD35H/pHdM4ogWkYh8uq+mUFEcH3XICr0h0lhjyZ169
	Rjk/xQcnOiPl9oXg6PCM+8Oha9rdo8wFRXsh2B9i7JMduidNXBuR4YDR3+HBXGXqAKDE
	n/6pcbr2r19jvSb9Z2P6LDZc25kf4luqgvToGp2rRRdEs6uGWqwz+dV6hIWrG6a+P4gx
	MXOKcWljUz8+/FjH778q8FE9DIPq5el2aEZnZgrXdEdZ3p5weSJ/YVTyYuQp+PrO/rEp
	U3M+2/SQFmQwikkQwPXdlS/6Jghs+3SiTirgthaI2feMCaaQ5Uszpf2CwlKBkpKxtXdR
	cR1A==
X-Gm-Message-State: ANhLgQ2P9UHSRMH9QOspbNNHifwRjQsTIluSVQTGkOE/7AKgnce/mPFQ
	3Q88SDiNUfxRz8G3WQ//FI1c84o7rFc=
X-Google-Smtp-Source: ADFU+vvz1k9aA8vhrwKtnBQZOhBXHrNSoRmWBjzGXbbaiXrXnBKLMwcgUzJfjtNaCwRD6SR4V3oLYg==
X-Received: by 2002:a17:90a:d205:: with SMTP id
	o5mr5076901pju.46.1583360690873; 
	Wed, 04 Mar 2020 14:24:50 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	i72sm2362760pgd.88.2020.03.04.14.24.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 14:24:50 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id DC1972A07BB; Wed,  4 Mar 2020 14:24:48 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 14:24:47 -0800
Message-Id: <20200304222447.1787-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gdbm: add depend on readline for consistent builds
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
X-List-Received-Date: Wed, 04 Mar 2020 22:24:50 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Whether readline is installed on the build host or not
influences the way gdbm builds. Depend on readline for
a consistent build.

This fails to build on a system with readline, and using
the buildtools-extended installer.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
index 7e2efe3c9b..5326184181 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f74
 
 inherit autotools gettext texinfo lib_package ptest
 
+DEPENDS_class-native += "readline"
+
 # Needed for dbm python module
 EXTRA_OECONF = "-enable-libgdbm-compat"
 
-- 
2.20.1



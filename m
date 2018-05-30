Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id A483C74F37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 05:04:57 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id f189-v6so8394744pfa.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 22:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BZfQwzK8YO8D1XvY8JQxry22Gu46wMA5fFbsS8Bbs5Y=;
	b=l2ZJZ1U3Fz3FfjXN+7RZSSVFKkCWqI8jBAlebOtWSC+MLu8ynUTgbZUSTKJiPyaRII
	DNwdziARXao33COHErY6cnwMGil8lbdg858wx8GP64GdNGP9ibI0M5MI1syhMaYv4GRF
	QgTk8wsJ3lumCGQuvaT0WDogYYvNj81ms/7SH+UJTITqlRkxpNsRc96i7tfiGsJt+BHq
	ps+ALuuN/2gNJjpH/rbGnh+m0ahmmFJWibvtBlB+53F6MnKnza6Z5oEO664+9rxTQseA
	CgM6qOVSRGI5by4ShlCJ55y7zAIsqZlVIRybGdlK5VL+PeJ3O5Dsnl6fLBtgLo5vOiCa
	Okrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BZfQwzK8YO8D1XvY8JQxry22Gu46wMA5fFbsS8Bbs5Y=;
	b=h1VJTo+/RHHgAQ28jW/8UTW62YmI5dla+POWf7WaJtWukJqnVDyA1xIhisCEPf8XGP
	unFfkw1TTj5Jm/8vqPAbomTtyqHAxpglgyRQJp1Ys094VRy0ZmmOTP2pg26nuolmrNYX
	m4hnUQg0ohCDNhNx6LQv0ygPv+CKnH2vuUM42fmXBAeKy08WAMuLCj0+GGA9/NI2kwvw
	8+P0/WR73+n0dJum0h19eWxfACMBaz/39gqEkSpkQKuzqHsrFICk3BTBa6q6gO9grSIh
	KFCDpgE50V4Hiq7aewp4OmKAlybTjRQdDiSSryWMx8rE9JpS+Ef9f4xQLrgFmTBr3O0q
	vVvA==
X-Gm-Message-State: ALKqPwf9f+XeoLq5eTWe0XGGU2mkyxkmDOurVQknXkyhY4XMDJgKHc8Y
	KqSad4WaxqnlIA1ujM3F8IXXJw==
X-Google-Smtp-Source: ADUXVKKM+a/aEt38v1e9aD7sEYBtLQKJgfSUskZ/VFn/aV282DxbHrjDvlIAoupCFJuF3IWUzge8JA==
X-Received: by 2002:a62:2197:: with SMTP id
	o23-v6mr1318973pfj.202.1527656698656; 
	Tue, 29 May 2018 22:04:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	l71-v6sm24952157pge.8.2018.05.29.22.04.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 22:04:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 22:04:52 -0700
Message-Id: <367ad0e0c3743bf14604d83fc39fba3308f5ad87.1527656441.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1527656441.git.raj.khem@gmail.com>
References: <cover.1527656441.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] tcmode-default: Switch to gcc 8.0
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
X-List-Received-Date: Wed, 30 May 2018 05:04:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4b58df0459..b197819e9e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "7.%"
+GCCVERSION ?= "8.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.30%"
 GDBVERSION ?= "8.1%"
-- 
2.17.0



Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id D09457835C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:54:59 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b6so2934486pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KHmdcIoSh5EXQ3FH13mOVPy0sAAqFncsf4w+EqF3WYY=;
	b=bJPdNS2BYy40oQ0WVEHU/HgyQ3OWR3oR0n7eVhGwdUGLuMofgjuI/O2mtWDK9Yt/gp
	mzsT/x0vTTsER9RhMeqw+nspNZVp6ygDiovI3UHnjBNbnv9F0egYwWnKGIDKYS5w3OfA
	s8+TmdMTDgyFmmcASbdDqw2+bB8iw2FE0dzM7/SMZzMA5XwFqhV0bF8CcdMB5AS4VX5x
	9YYYUNzY0oOUfAV0efWFM6tyUoWPJ9c6xCuk7ELdROjdbIqV2eYANrvGONOnKVbKEi1k
	Z7pZ5wHIJrdwqBPujxjsICRqASfCpU5N/EbbDlKbjbRu6NqtwsqB6x89V2JWfhRodZ9Q
	eDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KHmdcIoSh5EXQ3FH13mOVPy0sAAqFncsf4w+EqF3WYY=;
	b=r0HSx8SHh5qr4M1ul+WVRMg0uj/o6n3sVdsBKXL2M7v14kYaL7+S2t+O6105G9gsOK
	8T57lwiwlyOB6Wvg95iqiujU4JbA17N9ly/zJdCrjYJNORa7NaLJW07qIXqoPdYJajYb
	kYIC15pVzNJ6wVHb4h1vRhNn5QiDiAQdYGN8PdEh2zwNW3y4fAWDS1pyMzxqk5fqnXmY
	s+EavVwBWjPbDCn4x15dUFcXTuZG2YOKTYgusQ77iyhv5U3l92BYxb6G6hZu9aJpVXb2
	r0++/FI4J7TjUtcksbL37hGrGH5TjkPi8WIM3cDxSD/BzffE112MXWS9g1NFgI2DTMxK
	/5Rg==
X-Gm-Message-State: AJaThX57iwDFY0wvqv13w9BHisnTzmISn3StK9GbfQjY+oi4Nd879Q56
	SDrYc4wACmsPnVw7JOAhIb8=
X-Google-Smtp-Source: ABhQp+SPyC4/Awz9fBRtaVNsZldoQspguVKzCBh/WXM0Sayq4mj79p4feVgGRSLZ+jkcN49VyK20mg==
X-Received: by 10.99.152.25 with SMTP id q25mr1984058pgd.170.1509738901495;
	Fri, 03 Nov 2017 12:55:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.55.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:55:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:43 -0700
Message-Id: <f8c75d9db7c39181e90d6fc421d2ec663c2e2f58.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 09/15] libxfont2: update to 2.0.2
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
X-List-Received-Date: Fri, 03 Nov 2017 19:54:59 -0000

A collection of minor fixes since 2.0.1, including CVEs 2017-13720
and 2017-13722.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/{libxfont2_2.0.1.bb => libxfont2_2.0.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.1.bb => libxfont2_2.0.2.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.2.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.2.bb
index 4bfb290..08d1123 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.2.bb
@@ -15,8 +15,8 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "0d9f6dd9c23bf4bcbfb00504b566baf5"
-SRC_URI[sha256sum] = "e9fbbb475ddd171b3a6a54b989cbade1f6f874fc35d505ebc5be426bc6e4db7e"
+SRC_URI[md5sum] = "d39e6446e46f939486d1a8b856e8b67b"
+SRC_URI[sha256sum] = "94088d3b87f7d42c7116d9adaad155859e93330c6e47f5989f2de600b9a6c111"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.7.4



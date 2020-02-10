Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D99D860B34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 16:02:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so8448244wru.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 08:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/Uc/mTjqIVAzhrUbBj+THXImp/d72z1qNDzjmDlH3mo=;
	b=AseKl+bL433gfuuTge8Yc3yHOQrVn1HD+18DgrRycI83fVFwm8TzZa1SyV3t42xhQs
	QkLM0YJcHRhcjPimK75r2ctvACq2AQEvdiMvrtoExGQWjNSrNcGm8ZZAfk2YXL7WCzLG
	wlo3P+XaA8o3H9ZMXPcO2kkqqfqJk7OMzOcqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/Uc/mTjqIVAzhrUbBj+THXImp/d72z1qNDzjmDlH3mo=;
	b=PI9eIFd4xSD6oqaV/CFua44LyGlyasT/x/+oNn/YjS1bLBlGjCxEQ3x5U4aeRfOkPc
	DaUHl3SMEaNlaPQd9RXxELsCyf4wHDHJvfKVM8P4eUsGlUvM6Gy5lEWUHxTDtuCbgmGD
	JzcI7sg/e06vaogsO+2/jpoeC42iFaU9IGT+lQRELUlJKaQsRyCdmNLB0sFy281dV1OW
	2zphLpzf3CAZTIk2dvXWzoofHS3/nIF48abq7fCknX8LJ5jZi/JRoCxah1uTwqs6gDwM
	KjNbBkbS06sFBDRaYs1aWpivhSvL8rPLjxt5uWd08yAgz6ti2zzkCVj6AhaBQq0lV/vo
	gtDw==
X-Gm-Message-State: APjAAAXii7Ue8gLchb0xwaQHqRo36u3dT1j6oRuEoITxrAdCB7dXM+7O
	CfdrJpb8VSNTHuIJTsKAutWjcaWChok=
X-Google-Smtp-Source: APXvYqz97CrAjN5Ioz23gdCB6OyPdfrbos9Owbio8D8AwXj6eLmPbL0Wl+7lulkwmVcna2F30VDGzQ==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr2751507wrq.206.1581350548138; 
	Mon, 10 Feb 2020 08:02:28 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g79sm1088531wme.17.2020.02.10.08.02.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Feb 2020 08:02:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2020 16:02:24 +0000
Message-Id: <20200210160224.21246-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pkgconf: Remove pointless DEFAULT_PREFERENCE
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
X-List-Received-Date: Mon, 10 Feb 2020 16:02:28 -0000
Content-Transfer-Encoding: 8bit

There is no other version of pkgconfig to have a preference against,
remove the unneeded variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb
index 94bc112b9fd..732ca2a0348 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb
@@ -8,7 +8,6 @@ BUGTRACKER = "https://github.com/pkgconf/pkgconf/issues"
 SECTION = "devel"
 PROVIDES += "pkgconfig"
 RPROVIDES_${PN} += "pkgconfig"
-DEFAULT_PREFERENCE = "-1"
 
 # The pkgconf license seems to be functionally equivalent to BSD-2-Clause or
 # ISC, but has different wording, so needs its own name.
-- 
2.20.1



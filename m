Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0C07774C7D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 22:53:06 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j11-v6so16364330pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 15:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8QRHT8j5OUOXN8e1LNFj55rwL6VUSK3j7x1xbQ4Dvrs=;
	b=ijbQ8jI/3bn95EX1K3STYEbU27NxUQWCO9LwlrG8mZ9gUPEsY50mOjW+gtJYlm+4bu
	lERid7ldVErF73EdeGHMcoZT78PE30Lnmxgdfxk6p2FWflgyDPdsR+wOef5ZC8EK7yYa
	p4vVFWP6VkbDdx7zLRX0bvdJQ01mI7sgCqK/Obgvz6wV4UXOKCWpD4fY08A0C855UwKx
	aieG7Lnl2NtZI1VqU0+0L0+oFiPyBXxY3r0N0Z+YlsqqBtCQbiSfhv2dCJZskG3SDxxI
	j+uMg9uGAHHFqeXVGgY0mEWCpLAR7rPMRX6ZGtnGjFqnswXaJx9cRvobIa9ldxH80hjd
	acdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8QRHT8j5OUOXN8e1LNFj55rwL6VUSK3j7x1xbQ4Dvrs=;
	b=UVSxE6wq9V8g9Uy4EKRf/upzCVJdlu6nwV2z022Z4iJlKyepEQQtVEYV1t0PuW4DFo
	lp0Gq4QEjvFL5ugCZjaxPjL0EFbHp3i7yi9Xdxhz+DFQXt34LyMXAAXAXib2jDFA9+dw
	nW0TJeiUE/58RIQTdmmAGMwuKc4orEZNicDKFKH6hHTr3jjf7eOUjSiJSeFbI1aYeQnQ
	USotI9QzxwDmuIr+5yUbYtssCfzBgR015jeWNx7Zqck6PHMZkOYb6hoe/nYjiZJwe5f2
	vwJaWoWF51p/cb+RHV757O/3SBRZzAAnl2Dp0jRgUNbOaTekMJYAohELOEqeHtENSqMD
	XREw==
X-Gm-Message-State: ALQs6tAz2Ms3FjLQxrL2eaBeKKaQaZGEXA9xljqnlbmnFV1d9/ngXM3Q
	ZWGNw4Ow7DLh8aBwp3AEDwscpA==
X-Google-Smtp-Source: AB8JxZqQ1qAL3I733wCzmMTrmlx29W7O/ToE7E2eXioTj1jlVk2MEJEZ0ZNxSo/P4HeXgJRH9oE2ew==
X-Received: by 10.98.254.17 with SMTP id z17mr28453935pfh.105.1525474388001;
	Fri, 04 May 2018 15:53:08 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w26sm41378391pfi.17.2018.05.04.15.53.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 15:53:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:52:50 -0700
Message-Id: <1525474370-7913-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
References: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 8/8] rpm: move ASNEEDED over-ride into the rpm recipe
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
X-List-Received-Date: Fri, 04 May 2018 22:53:07 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index 818d3ef..d49530e 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -73,6 +73,8 @@ BBCLASSEXTEND = "native nativesdk"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[imaevm] = "--with-imaevm,,ima-evm-utils"
 
+ASNEEDED = ""
+
 # Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
 # libmagic also has sysroot path contamination, so override it
 do_install_append_class-native() {
-- 
1.9.1



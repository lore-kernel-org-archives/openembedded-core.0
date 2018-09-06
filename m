Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 86D4979608
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:42 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id j62-v6so8498242edd.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qMZfwUKNUPxtYJrJz2rZ66Ds3GfdmC24u1YttvaTQQs=;
	b=Mh03xpXFp/TaJrpBXW/EK+AFMnifRieAfvyIwkFy8SkT36yGBoL/W/kGQfkp0Ny8j/
	gX1Fr5Em87Gu8G6OCS+T1WrTuyesQZDGrxPTxB9q9dE1Z1JsUBfW1jMztYMUsgUydpc9
	E7YCGAFmF8WMjaIcY5yRvteSwp+pf1CLuq787xUCvhqVNbOmizcH4IW3GtRySTtbzB4i
	ePP2Ar8D4ZNYi8OUcp1wEXl4EZ/03QursE8DDoKw2gcMsoOub5JZ28VJ/gbdjmHiY8A0
	4+WTQuuLajWo51ogHvVHOnjLt4J56VhCc7e2ebLgqRiq2HziFm1IIhzXnrKeIu3BOfOD
	sedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qMZfwUKNUPxtYJrJz2rZ66Ds3GfdmC24u1YttvaTQQs=;
	b=KV1vmw2z9M3KxHVlHIKXKMeXXjPiLX0CsO33TUY/Vw+ZkKJD6iXLVTY3KEiQkOYwVp
	Utre22qKR97jFWhETbMPK5CuhVI5XKGT/NEmpRFtcrHipKSqDK0tA7X5DkLV5VK7VIRe
	nRfTJSmL72nIPxj//apho3qElMPtUGaMleH/G/d6z63nc8VTV35GE3jZcaZ991WPQcb/
	HMhoySSbS2KpnmHwi8/xlj0hnwI6TvUsTpr6yNvjKgLy2/YtZpEU8hi48rXe5Q+ecSij
	jEd3xaFaj7cH8sf+4S1torR6uE5ZsOMcSXPeAkoJaC0MNFBN/YjU/LL87IQeeoTe691j
	iQbw==
X-Gm-Message-State: APzg51ABatJQ9kEJihofNNCqKJwULgqZA9z8T2tOKOnIsIUo9NGnWjIE
	lSAK9YfK4EDy7MDgYBk4Z9sydNiWfjo=
X-Google-Smtp-Source: ANB0VdYyWS5k0UgCOHrPynsAyf/NxBMcNIaB3G7k1bP+4VbtQr4l+4YNuWatmcNcZDA1ppA4Qw5WRA==
X-Received: by 2002:a50:93c5:: with SMTP id
	o63-v6mr2827309eda.154.1536230443101; 
	Thu, 06 Sep 2018 03:40:43 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:18 +0200
Message-Id: <1536230436-30342-3-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 03/21] bzip2: do not perform upstream verison check
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:42 -0000

Otherwise, latest version is reported as 1.0.2 which is less than 1.0.6.
Hopefully some kind of official homepage will exist at some point.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index acbf80a..6cafe26 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -20,6 +20,7 @@ SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
 SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
 
 UPSTREAM_CHECK_URI = "https://www.sourceware.org/bzip2/"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 PACKAGES =+ "libbz2"
 
-- 
2.7.4



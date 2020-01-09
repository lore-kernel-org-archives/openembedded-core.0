Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 417247FE92
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:50:13 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id x185so2738662pfc.5
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=j1zQy3N/aKB07eXNIb7TfqE2gNTIT2AHseKItqLruz8=;
	b=opwwdu25LjVihfm770Y6+UaddR2HY4f4HHM7Wk+sW5O1Xlv1xxCK+M2hr4aLSPEPa/
	CPXXMvq0UH6HBgEEhEqLz/489VegHCNAHcsh5ubJEjPYw66p0n+aZH8TtWpOTz1vx1xs
	UC8eupRLoLdUcI9e/4rUJh+1AG4VeWVCsEiKKsDeoiE164/MnwyKHwpwkd/LDHndTie8
	1z7YJkzdk0HMefa6MeNIZSyWv7rUblGt7AoHdY/1mJ+cEELiGlGNNvpeiEPNVX1XjoXw
	zXOwsKC7eUniRG4c0ZQ6p0dlVvOcMZnHrziCf6uM/mlZefYqdiPjHENDIhMkOBBpATTs
	7KMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=j1zQy3N/aKB07eXNIb7TfqE2gNTIT2AHseKItqLruz8=;
	b=mHHGfMedkko3NOo3WMfx/ONm6XA7wMC+x50REtAOIzKWyo1I4AjeqHoDlNddn34uSz
	DiVolb+4B7fqAIG6KwFXtMgUvdQMILm9fsvzadkqnsL/sVGSCRJOtls4ek0117HrmAOc
	Em7d/5QR4FfzQJA07EoMlFeT9args6oETNOr5cZPA1Y7D2TaRF+X00tVUGMbiYDUXOxX
	gV5B+8DtWOHj4TnW0SgXWfKeHdBFE4e+QSRSla8jaV3NGvJvU9KhrrNTUk0Dvo+obS8N
	egCyaEo9LdKz6FdY+AkfCHpdP8KLhmbL4COz9JCI7TWqgxZlCnjq/6+Szwf9RqixWCFs
	EnNA==
X-Gm-Message-State: APjAAAWBD3Q3BVCo6aYgfm/c/WKRQi1rGAoMrkOYZ9f3qHRdY6iZSm/C
	2qyMnhVOHh53C4g5Wx3306gjNDwt
X-Google-Smtp-Source: APXvYqwrMjfB9TQ/o1n2jq20akVW5oV9FIgfuC7BC+aqQR8bG8nW1LrYeh9NWC+UFJN4n9NtwVAyow==
X-Received: by 2002:a63:5062:: with SMTP id q34mr9094435pgl.378.1578545414121; 
	Wed, 08 Jan 2020 20:50:14 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.50.13
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:39 -0800
Message-Id: <3534f17752eccdd62eac8809d7842e9d25fa770a.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 20/28] reproducible_build_simple: inherit podfix
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
X-List-Received-Date: Thu, 09 Jan 2020 04:50:13 -0000

From: Ross Burton <ross.burton@intel.com>

When doing reproducible builds inherit podfix to remove the possibility
of differing Perl versions causing manpages to change.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5dc43edab4787906f2c9f51e51bf78d1dc966286)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/reproducible_build_simple.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/reproducible_build_simple.bbclass
index 8a60deef3d..d0842f0f90 100644
--- a/meta/classes/reproducible_build_simple.bbclass
+++ b/meta/classes/reproducible_build_simple.bbclass
@@ -8,3 +8,4 @@ export SOURCE_DATE_EPOCH ??= "1520598896"
 
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
 
+inherit podfix
-- 
2.17.1



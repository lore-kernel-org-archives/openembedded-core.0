Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 814A560D7E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:36:00 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id e25so5091814qtr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HOIc125nWwQDT8a6mGG7GnH8QjvmY/ntQbI8TPT2IT8=;
	b=ivzNgS5nYaBz3mJZ4DC1rvmzkFuecFSucKhmJFM0/Vvk2Tv1z31bG8Nvi/cA5pTZGc
	lLuB363n8fa6GBAwtkdqGOVds11AGomoIbZRe0rW5gGcYzxFQHle31QZ4mGFfDrmlpEO
	8dfiLlkI9OkEzp2fQ0TuLPshAFzf2o5k7RaPj7aNzZQsbg+iPv2IZZRVe+TfFDew0iti
	d4OzncJsPlgiRDqLhH7NfHxWFPcL/pLjUJHx+PmIxvuH8FxpYhWPiMLSZ0slXdY0Xq5T
	ueo4pQfzPIsg+59G++JUDV41ZeFx2sd0uFPrebgXTWKHMPBwiwen3tAZ+v+ii0xj8UGV
	D/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HOIc125nWwQDT8a6mGG7GnH8QjvmY/ntQbI8TPT2IT8=;
	b=eS2WG/RsqgKL89F2pqQ9k8GsntIUo08FQkEWW/CD5iCHFVbRA9BSWBjxi62i+QaFU7
	9QZzrIKCGW1KW+rX7HFfkkyVPrAI+Fvbi/ZueTLm2GybyLtH+4OFhsRQF3oM4Yji5dkr
	cG8GCFkkZAu7qK+JEOvpYZzHpjdgNn6rp6tIoeWy+pBQNUg3nhoqXm/hiFf8/dZcQCkl
	sdvjQ930BU3RiqOARVT/5PKWD1l8WiPeuT3QiNFvOlzE3uPSgLD4/d9Bg0CBBVojEraD
	z7EnCEWz+IPMeuseordcCnJc173E+BY0hsZI9Y4kzr5nTpPLE7jf2Y4G1N+nk6bjqZ0L
	rRuA==
X-Gm-Message-State: APjAAAV+FPG6eWQk2QzqTHfkVnQvUiQb1ySprqQjJejW3GdqGCbdVrBz
	Zrlv+0FJUDqIJmavRSP7Vqk=
X-Google-Smtp-Source: APXvYqwRgC3bikZbLcBOFhjKmCm0yGcfhruXLAElne+471q+pN/YGRWUPedJ7mL9ovtFHehbInhEqw==
X-Received: by 2002:ac8:554b:: with SMTP id o11mr3673275qtr.36.1581010561313; 
	Thu, 06 Feb 2020 09:36:01 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.35.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:36:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:48 -0500
Message-Id: <b82f5e5c3a6271a7ea5d868bcb6a25099a7f7dc6.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] kernel-yocto: Drop setting of unused variables in do_kernel_metadata
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
X-List-Received-Date: Thu, 06 Feb 2020 17:36:00 -0000
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

The machine_branch and machine_srcrev variables were set but not used in
do_kernel_metadata.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index a0362f6acb..9a4d2864eb 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -99,13 +99,6 @@ do_kernel_metadata() {
 		fi
 	fi
 
-	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
-	machine_srcrev="${SRCREV_machine}"
-	if [ -z "${machine_srcrev}" ]; then
-		# fallback to SRCREV if a non machine_meta tree is being built
-		machine_srcrev="${SRCREV}"
-	fi
-
 	# In a similar manner to the kernel itself:
 	#
 	#   defconfig: $(obj)/conf
-- 
2.19.1



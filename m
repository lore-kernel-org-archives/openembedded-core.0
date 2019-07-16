Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 40EBB7E467
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 12:47:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so18560136wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 05:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=93AMxX53llWGUYmFmQSrb8wwdakvSZUbFq+Etg4pyao=;
	b=gik5jCKWMc+un+L5enNGmtMQGlORUA6AZW9SLYJdz//8eJ1TVeIp1O/DGRS5zNBGX+
	42xLXMaxn3SrwyzHf3YTNAnSeKUOS3g48Z42/UpvmB/L2UDs7Io6GOexwOulF5njpJZa
	q4RXWSUE0PdxEBxlDiVvfyIReTSZ1PVcc4YitnTDAtsg9B08R++l5p4ClipgS51L55XL
	gpECHwcmuFVu1Zb31MDtRq8cRsT2Oaza2gZC+h3XMR42ytAjp3zmrRFhzzF5o6Dejm08
	9RhsbeGKrpQSGwJkJTCUzfEi1UM5GV3XSllb91phsHzTLu/ksRQ/iZAyLifcQoT450fc
	CAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=93AMxX53llWGUYmFmQSrb8wwdakvSZUbFq+Etg4pyao=;
	b=Vo0ppzEnhwcWcvIGB/klgTvZ/cptFFnkxpZAJAdFy8bFd/ghrpka7rdRCAbl2hfhsV
	UiG+OdxLZyKXT9hQ7RT9QZv2pIJv4C9CE4wwhAzEvN1Kfl1YqDe5lGVUk3CBlAdbl8dB
	WUs66YXX+jG6VfyA7ZZp5v/suPhv0Rj6hbQcNhTCNPeaPQPnC4/7+5NovK2mnPPF7jSE
	tu72CZhICriIqK/A7DdNMTq2OmGgXXGTT2OR7mm6tTNZzcgBGD6WjwWdR4dEB+GSCOYJ
	RNnj5UzBDETSgpizh5R1kgy7iVnpShAdZOQ/7mWVX8mo7XOdeQ8ZRBmxL8AEsUPexYpW
	iqNw==
X-Gm-Message-State: APjAAAUrbSDfmw8d/fmfhbJJTZyw37+bJcDZ5zZQQ9BBq2wkdrqQZ0KH
	c6MSZEQ8DTQw0USc6XIk8R5yZnCDa/I=
X-Google-Smtp-Source: APXvYqzhl57GoUJxAbVt98rL/rYA/1FEJ+JE8T0LLONacAEO95WQ8GqTOef/r7yBZYRJlJ1mKMU5Lw==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr29506601wmh.129.1563281249792; 
	Tue, 16 Jul 2019 05:47:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f7sm20324924wrv.38.2019.07.16.05.47.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 05:47:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2019 13:47:27 +0100
Message-Id: <20190716124727.22342-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libid3tag: CVE-2017-11551 is the same as CVE-2004-2779
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
X-List-Received-Date: Tue, 16 Jul 2019 12:47:29 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
index 8d09ce7b6f3..10e089018c8 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
@@ -6,6 +6,7 @@ https://sources.debian.org/patches/libid3tag/0.15.1b-13/10_utf16.dpatch
 Upstream-Status: Pending
 
 CVE: CVE-2004-2779
+CVE: CVE-2017-11551
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
-- 
2.20.1



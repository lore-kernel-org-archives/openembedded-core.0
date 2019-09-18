Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5C18FF33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 13:27:53 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 5so92262wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tFC7flLrPKhJ9auKlwLEdvQ6VvpMVv7XKaVr2QeDFlk=;
	b=jHhR3c4pn0tzZLp6h755aLe1bTQtVJOjLTdlBpZamBiCLmKgTPpWySJOhtR7A5f2zr
	10v2IlYYfByQ+4KqfcCzM23L4WqveXbPI0NyyZWvp1hStAfx1cRKRSpxgHV4StnCTAaz
	0dQ2PuPQZgr/VnBDa05ErwHBoYTabIE1w3g2GtHTCZNkoFCyqkQ64L5f0bhzHqhBtUqP
	81tAPAUCz0PcZXByoOC3Oa03nAO5JZtB3MLE3zIVWWydN+8ddkOhZdADmdT4JflFf3pi
	TUlI5KlIWBInq6+icsci4UM+o6WOsn0OWanxw7ROcgYhUh+ULJowZfR9A7HeHlIfmyQL
	DQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tFC7flLrPKhJ9auKlwLEdvQ6VvpMVv7XKaVr2QeDFlk=;
	b=Mfat7vF/zQDS1G2LO7S1G4iR8m6z732dM20XPECulgH14PwPCS1UTerSnPi4SJoabx
	YtAdZ11OHCMTIdLIW0T1OAI1KFoeLOekVcXl3+FGy5PI60uploTeBOJRcV0EdTBoHOIe
	v3Qd064dTCLos/9vYhQgSyCHp9YwXPJifojiIKp4wmnhpMHMh3gXMvUnT78aB2lIcI5V
	XSfusCYAnBFGB3Jf0oW0ufVD3Pdutnt1m99SGa4TojMD/8R2zkqPiQBU/SRuQ50Gej+e
	wJnk3KgCxnQ2ZZYRUkqI2Vj8Xct7s25EDyFPdXI6O9cNkEiAv9ncw88CNUHRf/6u/S/W
	Vo2g==
X-Gm-Message-State: APjAAAVfgPTlGF7Q0e82gS0nzt+vtMKHuR1maLi8grQgRhcTBCFOT9BY
	FBxQMSc6tnF/ZbV15i5dqRJ/Hlrc8As=
X-Google-Smtp-Source: APXvYqxkfJmpm+How/0FJw0zAoFbkPf37H7LoEjOD6jqG/nTcwPNVVWRyErKqJwCGXcXGT/871nx/Q==
X-Received: by 2002:a7b:c10b:: with SMTP id w11mr2827685wmi.108.1568813273678; 
	Wed, 18 Sep 2019 06:27:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d9sm7812207wrf.62.2019.09.18.06.27.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 06:27:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 14:27:44 +0100
Message-Id: <20190918132744.11195-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190918132744.11195-1-ross.burton@intel.com>
References: <20190918132744.11195-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] piglit: upgrade to latest revision
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
X-List-Received-Date: Wed, 18 Sep 2019 13:27:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 0b6519e3f8e..d489f82b14b 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "f0e868ac6fbdc295b2955c1b8f73169e7a52f938"
+SRCREV = "0d1a47a4c10d4dd7225bd6510f8191684b31235e"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1



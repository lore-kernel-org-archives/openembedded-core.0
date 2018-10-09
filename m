Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id ECE427504B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 14:05:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q5-v6so1962869wrw.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ZZCEzCz+c+WLdXipeBNTFZGc9v9kro8CFvzNFvtJU5I=;
	b=F/0d2MYBZlVeHfbThxWB3JLfdTNuRuJ2WT5HoxLjdnwRRb7Jla2aFdHv8UDz0qldF/
	NHbTVF/ZLgJhl4fCFADLmPuJgWj6l0cELbEgEcIH7CfLmpc+zd6REf2Mznxzm7G6jGM9
	o8kOqa4tj1CLR5ascQtJokHC4avzY59wyyD/AnPuTMIkMF1c+pweX19zogWyjGhQgCXd
	YJ9r4ht6fzOfQ9guiEOG1X6vDjfj1WAEtI2HfwvmiPO9pEkX9e0IO3zMDsSFdt0CYngC
	ZNUS1P1pCMQM77o8tsG+mkeiMUpyKhb4M4lc0WI/0oSCU38ZdkTrovo57hdYTfMufwbg
	YVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZZCEzCz+c+WLdXipeBNTFZGc9v9kro8CFvzNFvtJU5I=;
	b=ckSh23ZfKDoGljqczALLE22P0StJ/T/WVCjwg4JYrCg1cmcK9Z67O3OSEh2PpBbxoD
	EDYiVVlNNiBWch48LklqKPdinxGaYOyc/k9X+woKC+gl9YFkL+SN8JM1lDN57B+bws53
	Jp+0BiXgekOZYmjDvnSwfdheZ2/OwipEcHufxa+anLlnciQrCTu9w/flo0rt/ZCTMRDe
	7JLKWe6fyVf4AQor/NIGNSDdm2ATNsnTfqF2zpmU4ReNeVxxPAloZ864s3vrx4qcFAez
	Bxseg59dYQu/xYAqapzJg4bP3519I0MpfZjfiJFyYsDTQCjrDMD87tqiUSv5BLOQEKMS
	mPrA==
X-Gm-Message-State: ABuFfog5cZaK1ILbWX5hvz02PAegiQNlMXMJ40nrwlMF0Li5HdnbqFxl
	s1lkVtIRkoGJ5hM9Yly4q/GA9RZcNSQ=
X-Google-Smtp-Source: ACcGV61LAa758bQ/lwn2kdbhbziiV4IH5pTuQOqp/Mu8RAFy1LDWpqqCI85TbsI2QG3NqxNAIshfbA==
X-Received: by 2002:adf:f8cd:: with SMTP id
	f13-v6mr20190439wrq.265.1539093937036; 
	Tue, 09 Oct 2018 07:05:37 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a5-v6sm13141345wmh.8.2018.10.09.07.05.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 07:05:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 15:05:34 +0100
Message-Id: <20181009140534.15298-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] perf: make tools needed for API documentation respect the manpages PACKAGECONFIG
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
X-List-Received-Date: Tue, 09 Oct 2018 14:05:37 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 514c87835d0..586422f769e 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -22,17 +22,15 @@ PACKAGECONFIG[libunwind] = ",NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1,libunwind"
 PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
 PACKAGECONFIG[systemtap] = ",NO_SDT=1,systemtap"
 PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
-
 # libaudit support would need scripting to be enabled
 PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
+PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
 
 DEPENDS = " \
     virtual/${MLPREFIX}libc \
     ${MLPREFIX}elfutils \
     ${MLPREFIX}binutils \
     bison-native flex-native xz \
-    xmlto-native \
-    asciidoc-native \
 "
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
-- 
2.11.0



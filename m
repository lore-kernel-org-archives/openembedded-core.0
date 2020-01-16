Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6BCAB7FA47
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:14 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id n59so1739064pjb.1
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1uv0pRZRRzGkLeLmRBRVSgzmq0HSvsM34XHFcu2bJOg=;
	b=uD+e/b0pQ3pYOKaNmlkD7Kz2HysC5MCyQ5k/3UxWMaSdIKo0Bxs4LPQS6xlJebZFMe
	EWT7RRqZeLn6fblQ0w1c/nKAMQBfOcatS6S6hH/dQ235LSemf5xlZ2O3/PEnGeG3RZeF
	DAlHpkMcfFoDaEKX7+qtV7eDdZjjJcnVN7AWWxttTVqmoz0ThlaiLJiePMtiAunQfETK
	Z9W0+PrtoitDkjesV7oGMYXFRO77cA3JpGUrquEaNdak6VZsqbFcTTcNyuv2xiiJXFab
	LHqggPpiyNTEooDlJtkMEXCVR5yzxDaF9dHTOCNiznNaiqa41EPCL6HFzJrSkCrHlZFR
	a1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1uv0pRZRRzGkLeLmRBRVSgzmq0HSvsM34XHFcu2bJOg=;
	b=jfGIqaEOC+GP5TITxG71JPNIyPchbdHWCj4EkRjo8NJhVbAM7A+28rldldNIjlVz2g
	cWhPodeCJPaywac/ljnlLhZyhE7diXWUhicQ6SyP1994K3Uu5TFm0wxt0DiFyNhJKNkG
	9k216CbMYsXCvZCnCLNzLqmLLzA0wCaJsPBvAcNci0qLGiWBSZ+3TgsWVpiVUCGi8716
	+x6iYThMBigeUzT0DOZkm5Q96cJWSlOWm1AHc86f9eN3Vxv4uvUTHRaYtHpijXl953eU
	23rrwtbNMvCCUtuCSgcAPT85+VokRrd5yjQ7gN8RGnNu4xULUggTuO62knxC2s2StBSU
	FnIg==
X-Gm-Message-State: APjAAAU2784VGgSc4/WxFlKyYTFrbPaQaIJS/qoOE7q9zL1YOtcVAqO2
	AFyBl7VO2dLJrlhmpvjjTz83rTrQ
X-Google-Smtp-Source: APXvYqxLztz6FTXw0wN7hedqqLPKUPqpOz4myGbvV2ScipymgTVxPDC4NpRtuE0fq+1Pxa3eegnW5g==
X-Received: by 2002:a17:902:247:: with SMTP id
	65mr38557609plc.108.1579188075365; 
	Thu, 16 Jan 2020 07:21:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.14
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:41 -0800
Message-Id: <279c4da2e5f46dccfeff0c898c2205940be9e174.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 32/32] stress: update SRC_URI
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:14 -0000

Fixes:
WARNING: stress-1.0.4-r0 do_fetch: Failed to fetch URL http://people.seas.harvard.edu/~apw/stress/stress-1.0.4.tar.gz, attempting MIRRORS if available

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/stress/stress_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress/stress_1.0.4.bb b/meta/recipes-extended/stress/stress_1.0.4.bb
index e9179d3e19..42046d5bf4 100644
--- a/meta/recipes-extended/stress/stress_1.0.4.bb
+++ b/meta/recipes-extended/stress/stress_1.0.4.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://people.seas.harvard.edu/~apw/stress/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://people.seas.harvard.edu/~apw/${BPN}/${BP}.tar.gz \
+SRC_URI = "https://fossies.org/linux/privat/${BP}.tar.gz \
            file://texinfo.patch \
            "
 
-- 
2.17.1



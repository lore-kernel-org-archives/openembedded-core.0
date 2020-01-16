Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 435207F8C8
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:03 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id n9so10339314pff.13
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lsxWaYGbqikKsAcO8zU+dHYUe0haXlFrDheUIT45lj8=;
	b=WisIShmVGX1PoCYqPAvbPjCg6DaTpEebAWLQXPBq4J0yfJbmnhK7NFYTbmxzaHv/VT
	43KMtr9kG32Da6kYzxEE3oHwh8/hTu4SR7cNTKYE9Zr1DJYTntvuwtGGHHMvxG05maeH
	Y+yMEQiM8nMvGNFJR5R14sI+Zg3IBWpjBDup/X33ysF90E3bKgAeXIEPoX2vJccMy/dU
	gvG6df5X4GRIT5fNZqKvED2MLcr0PHKyU3EdxCrDR787dPwPIU8T99CvJLDCXnJEOAfe
	OlmWb4Pcf59l7pC4lrPe+eqg8oJF5z+eIXTqe/qeimIY5a+G1CBdjwY3EIkfkm2cS7+H
	r/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lsxWaYGbqikKsAcO8zU+dHYUe0haXlFrDheUIT45lj8=;
	b=e3+0QgN1cisazPMOT52YkZWEtY+vRG7qjW9SFesHSQwzl0p4rBY7Hv0i7Gx9osQ/vW
	tJZwU1z1tOZMfIuu6On57tzF/BMpO14OkOVakkn7gcOUB/wPB8ndXhjt48C89CC2QPA3
	EZPQZKxhB1uVrHqz4IcirxnNOMqR+OY9x2KMiyfl0nnLkyObAJd+6jGdWCj+9WYqzToz
	TpGqRTt5ELgTD1+i1uTZvHCQnIIm+z/OIN6jJX90LFsGdSyraNVmtPJcpD2JjwbCSyeA
	J/svjbi6g9h7gy00QnNnXLk+Ja3d0Df91cLD9WiMjiFVXyV6GF30PPvHL/JQ/B2N+r+9
	W3SQ==
X-Gm-Message-State: APjAAAXDKDfNU44rsSzEo5+wyJ8cyqGDFWf5bMuueBm4UKbJiZ0z8y6o
	cNXv88WZ2NdcA1leUZG+lA+Ni3TR
X-Google-Smtp-Source: APXvYqwEqArleeXiTfxGKWEuzdmfpMCh1QU/9XvLN4rluAcoucHfXuR+yLgEN9PZCU7a60Xt6jYWEw==
X-Received: by 2002:aa7:824d:: with SMTP id e13mr37763689pfn.247.1579188064222;
	Thu, 16 Jan 2020 07:21:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.03
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:29 -0800
Message-Id: <8bfe83d53c39e4a88f808af617db7db091694841.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 20/32] cve-check: we don't actually need to unpack to check
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:03 -0000

From: Ross Burton <ross.burton@intel.com>

The patch scanner works with patch files in the layer, not in the workdir, so it
doesn't need to unpack.

(From OE-Core rev: 2cba6ada970deb5156e1ba0182f4f372851e3c17)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1c8b2223a2..3326944d79 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -62,7 +62,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check after do_unpack before do_build
+addtask cve_check before do_build
 do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
@@ -70,7 +70,6 @@ python cve_check_cleanup () {
     """
     Delete the file used to gather all the CVE information.
     """
-
     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
 }
 
-- 
2.17.1



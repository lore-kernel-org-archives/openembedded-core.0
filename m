Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7F88C7FDC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:19 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id az3so4638631plb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LuP2wiFsof9rpbca9j7vIN1wkcfCRmcayt1itdNjwW4=;
	b=R658k+aBQaJWNRgjiKw+LcqVvVMNIdxlyrNXeVPRlUU0RIv8/bPit9v0p37+26vY2n
	c2MsMY50ZHtdBguLshP+hWPm5zCX94WzoX9EIMje5Qo/mcuquPYqKFN0egNUIBtce/IM
	tjmgJLdxhKNDRqjf9R3GGp05zStbksM94HXTNJ5yhrVLgOe/dLB8lvk7bYp2idWHDrQf
	EwJNovO5Dmb0hkkV6ivAs/KTvA5CUDZG2RB7PkinjWhZeQsFNpWWnkuaUmmT5064WTvz
	F0u15CY8BsbNCP5eJbi22AXyCaEIU3bnqeoyYu1kFJkcVvZeE2uakYH73KGtcTau6Zpi
	MSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LuP2wiFsof9rpbca9j7vIN1wkcfCRmcayt1itdNjwW4=;
	b=N/4SYm8FhMO8xIKAd9ZaC0vPegF64SK1e467ZUYFVD+XAPL1o5uUoYoVidsuYIX6YT
	illxMGKZUfheUQquvI2My5ThFNfWdQMR2y9xQUUn1PmtQL787rGJgNJs7C6HuSYGJ08m
	lVcSmMnTHl2xaH+90mBKDSgC6eQ4I9YsWgXGOetPjabH7rhk4kxlktQ0UynIkypPWynd
	k1l7GpqN76Ga7cKgqDz6BMzf3ou4YKsYji1swJiR3A3SYcn4WvoV0PQDy1k2A35Neg95
	2vneiQGkYX7DeNrm0ise3d8ntXTSWaQ/O5QnxEcqU7kSHIKRMjHUQ4TPb91UwfvfTfGj
	kJBA==
X-Gm-Message-State: APjAAAUbPMq/6+6A8vbmQdsArWJCk9cMfeVyDnRNek0DP7rs//pLUG3+
	a+IpZ9BR1nNzHkIDJFsii+cR9rkkksI=
X-Google-Smtp-Source: APXvYqwEM0HMthDkPCy/oe36C5h1V7beygaiqWj3qYG4IIrkXvDA0pv8gzw5VTTCyip/jLMjOsNhjg==
X-Received: by 2002:a17:902:8649:: with SMTP id
	y9mr16854539plt.67.1576512020546; 
	Mon, 16 Dec 2019 08:00:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 07:59:59 -0800
Message-Id: <cbb5d26d88465c95a4a879f8635253259e8df0f0.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 09/18] cve-check: we don't actually need to unpack to check
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:19 -0000

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
index 1c8b222..3326944 100644
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
2.7.4



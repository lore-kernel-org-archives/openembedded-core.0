Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C04579E51
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:47 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id z23so1680989plo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lukv4t0UNuCqGtrkcB8QMSWtdCBvpCLjt/XKqoCh87s=;
	b=iTKxAtEYnoSCQJb0CnEYuZw//RHD8YIasKBpbO8S7teoRQvPTQPyJb1kOVerbX7clV
	itmCQgW1EXlu9k2OTTVzgnAJn28T/KYS/hUiczIWYyB6cp+Zf5QyoIoAdNjkjusc1gOU
	cRadUj7Dhe2lUW571m0V4oLkhaEu9TUVn0Lpiq8JXuHpF82tF/wCuFdR2r5zCRC/QX8B
	aGqJGPbdrp76kmw6WdrU5vo9za+rf4nPx9Tz/kLDSJSTLxOwGuj+MDOeBuV4T0+Uodwh
	dIH5tBeOk+TlLhHD8WGgjk8WJ+zme76YqQWNDQdhNLCrNhIwcpGR6Fhb1W4p8C7kfXoY
	ynsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lukv4t0UNuCqGtrkcB8QMSWtdCBvpCLjt/XKqoCh87s=;
	b=BEQrsY75oVomsaIU9HZOz8FIdCWOCvD79R9l2g8fLVOp+QyxhXVIR+IhKD90FqP0MJ
	7+OkPmsjzAZgDaJZym65+WLPDaDURk598KIZkFBM52dnAA8H38AfV/UjkMgmucFH1pq1
	GTnoHhLGKBQcIRjXaffszTUlIAeUuG0eqcvYQ5VLnVW75RJHYnlElztwN2mYpz0VyQE3
	Ttdo2bP46ErgtqqetnSWxRtPxtzuq1ANpacOoouMiujch414KtvP8wxzudyEc7MbXa9C
	M5YDH/gwJ3woc5SxsyimLDc/Gobr1/i4FNWMZ3148Fnv6FnJ41kBpeTO80n+azybd1VZ
	+oDA==
X-Gm-Message-State: AA+aEWYz50615oOR/Svy+dN0Q8lnPg/schgGBerMMXkRLaCYCah5OoiA
	E4GMO9hOdXTkPu2FtHZXW4AksbIa
X-Google-Smtp-Source: AFSGD/XxTR3s0MGyxubUVLbiAGwSbgFAkdOPGkU+MCvB2q1OI/v77hE3nL7cy1Lya0ebBpoHLzRozQ==
X-Received: by 2002:a17:902:6bc4:: with SMTP id m4mr405555plt.93.1544737187859;
	Thu, 13 Dec 2018 13:39:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:47 -0800
Message-Id: <6ee699f722afc75f479b46caf3592791beb94300.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 39/45] oeqa/selftest: Standardize json logging output directory
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:47 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

Currently sdk & sdkext will output json file to LOG_DIR, while
selftest will output json file to TOPDIR/log.

Standardize selftest json output file to LOG_DIR.

(From OE-Core rev: 9f2e39684cbbe9f87eeef6a81961e6db783439e3)

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index a5116a7..9a56888 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -203,7 +203,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         runCmd("bitbake -p")
 
     def get_json_result_dir(self, args):
-        json_result_dir = os.path.join(os.path.dirname(os.path.abspath(args.output_log)), 'log', 'oeqa')
+        json_result_dir = os.path.join(self.tc.td["LOG_DIR"], 'oeqa')
         if "OEQA_JSON_RESULT_DIR" in self.tc.td:
             json_result_dir = self.tc.td["OEQA_JSON_RESULT_DIR"]
 
-- 
2.7.4



Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 080596FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:43:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id q8-v6so13722377wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 06:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=MvlmzAIOsW6IylwYJvGWCibZ0FOVEq44fjNZ3IXI40c=;
	b=IHhOwSXz4gnUpxVvkpghgLQyZU8l/or56+FOhBLI4k8SNUlG3NEHpFFlpXButuzi1s
	N1gkoyaw1iXMhr3XDHQcZ3Zhxj9w3WcaX/PVR4kgwh4GBXJ5FJc4kXNKYkaEGJhOSE4D
	egbPLA5SUiHsWdjUXVejtPlC8iKElDqBmtuf//TrEJexsBxsjzkB51mnUHQQordgCuT2
	ctkjjqye9u18KquEt6eQSjON4wtl9FTX1l7dnRLhsBv3SQR4fIajQ71FWDd5Cv2s2Xrl
	0apSddosMOU30HvFauSlyqAxg3fk+AbDw6upEAvSvZCH7trjgNZEqSbQMBYSIDbIk6OX
	yhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MvlmzAIOsW6IylwYJvGWCibZ0FOVEq44fjNZ3IXI40c=;
	b=CC+io1RGg+fm0xkIWlAE+c3SuxDFK7RfmyR4xIsG8k8KFwEwXdLReu3Xzl28S/gbOG
	LfyPD2mSgclmIgbsGOfHRj4zMcw0f0wEScTVqQYpkRfhIHwnYpeFuBcDz8X9ug0/+kY4
	/kVa+Dnv5slkMK8/jNQfOsOefD+42+N/l7EUiXPTomSeROyOyN5Sj3anUygO9l9CxRPs
	kldEi4KqjtmAizqfJCBqUVJmWB0Wd6fLxKQvyRiPqTneCHMJRKe+xGeL+FtvdQQJclmx
	JSTQ+SxLmrnhLNKxi/edxR9rwJalvx6oZk/BiCjVcuOV9PheOrnct9qqaiQ3qc/IPg2B
	LyLw==
X-Gm-Message-State: ABuFfohl7QlPWHqOE82z+6ynKu6ldMe+px1Yy2pdiiV80JxMOo4JkSfg
	zUUiyPjhwFSNEjofFPYbfHiMZ7DlIpM=
X-Google-Smtp-Source: ACcGV630DxuniPIYDFrsJ5SPRHPktxSlJwt1PsJtbh40I9cRzAWPIQlcc/YBt1a5I9pYp8O2xGZ+/Q==
X-Received: by 2002:a1c:2d54:: with SMTP id t81-v6mr783001wmt.31.1537883032938;
	Tue, 25 Sep 2018 06:43:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b21-v6sm1852340wmj.28.2018.09.25.06.43.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 06:43:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 14:43:43 +0100
Message-Id: <20180925134348.5562-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/6] siteinfo: generalise siteinfo
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
X-List-Received-Date: Tue, 25 Sep 2018 13:43:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/siteinfo.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 4698e6e474d..e80835605fb 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -15,7 +15,7 @@
 # It is an error for the target not to exist.
 # If 'what' doesn't exist then an empty value is returned
 #
-def siteinfo_data(d):
+def siteinfo_data_for_machine(hostarch, hostos, d):
     archinfo = {
         "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
         "aarch64": "endian-little bit-64 arm-common arm-64",
@@ -131,8 +131,6 @@ def siteinfo_data(d):
         locs = { "archinfo" : archinfo, "osinfo" : osinfo, "targetinfo" : targetinfo, "d" : d}
         archinfo, osinfo, targetinfo = bb.utils.better_eval(call, locs)
 
-    hostarch = d.getVar("HOST_ARCH")
-    hostos = d.getVar("HOST_OS")
     target = "%s-%s" % (hostarch, hostos)
 
     sitedata = []
@@ -148,6 +146,9 @@ def siteinfo_data(d):
     bb.debug(1, "SITE files %s" % sitedata);
     return sitedata
 
+def siteinfo_data(d):
+    return siteinfo_data_for_machine(d.getVar("HOST_ARCH"), d.getVar("HOST_OS"), d)
+
 python () {
     sitedata = set(siteinfo_data(d))
     if "endian-little" in sitedata:
-- 
2.11.0



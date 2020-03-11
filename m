Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id E745C60B31
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:23 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id p14so413734pfn.4
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=609X12XcHfBrPxik034KVaCAfDA4qNAetJhNCoQ5nTg=;
	b=Arr8S6cVNh/X0TDEbPuDLrc+yJyh1uHy/7bxUMDlUKw5wCmGtNDJ9JJ0Mgg5ncbaT6
	1EWwkGugxJR+7LtX9bbN6glW/sI4jhSsQnpJvnrLsMAmPIO20Hoxd3fexLti+QjDE9Hd
	rnMn8MzwndpXYkR+1yELD0NrJvI4u+i08GnQDAwCp6IBS8uoQqy96rVcw5bjrIFI/+t9
	LTdHaJxhqLbksgEFe18BMOJh7rJtfK7uLA4seMRTITIiWmjonwG024q2JJ+IFaO0Xviw
	aZ+627Ti66jNd94QgYnkS3Mdew7BMZ+BVEyd/Rfin38eg7bd1EbeXMp4xLeMdniePJqw
	C1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=609X12XcHfBrPxik034KVaCAfDA4qNAetJhNCoQ5nTg=;
	b=jDoNbMpnqRcGXJENbk/JICN4yh8UY+Ujv/LKw2yNCuuA29GHyPguRW6/epaBA4y3Cf
	jyaxE9gTBWvmd6HesOfHu4zLhIFJDkOsKIDWXkip7EoHK53NMI4iFa5q0kDvCb6UUAcw
	cjNj7k2lGM17mpPGqeaSZMNKwgWzzXt6QdvZuauQHtUS0OOgDJjCiLERjFtqrWNX75+Z
	XN7aTbtxPZq6ldPvOpGtNjR8EggeKK9WXMhwRZHskepoRwFOymjp0v14fHdOrBVk0T/D
	UTuk/ny6Vj8tMZGyq0G1NF9jiEXNQQzxc8MQ9bD4oAodHbsbWDm2tPxlId2E5y0V8d6Y
	YTqg==
X-Gm-Message-State: ANhLgQ0ZAj7D8geBjTUUaT+0TALH+X3UJ4CEmVZCJIACwv9gp6O//v0J
	Q4CL8g4f0/RMUQpDI1m9oBTtCkQ+
X-Google-Smtp-Source: ADFU+vtK034pCSjJYf4TdTAkBv64O48gXADvMkN/CfZF8imxX5hmG+c8xBkcQcHBI/LEzJWySAz9sQ==
X-Received: by 2002:a65:4bc5:: with SMTP id p5mr612364pgr.409.1583893583873;
	Tue, 10 Mar 2020 19:26:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.23
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:04 -0700
Message-Id: <d313a5912d2ecbf7796e75ee7e7cd1d442b4fa40.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
Subject: [zeus 03/16] cve-check: fail gracefully when file not found
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:24 -0000

With out these changes, a traceback displayed when a file
is listed in the SRC_URI but the file does not exist.

raise FileNotFoundError and print the patch then mark the task as failed.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit d4926c11a4ab9148bdb640a9367c9e1891491a5b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 01b3637469..74124364b2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -52,7 +52,10 @@ python do_cve_check () {
     """
 
     if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
-        patched_cves = get_patches_cves(d)
+        try:
+            patched_cves = get_patches_cves(d)
+        except FileNotFoundError:
+            bb.fatal("Failure in searching patches")
         patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
@@ -129,6 +132,10 @@ def get_patches_cves(d):
     for url in src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
 
+        if not os.path.isfile(patch_file):
+            bb.error("File Not found: %s" % patch_file)
+            raise FileNotFoundError
+
         # Check patch file name for CVE ID
         fname_match = cve_file_name_match.search(patch_file)
         if fname_match:
-- 
2.17.1



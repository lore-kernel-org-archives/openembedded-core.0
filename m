Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1B9770D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:28:02 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id i14-v6so5928749wre.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+qLa31jR7W3cpTv7uNzgyIHdyhC9wIKDbEH0TC5c6Qk=;
	b=cSsNhaT828Dr7Cnl4R4TOP+IB9kQJDVXekju9S7r4wRkOeuivkG0Z3jZu76b8UJvWM
	P/wUTbA7RCJ8z3qYHe3RKD80c+08/RGCog1sWsxTNSvWnN08RuehoKwvzpnWild9QC9N
	adYqcuz7VgYCCv5RpEurpyB73UfbxjHPWYHJVmnbm2SdgHQbXPK34ZARI4+aqazRaPXw
	2oca5vYROfm2yzt9m9cwvWlKiVAAp4r/1j4zoXuiED7cosYhdjntALTi4uOCk/yFpnEK
	CU5OrRq51PaFsfqOHgwxMVC6qzbRAmJpOYvwiYom8DhyivowYqQ2CVGDi6+i1SbxCALw
	mNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+qLa31jR7W3cpTv7uNzgyIHdyhC9wIKDbEH0TC5c6Qk=;
	b=uX47R50Sa5F3ooATpTgxfQyU5xRJvPpwOT1rNa/UookzAWWiQcWaj4TDmR+hidAp+G
	gPLCSKPtmCLr02zf8YwTGSg0dkZuAFu+FjdZdy0lGB8lbVBQa3JsdybcvqtZXJrHG2x2
	IA0Q4WkWKXCTqxxiKGG6NhIbCvypW8T9NJCU62R7UGvsz6Bpx+YG7a1a6HxcCk0hV1/Q
	Q2NBINyHw3A7HDpzNbMGTEt9HEoOtg9Wcr5hGJ4LmU268wfqItvXBVHFx4COoOC/xcSk
	04JQf6ghNJ/KCVSxJQFYfTZo5NX1DwSkyUJYDBJMmjM2BtAKx7eZtO6kl7S4P5kZ3V89
	bWGA==
X-Gm-Message-State: ALKqPwcmyLC/Z7HdyTi40MSDp8kC2JCqe8JOWecCxGPNuQ5+XXC7b/kY
	PPb0DGWp+ZZdCcC+Tadyzvdq1FC8
X-Google-Smtp-Source: AB8JxZpWdbeHJWXTTrPACmi5w6soZzDjvNvlRDb0VpU/4tcUNCixccRCkADPLk4GDOFQp9oSA0kUjQ==
X-Received: by 2002:adf:dc90:: with SMTP id
	r16-v6mr4966359wrj.218.1526056083487; 
	Fri, 11 May 2018 09:28:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	131-v6sm3371954wms.34.2018.05.11.09.28.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 09:28:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 17:28:00 +0100
Message-Id: <20180511162800.12738-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] patchreview: don't disable malformed SoB check
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
X-List-Received-Date: Fri, 11 May 2018 16:28:03 -0000

We cleaned up the metadata so this can be enabled again.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/contrib/patchreview.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index 4e3e73c7a8b..1086c95f67f 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -132,8 +132,8 @@ def analyse(results, want_blame=False, verbose=True):
             need_blame = True
             if verbose:
                 print("Missing Signed-off-by tag (%s)" % patch)
-        # TODO: disable this for now as too much fails
-        if False and r.malformed_sob:
+
+        if r.malformed_sob:
             need_blame = True
             if verbose:
                 print("Malformed Signed-off-by '%s' (%s)" % (r.malformed_sob, patch))
-- 
2.11.0



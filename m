Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.1690.1588836780611181231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 00:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 594E560C18;
	Thu,  7 May 2020 07:32:58 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgY3ZlLWNoZWNrOiBhZGQgb3B0aW9uIHRvIGZvcm1hdCByZXBvcnRzIGFzIGNvbW1hIHNlcGVyYXRlZCB2YWx1ZXM=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Timon Ulrich <t.ulrich@anapur.de>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 07 May 2020 07:32:59 -0000
Message-ID: <20200507073259.2274.37433@do>
References: <7DAEF4FFB8C5EB45824E60252FB85E291F78D2AF@AN04.anapur.local>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <7DAEF4FFB8C5EB45824E60252FB85E291F78D2AF@AN04.anapur.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: cve-check: add option to format reports as comma seperated values
Revision: 1
URL   : https://patchwork.openembedded.org/series/24000/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series cannot be parsed correctly due to malformed diff lines [test_mbox_format] 
  Suggested fix    Create the series again using git-format-patch and ensure it can be applied using git am
  Diff line        Hunk is longer than expected

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at a1353cc923)



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.2357.1591322534812213453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 19:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id ACA2B60FAB;
	Fri,  5 Jun 2020 02:02:12 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcGF0Y2gucHk6IGRvbid0IGFwcGx5IHN0cmlwbGV2ZWwgdG8gZ2l0IGFtIGNvbW1hbmQ=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Kyle Russell <bkylerussell@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 05 Jun 2020 02:02:14 -0000
Message-ID: <20200605020214.20810.78242@do>
References: <20200605013540.18777-1-bkylerussell@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200605013540.18777-1-bkylerussell@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: patch.py: don't apply striplevel to git am command
Revision: 1
URL   : https://patchwork.openembedded.org/series/24491/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [v2,1/1] patch.py: don't apply striplevel to git am command
 Issue             Patch is missing Signed-off-by [test_signed_off_by_presence] 
  Suggested fix    Sign off the patch (either manually or with "git commit --amend -s")

* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (meta-selftest/recipes-test/llvm/files/0001-Test-new-file.patch)

* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta-selftest/recipes-test/llvm/files/0001-Test-new-file.patch
  Standard format  Upstream-Status: <Valid status>
  Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]



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


Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.18318.1586464096123049243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 13:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id EB44A60EDE;
	Tue,  7 Apr 2020 17:02:25 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZ2V0X3BhY2thZ2VfbWFwcGluZzogYXZvaWQgcmV0dXJuaW5nIGEgbWFwcGluZyBpZiB0aGUgcmVuYW1lZCBwYWNrYWdlIHJwcm92aWRlcyBpdHMgb3JpZ2luYWwgbmFtZQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: yann.dirson@blade-group.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 07 Apr 2020 17:02:27 -0000
Message-ID: <20200407170227.2274.85119@do>
References: <20200407165829.3951246-1-yann@blade-group.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200407165829.3951246-1-yann@blade-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: get_package_mapping: avoid returning a mapping if the renamed package rprovides its original name
Revision: 1
URL   : https://patchwork.openembedded.org/series/23636/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at fcc68424f1)

* Patch            get_package_mapping: avoid returning a mapping if the renamed package rprovides its original name
 Issue             Commit shortlog is too long [test_shortlog_length] 
  Suggested fix    Edit shortlog so that it is 90 characters or less (currently 97 characters)

* Patch            get_package_mapping: avoid returning a mapping if the renamed package rprovides its original name
 Issue             Patch is missing Signed-off-by [test_signed_off_by_presence] 
  Suggested fix    Sign off the patch (either manually or with "git commit --amend -s")



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


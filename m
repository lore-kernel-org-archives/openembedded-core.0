Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.62402.1597743168532913632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 02:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF5360F31;
	Tue, 18 Aug 2020 09:32:46 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZ3BnbWU6IGZpeCBtdWx0aWxpYiBoZWFkZXIgY29uZmxpY3QgKHJldjUp?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2020 09:32:48 -0000
Message-ID: <20200818093248.2266.41990@do>
References: <20200818085929.1763928-1-changqing.li@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200818085929.1763928-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpgme: fix multilib header conflict (rev5)
Revision: 5
URL   : https://patchwork.openembedded.org/series/25613/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series cannot be parsed correctly due to malformed diff lines [test_mbox_format] 
  Suggested fix    Create the series again using git-format-patch and ensure it can be applied using git am
  Diff line        @@ -18,7 +18,7 @@




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


Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.3082.1598311977651128944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 16:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id B15AD60F4C;
	Mon, 24 Aug 2020 23:32:55 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgQWxsb3cgUFIgU2VydmljZSBhbmQgaGFzaCBlcXVpdiB0b2dldGhlcg==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2020 23:32:57 -0000
Message-ID: <20200824233257.2264.50687@do>
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Allow PR Service and hash equiv together
Revision: 1
URL   : https://patchwork.openembedded.org/series/25758/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [master,2/5] hash equivalency and pr service
 Issue             Shortlog does not follow expected format [test_shortlog_format] 
  Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"

* Issue             Errors in your Python code were encountered [test_pylint] 
  Suggested fix    Correct the lines introduced by your patch
  Output           Please, fix the listed issues:
                   meta/lib/oe/packagedata.py does not exist



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


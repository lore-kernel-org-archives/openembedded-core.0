Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.11412.1590316385308454430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3B02060F1B;
	Sun, 24 May 2020 10:33:03 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgJ2luaGVyaXQnIGRpcmVjdGl2ZSBtYXkgbm90IGJlIHVzZWQgaW4gY29uZiBmaWxlcyBhcyBpdCdzIHN1cHBvc2VkIHRvIGJlIHVzZWQgZm9yIHRoZSBpbmhlcml0YW5jZSBvZiBjbGFzc2VzLiBDb3JyZWN0IGZvcm0gaW4gY29uZiBmaWxlIGlzIElOSEVSSVQu?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: gzatko@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 24 May 2020 10:33:04 -0000
Message-ID: <20200524103304.20801.91926@do>
References: <20200524102116.3929380-1-gzatko@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200524102116.3929380-1-gzatko@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: 'inherit' directive may not be used in conf files as it's supposed to be used for the inheritance of classes. Correct form in conf file is INHERIT.
Revision: 1
URL   : https://patchwork.openembedded.org/series/24295/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            'inherit' directive may not be used in conf files as it's supposed to be used for the inheritance of classes. Correct form in conf file is INHERIT.
 Issue             Shortlog does not follow expected format [test_shortlog_format] 
  Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"

* Patch            'inherit' directive may not be used in conf files as it's supposed to be used for the inheritance of classes. Correct form in conf file is INHERIT.
 Issue             Commit shortlog is too long [test_shortlog_length] 
  Suggested fix    Edit shortlog so that it is 90 characters or less (currently 147 characters)



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


Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id B4E0077BD1;
	Mon, 10 Apr 2017 07:31:56 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Li Zhou <li.zhou@windriver.com>
Date: Mon, 10 Apr 2017 07:31:58 -0000
Message-ID: <20170410073158.6649.96233@do.openembedded.org>
References: <1491808224-142978-1-git-send-email-li.zhou@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1491808224-142978-1-git-send-email-li.zhou@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcHl0aG9uMi8zOiBNb3ZlIGNvbmZpZy9NYWtlZmlsZSBmcm9tIGNvcmUgcGFja2FnZSB0byBkZXYgcGFja2FnZQ==?=
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
X-List-Received-Date: Mon, 10 Apr 2017 07:31:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: python2/3: Move config/Makefile from core package to dev package
Revision: 1
URL   : https://patchwork.openembedded.org/series/6252/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series cannot be parsed correctly due to malformed diff lines [test_mbox_format] 
  Suggested fix    Create the series again using git-format-patch and ensure it can be applied using git am
  Diff line         @@ -66,7 +66,7 @@ FILES_${PN}-debugger="${libdir}/python3.5/bdb.* ${libdir}/python3.5/__pycache__/


* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 901659a51c)



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe



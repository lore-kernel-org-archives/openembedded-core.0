Return-Path: <sanjanasanju1608@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C13C41513
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:19:19 +0000 (UTC)
Subject: Re: [mickledore] glibc: stable 2.37 branch updates.
To: openembedded-core@lists.openembedded.org
From: "Sanjana V" <sanjanasanju1608@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 117
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 11 Oct 2023 23:19:17 -0700
References: <20231005110207.1582338-1-Yash.Shinde@windriver.com>
In-Reply-To: <20231005110207.1582338-1-Yash.Shinde@windriver.com>
Message-ID: <20679.1697091557461045335@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="AI7hiUtYc5fY7yQBvtMn"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188984

--AI7hiUtYc5fY7yQBvtMn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the test results.

Before glibc update
Summary of test results:
PASS:4727
FAIL:240
XPASS:4
XFAIL:16
UNSUPPORTED:220

After glibc update
Summary of test results:
PASS:4729
FAIL:239
XPASS:4
XFAIL:16
UNSUPPORTED:221

These are the newly added test cases
PASS: io/tst-fcntl-lock-lfs
UNSUPPORTED: nss/mtrace-tst-nss-gai-hv2-canonname

And below are new failures
FAIL: nptl/tst-thread-affinity-pthread
FAIL: nptl/tst-thread-affinity-pthread2
FAIL: nptl/tst-thread-affinity-sched

And below are new passes
PASS: malloc/tst-mallocfork3-mcheck
PASS: nptl/tst-pthread-setuid-loop
PASS: resolv/tst-ns_name_length_uncompressed
PASS: string/test-strcasecmp

--AI7hiUtYc5fY7yQBvtMn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Regression testing is done and below are the test results.</div>
<div>&nbsp;</div>
<div>Before glibc update&nbsp;</div>
<div>Summary of test results:</div>
<div>PASS:4727</div>
<div>FAIL:240</div>
<div>XPASS:4</div>
<div>XFAIL:16</div>
<div>UNSUPPORTED:220&nbsp;</div>
<div>&nbsp;</div>
<div>After glibc update</div>
<div>Summary of test results:</div>
<div>PASS:4729</div>
<div>FAIL:239</div>
<div>XPASS:4</div>
<div>XFAIL:16</div>
<div>UNSUPPORTED:221</div>
<div>&nbsp;</div>
<div>These are the newly added test cases</div>
<div>PASS: io/tst-fcntl-lock-lfs&nbsp;</div>
<div>UNSUPPORTED: nss/mtrace-tst-nss-gai-hv2-canonname</div>
<div>&nbsp;</div>
<div>And below are new failures</div>
<div>FAIL: nptl/tst-thread-affinity-pthread&nbsp;</div>
<div>FAIL: nptl/tst-thread-affinity-pthread2</div>
<div>FAIL: nptl/tst-thread-affinity-sched</div>
<div>&nbsp;</div>
<div>And below are new passes</div>
<div>PASS: malloc/tst-mallocfork3-mcheck</div>
<div>PASS: nptl/tst-pthread-setuid-loop</div>
<div>PASS: resolv/tst-ns_name_length_uncompressed&nbsp;</div>
<div>PASS: string/test-strcasecmp</div>
<div>&nbsp;</div>

--AI7hiUtYc5fY7yQBvtMn--


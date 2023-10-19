Return-Path: <Sanjana.Venkatesh@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D41CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:17:00 +0000 (UTC)
Subject: Re: [mickledore] glibc: stable 2.37 branch updates.
To: openembedded-core@lists.openembedded.org
From: Sanjana.Venkatesh@windriver.com
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 118
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 05:16:56 -0700
References: <CAMKF1soFcxfbe04ptQ48oKrcMYtS9UMoauqX3KbN2VF98seuMw@mail.gmail.com>
In-Reply-To: <CAMKF1soFcxfbe04ptQ48oKrcMYtS9UMoauqX3KbN2VF98seuMw@mail.gmail.com>
Message-ID: <19195.1697717816202918718@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LUsaQCqTVTEzbWlYqkwW"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 12:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189449

--LUsaQCqTVTEzbWlYqkwW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

We tried increasing the memory and no regression failures were found.

Here is the test results:

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
PASS:4733
FAIL:235
XPASS:4
XFAIL:16
UNSUPPORTED:221

These are the newly added test cases
PASS: io/tst-fcntl-lock-lfs
UNSUPPORTED: nss/mtrace-tst-nss-gai-hv2-canonname

These are the tests which were failing before and passed after increasing t=
he memory:
PASS: nptl/tst-thread-affinity-pthread
PASS: nptl/tst-thread-affinity-pthread2
PASS: nptl/tst-thread-affinity-sched

--LUsaQCqTVTEzbWlYqkwW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem,</div>
<div>&nbsp;</div>
<div>We tried increasing the memory and no regression failures were found.<=
/div>
<div>&nbsp;</div>
<div>Here is the test results:</div>
<div>&nbsp;</div>
<div>Regression testing is done and below are the test results.</div>
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
<div>PASS:4733</div>
<div>FAIL:235</div>
<div>XPASS:4</div>
<div>XFAIL:16</div>
<div>UNSUPPORTED:221</div>
<div>&nbsp;</div>
<div>These are the newly added test cases</div>
<div>PASS: io/tst-fcntl-lock-lfs</div>
<div>UNSUPPORTED: nss/mtrace-tst-nss-gai-hv2-canonname</div>
<div>&nbsp;</div>
<div>These are the tests which were failing before and passed after increas=
ing the memory:</div>
<div>PASS: nptl/tst-thread-affinity-pthread&nbsp;</div>
<div>PASS: nptl/tst-thread-affinity-pthread2</div>
<div>PASS: nptl/tst-thread-affinity-sched</div>

--LUsaQCqTVTEzbWlYqkwW--


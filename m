Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C535CD5BDF
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:16:17 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 06:16:13 -0700
References: <20240925131141.3655587-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240925131141.3655587-1-Deepthi.Hemraj@windriver.com>
Message-ID: <29158.1727270173455270657@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="w0OTa5ExtyT7EhHUDQgK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 13:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204954

--w0OTa5ExtyT7EhHUDQgK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Testing was done and below are the test results:
*After update:*
PASS - 4779
FAIL - 147
XPASS - 6
XFAIL - 16
UNSUPPORTED - 237

*Before update:*
PASS - 4770
FAIL - 148
XPASS - 6
XFAIL - 16
UNSUPPORTED - 237

Below is the failing testcase
FAIL: nptl/tst-thread-affinity-sched

--w0OTa5ExtyT7EhHUDQgK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Testing was done and below are the test results:</div>
<div><strong>After update:</strong><br />PASS - 4779</div>
<div>FAIL - 147</div>
<div>XPASS - 6</div>
<div>XFAIL - 16<br />UNSUPPORTED - 237</div>
<div>&nbsp;</div>
<div><strong>Before update:</strong><br />PASS - 4770<br />FAIL - 148<br />=
XPASS - 6&nbsp;<br />XFAIL - 16<br />UNSUPPORTED - 237<br /><br />Below is =
the failing testcase<br />FAIL: nptl/tst-thread-affinity-sched</div>

--w0OTa5ExtyT7EhHUDQgK--


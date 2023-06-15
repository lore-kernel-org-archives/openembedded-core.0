Return-Path: <Deepthi.Hemraj@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058AEEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 12:38:21 +0000 (UTC)
Subject: Re: [mickledore][PATCH] glibc: stable 2.37 branch updates.
To: openembedded-core@lists.openembedded.org
From: Deepthi.Hemraj@eng.windriver.com
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Jun 2023 05:38:11 -0700
References: <20230615123424.2247492-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20230615123424.2247492-1-Deepthi.Hemraj@windriver.com>
Message-ID: <22504.1686832691127429473@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4zW0REI8WtbDXVKQqga7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182854

--4zW0REI8WtbDXVKQqga7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the test results.

*Before glibc update*
Summary of test results:
210 FAIL
4380 PASS
38 UNSUPPORTED
16 XFAIL
2 XPASS

*After glibc update*
Summary of test results:
194 FAIL
4401 PASS
38 UNSUPPORTED
16 XFAIL
2 XPASS

*Diff:*
16 FAIL
21 PASS
0 UNSUPPORTED
0 XFAIL
0 XPASS

5 Newly added test cases are Passed and below are the 3 new failures:
FAIL: malloc/tst-malloc-too-large-malloc-hugetlb1
FAIL: malloc/tst-malloc-too-large-malloc-hugetlb2
FAIL: resolv/tst-resolv-aliases

--4zW0REI8WtbDXVKQqga7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Regression testing is done and below are the test results.<br /><br />=
</div>
<div><strong>Before glibc update&nbsp;</strong></div>
<div>Summary of test results:</div>
<div>&nbsp; &nbsp; 210 FAIL</div>
<div>&nbsp; &nbsp;4380 PASS</div>
<div>&nbsp; &nbsp; &nbsp;38 UNSUPPORTED</div>
<div>&nbsp; &nbsp; &nbsp;16 XFAIL</div>
<div>&nbsp; &nbsp; &nbsp; 2 XPASS</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp;&nbsp;</span></div>
<div><strong>After glibc update</strong></div>
<div>Summary of test results:</div>
<div>&nbsp; &nbsp; 194 FAIL</div>
<div>&nbsp; &nbsp;4401 PASS</div>
<div>&nbsp; &nbsp; &nbsp;38 UNSUPPORTED</div>
<div>&nbsp; &nbsp; &nbsp;16 XFAIL</div>
<div>&nbsp; &nbsp; &nbsp; 2 XPASS</div>
<div>&nbsp;</div>
<div><strong>Diff:</strong></div>
<div>16 FAIL</div>
<div>21 PASS</div>
<div>0 UNSUPPORTED</div>
<div>0 XFAIL</div>
<div>0 XPASS</div>
<div>&nbsp;</div>
<div>5 Newly added test cases are Passed and below are the 3 new failures:<=
/div>
<div>FAIL: malloc/tst-malloc-too-large-malloc-hugetlb1</div>
<div>FAIL: malloc/tst-malloc-too-large-malloc-hugetlb2</div>
<div>FAIL: resolv/tst-resolv-aliases</div>

--4zW0REI8WtbDXVKQqga7--


Return-Path: <Deepthi.Hemraj@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BAAE75424
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 05:35:04 +0000 (UTC)
Subject: Re: [PATCH V3] glibc: stable 2.38 branch updates.
To: openembedded-core@lists.openembedded.org
From: Deepthi.Hemraj@eng.windriver.com
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 117
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 02 Oct 2023 22:34:55 -0700
References: <20231003030917.3593279-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20231003030917.3593279-1-Deepthi.Hemraj@windriver.com>
Message-ID: <11138.1696311295328635413@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LHRzCiV0a3wFz1HNXf4n"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 05:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188623

--LHRzCiV0a3wFz1HNXf4n
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the test results.

Before glibc update
Summary of test results:
213 FAIL
4805 PASS
16 XFAIL
4 XPASS
218 UNSUPPORTED

After glibc update
Summary of test results:
216 FAIL
4805 PASS
16 XFAIL
4 XPASS
218 UNSUPPORTED

These are the newly added test cases
PASS: io/tst-fcntl-lock-lfs
FAIL: nss/tst-nss-gai-hv2-canonname
PASS: resolv/tst-resolv-noaaaa-vc
And below are new failures
FAIL: nptl/tst-thread-affinity-sched
FAIL: malloc/tst-malloc_info-malloc-check

--LHRzCiV0a3wFz1HNXf4n
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the test results.<br /><br /><span=
 style=3D"font-weight: bold;">Before glibc update&nbsp;<br /></span>Summary=
 of test results:<br />
<div>213 FAIL</div>
<div>4805 PASS</div>
<div>16 XFAIL</div>
<div>4 XPASS</div>
<div>218 UNSUPPORTED&nbsp;<br /><br /><span style=3D"font-weight: bold;">Af=
ter glibc update<br /></span>Summary of test results:<br />
<div>216 FAIL&nbsp;</div>
<div>4805 PASS&nbsp;</div>
<div>16 XFAIL&nbsp;</div>
<div>4 XPASS&nbsp;</div>
<div>218 UNSUPPORTED<br /><br /><span style=3D"font-weight: bold;">These ar=
e the newly added test cases</span><br />
<div>PASS: io/tst-fcntl-lock-lfs</div>
<div>FAIL: nss/tst-nss-gai-hv2-canonname</div>
<div>PASS: resolv/tst-resolv-noaaaa-vc<br /><span style=3D"font-weight: bol=
d;">And below are new failures</span><br />FAIL: nptl/tst-thread-affinity-s=
ched<br />FAIL: malloc/tst-malloc_info-malloc-check</div>
</div>
</div>

--LHRzCiV0a3wFz1HNXf4n--


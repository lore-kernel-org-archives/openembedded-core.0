Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5037ED1AD43
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 10:21:26 +0000 (UTC)
Subject: Re: [PATCH 1/2] rust: Upgrade 1.79.0->1.80.0
To: openembedded-core@lists.openembedded.org
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
X-Originating-Location: IN (49.37.241.93)
X-Originating-Platform: Windows Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 16 Oct 2024 03:21:26 -0700
References: <3947F298-D474-4F42-928C-D916C0A06FDF@arm.com>
In-Reply-To: <3947F298-D474-4F42-928C-D916C0A06FDF@arm.com>
Message-ID: <19746.1729074086073458660@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="lgFbkodauZVwfAKS3n4m"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 10:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205962

--lgFbkodauZVwfAKS3n4m
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The musl build works correctly with Rust 1.80, but the reproducibility test=
s are failing. To address this, we implemented some changes that resolved t=
he reproducibility issue, allowing the tests to pass. However, these modifi=
cations have led to a failure in the musl build.

This setup worked fine with Rust 1.79, but the changes introduced in this c=
ommit https://github.com/rust-lang/rust/commit/615b485596acfa62d9a5c8f5cb0d=
b405504b28d8 in Rust 1.80 are causing the build to panic due to changes mad=
e for the reproducibility issue. We are currently analyzing this further.

thanks,
Harish

--lgFbkodauZVwfAKS3n4m
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>The musl build works correctly with Rust 1.80, but the reproducibility=
 tests are failing. To address this, we implemented some changes that resol=
ved the reproducibility issue, allowing the tests to pass. However, these m=
odifications have led to a failure in the musl build.</div>
<div><br />This setup worked fine with Rust 1.79, but the changes introduce=
d in this commit <a href=3D"https://github.com/rust-lang/rust/commit/615b48=
5596acfa62d9a5c8f5cb0db405504b28d8" target=3D"_blank" rel=3D"noopener">http=
s://github.com/rust-lang/rust/commit/615b485596acfa62d9a5c8f5cb0db405504b28=
d8</a> in Rust 1.80 are causing the build to panic due to changes made for =
the reproducibility issue. We are currently analyzing this further.<br /><b=
r />thanks,<br />Harish</div>
</div>

--lgFbkodauZVwfAKS3n4m--


Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D635C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 09:41:30 +0000 (UTC)
Subject: Re: [PATCH] binutils: Fix CVE-2025-1148
To: openembedded-core@lists.openembedded.org
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 19 Mar 2025 02:41:24 -0700
References: <20250319093535.3368863-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20250319093535.3368863-1-Harish.Sadineni@windriver.com>
Message-ID: <30508.1742377284114642018@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Yd0qkI0KI4jhPeH3yZW1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213317

--Yd0qkI0KI4jhPeH3yZW1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In upstream this patch has only been applied to the master branch and hasn'=
t been included in any other branches yet. We've sent the backported patch =
to the upstream binutils-2_44 branch, but they seem hesitant to merge it in=
to the stable branches.

This is the response I received from the original author( https://sourcewar=
e.org/pipermail/binutils/2025-March/139987.html ):
"I deliberately left that patch off the branch, and even now after it has h=
ad some time for potential problems to show up I don't think it
warrants backporting. =C2=A0Memory leaks of this nature hardly qualify as b=
ugs."

--Yd0qkI0KI4jhPeH3yZW1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>In upstream this patch has only been applied to the master branch and =
hasn't been included in any other branches yet. We've sent the backported p=
atch to the upstream binutils-2_44 branch, but they seem hesitant to merge =
it into the stable branches.</div>
<div><br />This is the response I received from the original author(<a href=
=3D"https://sourceware.org/pipermail/binutils/2025-March/139987.html" targe=
t=3D"_blank" rel=3D"noopener">https://sourceware.org/pipermail/binutils/202=
5-March/139987.html</a>):</div>
<div>"I deliberately left that patch off the branch, and even now after it =
has had some time for potential problems to show up I don't think it<br />w=
arrants backporting. &nbsp;Memory leaks of this nature hardly qualify as bu=
gs."</div>
</div>

--Yd0qkI0KI4jhPeH3yZW1--


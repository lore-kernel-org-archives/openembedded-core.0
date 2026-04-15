Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDC1FA0C35
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 06:16:15 +0000 (UTC)
Subject: Re: [master] [PATCH] acpid2: Add vendor to CVE_PRODUCT
To: openembedded-core@lists.openembedded.org
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 147
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 23:16:07 -0700
References: <20260413111552.1809426-1-hjadon@cisco.com> <15d64fc4f3f3fe599b59afe642d02a0add64b3a5.camel@pbarker.dev>
In-Reply-To: <15d64fc4f3f3fe599b59afe642d02a0add64b3a5.camel@pbarker.dev>
Message-ID: <1426462.1776233767961584395@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="e9aJzq70u68xvNmoJgdh"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 06:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235181

--e9aJzq70u68xvNmoJgdh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for checking this.

You are right, at present there is only one valid CPE for acpid2
(tedfelix:acpid2), and we are not seeing any wrong matches against other
CPEs right now.

This update is mainly to make the mapping explicit, instead of depending
on product-only implicit matching. As of now, it does not change current
CVE reporting output. The intent is to keep mapping stable if matching
logic changes later, or if NVD adds another vendor:product using the
same product token in future.

So this is a proactive metadata clarity change, not a fix for any
current misreporting.

--e9aJzq70u68xvNmoJgdh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi,</div>
<div>&nbsp;</div>
<div>Thanks for checking this.</div>
<div>&nbsp;</div>
<div>You are right, at present there is only one valid CPE for acpid2<br />=
(tedfelix:acpid2), and we are not seeing any wrong matches against other<br=
 />CPEs right now.</div>
<div>&nbsp;</div>
<div>This update is mainly to make the mapping explicit, instead of dependi=
ng<br />on product-only implicit matching. As of now, it does not change cu=
rrent<br />CVE reporting output. The intent is to keep mapping stable if ma=
tching<br />logic changes later, or if NVD adds another vendor:product usin=
g the<br />same product token in future.</div>
<div>&nbsp;</div>
<div>So this is a proactive metadata clarity change, not a fix for any<br /=
>current misreporting.</div>
</div>

--e9aJzq70u68xvNmoJgdh--


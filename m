Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1803C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 04:26:39 +0000 (UTC)
Subject: Re: [PATCH] Cargo: build failure on 32-bit machine when DEBUG enabled
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 May 2023 21:26:30 -0700
References: <435dba03674dadc42184c498673863f7b0e4cf4c.camel@linuxfoundation.org>
In-Reply-To: <435dba03674dadc42184c498673863f7b0e4cf4c.camel@linuxfoundation.org>
Message-ID: <3425.1685420790114395282@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="QjH5gKkCYQXK0Dqs2IhA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 04:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181896

--QjH5gKkCYQXK0Dqs2IhA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I still did not get this reproduced on rust sources (Since it is occurring =
only on 32-bit builds, the rust build is giving some unknown errors which a=
re yet to be analyzed...).
Until then, to avoid DEBUG_BUILD failures this workaround is sent.

--QjH5gKkCYQXK0Dqs2IhA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I still did not get this reproduced on rust sources (Since it is occurring =
only on 32-bit builds, the rust build is giving some unknown errors which a=
re yet to be analyzed...).<br />Until then, to avoid DEBUG_BUILD failures t=
his workaround is sent.

--QjH5gKkCYQXK0Dqs2IhA--


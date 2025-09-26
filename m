Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC35CAC5B0
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 03:42:28 +0000 (UTC)
Subject: Re: [PATCH 1/2] kernel-fitimage: add support for custom ITS file override
To: openembedded-core@lists.openembedded.org
From: kavinaya@qti.qualcomm.com
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.53)
X-Originating-Platform: Windows Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 25 Sep 2025 20:42:20 -0700
References: <29002.1758707163729683981@lists.openembedded.org>
In-Reply-To: <29002.1758707163729683981@lists.openembedded.org>
Message-ID: <27560.1758858140781391880@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 03:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224051

Hi Adrian,

Thanks for your question. To clarify:

We are not hardcoding anything or bypassing upstream logic. All BitBake var=
iables and artifact handling remain unchanged. The only difference is that =
if FIT_CUSTOM_ITS_FILE is set, we use that file instead of generating one d=
ynamically.
This ensures we still rely on the existing process for preparing kernel, DT=
Bs, and other artifacts.
Regarding extending the ITS generator: yes, we considered it, but our requi=
red compatible string format is very specific and would need major changes =
to the generator, adding complexity and maintenance overhead. Using a custo=
m ITS file is simpler, low-impact, and keeps upstream behavior intact while=
 meeting our UEFI compatibility needs.

Let me know if you=E2=80=99d like more details or if you see a better alter=
native.

Thanks,
Kavinaya


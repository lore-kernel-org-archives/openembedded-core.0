Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C88CCD18D
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 05:56:26 +0000 (UTC)
Subject: Re: [PATCH] kernel-fit-image: enable compatible string for kernel built-in DTBs
To: openembedded-core@lists.openembedded.org
From: "Kavinaya S" <kavinaya@qti.qualcomm.com>
X-Originating-Location: Mumbai, Maharashtra, IN (163.116.213.89)
X-Originating-Platform: Windows Chrome 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 12 Oct 2025 22:56:18 -0700
References: <1ed65c41-c418-416d-ab99-705116ce4221@gmail.com>
In-Reply-To: <1ed65c41-c418-416d-ab99-705116ce4221@gmail.com>
Message-ID: <6802.1760334978060494356@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 05:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224758

On Sun, Oct 12, 2025 at 11:02 PM, Gyorgy Sarvari wrote:

>
> I think something like bb.utils.to_boolean() should be used, otherwise
> the non-empty string will always evaluate as True.
>

Sure. I will update a new patch with the suggested changes.


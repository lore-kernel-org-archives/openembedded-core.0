Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85048CCF9EE
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:38:07 +0000 (UTC)
Subject: Re: [PATCH v2] core-image-weston: Add wayland as required feature.
To: openembedded-core@lists.openembedded.org
From: "Walter Werner SCHNEIDER" <contact@schnwalter.eu>
X-Originating-Location: Arad, Arad County, RO (86.125.201.101)
X-Originating-Platform: Linux Firefox 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 28 Oct 2025 03:37:57 -0700
References: <CANNYZj-6bpHOuZLGV9dWacHu5YEEw1x-SW0B99Y1OqOCq-9rZw@mail.gmail.com>
In-Reply-To: <CANNYZj-6bpHOuZLGV9dWacHu5YEEw1x-SW0B99Y1OqOCq-9rZw@mail.gmail.com>
Message-ID: <27789.1761647877934206211@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9lh8VUz7oMWkfh9Z3r9C"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 10:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225393

--9lh8VUz7oMWkfh9Z3r9C
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

> if someone objects and proposes a different approach

With this change, you still don't know the root cause. But at least you kno=
w that you are missing a DISTRO_FEATURE, a more correct fix would be for th=
e error message to also mention the lack of DISTRO when there's a missing D=
ISTRO_FEATURE, should I also look into adding that kind of message? But may=
be in a different patch.

--9lh8VUz7oMWkfh9Z3r9C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<p>if someone objects and proposes a different approach</p>
</blockquote>

<p>With this change, you still don't know the root cause. But at least you =
know that you are missing a DISTRO_FEATURE, a more correct fix would be for=
 the error message to also mention the lack of DISTRO when there's a missin=
g DISTRO_FEATURE, should I also look into adding that kind of message? But =
maybe in a different patch.</p>

--9lh8VUz7oMWkfh9Z3r9C--


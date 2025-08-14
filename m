Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C2FCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 12:20:12 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] wic: add --extra-partition-space option to set unused space
To: openembedded-core@lists.openembedded.org
From: pierre-loup.gosse@smile.fr
X-Originating-Location: =?UTF-8?B?UGFyaXMsIMOObGUtZGUtRnJhbmNlLCBGUg==?= (195.68.54.115)
X-Originating-Platform: Linux Firefox 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 14 Aug 2025 05:20:10 -0700
References: <DC0II3M8AROA.WDDDZHO2OW9D@bootlin.com>
In-Reply-To: <DC0II3M8AROA.WDDDZHO2OW9D@bootlin.com>
Message-ID: <22981.1755174010412496338@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="UbqLcfRiVNjDVHQyEFL0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 12:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221863

--UbqLcfRiVNjDVHQyEFL0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thanks for your review.

The second part of the test passed in my local self-test build environment,=
 but not in your autobuilder. It appears that the core-image-minimal filesy=
stem sizes differ: the test expects a WicError if the filesystem exceeds 50=
 MB.

That said, I think this part of the test might be irrelevant. However, I=E2=
=80=99m curious to understand why it passed in my environment and not yours=
. I expected the built filesystem to be the same size in both environment. =
Did I overlook something when running my tests?

I=E2=80=99ll submit a v4 with the necessary changes.

Pierre-Loup

--UbqLcfRiVNjDVHQyEFL0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>
<div>Hi Mathieu,</div>
<div><br />Thanks for your review.</div>
</div>
<div>&nbsp;</div>
<div>The second part of the test passed in my local self-test build environ=
ment, but not in your autobuilder. It appears that the core-image-minimal f=
ilesystem sizes differ: the test expects a WicError if the filesystem excee=
ds 50 MB.</div>
<div><br />That said, I think this part of the test might be irrelevant. Ho=
wever, I&rsquo;m curious to understand why it passed in my environment and =
not yours. I expected the built filesystem to be the same size in both envi=
ronment. Did I overlook something when running my tests?</div>
<div>&nbsp;</div>
<div>I&rsquo;ll submit a v4 with the necessary changes.</div>
<div>&nbsp;</div>
<div>Pierre-Loup</div>
</div>

--UbqLcfRiVNjDVHQyEFL0--


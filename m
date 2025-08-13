Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC0DCA0EC4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 01:51:48 +0000 (UTC)
Subject: Re: [PATCH v7 6/9] bootimg_pcbios: add funcs to configure booting with grub
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Detroit, Michigan, US (68.49.9.200)
X-Originating-Platform: Linux Firefox 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 18:51:45 -0700
References: <20250811040339.857858-12-vince@underview.tech>
In-Reply-To: <20250811040339.857858-12-vince@underview.tech>
Message-ID: <23953.1755049905508910253@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="QZ7xrCqNDAR6B1bgmtlr"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 01:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221784

--QZ7xrCqNDAR6B1bgmtlr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2025 at 11:06 PM, Vincent Davis Jr wrote:

>=20
> 1. dd target platform specific boot.img to the first
> 0-440 sectors of the resulting wic image. dd grub
> stage 1 to wic image.
> 2. dd custom core.img (grub stage 1.5) with embedded
> configuration to the resulting wic image starting
> at sector 512 up to sizeof(core.img).

Terribly sorry just now realizing my commit message uses
"sector(s)" instead of "byte(s)".

Assuming this patch series meets oe-core submission requirements.

How do we proceed with updating commit message?

Want to request oe-core review panel
update the commit message to be
"byte(s)" and not "sector(s)" so not to
re-submit patch series.

--QZ7xrCqNDAR6B1bgmtlr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sun, Aug 10, 2025 at 11:06 PM, Vincent Davis Jr wrote:</div>
<div>
<blockquote>1. dd target platform specific boot.img to the first<br />0-440=
 sectors of the resulting wic image. dd grub<br />stage 1 to wic image.<br =
/>2. dd custom core.img (grub stage 1.5) with embedded<br />configuration t=
o the resulting wic image starting<br />at sector 512 up to sizeof(core.img=
).</blockquote>
<br />Terribly sorry just now realizing my commit message uses</div>
<div>"sector(s)" instead of "byte(s)".</div>
<div><br />Assuming this patch series meets oe-core submission requirements=
.</div>
<div><br />How do we proceed with updating commit message?</div>
<div>&nbsp;</div>
<div>Want to request oe-core review panel</div>
<div>update the commit message to be<br />"byte(s)" and not "sector(s)" so =
not to</div>
<div>re-submit patch series.</div>

--QZ7xrCqNDAR6B1bgmtlr--


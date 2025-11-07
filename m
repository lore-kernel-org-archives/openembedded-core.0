Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15F9CCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:33:51 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11487.1762522424863061556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=VQT0XD8N;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=MP7KdKV8;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1762522422;
	bh=JPrhQTmb30ddG1NhYrFM4GD1IpreDVxZ9XHi1L5f1IA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VQT0XD8NvD9VQ/OgUSSvKL8q+PZM8IrTtbCFnQmHRyl3qAVIgC+9i3qDY7yommuQh
	 7npGEm7OEICx+vkz7aLL8FJ9BISnwjhXXK73/zHdl8v/iWF96LNjIdMcasijvhDfel
	 8FgIcenPSohFsN+29FNJ7i7l++NRqdfoUUbey75jY0DGc2OAD+I5xr9hbMJh4S8IJV
	 beLFac6veoaFVVpkxJf2TXajB/1zuUzgzBRRToF2FGS0loKLi6G3MglX0wcqaaRHYl
	 wCCAsc1bc3SfVtHG2+pmXYI5haCn5/zCQWAz5drTZXkbFDm6zFXcySTJUk160ATkzI
	 ldYtVDyXb21Gw==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id F40D15F9CC;
	Fri,  7 Nov 2025 14:33:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1762522421;
	bh=JPrhQTmb30ddG1NhYrFM4GD1IpreDVxZ9XHi1L5f1IA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MP7KdKV8fSZjX/dsqjhNGTQmNPOy7GprP9eUbwO8LVHTCSjmHp8GXenEjORGusViv
	 uoPhN0yNdm8UGZqCWW42W8WPH7fXhn4WcnM+5HiHX7V/tASHogZKdF2SLE9Mz1acTL
	 Lgw7z5IjQC/HvyZHxStAxwgjpqEE/wEPV3khw+PJ6eirAW7yq8T8B6rcSrW9DU41Am
	 5mXWsVh3u6roHFIbcJkuOlRlpuqdQ494iETwBUfK1sCfoG81FYONkPUesRtcI0VgCj
	 ysS9BhhYCuqwKEerVSdR7gbijYvIJ3h6CFRtZ764evKq8KPdwUoiLtQkGNotswczKJ
	 8Uzu4pvqateHw==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id DB0EE5F871;
	Fri,  7 Nov 2025 14:33:41 +0100 (CET)
Message-ID: <8e5019335cf683491cb29159a2ae3e34eb3942c4.camel@emlix.com>
Subject: Re: [OE-core] Thoughts on SPDX for files from meta-layer
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, OpenEmbedded Architecture
	 <openembedded-architecture@lists.openembedded.org>
Date: Fri, 07 Nov 2025 14:33:40 +0100
In-Reply-To: <CAJdd5GYSgnUtey269iGQzcoxNfB6u48QWMGsjsDYoAQCa_YNCw@mail.gmail.com>
References: <b2e867d19c02966f3e11d2c7e6b7765564587df5.camel@emlix.com>
	 <CAJdd5GYSgnUtey269iGQzcoxNfB6u48QWMGsjsDYoAQCa_YNCw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226054

Hello Joshua,

thanks for your remarks!

On Wed, 2025-11-05 at 09:53 -0700, Joshua Watt wrote:
> On Wed, Nov 5, 2025 at 7:54=E2=80=AFAM Daniel Wagenknecht via
>=20
> I don't think a variable to specify the public URL is going to work
> well; for example, if a layer is forked, it will be wrong and
> confusing.=C2=A0
Agreed. My intention was to get the "public" URL for a layer, even if
it was pulled from a fork. My naive assumption was, that this URL
should point to a publically reachable location, but according to the
SPDX documentation for the downloadLocation field it might just as well
be an internal URL. This simplifies it.

> Just thinking off the top of my head, a better option might
> be a variable that specifies the name of the git remote that should be
> used, and if it's not specified then the URLs are ignored?=20
> [...]
> which would use the "origin" remote of the oe-core git repo, and _if_
> the current SHA-1 of that repo (which bitbake already knows) is in
> that remote, then it will use that remote as the URL.
I like that approach! To clarify: this should not access the network
but work with the local view of the repo only, right?
I guess the local view of the remote could be out of sync (e.g.
something was rebased on the remote),=C2=A0and if a commit is not part of a
known branch of that remote (e.g. the commit exists in a tags history
only) this would also yield a NOASSERTION value.


>  In this way, if
> you fork you can choose to use your own remote, or for example pull in
> upstream oe-core as an "upstream" remote and use that.
>=20
> I'm not entirely sold the above description is the best path, so maybe
> we can let others chime in.
Developing the thought further I think it would be fine to default to
using the git origin remote as default and allow adapting it per layer.
I'd then introduce an
   SPDX_REQUIRE_META_LAYER_ASSERTION
(or similarly named) variabel to promote unasserted values (like layer
dirty) to build failure.

> I do think that we will want a way to
> solve this, as we have also talked about including the information
> about the layer itself into the SPDX, so this is more or less an
> extension of that
Yes, small steps. Working out how to refer to a layer to construct
downloadLocations for individual files is only a first step, creating
SPDXRef-Download-meta-layer entries for layers and refering to them
would be a logical improvement.
>=20
>=20
>=20
Sincerely
Daniel


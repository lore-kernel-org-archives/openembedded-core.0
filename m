Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92852C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 15:27:55 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.14099.1707838064846608151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 07:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=ZwrhWGQi;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B791F9C162B;
	Tue, 13 Feb 2024 10:27:43 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 3QBhrearqS32; Tue, 13 Feb 2024 10:27:42 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B07309C334C;
	Tue, 13 Feb 2024 10:27:42 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B07309C334C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1707838062; bh=DcUzFW4wVtNNphs7BLD4mAuHoBXeKQLU+hHeX203meg=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=ZwrhWGQiAhyOuikMx37kXZciSbUeEAJ4VtaLFs/vwY2XDnwgalwNP0xwqZvH0M4wo
	 57cvWntQh1qK8PaSps83FgSQicsQ6Ou9Uk/rS3zS0tcjmZq07oalLNVYOTwldkQQBv
	 kCw2Qw3dX76QcUmer9nwY/hT5UyEiFlaV8yunwsiF0gfECY/eawXgBbd0wSZQAyPEx
	 9k6NPSJy7EwHlbn0Mo94Cbofwk37N6yRjA2cl0D0sbYkyJzm8BbO9Su2pr2Ly6cIsy
	 6EGVpD2pqx2Hb00VsuZWnVYKG+XGcGNQfrkCteGf5lqEV6S4Q/oS6l8qB3DJ9oLf9T
	 hJShI2YLYji0g==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id lwJoGO8dLZv4; Tue, 13 Feb 2024 10:27:42 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 07DD89C162B;
	Tue, 13 Feb 2024 10:27:41 -0500 (EST)
Message-ID: <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
Date: Tue, 13 Feb 2024 16:27:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: VS Code plugin and multiple build directories
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Ross Burton
 <Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>
References: <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 15:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195414

Thanks for your feedback!
> I normally do not use VS Code, but I actually had a reason to do so the
> other day. After having installed the new bitbake plugin, I noticed two
> things related to the settings. One is the odd defaults where I would
> have expected something that matches the default Poky configuration
> (which I guess is part of Adrian's changes). The other is that the
Adrian's change will indeed produce better defaults for poky.

We could consider changing the extension's defaults if they really don't 
work for most users. It currently assumes poky is in `sources/poky`. 
Cloning just poky would result in just `.`. While multi layered projects 
will often put it in `poky` or `sources/poky`. I'd rather wait for an 
official oe-layer-setup like tool and structure to be wildly used and 
align with it rather than guessing the default configuration another 
way. Changing the default will break some users configs, so I'm also 
being conservative.

I'm really open to suggestions on this.
> plugin seems to make a hard assumption that you only have a single build
> directory within a workspace. In our case we typically setup the
> environment with one build directory per machine and/or use case, e.g.,
> rather than a `build` directory, I have `builds/foo`, `builds/bar` and
> `builds/bar-selftest`. And while I of course can configure the plugin to
> use one of the build directories, in a typical session I regularly switch
> between the build directories depending on what I am doing at the moment
> and it seems awkward to have to have one VS Code configuration per build
> directory when the source files are the same in all cases. Now, I am a
> total VS Code novice so maybe there are better ways to do it, but for
> now I just configured the plugin to create its own build directory in
> `.VS Code/build` and forgot about it.
> 
> I have no idea what is possible to do with a VS Code extension, but would
> it be possible to make the plugin support multiple build directories for
> one workspace, e.g., by allowing multiple build directories and/or
> patterns to be specified? I.e., in our case I would like to be able to
> configure the build directories as `${workspaceFolder}/builds/*` and
> then choose which is currently active from with the VS Code UI.Yes currently, the extension only manages one build directory and 
machine/distro config. This is a feature that has been requested quite 
often. My plan would be to rely on Yocto's multiconfigs since it is the 
official tool to manage multiple configurations. I prefer multiconfigs 
rather than an array of bitbake settings.json and different build 
directories (like you describe). We'd add a picker in the bottom status 
bar to select the configuration and prefix all bitbake commands with the 
appropriate "mc:" config.
> 
> //Peter
> 
> 
Regards
Enguerrand de Ribaucourt


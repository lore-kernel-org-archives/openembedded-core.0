Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0F5C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 12:49:42 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.40329.1707914979548871931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 04:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=Aqb5GGCq;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C8BF69C3311;
	Wed, 14 Feb 2024 07:49:37 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id y6_rKCOENF5I; Wed, 14 Feb 2024 07:49:37 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2C0889C45A3;
	Wed, 14 Feb 2024 07:49:37 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 2C0889C45A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1707914977; bh=9DyPrRP2aKX9hHZkr+jAkrrF7oN5DY/yzN7q/lSaimI=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Aqb5GGCquX6vnLmnXSPUDY7ujGELpt6nmVaXQunzQF+dcVqV/bX4qVv8zFFmgiu9+
	 AXMlXMkVKK94/Xz55ishp6BDXNk+hQTD9z5SPVuPUuhuh37AJjY+oeyfBMC6u/3EUJ
	 bctYLGDIJmoKGILTe5jtPLJ+eENYPzSzpTApTWdalizN50AbVc9cNOVmhzZT+Ysa0d
	 h+N0hKOa88LR509a07C2m/ME0UWe4eHxITB7R4U/hJf2yqHSPNEWo3506fIDWC9+Dn
	 GSYdMMm5pJRy5lbgz6pKqLS3KxOIJEXGNJBuHKfI4v2G3q781PmYjTeHMMzgwKXL4l
	 4NLIEuVg5W3Gw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id yH-jZO5I1yoP; Wed, 14 Feb 2024 07:49:37 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 61EEB9C3311;
	Wed, 14 Feb 2024 07:49:36 -0500 (EST)
Message-ID: <71696e62-8d1f-43b4-8277-7a6619a20d73@savoirfairelinux.com>
Date: Wed, 14 Feb 2024 13:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] VS Code plugin and multiple build directories
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Ross Burton
 <Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>,
 peter.kjellerstedt@axis.com
References: <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
 <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
 <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com>
 <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com>
 <CANNYZj8GvH4RKa9phsQ7oSv2b0604DtLa09W1Fndm-bA3KANVg@mail.gmail.com>
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <CANNYZj8GvH4RKa9phsQ7oSv2b0604DtLa09W1Fndm-bA3KANVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 12:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195473

On 14/02/2024 12:01, Alexander Kanavin wrote:
> On Wed, 14 Feb 2024 at 11:56, Enguerrand de Ribaucourt
> <enguerrand.de-ribaucourt@savoirfairelinux.com> wrote:
>>       "bitbake.pathToBitbakeFolder": "${workspaceFolder}/poky/bitbake",
> 
> I asked this in a different thread, but perhaps could ask here too:
> how is this setting used? If vscode needs to run bitbake executable,
> it can do so directly as that is placed in PATH by oe-init-buildenv,
> no?
This setting is inherited from Eugen's version. It's not used to start 
bitbake any more.

The shell invocations for Yocto are built in the following format:

	[commandWrapper "]. [pathToEnvScript] [pathToBuildFolder] && bitbake 
<recipe>["]

We test this in CI against typical configurations for kas, plain poky 
native, docker run with crops, which addresses probably 90% of our users.
> 
> The reason bitbake location is complicated to set, is that not all
> setups use bitbake copy contained in poky; some use separate clones of
> standalone bitbake repository that can be anywhere.
Today pathToBitbakeFolder is only used to configure the parsing of 
Python segments by importing the modules in the poky Python librarie. So 
the setting expects that this bitbake path is inside poky actually (and 
doesn't use anything inside bitbake). I could deprecate it and replace 
it with a path to poky to be more accurate.
> 
> Alex
Enguerrand de Ribaucourt


Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69537C48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 10:56:21 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.38762.1707908173526213789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 02:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=FfoGCRBB;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1ADFD9C45FE;
	Wed, 14 Feb 2024 05:56:12 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id cK_he9h9k8-V; Wed, 14 Feb 2024 05:56:10 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CBCD39C45FF;
	Wed, 14 Feb 2024 05:56:10 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com CBCD39C45FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1707908170; bh=6kTCo41htOgfRVKIr3gVEOjKLXDPLvwQY5wvFteORp0=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=FfoGCRBB/1erCeNPl6WH7itACe3sJb2rB9c/ZmRDVBIZEEZo7SgafempWTphynj7l
	 Yq+G5vvXdXUq2/sEKwtGfuWqL6u8vmN+EsePLat1uGTSzlW7ixUKEHEzCQIRFs8S3E
	 ZgQmcGqKsTGkkNV201f5WCPijgfm0Xb7Y78wyFlam2qUb1R953P1CJr900yRtWpXtV
	 TPL3Gn1zx1B7AOV4SzHFWgHlJcg19QrQMfdRVIaftOf3CRt8G0olTHY/oShuW95KEq
	 lBikzqtuNJhp6vd2tybxJ5U1AzMMUHuYIWHwMXwaHE464uMqQ4eIuaM1S33Zig8cNx
	 RG0B7FVtl5eCg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id o72fcwKdhs_0; Wed, 14 Feb 2024 05:56:10 -0500 (EST)
Received: from [192.168.216.123] (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 043F29C45FE;
	Wed, 14 Feb 2024 05:56:09 -0500 (EST)
Message-ID: <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com>
Date: Wed, 14 Feb 2024 11:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] VS Code plugin and multiple build directories
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Ross Burton
 <Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>,
 peter.kjellerstedt@axis.com
References: <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
 <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
 <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com>
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
In-Reply-To: <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 10:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195464

Thank you both for your feedback and clarifying the role of multiconfig!

I'll go with build/env settings dictionaries then. I think it's not much 
more complex, but a lot more versatile to also allow editing the 
environment under which bitbake is called. It will allow users to host 
several init-env scripts, or kas configurations, ...

```json
     "bitbake.workingDirectory": "${workspaceFolder}",
     "bitbake.pathToBitbakeFolder": "${workspaceFolder}/poky/bitbake",
     "bitbake.environments": [
         {
             "name": "product1",
             "pathToBuildFolder": "${workspaceFolder}/build_product1",
             "sshTarget": "root@192.168.7.2",
         },
         {
             "name": "product2",
             "pathToBuildFolder": "${workspaceFolder}/build_product2",
             "bitbake.shellEnv": {
                 "BB_ENV_PASSTHROUGH": "MACHINE",
                 "MACHINE": "product2"
             },
             "sshTarget": "root@192.168.7.3",
         }
     ]
```

The configuration will be selectable in the bottom right status bar. It 
will use the specific configurations if specified, otherwise, the 
workspace configuration. This schema follows c_cpp_properties.json which 
is a widely used example on VSCode.

Let me know if you have more remarks,

Enguerrand de Ribaucourt



Return-Path: <deets@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E35C4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 12:13:04 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by mx.groups.io with SMTP id smtpd.web11.8336.1702123982413123462
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Dec 2023 04:13:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=deets@web.de header.s=s29768273 header.b=W3fxI1eq;
 spf=pass (domain: web.de, ip: 212.227.17.11, mailfrom: deets@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1702123980; x=1702728780; i=deets@web.de;
	bh=4T9Ffj5NkXx8FI0m8ynNdRuDdxLZ3JfpUwcCfOCeQok=;
	h=X-UI-Sender-Class:Date:To:From:Subject;
	b=W3fxI1eqCt5eTDWRyxW4LIi1QGZbBY8+LBfCBnOkC6oV7A5xzpNz54AB0HBVbQmO
	 9Vu8XfA8DJ7r93GPdh/uE4ly3enlykOiH5jm+1dZiip7rMU/cXtueWLQVhi8Ec2QR
	 GyC5QdVXEh8s6Jwn/3B7c+YrXmv0g0fzUg2SV00KvwAT3yLChHBPeVqO4Wx2btet6
	 FXS2QI2FdRIRCt/MBr1GJdp2sco54Po9XE4pjzRNLTGgr6B+6Pla04V+mOMdPpbW3
	 EGQFOsVhvJr0S90bsv7gy6daxsl3zAdJW9XeNux0a3tqn/IYtcMdJFUNkIKJxvEoL
	 zrBD0xA6lAbaLbD3mQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.1.115] ([84.173.75.203]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCGWe-1r3j0Y1r9e-009qzF for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 13:13:00 +0100
Message-ID: <514aa7db-7377-4784-b3e5-c8bab0d037fe@web.de>
Date: Sat, 9 Dec 2023 13:12:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: "Diez B. Roggisch" <deets@web.de>
Subject: nativesdk-rust not producing working toolchain in SDK for me
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mSGpCchLpCDhCe94/TRT4TJ1rQfhQ4x+BUIM8N9LmMGY8Vmzm8W
 wBzEy/Qk8HZX5Zg5fVJM+VUu3Bcrkk0oEbCczR8NT+l64UxBN+raICTw77R9S64zH6bPjzd
 tiM9juk1bVWHCc2IPM4eB7DjZ1zcU6463E0fzvB34Bgo7Z3WXCjuvjrbVIwZ17l5O+q5R9t
 dhwloST7174SUxSVa4v9g==
UI-OutboundReport: notjunk:1;M01:P0:TW0K5/9vrZQ=;XwGyewOVMzkjHrtOOs2z1pUrJvs
 XDIfzwaA/8s2e1YsMJMJBLte0LA1UBLMjua26xM2PpkNFpZJ+lfrbdxBXGnIU8HQcG9MlZlG9
 5uLbHYaiaX1yasmYRl8Cw5kuGzq+nqR62Uy0qw92MPI8ml/tGBb46WOXpgRV0IkvQRxycjtBo
 Cwo+LMKpFMprtYFc/qdbrfycjnFFf92FiXS7+KcKR1lZL1/Y0OI4R352MWqJNKK0DqiRCznA3
 0By+wEXfqS/kbfFRbUeYfaoqBEQjkuOpsrDBIfpzDdXie1qNoVCJbka/aZKxsw5VELl47biTi
 I6dnIYznk7J2KsBvJqu51srO67AcDn8SDwZL95gc5yxR73xpNuA5WvJQVSisNhv3YMI1anEB5
 wlbJpPzMLNOAIgKvCZNTBC8EnQbEf9QyFKmcGNrXZueYX2YvUA/mklrUZfIzBs+clbTRbk1Cg
 hcmFoKxD+tSjUAodK572AxYmZOgFHZYZWdOawYhLlbmwiS7qwztqEZWqWMrpHQ6jxQffg1a07
 JMrkHeJeRjU9NHHlWjZLiUqBsGFe16277PU6XtxfgQFJTd9YgmWEsbpViCID/IRNlTp+Wxg/N
 m6fh0DpuPXgXUgUXMgkCrlFJOwG1w9WP1KyAjvq2kWR8jpxKLJvwFPOdU5ARv7A/bmVeMp4FA
 53xjwNWb9co4XA7IRf24IRl1KktdULPZna3pnuJ3bGww82OfTtKi6eyE+jbrHWXGU9l1HJrPz
 GoeiFM9Mb+LT1Zx2MRRq9/HbPgCAz4vV5CWsX6ppB2YNAB2hjViX8ALgc3ONnTQ7rFRyQrn5m
 C2QlH+Q44mbZfh64RYapioqnN3B70IplFq2hCpcSgkAPqveSB2+ZdHISZK6fOwIcNwHVW6vlF
 Rizojj552pjVEQ37z6PcsXQq69NeYOc7lT6AGy2Gi55RPJ2I1ym0wUn3QlkN/fuxJzfa/RlgX
 gmGMTg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 12:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192100

Hi,

I'm running a Poky Middledore for the raspberrypi4-64 machine from
meta-raspberry. I can successfully build a rust hello-world example
within the image build.

I added

TOOLCHAIN_HOST_TASK:append =3D "\
         nativesdk-rust \
         nativesdk-cargo \
         nativesdk-libstd-rs \
         nativesdk-rust-llvm \
         "

to my image and that gets me rustc and cargo superficially working, as
in they are part of the SDK. But attempting to use them fails with

11:36 $ /../sdk/sysroots/x86_64-pokysdk-linux/usr/bin/rustc --print
target-list
error: Error loading target specification: Could not find specification
for target "x86_64-pokysdk-linux-gnu". Run `rustc --print target-list`
for a list of built-in targets

Any pointers are welcome,

Diez


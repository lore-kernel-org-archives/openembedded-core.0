Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75D7CD5BD1
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 08:11:50 +0000 (UTC)
Received: from dkim1.emailarray.com (dkim1.emailarray.com [65.39.216.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3352.1780215106394395764
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 01:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@balister.org header.s=eeenuy header.b=fTuobj4+;
 spf=pass (domain: balister.org, ip: 65.39.216.94, mailfrom: philip@balister.org)
Received: (qmail 14157 invoked from network); 31 May 2026 08:11:45 -0000
Received: from localhost (HELO dkim1.emailarray.com) (127.0.0.1)
  by dkim1.emailarray.com with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 31 May 2026 08:11:45 -0000
Received: (EmailArray Haraka outbound); Sun, 31 May 2026 04:11:45 -0400
Received: from smtp4.emailarray.com ([192.168.1.45])
	by dkim1.emailarray.com (Haraka/2.8.25) with ESMTPS id A445401C-7651-4463-905A-CCDE2C6FB87D.1
	envelope-from <philip@balister.org>
	(cipher=ECDHE-RSA-AES256-GCM-SHA384);
	Sun, 31 May 2026 04:11:45 -0400
Received: (qmail 76365 invoked by uid 89); 31 May 2026 08:11:44 -0000
X-Orig-Sender: philip@balister.org
Received: from unknown (HELO ?10.10.147.164?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0A0NS4xMS43MC4xMTQ=) (POLARISLOCAL)  
  by smtp4.emailarray.com with SMTP; 31 May 2026 08:11:44 -0000
Message-ID: <9fefbd2b-0080-4e4a-a0ca-a17ab1eb7756@balister.org>
Date: Sun, 31 May 2026 10:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH scarthgap] conf/machine: fix typos in ARM and
 x86 README files
To: prabhudasuvatala@gmail.com, openembedded-core@lists.openembedded.org
References: <20260531053117.17915-1-prabhudasuvatala@gmail.com>
Content-Language: en-US
From: Philip Balister <philip@balister.org>
In-Reply-To: <20260531053117.17915-1-prabhudasuvatala@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1;a=rsa-sha256;bh=46YQBr8VoZ6w16yH2399xDh2YraTWThMN2fvhgfs/1s=;c=relaxed/simple;d=balister.org;h=from:subject:date:message-id:to:mime-version;s=eeenuy;b=fTuobj4+Do60ijXc4BrXEEraqUA/Tzyb0yECV+I1EcB+NSrZfygI2Cp0O++kJsjp/QZd9YojfIjfT3tz6Lehn4D891d2ajGgMSm2VkJCCfg4zn1mVXv0xPYxpOHSaFstvqwMv20+BrkTUAYguerH9HrB0iuO5aEX6m7zW5INvIc=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 08:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237793

Ooops, needed reply-all

On 5/31/26 7:31 AM, Prabhudasu Vatala via lists.openembedded.org wrote:
> Correct spelling errors in the machine include README documentation
> for both ARM and x86 architectures to improve clarity.
> 
> - Fix TUNE_PKGACH -> TUNE_PKGARCH in ARM README.
> - Fix "to to" duplication in x86 README.
> 
> Signed-off-by: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
> ---
>   meta/conf/machine/include/arm/README | 2 +-
>   meta/conf/machine/include/x86/README | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/include/arm/README
> index c5637798e6..807b7f8a2b 100644
> --- a/meta/conf/machine/include/arm/README
> +++ b/meta/conf/machine/include/arm/README
> @@ -10,7 +10,7 @@ of the existence of the "bigendian" feature in a given tune.
>   
>   A small set of ARM specific variables have been defined to allow
>   TUNE_PKGARCH to be automatically defined.  Optimized tunings must NOT
> -change the definiton of TUNE_PKGARCH.  TUNE_PKGACH:tune-<tune> will be
> +change the definiton of TUNE_PKGARCH.  TUNE_PKGARCH:tune-<tune> will be

Definition is also misspelled.

Philip

>   ignored.  The format of the package arch is enforced by the TUNE_PKGARCH
>   default.  The format must be of the form:
>   <armversion>[t][e][hf][b][-vfp][-neon]
> diff --git a/meta/conf/machine/include/x86/README b/meta/conf/machine/include/x86/README
> index 05aee533a7..8065ecb3d6 100644
> --- a/meta/conf/machine/include/x86/README
> +++ b/meta/conf/machine/include/x86/README
> @@ -17,7 +17,7 @@ The TUNE_PKGARCH is defined as follows:
>   TUNE_PKGARCH = ${TUNE_PKGARCH:tune-${DEFAULTTUNE}}
>   
>   The package architecture for 32-bit targets is historical and generally
> -set to to match the core compatible processor type, i.e. i386.
> +set to match the core compatible processor type, i.e. i386.
>   
>   For 64-bit architectures, the architecture is expected to end in '_64'.
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237791): https://lists.openembedded.org/g/openembedded-core/message/237791
> Mute This Topic: https://lists.openembedded.org/mt/119572343/384425
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [philip@balister.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



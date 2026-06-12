Return-Path: <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2C4CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 11:29:09 +0000 (UTC)
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68291.1781263748944242093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 04:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup rs20250326._domainkey.rsg.ci.i.u-tokyo.ac.jp on 127.0.0.53:53: no such host" header.i=@rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=SKUTonxp;
 spf=pass (domain: rsg.ci.i.u-tokyo.ac.jp, ip: 49.212.243.89, mailfrom: odaki@rsg.ci.i.u-tokyo.ac.jp)
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 65CBSrai030512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 12 Jun 2026 20:28:54 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=oeyjVfFzAMGGI73EVFAEQjGnyrzAUfH+IYNrMKpc5qM=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1781263734; v=1;
        b=SKUTonxp/zHTYm2NMAOYvIU4ttM9fy4eFw40M/Cu8k7VjdNT5t5s7QCQ1ljXg08p
         iul80Ssjb5lqaCrkjk17IcUasDKd0B0NAayoyp249WTT+gp2Xf4tPI8VrKctArjx
         /IAw7pp7FZEdqM44z1lsruALPpE1U0IFg5CIsCv8yF5tOH6ZK4MsJSbDlnqDq1Tr
         msSPNQD72k1JanVwNjSySA+9bDgiw9opoE/C+4wpCszKhaSH5iDS+3ZMBS+Z0NBf
         99Z6TK1FTgYyVRXBONBkxSFOZ6aBbK/mg8VHtCyV+Bs31TX+BUJGYrDDoMTHuoo+
         7/Yw2cwXLKoghmPIRMwbcg==
Message-ID: <08119b07-8333-48ff-8f11-7e843a632a6a@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 12 Jun 2026 20:28:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ui/sdl2: Explicitly specify EGL platform
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: qemu-devel@nongnu.org,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org, Quan.Sun@windriver.com,
        Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20260611-sdl-v1-1-93d4a51684bb@rsg.ci.i.u-tokyo.ac.jp>
 <CANNYZj_tg=DTXW3mdUGyifCDpeLAE5YWHLCNuuwQV_Y4fUsTpQ@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <CANNYZj_tg=DTXW3mdUGyifCDpeLAE5YWHLCNuuwQV_Y4fUsTpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 11:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238601

On 2026/06/11 23:44, Alexander Kanavin wrote:
> On Thu, 11 Jun 2026 at 13:58, Akihiko Odaki
> <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>> Resolving the issue described in the GitLab work item also requires:
>> https://github.com/libsdl-org/SDL/pull/15806
> 
> Thanks! The pull request is only towards SDL2. I believe SDL3 (via
> sdl2 compat layer) isn't affected (it sets the platform correctly in
> my testing). Is that right?

Upstream developers are working on a fix:
https://github.com/libsdl-org/SDL/pull/15809

Regards,
Akihiko Odaki


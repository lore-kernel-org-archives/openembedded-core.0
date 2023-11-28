Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ADEC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 14:21:36 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.33608.1701181291786675502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 06:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Suwn7s8H;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-41f155c862bso28621551cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701181290; x=1701786090; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFo1p/Q9v364BxMpsv22XKpZ5lWnfO3Dl3je9tkCo+Q=;
        b=Suwn7s8HUnb/GNM6mNUnbU6PyhoAJ8elQBfLMxmC0zEa1eF1N5bIse7DZCtXrinZDX
         UQdm3fCRmeABFMuECsqDxshW3opHSUqr722dBPDHJKchFHoihNk/eomSyTRGn2rntpKQ
         Ky1TFZM7nVjzdlEsy3srKKhX8sQVYlXD/ZD1cGHt7688bzorzouusTGoGc/qYk/lo9c7
         j/Fk/nRASA3+1LVKBtEJIPBDg8eNG7XbyJWNzwv804zQjGdMCuCb1z2XfE4bvhmPcjIP
         gkEwU1rIxJAJ9WM7d49ispkLG4oryBLFIFw1sVY2QJZSSqiSsAk/uD77cy2TJnZFqX1K
         cDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701181290; x=1701786090;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sFo1p/Q9v364BxMpsv22XKpZ5lWnfO3Dl3je9tkCo+Q=;
        b=LDYuv5r41ak468QECcF2gy36O84Dwojusf77OIVx1YrPTn9XOPK2MiS/3XLZOvrtQo
         /NstTwjoyZwWxy8NxoE88j+XkP0335KzD0uaPKaxQq/H9oP/8kp8mAd1zgg3jyivzltv
         wJaL+YaeVj095oW2eOVVqWTXUrRZ9WdpMURfexsP7j9jj2Xt6N140R2QIKxYPF9ESrH1
         JJnEyh1efZRdxIc25eEvTCnn1kFeHJfAYMDufqV6Z5LJykh5+l1HBuP9hCR0sRkCfqN9
         TWR3i6kiTSj9+Hzq/PF92o1rBz4Yjol7qCG3VMZwhf1QBx8DJCQSE2M5RNY5xI24vyzE
         cCeQ==
X-Gm-Message-State: AOJu0Yycit8/VTEZXJATcY+eZee1EW4wL2oa7o2Qm/R61mDRRioYFVKu
	dwSw5PVdGwOI7Ih9so9MaulawQ==
X-Google-Smtp-Source: AGHT+IH33uUvg+gPUjYOUhi8stkMfYHAjADiS2J5ZF1EOAuBe9kHM9Bg38WioToJ+Yjm7WqCjmdPsg==
X-Received: by 2002:a05:622a:2513:b0:423:aac7:3e80 with SMTP id cm19-20020a05622a251300b00423aac73e80mr12929632qtb.25.1701181290643;
        Tue, 28 Nov 2023 06:21:30 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id t2-20020ac87602000000b00421c272bcbasm4586420qtq.11.2023.11.28.06.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 06:21:30 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Yx1vO2290rifKisa1BCQfgBt"
Message-ID: <ceb980e4-1d6d-44f3-ba0f-e309b82fe169@baylibre.com>
Date: Tue, 28 Nov 2023 09:21:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH v2] systemd-boot: fix
 build issues on armv7a-linux
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <0101018c10fc33e6-6df3ff32-13c7-48ff-aac3-24978e69be2a-000000@us-west-2.amazonses.com>
 <CALT56yOkiWRvEh1nJOXrZ+JRLc+L2CO5rqxUe6o7q2yanU41=A@mail.gmail.com>
 <41999db7-47e3-4ba7-b184-dadad299c368@quicinc.com>
 <CANNYZj_u8CC-Mj64dfHKFn6NCsNmXSwbfYJ2XtM1XxBaxG1xPg@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj_u8CC-Mj64dfHKFn6NCsNmXSwbfYJ2XtM1XxBaxG1xPg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191374

This is a multi-part message in MIME format.
--------------Yx1vO2290rifKisa1BCQfgBt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023-11-28 06:05, Alexander Kanavin wrote:
> But what was the excessive line that caused patchtest to not say
> anything useful? Can patchtest trim it or otherwise do better?

Looks like the usual warning line about not having a S-o-B became too 
long because it included the full path for the patch:

FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag. Sign off the added patch file (meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch) (test_patch.TestPatch.test_signed_off_by_presence)

I thought I had caught all of these, but I'll have to tweak it so that 
it only uses the actual patch name.

>
> Alex
>
> On Tue, 28 Nov 2023 at 11:48, Viswanath Kraleti
> <quic_vkraleti@quicinc.com>  wrote:
>> I figured it by running patchtest. S-o-B trailer missing in .patch. I am
>> updating it.
>>
>> On 11/28/2023 4:15 PM, Dmitry Baryshkov wrote:
>>> not know, which tests have failed, there
>>> is no way to fix the issue.
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#191358):https://lists.openembedded.org/g/openembedded-core/message/191358
>> Mute This Topic:https://lists.openembedded.org/mt/102828551/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------Yx1vO2290rifKisa1BCQfgBt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-11-28 06:05, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_u8CC-Mj64dfHKFn6NCsNmXSwbfYJ2XtM1XxBaxG1xPg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">But what was the excessive line that caused patchtest to not say
anything useful? Can patchtest trim it or otherwise do better?</pre>
    </blockquote>
    <p>Looks like the usual warning line about not having a S-o-B became
      too long because it included the full path for the patch:</p>
    <pre>FAIL: test Signed-off-by presence: A patch file has been added without a Signed-off-by tag. Sign off the added patch file (meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch) (test_patch.TestPatch.test_signed_off_by_presence)</pre>
    <p></p>
    <p>I thought I had caught all of these, but I'll have to tweak it so
      that it only uses the actual patch name.<br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj_u8CC-Mj64dfHKFn6NCsNmXSwbfYJ2XtM1XxBaxG1xPg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex

On Tue, 28 Nov 2023 at 11:48, Viswanath Kraleti
<a class="moz-txt-link-rfc2396E" href="mailto:quic_vkraleti@quicinc.com">&lt;quic_vkraleti@quicinc.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I figured it by running patchtest. S-o-B trailer missing in .patch. I am
updating it.

On 11/28/2023 4:15 PM, Dmitry Baryshkov wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">not know, which tests have failed, there
is no way to fix the issue.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#191358): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/191358">https://lists.openembedded.org/g/openembedded-core/message/191358</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/102828551/1686489">https://lists.openembedded.org/mt/102828551/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Yx1vO2290rifKisa1BCQfgBt--


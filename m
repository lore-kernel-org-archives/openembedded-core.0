Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163FAC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 14:32:37 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web08.11357.1645194756500329048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 06:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aVXXHRGI;
 spf=pass (domain: gmail.com, ip: 209.85.221.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id w128so4235100vkd.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 06:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KsFM3v4WYsbCAHxkKnLazL7t1NmU+hLLQFPWNSHWgoI=;
        b=aVXXHRGIin/asrWjOdctCy0yPBmfb7fzp6fiLReW3RyFJowSh0HV0BMTbMD+BFrikS
         e5LLyj4CjW7HayPY/dfmkVuf5Bp3ZtuaKgAicM98n3WriEEOC0UyNlufJCWwqFoW0NTD
         nVh0/6MOyf+k+Iq20F02CWczDGR1atf/ragDF8U6NrExk8uryla4MA1tscvEE1RKpMtC
         fqGo9DBkb+zT5bm72vckGYuBlBhtmt+FLR/Jiqs7BosptViPO5LvpF+8BUnI/cv9l5nt
         z6yZb+PA9ED7SRbKuI3Xvz2WZG7AhTZTHACIcwc3Z/+kf4OdFg86oXdEpeBsAq33hmP+
         x0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KsFM3v4WYsbCAHxkKnLazL7t1NmU+hLLQFPWNSHWgoI=;
        b=ARzsb0FnBb8sVAFS5Tx9HLqsJcwnpK+FCM0lm9wtoZjLusepfYrem0AWTPG4TxCYeh
         L2o0nfmgX5gIXRtG0cRdY9CiXf/1mCy0QaxjGZU9DYlaXCKoT3/2568j/B3Vql42VhN5
         xa76CUWH/dKVN8CJM2ti7H25yNCIBM2B59L0v4BGwh/eLHae6LMc57q0ttqv7fW5Hcb0
         78PHuw/42LOncJ/4AmrQtR0+OYS6ewArni1swJX2rXe42UCmac6pHUeGAmF5EB8jBuG2
         D3HUdKottXjtS9ZQR9t/znusl1OmUpE89I9gmei1Vo60ZKiMJlevmlDYWVp8Slae/KfO
         kkaA==
X-Gm-Message-State: AOAM532GAaLXPb5itBSC/1ZpJJqF6pUd3xTPHV5EFjzkm4Vn3ELKb/+w
	2lkg90OQfAMCDk+bZB4Va7qULFCEc2T438bMkE0=
X-Google-Smtp-Source: 
 ABdhPJwvFnV2GMHg3EOOVI5ftohFgHWG2fTsqAwTHzlrXJ24RFt8QRYHKWW5eEj2+lTrzJeYY10KAfSjqifuMr8zAZg=
X-Received: by 2002:a05:6122:20aa:b0:32d:4894:f680 with SMTP id
 i42-20020a05612220aa00b0032d4894f680mr3727030vkd.1.1645194755598; Fri, 18 Feb
 2022 06:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20220217003248.581903-1-saul.wold@windriver.com>
 <ly35kg9tsz.fsf@ensc-virt.intern.sigma-chemnitz.de>
 <caf357e342ad33e0117af76244ba13fcd804f4fc.camel@linuxfoundation.org>
 <lyv8xc8d2o.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyv8xc8d2o.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Feb 2022 15:32:24 +0100
Message-ID: 
 <CANNYZj_Q_ZLWs=onZsWwghggsVyBRZ1gzvBPf75Oqbw8erXgGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] convert-variables: Script for Inclusive
 Language variable renames
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Saul Wold <Saul.Wold@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 14:32:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161943

On Fri, 18 Feb 2022 at 15:27, Enrico Scholz via lists.openembedded.org
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:
> > Unfortunately there likely isn't a perfect rename and these were the
> > best we were able to come up with.
>
> Why is the rename done at all?  It makes the product just worse due to a
> less usable api and because it causes a lot of work for the users of the
> api (I shudder when I think about updating my CI to work with new and
> old branches).

Enrico, cut this out please. Every time you start with a specific,
kind of valid, question, then turn it into a rant about how the whole
effort is useless or worse. People simply will stop answering you if
this carries on.

Alex


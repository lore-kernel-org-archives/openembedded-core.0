Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EB2C433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 18:36:56 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.5288.1665340611146960511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 11:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ln6lkFkg;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id k2so20931691ejr.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wzVZVG0Vt3hZyLS+Zhacpmndd6Q6pN1RagTzgPGr1hY=;
        b=Ln6lkFkgRSO7iVpgzPyoceRBlerB8uyny2GgNUL10IU9YiAE4r/p9xMjbzdc4qJPMK
         K5s9cU/DDlmHNHfoBC8iT6hEGFG1SgGc9yP7Cz3naSOUt8tLn+sB/A8yWN3V0/3Xr8Ps
         epYY+XNgX+plXYJAHtb9Y1jffIXB4UcXZqb1bGCHff4/2ETMUioTCgzU3JLWyN34TDtu
         MwAn6ao22yaSL+Oj1Sx5zE4oFEbrMeIklLUmuCxikAnZJbE4rHAAO38vSu8u2rVqpxTX
         Rp+6oyCxeBqEC1WSgr8cehAFnSyvvCQLE8SFYko0KoCixZc4GgITfGdJpf9Lh7VkwMns
         FnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzVZVG0Vt3hZyLS+Zhacpmndd6Q6pN1RagTzgPGr1hY=;
        b=FdmvBjmTuAsRL92dRR92kvM8o5BkBfDa4RcLbQG0LVsJ+9uPTjchiQxu0G6aZD+TDy
         NFfcxRC9TWPMTMFHoBjfWmXb95G5EUih15ZByXI5chul5/KBGwrDvyaRZ6NXIrbgzDji
         LSFOIvQSbvptu6ivgqT7xtCaA8gyWhZZY1aG+7CO7H6acLdm+O0TOqMDn4l5Q2mA3KeZ
         S2tS5FBJOU9OJeinxa6dI5n+Hf5A9KYp3pHdljEeNOTULbpM/7VPeKXdCfCNpPNk9J9i
         o0ZT76Ws0j2Igogv2GABGwu6SPmm0wGJH44TcwyRn0tT3H+xIUJIi06gJ+Gse8UI7Quj
         Kdng==
X-Gm-Message-State: ACrzQf1dUc4nP6w+WjkA80VEOn5s34Qok3Jr/Zc3Hp60rNwnshJNkyL7
	iLNjRTHc0QQVIRs69+avCckrXP4dro1j2eyaRWQ=
X-Google-Smtp-Source: 
 AMsMyM4B3V3UOvucelEFUzFRQmdZi4Gs7Y4G5YGfZ1mouRzS7Rc7ty+4t+kHmGxzZmHOHjSnQu1PKstH/21+Dl7KoSY=
X-Received: by 2002:a17:907:7211:b0:78a:fd5:416c with SMTP id
 dr17-20020a170907721100b0078a0fd5416cmr12085064ejc.485.1665340609211; Sun, 09
 Oct 2022 11:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665270768.git.tim.orling@konsulko.com>
 <84594a2a5a9392187568022af9453e97fae2aa9c.1665270768.git.tim.orling@konsulko.com>
 <CANNYZj8GwP7-XPu5uAf-O7yW6DFXwv1H5iTC=oL2JaMgED_WLQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8GwP7-XPu5uAf-O7yW6DFXwv1H5iTC=oL2JaMgED_WLQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 9 Oct 2022 11:36:38 -0700
Message-ID: 
 <CANx9H-CxuUuAXeNRJ7HPDC7kApQqGP4ROj_HcKWdQyEQbBL0TA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/10] python3-cryptography: upgrade 37.0.4 ->
 38.0.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000071336f05ea9e537a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Oct 2022 18:36:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171554

--00000000000071336f05ea9e537a
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 9, 2022 at 6:42 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sun, 9 Oct 2022 at 01:55, Tim Orling <ticotimo@gmail.com> wrote:
> > * Update crate:// (via cargo bitbake)
> > * Manually fix crate:// versions to satisfy cargo
>
> Thanks for the set, I trust you've seen my proposal to update the
> crates automatically with a task from bbclass? I've tested it on both
> bcrypt and cryptography, with no followup fixups needed.
>
> Yes. I was just too lazy to try it out this round. I am excited about your
proposal.


> Alex
>

--00000000000071336f05ea9e537a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 9, 2022 at 6:42 AM Alexan=
der Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Sun, 9 Oct 2022 at 01:55, Tim Orling &lt;<a href=3D"mailto:ticotimo=
@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt; * Update crate:// (via cargo bitbake)<br>
&gt; * Manually fix crate:// versions to satisfy cargo<br>
<br>
Thanks for the set, I trust you&#39;ve seen my proposal to update the<br>
crates automatically with a task from bbclass? I&#39;ve tested it on both<b=
r>
bcrypt and cryptography, with no followup fixups needed.<br>
<br></blockquote><div>Yes. I was just too lazy to try it out this round. I =
am excited about your proposal.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
Alex<br>
</blockquote></div></div>

--00000000000071336f05ea9e537a--


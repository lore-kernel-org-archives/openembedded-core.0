Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AF4C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 02:50:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.6640.1664247034511122211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 19:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hiMFAIPU;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 u16-20020a05600c211000b003b5152ebf09so6037810wml.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 19:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=shx/v91I2L1hwwPJet5bzeUEZ10T4Hfv/GwsQdrQ+T8=;
        b=hiMFAIPUcDNa7mPo1CW8IlgrtyLrSYcyZSF51KHJ5deSS2bl/gjpu9WRAw4+Roew1/
         3TjLSpvW9+C8pZN5qUGZiwJee7n90ycOy2O+fWBOvsHofegziugj0NhzzauWnoIMkr1b
         fJ7rMxXnwt5j+COBt9iVJCGQPxiEi/Kd8ZpscrS19pJUX2OVcea5hbgspi6CiXxz2NY7
         pUBLUgWSU2zziycSCG5d56XxZ47ORdEGqT4fgfPGtUTEDzbQHK920EY+B2bG5XUXpiBY
         ha8bPEwwSXNG80A288UyKvVV6Fx5F2q0H3P/iC2V8ckaKh+cVp+hTvhpAqRdvQshTy5A
         ZjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=shx/v91I2L1hwwPJet5bzeUEZ10T4Hfv/GwsQdrQ+T8=;
        b=SuJFKV6cfx5t1NTa1r28GH1+3I2PVl7mn8yhqkd/w3uDUOoWbLPCli928rsMnhZJoQ
         p1k3r/SMZCrz8HwmnhuB6Opp/qJFMKpMld+4rSNFLTlXnROKLu/x67SsheHbRsf01mSl
         HBuXreMQpSsSSySTyCquteCpnV57LacmJDce0zVnmRWs/SiiD5t79KRgCr7TaNg+gf8D
         mHBOqtpHfo9fbxIfzx0HMSGqBR+fjLboQ4+R1oP9xw1RyecycNGThKYnBMbKHBBA/14y
         dzeYbZ+AhSHZ6WFHgoMKpzXAo5iA+GYWJbSbG73L39QZY1lVCpQeUDvRgt+EZEZCLfHO
         CWpw==
X-Gm-Message-State: ACrzQf3+GrRBpTNgLDqjNLGJZ22rGp1IzGzDNGtRwpupV/2nB+8jQeHL
	Q2uG2ZkA9kbPvdg/v5xKzrv7BhAT9X4L6weOAnY=
X-Google-Smtp-Source: 
 AMsMyM5CTrV6E2MpJzrm1LlLsfMG6Q3ubvR+EDQCA1tGwM5rU8KcybgiN+fFV0K7ZVMTsrsvqQwJXSV2PqJcekb0RkE=
X-Received: by 2002:a05:600c:211a:b0:3b4:75ee:c63e with SMTP id
 u26-20020a05600c211a00b003b475eec63emr1028231wml.44.1664247032763; Mon, 26
 Sep 2022 19:50:32 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CA+chaQfvo9FLBja8sgZiR_oCR5_e0nds-HzLjRt89b_gLF7UzA@mail.gmail.com>
 <1246.1664242256581127666@lists.openembedded.org>
In-Reply-To: <1246.1664242256581127666@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Sep 2022 04:50:20 +0200
Message-ID: 
 <CA+chaQf76Mi+aH_-adr6CZW69HPJHcjhGsyV-2vM8iQYzZTrVw@mail.gmail.com>
Subject: Re: [OE-core] PR to fix WantedBy parsing of systemctl
To: robert_henz@jabil.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000034db7f05e99fb5ac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 02:50:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171082

--00000000000034db7f05e99fb5ac
Content-Type: text/plain; charset="UTF-8"

>  I still can't send the resulting two files via git send-email (the final
step), as I would have to do a significant amount of configuration in my
_personal_ gmail account in order to use git send-email to send the final
patch.

FWIW: I'm also using my gmail account and the configuration was quite
simple, install msmtp, create app password in google security settings,
write it in ~/.msmtprc and git send-email works fine (the only issue is
that I'm seeing each sent e-mail twice, once as sent by me and once the
same e-mail received through ML).

Regards,

On Tue, Sep 27, 2022 at 3:30 AM Robert Henz via lists.openembedded.org
<robert_henz=jabil.com@lists.openembedded.org> wrote:

> I have confirmed your patch worked for me. Perhaps the documentation
> should also be updated to indicate that remotes need to be cloned/added
> using the https protocol?
>
> I still can't send the resulting two files via git send-email (the final
> step), as I would have to do a significant amount of configuration in my
> _personal_ gmail account in order to use git send-email to send the final
> patch. I will attach the resulting two files here and perhaps that will be
> sufficient for someone to begin reviewing my actual PR.
>
> Thanks,
> Bob
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171081):
> https://lists.openembedded.org/g/openembedded-core/message/171081
> Mute This Topic: https://lists.openembedded.org/mt/93809846/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000034db7f05e99fb5ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0

I still can&#39;t send the resulting two files via git send-email (the fina=
l step), as I would have to do a significant amount of configuration in my =
_personal_ gmail account in order to use git send-email to send the final p=
atch.<div><br></div><div>FWIW: I&#39;m also using my gmail account and the =
configuration was quite simple, install msmtp, create app password in googl=
e security settings, write it in ~/.msmtprc and git send-email works fine (=
the only issue is that I&#39;m seeing each sent e-mail twice, once as sent =
by me and once the same e-mail received through ML).</div><div><br></div><d=
iv>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Sep 27, 2022 at 3:30 AM Robert Henz via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;robert_henz=
=3D<a href=3D"mailto:jabil.com@lists.openembedded.org">jabil.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><p>I have confirmed your patch worked for me. Perhaps the docum=
entation should also be updated to indicate that remotes need to be cloned/=
added using the https protocol?<br><br>I still can&#39;t send the resulting=
 two files via git send-email (the final step), as I would have to do a sig=
nificant amount of configuration in my _personal_ gmail account in order to=
 use git send-email to send the final patch. I will attach the resulting tw=
o files here and perhaps that will be sufficient for someone to begin revie=
wing my actual PR.<br><br>Thanks,<br>Bob</p>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171081): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171081" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171081</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93809846/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93809846/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000034db7f05e99fb5ac--


Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B9EC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 04:41:00 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.7645.1633927255063811721
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 21:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a/bba+1O;
 spf=pass (domain: gmail.com, ip: 209.85.219.170,
 mailfrom: chuckwolber@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id q189so36102163ybq.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1L8bRXiESo1LwLGDAqSmiLaYbpwxiF1XDoZggl3cPc8=;
        b=a/bba+1Ockkb4jlck3+VWH4VKDNFTzkEI32nY2BkcJ3vcumSX987t7QAhGO1FMa4X9
         Nx9d3SkQQVkiPEeiLk3b1UgNSSVEMsUgValLodMXRdRFb/O6k5Faus4x2pFaS5zu9vkU
         leqkHHDzaUNOj8oX8zSyj7ihu7scumIhJCIIGBPPr/zoz9C1nBi66JWToxHxXK2Pj7um
         fhyFZ6wN63mCN3woWaj/JxVRlJKMIkTmQuW6zTlCgvtbnGn9EIWVCBbBPR7D5tueX2du
         OHZ+TVUC8VVGi19KGlahs4GehMD5gyhUTrKyqPe8lqCtF5DheeMjntNE+IYSv6ZAdwpn
         OXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1L8bRXiESo1LwLGDAqSmiLaYbpwxiF1XDoZggl3cPc8=;
        b=CzwvOi93dkbIjYII6ncueTqu8923iW1QTRcaoC01MjH+1dfNUvAZP/BZw4ikW8eUUf
         26/IQmNCbrUcCQuvp20cb7lSZ23lsGdXOEWsGlgge59X2LFcnB8e2DHCkdSgehqrCiYv
         J7Q386gyR43ey0GcbXNfKhVnftpGNI+S7Tt3JZcDRiJ6Znz2zB9m8/nJ8IUVFvOZchIz
         veAFCaPxoAL0OqWVjE/SJBKJNZbjp9n5TbCRinl97Vi952xQxugBm2zOlCwy2YCf4NLQ
         OUrILIF4S2Q9B5LdEdTZfKt5peSCLow417redLWVLyzEi79Y2nTbfU4vI2ivmbDUWnLA
         LymA==
X-Gm-Message-State: AOAM532URh5/XOkMijclPCPmv68wr6+coxJdlQr29H8kIIEnofFWIpJg
	GZ5a4RXTn/7hBM/90i5KXaGavF+uGyX3eWLDNY4=
X-Google-Smtp-Source: 
 ABdhPJx/vASPU2D4liwIpNIUIjJLKbnUffQn6EGBA6eRaOhuxr+60Kg8hff5wSRtVkhrT3yXKPQS8tqAixw4rHrzw1U=
X-Received: by 2002:a25:14d6:: with SMTP id 205mr18472497ybu.93.1633927254211;
 Sun, 10 Oct 2021 21:40:54 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAA=hcWSfqgxOX8UjwW35tD4VMC8c0SHWVo=_=z38NH7+rq6dAg@mail.gmail.com>
In-Reply-To: 
 <CAA=hcWSfqgxOX8UjwW35tD4VMC8c0SHWVo=_=z38NH7+rq6dAg@mail.gmail.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Sun, 10 Oct 2021 21:40:43 -0700
Message-ID: 
 <CAB=6tBQCvMVzZikXv5gLw-uHRft5uLuFX1yRouv-T6Q_ug=qcg@mail.gmail.com>
Subject: Re: [OE-core] How to trigger Yocto Linux /etc/profile or shell
 scripts in /etc/profile.d without shell logging in?
To: JH <jupiter.hce@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
	OE <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000937ecc05ce0c5507"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 04:41:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156809

--000000000000937ecc05ce0c5507
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 10, 2021 at 9:30 PM JH <jupiter.hce@gmail.com> wrote:

> The Yocto uses /etc/profile for root login, but there is no root
> physical login in an embedded device so the /etc/profile is never
> called, I added a shell script to /etc/profile.d, it was not called
> either. Both /etc/profile and scripts in /etc/profile.d can only be
> invoked when I physically log into the debug console, that is
> impractical. Appreciate your advice, how do you resolve that kind of
> problem?
>

What problem are you attempting to solve by running a script from
/etc/profile.d?

..Ch:W..


-- 
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--000000000000937ecc05ce0c5507
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Oct 10, 2021 at 9:30 PM JH &lt;<a=
 href=3D"mailto:jupiter.hce@gmail.com">jupiter.hce@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
The Yocto uses /etc/profile for root login, but there is no root<br>
physical login in an embedded device so the /etc/profile is never<br>
called, I added a shell script to /etc/profile.d, it was not called<br>
either. Both /etc/profile and scripts in /etc/profile.d can only be<br>
invoked when I physically log into the debug console, that is<br>
impractical. Appreciate your advice, how do you resolve that kind of<br>
problem?<br>
</blockquote></div><div><br></div><div>What problem are you attempting to s=
olve by running a script from /etc/profile.d?</div><div><br></div><div>..Ch=
:W..<br></div><div><br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature"><div dir=3D"ltr"><div><b><span style=3D"font-family:monospace">&quo=
t;Perfection must be reached by degrees; she requires the slow hand of time=
.&quot; - Voltaire</span></b></div></div></div></div>

--000000000000937ecc05ce0c5507--


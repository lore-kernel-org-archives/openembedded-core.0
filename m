Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35376C433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 06:26:57 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web12.20836.1637908016320584638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 22:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mUPKJ0mV;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id az37so16587471uab.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 22:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9D/UhP4+/1rJ285OI1X5QB6mO/60x3W6JPH4IH4ZuKA=;
        b=mUPKJ0mVffhv1LIzalC88XV9wtNtVEKrNl+2xSkl3ukvDdCS5TDfU57TULOXdMrtwO
         lyxJVBlQ47iB6e2/o0BgcbOjNmaOwmZRl7iLt3KCVOpL9sRgVQU6AjViJwEtPq1dWvV4
         XlknXM4Bjrq4QpF3lTGilheSOfgUjAt+Q0UDtB89xupemWWXDczJbemUTP9R70jTZaHi
         PZc2tDaNFVgPI37V1bQdl92IJOpykOQHMruAlfMIrzNP6Uybl1zq6AUhRGIql09ct3L5
         WTLaR+/ag+O//k4AoyM8U5yvdSnXXgaZW4VfLImWCqAN8hxD0Gz6tmn3eS7zYA3sMECv
         NdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9D/UhP4+/1rJ285OI1X5QB6mO/60x3W6JPH4IH4ZuKA=;
        b=4qj5qJT5j0fOVfHaDMuEPgdfUZSSu5OBRgIRVp08ZbOlPS1SxuHozS18had7plSjpF
         RI2lmlYWm3GCpkVx2pECKKnrvUxycf6xrxIhBMfXxSqFlkbhrZAFo30cy7Xe/dizl2LU
         n1d66w2zoPpTwWB7DkEGAAQEc6nk+N3+IrSHX3QNjgR663x3JPQwdClEL6wdcwzCdy5h
         sBmIQSI24T1+dYLy4lb2GOCQYzUhLN53dUABdib1D1UI2VU5UzU9n9jDfK5BQcT+sogG
         0vn+VkmMXG+Lolj3v7XP5JCsNXT1govApeHHoyiRjgWotC7gzHaYYCiA6CXaLdPfIdTl
         Cuug==
X-Gm-Message-State: AOAM532439XCC2uG4LwQD1ONciVVE/Acbw91bGZjKFvVhTeL0zluFISv
	9jKYW893dNB+EsCJhzj4UW+UWfmDHKv3TglS64U=
X-Google-Smtp-Source: 
 ABdhPJwmxDU7HlplXUoZihzSEi17OfWL1pQmth/I0bsK5mpOSiU6UwIQ/lFCPD/uew+ym2KMsoMmLFYWbI/Oj5pJq7E=
X-Received: by 2002:ab0:6ecf:: with SMTP id
 c15mr33289403uav.113.1637908015515;
 Thu, 25 Nov 2021 22:26:55 -0800 (PST)
MIME-Version: 1.0
References: <16BAEC7B11896AEA.23256@lists.yoctoproject.org>
In-Reply-To: <16BAEC7B11896AEA.23256@lists.yoctoproject.org>
From: Jupiter <jupiter.hce@gmail.com>
Date: Fri, 26 Nov 2021 17:26:19 +1100
Message-ID: 
 <CAA=hcWSA8-8TCJDD8_Zib11Vaizok-xZvQMqSevjKJLrQ+GuhA@mail.gmail.com>
Subject: How to create connman_1.40.bbappend to enable and to build connman
 with iwd?
To: yocto <yocto@lists.yoctoproject.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>,
	comman <connman@lists.linux.dev>, Daniel Wagner <wagi@monom.org>,
	Armin Kuster <akuster808@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 06:26:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158824

Hi,

Given the high profile of iwd and advocating connman with iwd, I
believe someone have already built Yocto connman and iwd,
surprisingly, I could not even find an iwd recipe in
https://github.com/openembedded/openembedded/tree/master/recipes, nor
can I find connman document and instructions to replace wpa_supplicant
by iwd, what could I be missing here?

Appreciate your kind advice.

Thank you.

Kind regards,

- jh


On 11/26/21, JH via lists.yoctoproject.org
<jupiter.hce=gmail.com@lists.yoctoproject.org> wrote:
> Hi,
>
> Please correct me, but it seems to me the connman is moving to a
> direction to ditch out wpa_supplicant and to use iwd, but the Honister
> still configure connman with wpa_supplicant by default, appreciate
> your advice:
>
> - Is connman with iwd stable enough?
>
> - How can I create a connman_1.40.bbappend  to replace wpa_supplicant
> by iwd configure?
>
> - Where are the documents for configuring and building connman with
> iwd? Where is the operational guidance to run connman with iwd? Can I
> use the same connman dbus APIs or are there any dbus API changes to
> run connman with iwd?
>
> My apology for FAQs.
>
> Thank you very much.
>
> Kind regards,
>
> - JH
>


--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs


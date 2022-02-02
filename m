Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574B9C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:29:29 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web12.2308.1643826568611673512
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c3+XeAqW;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id u76so826188uau.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fDIHSakP9cd5ss6hzfNoxAVUSsqNFVEMSBtsr0tzLCw=;
        b=c3+XeAqWu9Jg6xQsWUVlBiI4OdrEGxrZIDwU4v13YUBQAQqnSMYukYBWsjoISmk9AI
         eH0p7x6MFG4zyBfL0QeBlTZFzA1xHZ2k+PqisfJEuFfUW/jsSIrKInPpOrNkBYuUizvC
         +/BflPPEEJQpao8djhOElfujVDa+tpyNLI8NA31j+YVCq7bpfdJn2Kyg74ZPj5ytEvnH
         qTg8+F54EJjcSPdw6J5v3UaoyzTZEfGzVS+Glhel+K7ZdFI+wkfCfGmJEJPB0WjYXS7Q
         iJwZTIgY0FuNlS3wXKa0OWK7O703LTMASmewfci3b9o+1fH6sPcUG9YKL6S5sxOFKoMX
         yOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDIHSakP9cd5ss6hzfNoxAVUSsqNFVEMSBtsr0tzLCw=;
        b=0L7ylBXxqqt6A3H/0uwr820QRMu64X1RUms/bciLq29DJgnhq23MaTjre97+4gvRze
         CFoGyu+/+FXKj05b3epdWDYXxhsspoIR5gbNRs0VIUSFAhn5h0gKbHq49fL8xR1HxagU
         4kqXsQndClBMSvmgye9RbB6tT5Gw/OvIgEOzJPoJVJg7LbbkrIWkZrJL2TQDyslNqbYu
         IhQ7xgjNzO24Da2qbzqi3mejwIoKakZO/sjqZG22/0nVjhI/rKb50be++ibFrYbfsSf2
         vbasVrBIjtTPgLmcd/g+Bigu+nS3MeUdk67FWeiPo4hvOwTlgOSxl2PNs9vlXzMrX3uW
         uZRA==
X-Gm-Message-State: AOAM532o59Ykd8TfltYjLmeAU8xJX180wsfXBoE6L6HFius+2iPDAScU
	uXaKL3o6xcdDiBQZN1VPFexM2ceiygL1V7F+dfw=
X-Google-Smtp-Source: 
 ABdhPJyctNWYixvfdh9gzjjBQ+Gu0aUxdEPeH2lR6fBXqQiiMFpzt8ckWbrM0NRv4i+uH+TgMeAMMOgivY0mEzIZ3vE=
X-Received: by 2002:a05:6102:c50:: with SMTP id
 y16mr12317156vss.45.1643826567665;
 Wed, 02 Feb 2022 10:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20220201133054.3265186-1-alex@linutronix.de>
 <20220201133054.3265186-2-alex@linutronix.de>
 <16CFB8EC2EFE6F03.7982@lists.openembedded.org>
 <20220202002708.GB26229@denix.org>
In-Reply-To: <20220202002708.GB26229@denix.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Feb 2022 19:29:15 +0100
Message-ID: 
 <CANNYZj8PrFPWpFrGE4L39jG3z3_Nxh+xn-9_Eyr2vKA3W_3TkQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/2] weston: upgrade 9.0.0 -> 10.0.0
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Marius Vlad <marius.vlad@collabora.com>,
	Daniel Stone <daniel.stone@collabora.com>, Chen Qi <Qi.Chen@windriver.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
 Tom Hochstein <tom.hochstein@nxp.com>,
	Jussi Kukkonen <jussi.kukkonen@intel.com>, Ming Liu <ming.liu@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000a35fc905d70d32b9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:29:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161259

--000000000000a35fc905d70d32b9
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Feb 2022 at 01:27, Denys Dmytriyenko <denis@denix.org> wrote:

>
> BTW, the final 10.0.0 just got released earlier today:
>
> https://lists.freedesktop.org/archives/wayland-devel/2022-February/042103.html
>
> Alex,
>
> Would it be possible to includue the link above with the full Changelog in
> the
> commit message? Thanks.
>

Yes; I just sent the final update in the latest patchset.

Alex

--000000000000a35fc905d70d32b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 2 Feb 2022 at 01:27, Denys Dmytriyenko &lt;<a href=3D"mailto=
:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
BTW, the final 10.0.0 just got released earlier today:<br>
<a href=3D"https://lists.freedesktop.org/archives/wayland-devel/2022-Februa=
ry/042103.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesk=
top.org/archives/wayland-devel/2022-February/042103.html</a><br>
<br>
Alex,<br>
<br>
Would it be possible to includue the link above with the full Changelog in =
the <br>
commit message? Thanks.<br></blockquote><div><br></div>Yes; I just sent the=
 final update in the latest patchset.</div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000a35fc905d70d32b9--


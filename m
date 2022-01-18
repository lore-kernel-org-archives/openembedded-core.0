Return-Path: <rudolf.streif@ibeeto.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC3EC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 15:32:12 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.14008.1642519931484455543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 07:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibeeto-com.20210112.gappssmtp.com header.s=20210112
 header.b=6qDyVDGj;
 spf=neutral (domain: ibeeto.com, ip: 209.85.167.50,
 mailfrom: rudolf.streif@ibeeto.com)
Received: by mail-lf1-f50.google.com with SMTP id x11so46498412lfa.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 07:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ibeeto-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7L2kHWl92BPf8NVg2HU2vtl3s1DMrWFwba8yF3PFGvw=;
        b=6qDyVDGj7fUxvq60qcf+CmF5cXKf8Tj7nc/HvJIeHmz31M+kQKHL4orjwW085gFwWu
         bWNP25vADEO1ipT8Oz0pVBv9oEtiuQErxZPmd7HXYfpc68yJ8rihl24h9suqI+w4dAeg
         f0hsFcOGENdJ9D9P7n2aJ+1SKhWPNt1EAvRaVGEAVqFMCrMKfoyqxyX0LtIquELJDKsn
         SzFdhnR/tGAcrBaGe2AICfdIbpEgEdv6Y2V1O0og+ntwvlQPTfoHmxY3+U1zxfDvEHSp
         VQ8O21FqEuTVEIAswLSOevAjpM2g6v56EFTraL6RcRkRYFnE10XmrXANu3zX8gODQvrq
         PElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7L2kHWl92BPf8NVg2HU2vtl3s1DMrWFwba8yF3PFGvw=;
        b=i5gYNp4brF3wJbRzccOMYXP3wtX036kc/WozwBcd/5inJwZwgqhUs5+F4cbm5nmC8B
         8NBgZqpVXXxUCNF00GxmZ+QcmYbRKzKdcsyPkRegCa7IHAXg/cZjTdo9xF1kSoTCUll1
         eT/8J3SCGBOrcT+AddALYOwsJ+NUU0OU8mKa+2gNpU8Gu/h9dPyGK0NIhJFReeydelvs
         bd6TheFY7JI+iM9Lp+h65qENl22rndvHxp0QMIUZn6kk5HSzLre8PraPL074FVesbCkP
         Bny4GG/BmsrtJqAIyMfWe10uvuMeDjWSUhey4Eq9+S4yHJmXyUBsgyUzywyFRqhptnVF
         WoQg==
X-Gm-Message-State: AOAM530wtrpo/oQIYxL+X7erahHg5er3S2MxwB5F1d8pcYtlzhFJGfpZ
	p3awOLzSOKZcyBQgH8UDgeYezxyIs1jQ7Gb7gE8KlQ==
X-Google-Smtp-Source: 
 ABdhPJyMijWcy1PyiubKcgcKI6+cmIOeS8l6RebqJG/nBdzHQ2cFlbeOHZf723gQH1LzI/UO+UvJ71vp/cZdDTRd1Go=
X-Received: by 2002:ac2:5cc1:: with SMTP id f1mr22284134lfq.268.1642519929143;
 Tue, 18 Jan 2022 07:32:09 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAA=hcWQrFmWJMPizbeug6TPYsecWHttk4gM7netpGDiFv8N+Dg@mail.gmail.com>
In-Reply-To: 
 <CAA=hcWQrFmWJMPizbeug6TPYsecWHttk4gM7netpGDiFv8N+Dg@mail.gmail.com>
From: Rudolf Streif <rudolf.streif@ibeeto.com>
Date: Tue, 18 Jan 2022 07:31:56 -0800
Message-ID: 
 <CAPxNcnfb1z4fZfGGxEkyK3Hwa2fAwEGMRKP3_PrJc9Fmd4LS+Q@mail.gmail.com>
Subject: Re: [yocto] Honister broken WiFi communication
To: JH <jupiter.hce@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
	oe-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e9d2a905d5dcf8c3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 15:32:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160672

--000000000000e9d2a905d5dcf8c3
Content-Type: text/plain; charset="UTF-8"

Hi JH,

On Tue, Jan 18, 2022, 01:54 JH <jupiter.hce@gmail.com> wrote:

> Hi,
>
> Has anyone successfully built a Linux image by Honister to run WiFi
> driver, connman and wpa_supplicant for WiFi interface?
>

Yes, I have, but with Network Manager instead of connman. WiFi works
just fine.

>
> I could build an image by Zeus to run WiFi driver, wpa_supplicant,
> connman and dbus well, but after upgrading to Honister, the Linux
> image building was fie, but the WiFi is now broken, the WiFi failed to
> respond DHCP the WiFi could not connect to Internet, something is
> broken between wpa_supplicant and connman which setting kernel WiFi
> driver, WiFi interface and connection. I don't see any issues in
> kernel WiFi driver, connman and wpa_supplicant, something missing in
> the Linux image failing to set up the WiF network interface.
>

There are a lot of pieces in the chain and it is not obvious from your
description where it is broken.

If you run ifconfig -a does your WiFi interface show up? If not there is an
issue with the driver. Use dmesg and filter for the driver. Often a driver
cannot load the firmware. What is your WiFi hardware?

Did you install the regulatory database?

What error messages are you seeing when attempting to connect to a WiFi
network? Did you look at the connman logs?


>
>
> Appreciate your comments.
>
> Thank you.
>
> Kind regards,
>
> - jupiter
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#55897):
> https://lists.yoctoproject.org/g/yocto/message/55897
> Mute This Topic: https://lists.yoctoproject.org/mt/88505893/3617932
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
> rudolf.streif@ibeeto.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e9d2a905d5dcf8c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi JH,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Jan 18, 2022, 01:54 JH &lt;<a href=3D"ma=
ilto:jupiter.hce@gmail.com">jupiter.hce@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Hi,<br>
<br>
Has anyone successfully built a Linux image by Honister to run WiFi<br>
driver, connman and wpa_supplicant for WiFi interface?<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, I have, but with=
 Network Manager instead of connman. WiFi works just=C2=A0fine.</div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I could build an image by Zeus to run WiFi driver, wpa_supplicant,<br>
connman and dbus well, but after upgrading to Honister, the Linux<br>
image building was fie, but the WiFi is now broken, the WiFi failed to<br>
respond DHCP the WiFi could not connect to Internet, something is<br>
broken between wpa_supplicant and connman which setting kernel WiFi<br>
driver, WiFi interface and connection. I don&#39;t see any issues in<br>
kernel WiFi driver, connman and wpa_supplicant, something missing in<br>
the Linux image failing to set up the WiF network interface.<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">There are a lot=
 of pieces in the chain and it is not obvious from your description where i=
t is broken.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If you run =
ifconfig -a does your WiFi interface show up? If not there is an issue with=
 the driver. Use dmesg and filter for the driver. Often a driver cannot loa=
d the firmware. What is your WiFi hardware?</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Did you install the regulatory database?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">What error messages are you seeing wh=
en attempting to connect to a WiFi network? Did you look at the connman log=
s?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br><br><br>
Appreciate your comments.<br>
<br>
Thank you.<br>
<br>
Kind regards,<br>
<br>
- jupiter<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#55897): <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/55897" rel=3D"noreferrer noreferrer" target=3D"_blank">https://l=
ists.yoctoproject.org/g/yocto/message/55897</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/88505893/3617=
932" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopro=
ject.org/mt/88505893/3617932</a><br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank" rel=3D"noreferrer">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto/unsub" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org=
/g/yocto/unsub</a> [<a href=3D"mailto:rudolf.streif@ibeeto.com" target=3D"_=
blank" rel=3D"noreferrer">rudolf.streif@ibeeto.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000e9d2a905d5dcf8c3--


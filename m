Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C90CC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:08:22 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.2223.1667358497391842495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kaNZSYeQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id t25so41942226ejb.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9dfBMTHjPBGMM1deUDpGam2mITVM22sIwDp47zOLhGQ=;
        b=kaNZSYeQKvpFcXTBF3Cd9k5SQbgjnqA8Op6QDE1+v2Br0R3i0lhqXOeZL6+YEMRfWP
         446kSZFWA8uPoTNAPFrJ9Sd7a2JaDqCl20hZeZHJy23EQz22WaHFXfW1nc9vdTPF+rns
         zyASls62mb//OaDG2ic6P7kxpK9nOEEgzsXD7vkE2moN9Z7Zwo/bw7ZzbuevBvwsEonW
         UtSJ4totiRn8EaYthdmSKL4yfgvBNDpfGzm6Q5INk9eddwmAdrhJFiiglte8sNcmHOjF
         r91KTaHMrFbvLiItMIrI7ScnxBWb1ETa7RbzF/ok25O+m09PmKw84BwxnwsyoKZwtrz1
         dKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dfBMTHjPBGMM1deUDpGam2mITVM22sIwDp47zOLhGQ=;
        b=casyoP9xRRq3h7tO2n4MnVeTBz3MSpUAH4JcmjW8U0I0TyjCLzX5S4EYQX+GRU6ZHW
         pzKgMK5oVEUuL3iAo8xbkIdmwwQaXDLfJeTKTSpcj+5O9gfMMksgHjBLl1fzipT8pPvs
         kI2eAXaNDuKtdYRLZICzDxlaePYwf7fH5yTDcJpOdrR00Qo1DQJsuRgP87G59tUDJyNo
         DeW8EDT+fNAFzOBq1v3ZydEyKvQj7OhRzRg2LgUqM8x2Ns/S7DcaF6i0iI8owwIDEMBc
         dQuO0Cj79tHwHk5VujZi6PrDLS9JExcYPn3AS6laoBF2Ppg1Wi+h5GpniWEuUjpth7A3
         AXQQ==
X-Gm-Message-State: ACrzQf3wXRu3zTTU+kD+xeDndycFcaNepAWkThNJQAECA5AWmDPN8k/n
	PI6iTSXy5ExRti6NmWP18pWsDFLCPQHb9M6yUf8=
X-Google-Smtp-Source: AMsMyM6irgBYDVdBGt9UjhCuzM3wx5OoJI05fDi5rR/oaYwS59dUMO4Zjdr8MMkqf7kzuyPHlp88xGh6kl4dRBkU3I0=
X-Received: by 2002:a17:907:968b:b0:78d:f5c2:70d8 with SMTP id
 hd11-20020a170907968b00b0078df5c270d8mr20828408ejc.564.1667358495618; Tue, 01
 Nov 2022 20:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <0101018435c85a25-e47315aa-54d4-4eab-a061-31356725e4b5-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018435c85a25-e47315aa-54d4-4eab-a061-31356725e4b5-000000@us-west-2.amazonses.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Nov 2022 20:08:04 -0700
Message-ID: <CANx9H-BUwa_vGgLFv7a2rd5t2K+YQ2W-09WdrrmS6Lt4zbs0iw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] python3-wheel: upgrading to 0.38.0 SUCCEEDED
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: Tim Orling <tim.orling@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d83be105ec74260b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172562

--000000000000d83be105ec74260b
Content-Type: text/plain; charset="UTF-8"

This release was yanked from PyPi.

https://github.com/pypa/wheel/issues/478


On Tue, Nov 1, 2022 at 5:41 PM Auto Upgrade Helper <auh@yoctoproject.org>
wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *python3-wheel* to
> *0.38.0* has Succeeded.
>
> Next steps:
>     - apply the patch: git am
> 0001-python3-wheel-upgrade-0.37.1-0.38.0.patch
>     - check the changes to upstream patches and summarize them in the
> commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --amend
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this
> time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172445):
> https://lists.openembedded.org/g/openembedded-core/message/172445
> Mute This Topic: https://lists.openembedded.org/mt/94724791/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d83be105ec74260b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This release was yanked from PyPi.</div><div><br></di=
v><div><a href=3D"https://github.com/pypa/wheel/issues/478">https://github.=
com/pypa/wheel/issues/478</a></div><div dir=3D"ltr"><br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 1, 2022=
 at 5:41 PM Auto Upgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject.org"=
>auh@yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *python3-wheel* to *0.38.0=
* has Succeeded.<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-python3-wheel-upgrade-0.37.1-0=
.38.0.patch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them in=
 the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-auth=
or --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this tim=
e,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172445): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172445" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172445</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94724791/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94724791/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d83be105ec74260b--


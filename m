Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF18FC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 22:48:59 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.106.1668552534369488054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 14:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kK6BTsEG;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id k2so39905892ejr.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 14:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dplk2VwlvrUviyBb8wzF5Oob4bs9KXAQyhKvP3pqYqo=;
        b=kK6BTsEGUOX+HmTuPOvMrqi95CUl1JuEuzt6FATy1/DlyqVhZjxrhMUDrPmbhj5Uhe
         uTtA2A/K9ZwRJUzf41zKRD9enlRuoVJ9iyCAwZYlCeqlIcBbveU7Xk6zfeT3oT3dHPME
         /2Nq4C+BFycPV0G1d2JjIM5/ox5rFtXEEFdxMllXBNttijUO4cZRDh+oTAD9u/NjopC1
         gprvO/XUyn+ciOz6MygMO/c1ypillBhlDLTCtBOyNVRfMefg6TjPj7wKLxGbOMS9+nmR
         QiWu86XADwGg0evYUMg9sfzjlSHQCEzlZGS04God3tC/TUiqaYIyR+S8teYC/bLp8djG
         6DLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dplk2VwlvrUviyBb8wzF5Oob4bs9KXAQyhKvP3pqYqo=;
        b=jAiHPDu0ukaoOzLAs0sd+2BSgsEb+4VzDGmOuepstgXvHyoHH0bUFk3l3WhrlUIuf5
         Jqts9pPRwg2PQH4AIoyKz0miVLZtsxT8HG0dkRJ+IuZhoFPan+t2EN1Y+IoJRFkeNJNX
         BABcRnOWpHBSzs91GDU/WtCYdsnT3Zg0v1zcdjF5Pp9kOzjdDtbXTpamOCMGitQux8Fr
         emPiJABCFVnLG3g9yyupdudiRq+j6gkZ4WRLkg8f7bX85RUjBr3vsv98sHlkbRGTu9zo
         VA11TS3WI4md06ACP8VjZ1+E4URMJ63rrchYa3V7R35qmBdpBX1GS5UDyQKJ2lUBZwFA
         CJ3A==
X-Gm-Message-State: ANoB5pm7aOhp19X4YuF7nd9obQdNBZ4aSyvqAhEsKqFmm+ZEI+dzWmmc
	gYLRNs5LTEqT4bMxve7JOC5ZJtnuZopRV+DmRaY=
X-Google-Smtp-Source: AA0mqf7KPQUgF9YnDXNPB2cS5cC8wfq4qUgFMXA5viXrnfies4JcOZRb3H2lyg/YdH5L35hP5SIFJ6C0bdhXVR8TFaU=
X-Received: by 2002:a17:906:414d:b0:781:951:2fb with SMTP id
 l13-20020a170906414d00b00781095102fbmr15704591ejk.64.1668552532616; Tue, 15
 Nov 2022 14:48:52 -0800 (PST)
MIME-Version: 1.0
References: <010101847b65247d-c4a41205-aad6-4e70-856e-0f1f6cc887ca-000000@us-west-2.amazonses.com>
In-Reply-To: <010101847b65247d-c4a41205-aad6-4e70-856e-0f1f6cc887ca-000000@us-west-2.amazonses.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 15 Nov 2022 14:48:40 -0800
Message-ID: <CANx9H-D1AjBGzPPpO+mFrwWa_beSYSC0s-fGJM-Ax5-TvZEYAQ@mail.gmail.com>
Subject: Re: [OE-core] [AUH] at-spi2-core: upgrading to 2.46.0 FAILED
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: Tim Orling <tim.orling@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000feeb6405ed8a2852"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 22:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173359

--000000000000feeb6405ed8a2852
Content-Type: text/plain; charset="UTF-8"

Ugly working branch:
https://git.yoctoproject.org/poky-contrib/log/?h=timo/at-spi2-core_2.46.0

This upgrade merges atk and at-spi2-atk into at-spi2-core. The most obvious
collateral damage is in webkitgtk.


On Tue, Nov 15, 2022 at 5:07 AM Auto Upgrade Helper <auh@yoctoproject.org>
wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *at-spi2-core* to
> *2.46.0* has Failed(do_compile).
>
> Detailed error information:
>
> do_compile failed
>
>
>
> Next steps:
>     - apply the patch: git am 0001-at-spi2-core-upgrade-2.44.1-2.46.0.patch
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
> View/Reply Online (#173343):
> https://lists.openembedded.org/g/openembedded-core/message/173343
> Mute This Topic: https://lists.openembedded.org/mt/95042140/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000feeb6405ed8a2852
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ugly working branch:</div><div><a href=3D"https://git=
.yoctoproject.org/poky-contrib/log/?h=3Dtimo/at-spi2-core_2.46.0">https://g=
it.yoctoproject.org/poky-contrib/log/?h=3Dtimo/at-spi2-core_2.46.0</a></div=
><div><br></div><div>This upgrade merges atk and at-spi2-atk into at-spi2-c=
ore. The most obvious collateral damage is in webkitgtk.<br></div><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Nov 15, 2022 at 5:07 AM Auto Upgrade Helper &lt;<a hre=
f=3D"mailto:auh@yoctoproject.org">auh@yoctoproject.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *at-spi2-core* to *2.46.0*=
 has Failed(do_compile).<br>
<br>
Detailed error information:<br>
<br>
do_compile failed<br>
<br>
<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-at-spi2-core-upgrade-2.44.1-2.=
46.0.patch<br>
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
View/Reply Online (#173343): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173343" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173343</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95042140/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
95042140/924729</a><br>
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

--000000000000feeb6405ed8a2852--


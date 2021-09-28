Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63825C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 15:09:50 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.849.1632841788913703024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 08:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A7uJF/fe;
 spf=pass (domain: gmail.com, ip: 209.85.217.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id 188so21465027vsv.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rYp9YdL0IJauWmLLqQSYmRGOLF2M0FpzaSAtrqD451Q=;
        b=A7uJF/fei+y0S1MrkMGdiqcfKIHWAd47fqTKQL9ouKTFSHE50r6nOzir1v14DlqiNw
         PgMJjyvmvylUpQ86d9F40fSElq7vqWn+ohXZItRVguAlX3LuuA97U2IMui/392oLllou
         YuvUapVXoSgJozSXOIYZSRaqMYm2Fuar73CBoOlB0y3nfIMLOdYN4LLHQn6SvV82gFlI
         6+v/S4+bedY9AIpRdT/nKu+op80+F+3zij0PBXwa2UqP3yeXn2INObKXlnUALoCJ/rcp
         1Ni4Fz8lGHtOseGIjTFp8qDednWyBauHmmzl/pfcGodVWghGk1KOdC6yN454ggBG8cak
         Ljbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rYp9YdL0IJauWmLLqQSYmRGOLF2M0FpzaSAtrqD451Q=;
        b=DHYJGfWE1+z8RFOK+TVl7pgNMVzfmTs30VEFEe/3H51k1pTrjRD5o2sc2KwtctN6KY
         9Vx3JIRNM+ifTUGhG80TddWgFzoAkUd0pPTofh66ypw09t6asR15jiTjlszQk9EZFAhD
         APIMNncPjn29Q83mY2n3BEcsz9tVUKZKP2leSC7QYfJ1kSolsbuevJfWFgbjXrYpssfc
         Ihqlx/tnA63+WboRENU4/OS8qnPf0nOIsUmf7wUrWUuvw6Jl3T8aBRbQnKyZaxbCeftj
         zEwGCsO/twBJqMVvK+/gHCKvQDUt7q85mNgzYN9eTYRVTWPs4Ig8RKpNfz3tEHOe4084
         q6Lw==
X-Gm-Message-State: AOAM5322spHCKh8l2rL02sjTwOIIBtUzGamPWgyd5Ge7OmhAxqQD/h9A
	xCFS4SHmxCjROO/2xnUM7JLQ9pRaPu2in63d+2Y=
X-Google-Smtp-Source: 
 ABdhPJwQ7PeE+2WGB/JPPIEmVUQ6NBbHOmkpB64W7B40zGPNDcwTcGdj49j058xfm+YGBqbZc6dimwX18gdBKahw8M4=
X-Received: by 2002:a05:6102:21b9:: with SMTP id
 i25mr5528336vsb.1.1632841788103;
 Tue, 28 Sep 2021 08:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210927185846.70202-1-anibal.limon@linaro.org>
 <24379.1632840043418249566@lists.openembedded.org>
In-Reply-To: <24379.1632840043418249566@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Sep 2021 17:09:36 +0200
Message-ID: 
 <CANNYZj-U4rttuF0X028Z_G=N+3ZmErTBGK78oyneQ_Cm+HKCwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-support/ptest-runner: Bump to v2.4.2
To: oobitots@cisco.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c11dd105cd0f9ab9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 15:09:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156423

--000000000000c11dd105cd0f9ab9
Content-Type: text/plain; charset="UTF-8"

That is a meta-agl specific issue, and needs to be addressed in that layer.

Alex

On Tue, 28 Sept 2021 at 16:40, Oleksiy Obitotskyy via lists.openembedded.org
<oobitots=cisco.com@lists.openembedded.org> wrote:

> Hi,
>
> Patch applied with warnings.
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/270
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/269
>
> WARNING: ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0 do_patch: Fuzz
> detected:
>
> Applying patch 0007-WIP-Initial-LAVA-support.patch
> patching file flags.h
> patching file main.c
> Hunk #2 succeeded at 131 (offset 20 lines).
> Hunk #3 succeeded at 158 (offset 20 lines).
> patching file utils.c
> Hunk #1 succeeded at 49 with fuzz 1.
> Hunk #2 succeeded at 484 (offset 12 lines).
> Hunk #3 succeeded at 527 (offset 13 lines).
> Hunk #4 succeeded at 553 with fuzz 2 (offset 13 lines).
> patching file utils.h
> Hunk #1 succeeded at 42 with fuzz 1 (offset 1 line).
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156421):
> https://lists.openembedded.org/g/openembedded-core/message/156421
> Mute This Topic: https://lists.openembedded.org/mt/85908558/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c11dd105cd0f9ab9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That is a meta-agl specific issue, and needs to be ad=
dressed in that layer.</div><div><br></div><div>Alex<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 28 Se=
pt 2021 at 16:40, Oleksiy Obitotskyy via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;oobitots=3D<a href=3D"mailto:cisco.c=
om@lists.openembedded.org">cisco.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br><br>Patch=
 applied with warnings.<br><a href=3D"https://autobuilder.yoctoproject.org/=
typhoon/#/builders/120/builds/270" rel=3D"noopener" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/270</a><br><a=
 href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds=
/269" rel=3D"noopener" target=3D"_blank">https://autobuilder.yoctoproject.o=
rg/typhoon/#/builders/120/builds/269</a><br><br>WARNING: ptest-runner-2.4.2=
+gitAUTOINC+bcb82804da-r0 do_patch: Fuzz detected:<br><br>Applying patch 00=
07-WIP-Initial-LAVA-support.patch<br>patching file flags.h<br>patching file=
 main.c<br>Hunk #2 succeeded at 131 (offset 20 lines).<br>Hunk #3 succeeded=
 at 158 (offset 20 lines).<br>patching file utils.c<br>Hunk #1 succeeded at=
 49 with fuzz 1.<br>Hunk #2 succeeded at 484 (offset 12 lines).<br>Hunk #3 =
succeeded at 527 (offset 13 lines).<br>Hunk #4 succeeded at 553 with fuzz 2=
 (offset 13 lines).<br>patching file utils.h<br>Hunk #1 succeeded at 42 wit=
h fuzz 1 (offset 1 line).
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156421): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156421" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156421</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85908558/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85908558/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c11dd105cd0f9ab9--


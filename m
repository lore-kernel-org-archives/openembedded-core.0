Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950B4C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 19:11:28 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web08.552.1642705887121065881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 11:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=exMgVVdo;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 48so1047757vki.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 11:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JGcN6x9lWFgqqZCM6Y5JtMP8EsuuYkbW+gRJCMycDa4=;
        b=exMgVVdoZG6uRqSVPTRNhlzrIFV/O+LyD8Y4uf7IcTtbollwBHxB0zBOnt6TCkdvni
         jebkfxHrwsuJhEdhhd1HBaBwlBIfH2VwaDicsE9EdH2y9BlKuCwsPDJ5ba5p1VOw+1CM
         /LIIATZpbZWoxzLDTH0/FDpWilmaNiYTtDxo5GXce/90l8XqwLsJUWIsP5YYpHi6VEWQ
         A/yzfn1W2wtwUlEiYWNQdY1I6UEHUKFcGMjGzT3L3QUFDvPI2pND/FGBnGUQcq5RRpGx
         mUKuy2RVHNZaR0VB9ZVZ+eK56Z68qSMARIH2pPWm/iX0h9QUvDCXJb22xUE3OognIR5J
         3qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JGcN6x9lWFgqqZCM6Y5JtMP8EsuuYkbW+gRJCMycDa4=;
        b=41M3QLelI7vh/N2LQgqmTNm2A7gFnKnxUNX3J4gvTuEvifh5sLqm1L+OCIBbjWfs2o
         daNvnUn3S7k+hihA7A0CaC7R9d+BpITOKkSy6wTV8w7gXgF4FvDQJTUV6Z5m64Ysg+YO
         mZ2OotwPuawPUmtD+Z7xyzeUMAdmcKKjz1LetRErDNDhbVKveR/qEJAv3+VzAceSZq4U
         LRPnc8I1A+NURETmnNZ6ULL4vBcBYriWLu09kVLVyWVKNRdlg6vWft+aA32Mv4hKMzto
         0qLFI6XoDw31nr7FN5fTEHgU5eg5gY+TSJ/wOtxSYaKMXN/EbTZIDcwn8/1ENEShjT1Y
         M6Kg==
X-Gm-Message-State: AOAM5339l5jJfbAbwECsfKxe3Mp4VcYoi+QhBIqcIZGNhmBnR40r7bQz
	wDcH/yRyIFB1L+yoomZ5aH1534wJa9M8xKJqyGc=
X-Google-Smtp-Source: 
 ABdhPJxwzptdY2GYDb4l3ozV6XFTwsiSB0pjkG+GnKDa40uvKwhLK+F6Jj0rntwJnVf6UUCjQuPgfPs2/1ItOVI07Os=
X-Received: by 2002:a05:6122:2029:: with SMTP id
 l41mr195861vkd.4.1642705886169;
 Thu, 20 Jan 2022 11:11:26 -0800 (PST)
MIME-Version: 1.0
References: <20220120152146.1912559-1-michael.opdenacker@bootlin.com>
 <CANNYZj-wjwmKuu_FxoktmP84TFUJU4yi9JJ4bZ1N23VP+83n6g@mail.gmail.com>
 <27cd215a-abb7-a873-40a6-86df335691b1@bootlin.com>
In-Reply-To: <27cd215a-abb7-a873-40a6-86df335691b1@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jan 2022 20:11:15 +0100
Message-ID: 
 <CANNYZj_GJXUnhds4qgFsbCeEy=qSLXdXLfigzw3P9mV=FPBV3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: automatically turn on "kvm" on x86
 CPUs with VT
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Ross Burton <ross.burton@arm.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d0cf8005d60844fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 19:11:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160778

--000000000000d0cf8005d60844fe
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Jan 2022 at 19:43, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> However, my abilities to build and test on aarch64 are limited. At least
> this change would take me much more time to develop and is more likely
> to cause regressions.
>

Checking for readability of /dev/kvm doesn't need aarch64 testing, it's
universal and works on x86 too. It's a good check to do because quite often
/dev/kvm has wrong permissions so attempting to auto-enable kvm is not
going to work.


> Wouldn't this version already be a worthy change for users? I'm not sure
> we have many users running QEMU on aarch64. Would automatically passing
> the "kvm" option on applicable cases have value in our automated tests?
>

Automated tests (e.g. bitbake -c testimage) already do this; the value is
in manually starting runqemu.

Alex

--000000000000d0cf8005d60844fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 20 Jan 2022 at 19:43, Michael Opdenacker &lt;<a href=3D"mail=
to:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
However, my abilities to build and test on aarch64 are limited. At least<br=
>
this change would take me much more time to develop and is more likely<br>
to cause regressions.<br></blockquote><div><br></div><div>Checking for read=
ability of /dev/kvm doesn&#39;t need aarch64 testing, it&#39;s universal an=
d works on x86 too. It&#39;s a good check to do because quite often /dev/kv=
m has wrong permissions so attempting to auto-enable kvm is not going to wo=
rk. <br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Wouldn&#39;t this version already be a worthy change for users? I&#39;m not=
 sure<br>
we have many users running QEMU on aarch64. Would automatically passing<br>
the &quot;kvm&quot; option on applicable cases have value in our automated =
tests?<br></blockquote></div><div class=3D"gmail_quote"><br></div><div clas=
s=3D"gmail_quote">Automated tests (e.g. bitbake -c testimage) already do th=
is; the value is in manually starting runqemu.</div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000d0cf8005d60844fe--


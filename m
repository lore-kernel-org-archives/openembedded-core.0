Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10895.1794482522239812228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 03:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yWfY1SpA;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533797e72e8so26270301cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 03:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794482521; cv=none;
        d=google.com; s=arc-20260327;
        b=lRTzY4Mo4xHS6TArFhI1RSSUjp9hKUiCGtJ7U/RgPf05jbxpX66SqVYOOIsD2KNd2g
         yGRU3zXcJIpL6iUMTrvTbyET8b/59x8klCZFdXzabz3CKPdcH/Wzn9WyMVPVgsnG5Usf
         arRuhn7YlH2pFLmcdIDZyYch+pFcQliR+0Ql+6YuE1y+q5aF0/onjEqKBuApHZrOK7cO
         BzcHwPrB2z1skedkFhPpFiLMh598UwIDo/zvsO3INou1Uj8c3scHfMceFtwFsV+NJFEk
         2qda9mVWR5AlTwrcibK+q7xlEfhxZA8dMRGBLbYbksXJ4fWa0T2iypZGX8a+enGPLeMX
         71EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HRUToyOKKJjZEXDxcskqMmV2nVDzpk4ZUL7bqMB3tQU=;
        fh=FxPQcvcPQCuYv5p+cTI4sfqaVBcM23gFaSmq5pfnDY4=;
        b=ZgGAVbsTcZypVxMyy7w2O+VJkpGDKL3EwY1ay4rpae3YQX00JuLnR/4Qpxq8Ml0Cmc
         JvZbyAbtvwMI7vun1xr5Thnod0BMt0KYU5rQ3/0uRvIsq4y8RAq+wnT3Beo/fBoq0mwo
         yVy+TUHLjRDhmA4zWV7snSwbinA5D+w06O6T9fdGZbxT/TaROgDR2LzCy2TlwZbamK50
         G7KFYS6LsUevhKhY808su8sw5TXJ/JESdK3OOSdud//x7uKIa5YuiISq3S3X+RlUVBHI
         txY0vlvp26LkjRnnwj6ujaqaSvxQFDEUv4YXP/vIyLvz7SPpy3066RYlryVlMXCLtLxr
         yyxg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794482521; x=1795087321; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRUToyOKKJjZEXDxcskqMmV2nVDzpk4ZUL7bqMB3tQU=;
        b=yWfY1SpAnYfxrBoKmJEF3I3Tlem3GPLQilv3mG8+QxsU2sDgE5B6GGkyH+qVYNMlwu
         ClSZFZsf9opzTGv1XUMsrvgv3WJIBgrnl5SX9el75/16U/dtm59OzFDwN7LIJTtJ8BTX
         kEQZyMdaPdclnf/6rX+zH4s5r37rG7b6va9Q1DaRRlnGtXHkbaIsSFftrBKWx4evK+pX
         bQ3D132+6ygWvZ4mZ+oaoZcJYlHsHdAzNf2MyKX70sFJGJ8ouL37Z2lINSMUMLieJvih
         I6sH+9zvMJ9uDpZ6tjACLiKRrjSIUsTggedgRA7te4DJO92jRqIErP1x0m3zBuFkSr7c
         iZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482521; x=1795087321;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HRUToyOKKJjZEXDxcskqMmV2nVDzpk4ZUL7bqMB3tQU=;
        b=eF6VVRAPOFJFoSrc2/jyg0y0BtibX47ZmDPcqzDtsqQ112jk+KqDTq2KNLhvUjLTiZ
         /pHCOlxYiaZLqPXimHc3thCgFEUeeb737w8mpGoVOKZlYhlR7MsdZq/LO7hhnNnWA+Wh
         TN+SvdOgo61s4r0xLFo8TAGMgGbRkUchspOoGuyT4BYJujrt0kS/kisPWItyvwjnqcrI
         7cqlpoCQWCOcNrhUksMIhD+/jxKdH3J84ZXlZNMTeCFvbV670Pv3mdfrN6tVyABcRG6o
         S3XnuoY/1m7+BmQ63nOgVmtlK9IlsvZF38vWVE9qe5aJb9SldnoJRLBGgTWcXFHWwYSR
         Bhyg==
X-Gm-Message-State: APuU4Z9NMmDKWR9TgoTVZJxb0RCeJ/bGW5uTY/yMJRtlHLJedySCDETy
	2L0yo+y8hAKjlghiBSeOOMfn4mTU/qep4Zh2dz3dbIMDCTsoRWDgc+B0hOsbcyCSSc3oGNHnTIz
	Lvl7bkg0wSKS0d23heu4XtrSstnYyqnc=
X-Gm-Gg: AYBFou3JFqlv207MSONzMJ3xpzZ0J20MWAO5v+8hOZXLn/vMpXvtmwSk6UUrTp0yG1G
	Gx2RgveWdvuq+lQYi4rTUB9HEt4+BM9tel321Upyr2AVqnG74uF3ZW07LZlwLUX2rqyBW8hi5h5
	XJK1wBs9RvE5C0MJ+iBKti/0sSGWbzz13TRHe5smVL4w8Q0wz+xsFd5Qo0tclHyjPVYcmNERRqT
	BlT0CaSPYRjz2HnfWBKMeMp19DnbBfGyT9vJAm5CUXGf92I9XqHHUdHBf8/8YFteZvEMWhDgVMk
	feA9Dz9v0ounewZdVzbGzTEKxFDXMVaa8YRQPJEpUme2jFMZ484lnvRQLNB4/Tjy3v6CLcWF1FQ
	KCGgHYlUV8tm+3Bdojak5Xcz/UFmIqxkmrs8HPDxUNgxyaO/IhumGBctn+ivriobwOvmTilM=
X-Received: by 2002:a05:622a:4816:b0:549:df10:f62a with SMTP id
 d75a77b69052e-556c1b5d87cmr85771781cf.73.1794482521058; Thu, 12 Nov 2026
 03:22:01 -0800 (PST)
MIME-Version: 1.0
References: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com>
 <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com>
 <8A3AB7CF-6273-4D4A-9B95-073EEAE37CB1@geanix.com> <CANNYZj-32deiRNk9ZwzvTTFZuj7evLyPB3d_+33eDM+YSzr0og@mail.gmail.com>
 <18E7449543C100DC.893556@lists.openembedded.org> <8ABE57A1-35A3-4E3E-85FB-1CD7E3D27EE6@geanix.com>
In-Reply-To: <8ABE57A1-35A3-4E3E-85FB-1CD7E3D27EE6@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2026 12:21:49 +0100
X-Gm-Features: AclHuK_3ttzPWGTp5E6zLViMgCjJrDYANaDFoPcgLani89GCjJTzusbUNzsFY7o
Message-ID: <CANNYZj--_8eu7tQsuwhdNNEZQ+wSh05AGKHgWnX71-wGZ-SKPw@mail.gmail.com>
Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000039308b0660128508"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 11:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250086

--00000000000039308b0660128508
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Nov 2026 at 11:47, Sean Nyekjaer <sean@geanix.com> wrote:

> My intern pointed me to commit f757ae4dad ("license_image: extend to SDK
> coverage")
> When reverting that, I=E2=80=99m able to run bitbake os-rootfs -c populat=
e_sdk


Due to that change, the license check should probably be then fixed to only
run for the target rootfs, and not SDK sysroots. Can you reproduce this on
plain oe-core/poky master?

Alex

--00000000000039308b0660128508
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 12 Nov 2026 at 11:47, Sean Nyekja=
er &lt;<a href=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; wrote:</d=
iv><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
My intern pointed me to commit f757ae4dad (&quot;license_image: extend to S=
DK coverage&quot;)<br>
When reverting that, I=E2=80=99m able to run bitbake os-rootfs -c populate_=
sdk</blockquote><div><br></div><div>Due to that change, the license check s=
hould probably be then fixed to only run for the target rootfs, and not SDK=
 sysroots. Can you reproduce this on plain oe-core/poky master?</div><div><=
br></div><div>Alex</div></div></div>

--00000000000039308b0660128508--

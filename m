Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web12.2142.1614540218085464077
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MmxJoMTS;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id z65so5196379vsz.12
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R0pTbdHrZTSAae3jeVfb4Q4uyKpIN525bSfyyOAnwLw=;
        b=MmxJoMTSvSzWSpkkhui0pJjwHVwE6EKirkibCX1kiwV2Ve53zckhbbJ1b8hWy973u4
         U8t63p74bV+htg42XaUBrrK3SsqtXiVpKmCnDm3eMu7SFg7wv96tp4BCG16bxYIFU5/r
         8KRa5o3PwyfCrBfXyT5qduNtGov6jWnVIbvi4ASwtJvahzyi4ciejTrTuho7CRfnzXJs
         NWXmvQIey9bEC8Z/l6bmuDZaArj7P18WzHKYDd2kvaH+oD2LIiUbxj9L8lxrg22zTvuB
         OFmU9NCxIC3kNabIE4JJGXgBsyaSZix6p/myzSeEzF+Fopxy/TNZiMXZiTwpbHcVWTNx
         TRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R0pTbdHrZTSAae3jeVfb4Q4uyKpIN525bSfyyOAnwLw=;
        b=kvGq3EMndZIlQArs0G4TVL+bpDaxu1lozEqz/PL1RZGWUz7n4a7B0Uc2pWYL18zjN8
         1jWFO42pXhX1D4cbptDOcynJwWlH2Joql6J2k2GKBl328dWdj+6Du8j9xlFmxDK61YpB
         Sgc3dKqr7iybITKqufaUkiLWbf2ep2XAqFQv6jYwP8fRnoSuDpDIq/9NUP8R1mWUk/rp
         VDDkJL8FfqBx8tCMSG+3UrbBGWkiuQ1Dxt8oPIG0OsutfHVtd+Ebns8EL0E5wTwRnab7
         bwJUbrz2d1usDITk4WriB0fDNfKh3b9+8fCfTl7WnzGJY4xwLkVnfXlMpLF0jElJjPV7
         WK1g==
X-Gm-Message-State: AOAM532KgFpIkF0/08/2Cfo9IovK67ktsvyyA5WAnnLMuqlqXh4QWzZT
	QqnHzyCfLpxfAwWvHryVxVyKut5NdE+PW8ID2w4=
X-Google-Smtp-Source: ABdhPJxMiX0IzL+oueG/6qMD8h0uOenXjNPaGwRc4KcyxE2oSTMtK3lYEutnXE/gWZ8lEb2tLWUt7SkFv/+ZfHXdzP4=
X-Received: by 2002:a05:6102:902:: with SMTP id x2mr1369456vsh.31.1614540217142;
 Sun, 28 Feb 2021 11:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-2-alex.kanavin@gmail.com> <23dd5c64-4658-f00b-1775-46de9674a4d5@gmail.com>
 <CANNYZj8F9j_EEr=Ak0aACDpnpbu8t74haFkjJNRKLtoAbaV0SQ@mail.gmail.com> <c92ae0ca-762d-0f75-cfbb-dc2fed47b026@gmail.com>
In-Reply-To: <c92ae0ca-762d-0f75-cfbb-dc2fed47b026@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 28 Feb 2021 20:23:25 +0100
Message-ID: <CANNYZj_0nQD86_S2-NQs4u3JN8PNfgpEHU8+QX8vvDYEZVvMjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/24] bmap-tools: upgrade 3.5 -> 3.6
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001e516605bc6a70a7"

--0000000000001e516605bc6a70a7
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Feb 2021 at 20:20, Khem Raj <raj.khem@gmail.com> wrote:

> OK, df is also provided by busybox so I think we will always have df in
> rootfs, unless it specifically need df from coreutils, perhaps we dont
> need to be specific about the rdep
>

This was added because otherwise I was getting errors with
bmap-tools-native.

Alex

--0000000000001e516605bc6a70a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 28 Feb 2021 at 20:20, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">OK, df is also provided by busybox so I th=
ink we will always have df in <br>
rootfs, unless it specifically need df from coreutils, perhaps we dont <br>
need to be specific about the rdep<br></blockquote><div><br></div><div>This=
 was added because otherwise I was getting errors with bmap-tools-native.</=
div><div><br></div><div>Alex<br></div></div></div>

--0000000000001e516605bc6a70a7--

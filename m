Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.819.1616533692135193837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 14:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cGMDrd1S;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id a15so10157953vsi.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZCtL8itMnW8M1unTNnE3jTyUz4kC+6+MSd5RYOksNIA=;
        b=cGMDrd1S1t1+HJqJKBRhQOOv2MJjWEiEc2jrTb1l0l7fn+YRlZbSDL7E5FA7+bMJb8
         tK/1vyxtP9lw/rNoOoGi1Gg6F+HRXrod8mlGn2KDZgjB418cB/fuBe25+rjoipRayql2
         ofhWYI25L3m4y8Rr785k2ut/a5RuPkkhnAJzDUZ/0J6HxS+wUnAB8/+x1kMGXx4XBMVC
         tSYNJ9GeMeZsTx1q+hMCOjOiucCkfV2hbpeWJh9iyilw0vIlL5UVREImzSnZDATLI7oh
         UfId1M7M4sMJp8LuaEo+6C671/kSZ0L3xlR01tx73OmdQT4uxYjaF2Sc0Q10Ag6uk7N4
         +yhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZCtL8itMnW8M1unTNnE3jTyUz4kC+6+MSd5RYOksNIA=;
        b=VVIy0BX/gy0gpChkNKnCC3QNvB4lIoH1w31M6h0qLBznrnRBjvySvJcUSvztyhPx1D
         meb0+L9khnSBi+XKfZkROEme8WhALwp4V+x3KisAjOaKw49Wng22ZL02QBWIsQKU90Zp
         F0dpk4rDzGnxeJX6pP+shivoP4aFlslFcOT30yFxlHuZ42Xrrp4XtDvi1/MHPCCpFMOd
         fYnedTnj+izXMBGWonURDEgnsPimkiiiYI1tnUYJdjaN2qCQuHDRKE6UbLq3IEevcvJB
         nzv9lSwoQPRc87W8p9mRnyf1vkBvcpvaTDlkE8oNmu4tvyxc6LgVPNfiJjKYu9hlbItF
         xuag==
X-Gm-Message-State: AOAM532beMPBxZZZz39zfn/AnJryPsZaVnZdf3G3IHVvxHIKuA27WU7q
	2CEUPVJCO2BUCS5iSjBFQd3q2DFCbSR0woqN3X0=
X-Google-Smtp-Source: ABdhPJxlznfctkE7bbm7PiZk5ysgOvIcEvOtM7bxgTBVl3wUIoKS0Y9ZvecAhV4jsMbQ9UEd3HtyyWSp51Byx7PdV54=
X-Received: by 2002:a67:bc11:: with SMTP id t17mr31451vsn.51.1616533691272;
 Tue, 23 Mar 2021 14:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210323205029.87251-1-yifan.yu@windriver.com> <20210323205029.87251-2-yifan.yu@windriver.com>
In-Reply-To: <20210323205029.87251-2-yifan.yu@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 23 Mar 2021 22:07:59 +0100
Message-ID: <CANNYZj-V8feRiiYvEEGKRrOKgFd-392PZa8XWRMs7Qmmm8+dgg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/2] valgrind: Disable ptest swapcontext.vgtest
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006f8f3905be3a949e"

--0000000000006f8f3905be3a949e
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Mar 2021 at 21:50, Yi Fan Yu <yifan.yu@windriver.com> wrote:

> New test introduced in valgrind 3.17.0.
> Test fails on both qemuarm64 and qemux64.
>

Fails how? Did you try to build valgrind on the host and run the test
there? I am somewhat concerned that we should not be simply disabling
failing tests too quickly like this; the very point of ptest is to catch
and address regressions, including newly added tests that don't work.


Alex

--0000000000006f8f3905be3a949e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 23 Mar 2021 at 21:50, Yi Fan Yu &=
lt;<a href=3D"mailto:yifan.yu@windriver.com">yifan.yu@windriver.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">New test introduced in valgrind 3.17.0.<br>
Test fails on both qemuarm64 and qemux64.<br></blockquote><div><br></div><d=
iv>Fails how? Did you try to build valgrind on the host and run the test th=
ere? I am somewhat concerned that we should not be simply disabling failing=
 tests too quickly like this; the very point of ptest is to catch and addre=
ss regressions, including newly added tests that don&#39;t work.<br></div><=
div>=C2=A0</div><div><br></div><div>Alex<br></div></div></div>

--0000000000006f8f3905be3a949e--

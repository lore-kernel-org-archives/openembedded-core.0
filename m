Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.5574.1620860569140918652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 16:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kDk8cNej;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id l129so23945921qke.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 16:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OR3sI82poc7M4vbX8Hc5ZQ7720QMNWhqqhwAvUUkJRw=;
        b=kDk8cNejoOfdjz3WvSScGf5LcQL3bGYkUwoK0ifto7gKYEpbQB4IvOuazzIIBAa/L3
         Yrr0A2IAU7hFHUqhigr7nHkZwWbf9XO4K22nJdR6Bf8Q4LcuybkVtNHXFTG4SzGmXhIJ
         aqAaqUcNa9mEiC01KfzVOsMWKOL9W8a2YsXiR759u5suDm3yl5Iqf5TpuRZObdpCBGqL
         DapGDsCGFTrzYOITWt/s1cSHbBnicZPgtwUJEnbNIGvz++IRLc5xMu6FEDRZvA1RO0t5
         8MGbbL9yQ733LLG2txUShU2CjhimJ4WTGCr2IP1okNT83V4SJ67dJvHiyi3xSVmXixqR
         myMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OR3sI82poc7M4vbX8Hc5ZQ7720QMNWhqqhwAvUUkJRw=;
        b=brjE84/5HMpqsBILYysW9PP8Xn0J3Z3vvRroxy3PluQg1CPCpEkNBmCmlwbP8rjwBh
         gZf7n+Djlyza7YB7XIkJQ0c0ErY7ZMcwzujG23quXjhtzPiKCF+rOh4tpG3dv/oQ7gsW
         I6LgCiYiVIaSzTh1Kct0ZkT40bF75kZy1qUXINKV5tV62wvm1bVu/CG5P9L3o5xoPZjV
         74I5V4vK2PdLDs3nFpHOVQ4AkcTYlULMHE7sjxaR52+6YWxCkae4ea1hX5f+cyTdOAIE
         defqYBShAh1XVV//WALhJT/TiVac35o19aOZV7dG3TKhik2nrdTc+EERgbNwgkEpAzNw
         sVug==
X-Gm-Message-State: AOAM530t5bHRn7QXyQ/MX9JA6JKoEyT7jP+nmFB1tx3mfON8/sUrSevv
	EdbTpIAt1vf8KpIHq8o4kbK8/1W9LkSMHsZWSy0=
X-Google-Smtp-Source: ABdhPJwZwmU+YCQ+XaPYnrABx4TteQB6nIlEf9pyqD3WZ9YeziIJYBH+5JXAZnSSBc1Gqs60JqctuY+B6tE6Hu6Osgk=
X-Received: by 2002:a05:620a:24b:: with SMTP id q11mr16963011qkn.25.1620860568264;
 Wed, 12 May 2021 16:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-24-alex.kanavin@gmail.com> <CA+chaQfQBUphmMXsbOmM4Z82D75hZQUQMPMzKAzCctYudqAq6A@mail.gmail.com>
In-Reply-To: <CA+chaQfQBUphmMXsbOmM4Z82D75hZQUQMPMzKAzCctYudqAq6A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 12 May 2021 16:02:22 -0700
Message-ID: <CAMKF1sryddpR-2sQ_K6Eoj=AfM3gAVM=VAmth5vwLv0m6tTNJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/61] webkitgtk: update 2.30.6 -> 2.32.0
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 3:37 PM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> On Wed, May 5, 2021 at 5:20 PM Alexander Kanavin <alex.kanavin@gmail.com=
> wrote:
>>
>> Drop 0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
>> (merged upstream).
>>
>> Rebase other patches.
>
>
> This version fails to build in default oe-core setup (with x11 and witho=
ut opengl in DISTRO_FEATURES), see:
> http://errors.yoctoproject.org/Errors/Details/581086/

I think there still are a plenty of products which don't use OpenGL
capable h/w but need some display ( fbdev ), I Wonder if there are
users who are using such
a combination maybe with X or without but without openGL
>
> In file included from TOPDIR/tmp-glibc/work/core2-64-oe-linux/webkitgtk/=
2.32.0-r0/webkitgtk-2.32.0/Source/WebKit/WebProcess/WebPage/CoordinatedGrap=
hics/DrawingAreaCoordinatedGraphics.cpp:32,
>                  from DerivedSources/WebKit/unified-sources/UnifiedSourc=
e-54928a2b-35.cpp:5:
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.32.0-r0/webkitgtk-2.=
32.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:2=
16:13: error: no declaration matches 'bool WebKit::LayerTreeHost::forceRepa=
intAsync(WTF::CompletionHandler<void()>&)'
>   216 | inline bool LayerTreeHost::forceRepaintAsync(CompletionHandler<v=
oid()>&) { return false; }
>       |             ^~~~~~~~~~~~~
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.32.0-r0/webkitgtk-2.=
32.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:8=
2:10: note: candidate is: 'void WebKit::LayerTreeHost::forceRepaintAsync(WT=
F::CompletionHandler<void()>&&)'
>    82 |     void forceRepaintAsync(CompletionHandler<void()>&&);
>       |          ^~~~~~~~~~~~~~~~~
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/webkitgtk/2.32.0-r0/webkitgtk-2.=
32.0/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:6=
1:7: note: 'class WebKit::LayerTreeHost' defined here
>    61 | class LayerTreeHost
>       |       ^~~~~~~~~~~~~
>
> This upstream change should probably fix that:
>
> commit 834f335bb3e63e0bf78eed0520df33d5c55e5e8a
> Author: commit-queue@webkit.org <commit-queue@webkit.org@268f45cc-cd09-0=
410-ab3c-d52691b4dbfc>
> Date:   Sat Apr 10 22:02:50 2021 +0000
>
>     Properly use CompletionHandler when USE_OPENGL_OR_ES is set to OFF
>     https://bugs.webkit.org/show_bug.cgi?id=3D224149
>
>     Patch by Charl=C3=A8ne Wendling <julianaito@posteo.jp> on 2021-04-10
>     Reviewed by Fujii Hironori.
>
>     * WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:
>     (WebKit::LayerTreeHost::forceRepaintAsync):
>
>     git-svn-id: http://svn.webkit.org/repository/webkit/trunk@275802 268=
f45cc-cd09-0410-ab3c-d52691b4dbfc
>
> There is 2.32.1 which might contain this fix but it's not explicitly men=
tioned in https://webkitgtk.org/2021/05/10/webkitgtk2.32.1-released.html
>
>=20
>

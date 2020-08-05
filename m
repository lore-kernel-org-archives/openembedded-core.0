Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.1690.1596608334592903528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 23:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fTD0uMlt;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id t6so15326160qvw.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 23:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eGcb1DwpZ/dtTQY8lxz/dR7JLG1D4Lc04Oz6k1iQKTY=;
        b=fTD0uMltPExoECKlBwf7Rmq+o1r8BVnr/K0arqbx34wj086DhuK5czpZNYg84eQehl
         rtqVLu/KGyY6I7Fuha2TRkr/WIqnFShMF/8P+vGGl64+ghh+PJOqbd7OgiGEZBhste5/
         AFgrJrjYyTHs6WQao8r2fUsjCQ7jVOc3A1HrI9JVLdMJalWKTnR+JFef5GBa8ZpMP19/
         ThXeiMUg8Qo6njLNI5jHhcK2kqhA/zjbAg2yuQbP/KUfZ9uUbJASeyJAb1PFpQGCa8Xm
         gNccNEcOQGE2nQvwdaBa02I6QqCyKTx9iSp2Bruz+0fyTKjLIdUxcnmx0hl9twEGl5VK
         FXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eGcb1DwpZ/dtTQY8lxz/dR7JLG1D4Lc04Oz6k1iQKTY=;
        b=rqNcycDxxL3WH3aIXfRp/chwWhep8oI5Vngs949X9WzvnAjkFaNCNThgBzsiWHI3zJ
         3WT1hBjQQspOw+T+PBtzYqTr/VgpnBJS9ob8AaT275jvjptCA2MDA6EeGoRQqF/Jf+nx
         CAIQYB9Qx6Yes/RHuVv5gL9MukOJVjAfFFVV6A+lGCo4gmdfqinUu4DUjTaY/T9kjnxV
         a2euJj8SYH/zBYeUhhcx4IZF9um6WUxswLJMB7zSuagBWExdLHS+LpDO1X7fx+gQpCBb
         QChucfAajYoJQgrLRucwpA7orMeJgZcvOzXPbBgLLCUmcHCN6kRQLTwvX08zfHCb+WQ6
         Tt8A==
X-Gm-Message-State: AOAM5302fUjbsD8hpcSk6Vzl+2ZwlwUk+HSrkFpAT+wExoZUZ41/yhlQ
	eo+k3yNf92Zq6JHtZNAp/KAR3s7id2sOSGt21fs=
X-Google-Smtp-Source: ABdhPJzjoEiByUMiFqwtvr0lEs8qPVvMNlMkUcXP14acHfMYzNjcCUVGC+aJrCIG7uVQ/joRt9egnQWNITRtuZMzS3Q=
X-Received: by 2002:a0c:b591:: with SMTP id g17mr2116391qve.4.1596608333718;
 Tue, 04 Aug 2020 23:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596464561.git.steve@sakoman.com> <0a664b963c116786382fbba6f3386a7105a01122.1596464561.git.steve@sakoman.com>
 <a6cd8adae83c5cbe1aabc48fc2a613bc03f93f4e.camel@linuxfoundation.org> <CA+chaQdKyvwfSnMj6G=obKiUADNyVDKm20SJbhYopmDqWrqJsQ@mail.gmail.com>
In-Reply-To: <CA+chaQdKyvwfSnMj6G=obKiUADNyVDKm20SJbhYopmDqWrqJsQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 4 Aug 2020 23:18:26 -0700
Message-ID: <CAMKF1sqFi_pHcxKSe-RGHmBHPuKLNB6E=UckNd5dj7taZKKxbw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 05/12] layer.conf: fix adwaita-icon-theme signature change problem
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 4, 2020 at 10:59 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> We did the gtk-icon-cache.bbclass backport in:
> https://git.openembedded.org/openembedded-core/commit/meta/classes/gtk-icon-cache.bbclass?h=dunfell&id=e921edd27e71af00f07e3f1e973d2b0c6c777bf4
> but this fix, is only for adwaita-icon-them and other recipes using gtk-icon-cache might need identical fix as mentioned by Khem in review of this work around in master:
> https://lists.openembedded.org/g/openembedded-core/message/140910
>
> I guess it would be better to just revert e921edd27e71af00f07e3f1e973d2b0c6c777bf4 in dunfell and find better solution for master first.
>

+1

> Cheers,
>
> On Tue, Aug 4, 2020 at 11:46 PM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Mon, 2020-08-03 at 04:26 -1000, Steve Sakoman wrote:
>> > From: Changqing Li <changqing.li@windriver.com>
>> >
>> > allarch package adwaita-icon-theme inherit both allarch and
>> > gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62
>> > [gtk-icon-cache.bbclass: add runtime dependency]
>>
>> Did we add that to dunfell? If not we don't need this fix?
>>
>> Cheers,
>>
>> Richard
>>
>>
> 

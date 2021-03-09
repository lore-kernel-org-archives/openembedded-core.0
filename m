Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.1071.1615324993478242146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 13:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p4ko4V09;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so5943939pjb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 13:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tTiYFA1REZVJfeC3l1M8OAqQj38s4Wq0odjbIB/KMh0=;
        b=p4ko4V09tDQKXImNvYV0+qay9MRzRZILqbM90nj0nq4hwlQVN8DBgZQHaGgd/562aA
         joZ/466er9quM2uowtBz9afYWxRE2/x6bAgV9DpxhJKBlAANO/Tj19DSzgJmftSLguGo
         n24dkEhS9T/TJmx/STXOVqvsoTAwKZdghSX8TjC7SBcJRrQOsavjiklhA42ZnIuOm0oT
         hMoGJ8vONVK2E5EVB4amm1Ik7BxB3JFIuED1fPk1u/i6bx3U4KuuTH/DMNf3+NsFZJVv
         zPWecmd6YdBe2gsA+9ITusRShtbjRrJJ0JTFzBRncOYHtRFSIQd/KPvPD0Vid7w8mpTb
         d6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tTiYFA1REZVJfeC3l1M8OAqQj38s4Wq0odjbIB/KMh0=;
        b=ZTT/4dvkLFc7fz6LhlH6T8oKZ+MKD0C1rucZ9SS19HvyNUQKE36wN4WOe1SzaahGd1
         BPvfZAUuBkiNMe1Lem3F17THmzyD7oxnN2GH0Y6M3wt04+j8dFbxiQPzIf/xBdjJJnZO
         40VzFkBMAqZRKZSuy8cL33DxLPe3xCxKkCX3MY36VpglTpTY5sSEh1vqcmsJpXN+Cs8K
         w45E8+9yF6YY9fBZEoYtAqwKf0ZqshSK0sFnNPGY/AZ/tKGIZZOU5tRlc6AuJM8V/jld
         hZNOU0472fJmcNYD8e4gi1e3yhz9q1AxAJ/ex58H+zRpSyOX5Hx5GS9zj8mnV6pXMiZ4
         HBQQ==
X-Gm-Message-State: AOAM533SbfWxVzsyvp5R/6IYmVOHO/nQjXehwoMEH/NEum7D8yMcJai5
	gkOlLzy9ahPKr/3Wp/fa9ipMxf8wG/PN7Fq5EJk=
X-Google-Smtp-Source: ABdhPJznagEOKrlmTItsY4AImNiWuWSccJstDV4bIqddvY9iSPXpWyvZxm7YlSbUnIMgqRkOC5fbhNXq31iGnSVxg50=
X-Received: by 2002:a17:90a:a414:: with SMTP id y20mr6604331pjp.77.1615324993000;
 Tue, 09 Mar 2021 13:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20210308235953.2230531-1-raj.khem@gmail.com> <CANNYZj-bjpj0VFu-Db-x917m07nQLaVKNuvs-=UaLd=H-=h=VQ@mail.gmail.com>
 <CAMKF1sp7iP4sT4HWWeBhEPnanaEy4cEdoPP90sGYPe22dCFu=Q@mail.gmail.com> <CANNYZj-0eTz84WfXGQP-f9uf6V4_AeAT8QiNXJziLeCm1uv3Zw@mail.gmail.com>
In-Reply-To: <CANNYZj-0eTz84WfXGQP-f9uf6V4_AeAT8QiNXJziLeCm1uv3Zw@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 9 Mar 2021 22:23:01 +0100
Message-ID: <CALbNGRQDHb12iG+nxfFjvrsbs3191u6YhO2GXEoJnAft7bJj5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Use linker options to reduce memory overhead during linking
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 9, 2021 at 1:01 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Thanks Khem, this makes sense.
>
> Alex
>
webkitgtk is one of the top swappers for my (very old) machines -
would be cool if this has an end

Andreas

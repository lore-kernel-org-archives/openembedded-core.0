Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web11.24025.1585473098727132232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 02:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tOCqsYi8;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id m15so14476291iob.5
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2020 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rjfzIcn2PkIGuxwCD2pNNuInirmz//bJfDlgBYjNIiM=;
        b=tOCqsYi8SEXnYrUZAwU01YlVggjP0rLsp13WAVRDP6Wus2PhqF48Yr9SnMVJrQc6rt
         GCKcwR4EIXDZjBCJa16znd25XF6csJqdc5OxRzsBcP5vpJaqHgAFVfOF/Jk6PilP4T01
         IUvmBt4bPgo7q/MxVj0ZUewCwPuv8bue3I2fO7AH2JWU2Nuxio3HeWBF0vasJW2tT7yw
         Vj7c7lXF3v/G3MG4sTt/5XQohInllwFTmlz7JZgDKyAjJAfSaZc2QUOwHdDv0E0Jw9gC
         35t8+KyIblMDfXFdb0WkWfuAp5ywEXMrJQvmOqwax+yczZDVOpSUWUsUIqtzJz9hdMLZ
         nRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rjfzIcn2PkIGuxwCD2pNNuInirmz//bJfDlgBYjNIiM=;
        b=kRoh2Zi7/SBo1HIXM4yeYe5ckBTL4qKIz7tBWRxo9fPvSWExXztnsdWKCKdzHYU4zw
         hddt4r7KL8A9XG5n871r2LRwi82YgQe6LhHyU1PKArnuFKkfQln/GVLZPBsCJOOUCxGo
         K2q1WFwzwmkGLxB/tWUS8v6FQU6+9uRKcgGa5tempgOJVyqyQHEv8t+5MupEL30cWSIS
         yN83Z+7VUSrGqoKIR8gb571QbmkHPtwIZ3X94nSl1kmRrMOxf6iv1oHPw5W9Wgc0rmtw
         z+lNfBncl4vKAJl+fmtAs9DATzUqN9ftNzKFxyyK9S/aTmgeg4MgQ0qxaJMghe+ACPOe
         7/qQ==
X-Gm-Message-State: ANhLgQ10zRv02ppxDcTzyUSIEDl5mP0hCqo4eDVxnsdSkvgHHG2rsKCd
	iMoAWCCLG3u5blyRRTMMPxHHJBmnOkUg1nf6LDU=
X-Google-Smtp-Source: ADFU+vuUcWe9+hPkmP/1UarN9SrBB/ig80Pn2YirBHtSdFPyqsPSMAk9syxQVuzdr60UIbopVzTC7Pr6EPFTKMU2XyQ=
X-Received: by 2002:a5d:8a10:: with SMTP id w16mr5967060iod.153.1585473098179;
 Sun, 29 Mar 2020 02:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200327172520.62888-1-alex.kiernan@gmail.com>
 <20200327172520.62888-7-alex.kiernan@gmail.com> <CAP9ODKroMUKsP3b+tpM7kYvtVUO_Om-4TB=NTSi5cSTZJJ94qA@mail.gmail.com>
In-Reply-To: <CAP9ODKroMUKsP3b+tpM7kYvtVUO_Om-4TB=NTSi5cSTZJJ94qA@mail.gmail.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Sun, 29 Mar 2020 10:11:32 +0100
Message-ID: <CAO5Uq5T-HUfNyzprixKMVJ0ejR4a8K2r1E-gqDd=Nnx=BQk4nQ@mail.gmail.com>
Subject: Re: [OE-Core][RFC PATCH v3 06/13] systemd: Add PACKAGECONFIG for sysvinit
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: "Purdie, Richard" <richard.purdie@linuxfoundation.org>, Adrian Bunk <bunk@stusta.de>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 28, 2020 at 5:17 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello Alex,
>
> On Fri, Mar 27, 2020 at 2:25 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Add sysvinit PACKAGECONFIG which disables all sysvinit handling in
> > systemd if it isn't present.
> >
> > Consolidate sysvinit handling so that when it's disabled we exclude all
> > sysvinit features.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>
> This address the comments from Adrian and I'd like to mention that
> /run/lock is not being created if sysvinit is removed from
> PACKAGECONFIG.
>
> This patch is good to go as is, if possible Alex, take a look at the
> /run/lock creation issue without sysvinit support.
>

Interestingly the poky self tests didn't pick this up and I didn't see
it building images for real hardware as I've another set of local
changes which remove the volatile log/tmp stuff, so have a tmpfiles
fragment to create anything that was missing (including /run/lock).

I suspect its relying on initscripts/volatiles to set that up - I'll pick it up.

-- 
Alex Kiernan

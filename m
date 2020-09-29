Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.557.1601400196187793944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 10:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MZV8X3Up;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.66, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f66.google.com with SMTP id j11so16195312ejk.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 10:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yeiYsBe+XmqTxtcJq9ddXefVj8qs7M9BGN6/TcbEKb4=;
        b=MZV8X3UpdI0VomDxATonMqpb6FDQjco7XyBW8eaSzAWEftIkomH6QaUA1tSJBR9Y5u
         PO/1413PFI/N6RP+g+/ZLtBd6MEKOLbVooPgrJTWiFMQu4sKLrjp8Wdt3SKRtZ7VAqDw
         Fq9Pf9tLKkCwVyrrYDMJy3SXYeHrDlmPZW3L9g2h/4o1GX+Mi0slzkf7gu3HekSVMwKx
         JEF5ZSKWKV9o9d84TT4qnqTiVoKD9MjfEIqlqNwKUu4UsQyopx4ndfUR9xz9aeCksyRW
         WEZWR2EgWkf9pH1t4hSYkqfhAZj/SJ5X66j8zzIOkcAoRsM7KW+e23TGwAlycfand4tG
         liwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yeiYsBe+XmqTxtcJq9ddXefVj8qs7M9BGN6/TcbEKb4=;
        b=t2IM+qqAXsjv0zXB7t393oClxMQjIcZ00J9k+jBHjpWRwOiEqEO/8WQ/vzpuJ/KtHq
         PO9NA/ZCZUQ356neqy/rPQFGTU/QXVyGg5kIRsuc0Xvat9Klnv9RVU6ZqqGTUB+u4MKl
         axHv+FAQXygEIVPwo2PqG4J99Vda3OH2lKF+6Wp1nSgEQ5bcqWnr9NLMu0JVXrTL3E21
         lNGSsnGIXxdlJETsqPD7h4OkEgGoQDmoccleYVL4tKhHlVkXnCZalngdR3zNp6rYMN1R
         RHkw5Lk0slUw8Ov9uNvVlEpoNFY5GcQhp2v6IbaEQHrJo+6f23vIqg9afBAkviM8KtCK
         JYvw==
X-Gm-Message-State: AOAM530LoDNQLDUQvfGuYKzSN0c+DOZ9NvOtGCOoS3g+dl5cNFh83dH5
	HABdJy5rPvaBsQcnDof2gBle4Bfd4LHlLfMMwfzSWg==
X-Google-Smtp-Source: ABdhPJw5UrobC173Yv2Pp6PTMma4BswjSw62iZ9FcBHdWMgN2S/Fi+MtCM1EAV87VdWYEowzgdu+z8SmupcF2BOJL6U=
X-Received: by 2002:a17:906:e05:: with SMTP id l5mr5130630eji.173.1601400194463;
 Tue, 29 Sep 2020 10:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
 <ced4f4ad5252bcc989f40b54341c0d7a5835bfce.1600122415.git.bruce.ashfield@gmail.com>
 <CAOSpxdYTk_t5EWiSydN9-bLPvs-JnsM8LJZgEuJw8oTNOWVitw@mail.gmail.com>
 <CADkTA4M+00ziJmy53FYH+cs302+9eGEqw--=Zc_stwQzKC0pHA@mail.gmail.com>
 <CAOSpxdYTy=PAgsQXwuk8ujGebdxB9NRqYDzykxcEkQgy8t0JPg@mail.gmail.com>
 <1638C0AFDA43827E.8201@lists.openembedded.org> <CADkTA4Oqnt_69n=1Vp2BF39Wj=ZeaY6kWVW+PP+up=xRQ24+NQ@mail.gmail.com>
 <CAOSpxdaf8i_9QZQ5GT++HAEKU7FkkpABBhGVBzsNbYJwN-jdAA@mail.gmail.com>
 <16391475BC3C80C8.17908@lists.openembedded.org> <CADkTA4M-kTQAbauvmf2tSA9F39i1F5fBKkMNsZHkc1NnxbWfiQ@mail.gmail.com>
In-Reply-To: <CADkTA4M-kTQAbauvmf2tSA9F39i1F5fBKkMNsZHkc1NnxbWfiQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 29 Sep 2020 07:23:02 -1000
Message-ID: <CAOSpxdb6eS3Xqpt4ObB2bxQ-ebqwEJZWpv50c82MaezaQv8ojg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] lttng-modules: backport patches from 2.12.x to fix 5.4.64+ and 5.8.9+ builds
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2020 at 4:55 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> Steve,
>
> Attached is the minimal backport that I was able to pull together.
> Chuck that in the queue and you can take the latest 5.4.x -stable
> updates.
>
> So it looks like we can get away without a version bump for now.
>
> It passed all my local testing, but let me know if it causes you issues.

Autobuilder test is in process, but preliminary results look good -
one of the five builds that failed before has passed with your patch.

Fingers crossed . . .

Thanks!

Steve

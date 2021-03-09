Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.14579.1615317981704163534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 11:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qr/mDrWx;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id bd6so22541686edb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 11:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B46iWrfjuoMSBXS/u5mNsNbvEKpnCMEdW7bk4odRqqk=;
        b=qr/mDrWxiu7OVvmM50Oo2HJI9GHR0yXCwfhjdbS8JSWi5htS4Xq71cICel9dmkNiDJ
         nM/vaKF+x2PT2BJzwU2+GGeKqEjklX9y8Ra/Ynu0CKRtX1kjoCb9F50KBqML2fS2p4ne
         95p2CJgJKLWX5fyJkzm2fQAEnJB8+cZITsDel22O0zzgvjdwz+tWMs6wswdX5FNZHqkU
         SGFAEgS3m2I9piX1+k34OinNDS6zXMHYJP+QVwveb4usaui76HLgwR6yifXtypPmPbgX
         mvwkckT+u6C32sArqxp2lBMhUxy0G1zp+9+UT6OI1yincSA+4PkT0xj4foIJ4tegl2HJ
         ibWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B46iWrfjuoMSBXS/u5mNsNbvEKpnCMEdW7bk4odRqqk=;
        b=UUOSWYnCzG+Rbp9oqNgYIOBP4OeqljceFSieik4mPj5N2/nM3v4UhkcI9fLC0HXMtj
         Pp7NGSQHPumDOwutB2lC3BD/fNpqIdI4YDAGwYqYPyiIq8hrQapaQcsPexN+PQVwOHbv
         d9DMMq+I22e1hUR8WAkdhgjd+y+TpEs6tEKvisWlofRmHuxKoopP9073jITCXkdDo7bF
         a6GDBLp5OxXCyD26hCMjxF+ygTk9gy1IYmj5wAxGorC/V4IJa2k96SXgqC+GdJS8o1Pw
         VVHqELXisHfACegkgf11JV9BBDf7OIu70IEoRQv0tGxxagy24uSMJ7vWZdsZZSOHkNze
         5fWA==
X-Gm-Message-State: AOAM5313LZDQwQVJ+zqjKc+WWVcaeGR6ZBkwng648uV7f+srHEM+Atqt
	l5oJMTkmYBG0sCxQiQmqKkzcOdGw5K1cDIV4w+c=
X-Google-Smtp-Source: ABdhPJwm9/bEmJXx/ez4h4J9UBXHlQzEPK74Q6aliXVRu8oUx+0BPyxCp+XxDZDifwF4he30id/lAiS74sGeaApAjaQ=
X-Received: by 2002:aa7:d547:: with SMTP id u7mr6033331edr.347.1615317980220;
 Tue, 09 Mar 2021 11:26:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1615317549.git.bruce.ashfield@gmail.com> <d30604303763138aeec2743647b93037afb046c2.1615317549.git.bruce.ashfield@gmail.com>
In-Reply-To: <d30604303763138aeec2743647b93037afb046c2.1615317549.git.bruce.ashfield@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 9 Mar 2021 14:26:09 -0500
Message-ID: <CADkTA4OpPh-bc4z0rGHY21gjsywGkXCFSRZc+74Cg6S-a96cAg@mail.gmail.com>
Subject: Re: [PATCH 2/6] reproducibile: remove perf from exclusions
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

And now on send, I see that I can't spell 'reproducible', I can send a
v2, or feel free to correct my typo.

Bruce

On Tue, Mar 9, 2021 at 2:23 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> We have fixes for perf reproducibility, so we can drop it from the
> exclusion list.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> index 0d0259477e..86cf6c5daa 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -36,7 +36,6 @@ exclude_packages = [
>         'go-',
>         'meson',
>         'ovmf-shell-efi',
> -       'perf',
>         'ruby-ri-docs'
>         ]
>
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

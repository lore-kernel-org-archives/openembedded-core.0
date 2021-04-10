Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.1561.1618033700389983233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 22:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rA6wDzkK;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id b14so13009013lfv.8
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 22:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H3+lEDxGxyWJtP/JfEnc7odUn874ODM+rV6G1fBHbXQ=;
        b=rA6wDzkKpECU/5CvAzyeVZyThvkW4qwZ1ymn/mlQQnvZGdPnRyykcpumok0BLiSCfL
         kSuXQcU6MqSKOmDUj8zXPols9jIX65Ve0dU8gD+QlfpxxfCz811oTYOWM4LDKZnqUVmX
         Scy4yv8tv0gq50bsgaF1VfXhJmMCxM5aO0H6U0RC9SOyqtMYa3CAugNSwYB59D6VokFK
         Bp8RyCxrb6z1Y/zka3Rbnvm+8hZg8PET0R9BvP765B4hsiXxS/Vau51MlkZCecOiCyF/
         MYO1JFVRIxwQNZauYNKBYvay16ggFR2IxFStgHp7iZ0Ug2mj95aLj1pbtsNDNcneF9eq
         UR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H3+lEDxGxyWJtP/JfEnc7odUn874ODM+rV6G1fBHbXQ=;
        b=a9+O5cReA1PtgWfg1KFyOamKJ4YgbiRbB0LMmwxuwBIanB7jTbhvsWBaZxv4sYEgLs
         mWlqu7o9tmtR/8CgTqUTcf4hW2MTkp2Iog+qc8wYPSD/w39s8b59JPMPjlJmE84P6/EE
         8i0FXtN0TY4OFOzwp8Gqpkz7ziu1McMk8w4VU5XJ9hftEoVox+iOOoWrAxMmzpK3HaJm
         su+uTyR3GdmbLakr9/r5MrdpPfpEwYY+wmha4nY0L/HIOCE6+C0p082XaVrtSrvBs98f
         ZhFeQRYJLX8hVRxqUyNJr/opQYlLCv2I6bjrfmC1XNeXBcQqV8SjJbe+Xo5vlHliMzg8
         Gs6Q==
X-Gm-Message-State: AOAM532lgXZEGztv5eRfrgIACkPFdvpL+0Xt7mRi8aEn1WSZSCCdC57i
	aT8v4q9dYWXImyRg4k43bFDDejdTF5PjN3i4mO4=
X-Google-Smtp-Source: ABdhPJzPy1XT+O+Ux+GIMhY/Y0qMTH8fWv1eJBOyX+zgyLYCTCLvyHGKMZROlgTz/YdHroM4Ibpp7N9XibCd1dZtGvA=
X-Received: by 2002:a05:6512:3241:: with SMTP id c1mr12873994lfr.230.1618033698376;
 Fri, 09 Apr 2021 22:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210409194841.1865548-1-raj.khem@gmail.com>
In-Reply-To: <20210409194841.1865548-1-raj.khem@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 9 Apr 2021 22:48:06 -0700
Message-ID: <CAJ86T=XfWZQ=cdaVq51i2HBa7Z_vFb393VUgbxZC1w2a80xP3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Upgrade to 10.3.0 bug-fix release
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 9, 2021 at 12:49 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Drop aarch64 backports which are already upstream
> List of bugs fixed is [1]
>
> [1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=298084&resolution=FIXED&target_milestone=10.3

It looks like you forgot to update BINV ?

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

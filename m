Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.11110.1592496317236995004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 09:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uHFqPaeW;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id i1so6240670ils.11
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ikXHSnbCYqmk0mhTBRz0eO2d8tTtH/hD14Uc/oP2csU=;
        b=uHFqPaeWXhseekFDxz3HSyxicDq87g4lO9xK48h+oDwMTZ53KOhrEJ/GzJdwKJpSZw
         gcQHIdXmA2hcTqwwxg4fNSGm5HduwugkCbCLDNRt/1FNal/19L4dd/cHCzDundqhiR1P
         QAijd8TXdbskfK89MsLdtX85w35y4dQcK0QReM2loHFfj8FA4zoVtHPZoWQ5x+YZN3ia
         Xu//3yYcTY84YgUxIdgHVugQMq7dP4ghD2BrhXKxkttBsiPbzom+8FSwEOjIT6vi3Aj6
         Jg43z83VOzZIN0nr0+0zb2D6Ebm5Vum/F6KbCyu8RIO4gubc6ACpzgKUuQw/Z4NLrT6D
         HI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ikXHSnbCYqmk0mhTBRz0eO2d8tTtH/hD14Uc/oP2csU=;
        b=n27ViY9QkmNd+DHT2vsGPky+eRsqYnsa3IU7Z0njVZZiLrdlfQMwqdV+HWMqRvDimd
         2gZEmSwwX6z5R8uOKrlUxfRNMYRf0gEhBMI0+4Dq9vceppWNXacxPOuDBwp5fgi8tabf
         S81k/tlemCxV8P8ey2pm3lQGarHe3IlsXo6crKRBOYlgfZLwhHyCafqNHAkHn4h9dAbt
         jJrkEHvxiXiG/xURZrx+BhP732K4K6EGFkxN79SrAxi1YGrSi1SXUdSZGXakxyVculOo
         xdYSgNEmLGjCMMBwzIVMVkFpBfIxlY/R7GVF8AcyQBmnQnDtLdoDNrnUcb5SR5+E0rAJ
         1QOQ==
X-Gm-Message-State: AOAM533KwEo1Ph/fTGEAqyDGuOQsesj8ulOAAMLZ338YvxzAA+biWJ1k
	W4Rz995qnFvTxGwyYI15uC58HaZZQEpMbYeCI5M=
X-Google-Smtp-Source: ABdhPJwnUw29AgHR1crPT4arDzfvbEYzLukY1Rj8LxAkdNDpPAbuwX7dh0iWZWbQNSXp+OIyoJ5mWzjOi4A99oZZE0g=
X-Received: by 2002:a92:d647:: with SMTP id x7mr4993656ilp.267.1592496316551;
 Thu, 18 Jun 2020 09:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1592492076.git.steve@sakoman.com>
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 18 Jun 2020 18:05:05 +0200
Message-ID: <CALbNGRT523YvrfmR5jDLX-rssTtkG+cjaSAmrUbr6qcCFXGL5g@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/21] Patch review - gcc 10 build support
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 18, 2020 at 5:41 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> This set of patches consists only of patches related to supporting builds
> on distros using gcc 10. All patches are cherry-picked
> from master except
The ones which caused trouble for me are included.
> for "u-boot-tools: backport patch from upstream to fix gcc 10 builds"
Did not find this one. Helped myself by cherry-picking upgrade to
2020.04 - but this is definitely the better choice.

Can't wait to see it applied - Thanks!

Andreas

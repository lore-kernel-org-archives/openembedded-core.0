Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web09.8766.1624975808078742756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 07:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cHM0z+Y/;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id m9so24582423ybo.5
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 07:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=byWTNjKHpF/NAft/s+d+UxvSVKkw/JOSrMsMAHJS+k0=;
        b=cHM0z+Y/NhEViBy6Bo64ti/UERufJHqbk5BL+8ZhxeskDO/ilpKwE8Ec441xTe0RN3
         Ww6VhAEg35/ff0hmEdcFCNbjDlTmJmaQpcYOl7JH/pHD4oMBFdIsmu8W2KxrdG+Jeuka
         aTqjAg7f4lYJLLMe89iCt/MOvsW6YzH6qHY9xWPfEH8jf9/PVOFnZBDrzjQuIm12F/T3
         MDSPFbYAghw2V04svEhzKR760Q1E8ChoRoXRdItgPqS6Q2geOiGUY7LY9wE/uQmpQ/j4
         FGbFp7LEA9XMR76xrhGnMawFxhLHjN7x6cnFJK19AgL4byUS1cs3XAVsrzN0NJqKYpZS
         wo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=byWTNjKHpF/NAft/s+d+UxvSVKkw/JOSrMsMAHJS+k0=;
        b=JJv/4kNKpk9G8rWe15ZdW2ccJv66IxEBP7d88BGJ2n/2/9UlfzqI1tIwT3RAOrhAzZ
         qWuHER4AQVOWNaRwvEACm8BGa0KKmJIZscyx5P/kByAYg+K92tBP4Ch7heq5j8lRlPAT
         oECbRMgfnT/oWl0S/BRnZx65ox7ViBjRoL/NylcJZtbnPiQnmYnbgIIEBtHjwIuBPihi
         HrHAwoOioZ0FOLKaI5N9arRROcf9RdoqfphlvGfnjAD7upYXfQzmutoJlr4E0NYKQxpc
         diEP/umKjJ67N6gft68UbWimEi+yrBtt8JHQ5yPv5qlX/LispWdQ6O0FfT1ipJ/Si2Pz
         kgkw==
X-Gm-Message-State: AOAM5333vgz2NNP6zqC8Nxo/vj+6X+56GKLaSemzpfddYIbADHhkpecY
	El8oR/iUn8juBYj4ZbRzq1EZjQtWQ4TiRTQ2Sos=
X-Google-Smtp-Source: ABdhPJzmRTrSR6kun4o+psOhM+W00w9EFrlkMz4r9z3kZ9tfrQyRAP1s+Mb76srNXOiBRRhYM8c8GJKk2NSmrnaoo0U=
X-Received: by 2002:a5b:4cc:: with SMTP id u12mr22589504ybp.126.1624975807295;
 Tue, 29 Jun 2021 07:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624892565.git.steve@sakoman.com> <12403.1624925613159233231@lists.openembedded.org>
In-Reply-To: <12403.1624925613159233231@lists.openembedded.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 29 Jun 2021 04:09:55 -1000
Message-ID: <CAGDS+nkatRLHNVLOnQPX4E5fS-6YfunN+z8DiGL_DdF4g1oByA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell 00/14] Patch review
To: Minjae Kim <flowergom@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 2:13 PM Minjae Kim <flowergom@gmail.com> wrote:

> How about this patch? I already tested on qemux86-64.
> https://lists.openembedded.org/g/openembedded-core/message/153284
> Do I need more testing?

It will be in the next set of patches.  I haven't seen any issues on
the autobuilder.

Steve

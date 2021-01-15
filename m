Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.341.1610743457824622000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 12:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B+Pxtu9L;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: jupiter.hce@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id y4so6256536ybn.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y7C90DjWgUV7XgKSXqKIispBhNGlgIgzofLCZKm+wL4=;
        b=B+Pxtu9LMBr5FDcHZbu9iPulmsuLN8wXAZJKj+izKMOlNy22GDeq9TF78IlGy4Buc0
         QN1ovMiABtBCJ5H18TgTJo54mn1ecenRbreQmCqccpzV79ZLB4ndbdwWYR1omEIYB0lK
         KxJedbeGLWMAx1se5qKNAW8aoiwLqXrqk4aplB1YeOii2KtKLc1h4ts72+TvisUKZyBF
         rPMvIlnKILWhzXSoYJud4YZ8zpYyCZnJHePDKP6FQeI/YOwkOrZoZgAe0hxVDAASQbl+
         aicNq79Knip6QtmQJ1TZ0up/SdXxqFTVbHvDo70wHqQUQT8G/HuGPYG+zpI19Y6LmquV
         Es4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y7C90DjWgUV7XgKSXqKIispBhNGlgIgzofLCZKm+wL4=;
        b=X7JXRDupH5wLxa4HQxQlQtnWaHpeImlY2F7jqd39PTBewYjVuxUXLLc4ZzsVKJAacF
         mfDa36gDekFLOICKjEGBtM82ct0ypTmqY1HegEjbmgVKeSzFA5K2AARZ/J2ST6dBOUXz
         BE+ruxLE9OPOEGPe8iRnjsCicyH/oHwktY2dTwrg/oHL+K3s0PE1d35KjO7PvU9ipuTP
         /IoUXyweX3ud9M9sz8o6zSS+6diSQFn5/n5tHHAeC1TIe+KJKsaCsk4fXfuwXLuAshZ6
         Okkylf4wKg4R7ayMEH6xE6U069uZu05OyD7gFV9KOCE3uKpazFEvphlDghVAZus8ZyOZ
         DEAA==
X-Gm-Message-State: AOAM530Mm+wWZgjrQcfpxof5ou+5WSJ6VHYCT67vyGuhtxtgxBtapvZV
	zmuKaIcAemjekbrvEnj7f4+Wv6ogWOT85ZzkgTQ=
X-Google-Smtp-Source: ABdhPJxSIW4o/cMEtrjCt+tC9HRfMLUQIrhLs/IxwWXt0tnAAmzTuDS+CKOP6Fv1kcBJ188fw3tcS9NvM2sZpddf+iI=
X-Received: by 2002:a25:c615:: with SMTP id k21mr4128615ybf.330.1610743457077;
 Fri, 15 Jan 2021 12:44:17 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWR+nsKAEH+Y9+U+3j21QtpdnBTenLdd65-yt0zpYPzX0g@mail.gmail.com>
 <CAA=hcWRXRDe6vu38PcFTc6oS+vU2DPqLRik_D3zTKiex99bX5g@mail.gmail.com> <CAHtQpK4OgZ5Qm6sFUiQavg6gd0taVUB2XiLHv8RG3q7O59B_TA@mail.gmail.com>
In-Reply-To: <CAHtQpK4OgZ5Qm6sFUiQavg6gd0taVUB2XiLHv8RG3q7O59B_TA@mail.gmail.com>
From: "JH" <jupiter.hce@gmail.com>
Date: Sat, 16 Jan 2021 07:43:40 +1100
Message-ID: <CAA=hcWR9mYsUbeCRB0eU1X56M7iM+=Twx77hQDdSbiOpOWsTXg@mail.gmail.com>
Subject: Re: [meta-freescale] MTD UBI undefined reference failed to build OE gatesgarth branch
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	meta-freescale@lists.yoctoproject.org, 
	linux-mtd <linux-mtd@lists.infradead.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="UTF-8"

Thanks for your response.

I am sorry, I thought that is what meta-freescale for, right? NXP
might involve the coding, but is it integrated and released by Yocto /
OE https://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/, right?
I cloned meta-freescale from Yocto project:
git://git.yoctoproject.org/meta-freescale, I am sorry, I really lost.

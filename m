Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web11.10389.1594311596740615268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 09:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CHBr4zzw;
 spf=pass (domain: konsulko.com, ip: 209.85.167.196, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f196.google.com with SMTP id t198so2329512oie.7
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 09:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rkAY9qNvivLxD/7aOkzgLWguixfAue+wEs9YNbp36ho=;
        b=CHBr4zzwu8qSLyVLUuz2u2K3JcAmRbDu0e/55Fm7t9CFIdSaSrew9v2E6TgZMmb7Y1
         v1KfvcXfLeKYDsJXttouqttpANUZqYeopre2MY3qmobuXN01Aw1xii9MUweLF4lWE9yn
         zdsrYn0o86fVC+/7wd/6UcShizatSsI6fuJ2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rkAY9qNvivLxD/7aOkzgLWguixfAue+wEs9YNbp36ho=;
        b=XoRF1gfuTe2uGulIqw9R5FXoDkdXSgYuuXtUkne8Iuv9waC+yuvES/o4McZrICacUs
         QahfgnLFyNE7FL4Ie30Lfoyg4aIQwp1W2F25RYUgyWTDjY1VwsZTp69D0gjY/FG8QB1f
         OfCGAYpletz+y21vyVd7tT8oOgawg29iPhIy7181dMtaedF5eenasVB4DCirvvvdqU6I
         eOW40LKcZcAveNlclVrAMMYtzJSWBqRXTH4c7H5YDE6EjZHfJr3UMjXcCfYJXn7IOkfj
         DjS+7sZJlvNct3yIzfsuXokHbGqmE4elJLSnYUAR6chKiS31lAESfFuSZkVcLHd0wvTJ
         y7tQ==
X-Gm-Message-State: AOAM532ER357dKQyF2RKM3ZrbO1sWxDQVNmadflp3woGRCMEDU5Qnbdj
	AsxcsSXvCMyF5OPfhaC0KtKLbj4rfljuoBaWYZ20Rw==
X-Google-Smtp-Source: ABdhPJySNERxjPB/vveFqbWl/q3VzDzpptTTfheL+9vBNv2m3/+XHV+kVQi3Bc8XaWUv+DjdjcOYI/1Y21cx0n+la3M=
X-Received: by 2002:aca:3043:: with SMTP id w64mr727707oiw.27.1594311596078;
 Thu, 09 Jul 2020 09:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200703114402.8850-1-fredrigu@axis.com> <20200703114402.8850-2-fredrigu@axis.com>
 <1594291329382.85415@axis.com>
In-Reply-To: <1594291329382.85415@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 9 Jul 2020 17:19:45 +0100
Message-ID: <CAM9ZRVtH5m14PHydagC1k9XnaEu=USX2oFRraGUvCh=911scxg@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] Move rpm manifest to its own subdir
To: Fredrik Gustafsson <Fredrik.Gustafsson@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2020 at 11:42, Fredrik Gustafsson
<Fredrik.Gustafsson@axis.com> wrote:
>
> Hi,
> is there something I can do to make this series move forward?
>

I guess it's waiting for at least one person to review it in detail.
It's in my backlog, I should get to it on Monday.

-- 
Paul Barker
Konsulko Group

Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.7607.1621340634627045915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 05:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Vq1J62Lr;
 spf=pass (domain: burtonini.com, ip: 209.85.128.51, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f51.google.com with SMTP id t206so5343635wmf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9wYD1VgF2JsBhDCLTeWnGnnKbaLl+ibuROdeDC+IBC0=;
        b=Vq1J62Lr/2EcxRW5ltfVZRDNZ0kw22DwUNnb/rgW7LEJEXl8ym5e1vbDWUwsbOGvpf
         7vaY+ytZo13qshCXEipp2OApjP56Pfu8pho5gQhdajO4e7QBORZITzrlWS7zjoCoeVZF
         vllS4UTXsc+x99gB1ycTphAiWLm3B+9xAfZh6iPlbi6U7LTQuU/qM0yBBr0X8wJqQiu6
         teLxfFJI/+gVUTP/IefRRdRo0M332F7Vk0VlIKPRLJkQTmLI2UPbu9+bDJCad/MKIvfr
         DZ1bjkRzRRzf1YPGM7wKv8SNUsXXNEqoyhBqEATXtJwPqahPHkp2Rvz8sgoO4B6oWxmf
         jNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9wYD1VgF2JsBhDCLTeWnGnnKbaLl+ibuROdeDC+IBC0=;
        b=L1pr5s4abUFLGhwywJ+7PpJIjWhElYNhqBwV3Gi/sUEscH1Pcr/nTc2aWEw9WHbxiE
         kYVRCv12hdUoa2C2ZmB9poWreXvYtTSOVFowyQ9rL0lfMcqvR/FRKKO+7SdcyOecHP1h
         BXee+x0bal9LTvEwQWxIn6W1nsQd4CSSApR+plp6ZnLPlGQXuFRS7Sx6ZvJ0BLUHyfBJ
         ALq8Vwjl2q1hjAnApnDn2D5UDqK3R0uOZ1l46TtzKCTZChb0CcugYdGEwZop3zi/a1Sh
         WUf7W+zH/MRWz75UIei2E49Jg7g2MBLFTdocGAFEE0vXi1O0kj4aOQt5kHKSv73IwHR2
         KTRQ==
X-Gm-Message-State: AOAM533uCZpmRTKjY/zO2kdE6wH7/sdi24lJnnqRy6TKdlArPUrPXE1V
	hgVGqyG1r6Iso2yNgNtruVaD7JjdArI36ObtHSxExA==
X-Google-Smtp-Source: ABdhPJyInX2fWIm9lT07XuHTuQSPYVvffYVtePHp4CmIpOf6OGBZklCdwGET/pKOuVMmc90rBn1CvGmrpRSl39VKy5M=
X-Received: by 2002:a05:600c:4fd0:: with SMTP id o16mr4696445wmq.137.1621340633118;
 Tue, 18 May 2021 05:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210518062446.8201-1-jacob.kroon@gmail.com> <CANNYZj8oUYaxPhBW8CsjddYPxEzqvwnCoORgebLjpkStD9pdKw@mail.gmail.com>
In-Reply-To: <CANNYZj8oUYaxPhBW8CsjddYPxEzqvwnCoORgebLjpkStD9pdKw@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 18 May 2021 13:23:42 +0100
Message-ID: <CAAnfSTtb36V82L98UcYm2SAjcvXi_VC+k7PdbE3Qt4RvzqxW0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mklibs: remove recipes and class
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 May 2021 at 10:42, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> The location of local.conf.sample* is somewhat confusing. In poky they are in meta-poky/, but in oe-core they are in meta/.
> What's the correct way to update them?

This is one of the rare times you actually need a clone of meta-poky
and openembedded-core to send the right patches.

Ross

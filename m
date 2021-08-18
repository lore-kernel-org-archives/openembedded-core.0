Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.52547.1629281290948936342
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 03:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=rv0IUvlV;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id f5so2552464wrm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FkcM44cavqcMlHgwMIcVJKPf9eUXvaQcpwl8ZIDP+3A=;
        b=rv0IUvlVEfiJRn+U5IKl1U2aUWM8zYy3MaAj4ibwjQQjrD1gY1unEbbjJmOxpfEiDh
         kF/U4+D+WF33GiL09dr2Aj4lKs3iyY29y6c2aLcNEz8MV98Ft81t/L2zQytjufAyJmRI
         Zn4Ssb8M1NKTn9i+mCGWN1XoHLoTn4nMabOJFwru1zusTAgIVAYdU/q8f9q41dt/xzsB
         ZxVbqFGGganEgpqMOzX6tdsDC1ECa/ra5ZTv/YbyXHQtH4kR29nd/E4I33zjE+NK8UWn
         WzEMDjUJg/d8l9jAeUoLN2TWvSaLsnQdKTa3dYyoW7lBOXKH8ednlT2u/BC/lUHv4wjp
         k+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FkcM44cavqcMlHgwMIcVJKPf9eUXvaQcpwl8ZIDP+3A=;
        b=poKA2tnR3RI5PA7XlL3S/P5Eok4VqjDr2stuogfs9CXYV9WZTOrtefH3Fqhbk1yAVH
         DuzmVWKPv1xS4RI6PYlGnbMYZqditm7Axa/U7+87HpTB0XsKFHdKeLshapi7TxL8U0Nx
         G9+mUeBgmomtlRHL9YU/375smfo+wLKE70dqgf0bCz/z/PWgEFfGph4h6UiiCKsi+6is
         UWK++4IlgwFC1FSO7AG5+WsAxvZwAEICOEINpHbWpP13Vu4W8W8noxJpaGLMdH2zrZZH
         eYksa6cDSrU+IRK63kNC4FZNRe6btkv4h5Ntu2NIn0VcR8aYzxPR6fXOhex9A/ojJjFI
         siKQ==
X-Gm-Message-State: AOAM532Yguip9jVLu730tGQR47HEaLgAijZViZDWnaGGMDFZvpivk98j
	jJI/eX940wFeErbQbIM53zJBRIToQ98NcuWp8QQGSqVMouu1tWcR
X-Google-Smtp-Source: ABdhPJytIHheX1GttipO/jcWG7vdEZmYvxg+FZZAiMLyF0cvvoWURPC+H5bZ41+O/HoKqzpspaU7JCHP/j2OH3l2mWY=
X-Received: by 2002:a05:6000:9:: with SMTP id h9mr9923836wrx.396.1629281289538;
 Wed, 18 Aug 2021 03:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <74a0ce8a-7158-789-2e7a-b05d7937eed5@crashcourse.ca>
In-Reply-To: <74a0ce8a-7158-789-2e7a-b05d7937eed5@crashcourse.ca>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 18 Aug 2021 11:07:58 +0100
Message-ID: <CAAnfSTunSXr2u5xjdj2-cVPFq0acHxn_SWE7hha8xXBNOYtx=g@mail.gmail.com>
Subject: Re: [OE-core] should "${D}${systemd_unitdir}/system" => "${D}${systemd_system_unitdir}"?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

No, yes.  systemd_system_unitdir is newer so it's used less.

Ross

On Wed, 18 Aug 2021 at 08:48, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   i've (so far) run across a small number of OE recipes that use the
> identifier "${D}${systemd_unitdir}/system", which appears(?) to be
> equivalent to "${D}${systemd_system_unitdir}". is there any potential
> functional difference, or should this be standardized?
>
> rday
>
> 
>

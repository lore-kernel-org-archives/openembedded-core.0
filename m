Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.14137.1601468760822992323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 05:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=iA50VanV;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id v23so1412517ljd.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7cHGf1jSy87TnV4BUTARrcGq+H3cCH8nmxHTLwyZEnc=;
        b=iA50VanVHA53V2iquqiGkqyrEeASBPfjms13pinY/LPPffTkf0izvJbBASEgc5nGAS
         i7C1NTPW5eIalSJuT8EfNJfjj0CQA8jDTm05mlVy16owZPG760IvlcKBdJz6JAiQD3qy
         15hy5BUajhJEqaXdwmXaZwb6s2NqpOjTWKefPvHMh7pqfJXeORdLDOYlpqMx09Jn7fvL
         X4zOtnuGAjhJGNNlHAZfm1YoX2pmrxSrx/lwosRNWEZzW9NLYfjGnv30D985jF8YuvTZ
         TPoDAuYMgV2PZhqenjeiFheRSwfUdUb5WzoEVbEhQDBsJi8OXOllKHvdESssXecttZrq
         ncdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7cHGf1jSy87TnV4BUTARrcGq+H3cCH8nmxHTLwyZEnc=;
        b=Mg6MnpBZh22F4Vz5OSSNXtETyoCiXVFDILFVfNGmeo8dkKieQnAojzT2bNpQ+sC3GX
         JuaQ/7WekyMYc/U/LDKhivQuWwKjGPJo6ZQrqxJ1Kn0a2b82xUrKevgsjPNQKK/ag+4m
         4MfavCiQEB28Ta/LDTp+Tif6J/1O8/6wZd295tnYQrNeK7bFEYSkdrWDgWCGVt6STNYt
         bb0Ps2ao1okfNJ4tA5thcn2b7Foh2Ntwz1diVq80aO2frxKumEK1YDm+J/xUFbyuzwbH
         ebNItVOzkuFZldIk8sKEFxzVTspS65D6bC0zeYHGKFzplfJpWR1Ao/PV7DtpyR5l6E70
         iwiw==
X-Gm-Message-State: AOAM532I4D+TQd+byibMwkdhpz4LhqJMGA1MyQGZ+e7OFLfdkXrLdVua
	M/aRFGOtkedXyn8C48+YMk2r1cdIbczK839sat8L0Q==
X-Google-Smtp-Source: ABdhPJzdx0y39FTADlTRKHs/ocZ4a9bqXJQjTTpRwwHqoIqow8ypDxvRpqxDBz35dNMHoYlRJg+ChuI7T99CqJDrrys=
X-Received: by 2002:a2e:5c89:: with SMTP id q131mr738328ljb.352.1601468758667;
 Wed, 30 Sep 2020 05:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200929221638.2114178-1-ross.burton@arm.com> <b4990a266f48396e83a13279b3c557e9d8b8d3bc.camel@linuxfoundation.org>
In-Reply-To: <b4990a266f48396e83a13279b3c557e9d8b8d3bc.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 30 Sep 2020 13:25:48 +0100
Message-ID: <CAAnfSTvp_97_cYD+We1XBNLECo=B7yubtT=neT+giJNbPOzugg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bjam-native: don't do debug builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sep 2020 at 23:21, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This isn't so simple unfortunately. If the binaries are stripped, we
> can't do the debug symbols processing, the src packages are empty and
> so on, it has knock on repercussions.

This is a native-specific recipe, so is that relevant?

Ross

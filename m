Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.5747.1603441818220853953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 01:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=dZosrHmU;
 spf=pass (domain: burtonini.com, ip: 209.85.167.42, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f42.google.com with SMTP id a7so1066688lfk.9
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uolVLnZ5ALOpr5zvBwcfu4b3plF59FEIu2ANDIT74FU=;
        b=dZosrHmUoI4BVjg7MF7kcgSkxOS6bLUmoHQC8D8B4do1K2JAm5MRVe8buapfBl2Fi1
         l0ALfuJwdQyh7INVzoqERpoCr41Jupi+OTJM9YcVdujjJ9I004coyh1uQkXzKroa9pmh
         xheLsRLpf2mC4Fbu6oAVTAA/T8CJne5vEEPEOGHR3F8G5P4K/2HvbXyHJpyaBokDNV6M
         yb4+wtT5qeDTp8n0vwoYRm2VcOCZoscWfufgMufV8cl4QAxsXA7HxSVspIwCoJCRqJ+Z
         eJX216iXUDLrNWSZusjM1s1+X9ZJnmZDsaNCcRdM9UqAKw5VGpIL15MPLprsdMhaWEsf
         ZSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uolVLnZ5ALOpr5zvBwcfu4b3plF59FEIu2ANDIT74FU=;
        b=fjq/sAnDibMyV3WYHPG8bEwq1FR958Bk5cSQzEXrGy3cP9EjofBtziJtIZqyEHBnQX
         vjNKo6Cuy3VQLdj1j0uJBL2JN+TQm6Nv7gZO+WTuiYpE7Bp7BmoNBO57iKRnAoAq81zX
         PWIVDxChQCjEDIMo55nYjH3BJLEvKx6iOhJfj1C2Ju88uXp5vpJpBrXbJSDY5FcG1eZy
         KFSDDQOS3x530RXi6C6AK7PAOouGrrBiy71TaNux7ArR2Deu7Sdq13y5msF2VSMV7miB
         paKcQsJcawzEo32jBt0e4OpsIsVfeaCKluoG8Sr47+zwTu3a/ZQCCmkgLwIQgqAN8mXZ
         uSfA==
X-Gm-Message-State: AOAM53246T4LBhr05k6fOOdLaNBuYbkYCECzeUNoG5J0PmJ/Hw5sIFUm
	ptf/+S25nO2r1fQlAasYklt4rVs9YQQ1JKihR910XQ==
X-Google-Smtp-Source: ABdhPJxv6pLYOid7U9lsljmbMmdnla0wgQKemPOS1UUa2P5SjgxUn3rFHs713NQ2y0j4bVvdkvvldX4Jta4PXS4g0JE=
X-Received: by 2002:a19:5cb:: with SMTP id 194mr363815lff.205.1603441816365;
 Fri, 23 Oct 2020 01:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201022180204.1012150-1-ross.burton@arm.com> <6e942a9a-d3ea-1640-eca7-29ae83bdadb5@gmail.com>
 <d4e57f79-42ca-b669-2044-e5006399b4fb@gmail.com>
In-Reply-To: <d4e57f79-42ca-b669-2044-e5006399b4fb@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 23 Oct 2020 09:30:05 +0100
Message-ID: <CAAnfSTttpqXTP1eqwh5mhbGqqeCTdkGbVPPW8UCRUr=XVtTk6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] gcc: mitigate the Straight-line Speculation attack
To: akuster <akuster808@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2020 at 00:04, akuster <akuster808@gmail.com> wrote:
> Am I missing the CVE keyword in the patches themselves?
>
> Shouldn't they have CVE: CVE-2020-13844 too?

Don't you hate it when someone doesn't abide by the rules they helped set?

Ross

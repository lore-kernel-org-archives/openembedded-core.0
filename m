Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.18891.1599734499833167341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 03:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=N99VJb0c;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id n25so7511984ljj.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 03:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AapQ5utbIZQLjnWtym+MEdU84RgF8dLpKdcfwol5FU4=;
        b=N99VJb0c9aqb3DQ6n9CTFcpKmceGH3uQmKF9jybLJh+YptAU5PrCTUufoIAgbpTYHS
         Qhs71k73hEIUyVVAFq84Ngc1VH0H29GD8RZJhAFv7/eWFzQJITlqnA607F7nQUqqU2n6
         VpdfjWjm+4cFtgneGhAtlc8uk1Ee9Ek0tZ2hkS1M10mw9Mvsg5hISHZkY6wwTPLxhbfc
         V/GZpJ3V4/XtByXXOVwweEc8xjC+AsLfB3EeuYsG+sC1m3s8I+s4TncFObeX3+2+v4Ro
         S2Jc2Ccs2qIh32KKhYZD30ZeiCbWsy6RP+5nT92TF5rMR0bXG860h7/sG6Ea4MNOx1Ra
         Rrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AapQ5utbIZQLjnWtym+MEdU84RgF8dLpKdcfwol5FU4=;
        b=uK4Cl4xdrsKY58rKnzFZfTW1ij4e7H2k6+R+9Wis/WYYAi/vwJQc8XC27fO6HqUenh
         7aRo/pOT64zQYVUWpvhMRDB0RVJRmVWKkZX2YS6XDgdYFHxj07I+4y5zd1Sqoy6CQbo0
         HL2+kAMdkJbZcmGtLGRCK6/EU7c+cneNRZKrkgGncJEeq4FmILqf44HloMQKGvnVAVi+
         GuuK5IjMsZt37gxSoprRPBtnFkzSSVMfLrnEuTAKCoDThTAUFOFOS8JfM/xDdusimEOi
         C2slfw1uDpf8T2wctdZb2E+oDCTvWec6Il5pHEd0r8sgJuY75sECIqD+As2277e3CDKR
         RAWA==
X-Gm-Message-State: AOAM532aaOYYquaJPIbXK8xfIMMilKJYMfSbnm4pdRPiuS0Li0rE4nW0
	fIU+6Ne1ReRWw5cMC7er+4PPi2UGrnCFh5O2tma/dg==
X-Google-Smtp-Source: ABdhPJxPIBXSZTKY2quDnJvizUBeZKR65mzyYtoOb9OsZfGrPlNO9/8ppVkK/Sg2Nsd88QfFc3Vvk07cEhIsbarhgs0=
X-Received: by 2002:a2e:b386:: with SMTP id f6mr4109180lje.186.1599734497373;
 Thu, 10 Sep 2020 03:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200910025728.3868717-1-mingli.yu@windriver.com>
In-Reply-To: <20200910025728.3868717-1-mingli.yu@windriver.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 10 Sep 2020 11:41:26 +0100
Message-ID: <CAAnfSTsTmAE5fbvTck6m9rsQGa_FebUMWmAXEvKkCfq2TWjiZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: always define unknown_lock_type
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sep 2020 at 04:03, Yu, Mingli <mingli.yu@windriver.com> wrote:
> +Upstream-Status: Submitted [qemu-devel mailing list]

https://lists.nongnu.org/archive/cgi-bin/namazu.cgi?query=unknown_lock_type&submit=Search%21&idxname=qemu-devel&max=20&result=normal&sort=score
doesn't find this patch, can you link to it please?

Ross

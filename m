Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.10414.1600165831470509987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 03:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=yM4mvNcb;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id k25so2375694ljk.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bBgtsl/y5IKyuAPHEqO6mP0zFlO+749RGogx8cDsWtE=;
        b=yM4mvNcbKAqFFEW8YQJVKtooGwAt5V9ZdVS/WMjcAJeJyn2rF82QDb2KH166Oq53l3
         MkLSaDEWdHV3pjaKiHWUaDetHMOGnS+/st5KsNQsnJtFhRsN+mh+j3LeOf8E9EEQBwY2
         CMCBPhnzd5mVVz1+QaKRdoQxUmO3x5MFOaMSBneU3X+1CDBWolmRmnfqgFJ5IWdZUSzq
         fuF7m1fmhWiqS257CdqLB3b84Xbpsvq4R76tODrHtyFS6U/404nx/VrxYp9LdIqRATAh
         KtOsH2Ouhyt7nwJmdeP6wQ4Wp8ZYwrtLkNAmXqosd7+aI+wkcKU8w6p9FOkiv8d49Rul
         UwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bBgtsl/y5IKyuAPHEqO6mP0zFlO+749RGogx8cDsWtE=;
        b=j6oi1op3tlGXDxOQYeaU79fIz4GpCyzIMGkLRp4jwcUCZBr1ks4j/8//o/JrHVcM1D
         38+PO19dicIK3w6YzVrisfGJ5ZsnxxJbYKxxX1rdcHSEJlued53B4YulajzMIfuwGqxF
         kP5AsAB8CcVmUGX6F9ZKVoBrCFAetH5MFjIoGesOWbj5oc5lOIwufxNNsUVpC1O1oyPM
         WKNo+PdVVkSgpV8F+xqBioOeCPOFyw2AH4q3ItxmrqtuOc8NtKxCwWs7npJOZYTpVmz4
         mBBdl+OD2+nh3CXeVW4W4SmzVdZ8aZEtH6hDNnoEmxRPbLcT9W+0nf9ZQj/t+95EY9t0
         limw==
X-Gm-Message-State: AOAM531U4ZHaooNkrTSDjfZNLtJ/OdArPiB6Jll7naX9o8m+rhkv2KgR
	rw23E4NRPgMi3yC72C8oHXYDziyCBOKWPTu/86drcQ==
X-Google-Smtp-Source: ABdhPJzutN2kmV9Ni49rqhJvdEhwS1Uyg7oUZBHSPs5lxS4V2bL6ETK/GOBxo4vDZZwFsj9c/KBm3XXZa/YgoWu85BQ=
X-Received: by 2002:a2e:b80a:: with SMTP id u10mr6949583ljo.22.1600165829591;
 Tue, 15 Sep 2020 03:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200912210406.3328090-1-raj.khem@gmail.com> <20200912210406.3328090-2-raj.khem@gmail.com>
In-Reply-To: <20200912210406.3328090-2-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 15 Sep 2020 11:30:18 +0100
Message-ID: <CAAnfSTvfQ=oEnN0H3R6K7NrFFpE3_qfq5PUb=ZVStF5DjGYjhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] weston: plane_add_prop() calls break musl atomic modesetting
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 12 Sep 2020 at 22:04, Khem Raj <raj.khem@gmail.com> wrote:
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/issues/158]

But that issue is closed so Rejected is a better status...

Very much a workaround.  Do you plan on debugging this?

Ross

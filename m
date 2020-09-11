Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.6157.1599824649916896208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 04:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=eaLLCoYC;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id w3so12151467ljo.5
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k4lp0J/6jZF2ws7xzBfIG8G/wBQgPLuQvQFUByanF3U=;
        b=eaLLCoYCCJgIF1Y/d3jOHQKMo0Q71tSzjOdmraA4BeNm/4a1Eb8b6vYrffKb1kOTpq
         5vBtjhytIqcm4z5zVC/Rx6dQFdRJCnDoWlpDSCN462hP1wD7Kt4zaxhWg0/CalrKdc8B
         qcvPpj+ceUDPOHFMXEzzFWVBy02S/9Fb/X1XCLZXirkYCpq/klxMnVYqXInt0OMU+RTp
         XmiVe5c0auxR9z/C1bhtEmGxCBtbZFJtuBhRrag46aVzrrbaUwH5Op6cuCRRWj/FqGcG
         orYNyfDGoLHtl6uZe9Htmu/SV3rqnn3vnFRbwoMTgpjCaRSvf5ht5z7I0ueFLF+f59ZP
         OmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k4lp0J/6jZF2ws7xzBfIG8G/wBQgPLuQvQFUByanF3U=;
        b=WXnGK/iudLBGFS93rzw38URzsqyoIJywk8N+nYN7/MMAhg0pEFF4j7mznP3+sO6jVR
         05dsr6et6dNWzCzXV31a9ZbYKShuzhmcd7U++kHaDQnKn+zWXKSaeWza6bGA2FuuKI0H
         MMsCfQEyBmsoRCWE2o5ecU0Z8/YXLZDgUjJ4TWN4qq5INerqawPiU6ejB2zB2Uzib1cq
         7b4M2zYuxv4lP+umT4DNRmVr2jenpINzP10TjfoLULoU5YsGyd9KvkFeIbXy/bBIF/Cy
         V5bjPtrqo4BI8JQqcCNMTes5icVwr8m1b/69bHAVBAykxG/WdRGpmTX+d/inWRnMkrw9
         H/5w==
X-Gm-Message-State: AOAM533yRMsPUwKQaWrPdtsT2mzOBEoeLqOj2h5buZpCUzi/y/AcX4nC
	5ohzFvDJIeGepu2MVdTMfs8h+ZdmxvsdssXc28pMrQ==
X-Google-Smtp-Source: ABdhPJzR2DMErz7PXJUzlDZ/YWSrlirCk83y6Kw1DSQjcyVFghX04Yt8ZTF/FNRxegtAkkpge8WVDpEsBNuLS0fnVMc=
X-Received: by 2002:a2e:b80a:: with SMTP id u10mr755441ljo.22.1599824647649;
 Fri, 11 Sep 2020 04:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200910205354.900504-1-ross.burton@arm.com> <8d9b72ddf28d2ddf4bc0d0744b69e5690fd75b98.camel@intel.com>
In-Reply-To: <8d9b72ddf28d2ddf4bc0d0744b69e5690fd75b98.camel@intel.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 11 Sep 2020 12:43:56 +0100
Message-ID: <CAAnfSTuKWqRh3B=BVi3MedTRExtOuzW=g3m3yjvYZwMEUv2mVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: remove config.cache
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sep 2020 at 01:38, Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Thu, 2020-09-10 at 21:53 +0100, Ross Burton wrote:
> > From: Ross Burton <ross.burton@intel.com>
>
> You forgot to update your email somewhere? :)

It's a patch from some time ago, forgot to change the ownership. :(

Ross

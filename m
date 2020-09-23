Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.1791.1600897246269272521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 14:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=pnZck+qw;
 spf=pass (domain: burtonini.com, ip: 209.85.167.47, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f47.google.com with SMTP id y17so1514161lfa.8
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 14:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=40On7UWk4P8APbqEokoRUKHLqcrQm1rPTZVscjh5Ynk=;
        b=pnZck+qwdXHE11ZR4aqRAgVdw/16q7b+amMzyMEMkT6f00qEnzmAsl7cd5g+N6dqVD
         QDkGDW28QcfzEBqdR1JjRSwwqXqMKWi/cso6w3LkDKzPVx47ECE+2LQbmbNm93/9iqCb
         fgVaABqUQxOjIihJZY6mvvgDvAXM9KJl96gMJijPqj3Xc8sU6VyC3Qd/ygD8aVxVfRB8
         cUf1pyoJY/x8MuWcVcSPlaH+F4w7kpTMXg03IlFzaNJgaxDmTAK4IKOYm6BBltjIU4g+
         1pH5IILyKtD8QgmgNhhmsYbKQ4LkL3Ti6fdhOazUJ4PAwDY/9EMMQFJkkoGU2kmMoIzh
         MiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=40On7UWk4P8APbqEokoRUKHLqcrQm1rPTZVscjh5Ynk=;
        b=JXhXtw1t0COok+1gSrca0WBLIEy5/cNQ8wy8J2hdrnj0Zdvs2O+7XGa97TVWZ3fAO9
         NJczLYd0snLW+pSouRpUDCOwdf5fJ13Le2ZQ+zsxpBD7IF9Hc6TjHM+5jUOKMbBElIAK
         F6pUl5e1golkwK9tHZPws4gvX9wwVXZxAFDiiszDj5RcxgXD8JrJa1WfIDyKCLVkd/5r
         aHe0+gRh61Mds+LEpf0N5yUKHA1dRVCMPW2K4b5qWPbSqDDSkSOBSmnmRWeeMspCKbo1
         LON0IaSHSd8xYovCIeaWLNqfuXvnS6ZNen62oeTnPNRErDdA6RjFh1St7CaWhDoKGqF8
         X1Tg==
X-Gm-Message-State: AOAM531rjJF5CVCrXDMCqZtstOZ9wnkBuh1PaJgPbKbEDeakIbpv4/gw
	THZ+z5d3CNNkVDHcUDnHeinsWmZdbj4Kgrp7Mbsauw==
X-Google-Smtp-Source: ABdhPJw5jexinUMT5BBKqOCiGFImXoAUIhcGOJpVmxxMYXm0QtwoKanwSDe6HEr9hyqlPHnxDFQch55m+qwTPkCodTI=
X-Received: by 2002:a19:c8c6:: with SMTP id y189mr548575lff.125.1600897244071;
 Wed, 23 Sep 2020 14:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <711dd8de-1ea7-e3cd-d606-5f69faa7c8a3@linux.intel.com>
In-Reply-To: <711dd8de-1ea7-e3cd-d606-5f69faa7c8a3@linux.intel.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 23 Sep 2020 22:40:33 +0100
Message-ID: <CAAnfSTsTXqEXVcoL+bdCU8wyRRSs_XL2HqQ0jiMCLrRNPOWEdg@mail.gmail.com>
Subject: Re: [OE-core] RFC: Upgrading rt-tests requires numactl
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Sep 2020 at 18:23, Randy Witt <randy.e.witt@linux.intel.com> wrote:
> Another issue is that ARM is removed from COMPATIBLE_HOST in
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/numactl/numactl_git.bb?h=master#n27.
> This may be for legacy reasons, but libnuma can be installed on most
> distributions running on an ARM host. Regardless, it would need to be changed to
> allow for rt-tests on ARM.

Yeah, that's probably very old.

$ lscpu
Architecture:                    aarch64
CPU op-mode(s):                  64-bit
Byte Order:                      Little Endian
CPU(s):                          256
On-line CPU(s) list:             0-255
Thread(s) per core:              4
Core(s) per socket:              32
Socket(s):                       2
NUMA node(s):                    2

The recipe has done that since it was added, so I'd call this
historical and just delete it.

Ross

Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.11508.1609954074072132494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 09:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NNaSKKHZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id w1so5987331ejf.11
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Jan 2021 09:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=LBYBHs5CnDG0YqZPY1gGKRKd111ZuhJa1ri3d9fEavw=;
        b=NNaSKKHZc1iLcIU9VOAArSWFqi8W/8CxQIBIrLh5noaeKxQ6PEaawwvJj7h9Yz2m4z
         JaKLgAwyisBXW0KAr3aztDgfcM5i93iezd/vvcxnMBYF3c5dAjNBNv6TthLa0r+TRR3t
         YH+BiXKtKbBNVyznwmasjvM1sdG3SZXF22GM/SWiv2O/vdh4vxtzIIp/V+cBNctLKPfu
         9bMQAwkPtRpurdECYaYdXoBUrR0L3JGIs4GbXoHYsIUIxRW5IEU2x3UaXvS7H04qMZyJ
         bBlnG9KeiZJtikITxHeUIfd+bpT7LPyO3XAKuKdhzGZZDcbewTHezePTwqwgar7rsHEL
         pbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=LBYBHs5CnDG0YqZPY1gGKRKd111ZuhJa1ri3d9fEavw=;
        b=rzL9Pu50Y2ZgZpQshiQtY1sNtwPBdc1dpYxiaW8uPSPTJxP2buyj6TNgzNVNakmoBb
         knecCgERUQJbyTyd69ObhCFI9zbnPwkIQdyZyqXTHuO3MLgd6fmRpARJQLK1StEhkMDB
         QLGRbkmIwljDVN1xEBlKn+dxCBw/n6M4MuK6mukdTKMnAEKqs2xuUHMIWg895CAMaCmI
         S7mv5btg0DlEXtsWAJGzs8DbwNNZzn2GLGNARPsvuVxHIyaHYwny6cylPwRX/r7DGa8d
         9PdEdgCTrFUBQfsd6XKlPd6KPGqC0QcbuiKJDsJPS4QbfYHnZh9pJ0JYmFjwLcAxaia/
         G9vA==
X-Gm-Message-State: AOAM530aaJ7PNfso4iP5/cEr7UEurDY+2zay8SP3MlyFp9qZSiBSrBsJ
	+5SNsd2C9y5aZwybsEZCEgg0btWZJX6C6nyCg03QecnhHi7YPPBghtY=
X-Google-Smtp-Source: ABdhPJySHukmZqFYdiZq4GUGd+196/0EvMQWBeMYEUgv8mtxHW4/JMTVZgxX1+rr8rnLVgLm2BkvAiLMFMWw5Tvy8Ms=
X-Received: by 2002:a17:906:c45:: with SMTP id t5mr3508555ejf.370.1609954072118;
 Wed, 06 Jan 2021 09:27:52 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdZ8PdqOkiGqvhFRmQMH814kMj0RRC5shpZDP4yHoJOsYQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZ8PdqOkiGqvhFRmQMH814kMj0RRC5shpZDP4yHoJOsYQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 6 Jan 2021 07:27:41 -1000
Message-ID: <CAOSpxda4WpQRkgWQF3QVrB6+8Z=9d1CXFszHZYj86+aq4AqAAQ@mail.gmail.com>
Subject: Re: Dunfell CVE reduction fun: December raffle -- Winner announcement!
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Robert Joslyn <robert.joslyn@redrectangle.org>
Content-Type: text/plain; charset="UTF-8"

The winner was selected live on the #yocto irc channel this morning:

(07:10:59 AM) sakoman: **** Time to select the CVE raffle winner ****
(07:11:38 AM) sakoman: Looks like there are 50 entries:
(07:11:42 AM) sakoman: steve@octo:~/Desktop$ wc -l cve-raffle-sorted-nodups
(07:11:42 AM) sakoman: 50 cve-raffle-sorted-nodups
(07:12:04 AM) sakoman: And the winner by random selection is:
(07:12:21 AM) sakoman: steve@octo:~/Desktop$ shuf -n 1 cve-raffle-sorted-nodups
(07:12:21 AM) sakoman: CVE-2020-1971: Robert Joslyn
<robert.joslyn@redrectangle.org>

Congrats Robert! And thanks for helping reduce the number of CVEs.
Please contact me off list with your shipping address and choice of
coffee or tea.

Thanks to all who participated, I really appreciate the help!

Steve

On Mon, Nov 30, 2020 at 7:12 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> We've been making good progress on reducing the number of issues
> reported by the CVE checker.  We went from 202 on August 16 to 59 on
> November 29.
>
> Some of these reductions have come from sending in corrections to the
> CVE database where there were errors in version matching, and others
> have come from backported fixes or whitelisting..  Many thanks to all
> who have helped!
>
> To encourage more folks to contribute to this effort I'm going to be
> holding a raffle during the month of December.  You'll get one entry
> for each CVE fix patch that I merge into dunfell.  And a database
> update that results in a reduction in dunell reported issues will also
> get you an entry.
>
> The prize?  A bag of fresh roasted whole bean coffee from my small
> coffee orchard here on the Big Island of Hawaii.  If the winner isn't
> a coffee drinker I'll try to get some locally grown tea as a
> substitute prize.
>
> The fine print:
>
> 1. Patches and database update requests must be submitted during the
> month of December to receive a raffle entry.
>
> 2. CVE patch submissions should follow the guidelines in the "Patch
> name convention and commit message" section of
> https://wiki.yoctoproject.org/wiki/Security
>
> 3. If the patch also applies to master please send the patch for
> master and note that it should be backported to dunfell/gatesgarth as
> appropriate.  I'll pull this type of patch into dunfell only after it
> hits master.
>
> 4. CVE database update requests should be sent to:
> cpe_dictionary@nist.gov  You should note the CVE number and provide
> supporting links for why you think an update is appropriate. When you
> receive a "Thank you for bringing this to our attention. We appreciate
> community input" response please forward a copy to me.  I'll add your
> raffle entry to the pool when the database is updated and the dunfell
> cve count reduced.
>
> 5. To help avoid people working on the same CVE's I'll start a "CVE
> raffle: collision avoidance" thread on this list.  Just do a quick
> reply noting which CVE you plan to work on.  Please don't claim one
> unless you really intend to follow through!
>
> Steve

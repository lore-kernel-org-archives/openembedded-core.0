Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.63015.1606756357612938960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 09:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ROgWKqSb;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id qw4so13108233ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 09:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=5rUT0eo67xqw2Kqfm/08BL2UmssNRNtPIGYFRLWdnfE=;
        b=ROgWKqSbu5btY/AnsLQdLvumXlG6CMYF2eb3Swvg/ltzt1ynIrvikArlP0tA1AxcGC
         iaI/04T5A6IWIvhgjv7I9kIXeJwyt5Kc/JF7rp0GWczUbo1LHVSrzGIz+gD7TXFBWMkM
         +lP9dDznXTuw4JrmYBXIzrjxmv5HS76Y++EeBMPScSsK//u0yyQSUPSkP0QRtYik5Ne/
         ULTIFdFWXJvBu9gjN15G9sDBlImGFhlSpDPDL3Qz2BAKnVy3ybpUwFZb9+oRYpOzOR6U
         yXHN/CwMGcBKxUh1OeHsWC6zf0uD+g9dyQHugWjFzm6L5LFP40VUqtJCNy0UN6kfLx9n
         ikKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=5rUT0eo67xqw2Kqfm/08BL2UmssNRNtPIGYFRLWdnfE=;
        b=UtKwJoIVccdhuDR0YCzFDTB2VvL+l7peP6sHlOBN0XVdN4kemAHfHOjspuCgJVxB5C
         gdgE2wZ886JfrEJahKAntkyqQDML65zllZmZI8facFuCEKpCydur+IUcum3EPsus4nHr
         T9w8f1Dy2GqosF9HKY27nJQnPiSic/MuFGv+NYOKuUdZ6nBIc3JOixXJY0IbDaYnbcA8
         BECxU1g6qEU4MiKk7Tcv73cc9QtifETOKZngej6mfn+Zrob17+errjbDNmayBGCFlbfM
         bri50eqC9z+BqGh2qTrvzX2IgtkuWmXWBZlcz7EJBSy+8NFuvZvYULZS4GzCwTMeNq61
         r3Kg==
X-Gm-Message-State: AOAM533ytZzGWxjbwZ09beIbkpkSU8F9qO3wQ3UPt6mUpEE617aq+aZa
	1qHE/KRkxLzkIZeyKKV2x4O5e5He44PZ+j/61MSOZkpqMMzjQTy6
X-Google-Smtp-Source: ABdhPJyDPGH05k5f9dtUQS2JwRzNKVKsTS6I+32zncOAMgUIQLEme7Gx9x9+jJsDNSvJkWhsehykksfhaxjiOAWQeAg=
X-Received: by 2002:a17:906:4e52:: with SMTP id g18mr20885674ejw.385.1606756355441;
 Mon, 30 Nov 2020 09:12:35 -0800 (PST)
MIME-Version: 1.0
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 30 Nov 2020 07:12:24 -1000
Message-ID: <CAOSpxdZ8PdqOkiGqvhFRmQMH814kMj0RRC5shpZDP4yHoJOsYQ@mail.gmail.com>
Subject: Dunfell CVE reduction fun: December raffle
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

We've been making good progress on reducing the number of issues
reported by the CVE checker.  We went from 202 on August 16 to 59 on
November 29.

Some of these reductions have come from sending in corrections to the
CVE database where there were errors in version matching, and others
have come from backported fixes or whitelisting..  Many thanks to all
who have helped!

To encourage more folks to contribute to this effort I'm going to be
holding a raffle during the month of December.  You'll get one entry
for each CVE fix patch that I merge into dunfell.  And a database
update that results in a reduction in dunell reported issues will also
get you an entry.

The prize?  A bag of fresh roasted whole bean coffee from my small
coffee orchard here on the Big Island of Hawaii.  If the winner isn't
a coffee drinker I'll try to get some locally grown tea as a
substitute prize.

The fine print:

1. Patches and database update requests must be submitted during the
month of December to receive a raffle entry.

2. CVE patch submissions should follow the guidelines in the "Patch
name convention and commit message" section of
https://wiki.yoctoproject.org/wiki/Security

3. If the patch also applies to master please send the patch for
master and note that it should be backported to dunfell/gatesgarth as
appropriate.  I'll pull this type of patch into dunfell only after it
hits master.

4. CVE database update requests should be sent to:
cpe_dictionary@nist.gov  You should note the CVE number and provide
supporting links for why you think an update is appropriate. When you
receive a "Thank you for bringing this to our attention. We appreciate
community input" response please forward a copy to me.  I'll add your
raffle entry to the pool when the database is updated and the dunfell
cve count reduced.

5. To help avoid people working on the same CVE's I'll start a "CVE
raffle: collision avoidance" thread on this list.  Just do a quick
reply noting which CVE you plan to work on.  Please don't claim one
unless you really intend to follow through!

Steve

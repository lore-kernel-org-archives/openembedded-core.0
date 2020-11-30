Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.257.1606757559179928494
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 09:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZnS6WAIy;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id f9so21120881ejw.4
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b/jWR5Mx5EmBGxnV2y2fku9QqiIISweWivMFEJVQ3Uk=;
        b=ZnS6WAIy+47YbaUh7HYpdiwA9/yRzCk4IRxnD9GM63c1vOBE7cbqRKVTIfV8QZ8VGI
         yepzi06O4ZW0v++ReILYQrDzX2VB1uTlp4nEbJ5SKO1JlhfRHZTopY5tN9jbvtfShqmB
         gbNvH35DVKTKEfbFpRJBf1aZtnhtH7RBVQeNhqzFmQwLEwMIAdkn2/MLSB57/m/wnAvI
         yj6wmdI7q3JK+4kRKhp0OHFsvveraVSkDJ65eY/+up6npWc6QrNeNESRYsVUsq/b+4wc
         4C+opjuBa/GxHoaYul70ZVnnTYxAQOKkAQQEzrnF0Y6NlG2GXb40OxKdIs/ftG8K3NWO
         5dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b/jWR5Mx5EmBGxnV2y2fku9QqiIISweWivMFEJVQ3Uk=;
        b=NS6URuxp1zyZPzud0S+zaKygRQU8WWIn/Be35YV5eTVueyQ0rKjqgSf0nho+jlEaBh
         XcZHubL8YSg+woy+IQ5hkrD7rsCRek1BDA3hh5gbDuxAvpCEqHfDLPayA3Dru5mDyQnf
         fy1XV8BbXJQXDne31Kpqmm0FCGwcMJDAq8ji8V8/NhQuHNloxxJuQ12Hvv5crL93vpog
         hTGjxjpAN1Y/fOigRm9TM1VMdm1/Vhis1HtGWyiFDmxQwRk+wpMPLc3GudBg1004pglm
         2IE7sm/eYZzCR+QTqnFbdkTNR46sF9E8KSaaY82HlRlAGasmFOPTpmiU2K+YAL7BsZ9n
         eKAA==
X-Gm-Message-State: AOAM530MX8KnhN7nvbXtg3Av8G0WkwVeem4oH8YmjZV02gO6Vt4dVS/W
	+2dqqxCbBFbAcDvg7zkoU/lXA3RnPyHK9xhVQ5Y59EEBbfy0/rq8
X-Google-Smtp-Source: ABdhPJxBo3p6rvHGMYLjUhyZ0WCYoYWhiJOmyIAFzpyWk5+A3ixBskWP68pkoG6eaLAGDa8Ud+VFZPldDFziFqzrXBE=
X-Received: by 2002:a17:906:4488:: with SMTP id y8mr10577196ejo.370.1606757557482;
 Mon, 30 Nov 2020 09:32:37 -0800 (PST)
MIME-Version: 1.0
References: <164C58651BCA0D99.29556@lists.openembedded.org>
In-Reply-To: <164C58651BCA0D99.29556@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 30 Nov 2020 07:32:26 -1000
Message-ID: <CAOSpxdZKPHREE6USWeJhDqSDtzzQA4JXVoEEYK_Pj8myLaS7gg@mail.gmail.com>
Subject: Re: [OE-core] Dunfell CVE reduction fun: December raffle
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I neglected to mention that I post a list of outstanding CVE's to
openembedded-core@lists.openembedded.org every Sunday.  You can browse
that email to select CVEs to work on.

Steve

On Mon, Nov 30, 2020 at 7:12 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
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
>
> 
>

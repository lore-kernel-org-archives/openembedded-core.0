Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.22551.1620586614024520333
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 11:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dm0Ezqu9;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.43, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f43.google.com with SMTP id x5so14298386wrv.13
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 11:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v3oTWcalWWVzWJXJ+5c4fovv6o2jNxfVZty4wmqw9bA=;
        b=dm0Ezqu9L9fSzlNeoTt11lvBNAisChgJYLY2THV6Czv8aPihCqF0fg8Zb+7+avN+m7
         4Gu2qApbt4xsBn2+G45hQnT91975DJp/PUgFvXKtDQU23Lf477Kh3BwvsNu+sWI6nnu3
         FWsP8U9acMu+aGjJoM3P7vSkg4rEPuvUWrISNAIemz/Vu7g1AVC/3eZqhxztVu6EDRq4
         nVrpbox19MGnVgdlTTnxD87mQoDUlM+r01VAbgFZnFR6zJBKS+WCSItXcjMHhyPCjFFS
         POSpavAEf2L49vCvxBiNjWQt6MmovRIF0wFird9ZQVuW/vmTuhQf/wZz/6q5rZf7gw3/
         Ty+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v3oTWcalWWVzWJXJ+5c4fovv6o2jNxfVZty4wmqw9bA=;
        b=FLZ5ijQCvHVAhZTi3pb4WiVXxrtA0pMuud7oE9b9G2vT768hFTQN3ZgSs+wCF4QmOX
         /KPGNVi4MzctP6k1DEUC8H/EK1pRE+47GHqoujTNkLTneuTqEKaF/fPg95yk6Je+NAmL
         YaABuQhWZQq3rQz0n/MLHIXAZHPfw1xM7SWgFDACsY72VUAymcmvc6d2TymXMY8kqNeL
         4oHPBhq3ROdbBgkAOX3nHFhNSMowfBpWXTrgCUcpV4uUG1MiYS7UmNVvw1OYcxy8umF1
         FChFEQCBoDEXKq2iZfxrUXBu78mHfyKHtOG5tJtCO2LA1o3r3E2v/W5TKZtLiwFpbZnL
         q2KA==
X-Gm-Message-State: AOAM5315qsGBA0NzYhc5v7XoB91HFXutXrZnMuO8YfszIPuAJ/ioH5w0
	on6DX9T+jwNiq9vcBBp8mpOAqO+tLZM19bgciVh9wQ==
X-Google-Smtp-Source: ABdhPJwtzsSQ1m+TjyJyQ6blhe6hQdb7VaQl/P4MMfJCX7L/wL/ytog9C+u1kKm1b+E0q36pBlQwyZdx3nI4mtc5Sqc=
X-Received: by 2002:a05:6000:186f:: with SMTP id d15mr26490337wri.400.1620586612434;
 Sun, 09 May 2021 11:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210506171232.2832063-1-steve@sakoman.com> <6a7e59c6-594e-b2c1-9d71-d9976fab4b70@gmail.com>
In-Reply-To: <6a7e59c6-594e-b2c1-9d71-d9976fab4b70@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sun, 9 May 2021 08:56:40 -1000
Message-ID: <CAOSpxdbBXT7gDYHPP47Er6pArh3ZPUhmPXcpKKQTYfyKLde12Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 9, 2021 at 8:17 AM akuster808 <akuster808@gmail.com> wrote:
> On 5/6/21 10:12 AM, Steve Sakoman wrote:
> > The preferred methods for CVE resolution are:
> >
> > 1. Version upgrades where possible
> > 2. Patches where not possible
> > 3. Database updates where version info is incorrect
> > 4. Exclusion from checking where it is determined that the CVE
> >    does not apply to our environment

> I do see the desire of doing this as it is one file to maintain if there
> are multiple packages being updated at once.

No, that isn't the intent of this at all!  The above four methods are still
the desired method to deal with CVE's on a per recipe basis, even if
a CVE applies to multiple packages (quite rare).

> This does highlight a few
> things to me:
>
> 1) We have been dealing with this on a per-recipe basis. This is a shift
> from that. ( Does this need to be documented)

As I stated above, this is not the intent.

> 2) Recipe Maintainers aren't engage in this area of activity as we had
> original hoped. So we are working around that.

True, they haven't. But, no, working around lack of engagement is not the
intent!  See my last two paragraphs in the original patch for my intent.

> Reporting a false positive is better than masking an actual issue IMHO.

I agree completely, and this is why this mechanism is optional.

> So what was the Policy used to decide on what can be put into this file?
> Did I miss that conversion ? Is it documented anywhere?

See the next two paragraphs from the original patch.  If you have some
suggestions on how to better explain that this file is for ancient/intractable
CVE's I would be happy to update the wording so there is no confusion!

Same goes for the leading comment in the include file.  Suggestions for
revisions to the wording are welcome!

> > In some cases none of these methods are possible. For example the
> > CVE may be decades old with no apparent resolution, and with broken
> > links that make further research impractical.
> >
> > This patch creates a mechanism for users to remove this type of
> > CVE from the cve-check results via an optional include file.
> >
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  .../distro/include/cve-extra-exclusions.inc    | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc
> >
> > diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> > new file mode 100644
> > index 0000000000..956b3a9a3c
> > --- /dev/null
> > +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> > @@ -0,0 +1,18 @@
> > +# This file contains a list of CVE's where resolution has proven to be impractical.
> > +# It contains all the information we are aware of about an issue and analysis about
> > +# why we believe it can't be fixed/handled. Additional information is welcome through
> > +# patches to the file.
> > +#
> > +# Include this file in your local.conf or distro.conf to exclude these CVE's
> > +# from the cve-check results
> > +
> > +# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
> > +# CVE is more than 20 years old with no resolution evident
> > +# broken links in CVE database references make resolution impractical
> > +CVE_CHECK_WHITELIST += "CVE-2000-0006"
> > +
> > +# groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
> > +# CVE is more than 20 years old with no resolution evident
> > +# broken links in CVE database references make resolution impractical
> > +CVE_CHECK_WHITELIST += "CVE-2000-0803"
> > +
> >
> > 
> >
>
>

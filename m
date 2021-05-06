Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.10068.1620310451603272309
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 07:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=agrBbY8y;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.52, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f52.google.com with SMTP id m9so5812064wrx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WOVLehq8SXc95WPVRPKFUJXLQjMssXsy7u8q6dEAeQA=;
        b=agrBbY8y0j51VeWcvd1WBuqJZISzcTpS9RCs3xtKE7fMkGRChEEL3Yq4nwhgKD/jyx
         OtRteRJzVlycfr5IbYInENS1YxPQZqynIQ+oqr4t9hmgtkJ9FdSTwS7NQry0BLifyb0I
         03YJGS1qXfihezyNxp+Xj9q01Pl0tNU7hVJNjSoXzA+elS3mJw+d02FwJ4DfbyJ178+D
         L2pSAK0QA5+mgf0sHG4wB6EqxcUOlXRHPsMdK6cScpT6oqJ12vQ7nvoAZNFtGAN3vHQH
         iSpMrn9WEWi7nTPeCyG2+0fitBSdzYBKAyYylXfz41N7fs+LsL1aKqNxejDkr5cLoIan
         gfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WOVLehq8SXc95WPVRPKFUJXLQjMssXsy7u8q6dEAeQA=;
        b=odc+3AIYBcLjDjFP380DPzkdkTyywGqEfQ3B2TG2eT1AoYLabJ/ZVVqXK4ZgU4oMcR
         QlXp2hkmBOpsp7yH5tBrUV4Ue00+oQw299n7UI30szykoJOcOMnPebW21Z9x3KtQqqSW
         QO2XNgoL7WEe4P3cNzBPVb8dqezCMDPryCioffXrmKrJE/dHDIRf45lDtvAkU5EFsdxd
         5zmS4bIaJChpPwTp7etVVxuX/wmRB18PBB1e41h96bqyatWDJkIzZ9ZbWr2LpfYwoYrv
         +ir94LUOmBG1BnglblbC101XYbehhmiiSLywWwiyJXU+zGw+JKVHQ2xXkIc2SPOG1wL4
         fyxw==
X-Gm-Message-State: AOAM531Lk5ed5ZLeYa+xukAyW6qxR9LqLEHmApBHUJMOP9mD3SqMSLVh
	fPLWlfWw/yalSV8PTjcZpgk6oTQvFiPBm38UGIKC9w==
X-Google-Smtp-Source: ABdhPJzosFmBbxRx5ue61e0xJI74iJ6HFqu4tB/tZJLjwYmbzgy5IpBCjfz4YvJHeYwbTbj18Wo9ieRynpkXLo3GJz4=
X-Received: by 2002:adf:e412:: with SMTP id g18mr5494114wrm.205.1620310449984;
 Thu, 06 May 2021 07:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <DB6PR0102MB26302BA4C54F13FC351F8C0A885E9@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
 <CAGDS+nk51u31+-NR2k1u-y375RL0TyCEkm9L=7Va7eQcuRQwCA@mail.gmail.com>
 <CAGDS+nkq70RdM5SRVTabnsY5i4aB-VuDeeFraA9kyc=1HoCREw@mail.gmail.com> <DB6PR0102MB26301A3BB6E92C6EAFE8200788599@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
In-Reply-To: <DB6PR0102MB26301A3BB6E92C6EAFE8200788599@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 6 May 2021 04:13:58 -1000
Message-ID: <CAOSpxdZwJ5t0P1cB+6jx0+9bcMgrg8Lc7M=f7Ghth8d_wF8smw@mail.gmail.com>
Subject: Re: [OE-core] Unihash warning building kernels in Yocto 3.1.7
To: diego.santacruz@spinetix.com
Cc: Steve Sakoman <sakoman@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Mark Hatle <mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 4, 2021 at 10:17 PM Diego Santa Cruz via
lists.openembedded.org
<diego.santacruz=spinetix.com@lists.openembedded.org> wrote:

> Any news on this one? I have been doing our own builds with the equivalent of that patch for our BSPs with a linux-intel derived kernel recipe plus another internal kernel recipe (both using kernel.bbclass) and I have not found any issues with it.

This is in the group of patches I am currently testing.  So far it looks good.

Steve

> > -----Original Message-----
> > From: Steve Sakoman <sakoman@gmail.com>
> > Sent: 30 April 2021 20:46
> > To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> > Cc: openembedded-core@lists.openembedded.org; Mark Hatle
> > <mark.hatle@kernel.crashing.org>
> > Subject: Re: [OE-core] Unihash warning building kernels in Yocto 3.1.7
> >
> > Trying again with Mark's correct email address!
> >
> > On Fri, Apr 30, 2021 at 8:43 AM Steve Sakoman <sakoman@gmail.com>
> > wrote:
> > >
> > > On Fri, Apr 30, 2021 at 7:00 AM Diego Santa Cruz via
> > > lists.openembedded.org
> > > <diego.santacruz=spinetix.com@lists.openembedded.org> wrote:
> > > >
> > > > Hello,
> > > >
> > > >
> > > >
> > > > I just updated to Yocto 3.1.7 (from 3.1.5) and I got the following warning
> > while building a kernel recipe.
> > > >
> > > >
> > > >
> > > >   do_install: Task do_install requested do_package unihash, but it was not
> > available
> > > >
> > > >
> > > >
> > > > I tracked this down to OE-Core commit
> > 0c28edf4bf0d2f92bf3a47406041c63acd90bacf ("package.bbclass: hash
> > equivalency and pr service") and it makes sense since do_package runs after
> > do_install and in dunfell we can find the following in kernel.bbclass
> > > >
> > > >
> > > >
> > > >   do_install[prefuncs] += "package_get_auto_pr"
> > > >
> > > >
> > > >
> > > > Merging OE-Core commit 36fe4db8ae827a93abe9fce6740459d215411965
> > ("kernel.bbclass: Remove do_install[prefunc] no longer needed") should
> > normally solve this warning by removing the above line, but I do not know if
> > that change is safe in dunfell.
> > > >
> > > >
> > > >
> > > > Could that be merged in? Or is there something else that could be done
> > to avoid the warning?
> > >
> > > I can do some testing with that patch.  cc-ing Mark to see if he has
> > > any comments since he is the patch author.
> > >
> > > Steve
> > >
> > >
> > > > Our build system flags a production build as bad if there is a warning, so
> > this is kind of annoying.
> > > >
> > > >
> > > >
> > > > Best,
> > > >
> > > >
> > > >
> > > > Diego
> > > >
> > > > --
> > > > Diego Santa Cruz, PhD
> > > > Technology Architect
> > > > spinetix.com
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
>
> 
>

Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.27082.1590717759120418436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 19:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eFv/6ur5;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id g28so176154qkl.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 19:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QIeFcnMU6Ghtk1QgYPXKcvc8s98D/XT1s2eDzc9enWA=;
        b=eFv/6ur5g03kSvy+wTwJG50tiQ0bua7uSzONJF879c0gs9lPoX0gCm7CUCEOfK30U+
         1q4iYRFkueINWXoJVv9Ua6O3God/ZPqrpow7LFe/xbqFDRkJHwH9d/dvelfU0sF1QyfU
         6mmdk4gj1CfvKjWAKABIRWzOtlaIwUYvfIhPMMf48fVlNdhFwV2phSLpfViO88hv0nFf
         yTrE6eM92rCW4nPw1STgAm+wcjUQot/xfM0FXU2tqHo7IqAvF8BTDs66IMq188HXh6QB
         5X78tIvtwXd6GPCz7BmBKhehtvoeeS25ZgkviCOTE/zd3Ddw/uYER6bGpzI3wDEHap3u
         WPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QIeFcnMU6Ghtk1QgYPXKcvc8s98D/XT1s2eDzc9enWA=;
        b=R84ec1Z9a/DdFMdYezLG1WoiyUdc1bvYi/p3KRewRlFEd9MNd8W3kt5zUCbllBLGOk
         nJf5UXzQ7nqqJXcBapT0ipT9AEQsqU6PVa1y8nhsJH855U5bZIMY+E66tHi8T6EkHNEA
         eGZIYwpM8/khEetLHoinzBh4pkjvGVqmXUHp0SJZN2f+3Xlzz23YbDgdgooCG/yScoKS
         0bH2cyN7ykcIdKhNlAmedJ3PstDq0tNOkQOw1gFQ+p/2LjSznTBEmErwZplIxyRSrIhL
         IEwMbxnUaS6Elq0cAai9sNdWnrHJLqoG7nOC7jTNGfjPcGRXscpr2pqvS97Yw3BYaf1W
         xIvA==
X-Gm-Message-State: AOAM532Lrn4yF2QfJCHdiHSrwK4+4psf+5gC0BlHnYdHFtUt0uT02CYJ
	nJWS/6jhJU/vaA+ksvvOUSzl3uVWNc3QC85K89o=
X-Google-Smtp-Source: ABdhPJw+UZl6jZbPS5FszUyvLmiUFsYfkywXK+4nhp3bZfzg/0UgQu/15/b21FVQJaPdIHmUgl1bfDCmancgFuy6yF0=
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr5501995qkf.17.1590717758201;
 Thu, 28 May 2020 19:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2005271027490.2161832@localhost.localdomain> <0d663371-0bb1-9ae8-a50b-bc4ed7fda412@gmail.com>
In-Reply-To: <0d663371-0bb1-9ae8-a50b-bc4ed7fda412@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 28 May 2020 19:02:12 -0700
Message-ID: <CAMKF1spsARiB5ibBVZ2AF5sLGw9cAakGos-yqbfn=NG6B+nw9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] remove unused DEPLOY_DIR_TOOLS variable from bitbake.conf
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 7:36 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On 5/27/20 4:31 PM, Robert P. J. Day wrote:
> >
> > Variable DEPLOY_DIR_TOOLS was introduced in 2007:
> >
> >    commit f751a20152c651a33f08ceda0502fa1d4f11c005
> >    Author: Richard Purdie <richard@openedhand.com>
> >    Date:   Wed Aug 8 21:02:39 2007 +0000
> >
> >        bitbake.conf: Sync with OE.dev
> >
> > apparently never used so get rid of it.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
>
> meta-openembedded/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb:do_deploy[sstate-outputdirs]
> = "${DEPLOY_DIR_TOOLS}"
> 

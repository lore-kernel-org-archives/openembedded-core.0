Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.712.1588204959159116015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 17:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sfk9s50G;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id v10so2149411qvr.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 17:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Bd7W3AX2CV7B2coToJIHK1SeXkZMJMdELH/cxEJz3Oc=;
        b=sfk9s50Gy0eTHRcLXMFSanEBZTxoRuX9TiwIUYBsOHXYaOiokm6VarzQXgBKoVoFnm
         pdTLsqNBWx/xZ5yGEbZUhrDYylaDwbhfU1B3HhBRRk772Obhmte6zUTIjl4A2Ciu5dPt
         Z6m9DCnzFUzyHTRx8vcyYVXnr0EgzLH54rTDnh4nMyCjeC1FlXzg/7Djokh3r2pAdhXd
         UjGrNIydZWTFlG0ay2hu9B2oXbR5pOD/1ui1HeN9FBNMpmAY2YW69sGS8iYEKSziyVZT
         n0trKtNSfQ0OeOydE5xJYSs+tGdUkiCc+KrU6VG+5yx222L5ZjRyt6nGUxSCJtqDr6y8
         D4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Bd7W3AX2CV7B2coToJIHK1SeXkZMJMdELH/cxEJz3Oc=;
        b=TTGLIFUBhz2kfAf8+inhKBWEHhdl5Y2TNCO5Rkpa00n27kq47ry5Qz4FhKtgXEEF7D
         gI7psj7uht9kFFaOG25SfXcZ1mFcM46uYlgetCApXmfKHXytcL3ZQ9RV2VTosgRuuwxy
         zdN2pTjBATPNV3i5trAQRnfZLfzzBeh4J0aTKuuifDQTE6h7avNSvZMNSmGma+Ivr8/B
         X1j8Iv3fmAlaN4ChqoPiQZFc4pGS3r2FIM8FXKq6J4xx1DoJvCRov8vIfiFHt2/4nGa0
         1MEqXnfTN+FmUGxkBqWltkYk06cDQvTSp0Am7sMoU6kV0RlgzcMy9Zeqgg1COY/XCtfu
         Kj7w==
X-Gm-Message-State: AGi0PuYG8LrijT/w7mMYplZXJWlShnixmNP/m/s3Bsg0/N8o9HZQKQvD
	+jItQc/7TpSw7odmatvvv+QC/kaL1mg+iG9V8dqvn97Mg04=
X-Google-Smtp-Source: APiQypJ20QQiB8oEv8yumK0QX7ChHiXVO8VzM6Igpwt8nsqPd6afR3uzJhKPwOwl+xj/Nc2DsSwykqpPFAV7GWyIl/Q=
X-Received: by 2002:ad4:4182:: with SMTP id e2mr448001qvp.61.1588204957518;
 Wed, 29 Apr 2020 17:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200429220156.1300336-1-richard.purdie@linuxfoundation.org> <20200429234101.GS11927@denix.org>
In-Reply-To: <20200429234101.GS11927@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 29 Apr 2020 17:02:10 -0700
Message-ID: <CAMKF1sr7ZUtGMn2hCFoGHmt4Tk4DXJm_KaC5C1ntLqCzL_ihwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: Require gcc 6 or later
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 29, 2020 at 4:41 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Wed, Apr 29, 2020 at 11:01:56PM +0100, Richard Purdie wrote:
> > New versions of rpm have issues with the libgomp support in gcc 5.x
> > so raise the minimum to 6 or later. This mainly affects Ubuntu 16.04.
>
> So, this is for master, rigth? No plans to backport it to dunfell (hence, no
> rpm backport either), correct? Trying to make sure Yocto LTS will still work
> on Ubuntu 16.04 LTS...

I think yes, its not coming to dunfell, ubuntu 16.04 is still in
maintenance and will be for next year too
see https://ubuntu.com/about/release-cycle


>
> --
> Denys
>
>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/sanity.bbclass | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index 9e871017389..292c5591dd3 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -527,7 +527,7 @@ def check_wsl(d):
> >              bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
> >      return None
> >
> > -# Require at least gcc version 5.0.
> > +# Require at least gcc version 6.0.
> >  #
> >  # This can be fixed on CentOS-7 with devtoolset-6+
> >  # https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
> > @@ -541,8 +541,8 @@ def check_gcc_version(sanity_data):
> >
> >      build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
> >      if build_cc.strip() == "gcc":
> > -        if LooseVersion(version) < LooseVersion("5.0"):
> > -            return "Your version of gcc is older than 5.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
> > +        if LooseVersion(version) < LooseVersion("6.0"):
> > +            return "Your version of gcc is older than 6.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
> >      return None
> >
> >  # Tar version 1.24 and onwards handle overwriting symlinks correctly
> > --
> > 2.25.1
> >
>
> >
>
> 

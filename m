Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.12538.1606434123218348200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 15:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HoZJppsd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id l1so3816062wrb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2020 15:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=e9Cv0VWC8MkSUDbDj05Q2LIipC+gsheW3wxAGr87WdQ=;
        b=HoZJppsdRNMJFkn7s1oCZbfiLdiUUweKYeQ22nip/kSXw/eTF042L0HPZMfQLrf/ly
         Vx9Vc/MITeLxuGX0e8e6Pz+XEJibRYq1XGL5kLBOB2TsADAnFPEPirVf8dNhVr7wb0oA
         vAns7VAzOtgblnBfi4qqcim220gnoT+e0jgcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=e9Cv0VWC8MkSUDbDj05Q2LIipC+gsheW3wxAGr87WdQ=;
        b=k6hw+WnPNeQt/+UChHcb5LyIWviHCu4hixOaUKGQoNUNa2aMGjuKuqAwkA6vHMk7n/
         gt4w7sPCtvAeTpfW6xuPQIFII8WWF3Kw0upZp4Zg9yR8UCXK+JDuVtnNdwS9QN/YQ6jF
         kDk1s7G+ADFKnMeepcGtexOlnT8N1VfbkMeCCGDvYOzyIyIeHyub//V/2GhxZG4nZLEh
         hLg/IrGOLfwEPl/xq4ZoJVHZPQXKI1c07WndluQFKk1eme417iNLQtZ8OuZGnjwmMpAx
         V95gIbO9lFKS+jXqTxV1A4ZGPbZuIIOq8U5mPu8hY2TaQIXLxVg+bGJt6Ow+KC+kbaJX
         fVxQ==
X-Gm-Message-State: AOAM531VhIibFCEvC0bUvh1nipHM0zINk+enQfThWL9BcyBP7stA3WvB
	aYlFR4WMfgVgOFaJq4WF/qCgwg==
X-Google-Smtp-Source: ABdhPJyC9RsvhBORAIiX+VOrxiEuI4m0KXQ9f+d/NJuLaOYXZ0kQ4WPKR9tOGs2UmC7H3am0gUW0uA==
X-Received: by 2002:adf:8b4a:: with SMTP id v10mr6798643wra.212.1606434121165;
        Thu, 26 Nov 2020 15:42:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.8.3.c.5.5.3.2.b.b.3.d.3.f.0.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.8.3.c.5.5.3.2.b.b.3.d.3.f.0.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:80f3:d3bb:2355:c387])
        by smtp.gmail.com with ESMTPSA id b18sm11787242wrt.54.2020.11.26.15.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 15:42:00 -0800 (PST)
Message-ID: <fe01b78024f2e643f7f2442483bb4a673112b63d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 3/4] bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Nov 2020 23:41:59 +0000
In-Reply-To: <307eb4fc670343e6b725de414ea90f43@XBOX03.axis.com>
References: <cover.1606312002.git.pkj@axis.com>
	 <9b62c1babb6a53472329d57fa6ec2ac8ed70a3f8.1606312002.git.pkj@axis.com>
	 <4ddd2873ff90af2675c690fd44ab8881ff609a70.camel@linuxfoundation.org>
	 <307eb4fc670343e6b725de414ea90f43@XBOX03.axis.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-11-26 at 20:38 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 26 november 2020 15:47
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCHv2 3/4] bitbake.conf: Canonicalize
> > paths in
> > PSEUDO_IGNORE_PATHS
> > 
> > On Wed, 2020-11-25 at 14:48 +0100, Peter Kjellerstedt wrote:
> > > Introduce PSEUDO_IGNORE_REAL_PATHS and make it contain the
> > canonicalized
> > > paths from PSEUDO_IGNORE_PATHS, obtained by passing the latter to
> > > oe.path.to_real_paths(). This is needed since pseudo's
> > > pseudo_client_ignore_path_chroot() will compare the ignored paths
> > > to
> > > paths that have been canonicalized.
> > > 
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  meta/conf/bitbake.conf | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > This looks like a good way to fix this, except I have a strong
> > dislike
> > of "REAL" variables.
> 
> Well, I named it PSEUDO_IGNORE_REAL_PATHS to match
> os.path.realpath(). 
> I can name it, e.g., PSEUDO_IGNORE_CANONICAL_PATHS if you prefer
> that?

My point was less about the name and more that I'd prefer not to have
an indirect variable which isn't useful.

> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 9742fe4fe2..4862095a1b 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -685,15 +685,16 @@ SRC_URI = ""
> > >  PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
> > >  PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
> > >  PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> > > +PSEUDO_IGNORE_REAL_PATHS = "${@','.join(os.path.realpath(path) for
> > path in (d.getVar('PSEUDO_IGNORE_PATHS') or '').split(','))}"
> > >  PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-
> > sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-
> > sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-
> > ,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-
> > install-package_,${WORKDIR}/sstate-build-
> > image_complete,${TMPDIR}/sysroots-
> > components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBA
> > SE}/scripts,${@','.join(d.getVar('BBLAYERS').split())},${CCACHE_DIR}"
> > >  export PSEUDO_DISABLED = "1"
> > >  #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
> > >  #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
> > >  #export PSEUDO_LIBDIR =
> > "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
> > > -FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native}
> > PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib
> > PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native}
> > PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=1"
> > > +FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native}
> > PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib
> > PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native}
> > PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_REAL_PATHS} PSEUDO_DISABLED=1"
> > >  FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
> > > -FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native}
> > PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR}
> > PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1
> > PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=0"
> > > +FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native}
> > PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR}
> > PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1
> > PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_REAL_PATHS} PSEUDO_DISABLED=0"
> > 
> > I'm wondering if we create a function in lib/oe/utils.py and then use
> > something like:
> > 
> > PSEUDO_IGNORE_PATHS=${@oe.utils.realpath("PSEUDO_IGNORE_REAL_PATHS")}
> 
> There already is an oe.path.realpath(). However, I am not sure when 
> it is expected to be used instead of os.path.realpath().

That is a bad choice of name now I look at it! I was thinking more
about the use of a function.

> I initially created an oe.path.realpaths(d, var, separator=','), but 
> after I had rewritten it a couple of times I was down to just the 
> single list comprehension and then I felt as I could just as well 
> use it directly since I don't see a great need for a common function 
> to canonicalize a list of paths. But if you prefer that solution, I 
> can restore it.

I don't really mind the list comprehension directly or a function, I'd
just prefer not to have an indirect variable around to confuse people.

Cheers,

Richard


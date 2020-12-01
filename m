Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.6876.1606809508663478591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 23:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e834yynj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id a3so2982837wmb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 23:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=N3kTDSDaanXObrKY9qg8+QcU54AiIkNL6s8HM+OIAqA=;
        b=e834yynj3IEVEH4ElXszO/+XAQj+1pVGkyJIQdNnBxALs7UBOZIUqapnBf8Nl851Rq
         /l+VlufEIUQUXv2Vzl1V95KhYBM1whX0zABh/gqnRhcvpSWY0zs0j1RY/a/SkYdxFbw1
         +jN+Weg8KjAh2ijAvHP2l2ehXoNUdAdvFPO94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=N3kTDSDaanXObrKY9qg8+QcU54AiIkNL6s8HM+OIAqA=;
        b=DS7Gf6uEVdguxfdsupLGTny9FO4zWAmN4euUnVyJehYTqodO8QXrAK44BOtBETvUvu
         YLAntHUHFlU4cNiZy1T39Yu4DydJTPtq1gcaSb2E8HmRFzLCL8RtrRq2+dJb7WaaFyWt
         2+HBCRKnnqnKPr2v9qslRwmWlJSWcPCVhSKZ0HR//cLSj2jO/8swTExuLT5XVULFQkvE
         dNznkVpheqtlZ7/EEQVDWwX4Ulkv2o5r4Ehjj8AbcweprslW0S0F7+xMtefB6MSS/ORm
         LnLsPKPEtiW7Nuh0td3thEX6hMqJakfHlEP0D8J4EbBhjUMVIjYwdrc4bV+7M01jtt5U
         S21Q==
X-Gm-Message-State: AOAM531bMXXUMyTEqAURQQ8PMJ7gYq0KxoKJL2z3sZrFYfTbT209gmKD
	Tf+Ll1as2kiXqCwPYXGDU/5CQQ==
X-Google-Smtp-Source: ABdhPJxZWDcOY6wdyqVb1gg2V4s8AHnT3wkdXa6+lKnA1WiPQJe9ZOFzff+Mx27tds7y+JHcln5kiA==
X-Received: by 2002:a05:600c:410d:: with SMTP id j13mr1373017wmi.95.1606809507038;
        Mon, 30 Nov 2020 23:58:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b1c8:3e5a:82cc:7486])
        by smtp.gmail.com with ESMTPSA id o2sm1635379wrq.37.2020.11.30.23.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 23:58:26 -0800 (PST)
Message-ID: <756e4529c98cdb1598dc2e118f2b3103229df1c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 3/4] bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Dec 2020 07:58:24 +0000
In-Reply-To: <af090a2c9e16425b9a01bd2f791a5f1b@XBOX03.axis.com>
References: <cover.1606312002.git.pkj@axis.com>
	 <9b62c1babb6a53472329d57fa6ec2ac8ed70a3f8.1606312002.git.pkj@axis.com>
	 <4ddd2873ff90af2675c690fd44ab8881ff609a70.camel@linuxfoundation.org>
	 <307eb4fc670343e6b725de414ea90f43@XBOX03.axis.com>
	 <fe01b78024f2e643f7f2442483bb4a673112b63d.camel@linuxfoundation.org>
	 <af090a2c9e16425b9a01bd2f791a5f1b@XBOX03.axis.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-30 at 17:44 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 27 november 2020 00:42
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCHv2 3/4] bitbake.conf: Canonicalize paths in
> > PSEUDO_IGNORE_PATHS
> > 
> > On Thu, 2020-11-26 at 20:38 +0000, Peter Kjellerstedt wrote:
> > > > -----Original Message-----
> > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > Sent: den 26 november 2020 15:47
> > > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > > > core@lists.openembedded.org
> > > > Subject: Re: [OE-core] [PATCHv2 3/4] bitbake.conf: Canonicalize
> > > > paths in
> > > > PSEUDO_IGNORE_PATHS
> > > > 
> > > > On Wed, 2020-11-25 at 14:48 +0100, Peter Kjellerstedt wrote:
> > > > > Introduce PSEUDO_IGNORE_REAL_PATHS and make it contain the
> > > > canonicalized
> > > > > paths from PSEUDO_IGNORE_PATHS, obtained by passing the latter to
> > > > > oe.path.to_real_paths(). This is needed since pseudo's
> > > > > pseudo_client_ignore_path_chroot() will compare the ignored paths
> > > > > to
> > > > > paths that have been canonicalized.
> > > > > 
> > > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > > ---
> > > > >  meta/conf/bitbake.conf | 8 +++++---
> > > > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > > 
> > > > This looks like a good way to fix this, except I have a strong
> > > > dislike
> > > > of "REAL" variables.
> > > 
> > > Well, I named it PSEUDO_IGNORE_REAL_PATHS to match
> > > os.path.realpath().
> > > I can name it, e.g., PSEUDO_IGNORE_CANONICAL_PATHS if you prefer
> > > that?
> > 
> > My point was less about the name and more that I'd prefer not to have
> > an indirect variable which isn't useful.
> > 
> > > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > > index 9742fe4fe2..4862095a1b 100644
> > > > > --- a/meta/conf/bitbake.conf
> > > > > +++ b/meta/conf/bitbake.conf
> > > > > @@ -685,15 +685,16 @@ SRC_URI = ""
> > > > >  PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
> > > > >  PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
> > > > >  PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> > > > > +PSEUDO_IGNORE_REAL_PATHS = "${@','.join(os.path.realpath(path) for
> > > > path in (d.getVar('PSEUDO_IGNORE_PATHS') or '').split(','))}"
> > > > >  PSEUDO_IGNORE_PATHS =
> > "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-
> > > > sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-
> > > > sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-
> > > > ,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-
> > package_,${WORKDIR}/sstate-
> > > > install-package_,${WORKDIR}/sstate-build-
> > > > image_complete,${TMPDIR}/sysroots-
> > > > 
> > components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBA
> > > > SE}/scripts,${@','.join(d.getVar('BBLAYERS').split())},${CCACHE_DIR}"
> > > > >  export PSEUDO_DISABLED = "1"
> > > > >  #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
> > > > >  #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
> > > > >  #export PSEUDO_LIBDIR =
> > > > "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
> > > > > -FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native}
> > > > PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib
> > > > PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native}
> > > > PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=1"
> > > > > +FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native}
> > > > PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib
> > > > PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native}
> > > > PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_REAL_PATHS} PSEUDO_DISABLED=1"
> > > > >  FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
> > > > > -FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native}
> > > > PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR}
> > > > PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1
> > > > PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=0"
> > > > > +FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native}
> > > > PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR}
> > > > PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1
> > > > PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_REAL_PATHS} PSEUDO_DISABLED=0"
> > > > 
> > > > I'm wondering if we create a function in lib/oe/utils.py and then use
> > > > something like:
> > > > 
> > > > PSEUDO_IGNORE_PATHS=${@oe.utils.realpath("PSEUDO_IGNORE_REAL_PATHS")}
> > > 
> > > There already is an oe.path.realpath(). However, I am not sure when
> > > it is expected to be used instead of os.path.realpath().
> > 
> > That is a bad choice of name now I look at it! I was thinking more
> > about the use of a function.
> > 
> > > I initially created an oe.path.realpaths(d, var, separator=','), but
> > > after I had rewritten it a couple of times I was down to just the
> > > single list comprehension and then I felt as I could just as well
> > > use it directly since I don't see a great need for a common function
> > > to canonicalize a list of paths. But if you prefer that solution, I
> > > can restore it.
> > 
> > I don't really mind the list comprehension directly or a function, I'd
> > just prefer not to have an indirect variable around to confuse people.
> 
> Ok, I take that to mean that you instead want me to, e.g., use a function 
> to canonicalize the paths where ${PSEUDO_IGNORE_REAL_PATHS} is used now? 
> I.e., something like this (line broken here for readability):
> 
>   FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} \
>                  PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} \
>                  PSEUDO_PASSWD=${PSEUDO_PASSWD} \
>                  PSEUDO_NOSYMLINKEXP=1 \
>                  PSEUDO_IGNORE_PATHS=${@oe.paths.canonicalize(d, 'PSEUDO_IGNORE_PATHS')} \
>                  PSEUDO_DISABLED=0"
>   FAKEROOTENV[vardeps] += "PSEUDO_IGNORE_PATHS"
> 
> alternatively:
> 
>   FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} \
>                  PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} \
>                  PSEUDO_PASSWD=${PSEUDO_PASSWD} \
>                  PSEUDO_NOSYMLINKEXP=1 \
>                  PSEUDO_IGNORE_PATHS=${@oe.paths.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} \
>                  PSEUDO_DISABLED=0"
> 
> I am not sure whether there is a preference for utility functions 
> to take d and the name of a bitbake variable as arguments, or to 
> take the variable's value. The former is a little bit shorter, but 
> on the other hand it requires the extra vardeps declaration.
> 
> There is a minor drawback with this solution, and that is that I 
> cannot use that function in wic. So I will use the list comprehension 
> directly, with a comment referring to the oe.path.canonicalize() 
> function.

The version which avoids the vardeps is probably slightly neater
overall. I wasn't sure if using the list comprehension here would be
too ugly or not but I'm happy just not to have another variable name
used here, thanks!

The wic issue is unfortunate but hard to avoid.

Cheers,

Richard


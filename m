Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.1282.1625681696702463735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 11:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MS1388BZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id k16-20020a05600c1c90b02901f4ed0fcfe7so2275768wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OX9nbNsRdLLRU0yeKvdq4PPAdouFHMZh7+mcA961CaE=;
        b=MS1388BZv/A+CjGLxLGud505zaEdw6Z4RQBjj7aDuAxBsrUWgcqYuMGtFfzqd43WpR
         +IZ1U4ZTt7OsjXg1b/ifgIh7hstEphWGOjiz9UfeLZrw63rJ/i6g6NG85ujK9dVFEViH
         tg4w0pEu/ktSL9CMimYZeOnHi+PzIJRuj+bTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OX9nbNsRdLLRU0yeKvdq4PPAdouFHMZh7+mcA961CaE=;
        b=OssTgpyGeQRba7qZbiKkj4LTyrpkOaHqIloqKDf0j6qg5hVqGfS9GjENwfv3n46nge
         KTFaWrd6Bqvm0rYL6aHBY2xx5f3vx7qssIIqJMIMZPY39qklLFApHK/E8Bg4UwYRqVSb
         sfyzTNI/eXAC/qCY9zALx0gz/CTrF7wqnZ32cTEl0+Unj3r3AJdPYt14knIEYDq74vkx
         ByEkAgO/KQHAkwF/sKMU8Qventnd5mzGzRDFPCHWBwIHNvHB6h7WrLV2lKwIhXG6wGNX
         KLpkhc7CC+JrCXEcH20hGZxJiC8jnjc/a1ZhMVDps+MFOtrr+MQXyLo49WMzztsNtf5C
         9DfQ==
X-Gm-Message-State: AOAM530yr5BJwi5Fv3DWf7rmT47x5Nsupj807CAJ8EtcgiHPVlBIFqYP
	UKTLbF9lnpJptdx2I4l6mVhHUg==
X-Google-Smtp-Source: ABdhPJwLn2s7PaiqjrE6EOo0MovZEwKtGfq9+27wyCCk+AbArBxO74908bW+VUsLly86rTEHhSWvdw==
X-Received: by 2002:a7b:c092:: with SMTP id r18mr28652616wmh.181.1625681695093;
        Wed, 07 Jul 2021 11:14:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5? ([2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5])
        by smtp.gmail.com with ESMTPSA id n13sm12715131wms.4.2021.07.07.11.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 11:14:54 -0700 (PDT)
Message-ID: <1bcb91b4b0a3136e538d4efc33dafe49b648e151.camel@linuxfoundation.org>
Subject: Re: [OE-core] license.bbclass does not add recommends to dynamic packages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mike Crowe <yocto@mac.mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 Jul 2021 19:14:54 +0100
In-Reply-To: <20210707165513.GA12044@mcrowe.com>
References: <20210707115334.GA498@mcrowe.com>
	 <f78a557b2ce4df340b55194f551e599bffbe21ae.camel@linuxfoundation.org>
	 <20210707130521.GA4032@mcrowe.com>
	 <168F8FE5ADDC556E.30794@lists.openembedded.org>
	 <303e003d518d15ee79997873f0c8dbac439a25a8.camel@linuxfoundation.org>
	 <20210707165513.GA12044@mcrowe.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-07 at 17:55 +0100, Mike Crowe wrote:
> On Wednesday 07 July 2021 at 17:48:20 +0100, Richard Purdie wrote:
> > On Wed, 2021-07-07 at 17:43 +0100, Richard Purdie via lists.openembedded.org wrote:
> > > On Wed, 2021-07-07 at 14:05 +0100, Mike Crowe wrote:
> > > > On Wednesday 07 July 2021 at 13:25:17 +0100, Richard Purdie wrote:
> > > > > On Wed, 2021-07-07 at 12:53 +0100, Mike Crowe via lists.openembedded.org wrote:
> > > > > > We're using LICENSE_CREATE_PACKAGE to create ${PN}-lic package files and
> > > > > > relying on the automatically generated recommends to cause them to be
> > > > > > installed in the image. This works well for most packages, but fails for
> > > > > > packages where we only install package created using PACKAGES_DYNAMIC.
> > > > > > 
> > > > > > For example, liborc is being installed in our image but that package lacks
> > > > > > a recommends for orc-lic, so the licences that apply to it are not being
> > > > > > installed. This is because license.bbclass:add_package_and_files iterates
> > > > > > only over the packages listed in PACKAGES.
> > > > > > 
> > > > > > Steps to reproduce on current master:
> > > > > > 
> > > > > > $ echo 'LICENSE_CREATE_PACKAGE = "1"' >> conf/local.conf
> > > > > > $ bitbake orc
> > > > > > $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/orc_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> > > > > >  Recommends: orc-lic
> > > > > > $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/liborc-0.4-0_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> > > > > > $
> > > > > > 
> > > > > > (I would have expected the last command to produce the same output as the
> > > > > > penultimate one.)
> > > > > > 
> > > > > > Even if I could fathom out how to fix orc and any other recipes so that they
> > > > > > did add the ${PN}-lic dependency, I'd be worried about not noticing that
> > > > > > the problem affected other recipes in the future.
> > > > > > 
> > > > > > Is there a way to teach license.bbclass:add_package_and_files to add the
> > > > > > ${PN}-lic recommends for dynamic packages, or would it be necessary to
> > > > > > teach package.bbclass to do so?
> > > > > 
> > > > > That all sounds rather horrible :/.
> > > > > 
> > > > > Would IMAGE_INSTALL_COMPLEMENTARY += "*-lic" work instead?
> > > > 
> > > > That seems to have worked well.
> > > > 
> > > > I wonder whether this means that it would be better to stop adding the
> > > > recommends automatically and tell users that need this to use
> > > > IMAGE_INSTALL_COMPLEMENTARY instead (either directly, or by teaching
> > > > license_image.bbclass to modify it based on another variable.)
> > > 
> > > That would seem the better option to me at least...
> > 
> > To be clear, I'd definitely support dropping that existing RRECOMMENDS code,
> > I think there are better ways to handle this now. I may even write that patch :)
> 
> I was thinking of something like the following untested patch:
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index f7978e266b..c87473cbb8 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -63,14 +63,6 @@ def add_package_and_files(d):
>          # first in PACKAGES to be sure that nothing else gets LICENSE_FILES_DIRECTORY
>          d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
>          d.setVar('FILES_' + pn_lic, files)
> -    for pn in packages.split():
> -        if pn == pn_lic:
> -            continue
> -        rrecommends_pn = d.getVar('RRECOMMENDS_' + pn)
> -        if rrecommends_pn:
> -            d.setVar('RRECOMMENDS_' + pn, "%s %s" % (pn_lic, rrecommends_pn))
> -        else:
> -            d.setVar('RRECOMMENDS_' + pn, "%s" % (pn_lic))
> 
>  def copy_license_files(lic_files_paths, destdir):
>      import shutil

The above looks like the patch I just sent out! :)


> diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
> index 73cebb4d55..293a033855 100644
> --- a/meta/classes/license_image.bbclass
> +++ b/meta/classes/license_image.bbclass
> @@ -279,3 +279,6 @@ python license_qa_dead_symlink() {
>                  bb.error("broken symlink: " + full_path)
>  }
>  IMAGE_QA_COMMANDS += "license_qa_dead_symlink"
> +
> +IMAGE_INSTALL_LICENSES ??= "${LICENSE_CREATE_PACKAGE}"
> +IMAGE_INSTALL_COMPLEMENTARY += "${oe.utils.conditional("IMAGE_INSTALL_LICENSES", "0", "", "*-lic", d)}"
> 
> I'm not sure whether it's safe to += an empty string onto the end of
> IMAGE_INSTALL_COMPLEMENTARY, but I'm trying to avoid adding yet more
> anonymous Python. :-)
> 
> Is that the sort of thing you meant?

Yes, += to an empty string is fine. I'm torn on whether we should do this "magically" 
or whether users should opt in to it when needed on a per image (or distro) basis.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 168D97E3B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 22:16:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z23so4700817wma.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 15:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=uAsiVpVYPTp/W6AR1hMOLdEmePfwC3jIbj1f05RWzbY=;
	b=VDUHlYaBgoBL1z/0vLP5ujjK/Sx14XOJ7p+IxjMWbu/l5oS2ENlKfZ/zdjtKQoYV0D
	tgToD7+am+88UlU37L9l5FNayj9GXC4V9RrYjYv/QxGF0ieaXdfH8Af0/52nTLDmjrhB
	OEZdDhqgUuikm5Cfkdg191cTKSS2vPyy8su04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uAsiVpVYPTp/W6AR1hMOLdEmePfwC3jIbj1f05RWzbY=;
	b=PkU6dboR9/UZcFCV/243wniP3cGkRt17+1404IhSdXCSLUD41momVcrQvLI5NC9wUu
	My7by8YntKPxQGvuzu5PPWapdaFiArj9NOwQksSYN+E1fTzQ8xHDGtd5wWm5LOyQ+B6f
	b7aBZWbTqp7xGhPA8MCriEyS88LA6ZXxA8H2Yy2U07P4xS5VuG1xE14t6EwFBWTDLET8
	fnwzJU/2e1D9pPYrlstpPJXx0oITfc+T8rjssq4Gkbauo3SrVyqm3RhMrHHVZQGJcG/H
	JqMns/DAWp4p2gjf6w1QUj6GdAbyBi+4PrbyeFi7FVq8feQH5w7VtNBgEKG+FwFdkGSr
	xmLQ==
X-Gm-Message-State: APjAAAUA48eoE3FKnGXhNlS9nA02oFTnqYFd9Dr935fKr6IdnvXR/b5r
	IsBxP39zi/Dwc84iBEEA69CzQl6o1i4=
X-Google-Smtp-Source: APXvYqxfoSoz7bhLHluUWZBSb7X8ltn0nV/4mv0D2olJHLXozkN/7WllPYcYtI1F/eooiQ7RbB3MDg==
X-Received: by 2002:a7b:c356:: with SMTP id l22mr3513635wmj.97.1559254614806; 
	Thu, 30 May 2019 15:16:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id g2sm4843000wru.37.2019.05.30.15.16.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 15:16:54 -0700 (PDT)
Message-ID: <c28aa03bea45809dcd095a782eca9f6628fff558.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 23:16:53 +0100
In-Reply-To: <2464053a8ff6ebd77a312cbc70b7ffda2c559345.camel@linuxfoundation.org>
References: <ba81c9ea11db351bde7fec1c40c2f57495c3fdec.camel@linuxfoundation.org>
	<1559196696-70652-1-git-send-email-mingli.yu@windriver.com>
	<2464053a8ff6ebd77a312cbc70b7ffda2c559345.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v4] elfutils: fix ptest failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2019 22:16:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 21:49 +0100, richard.purdie@linuxfoundation.org
wrote:
> On Thu, 2019-05-30 at 14:11 +0800, mingli.yu@windriver.com wrote:
> > From: Mingli Yu <Mingli.Yu@windriver.com>
> > 
> > * Add missing files which needed by ptest test
> >   to fix the ptest failures such as:
> >   | sh: ../src/elflint: No such file or directory
> >   | FAIL: asm-tst4
> > 
> > * Rework 0001-skip-the-test-when-gcc-not-deployed.patch
> >   to skip the tests which depend on gcc
> > 
> > * Define INHIBIT_PACKAGE_STRIP_FILES for elfutils to
> >   avoid stripping some generated binaries otherwise
> >   some of the tests such as test-nlist, run-strip-reloc.sh,
> >   run-strip-strmerge.sh and so on will fail
> > 
> > Before:
> > --------------------------------------------
> > Recipe   | Passed    | Failed   | Skipped
> > --------------------------------------------
> > elfutils | 176       | 23       | 4
> > --------------------------------------------
> > 
> > After:
> > --------------------------------------------
> > Recipe   | Passed    | Failed   | Skipped
> > --------------------------------------------
> > elfutils | 199       | 0       | 4
> > --------------------------------------------
> 
> Thanks, this is better again. We do still have a musl issue:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/648
> 
> Error: 
>  Problem: package packagegroup-core-full-cmdline-extended-1.0-
> r6.0.noarch requires iproute2, but none of the providers can be
> installed
>   - package packagegroup-core-full-cmdline-1.0-r6.0.noarch requires
> packagegroup-core-full-cmdline-extended, but none of the providers
> can be installed
>   - package iproute2-5.1.0-r0.0.core2_32 requires elfutils-ptest >=
> 0.176, but none of the providers can be installed
>   - conflicting requests
>   - nothing provides elfutils-binutils needed by elfutils-ptest-
> 0.176-r0.0.core2_32
> (try to add '--skip-broken' to skip uninstallable packages or '
> --nobest' to use not only best candidate packages)

I think this may also be causing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/652

which is due to elfutils-ptest being pulled into normal images and then
causing an OOM problem, statd is killed and then systemd reports
errors.

This is probably as the ptest package is being registered as an shlib
proivider. There should be a variable we can set to stop that and allow
the main elfutils package to be the shlibs provider for the
package.bbclass code.

Cheers,

Richard





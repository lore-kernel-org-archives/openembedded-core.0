Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4A94760811
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 08:14:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r11so22689011wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 00:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=7fUs1uh05SLLZR1pnslolW2c71rnPqVqfuEGZaY5RaI=;
	b=M9QSFMn09hlbb7u9beiLL6U1stb2nFove4wdUxGrAPax852vdIX1T7rJWR3lqDcDR5
	R4/Eo0D0O5ao6PCN1GNt+Rt9zykPTymsyS2tlK5zKK6XRknGFFQ7wN32C7AHQBo4FHYe
	60Ft3Wyrq4ny8dH5lNRKgSNV4bdI6HBR7I8Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7fUs1uh05SLLZR1pnslolW2c71rnPqVqfuEGZaY5RaI=;
	b=hwdiHWq68DJiEekbfS9w9BquLZ+LLg4g8W5z5a9nmswD8giIMsU3eIOw4qmszt5DKC
	hpU7lmJB0VSk1dnFEqRZL/xOKOZkYbu7QxYA4t7qTvioI4nb+SU66alTYGjG/uZM19Ga
	CLTMsJ/4c2CXtcHD2mM1Bz+83vqegAYQIBfBsj5u9CQq/GS0DU4/Uz6mMQPofovhjVOt
	SFvnUH/AMxYqvqKxRGR5XJF9uzjj5f2+bKvYtlWIewcNU5psMKOKILomiOMLu52uOmCA
	XgPsWjTEPVKmBa2JXju9Ab7e1YVfXNPKx2Ow589QPabsWpHkZZtfmiLnbh4R6F3b3HdE
	cxQw==
X-Gm-Message-State: APjAAAXkSv3P9bvTMxxDG9EFgurJr3jUT/+uuZ0HwderqKoPviSUr5/U
	6dFIZyQMqEpUB1d6imiMaaatt1pMtFA=
X-Google-Smtp-Source: APXvYqxj3zHo+Nnc2ArjT9wPxSZrT5I6WKWQtCbX+lBtujeeru2tG8ztfExX2ewSLPdvabhAhwiM4g==
X-Received: by 2002:adf:db48:: with SMTP id f8mr25906634wrj.146.1582013653835; 
	Tue, 18 Feb 2020 00:14:13 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id j15sm5151555wrp.9.2020.02.18.00.14.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 00:14:12 -0800 (PST)
Message-ID: <54127a38f14d1a3fc8ea554cce595052ec40f35c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Reid <preid@electromag.com.au>, Andrey Zhizhikin
	<andrey.z@gmail.com>,  "Armin Kuster (akuster808@gmail.com)"
	<akuster808@gmail.com>
Date: Tue, 18 Feb 2020 08:14:11 +0000
In-Reply-To: <c753582b-0ba2-dbbe-df25-a9ea9cb184b6@electromag.com.au>
References: <e10c00e7-b64e-978a-6b2e-ffaa16577bbf@electromag.com.au>
	<CAHtQpK6MfQ2oheoPYv=PDJER8ThUd8Y_AuOtTQrbH_M8z+4Tdg@mail.gmail.com>
	<981f9211365c2dfc6da70b737f43f3e89d87f7d4.camel@linuxfoundation.org>
	<c753582b-0ba2-dbbe-df25-a9ea9cb184b6@electromag.com.au>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Tue, 18 Feb 2020 08:14:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-18 at 14:41 +0800, Phil Reid wrote:
> On 17/02/2020 17:55, Richard Purdie wrote:
> > On Mon, 2020-02-17 at 07:44 +0100, Andrey Zhizhikin wrote:
> > > On Mon, Feb 17, 2020 at 4:26 AM Phil Reid <
> > > preid@electromag.com.au>
> > > wrote:
> > > > Hi All,
> > > > 
> > > > I recently started get the following failure with bash after
> > > > "b348e31c93f0 bash: Fix CVE-2019-18276"
> > > > was applied to zeus.
> > > > 
> > > > Any thoughts?
> > > > 
> > > > 
> > > > NOTE: Applying patch 'bash50-001' (downloads/bash50-001)
> > > > NOTE: Applying patch 'bash50-002' (downloads/bash50-002)
> > > > NOTE: Applying patch 'bash50-003' (downloads/bash50-003)
> > > > NOTE: Applying patch 'bash50-004' (downloads/bash50-004)
> > > > NOTE: Applying patch 'bash50-005' (downloads/bash50-005)
> > > > NOTE: Applying patch 'bash50-006' (downloads/bash50-006)
> > > > NOTE: Applying patch 'bash50-007' (downloads/bash50-007)
> > > > NOTE: Applying patch 'execute_cmd.patch' (layers/openembedded-
> > > > core/meta/recipes-extended/bash/bash/execute_cmd.patch)
> > > > NOTE: Applying patch 'mkbuiltins_have_stringize.patch'
> > > > (layers/openembedded-core/meta/recipes-
> > > > extended/bash/bash/mkbuiltins_have_stringize.patch)
> > > > NOTE: Applying patch 'build-tests.patch' (layers/openembedded-
> > > > core/meta/recipes-extended/bash/bash/build-tests.patch)
> > > > NOTE: Applying patch 'test-output.patch' (layers/openembedded-
> > > > core/meta/recipes-extended/bash/bash/test-output.patch)
> > > > NOTE: Applying patch 'fix-run-builtins.patch'
> > > > (layers/openembedded-
> > > > core/meta/recipes-extended/bash/bash/fix-run-builtins.patch)
> > > > NOTE: Applying patch 'bash-CVE-2019-18276.patch'
> > > > (layers/openembedded-core/meta/recipes-extended/bash/bash/bash-
> > > > CVE-
> > > > 2019-18276.patch)
> > > > ERROR: Command Error: 'quilt --quiltrc
> > > > /home/preid/dev/linux/v2019.11/tmp-glibc/work/cortexa9t2hf-
> > > > neon-
> > > > emit-linux-gnueabi/bash/5.0-r0/recipe-sysroot-
> > > > native/etc/quiltrc
> > > > push' exited with 0  Output:
> > > > Applying patch bash-CVE-2019-18276.patch
> > > > patching file MANIFEST
> > > > patching file bashline.c
> > > > patching file builtins/help.def
> > > > patching file config.h.in
> > > > patching file configure
> > > > Hunk #1 FAILED at 10281.
> > > > 1 out of 1 hunk FAILED -- rejects in file configure
> > > > patching file configure.ac
> > > > patching file doc/bash.1
> > > > patching file doc/bashref.texi
> > > > patching file lib/glob/glob.c
> > > > patching file pathexp.c
> > > > patching file shell.c
> > > > patching file tests/glob.tests
> > > > patching file tests/glob6.sub
> > > > patching file tests/glob7.sub
> > > > Patch bash-CVE-2019-18276.patch does not apply (enforce with
> > > > -f)
> > > > DEBUG: Python function patch_do_patch finished
> > > > DEBUG: Python function do_patch finished
> > > 
> > > Had the same issue the day before, re-building bash clean solved
> > > it.
> > > At first I wanted to report it as well, but then after I tried "-
> > > c
> > > cleanall" - the issue was gone.
> > > 
> > > Try to do a clean build of bash and see if it is still
> > > reproducible.
> > 
> > I think I understand what happens here. When you do a rebuild,
> > bitbake
> > tries to pop off all the old patches, then apply the new ones.
> > 
> > In this case its patching configure which we rebuild. It therefore
> > can't apply the new patch to configure since its changed by the
> > do_configure task.
> > 
> > The fix is to remove the configure change from the patch since we
> > just
> > need the configure.ac piece.
> > 
> I've run "bitbake -c cleanall bash" and the build has then succeeded.
> I guess we wait and see if it pops up again when bash needs to be
> rebuilt.
> 
> I did try quickly hacking the patch and removing the configure patch
> section, but the resulting configure looked different. So I went with
> the easy option above.

Reproducing should be as simple as:

bitbake bash -c configure
bitbake bash -c patch -f

Cheers,

Richard




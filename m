Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id EF85760B19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 06:44:16 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id s10so15927560wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 22:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Id7wk/ZcWEnBIihBNaolnz3nfIln27eeXw9Q17aI970=;
	b=nCK8PkoUiwkOEo7oFfiHXO6GnAM2x3wtCKoB8DLrYWGpjbDfMkp8F5r/bPyOO4fpWP
	FArP9o34FfSRLXttbrrF9YiA9/q/j6eu2PGxzKyThncv2WRmbaNwNI8OMydxOr7IU9Wx
	gGAd5bG8K9YdzSi44Qb9UR0dO2lpVi/1Q1jQiKLnI3ctY3VeREFIKCJMyWFUzc43lV1f
	kV8ryoCmokvGqxKkb1AKB6HTzFK6vcrb5z6KkzsboUyS0oMyvaxVquMWQ9+1gnR9WKQs
	xUFi2aVVf4UQm7Ggn18tucIE86MJKdyIHTPQAMwg1oxaDMXmzo3MFCmrENtZ68LvEmZh
	2oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Id7wk/ZcWEnBIihBNaolnz3nfIln27eeXw9Q17aI970=;
	b=pgNtDaFfiAWRAS4xt+D9FCLWj5nqOSpC/4usyzb6QPq4aGLdL+Qy6Z0xQJMcGalXSE
	8zytGzpSkaBfOitPEDhe6LnCLYqEh00MEXPuVw56p5J8NRIUja0kRM1Uv8meaPR488WX
	GOUGiErTdXd0wJ26TtDOTwn8jBkNVU3h18AOPQhGZQUNu+lYKeomDY9HVpd4VhLJkg/G
	hXFXmk4BcPvWm9MrjfO9L5eEzdXXVlLSzTTeG45pxM2fxemAjKD8QLMpZyj1FbysgRfI
	ej+FLR9UQWwbzNSifcqQT/vmqGt5oawjwj1ZqpNI1YrE8+/znGLtOYaPe6PKD+2Yo2dB
	eKsg==
X-Gm-Message-State: APjAAAWsd5AGP7428VtwrM3pdHEBRWzSTn98cK6pmjUz2Q0fsnvECcQS
	OFKjYxSTpr4Lo1wMRg/hq8jiLVshA3Yk+kq4m8o=
X-Google-Smtp-Source: APXvYqzIamlw95noy601s0Yj+5Av8IGu+81qe17v8jkenJcGyv0iQcyaE3uPDcJwgatVmYdmH3T8lBYkrq+iKgBQkvE=
X-Received: by 2002:a1c:dfd6:: with SMTP id
	w205mr20893488wmg.151.1581921857425; 
	Sun, 16 Feb 2020 22:44:17 -0800 (PST)
MIME-Version: 1.0
References: <e10c00e7-b64e-978a-6b2e-ffaa16577bbf@electromag.com.au>
In-Reply-To: <e10c00e7-b64e-978a-6b2e-ffaa16577bbf@electromag.com.au>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 17 Feb 2020 07:44:06 +0100
Message-ID: <CAHtQpK6MfQ2oheoPYv=PDJER8ThUd8Y_AuOtTQrbH_M8z+4Tdg@mail.gmail.com>
To: Phil Reid <preid@electromag.com.au>
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
X-List-Received-Date: Mon, 17 Feb 2020 06:44:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 17, 2020 at 4:26 AM Phil Reid <preid@electromag.com.au> wrote:
>
> Hi All,
>
> I recently started get the following failure with bash after "b348e31c93f0 bash: Fix CVE-2019-18276"
> was applied to zeus.
>
> Any thoughts?
>
>
> NOTE: Applying patch 'bash50-001' (downloads/bash50-001)
> NOTE: Applying patch 'bash50-002' (downloads/bash50-002)
> NOTE: Applying patch 'bash50-003' (downloads/bash50-003)
> NOTE: Applying patch 'bash50-004' (downloads/bash50-004)
> NOTE: Applying patch 'bash50-005' (downloads/bash50-005)
> NOTE: Applying patch 'bash50-006' (downloads/bash50-006)
> NOTE: Applying patch 'bash50-007' (downloads/bash50-007)
> NOTE: Applying patch 'execute_cmd.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/execute_cmd.patch)
> NOTE: Applying patch 'mkbuiltins_have_stringize.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch)
> NOTE: Applying patch 'build-tests.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/build-tests.patch)
> NOTE: Applying patch 'test-output.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/test-output.patch)
> NOTE: Applying patch 'fix-run-builtins.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/fix-run-builtins.patch)
> NOTE: Applying patch 'bash-CVE-2019-18276.patch' (layers/openembedded-core/meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch)
> ERROR: Command Error: 'quilt --quiltrc
> /home/preid/dev/linux/v2019.11/tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/bash/5.0-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
> Applying patch bash-CVE-2019-18276.patch
> patching file MANIFEST
> patching file bashline.c
> patching file builtins/help.def
> patching file config.h.in
> patching file configure
> Hunk #1 FAILED at 10281.
> 1 out of 1 hunk FAILED -- rejects in file configure
> patching file configure.ac
> patching file doc/bash.1
> patching file doc/bashref.texi
> patching file lib/glob/glob.c
> patching file pathexp.c
> patching file shell.c
> patching file tests/glob.tests
> patching file tests/glob6.sub
> patching file tests/glob7.sub
> Patch bash-CVE-2019-18276.patch does not apply (enforce with -f)
> DEBUG: Python function patch_do_patch finished
> DEBUG: Python function do_patch finished

Had the same issue the day before, re-building bash clean solved it.
At first I wanted to report it as well, but then after I tried "-c
cleanall" - the issue was gone.

Try to do a clean build of bash and see if it is still reproducible.

>
> --
> Regards
> Phil Reid
>
> ElectroMagnetic Imaging Technology Pty Ltd
> Development of Geophysical Instrumentation & Software
> www.electromag.com.au
>
> 3 The Avenue, Midland WA 6056, AUSTRALIA
> Ph: +61 8 9250 8100
> Fax: +61 8 9250 7100
> Email: preid@electromag.com.au
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Regards,
Andrey.


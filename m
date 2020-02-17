Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 11EB360B23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 09:55:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w15so18874349wru.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 01:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=siprm046AGGPW8Gi7MqEtcIH1C089aHCt7Ll3GTrAR0=;
	b=cYDSRVfq6rc//5XYc6KAYXx9K+d56MOTzhvJ8YKqqy5DsJyer7VfPMGTpDuTKGxIBc
	k9kK05lw7+MgH/fmy3t6DMpq0KGX5WwrBFpLVKAygpoucyi+SYlopP6tq4OhmCdS2F3H
	XcZsMya5FCUpxDMLcnjJ15StEpAMSa3tCh904=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=siprm046AGGPW8Gi7MqEtcIH1C089aHCt7Ll3GTrAR0=;
	b=bBWQDbpaprw0hrvj0f5e9ghg7AxZhCJ50tovKUbBBxW3rpKLtXSCCzj/QHWBIVBy46
	YzhU+v/oA/zjAbK/V7uZz0z7VXFtW/LxICB+FR/3pPLnfQFteezL6dilxpHcQJ0i9kHn
	FfWIump83WcEamOvl7hEWwjwqsqh2eJsdir7smTsRM1EPXXxra2JXa/FopBiZUti1P/1
	LLGIt8LUIo9UePNAUzr5+jmgCf3+EPKxH//m1tO0PY2KRbbI+7dlorL8dgF/ox5OgMzy
	xIttUTrD9JWlCrymU3fKAAFaqhE7u3oH7UO3zKWtbDZpb4G43YAkFEfTVFWiKzzZKELj
	ijZA==
X-Gm-Message-State: APjAAAWr4BMu3lozZlblbrIDczI8f5RlYyCIoKHFeU5fmLeTKXmfmnKC
	vQ0zxwG0ZcL+3zzXthJeBBsWNQ==
X-Google-Smtp-Source: APXvYqzD3g74fIFHPoPO1bE1wjxmvNDOlOrjvva2rvfcfgqTiTKjpL7GBAbigoGiYMszmCQmNcivbg==
X-Received: by 2002:adf:90cb:: with SMTP id i69mr21719301wri.205.1581933309626;
	Mon, 17 Feb 2020 01:55:09 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t9sm160138wrv.63.2020.02.17.01.55.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 01:55:08 -0800 (PST)
Message-ID: <981f9211365c2dfc6da70b737f43f3e89d87f7d4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>, Phil Reid
	<preid@electromag.com.au>,  "Armin Kuster (akuster808@gmail.com)"
	<akuster808@gmail.com>
Date: Mon, 17 Feb 2020 09:55:06 +0000
In-Reply-To: <CAHtQpK6MfQ2oheoPYv=PDJER8ThUd8Y_AuOtTQrbH_M8z+4Tdg@mail.gmail.com>
References: <e10c00e7-b64e-978a-6b2e-ffaa16577bbf@electromag.com.au>
	<CAHtQpK6MfQ2oheoPYv=PDJER8ThUd8Y_AuOtTQrbH_M8z+4Tdg@mail.gmail.com>
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
X-List-Received-Date: Mon, 17 Feb 2020 09:55:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-17 at 07:44 +0100, Andrey Zhizhikin wrote:
> On Mon, Feb 17, 2020 at 4:26 AM Phil Reid <preid@electromag.com.au>
> wrote:
> > Hi All,
> > 
> > I recently started get the following failure with bash after
> > "b348e31c93f0 bash: Fix CVE-2019-18276"
> > was applied to zeus.
> > 
> > Any thoughts?
> > 
> > 
> > NOTE: Applying patch 'bash50-001' (downloads/bash50-001)
> > NOTE: Applying patch 'bash50-002' (downloads/bash50-002)
> > NOTE: Applying patch 'bash50-003' (downloads/bash50-003)
> > NOTE: Applying patch 'bash50-004' (downloads/bash50-004)
> > NOTE: Applying patch 'bash50-005' (downloads/bash50-005)
> > NOTE: Applying patch 'bash50-006' (downloads/bash50-006)
> > NOTE: Applying patch 'bash50-007' (downloads/bash50-007)
> > NOTE: Applying patch 'execute_cmd.patch' (layers/openembedded-
> > core/meta/recipes-extended/bash/bash/execute_cmd.patch)
> > NOTE: Applying patch 'mkbuiltins_have_stringize.patch'
> > (layers/openembedded-core/meta/recipes-
> > extended/bash/bash/mkbuiltins_have_stringize.patch)
> > NOTE: Applying patch 'build-tests.patch' (layers/openembedded-
> > core/meta/recipes-extended/bash/bash/build-tests.patch)
> > NOTE: Applying patch 'test-output.patch' (layers/openembedded-
> > core/meta/recipes-extended/bash/bash/test-output.patch)
> > NOTE: Applying patch 'fix-run-builtins.patch' (layers/openembedded-
> > core/meta/recipes-extended/bash/bash/fix-run-builtins.patch)
> > NOTE: Applying patch 'bash-CVE-2019-18276.patch'
> > (layers/openembedded-core/meta/recipes-extended/bash/bash/bash-CVE-
> > 2019-18276.patch)
> > ERROR: Command Error: 'quilt --quiltrc
> > /home/preid/dev/linux/v2019.11/tmp-glibc/work/cortexa9t2hf-neon-
> > emit-linux-gnueabi/bash/5.0-r0/recipe-sysroot-native/etc/quiltrc
> > push' exited with 0  Output:
> > Applying patch bash-CVE-2019-18276.patch
> > patching file MANIFEST
> > patching file bashline.c
> > patching file builtins/help.def
> > patching file config.h.in
> > patching file configure
> > Hunk #1 FAILED at 10281.
> > 1 out of 1 hunk FAILED -- rejects in file configure
> > patching file configure.ac
> > patching file doc/bash.1
> > patching file doc/bashref.texi
> > patching file lib/glob/glob.c
> > patching file pathexp.c
> > patching file shell.c
> > patching file tests/glob.tests
> > patching file tests/glob6.sub
> > patching file tests/glob7.sub
> > Patch bash-CVE-2019-18276.patch does not apply (enforce with -f)
> > DEBUG: Python function patch_do_patch finished
> > DEBUG: Python function do_patch finished
> 
> Had the same issue the day before, re-building bash clean solved it.
> At first I wanted to report it as well, but then after I tried "-c
> cleanall" - the issue was gone.
> 
> Try to do a clean build of bash and see if it is still reproducible.

I think I understand what happens here. When you do a rebuild, bitbake
tries to pop off all the old patches, then apply the new ones.

In this case its patching configure which we rebuild. It therefore
can't apply the new patch to configure since its changed by the
do_configure task.

The fix is to remove the configure change from the patch since we just
need the configure.ac piece.

Cheers,

Richard



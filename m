Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB67601F1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 18:42:45 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id t5-v6so7242396qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 11:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=qdb21MQdQhkW1K4OlLrRSsHLpsUW7P739PPU3/VcbIU=;
	b=J19v9gqtOfx1E9L3aB52MOdD7Q4gINBfNHrTHoe3iGUugnEQV/qxeXBQKvbj0XHMED
	f2uzEeTsW5HtmlESd2lWDWk2A1Ui7Xo+3LVxkRYUUNH2arVmfQ3b0ocfMtfCobJyiDbe
	NJYcHgH0+twFmZk4NBRvMIxX/cdp6ov1GROuNxPBPpexSpyo4C/cZm2v85u8ZoBeTeRY
	M+EPkKVtm6OTuFCaIUs9Xmddo9y/wHwAjHXNa/kJDpmJUfRO2THlk/+Nu6B8AmeV03AV
	pq0yc4GDO5PUGmSoxXVbZTj3u2q7TLVGpmjTfnmTpXzxggiwB3KURhxz5JHIPttx2p9g
	xcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=qdb21MQdQhkW1K4OlLrRSsHLpsUW7P739PPU3/VcbIU=;
	b=hrqxjeCiEF0OhZSUjPPDEy5grlqgDx3vfN21xE1Imzqmb/HyNVWC7PfNy6aecTTf+q
	K5A9ULXlJpZcxdIjuGL8QGiocxdxcwPgI0CNX6DbhsgEBIez6TlvQK/wOFWHz422J325
	+IFBGWHNRbiQiNyio9Al3LQlCB7duYJviespaJIXvN3j3OLnQwThgArfqFTK3W642FqV
	7jjBeqUjULQrmW1DyDJ/8l0RgoNWIHA5L7fzmuomNNg5m/eDdFhdmJVvb16GW9UyUDR4
	5v8JwR0wIbWcYlsGcyGrC7Rk8ekdtpDiHEb7WjrBeL/lEQDNGO+1zINIQZAyRRMvvrT3
	3JoA==
X-Gm-Message-State: AOUpUlEum9CgsJjpaEemrnQcr8TIUQCTvKQBLhkUxnxfctWkxKRb21FZ
	9GrVqCZF7oDK/JSuvWK6m3f4nfai7wWkWzglVfk8TA==
X-Google-Smtp-Source: AAOMgpfeXuiXWlI1+dGCF4F1RmzoUNscsEybxVzTmxyFx1VwCuGltsuwsjG+okbjG8fYq3MEYl3Wrmyxxs68Z/52iwQ=
X-Received: by 2002:ac8:91d:: with SMTP id
	t29-v6mr5089423qth.188.1533321766135; 
	Fri, 03 Aug 2018 11:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20180803182559.34019-1-raj.khem@gmail.com>
	<20180803183417.13841.2020@do.openembedded.org>
In-Reply-To: <20180803183417.13841.2020@do.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Aug 2018 11:42:20 -0700
Message-ID: <CAMKF1sqMkAFtFoFNP4AfXvCiPjuw6tLoKUX1h7kfSRPQXUN-MA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdsaWJjOiBVcGdyYWRlIHRvIDIuMjggKHJldjIp?=
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
X-List-Received-Date: Fri, 03 Aug 2018 18:42:45 -0000
Content-Type: text/plain; charset="UTF-8"

it seems patch scanner is confused here
On Fri, Aug 3, 2018 at 11:34 AM Patchwork
<patchwork@patchwork.openembedded.org> wrote:
>
> == Series Details ==
>
> Series: glibc: Upgrade to 2.28 (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/13377/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Patches not removed from tree [test_src_uri_left_files]
>   Suggested fix    Amend the patch containing the software patch file removal
>   Patch            0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
>   Patch            0014-yes-within-the-path-sets-wrong-config-variables.patch
>   Patch            0019-eglibc-Clear-cache-lines-on-ppc8xx.patch
>   Patch            0018-eglibc-Help-bootstrap-cross-toolchain.patch
>   Patch            0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
>   Patch            0015-timezone-re-written-tzselect-as-posix-sh.patch
>   Patch            0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
>   Patch            0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
>   Patch            0030-plural_c_no_preprocessor_lines.patch
>   Patch            0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
>   Patch            0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
>   Patch            0017-eglibc-Cross-building-and-testing-instructions.patch
>   Patch            0016-Remove-bash-dependency-for-nscd-init-script.patch
>   Patch            0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
>   Patch            0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
>   Patch            0013-Add-unused-attribute.patch
>   Patch            0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>


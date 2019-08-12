Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB0237D718
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 19:18:39 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id u3so70531657vsh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 12:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0EjkCaaHlvVeQYmZWJmLuAiQVXeubCMSm2QErTxlqmc=;
	b=i5ZCdUHfxyQxlYLe8PM99/wc5y9Z1YgRt30vHch7ap0XICdE9D9Ipif0gQ8T4UrDf9
	Nd0x7XuAcSTYyWU31k+1tdWf6IDj4uxq5PxcRa55dPN2vs63OPAjw8Hg7j3uuvxHPwmZ
	K9447Ukit+kaOIvtgVhJJIV3tDPIjbyRQ3UnjPLrYvxBAf4qgQQFPS/T8Oam/aOyLEcw
	j68hXH5tE6yAS4GPXySVip+a1bL5Au3ecDWjhIQx7MQ7F0txohARCR22XBWRRfEeZ1K3
	5gAXqe3Q7OWB36ReDiwhhGC0aVYyskrUeq4AJ0IrerspHX+/k8ZeWfuQBaBkDTY4L5nn
	4Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0EjkCaaHlvVeQYmZWJmLuAiQVXeubCMSm2QErTxlqmc=;
	b=dhm2utdTRfh6QfdWM8/1KBZNV/0z0vYhTqD5HmIHMHgLTR6D04xHc/ta9uSe/aHtGr
	/H4aX3vfOacHTPKleEoj4jkAF6tCeaMOF9sm6gH7wr8p1ZdbV4X06QDu+a2momwvYhxk
	2zIHyN/1URySNBAryo7GI99Pb8EfUaEyXWa/rcOEZNXw1rjcxYBKEaPtDY5qe+7HOzsP
	qsMltnjtBJbUHW2e2CqTCEQ1thhfe/l4g31bpOoigUYGHZj2YqAKviAhHd0H6rrOneZV
	IceeTFiP9HPqfxTtZJbBdFH5IhFFNwVUBpj9QBcHl3SPUi6nQ5UD2E3rzX4V0ZKtfbED
	ypFw==
X-Gm-Message-State: APjAAAVb/pPY2wAlBExzQAyuqamGjqw0EnTFHVIjPRPEdzzaM2b07vq7
	aGlte39D7Cihpis+I4zWedGj6zk9fFuq5pGl79U=
X-Google-Smtp-Source: APXvYqyjS6KqAH+E7iETPVSy41b2vnhyZqRDDuak2GPfl6JOX/1AGk7p3IblqVu9QYYccTPoXU/py66zATzZVjX99dM=
X-Received: by 2002:a67:e284:: with SMTP id g4mr16549841vsf.137.1565637519683; 
	Mon, 12 Aug 2019 12:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534791421.git.raj.khem@gmail.com>
	<2c5a62b8c4afe40ff2c0fbe2263e9c96d40b63d7.1534791421.git.raj.khem@gmail.com>
	<CAJ86T=UNpjZTn4NE1z7QYg5O4LmEihiA=vXF6gKg-8tSPBJ5jA@mail.gmail.com>
	<07b03e33-f21a-32a2-8c63-6de2db2724ee@gmail.com>
In-Reply-To: <07b03e33-f21a-32a2-8c63-6de2db2724ee@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 12 Aug 2019 12:18:28 -0700
Message-ID: <CAJ86T=UXg6_btLHfBYPdWtsAQ=4Lu9oWB05siSe2ODQNPtuVaA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] gdb: Alias rpl_stat to stat() on musl
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
X-List-Received-Date: Mon, 12 Aug 2019 19:18:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 12, 2019 at 11:55 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 8/12/19 11:12 AM, Andre McCurdy wrote:
> > On Mon, Aug 20, 2018 at 12:00 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Use CPPFLAGS instead of CFLAGS since there is C++ compiler being used for somefiles
> >>
> >> Fixes
> >> gdb/gdbserver/../../../gdb-8.1.1/gdb/gdbserver/../common/common-utils.c:419: undefined reference to `rpl_stat'
> >> | collect2: error: ld returned 1 exit status
> >> | make[4]: *** [Makefile:414: libinproctrace.so] Error 1
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>   meta/recipes-devtools/gdb/gdb_8.1.1.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-devtools/gdb/gdb_8.1.1.bb b/meta/recipes-devtools/gdb/gdb_8.1.1.bb
> >> index 84ab08ce93..c6eac84dd8 100644
> >> --- a/meta/recipes-devtools/gdb/gdb_8.1.1.bb
> >> +++ b/meta/recipes-devtools/gdb/gdb_8.1.1.bb
> >> @@ -26,4 +26,4 @@ EOF
> >>                  chmod +x ${WORKDIR}/python
> >>          fi
> >>   }
> >> -CFLAGS_append_libc-musl = " -Drpl_gettimeofday=gettimeofday"
> >> +CPPFLAGS_append_libc-musl = " -Drpl_gettimeofday=gettimeofday -Drpl_stat=stat"
> >
> > rpl_stat() is a wrapper for stat, so by forcefully redefining rpl_stat
> > to stat you create a local stat() function which recurses
> > infinitely... which causes obvious runtime problems (e.g. gdbserver
> > crashes on startup).
> >
> > Simply removing these additional CPPFLAGS fixes the runtime issues for
> > me (and doesn't trigger the original build failure so presumably
> > something has changed since the patch was originally created...).
> >
>
> I think setting CPPFLAGS is not right way and we can not fully remove it
> as well because in this case gnulib does not recognize musl as gnu
> system and detection logic is wrong for musl. So what we should do is
> remove the above CPPFLAGS settings and instead pass the cached values to
> configure
>
> CACHED_CONFIGUREVARS += "gl_cv_func_gettimeofday_clobber=no"
>
> for stat issue it has been fixed [1] so we can just drop it.
>
> [1]
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=3c025cfe5efc44eb4dfb03b53dca28e75096dd1e
>
> care to send a patch ?

Don't really have time right now. For the CACHED_CONFIGUREVARS tweaks
you should have a look at the Buildroot solution - it also has similar
fixes for strerror() and detection of prfpregset_t. They may be
applicable for OE too.


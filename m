Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7C56D74C97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:24:06 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id l82-v6so41280116oih.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v5u7pKplXL1aMiSb4aR0VtlSyCtcVRzyPFGzz54mJM0=;
	b=wdFEL5NMBjkVZMhphORBfD8WPp5YAPkKSdGN0mDxkDoKYsKsOqPK6G0q9jNH/Y5RMV
	oVt3+Xv98QIRWngHqr84zxfn6YW7fTGsTaQMKjIfONjznJCjd0ZfcUnlYN4Zj2y1h/hR
	8NHNCws3WHo2MDmk3nkUroFRfCtNRKILxUY6nK9+o3+XHuS6cGNo1k7pFi4UWgB4v73U
	mQk2kJE1b3CxE1ibIBucmrUT+a+z7aOwEFrk8oDYDVuZ5w2u9GaYpcTTyx4pfCeGKHZR
	aiSfN24OKz9Pp3TC85HqtMkZg9FlyhbXauQu2mMe8O9UUIlirQdykv0odsnw04Q3EUIR
	aywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v5u7pKplXL1aMiSb4aR0VtlSyCtcVRzyPFGzz54mJM0=;
	b=mXKQIgM5BbRmG/b5mnFl/Y9YIE7bDqkUS+AT0vUAyYAv+aZl0CGWOXQngf1dgQSuWF
	upbRfYctdLwOvx7CQlJ/wIARaUA3BHjzlDFFxxff439Yab7oCvhhXpGFrAfuWqjsuqU/
	fvtXL8bmaCPD6KkOQVCLX4Hvw8Lfy6NH4zreejsDwR3qMAwPAdhT1i8N9Efoi9rIWhnN
	wPGCDOSFLW5wMjwxobGc+Z8YTWGYSPyp35YKDicdbW4BVAzqUh8Ar5iRncpL8Wpm4UKm
	9gCrEt/DnnvMLpZZRl83oejzsn1OYQ9rDguNpLvNiPNnI2vSqOoBblFXYr3hb74GwmyN
	g8Ig==
X-Gm-Message-State: APzg51C5JYMzxUjaEma4KVN6KYLnOvD89/mTE0KSr02GuYdK4EKPjxUD
	tS6Karev0YA1fROi0fDNmNgvLE4DK120tpEO0yc4Mg==
X-Google-Smtp-Source: ANB0VdZSiiBU4My4OLcMgaOtVjMdFyprj/87iH55sD/rqpvYgs7bFUUmclWDux5O77hwpfkrPEDREswl6G1HV2sJRcU=
X-Received: by 2002:aca:c74d:: with SMTP id
	x74-v6mr20996638oif.97.1536596647532; 
	Mon, 10 Sep 2018 09:24:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Mon, 10 Sep 2018 09:23:46 -0700 (PDT)
In-Reply-To: <CAJTo0LZjqGXsS_6MD+F4PMsXBomTiyJPEVUT-TEZ9gJXCzBCMA@mail.gmail.com>
References: <20180910133123.22372-1-ross.burton@intel.com>
	<20180910133123.22372-2-ross.burton@intel.com>
	<CAMKF1so=k2qhez7uEwWS0saYnV+BJ+z=MjGdinhTKpzQYDw5dg@mail.gmail.com>
	<CAJTo0LZjqGXsS_6MD+F4PMsXBomTiyJPEVUT-TEZ9gJXCzBCMA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Sep 2018 17:23:46 +0100
Message-ID: <CAJTo0LYiiNJHRPXXxEzot8VL0CNak+UydbjT-_pdswNVbtmGvg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] python3: remove redundant patch
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
X-List-Received-Date: Mon, 10 Sep 2018 16:24:06 -0000
Content-Type: text/plain; charset="UTF-8"

Line-by-line breakdown of the patch:

> diff --git a/Makefile.pre.in b/Makefile.pre.in
> index 144c1f8629..f252ac2417 100644
> --- a/Makefile.pre.in
> +++ b/Makefile.pre.in
> @@ -223,6 +223,7 @@ LIBOBJS= @LIBOBJS@
>  PYTHON= python$(EXE)
>  BUILDPYTHON= python$(BUILDEXE)
> +HOSTPYTHON=    $(BUILDPYTHON)

New variable added.

>  PGEN= Parser/pgen$(EXE)
> +HOSTPGEN= $(PGEN)$(EXE)

New variable added.  My removal simple sets PGEN=/path/to/pgen-native instead.

>  run_profile_task:
>   : # FIXME: can't run for a cross build
> - $(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
> + $(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || true

We never use run_profile_task.

> @@ -772,7 +774,7 @@ regen-grammar: $(PGEN)
>   # Regenerate Include/graminit.h and Python/graminit.c
>   # from Grammar/Grammar using pgen
>   @$(MKDIR_P) Include
> - $(PGEN) $(srcdir)/Grammar/Grammar \
> + $(HOSTPGEN) $(srcdir)/Grammar/Grammar \

As my patch changes PGEN directly, this is redundant.

> -TESTPYTHON= $(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)
> +TESTPYTHON= $(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)

TESTPYTHON is only used by the following targets:
- coverage-report
- test
- testall
- testuniversal
- quicktest

We don't invoke any of those during a build.

>  TESTRUNNER= $(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
>  TESTTIMEOUT= 3600
> @@ -1470,7 +1472,7 @@ frameworkinstallstructure: $(LDLIBRARY)
>   fi; \
>   done
>   $(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
> - sed 's/%VERSION%/'"`$(RUNSHARED) ./$(BUILDPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
> + sed 's/%VERSION%/'"`$(RUNSHARED) $(HOSTPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist

This is MacOS-specific.

>  # Run reindent on the library
>  reindent:
> - ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
> + $(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib

We never invoke reindent (as this is for maintainers).

> @@ -1678,7 +1680,7 @@ funny:
>  # Perform some verification checks on any modified files.
>  patchcheck: @DEF_MAKE_RULE@
> - $(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
> + $(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
>  # Dependencies

We never invoke patchcheck (as this is for maintainers).

Ross


Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id C862B7973C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 17:36:09 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id g44-v6so25088940qtb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Uq9HhjhmEhX4WCzWP0UASw/yWnyw8THLiVxQcTPzDEE=;
	b=WOnlh/yEm5r4iSSigjwzCs2+nBe0jwi0VdjenBH8bJJYp8EfcvgfEj/YdhSkQLiMKe
	psd3oOBRQpArOmgrrc1z9FHHfh+r47HyKQ5dpSCtcAuHix61PZjacAZV0I7+ojQHQu9f
	iMrMxL0wR90ER3ZdKEp/kDWfIDZP9dh1KoMOREO2qdyggGdGZWb9rF7zHiDkGDaY2UCE
	uRmkaOfRN3Iv0kwNB+MQ7j1vGNA28/hH0cvTkI7Zu38fe94CxJIP23QwLa3ZPhiyOLCT
	SuNJKtyrSxFSmaO83Fut2sR0/5Jt9nIQk6RztlOCJDxxuzIKpWTzeJkoJ+mBaRTMFj8N
	CaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Uq9HhjhmEhX4WCzWP0UASw/yWnyw8THLiVxQcTPzDEE=;
	b=bRT5p0hTzEwwWxE11dvpefEA21MHmGB9z72uHYVznn6tFx6/d+1qnNxv+xBTwVAQpJ
	rv2GiqpzRlCS7lVcZ8ChzGVL1OOwJdYuAq1wFFHWKFhPP+KQ+/sPbZa+twaRr/xApuFJ
	cObHxCcmlLxPfbQu54jgk+c6oBj8liIXr90gHb5dfop+IFNe4IOPb6zJ/0954ARDOAEk
	7W38fUekaVnhK7BN03zHBGxL+89PiWVL2VJLERYpGWqrstLL0MaP5Q/eFJ/543hIU+1V
	/f9VzHkH45k/eNV3SKu8Ksp+f38IMXag8da2N2+bswUiNAO3EtayegerZBXw7dlQPVQ/
	0pag==
X-Gm-Message-State: APzg51A0y/3fKAgYB02URj5NtOEHlNpFRYvX4JR3TmX9uMrQTUP3+5HO
	u0K3uW0GoInOSsnpTzfV9hvbXlYGK/BJlPiughI=
X-Google-Smtp-Source: ANB0VdbaJcSQim5TptGgQY86sSeSemeGBtNeHzxPiY08mR3qeBpREuS2+jThQgt1ZxixyWj5SEsM7Ma4o3Iem5sISio=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr16615423qte.218.1536600970375; 
	Mon, 10 Sep 2018 10:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180910133123.22372-1-ross.burton@intel.com>
	<20180910133123.22372-2-ross.burton@intel.com>
	<CAMKF1so=k2qhez7uEwWS0saYnV+BJ+z=MjGdinhTKpzQYDw5dg@mail.gmail.com>
	<CAJTo0LZjqGXsS_6MD+F4PMsXBomTiyJPEVUT-TEZ9gJXCzBCMA@mail.gmail.com>
	<CAJTo0LYiiNJHRPXXxEzot8VL0CNak+UydbjT-_pdswNVbtmGvg@mail.gmail.com>
In-Reply-To: <CAJTo0LYiiNJHRPXXxEzot8VL0CNak+UydbjT-_pdswNVbtmGvg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Sep 2018 10:35:44 -0700
Message-ID: <CAMKF1sqdZQAcLCWhD=p=oftp9O93j7g2FN3gBpt+S6qSdDLrPw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Mon, 10 Sep 2018 17:36:10 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for the clarification. It seems to be fine then
On Mon, Sep 10, 2018 at 9:24 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Line-by-line breakdown of the patch:
>
> > diff --git a/Makefile.pre.in b/Makefile.pre.in
> > index 144c1f8629..f252ac2417 100644
> > --- a/Makefile.pre.in
> > +++ b/Makefile.pre.in
> > @@ -223,6 +223,7 @@ LIBOBJS= @LIBOBJS@
> >  PYTHON= python$(EXE)
> >  BUILDPYTHON= python$(BUILDEXE)
> > +HOSTPYTHON=    $(BUILDPYTHON)
>
> New variable added.
>
> >  PGEN= Parser/pgen$(EXE)
> > +HOSTPGEN= $(PGEN)$(EXE)
>
> New variable added.  My removal simple sets PGEN=/path/to/pgen-native instead.
>
> >  run_profile_task:
> >   : # FIXME: can't run for a cross build
> > - $(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
> > + $(LLVM_PROF_FILE) $(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK) || true
>
> We never use run_profile_task.
>
> > @@ -772,7 +774,7 @@ regen-grammar: $(PGEN)
> >   # Regenerate Include/graminit.h and Python/graminit.c
> >   # from Grammar/Grammar using pgen
> >   @$(MKDIR_P) Include
> > - $(PGEN) $(srcdir)/Grammar/Grammar \
> > + $(HOSTPGEN) $(srcdir)/Grammar/Grammar \
>
> As my patch changes PGEN directly, this is redundant.
>
> > -TESTPYTHON= $(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)
> > +TESTPYTHON= $(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)
>
> TESTPYTHON is only used by the following targets:
> - coverage-report
> - test
> - testall
> - testuniversal
> - quicktest
>
> We don't invoke any of those during a build.
>
> >  TESTRUNNER= $(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
> >  TESTTIMEOUT= 3600
> > @@ -1470,7 +1472,7 @@ frameworkinstallstructure: $(LDLIBRARY)
> >   fi; \
> >   done
> >   $(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
> > - sed 's/%VERSION%/'"`$(RUNSHARED) ./$(BUILDPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
> > + sed 's/%VERSION%/'"`$(RUNSHARED) $(HOSTPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
>
> This is MacOS-specific.
>
> >  # Run reindent on the library
> >  reindent:
> > - ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
> > + $(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
>
> We never invoke reindent (as this is for maintainers).
>
> > @@ -1678,7 +1680,7 @@ funny:
> >  # Perform some verification checks on any modified files.
> >  patchcheck: @DEF_MAKE_RULE@
> > - $(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
> > + $(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
> >  # Dependencies
>
> We never invoke patchcheck (as this is for maintainers).
>
> Ross


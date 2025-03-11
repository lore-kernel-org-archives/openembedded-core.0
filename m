Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD99C35FF1
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:53 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.17349.1741716949721193438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YGtE0asF;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72737740673so2917794a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 11:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741716949; x=1742321749; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/GQKoa5gempLaLpDbopxDqY/TiBkvJYXQAVoGk8j+4=;
        b=YGtE0asFooENrR3NGR2MtdzO1D+RdWn7kgprhdjSYcF5DqbAA5szfy9I1eFclPcagK
         YIvDQ67OCN6YPt49rZNWwXeuF3sIqRgw1Q+7VwjnS+uDzkzEYoB9+lgVPsBACz6ywBo/
         wdiT8UqHcp5qqgZiLdRx9686KnF8G91VTRekcMtwsIpI8+XUlU010KxBQ6EbSJjJ8MFC
         Hrhnsmcqr7ReQiaIAVFA7P67ExIga5N2pMMFEavGscquVjvWRotaXh9loFBMazxzg0pL
         fdhHbJW8VlqBvgiZIc/tlMnoSGON638ddLbgnT8JVpkodAt6l0bVsIB2m+3qFPhXZI/t
         yV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741716949; x=1742321749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/GQKoa5gempLaLpDbopxDqY/TiBkvJYXQAVoGk8j+4=;
        b=QdUYKRTRWkJjYqWNGQ+BrvN3SI7xOrwC7rwvKEhzTG/Frot04pwb+BKweezVGDxJUR
         CvrvL/A0jbRtZNeJcApOjNW91L/hY4g5o2bzOgdPSjoNXT/Gy0Pf0mNys9qcyH9D3fhR
         +0leohzwnVSSjmHvBQ4UsDo5I/xE+RjqdShEj+tNnthzjWaIGw2sKGvPV8xXmqTsKN0H
         2yB/k6sfduGxPC8Y9iO9+kp9Cyx9320qNSyra0TUChAj9lgNJpDA03Cu+U9hK7EP4ytE
         ioG7lVIXG6id9945W9fKg1S525LS4I/8JesBoncr0knJ169cZbmTSYyCe+nc68JjRks8
         QoIg==
X-Forwarded-Encrypted: i=1; AJvYcCVKBhfxb22mMfVcEviC7jnWjszteC8+UrOBrrPSF7mDpRNgj2pS/WYlffyA2gDZ3pwEXhZlNSDr0uM1Mi/YfNnrNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxpw2/UCKfu1EkfpBmg45mrS4yTmXchxrbCP5dJ9GY1zQGtsVKP
	APeppETg/eSaVxdL0/C40HOwSqW9c3G2nbuUVoOKsOabaJnWx3jjFCf8eFO8Fn8NdjE0bWsan74
	KdfOCtVi+s4Kql8G44NbebL1Indw=
X-Gm-Gg: ASbGncsw9U0XHVX45Oelk9S1G674tYvXizRqKemn39dFlnWbbAHq1ELknSnDTrFd4dK
	mSNO8KU5K6C1bSPChpm0sVAKOnTPhMMoL8Zoo2CsTQuiA0gMXY/dtfcO65pEDOl4BlY9jGj3d9L
	9Kk5PeJ24GgUsCCFdo7o04kZ7y+jL4lh5xkazy5EF6RbbBY+TvP3Fs8r3M1lebc1DZaQ==
X-Google-Smtp-Source: AGHT+IHw/hwErA9knopRdoa3Jsre6tOHOM+5vPzmm0R46To/lLySRrUM4FJowCQfV9lYXrOlAw8yTb+xClE92sEyVdg=
X-Received: by 2002:a05:6808:343:b0:3f6:a400:81f5 with SMTP id
 5614622812f47-3f6a400834cmr5834012b6e.11.1741716948852; Tue, 11 Mar 2025
 11:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250307163724.3459192-1-f_l_k@t-online.de> <3ebbe1b5e26f764636ec34c4acebe4d8a588386f.camel@linuxfoundation.org>
 <182B144118A90ED3.31525@lists.openembedded.org> <VAQYSS.10I1DUCUOUO4@t-online.de>
In-Reply-To: <VAQYSS.10I1DUCUOUO4@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Mar 2025 11:15:22 -0700
X-Gm-Features: AQ5f1JqXDXt9QV5cJ3rtXO2alJuC9JbLESXPvR6I6zXI3hMTnN-JWRughc3Ruls
Message-ID: <CAMKF1so=gW_+vcioLsq9A7pYWrHhR-tzQRR3UbMy=Uio-J9n+g@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] glib-2.0: update 2.82.4 -> 2.84.0
To: f_l_k@t-online.de
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212609

On Tue, Mar 11, 2025 at 7:15=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Here is what I found out after looking at the problem with the glib ptest
> I did run the ptest on my yocto-based image booted from an USB drive like=
 this:
>
> sudo ptest-runner glib-2.0 > glib.log
>
> There were two faulty tests
>
> SUMMARY: total=3D291; passed=3D289; skipped=3D0; failed=3D2; user=3D233.4=
s; system=3D126.5s; maxrss=3D516636
> FAIL: glib/gi-compile-repository.py.test (Child process exited with code =
1)
> FAIL: glib/static-link.test (Child process exited with code 1)
>
> As for the first issue, I think the main problem is that the files in /us=
r/share/gir-1.0 are not installed and thus
> the compilation test fails:
>
> Running test: glib/gi-compile-repository.py.test
> TAP version 13
> ok 1 __main__.TestGICompileRepository.test_open_failure
> # gir path set to [PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share=
/gir-1.0')]
> # gi-compile-repository: /bin/gi-compile-repository
> # tmpdir: /tmp/tmphbnveywd
> # Running: ['/bin/gi-compile-repository', 'this-is/not/a-file.gir', '--ou=
tput', '/tmp/tmphbnveywd/invalid.typelib']
> # Return code: 1
> # Output:
> #
> # Error:
> #  Error parsing file =D0=B2=D0=82 this-is/not/a-file.gir=D0=B2=D0=82=E2=
=84=A2: Failed to open file =D0=B2=D0=82=D1=9Athis-is/not/a-file.gir=D0=B2=
=D0=82=D1=9C: No such file or directory
> not ok 2 __main__.TestGICompileRepositoryForGLib.test_compile
> # gir path set to [PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share=
/gir-1.0')]
> # gi-compile-repository: /bin/gi-compile-repository
> # tmpdir: /tmp/tmpe1jgjuiz
>   ---
>     message: |
>       Traceback (most recent call last):
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 98, in test_compile
>           result =3D self.runTestProgram(argv)
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 72, in runTestProgram
>           self.fail(f"Could not find {self.GIR_NAME}.gir in {self._gir_pa=
ths}")
>           ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^
>       AssertionError: Could not find GLib-2.0.gir in [PosixPath('/usr/sha=
re/gir-1.0'), PosixPath('/usr/share/gir-1.0')]
>   ...
> not ok 3 __main__.TestGICompileRepositoryForGLib.test_write_failure
> # gi-compile-repository: /bin/gi-compile-repository
> # tmpdir: /tmp/tmpuw8gkqkv
>   ---
>     message: |
>       Traceback (most recent call last):
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 85, in test_write_failure
>           result =3D self.runTestProgram(
>               ["--output", typelib_path],
>               should_fail=3DTrue,
>           )
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 72, in runTestProgram
>           self.fail(f"Could not find {self.GIR_NAME}.gir in {self._gir_pa=
ths}")
>           ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^
>       AssertionError: Could not find GLib-2.0.gir in [PosixPath('/usr/sha=
re/gir-1.0'), PosixPath('/usr/share/gir-1.0')]
>   ...
> not ok 4 __main__.TestGICompileRepositoryForGObject.test_compile
> # gir path set to [PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share=
/gir-1.0')]
> # gi-compile-repository: /bin/gi-compile-repository
> # tmpdir: /tmp/tmphw3q1vf2
>   ---
>     message: |
>       Traceback (most recent call last):
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 98, in test_compile
>           result =3D self.runTestProgram(argv)
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 72, in runTestProgram
>           self.fail(f"Could not find {self.GIR_NAME}.gir in {self._gir_pa=
ths}")
>           ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^
>       AssertionError: Could not find GObject-2.0.gir in [PosixPath('/usr/=
share/gir-1.0'), PosixPath('/usr/share/gir-1.0')]
>   ...
> not ok 5 __main__.TestGICompileRepositoryForGObject.test_write_failure
> # gi-compile-repository: /bin/gi-compile-repository
> # tmpdir: /tmp/tmp2ad5g34h
>   ---
>     message: |
>       Traceback (most recent call last):
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 85, in test_write_failure
>           result =3D self.runTestProgram(
>               ["--output", typelib_path],
>               should_fail=3DTrue,
>           )
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 72, in runTestProgram
>           self.fail(f"Could not find {self.GIR_NAME}.gir in {self._gir_pa=
ths}")
>           ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^
>       AssertionError: Could not find GObject-2.0.gir in [PosixPath('/usr/=
share/gir-1.0'), PosixPath('/usr/share/gir-1.0')]
>   ...
> not ok 6 __main__.TestGICompileRepositoryForGio.test_compile
> # gir path set to [PosixPath('/usr/share/gir-1.0'), PosixPath('/usr/share=
/gir-1.0')]
> # gi-compile-repository: /bin/gi-compile-repository
> # tmpdir: /tmp/tmp5shfyrv4
>   ---
>     message: |
>       Traceback (most recent call last):
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 98, in test_compile
>           result =3D self.runTestProgram(argv)
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 72, in runTestProgram
>           self.fail(f"Could not find {self.GIR_NAME}.gir in {self._gir_pa=
ths}")
>           ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^
>       AssertionError: Could not find Gio-2.0.gir in [PosixPath('/usr/shar=
e/gir-1.0'), PosixPath('/usr/share/gir-1.0')]
>   ...
> not ok 7 __main__.TestGICompileRepositoryForGio.test_write_failure
> # gi-compile-repository: /bin/gi-compile-repository
> # tmpdir: /tmp/tmpzl3y3tcj
>   ---
>     message: |
>       Traceback (most recent call last):
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 85, in test_write_failure
>           result =3D self.runTestProgram(
>               ["--output", typelib_path],
>               should_fail=3DTrue,
>           )
>         File "/usr/libexec/installed-tests/glib/gi-compile-repository.py"=
, line 72, in runTestProgram
>           self.fail(f"Could not find {self.GIR_NAME}.gir in {self._gir_pa=
ths}")
>           ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^
>       Assertion
>
> Adding IMAGE_INSTALL:append =3D =D0=B2=D0=82=D1=9A glib-2.0-dev=D0=B2=D0=
=82=D1=9C to local.conf fixed the problem
> I'm pretty confident that this was enough, but I'm not entirely sure thou=
gh, as I'm running in my local build with
> updated gobject-introspection and, to unbreak vapi, also with updated val=
a.
>
> For the second failed test I assume that it was already broken before and=
 the fail is reasonable ?
>
> This test is bloated. It compiles glib and tries to link it statically.
> Since it has heavy runtime requirements (pkgconfig meson ninja gcc and al=
l glib dependencies with support for static)
> it is guarded by an env variable GLIB_TEST_COMPILATION
>

you can add packagegroup-core-buildessential to dependency list and so
on but I think static linking glib-2.0 is
rare case for OE, so perhaps skipping this test might be fine.

> If thats not in env (the current state) the test doesn't do anything but =
exits with '77'.
> https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/tests/static-link.py#=
L35
>
> test can be activated by editing glib run-ptest file like this:
> su glib2-test -c 'G_TEST_TMPDIR=3D`readlink -f /tmp` GLIB_TEST_COMPILATIO=
N=3D1 gnome-desktop-testing-runner glib'
>
> The test then compiles glib and fails because it cannot find any statical=
ly linked libraries.
> Source dir: /usr/libexec/installed-tests/glib/static-link
> Build dir: /tmp/tmpvt9w2_ri
> Build type: native build
> Project name: test-static-link
> Project version: undefined
> C compiler for the host machine: ccache cc (gcc 14.2.0 "cc (GCC) 14.2.0")
> C linker for the host machine: cc ld.bfd 2.44
> Host machine cpu family: x86_64
> Host machine cpu: x86_64
> Found pkg-config: YES (/bin/pkg-config) 0.29.2
> WARNING: Static library 'gio-2.0' not found for dependency 'gio-2.0', may=
 not be statically linked
> WARNING: Static library 'gmodule-2.0' not found for dependency 'gio-2.0',=
 may not be statically linked
> WARNING: Static library 'z' not found for dependency 'gio-2.0', may not b=
e statically linked
> WARNING: Static library 'mount' not found for dependency 'gio-2.0', may n=
ot be statically linked
> WARNING: Static library 'blkid' not found for dependency 'gio-2.0', may n=
ot be statically linked
> WARNING: Static library 'gobject-2.0' not found for dependency 'gio-2.0',=
 may not be statically linked
> WARNING: Static library 'ffi' not found for dependency 'gio-2.0', may not=
 be statically linked
> WARNING: Static library 'glib-2.0' not found for dependency 'gio-2.0', ma=
y not be statically linked
> WARNING: Static library 'atomic' not found for dependency 'gio-2.0', may =
not be statically linked
> WARNING: Static library 'pcre2-8' not found for dependency 'gio-2.0', may=
 not be statically linked
> Run-time dependency gio-2.0 found: YES 2.84.0
> Build targets in project: 1
>
> Found ninja-1.12.1 at /bin/ninja
> WARNING: Running the setup command as `meson [options]` instead of `meson=
 setup [options]` is ambiguous and deprecated.
> ninja: Entering directory `/tmp/tmpvt9w2_ri'
> [1/3] Compiling C object test-static-link.p/app.c.o
> [2/3] Linking target test-static-link
> [2/3] Running all tests
> 1/1 test-static-link OK              0.00s
>
> Ok:                 1
> Expected Fail:      0
> Fail:               0
> Unexpected Pass:    0
> Skipped:            0
> Timeout:            0
>
> Full log written to /tmp/tmpvt9w2_ri/meson-logs/testlog.txt
> test-static-link is dynamically linked on libgio
> FAIL: glib/static-link.test (Child process exited with code 1)
>
> I assume that's reasonable because we dont support it?
>
> On Sun, Mar 9 2025 at 09:13:10 +01:00:00, Markus Volk <f_l_k@t-online.de>=
 wrote:
>
> Yes, sorry.
>
> v2 fixed only the installed-vs-shipped issue I have seen if building with=
out PACKAGECONFIG[test]
>
> I'll have a look at the ptest issue tomorrow.
>
> On Sat, Mar 8 2025 at 18:07:12 +00:00:00, Richard Purdie via lists.openem=
bedded.org <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wr=
ote:
>
> On Fri, 2025-03-07 at 17:37 +0100, Markus Volk via lists.openembedded.org=
 wrote:
>
> - Add option for tests to prevent them from being built without PACKAGECO=
NFIG[tests] being selected
>
> The v2 still has ptest failures: https://autobuilder.yoctoproject.org/val=
kyrie/#/builders/61/builds/1074 https://autobuilder.yoctoproject.org/valkyr=
ie/#/builders/73/builds/1077 Cheers, Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212572): https://lists.openembedded.org/g/openembedde=
d-core/message/212572
> Mute This Topic: https://lists.openembedded.org/mt/111570638/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


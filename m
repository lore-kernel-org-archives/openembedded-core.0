Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.819.1608316358992825735
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 10:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=najgIefk;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id n26so4600561eju.6
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 10:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NrCoKMz0BTzBjJxGXyjFdk6KxO61FGyNMiVS4DuaU14=;
        b=najgIefkRlUyQ8Yw0GR0V8Ww19tsgWP9s+sBbCrrbp2z8nLJGWUAiJ7upPhqIkdznF
         e9SpZ9NQhXfZqjbAemBT/COwHN+TCo+9R+xXhR+eN6+zgtKQCY7EHgLmLNyR/jSAd5Fh
         uXltKmx4jKoAbBUfHQ/LeS2LCjOO7N550KYbZY9eHqmLPSI5q83GLyP6K3KfC7QW678z
         l34623YkSHhZ/yeDBpq/5Dz2zpu775LSrq3JqVQ6zsuLgC+xCgFWW7fhnIuqljOkou1A
         HZP/z3gtNpeAyokq1lOvPg6cNXblDVlqt0OdTPkcqg7i+WxMcIgURQ9UzH+itLjEnur5
         BGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NrCoKMz0BTzBjJxGXyjFdk6KxO61FGyNMiVS4DuaU14=;
        b=KB9w/0kTOf4IYfgiPGKdcbWJL+lmNyHgKPJskTfqBm1vR7Lgl4Rvbd4z6NEqiLLo2b
         RpAFft3l3gTmuM1PIyJr1ZA44vHGMnTBGjPUgkhVHEs5TUxoLR3U6R3QHJd55G+miGib
         R0fL0yhV0sJ8MY+k80+dn72QkiBgwGvQjOb9lcPpUJ9/jx2ISRqC0nFt/SSOihd7OWJb
         r1k12Z6cP2rlUB4YZdZ3yyQzoY9kjo2tcDIs8hTfc4i2wlqKZ2EGZBMWjsJljZjPgMq5
         aqGFx7it2R13uxWsPpu9bDUU/rjK+OebyOtLmI+HX+ok4DvRbLMN5U0u1eM+5e7gJclt
         JsRg==
X-Gm-Message-State: AOAM530VQpoBHtkN0XrWGk4sOXpWnML+cYwgM+3UAaOTu6GC8kFJ+9AE
	3Qfge1b+A6iOjeqYORBnTsVVOHkJwFE4thAzUDo=
X-Google-Smtp-Source: ABdhPJzfb68DVPipfNGJPsC6A5j3Y9RgUP1UZc8fvVgROAbh4nbFllOQ37eNoGq150eZArMLrP9fL5eUfOQFpCvzwgc=
X-Received: by 2002:a17:907:373:: with SMTP id rs19mr5155503ejb.298.1608316357551;
 Fri, 18 Dec 2020 10:32:37 -0800 (PST)
MIME-Version: 1.0
References: <1606218546-115087-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <CAPLtV=qtux0nP429iJqRTCFRpfHN3B8_fpNPSaeGqreWJFK=Dg@mail.gmail.com>
 <164D60671E1EC649.7952@lists.openembedded.org> <bcd9f08662984ddaa8923c0d3fe13d4c@G08CNEXMBPEKD04.g08.fujitsu.local>
 <164ECF710AF4F2C7.7121@lists.openembedded.org> <1651DE8C575A1C22.25723@lists.openembedded.org>
In-Reply-To: <1651DE8C575A1C22.25723@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 18 Dec 2020 13:32:26 -0500
Message-ID: <CADkTA4MTeeagvkTK6tki9SWYef9ewXhByz9raiAVBC1Mz84M4g@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: zangrc <zangrc.fnst@cn.fujitsu.com>, 
	Leonardo Sandoval <leonardo.sandoval@linaro.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 12:07 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Tue, Dec 8, 2020 at 12:56 PM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > If that symbol is required, then we'd need to add it to the
> > appropriate fragment in the
> > reference kernel configurations (kernel-cache), and make sure it is
> > built into the
> > various kernel types.
> >
> > Changes like that are submitted to the linux-yocto mailing list.
> >
> > That being said, I went and looked at the error, and the .c that
> > defines the missing
> > symbol is security.c, which is controlled by CONFIG_SECURITY, not
> > CONFIG_SECURITY_LOCKDOWN_LSM. And that option is already enabled in
> > all kernel types.
> >
> > It looks more like a missing .h, versus a missing option to me.
> >
> > Have you looked at the systemtap source for an include of security.h,
> > and traced why
> > it wouldn't be finding the function definition ?
> >
> > If this is the on-target build, versus a cross build test, then maybe
> > we are missing the
> > copy of a .h to the target (but you'd think that we'd get a more
> > obvious compile error
> > if a .h wasn't found).
>
>
> FYI. My 5.10 kernel testing has run into this issue, so I've grabbed
> the uprev patch and am working on a fix.
>
> If someone else already has it done, let me know and I'll happily take
> their fix :D

I have this fixed, and will include it in my next pull request:

root@qemux86-64:/tmp# stap --disable-cache -DSTP_NO_VERREL_CHECK /tmp/hell=
o.stp
[   99.940036] Kprobes globally unoptimized
[   99.942537] stap_4280: loading out-of-tree module taints kernel.
hello world

root@qemux86-64:/tmp# uname -a
Linux qemux86-64 5.10.1-yocto-standard #1 SMP PREEMPT Thu Dec 17
17:33:21 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

Bruce

>
> Bruce
>
> >
> > Bruce
> >
> > On Mon, Dec 7, 2020 at 10:03 PM zangrc <zangrc.fnst@cn.fujitsu.com> wr=
ote:
> > >
> > > Ping
> > >
> > >
> > >
> > > From: openembedded-core@lists.openembedded.org <openembedded-core@li=
sts.openembedded.org> On Behalf Of zangrc
> > > Sent: Friday, December 4, 2020 9:51 AM
> > > To: Leonardo Sandoval <leonardo.sandoval@linaro.org>
> > > Cc: openembedded-core@lists.openembedded.org
> > > Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4=
.4
> > >
> > >
> > >
> > > I think this problem should be because the kernel does not enable CO=
NFIG_SECURITY_LOCKDOWN_LSM,
> > >
> > > do you need me to submit a patch to open this option of the kernel?
> > >
> > >
> > >
> > > Zangrc
> > >
> > >
> > >
> > > From: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98
> > > Sent: Thursday, November 26, 2020 2:18 PM
> > > To: 'Leonardo Sandoval' <leonardo.sandoval@linaro.org>
> > > Cc: openembedded-core@lists.openembedded.org
> > > Subject: RE: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4=
.4
> > >
> > >
> > >
> > > I will investigate, it may take some time, if the error is resolved,=
 I will send a patch to the mailing list.
> > >
> > >
> > >
> > > zangrc
> > >
> > >
> > >
> > > From: Leonardo Sandoval <leonardo.sandoval@linaro.org>
> > > Sent: Thursday, November 26, 2020 6:09 AM
> > > To: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 <zangrc.fnst@cn.fujit=
su.com>
> > > Cc: openembedded-core@lists.openembedded.org
> > > Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4=
.4
> > >
> > >
> > >
> > > Hi Zangrc,
> > >
> > >
> > >
> > > this patch is now in master-next
> > >
> > >
> > >
> > >   https://patchwork.openembedded.org/series/27030/
> > >
> > >
> > >
> > > but autobuilder detected a compilation error in the upgraded version
> > >
> > >
> > >
> > >   https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/=
2736/steps/13/logs/stdio
> > >
> > >
> > >
> > > Can you please take a look? (seems like a C macro is not defined).
> > >
> > >
> > >
> > > Thanks,
> > >
> > >
> > >
> > > lsg
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > On Mon, 23 Nov 2020 at 20:08, zangrc <zangrc.fnst@cn.fujitsu.com> wr=
ote:
> > >
> > > The test log of oe-selftest is as follows:
> > > 2020-11-23 15:48:49,144 - oe-selftest - INFO - test_crosstap_hellowo=
rld (runtime_test.SystemTap)
> > > 2020-11-23 17:06:55,949 - oe-selftest - INFO -  ... ok
> > > 2020-11-23 17:06:55,951 - oe-selftest - INFO - test_crosstap_pstree =
(runtime_test.SystemTap)
> > > 2020-11-23 17:08:07,921 - oe-selftest - INFO -  ... ok
> > > 2020-11-23 17:08:07,922 - oe-selftest - INFO - test_crosstap_syscall=
s_by_pid (runtime_test.SystemTap)
> > > 2020-11-23 17:09:20,084 - oe-selftest - INFO -  ... ok
> > > 2020-11-23 17:09:20,085 - oe-selftest - INFO - test_crosstap_syscall=
s_by_proc (runtime_test.SystemTap)
> > > 2020-11-23 17:10:31,349 - oe-selftest - INFO -  ... ok
> > > 2020-11-23 17:12:58,052 - oe-selftest - INFO - ---------------------=
-------------------------------------------------
> > > 2020-11-23 17:12:58,054 - oe-selftest - INFO - Ran 4 tests in 5051.5=
37s
> > > 2020-11-23 17:12:58,054 - oe-selftest - INFO - OK
> > > 2020-11-23 17:13:08,416 - oe-selftest - INFO - RESULTS:
> > > 2020-11-23 17:13:08,417 - oe-selftest - INFO - RESULTS - runtime_tes=
t.SystemTap.test_crosstap_helloworld: PASSED (4686.81s)
> > > 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_tes=
t.SystemTap.test_crosstap_pstree: PASSED (71.97s)
> > > 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_tes=
t.SystemTap.test_crosstap_syscalls_by_pid: PASSED (72.16s)
> > > 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_tes=
t.SystemTap.test_crosstap_syscalls_by_proc: PASSED (71.26s)
> > > 2020-11-23 17:13:08,432 - oe-selftest - INFO - SUMMARY:
> > > 2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest () - Ran =
4 tests in 5051.540s
> > > 2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest - OK - Al=
l required tests passed (successes=3D4, skipped=3D0, failures=3D0, errors=
=3D0)
> > >
> > > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > > ---
> > >  meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/=
recipes-kernel/systemtap/systemtap_git.inc
> > > index 56fa51d61e..ae735025b7 100644
> > > --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> > > +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> > > @@ -1,7 +1,7 @@
> > >  LICENSE =3D "GPLv2"
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fd=
af4a4263"
> > > -SRCREV =3D "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
> > > -PV =3D "4.3"
> > > +SRCREV =3D "988f439af39a359b4387963ca4633649866d8275"
> > > +PV =3D "4.4"
> > >
> > >  SRC_URI =3D "git://sourceware.org/git/systemtap.git \
> > >             file://0001-Do-not-let-configure-write-a-python-location=
-into-th.patch \
> > > --
> > > 2.25.1
> > >
> > >
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.1695.1608311235791376084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 09:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xmu+KaRn;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id q22so4254983eja.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 09:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5sP5uzHEUApHAMXGvb1VnWQr3rgZqOCAJ9mNOjMo0+Q=;
        b=Xmu+KaRn7tMJ8en0Omd8OgO2PEzgSPPuJl+ptTa6m97nzx4ZAc3aEd92NbAjfbp77C
         r43+vwECHi2nR2+LVMCnJB6vD1WtHq4FK6L3f5NRJfuJnWRVWSXCOzqk4ZOgxQSqSubK
         pAJZyylRF2wKUsR2IkZPh3xyrdSOMt/TgqIKd0wCrzZ7GHdKUahfBIz2u2eIxP/u9G4x
         a4S20Yb5o1w46TV5j4Qwd6eKqR8IqPP7NttZ5IVCWjqp2V0I7o7GVLaDL5tvrNvzId18
         vf5LcMtYpUijCERiFVHfIlsHjlNi0R/ywRqhJarRhqPl8zUAxnyx6Z234UDdy9qjTI7u
         lcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5sP5uzHEUApHAMXGvb1VnWQr3rgZqOCAJ9mNOjMo0+Q=;
        b=pwoFg0Oj/Yb6hST8MWmHCEu438V6COo6BwZxo5v1V2Vx7TqGPsKpO1qvYSNt1Zy8ua
         7KE5sVFJcYAdh4gvjmGhVqJATHvpd7QVdYhHg3+WGFv2/J2TA+b1986C3qs2061RZUyv
         UO6CbvhjIdHzCLW9ORrMKHgzi/0iB73McZM6HCiQ79D1XP8Dq1qpsTeejg5LKF1cVlDV
         BSEWM4f12b0V0VipbIt4Mib8lfsIyU3Bw+WHEhjnXqv8TXhnDgtL54pSKuldpdPJYGG8
         nxUtybZcZcbkhvi/+Mp8UPQI30us/aB69hrrfGILAZgTTvkPGdAmAHOowd8MIyZ45nNO
         f60A==
X-Gm-Message-State: AOAM530yS0/PsUDk5D7UVDZN8wqKyMmB6YRVl++LeBPrYyKXg7H1rfwE
	qPv4Iatulvmj7n5mfHe+JWp5PHmvXBxblTbmSVQ=
X-Google-Smtp-Source: ABdhPJxZR2b0Vmy2jZfZlQtH1zwm6okT/JqDWLg0+JKYcKA3shDklIlso5R5O+e29NwuC9YlZIR6Mk1Ts8y5GLS7tL8=
X-Received: by 2002:a17:906:6dd1:: with SMTP id j17mr4993477ejt.357.1608311234305;
 Fri, 18 Dec 2020 09:07:14 -0800 (PST)
MIME-Version: 1.0
References: <1606218546-115087-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <CAPLtV=qtux0nP429iJqRTCFRpfHN3B8_fpNPSaeGqreWJFK=Dg@mail.gmail.com>
 <164D60671E1EC649.7952@lists.openembedded.org> <bcd9f08662984ddaa8923c0d3fe13d4c@G08CNEXMBPEKD04.g08.fujitsu.local>
 <164ECF710AF4F2C7.7121@lists.openembedded.org>
In-Reply-To: <164ECF710AF4F2C7.7121@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 18 Dec 2020 12:07:03 -0500
Message-ID: <CADkTA4Oex2Zgumv8uYo2LAha3covL_PM1y2dHyS0ni6AEp74-w@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: zangrc <zangrc.fnst@cn.fujitsu.com>, 
	Leonardo Sandoval <leonardo.sandoval@linaro.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 8, 2020 at 12:56 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> If that symbol is required, then we'd need to add it to the
> appropriate fragment in the
> reference kernel configurations (kernel-cache), and make sure it is
> built into the
> various kernel types.
>
> Changes like that are submitted to the linux-yocto mailing list.
>
> That being said, I went and looked at the error, and the .c that
> defines the missing
> symbol is security.c, which is controlled by CONFIG_SECURITY, not
> CONFIG_SECURITY_LOCKDOWN_LSM. And that option is already enabled in
> all kernel types.
>
> It looks more like a missing .h, versus a missing option to me.
>
> Have you looked at the systemtap source for an include of security.h,
> and traced why
> it wouldn't be finding the function definition ?
>
> If this is the on-target build, versus a cross build test, then maybe
> we are missing the
> copy of a .h to the target (but you'd think that we'd get a more
> obvious compile error
> if a .h wasn't found).


FYI. My 5.10 kernel testing has run into this issue, so I've grabbed
the uprev patch and am working on a fix.

If someone else already has it done, let me know and I'll happily take
their fix :D

Bruce

>
> Bruce
>
> On Mon, Dec 7, 2020 at 10:03 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrot=
e:
> >
> > Ping
> >
> >
> >
> > From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of zangrc
> > Sent: Friday, December 4, 2020 9:51 AM
> > To: Leonardo Sandoval <leonardo.sandoval@linaro.org>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
> >
> >
> >
> > I think this problem should be because the kernel does not enable CONF=
IG_SECURITY_LOCKDOWN_LSM,
> >
> > do you need me to submit a patch to open this option of the kernel?
> >
> >
> >
> > Zangrc
> >
> >
> >
> > From: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98
> > Sent: Thursday, November 26, 2020 2:18 PM
> > To: 'Leonardo Sandoval' <leonardo.sandoval@linaro.org>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: RE: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
> >
> >
> >
> > I will investigate, it may take some time, if the error is resolved, I=
 will send a patch to the mailing list.
> >
> >
> >
> > zangrc
> >
> >
> >
> > From: Leonardo Sandoval <leonardo.sandoval@linaro.org>
> > Sent: Thursday, November 26, 2020 6:09 AM
> > To: Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 <zangrc.fnst@cn.fujitsu=
.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
> >
> >
> >
> > Hi Zangrc,
> >
> >
> >
> > this patch is now in master-next
> >
> >
> >
> >   https://patchwork.openembedded.org/series/27030/
> >
> >
> >
> > but autobuilder detected a compilation error in the upgraded version
> >
> >
> >
> >   https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/27=
36/steps/13/logs/stdio
> >
> >
> >
> > Can you please take a look? (seems like a C macro is not defined).
> >
> >
> >
> > Thanks,
> >
> >
> >
> > lsg
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > On Mon, 23 Nov 2020 at 20:08, zangrc <zangrc.fnst@cn.fujitsu.com> wrot=
e:
> >
> > The test log of oe-selftest is as follows:
> > 2020-11-23 15:48:49,144 - oe-selftest - INFO - test_crosstap_helloworl=
d (runtime_test.SystemTap)
> > 2020-11-23 17:06:55,949 - oe-selftest - INFO -  ... ok
> > 2020-11-23 17:06:55,951 - oe-selftest - INFO - test_crosstap_pstree (r=
untime_test.SystemTap)
> > 2020-11-23 17:08:07,921 - oe-selftest - INFO -  ... ok
> > 2020-11-23 17:08:07,922 - oe-selftest - INFO - test_crosstap_syscalls_=
by_pid (runtime_test.SystemTap)
> > 2020-11-23 17:09:20,084 - oe-selftest - INFO -  ... ok
> > 2020-11-23 17:09:20,085 - oe-selftest - INFO - test_crosstap_syscalls_=
by_proc (runtime_test.SystemTap)
> > 2020-11-23 17:10:31,349 - oe-selftest - INFO -  ... ok
> > 2020-11-23 17:12:58,052 - oe-selftest - INFO - -----------------------=
-----------------------------------------------
> > 2020-11-23 17:12:58,054 - oe-selftest - INFO - Ran 4 tests in 5051.537=
s
> > 2020-11-23 17:12:58,054 - oe-selftest - INFO - OK
> > 2020-11-23 17:13:08,416 - oe-selftest - INFO - RESULTS:
> > 2020-11-23 17:13:08,417 - oe-selftest - INFO - RESULTS - runtime_test.=
SystemTap.test_crosstap_helloworld: PASSED (4686.81s)
> > 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.=
SystemTap.test_crosstap_pstree: PASSED (71.97s)
> > 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.=
SystemTap.test_crosstap_syscalls_by_pid: PASSED (72.16s)
> > 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.=
SystemTap.test_crosstap_syscalls_by_proc: PASSED (71.26s)
> > 2020-11-23 17:13:08,432 - oe-selftest - INFO - SUMMARY:
> > 2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest () - Ran 4 =
tests in 5051.540s
> > 2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest - OK - All =
required tests passed (successes=3D4, skipped=3D0, failures=3D0, errors=3D0=
)
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/re=
cipes-kernel/systemtap/systemtap_git.inc
> > index 56fa51d61e..ae735025b7 100644
> > --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> > +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> > @@ -1,7 +1,7 @@
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
> > -SRCREV =3D "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
> > -PV =3D "4.3"
> > +SRCREV =3D "988f439af39a359b4387963ca4633649866d8275"
> > +PV =3D "4.4"
> >
> >  SRC_URI =3D "git://sourceware.org/git/systemtap.git \
> >             file://0001-Do-not-let-configure-write-a-python-location-i=
nto-th.patch \
> > --
> > 2.25.1
> >
> >
> >
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

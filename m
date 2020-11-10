Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.34996.1605046134189986416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 14:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S35YuzPL;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id n63so9816931qte.4
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 14:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mHC7aKj5rJsdpjJjYJ1r9m2uoIYQbnXKvrk9mlAvK5g=;
        b=S35YuzPLFb4ldRluQO4eTpW1W3e78Nz9D9fG2QWbom2roXUTdOP/KPICpzSX3EVOsD
         m6jGmvD4Y4dPyzhdruy4jor6DcZEdArMcTwopNRlgDFkfQt9nGLWiBfG36Q6liPRmWav
         3VzaTmdoeDf/8DsGveVmKzWH7l5//JfUru5C+dUUAjXuO2vUaEP7pC/VaNq0cl9z7i3Z
         YQ0r/PmcwnuoaIAjrgbGpAsdEpATZMCARRQDtnoKJVZEv9qvjXaq/ByeJqo4KR3v1BJX
         tlDK+NaFoZ4bTYW5m4lNlqXKRrRm42whuS5Lw6nfhDG4m+x9QXxU07yMpMimBE7KO1No
         64Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mHC7aKj5rJsdpjJjYJ1r9m2uoIYQbnXKvrk9mlAvK5g=;
        b=rJMNcD9XJHE532IX+/znp/Eq3+pI/4eeJRDpci97blla9RTWHSBo5mjGznooiKJRro
         gia1V9abQOI7xV8DoDp+pwcVML+Kg52HR9CXJzaHzu/EeOVe5KL+g6hvC0/Kiw3YSo7k
         mXMHJEGRsD/Ny+UK8GkoVPSfxpPiCIDVtFLhj1QGrJrm84k+HVb81KL/zJsm3wDkTqTC
         ID6JmXP9JC0ygoCSskqRsVwP/+B0cJvywMUzby2tcDq/qX4t3IULYgXV/1VRrwH5xfVF
         K2C8cXvs4WtEr6BFCSNeEBIFJpGuuQIKm004MRNe9z2/TvBzb7shM/A4ROliQB9xuyCd
         aKsw==
X-Gm-Message-State: AOAM530ymeZP6nzsM37+i/Vm1LUyDp0QcHei7gEMCC4ByvLL4llmvQ6Q
	I8p8HEQaVfHKFoyYWQZSDuKQVA6BE8gIUTL59Fc=
X-Google-Smtp-Source: ABdhPJwcoXMHrR7NwcYPM80KAW/wuEf13ZoSRnqDUGuYV9KllgjDAmCWVtbYWQnXGtcxYWBtTX5oVbqZ+iHR14E0TBo=
X-Received: by 2002:ac8:584b:: with SMTP id h11mr1627833qth.378.1605046133050;
 Tue, 10 Nov 2020 14:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20201107020156.351764-1-alhe@linux.microsoft.com>
 <CAMKF1spGkOh9nXmDXxTihdV_JGM7qvqQkdYF6JnP=5wd2mTd3Q@mail.gmail.com>
 <CAMKF1spLO5w6eb5RiNUPoaQwh0KF0ymX+D7Bk14zOMGvhAoPNA@mail.gmail.com> <CAHMutrYSJkyYZv00_cJUsPJui5+uT6bCsV=zab3pOh+XD+cvVg@mail.gmail.com>
In-Reply-To: <CAHMutrYSJkyYZv00_cJUsPJui5+uT6bCsV=zab3pOh+XD+cvVg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 10 Nov 2020 14:08:26 -0800
Message-ID: <CAMKF1soqD+kprmZd0Fdq3iSYk3zTbANZK0Eq_aGGWb-K18G97w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: Update manifest
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 10, 2020 at 12:16 PM Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> Hey Khem,
>
> I see, since the typing module is now required for python3-core to work properly,
> it will now be there by default, it seems that the right solution is to fix RDEPENDS
> in other places, deleting the typing module, it looks like meta-python has some issues,
> I didn't find any instances on oe-core but I can take a look at other layers that might
> run into this, we can also put this on the release migration notes
>

yes removing it from RDEPENDS is the way here but wanted to raise the
visibility of such changes which
are enforced in other layers due to this change.

> Alejandro
>
> On Tue, 10 Nov 2020 at 12:33, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I have a potential patch to meta-oe but other layers might have similar issues
>>
>> On Tue, Nov 10, 2020 at 11:26 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > This has some consequences for recipes which depend on python3-typing
>> > see parse logs
>> >
>> > http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-64/1962/consoleFull
>> >
>> > On Fri, Nov 6, 2020 at 6:02 PM Alejandro Hernandez Samaniego
>> > <alejandro@enedino.org> wrote:
>> > >
>> > > Update the python3-manifest to match the files installed by the
>> > > new version of python3.
>> > > - Kept tkinter the way it was although tk isnt part of OE-Core
>> > > - Made typing part of python3-core
>> > > - Update other packages with new dependencies such as filecmp and dataclasses.
>> > >
>> > > Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
>> > > ---
>> > >  .../python/python3/python3-manifest.json      | 35 +++++--------------
>> > >  1 file changed, 9 insertions(+), 26 deletions(-)
>> > >
>> > > diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
>> > > index 69aecb7004..615dc3a5e5 100644
>> > > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>> > > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>> > > @@ -122,8 +122,7 @@
>> > >              "logging",
>> > >              "netclient",
>> > >              "numbers",
>> > > -            "stringold",
>> > > -            "typing"
>> > > +            "stringold"
>> > >          ],
>> > >          "files": [
>> > >              "${libdir}/python${PYTHON_MAJMIN}/asyncio",
>> > > @@ -173,10 +172,12 @@
>> > >          ],
>> > >          "files": [
>> > >              "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
>> > > +            "${libdir}/python${PYTHON_MAJMIN}/filecmp.py",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
>> > >          ],
>> > >          "cached": [
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
>> > > +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
>> > >          ]
>> > >      },
>> > > @@ -313,6 +314,7 @@
>> > >              "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/types.py",
>> > > +            "${libdir}/python${PYTHON_MAJMIN}/typing.py",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/urllib",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
>> > > @@ -388,6 +390,7 @@
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
>> > > +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
>> > > @@ -557,18 +560,12 @@
>> > >      "doctest": {
>> > >          "summary": "Python framework for running examples in docstrings",
>> > >          "rdepends": [
>> > > -            "asyncio",
>> > >              "core",
>> > >              "debugger",
>> > >              "difflib",
>> > > -            "io",
>> > > -            "logging",
>> > > -            "netclient",
>> > > -            "numbers",
>> > >              "pprint",
>> > >              "shell",
>> > >              "stringold",
>> > > -            "typing",
>> > >              "unittest"
>> > >          ],
>> > >          "files": [
>> > > @@ -822,7 +819,6 @@
>> > >              "terminal",
>> > >              "threading",
>> > >              "tkinter",
>> > > -            "typing",
>> > >              "unittest",
>> > >              "unixadmin",
>> > >              "venv",
>> > > @@ -999,12 +995,14 @@
>> > >          ],
>> > >          "files": [
>> > >              "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
>> > > +            "${libdir}/python${PYTHON_MAJMIN}/dataclasses.py",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/profile.py",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
>> > >          ],
>> > >          "cached": [
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
>> > > +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dataclasses.*.pyc",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
>> > >          ]
>> > > @@ -1130,13 +1128,11 @@
>> > >              "core"
>> > >          ],
>> > >          "files": [
>> > > -            "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/queue.py"
>> > >          ],
>> > >          "cached": [
>> > > -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
>> > >          ]
>> > > @@ -1147,23 +1143,11 @@
>> > >              "core"
>> > >          ],
>> > >          "files": [
>> > > -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
>> > > +           "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
>> > >              "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>> > >          ],
>> > >          "cached": []
>> > >      },
>> > > -    "typing": {
>> > > -        "summary": "Python typing support",
>> > > -        "rdepends": [
>> > > -            "core"
>> > > -        ],
>> > > -        "files": [
>> > > -            "${libdir}/python${PYTHON_MAJMIN}/typing.py"
>> > > -        ],
>> > > -        "cached": [
>> > > -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
>> > > -        ]
>> > > -    },
>> > >      "unittest": {
>> > >          "summary": "Python unit testing framework",
>> > >          "rdepends": [
>> > > @@ -1175,8 +1159,7 @@
>> > >              "netclient",
>> > >              "numbers",
>> > >              "pprint",
>> > > -            "stringold",
>> > > -            "typing"
>> > > +            "stringold"
>> > >          ],
>> > >          "files": [
>> > >              "${libdir}/python${PYTHON_MAJMIN}/unittest",
>> > > --
>> > > 2.25.1
>> > >
>> > >
>> > > 
>> > >

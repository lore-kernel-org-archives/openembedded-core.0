Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web08.32774.1605036800826765114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 11:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o6DAIJzm;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id u4so9920057qkk.10
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 11:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LeG1M7Wr/QV+rCMc5nqVKAAKQXIdBcjENhj0Ku6ArTg=;
        b=o6DAIJzmyzJHfpi33Iy7v0yI2PErHYrt1+4FgDcX0tUNtBXBcRHD5TjmmjSpqSWmM/
         pqYHmF5vyQOFzBs1qaFGmwHQRo3GJqm3J2yFtY1W8IDww7wCF40UsGE4Y0MmVExn8usA
         m14sAZpc1kX4Z0P6PbbZ2yhhzC5RGbOsOLuvex9zpuHThxjm4mpbR2ouBFHlcGw2ViyA
         93mwFZ3GGt6AwomXBKQay61v1qcXDUIP6KUb2LY5IXQ1+Q5q4CiXAHHuwFaJXt0XP4Jf
         7fp54XN7Z9BhKRWPwDnKwzCszUEBRdyiaxBDqaD4lmbXOluBdfnWaHD7rcCoYw+7AmQu
         6N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LeG1M7Wr/QV+rCMc5nqVKAAKQXIdBcjENhj0Ku6ArTg=;
        b=e2W9Bdln652YH88Z+Vtu6Dt0sKNmmok1r6swwMZOcSvedTorfmfCOIYc/f6Kre9OPB
         lMeea66D4dNpkj6UBIKiGewHZ8rbuiyhYVxl83X69jPCeKvsd2A1+qL1Jj1X3H2NsF2x
         iQ46+uUgWShXuOXYooBQnxnmruIf4WhPqYk2gfH/fbqaK1fjvMjei54NdztfBrUbSR5K
         dMvfVZLnA1Z+B3/ITF3cTR1i990RbY73AmthDALU0QE2/wLH82u2C+lGc4n+d0h+tikF
         g0snNw3e3AEE7hCGSXmI6/yb7xKf/Ew0gbf+lOy0o8XCIcKYOULcPpp3W0JSVxq/vK7E
         Y73Q==
X-Gm-Message-State: AOAM5333CYlYp3+ZD/2KFWOlFztxoFFCCTl4bUAMV0akoUWvkvRpCE3c
	2v6C89KiT83/HMZvKm3URXCGp1qGpXLDP4kvLV0=
X-Google-Smtp-Source: ABdhPJyrnYpBmu3RAlMpKQ2Ztyrzr9vXNM54BAHqWoaS/ne1/ay3h6cD6hie5NTJLkPDYKE0O1p/8wqRETT51eez0hg=
X-Received: by 2002:a37:9441:: with SMTP id w62mr21209167qkd.474.1605036799820;
 Tue, 10 Nov 2020 11:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20201107020156.351764-1-alhe@linux.microsoft.com> <CAMKF1spGkOh9nXmDXxTihdV_JGM7qvqQkdYF6JnP=5wd2mTd3Q@mail.gmail.com>
In-Reply-To: <CAMKF1spGkOh9nXmDXxTihdV_JGM7qvqQkdYF6JnP=5wd2mTd3Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 10 Nov 2020 11:32:53 -0800
Message-ID: <CAMKF1spLO5w6eb5RiNUPoaQwh0KF0ymX+D7Bk14zOMGvhAoPNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: Update manifest
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"

I have a potential patch to meta-oe but other layers might have similar issues

On Tue, Nov 10, 2020 at 11:26 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This has some consequences for recipes which depend on python3-typing
> see parse logs
>
> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-64/1962/consoleFull
>
> On Fri, Nov 6, 2020 at 6:02 PM Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > Update the python3-manifest to match the files installed by the
> > new version of python3.
> > - Kept tkinter the way it was although tk isnt part of OE-Core
> > - Made typing part of python3-core
> > - Update other packages with new dependencies such as filecmp and dataclasses.
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
> > ---
> >  .../python/python3/python3-manifest.json      | 35 +++++--------------
> >  1 file changed, 9 insertions(+), 26 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> > index 69aecb7004..615dc3a5e5 100644
> > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> > @@ -122,8 +122,7 @@
> >              "logging",
> >              "netclient",
> >              "numbers",
> > -            "stringold",
> > -            "typing"
> > +            "stringold"
> >          ],
> >          "files": [
> >              "${libdir}/python${PYTHON_MAJMIN}/asyncio",
> > @@ -173,10 +172,12 @@
> >          ],
> >          "files": [
> >              "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
> > +            "${libdir}/python${PYTHON_MAJMIN}/filecmp.py",
> >              "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
> >          ],
> >          "cached": [
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
> > +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc",
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
> >          ]
> >      },
> > @@ -313,6 +314,7 @@
> >              "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
> >              "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
> >              "${libdir}/python${PYTHON_MAJMIN}/types.py",
> > +            "${libdir}/python${PYTHON_MAJMIN}/typing.py",
> >              "${libdir}/python${PYTHON_MAJMIN}/urllib",
> >              "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
> >              "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
> > @@ -388,6 +390,7 @@
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
> > +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
> >              "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
> > @@ -557,18 +560,12 @@
> >      "doctest": {
> >          "summary": "Python framework for running examples in docstrings",
> >          "rdepends": [
> > -            "asyncio",
> >              "core",
> >              "debugger",
> >              "difflib",
> > -            "io",
> > -            "logging",
> > -            "netclient",
> > -            "numbers",
> >              "pprint",
> >              "shell",
> >              "stringold",
> > -            "typing",
> >              "unittest"
> >          ],
> >          "files": [
> > @@ -822,7 +819,6 @@
> >              "terminal",
> >              "threading",
> >              "tkinter",
> > -            "typing",
> >              "unittest",
> >              "unixadmin",
> >              "venv",
> > @@ -999,12 +995,14 @@
> >          ],
> >          "files": [
> >              "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
> > +            "${libdir}/python${PYTHON_MAJMIN}/dataclasses.py",
> >              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
> >              "${libdir}/python${PYTHON_MAJMIN}/profile.py",
> >              "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
> >          ],
> >          "cached": [
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
> > +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dataclasses.*.pyc",
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
> >          ]
> > @@ -1130,13 +1128,11 @@
> >              "core"
> >          ],
> >          "files": [
> > -            "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
> >              "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
> >              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
> >              "${libdir}/python${PYTHON_MAJMIN}/queue.py"
> >          ],
> >          "cached": [
> > -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
> >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
> >          ]
> > @@ -1147,23 +1143,11 @@
> >              "core"
> >          ],
> >          "files": [
> > -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
> > +           "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
> >              "${libdir}/python${PYTHON_MAJMIN}/tkinter"
> >          ],
> >          "cached": []
> >      },
> > -    "typing": {
> > -        "summary": "Python typing support",
> > -        "rdepends": [
> > -            "core"
> > -        ],
> > -        "files": [
> > -            "${libdir}/python${PYTHON_MAJMIN}/typing.py"
> > -        ],
> > -        "cached": [
> > -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
> > -        ]
> > -    },
> >      "unittest": {
> >          "summary": "Python unit testing framework",
> >          "rdepends": [
> > @@ -1175,8 +1159,7 @@
> >              "netclient",
> >              "numbers",
> >              "pprint",
> > -            "stringold",
> > -            "typing"
> > +            "stringold"
> >          ],
> >          "files": [
> >              "${libdir}/python${PYTHON_MAJMIN}/unittest",
> > --
> > 2.25.1
> >
> >
> > 
> >

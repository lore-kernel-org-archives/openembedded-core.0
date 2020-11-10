Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.33372.1605039368058213780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 12:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: aehs29@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id b17so3601240ljf.12
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 12:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FchCLLYSc3iQQzB0ba2AfEoNFX3PD29bMcI4vwgJNH4=;
        b=A0NFz0QRvqxQHz47RT3PeJla6jvx96qeA8nDVrB8qG9M1fHbOYyPXe1uktRFRXxlh3
         ZuKzA/xdWfpbWu6uQPd/nlBhtbG9fNFp+j02H3joZLpOtVGzlb65c5u250HSr6NtFz1Z
         H1bxNuTHSK0GaKwOZmCjDYZwzepg0WhHErNxqR/gw+OtHC7HcbAMJvLbXaNHT7LJo6Ji
         S3VqerctN7QZ4JijtJPS0gPP5sDq6IXU9SvGGY1Yx/ICjf/CXjD32RiMSlPTola5uEBn
         Dkxm+YeRlSWdj6vPqKU4MleBf6jbbKUKjTAT5KBqvZaJmexdDJrPloDrxwR5NwWSJsgO
         tOKw==
X-Gm-Message-State: AOAM531knHfBOzA+7aBNpGdjVvzhdvI3Eomg4TApM84Xa1kW7Vf3jYBM
	aY43FmBQWuE3Zv0NcaiZWc5zl6hbQS8=
X-Google-Smtp-Source: ABdhPJzyQ/9QT6/kbhb14MVh3HqyKhFN4oonXeOwXFZCaZLPQ74OzxcRjF5CCIskEsDFtCDorSwqrg==
X-Received: by 2002:a2e:50d:: with SMTP id 13mr9360725ljf.41.1605039364144;
        Tue, 10 Nov 2020 12:16:04 -0800 (PST)
Return-Path: <aehs29@gmail.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id f25sm2200898lfc.234.2020.11.10.12.16.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 12:16:03 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id r9so5704978lfn.11
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 12:16:03 -0800 (PST)
X-Received: by 2002:ac2:57cf:: with SMTP id k15mr7478931lfo.501.1605039363467;
 Tue, 10 Nov 2020 12:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20201107020156.351764-1-alhe@linux.microsoft.com>
 <CAMKF1spGkOh9nXmDXxTihdV_JGM7qvqQkdYF6JnP=5wd2mTd3Q@mail.gmail.com> <CAMKF1spLO5w6eb5RiNUPoaQwh0KF0ymX+D7Bk14zOMGvhAoPNA@mail.gmail.com>
In-Reply-To: <CAMKF1spLO5w6eb5RiNUPoaQwh0KF0ymX+D7Bk14zOMGvhAoPNA@mail.gmail.com>
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
Date: Tue, 10 Nov 2020 13:15:51 -0700
X-Gmail-Original-Message-ID: <CAHMutrYSJkyYZv00_cJUsPJui5+uT6bCsV=zab3pOh+XD+cvVg@mail.gmail.com>
Message-ID: <CAHMutrYSJkyYZv00_cJUsPJui5+uT6bCsV=zab3pOh+XD+cvVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: Update manifest
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Content-Type: multipart/alternative; boundary="0000000000001c2ff905b3c65946"

--0000000000001c2ff905b3c65946
Content-Type: text/plain; charset="UTF-8"

Hey Khem,

I see, since the typing module is now required for python3-core to work
properly,
it will now be there by default, it seems that the right solution is to fix
RDEPENDS
in other places, deleting the typing module, it looks like meta-python has
some issues,
I didn't find any instances on oe-core but I can take a look at other
layers that might
run into this, we can also put this on the release migration notes

Alejandro

On Tue, 10 Nov 2020 at 12:33, Khem Raj <raj.khem@gmail.com> wrote:

> I have a potential patch to meta-oe but other layers might have similar
> issues
>
> On Tue, Nov 10, 2020 at 11:26 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This has some consequences for recipes which depend on python3-typing
> > see parse logs
> >
> >
> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-64/1962/consoleFull
> >
> > On Fri, Nov 6, 2020 at 6:02 PM Alejandro Hernandez Samaniego
> > <alejandro@enedino.org> wrote:
> > >
> > > Update the python3-manifest to match the files installed by the
> > > new version of python3.
> > > - Kept tkinter the way it was although tk isnt part of OE-Core
> > > - Made typing part of python3-core
> > > - Update other packages with new dependencies such as filecmp and
> dataclasses.
> > >
> > > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alhe@linux.microsoft.com>
> > > ---
> > >  .../python/python3/python3-manifest.json      | 35 +++++--------------
> > >  1 file changed, 9 insertions(+), 26 deletions(-)
> > >
> > > diff --git
> a/meta/recipes-devtools/python/python3/python3-manifest.json
> b/meta/recipes-devtools/python/python3/python3-manifest.json
> > > index 69aecb7004..615dc3a5e5 100644
> > > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> > > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> > > @@ -122,8 +122,7 @@
> > >              "logging",
> > >              "netclient",
> > >              "numbers",
> > > -            "stringold",
> > > -            "typing"
> > > +            "stringold"
> > >          ],
> > >          "files": [
> > >              "${libdir}/python${PYTHON_MAJMIN}/asyncio",
> > > @@ -173,10 +172,12 @@
> > >          ],
> > >          "files": [
> > >              "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
> > > +            "${libdir}/python${PYTHON_MAJMIN}/filecmp.py",
> > >              "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
> > >          ],
> > >          "cached": [
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
> > > +
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
> > >          ]
> > >      },
> > > @@ -313,6 +314,7 @@
> > >              "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
> > >              "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
> > >              "${libdir}/python${PYTHON_MAJMIN}/types.py",
> > > +            "${libdir}/python${PYTHON_MAJMIN}/typing.py",
> > >              "${libdir}/python${PYTHON_MAJMIN}/urllib",
> > >              "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
> > >              "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
> > > @@ -388,6 +390,7 @@
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
> > > +
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
> > > @@ -557,18 +560,12 @@
> > >      "doctest": {
> > >          "summary": "Python framework for running examples in
> docstrings",
> > >          "rdepends": [
> > > -            "asyncio",
> > >              "core",
> > >              "debugger",
> > >              "difflib",
> > > -            "io",
> > > -            "logging",
> > > -            "netclient",
> > > -            "numbers",
> > >              "pprint",
> > >              "shell",
> > >              "stringold",
> > > -            "typing",
> > >              "unittest"
> > >          ],
> > >          "files": [
> > > @@ -822,7 +819,6 @@
> > >              "terminal",
> > >              "threading",
> > >              "tkinter",
> > > -            "typing",
> > >              "unittest",
> > >              "unixadmin",
> > >              "venv",
> > > @@ -999,12 +995,14 @@
> > >          ],
> > >          "files": [
> > >              "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
> > > +            "${libdir}/python${PYTHON_MAJMIN}/dataclasses.py",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
> > >              "${libdir}/python${PYTHON_MAJMIN}/profile.py",
> > >              "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
> > >          ],
> > >          "cached": [
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
> > > +
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dataclasses.*.pyc",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
> > >          ]
> > > @@ -1130,13 +1128,11 @@
> > >              "core"
> > >          ],
> > >          "files": [
> > > -            "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
> > >              "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
> > >              "${libdir}/python${PYTHON_MAJMIN}/queue.py"
> > >          ],
> > >          "cached": [
> > > -
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
> > >
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
> > >              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
> > >          ]
> > > @@ -1147,23 +1143,11 @@
> > >              "core"
> > >          ],
> > >          "files": [
> > > -
> "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
> > > +
>  "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
> > >              "${libdir}/python${PYTHON_MAJMIN}/tkinter"
> > >          ],
> > >          "cached": []
> > >      },
> > > -    "typing": {
> > > -        "summary": "Python typing support",
> > > -        "rdepends": [
> > > -            "core"
> > > -        ],
> > > -        "files": [
> > > -            "${libdir}/python${PYTHON_MAJMIN}/typing.py"
> > > -        ],
> > > -        "cached": [
> > > -
> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
> > > -        ]
> > > -    },
> > >      "unittest": {
> > >          "summary": "Python unit testing framework",
> > >          "rdepends": [
> > > @@ -1175,8 +1159,7 @@
> > >              "netclient",
> > >              "numbers",
> > >              "pprint",
> > > -            "stringold",
> > > -            "typing"
> > > +            "stringold"
> > >          ],
> > >          "files": [
> > >              "${libdir}/python${PYTHON_MAJMIN}/unittest",
> > > --
> > > 2.25.1
> > >
> > >
> > > 
> > >
>

--0000000000001c2ff905b3c65946
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace;font-size:small">Hey Khem,</div><div class=3D"gmail_defa=
ult" style=3D"font-family:monospace;font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace;font-size:small">I see, =
since the typing module is now required for python3-core to work properly,<=
/div><div class=3D"gmail_default" style=3D"font-family:monospace;font-size:=
small">it will now be there by default, it seems that the right solution is=
 to fix RDEPENDS</div><div class=3D"gmail_default" style=3D"font-family:mon=
ospace;font-size:small">in other places, deleting the typing module, it loo=
ks like meta-python has some issues,</div><div class=3D"gmail_default" styl=
e=3D"font-family:monospace;font-size:small">I didn&#39;t find any instances=
 on oe-core but I can take a look at other layers that might</div><div clas=
s=3D"gmail_default" style=3D"font-family:monospace;font-size:small">run int=
o this, we can also put this on the release migration notes</div><div class=
=
=3D"gmail_default" style=3D"font-family:monospace;font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:monospace;font-size:sm=
all">Alejandro</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, 10 Nov 2020 at 12:33, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">I have a potential patch to met=
a-oe but other layers might have similar issues<br>
<br>
On Tue, Nov 10, 2020 at 11:26 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This has some consequences for recipes which depend on python3-typing=
<br>
&gt; see parse logs<br>
&gt;<br>
&gt; <a href=3D"http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-=
64/1962/consoleFull" rel=3D"noreferrer" target=3D"_blank">http://jenkins.na=
s-admin.org/view/OE/job/oe_world_qemux86-64/1962/consoleFull</a><br>
&gt;<br>
&gt; On Fri, Nov 6, 2020 at 6:02 PM Alejandro Hernandez Samaniego<br>
&gt; &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">alejan=
dro@enedino.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Update the python3-manifest to match the files installed by the<=
br>
&gt; &gt; new version of python3.<br>
&gt; &gt; - Kept tkinter the way it was although tk isnt part of OE-Core<b=
r>
&gt; &gt; - Made typing part of python3-core<br>
&gt; &gt; - Update other packages with new dependencies such as filecmp an=
d dataclasses.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=
=
=3D"mailto:alhe@linux.microsoft.com" target=3D"_blank">alhe@linux.microsof=
t.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../python/python3/python3-manifest.json=C2=A0 =C2=A0 =C2=
=A0 | 35 +++++--------------<br>
&gt; &gt;=C2=A0 1 file changed, 9 insertions(+), 26 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/python/python3/python3-manife=
st.json b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; &gt; index 69aecb7004..615dc3a5e5 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/python/python3/python3-manifest.json=
<br>
&gt; &gt; +++ b/meta/recipes-devtools/python/python3/python3-manifest.json=
<br>
&gt; &gt; @@ -122,8 +122,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;logging&qu=
ot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&=
quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;numbers&qu=
ot;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringold&quot;=
,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;typing&quot;<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringold&quot;=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/asyncio&quot;,<br>
&gt; &gt; @@ -173,10 +172,12 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/compileall.py&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/filecmp.py&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/py_compile.py&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cached&quot;: [<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt; @@ -313,6 +314,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/tokenize.py&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/traceback.py&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/types.py&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/typing.py&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/urllib&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/urllib/parse.py&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/warnings.py&quot;,<br>
&gt; &gt; @@ -388,6 +390,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/types.*.pyc&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/__pycache__/typing.*.pyc&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/collections/__pycache__&quot;,<br>
&gt; &gt; @@ -557,18 +560,12 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;doctest&quot;: {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Pyt=
hon framework for running examples in docstrings&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;asyncio&quot;,<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;=
,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;debugger&q=
uot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;difflib&qu=
ot;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io&quot;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;logging&quot;,<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&quot;=
,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;numbers&quot;,<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pprint&quo=
t;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shell&quot=
;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringold&=
quot;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;typing&quot;,<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unittest&q=
uot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
&gt; &gt; @@ -822,7 +819,6 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;terminal&q=
uot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;threading&=
quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tkinter&qu=
ot;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;typing&quot;,<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unittest&q=
uot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unixadmin&=
quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;venv&quot;=
,<br>
&gt; &gt; @@ -999,12 +995,14 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/cProfile.py&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/dataclasses.py&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/profile.py&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/pstats.py&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cached&quot;: [<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/__pycache__/dataclasses.*.pyc&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; &gt; @@ -1130,13 +1128,11 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/_dummy_thread.py&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/_threading_local.py&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/queue.py&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cached&quot;: [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; &gt; @@ -1147,23 +1143,11 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${libdir}/python=
${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/tkinter&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cached&quot;: []<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt; -=C2=A0 =C2=A0 &quot;typing&quot;: {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Python t=
yping support&quot;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;core&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/typing.py&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cached&quot;: [<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/pytho=
n${PYTHON_MAJMIN}/__pycache__/typing.*.pyc&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
&gt; &gt; -=C2=A0 =C2=A0 },<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;unittest&quot;: {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;summary&quot;: &quot;Pyt=
hon unit testing framework&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rdepends&quot;: [<br>
&gt; &gt; @@ -1175,8 +1159,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;netclient&=
quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;numbers&qu=
ot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pprint&quo=
t;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringold&quot;=
,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;typing&quot;<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringold&quot;=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/=
python${PYTHON_MAJMIN}/unittest&quot;,<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
</blockquote></div></div>

--0000000000001c2ff905b3c65946--

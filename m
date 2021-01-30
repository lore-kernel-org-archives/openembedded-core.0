Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.5850.1612023353157188700
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jan 2021 08:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=spuLbXy7;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id sa23so1283850ejb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Jan 2021 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c+HyPO6A+gzt8UE2aKaooHGpQ63ZHNO0YFkAAaG0Cag=;
        b=spuLbXy7cX9E3TNJa8z5eLOFmrZ3KxasWegMKEthWJ6lp976NlTjnIfozOUjeP7O/s
         j4VR1OY1olUsndGQnrJpeXecuKonwTTvZkF+k8WCg1wXqPJKsZdptI4tqZ+neJFekZkf
         p+F4/0CGw9QCb+jiqIv9gJauZR/5au10SWFFN3TfexiwVIax0ND2EBVVlBcdDFJauHHd
         Qw0vSgmtbTDgWxpaOwezXBeMw33Durrjgv3bkveaWOnp4wlauehMy6JCsCJLjaL07WKG
         TSx7rQphdW+kEk0cia8F1vCU2KHgQubr3c/dWfLQ3KEJCjB/EWIMtdGc5OEStY4GYEms
         DnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c+HyPO6A+gzt8UE2aKaooHGpQ63ZHNO0YFkAAaG0Cag=;
        b=RuUi9+M8hs6fJpXW9w0Qiy4KQnPq3heV3qo2BT4pgWXIuWEIach0qy2PjXYTZtmPmZ
         4Hsuu3O3JXGdy7RADHTjIu4J9JPhcjZgR//UOQH6/Y72InyefjSjsW0pe5BUFdFG+b3u
         xgcX1pZ7BFAeQcLukUFd3+FDxTr5Ls/CdYGy3K6QPxtYpWNeFknLLtgfemXoqRj3pwnD
         8JKk8GrTFtNLVLU3OAPeHgRgFxzwYa9/+cVeX6bkGbffbaXnH+UUQiKuALR376t23Ofk
         JpcmyHsUNLcunrpZ7FleovE2w3VPjYam0f2gCnWI5Vehm91l8dMfRUDA4dubmfTUZRZh
         pnpw==
X-Gm-Message-State: AOAM530gP9Jvlkff+xi8lBPaSLt3UCT1lBkz7bw2tziNtZIA+NdNkQZQ
	ChZ5pXlasq5c2bsFk5k7C8JqKNr54dRnwx/XztM=
X-Google-Smtp-Source: ABdhPJz/cRopqyhqhNdvCFdE0maoaQkz4apW2FgkZX8i4c1QSYmOs4JeShyuVm2M8HXFjX+1PB4m7vcZYdwuLkID5S4=
X-Received: by 2002:a17:906:3fc4:: with SMTP id k4mr9459630ejj.137.1612023351615;
 Sat, 30 Jan 2021 08:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org> <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 30 Jan 2021 17:15:40 +0100
Message-ID: <CA+chaQdc7P6NsTno6oCcB4HmoseMziAXA57f646=YWWDPyEH8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003e254805ba206fda"

--0000000000003e254805ba206fda
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 27, 2021 at 6:28 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Some now unneeded code in python3-setuptools is dropped, there are further
> changes like this which can follow.
>
> This change was verified with OE-Core by comparing task-depends.dot
> generated
> by "bitbake world -g" before and after the change, the files were
> identical.
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
> b/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
> index 6ee935f8f79..db336bfa13b 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
> @@ -58,8 +58,3 @@ RDEPENDS_${PYTHON_PN}-pkg-resources = "\
>    ${PYTHON_PN}-plistlib \
>    ${PYTHON_PN}-pprint \
>  "
> -# Due to the way OE-Core implemented native recipes, the native class
> cannot
> -# have a dependency on something that is not a recipe name. Work around
> that by
> -# manually setting RPROVIDES.
> -RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
> -RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-native"
>

The runtime dependency on ${PYTHON_PN}-pkg-resources isn't needed anymore?
I don't see how it would get still included as you said that bitbake -g
files were the same.

I'm asking because meta-python2 has the same issue in:
https://git.openembedded.org/meta-python2/tree/recipes-devtools/python/python-setuptools.inc#n49

and my fix I was planing to send was to replace it with:
RDEPENDS_${PN}_append_class-target = " ${PYTHON_PN}-pkg-resources"
and drop the RPROVIDES, because it unfortunately causes bitbake to get
stuck after reporting parsing error as:

ERROR: meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: QA
Issue: meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb:
Variable RPROVIDES is set as not being package specific, please fix this.
[pkgvarcheck]
ERROR: meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb:
Fatal QA errors found, failing task.
ERROR: Failed to parse recipe: meta-python2/recipes-devtools/python/
python-setuptools_42.0.2.bb

--0000000000003e254805ba206fda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 27, 2021 at 6:28 PM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Some now unneeded code in python3-setuptools is =
dropped, there are further<br>
changes like this which can follow.<br>
<br>
This change was verified with OE-Core by comparing task-depends.dot generat=
ed<br>
by &quot;bitbake world -g&quot; before and after the change, the files were=
 identical.<br><br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-setupto=
ols_51.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_51.0=
.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-setuptoo=
ls_51.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_51.0.=
0.bb</a><br>
index 6ee935f8f79..db336bfa13b 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-setuptools_51.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_51.0.0.bb</=
a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-setuptools_51.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_51.0.0.bb</=
a><br>
@@ -58,8 +58,3 @@ RDEPENDS_${PYTHON_PN}-pkg-resources =3D &quot;\<br>
=C2=A0 =C2=A0${PYTHON_PN}-plistlib \<br>
=C2=A0 =C2=A0${PYTHON_PN}-pprint \<br>
=C2=A0&quot;<br>
-# Due to the way OE-Core implemented native recipes, the native class cann=
ot<br>
-# have a dependency on something that is not a recipe name. Work around th=
at by<br>
-# manually setting RPROVIDES.<br>
-RDEPENDS_${PN}_append =3D &quot; ${PYTHON_PN}-pkg-resources&quot;<br>
-RPROVIDES_append_class-native =3D &quot; ${PYTHON_PN}-pkg-resources-native=
&quot;<br></blockquote><div>=C2=A0</div><div>The runtime dependency on=C2=
=A0${PYTHON_PN}-pkg-resources isn&#39;t needed anymore? I don&#39;t see how=
 it would get still included as you said that bitbake -g files were the sam=
e.</div><div><br></div><div>I&#39;m asking because meta-python2 has the sam=
e issue in:</div><div><a href=3D"https://git.openembedded.org/meta-python2/=
tree/recipes-devtools/python/python-setuptools.inc#n49">https://git.openemb=
edded.org/meta-python2/tree/recipes-devtools/python/python-setuptools.inc#n=
49</a><br></div><div><br></div><div>and my fix I was planing to send was to=
 replace it with:</div><div>RDEPENDS_${PN}_append_class-target =3D &quot; $=
{PYTHON_PN}-pkg-resources&quot;<br></div><div>and drop the RPROVIDES, becau=
se it unfortunately causes bitbake to get stuck after reporting parsing err=
or as:</div><div><br></div><div>ERROR: meta-python2/recipes-devtools/python=
/<a href=3D"http://python-setuptools_42.0.2.bb">python-setuptools_42.0.2.bb=
</a>: QA Issue: meta-python2/recipes-devtools/python/<a href=3D"http://pyth=
on-setuptools_42.0.2.bb">python-setuptools_42.0.2.bb</a>: Variable RPROVIDE=
S is set as not being package specific, please fix this. [pkgvarcheck]<br>E=
RROR: meta-python2/recipes-devtools/python/<a href=3D"http://python-setupto=
ols_42.0.2.bb">python-setuptools_42.0.2.bb</a>: Fatal QA errors found, fail=
ing task.<br>ERROR: Failed to parse recipe: meta-python2/recipes-devtools/p=
ython/<a href=3D"http://python-setuptools_42.0.2.bb">python-setuptools_42.0=
.2.bb</a><br></div></div></div>

--0000000000003e254805ba206fda--

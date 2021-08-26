Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.33761.1629996807724802282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 09:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZSzAxURa;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id i13so3976482ilm.4
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 09:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X1/yGoo4ip+LzG6y9Y48eLJ1FcgK8SQF6uGMm8Nmhd8=;
        b=ZSzAxURapZoP1jp3otU/yG5Xp0Bo+1kVhIHcl0xnUmGi0fLUl+gp6CpsIUW7Os5qVM
         IkKMPOoNQEzPndbbl/7WHAl4nGItnLwSqbSA/1twk68y36Z6tPJ6Sy//gcnUwKTdb010
         2wEXH8URFfdTAzzA3pEwnIaEIzo+53Thu26siFpIINKMnvnavm1sXi6vsXggR0Ha4XLb
         RdmXNcsJB6Ez/SjN1lC3SP/XhgVfTZ6rtDuU+JqT1o487I5Zs7Shu4Yxd+SezB+idV57
         X/cr5TEl9Wb4yMUa+9EdVKW8uMs8aPhoEYXiZUV34vTQZLRD8+wKQ0Gzk1qLEkwfw8Sh
         2Opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X1/yGoo4ip+LzG6y9Y48eLJ1FcgK8SQF6uGMm8Nmhd8=;
        b=TMnz2s1vA58jSiy/fsFIC6PohsSehEA20AKTBKLM6w+Yd3Y6cByLwVaD2U7lLyU7vL
         5wlkc5kMXWQqJgsGM5MvD97N38/DAsf0hZbTaGecbE1scA3XM3aVewHHNp6eeZS5BzTy
         XBHlwa6HhPg0kbByaadgr5uEEOPsDJ65HQpszJRtvx3cq6/eHjJa+W6i7ryyBFeZMWT0
         fw/uGDbtydtDP0DAEgrD/n9C/tSaZijLp9ki6cyPGM0qPAyJy78s0lYItZD3pwfRzTRF
         Q1HIzqOJ7WVtTT6FUOu1XLsLCRKvcww2rUf32Lh/7O4v56JvtupcrmlOTEnVcjerT+8E
         jTCQ==
X-Gm-Message-State: AOAM5306AUQAJzEs+xxRu9g40rqHPLIcjl8QwDRQvDvRlxRvnsvOEI3y
	Xmu4eX6FqeFDa0DGPNUX9jH5hTKGrOD09TCFFfc=
X-Google-Smtp-Source: ABdhPJzhI8FoNzp+VcsrrNgRc8UuSXjsaqDeVG8/oXsGgYNEHlgbz2gYoB4zPVzcNfNNOv1KudqwLgfabAc8XsvlnOo=
X-Received: by 2002:a05:6e02:1bac:: with SMTP id n12mr3410318ili.151.1629996806989;
 Thu, 26 Aug 2021 09:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210825202805.714379-1-timothy.t.orling@intel.com> <e4091533694cd7b4a93407bf131eea0a28191c4d.camel@linuxfoundation.org>
In-Reply-To: <e4091533694cd7b4a93407bf131eea0a28191c4d.camel@linuxfoundation.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Thu, 26 Aug 2021 09:53:15 -0700
Message-ID: <CANx9H-BRC1E_waO9Typd8OabwM3+_XR+cq1eYWq8ZNb_xWLN8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pluggy: upgrade 0.13.1 -> 1.0.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Tim Orling <timothy.t.orling@intel.com>
Content-Type: multipart/alternative; boundary="000000000000aa6a6605ca7934d3"

--000000000000aa6a6605ca7934d3
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 26, 2021 at 9:12 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-08-25 at 20:28 +0000, Tim Orling wrote:
> > * All ptests pass on qemux86-64
> >
> > pluggy 1.0.0 (2021-08-25)
> >
> > Deprecations and Removals
> >
> >     #116: Remove deprecated implprefix support. Decorate hook
> >         implementations using an instance of HookimplMarker instead.
> > The deprecation was announced in release 0.7.0.
> >     #120: Remove the deprecated proc argument to call_historic. Use
> >         result_callback instead, which has the same behavior. The
> > deprecation was announced in release 0.7.0.
> >     #265: Remove the _Result.result property. Use _Result.get_result()
> >         instead. Note that unlike result, get_result() raises the
> > exception if the hook raised. The deprecation was announced in release
> > 0.6.0.
> >     #267: Remove official support for Python 3.4.
> >     #272: Dropped support for Python 2. Continue to use pluggy 0.13.x
> >         for Python 2 support.
> >     #308: Remove official support for Python 3.5.
> >     #313: The internal pluggy.callers, pluggy.manager and pluggy.hooks
> >         are now explicitly marked private by a _ prefix (e.g.
> > pluggy._callers). Only API exported by the top-level pluggy module is
> > considered public.
> >     #59: Remove legacy __multicall__ recursive hook calling system. The
> >        deprecation was announced in release 0.5.0.
> >
> > Features
> >
> >     #282: When registering a hookimpl which is declared as
> >         hookwrapper=True but whose function is not a generator
> > function, a PluggyValidationError exception is now raised.
> >
> >     Previously this problem would cause an error only later, when
> > calling the hook.
> >
> >     In the unlikely case that you have a hookwrapper that returns a
> > generator instead of yielding directly, for example:
> >
> >     def my_hook_real_implementation(arg):
> >         print("before")
> >         yield
> >         print("after")
> >
> >     @hookimpl(hookwrapper=True)
> >     def my_hook(arg):
> >         return my_hook_implementation(arg)
> >
> >     change it to use yield from instead:
> >
> >     @hookimpl(hookwrapper=True)
> >     def my_hook(arg):
> >         yield from my_hook_implementation(arg)
> >
> >     #309: Add official support for Python 3.9.
> >
> > Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
> > ---
> >  .../{python3-pluggy_0.13.1.bb => python3-pluggy_1.0.0.bb}      | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >  rename meta/recipes-devtools/python/{python3-pluggy_0.13.1.bb =>
> python3-pluggy_1.0.0.bb} (80%)
>
> I haven't proof but I suspect this has caused python3-jinja2's ptests to
> regress:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2433/steps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2152/steps/12/logs/stdio
>
> I didn't spot this before it merged unfortunately.
>

Replicated locally. Looking into fix.

>
> Cheers,
>
> Richard
>
>

--000000000000aa6a6605ca7934d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 26, 2021 at 9:12 AM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Wed, 2021-08-25 at 20:28 +0000, Tim Orling wr=
ote:<br>
&gt; * All ptests pass on qemux86-64<br>
&gt; <br>
&gt; pluggy 1.0.0 (2021-08-25)<br>
&gt; <br>
&gt; Deprecations and Removals<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0#116: Remove deprecated implprefix support. Decorat=
e hook<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0implementations using an instance of =
HookimplMarker instead.<br>
&gt; The deprecation was announced in release 0.7.0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0#120: Remove the deprecated proc argument to call_h=
istoric. Use<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result_callback instead, which has th=
e same behavior. The<br>
&gt; deprecation was announced in release 0.7.0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0#265: Remove the _Result.result property. Use _Resu=
lt.get_result()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instead. Note that unlike result, get=
_result() raises the<br>
&gt; exception if the hook raised. The deprecation was announced in release=
<br>
&gt; 0.6.0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0#267: Remove official support for Python 3.4.<br>
&gt;=C2=A0 =C2=A0 =C2=A0#272: Dropped support for Python 2. Continue to use=
 pluggy 0.13.x<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for Python 2 support.<br>
&gt;=C2=A0 =C2=A0 =C2=A0#308: Remove official support for Python 3.5.<br>
&gt;=C2=A0 =C2=A0 =C2=A0#313: The internal pluggy.callers, pluggy.manager a=
nd pluggy.hooks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0are now explicitly marked private by =
a _ prefix (e.g.<br>
&gt; pluggy._callers). Only API exported by the top-level pluggy module is<=
br>
&gt; considered public.<br>
&gt;=C2=A0 =C2=A0 =C2=A0#59: Remove legacy __multicall__ recursive hook cal=
ling system. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 deprecation was announced in release 0.5.0.=
<br>
&gt; <br>
&gt; Features<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0#282: When registering a hookimpl which is declared=
 as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hookwrapper=3DTrue but whose function=
 is not a generator<br>
&gt; function, a PluggyValidationError exception is now raised.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Previously this problem would cause an error only l=
ater, when<br>
&gt; calling the hook.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In the unlikely case that you have a hookwrapper th=
at returns a<br>
&gt; generator instead of yielding directly, for example:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0def my_hook_real_implementation(arg):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot;before&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot;after&quot;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@hookimpl(hookwrapper=3DTrue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0def my_hook(arg):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return my_hook_implementation(arg)<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0change it to use yield from instead:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@hookimpl(hookwrapper=3DTrue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0def my_hook(arg):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield from my_hook_implementation(arg=
)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0#309: Add official support for Python 3.9.<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@intel=
.com" target=3D"_blank">timothy.t.orling@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{<a href=3D"http://python3-pluggy_0.13.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pluggy_0.13.1.bb</a> =3D&gt; <a href=3D"http:=
//python3-pluggy_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-plu=
ggy_1.0.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 3 +--<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3-p=
luggy_0.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pluggy_0.13.1=
.bb</a> =3D&gt; <a href=3D"http://python3-pluggy_1.0.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-pluggy_1.0.0.bb</a>} (80%)<br>
<br>
I haven&#39;t proof but I suspect this has caused python3-jinja2&#39;s ptes=
ts to<br>
regress:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/2433/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2433/steps/12/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/2152/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2152/steps/12/logs/=
stdio</a><br>
<br>
I didn&#39;t spot this before it merged unfortunately.<br></blockquote><div=
><br></div><div>Replicated locally. Looking into fix.=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000aa6a6605ca7934d3--

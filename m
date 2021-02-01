Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.41381.1612212258217489990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 12:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YEIATAhv;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id f1so20448130edr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 12:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gt7mnpOmKElbH0WnnAJqWYjsTZtrAb5UJO2PSganxu4=;
        b=YEIATAhvezt0SNJeGYcnsbYrEv6dI3QnNFTw15HB6u1DmfrjbmuRvZ25sars69m/Gk
         3v0Rc1RW/nu+kB5EZUXAEh5bUCaChDVEinabfn3Msmre5lo8plGunx0d+nvgSajIQmZI
         UGcqkYDk5sNjgdEsR3mVKz2tPdADgRfyy6VUqLzulUOXD13iv9ZwwuWv2jUtVfLFz/2l
         C99t3iWUwbbB14qtCdfM5/fLiad4DEIUlBMtlllorjYUJURyk/3N5JD4asn90B/+Sktt
         LTSdzPgyXIRhHlDbxppzlQOOTjI/KwpOnGjWRouAdVh3QmzUsqRgv1HBJ62mseb9k48X
         nsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gt7mnpOmKElbH0WnnAJqWYjsTZtrAb5UJO2PSganxu4=;
        b=Chb6WW9bf5iv13KlAVzBOPfaRloHL20/fniUPkvqRltFxlpJq4WAIS1T1JbOA5BK04
         46VTVisydQub/XeRS4TvIVxSYIKcnRH+X29QyPhX2jWVDqKAIiyFBmNnHHkK0riOrYAF
         H/lxgI8osbqPnxzHTfldRq66l6yMsW7eOxr/0L0I+WEAovE8UW7fzAiJCrZ0BQ7/8dbG
         usUH3mebtcFH1nzjmOTNUvv44Ftm3K3jiu1gM2ymPl7dtJ6TtEOAh5pVt+a3yekSRqiA
         Z39IqOE2AQfYNAWeRC+1hRNBH3FmPMmJXAA2wcAI+9GmXfAkPwuVUJwPNM2Vrbvsy512
         BFFw==
X-Gm-Message-State: AOAM532FM1g0lGHh5XY93gcHYQal3XUarUa6iypp3uYA826Lb5gvFiqL
	9+UHhNAQNINFZ55JQmqZyzTs4DHpw6gAo4Y+XMQ=
X-Google-Smtp-Source: ABdhPJypSCBA/Bz0EHXZuN5qfa8QIjLLX1qT4YOMHiPIbTe2vcRPRSUOzge/pWNzf70vFHAEu0pjBauk3OZemm5DqD0=
X-Received: by 2002:a05:6402:524a:: with SMTP id t10mr20922294edd.270.1612212256662;
 Mon, 01 Feb 2021 12:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
 <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
 <CA+chaQdc7P6NsTno6oCcB4HmoseMziAXA57f646=YWWDPyEH8w@mail.gmail.com>
 <d29734c79a8d5712f4c2cc720e11071dedb68383.camel@linuxfoundation.org>
 <20210131095518.iqqi2lrx7n5b2csp@jama> <1af99424085f84d64915e6251cc809ac450b8b0f.camel@linuxfoundation.org>
 <20210131131023.2oor4o3nmhhg3gxi@jama> <00626d6958d579647798adac8c3499b21584d701.camel@linuxfoundation.org>
In-Reply-To: <00626d6958d579647798adac8c3499b21584d701.camel@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 1 Feb 2021 21:44:04 +0100
Message-ID: <CA+chaQdYKmSGvORtQdV_kt59tUZCmkb_ff=t1Ao3cWimD46zEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Watt <JPEW.hacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dc67b605ba4c6a9f"

--000000000000dc67b605ba4c6a9f
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 1, 2021 at 9:21 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2021-01-31 at 14:10 +0100, Martin Jansa wrote:
> > On Sun, Jan 31, 2021 at 10:34:48AM +0000, Richard Purdie wrote:
> > > Its the first time I've heard a report of that and it sounds a little
> > > worrying. What you say stuck, bitbake hangs? Is it using cpu? A process
> > > tree of what it looks like when stuck would be interesting if it is
> > > hanging and maybe the last things in any running or just finished task
> > > logs. It could be some issue with the way a failing task is handled?
> > >
> > > We've seen a lot of weird issues on the autobuilder but not that. Could
> > > you have something enabled in your setup for logging/reporting whch
> > > wouldn't be in ours and could be causing it?
> >
> > It doesn't seem to happen very often and I guess autobuilder doesn't
> > include meta-python2 (which is currently the only reproducer in my list
> > of layers).
>
> We don't use meta-python2 on the autobuilder so that could explain why
> we've not seen this.
>
> > I've tried to reproduce it with just 3 layers included:
> > BBLAYERS = " \
> >   /OE/build/oe-core/meta-python2 \
> >   /OE/build/oe-core/meta-openembedded/meta-oe \
> >   /OE/build/oe-core/openembedded-core/meta \
> > "
> >
> > and it happened on 3rd try (cache, tmpdir, sstate-cache were removed
> > only before 1st try)
> >
> > martin@jama:/OE/build/oe-core$ bitbake -k python-native
> > Loading cache: 100% |
>
>
>                       | ETA:  --:--:--
> > Loaded 0 entries from dependency cache.
> > ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: QA Issue:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being
> package specific, please fix this. [pkgvarcheck]
> > ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> > ERROR: Failed to parse recipe:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb
>
>              | ETA:  0:00:14
> >
> > Summary: There were 3 ERROR messages shown, returning a non-zero exit
> code.
> > martin@jama:/OE/build/oe-core$ bitbake -k python-native
> > NOTE: Reconnecting to bitbake server...
> > Loading cache: 100%
> |###################################################################################################################################################################################################################################|
> Time: 0:00:00
> > Loaded 845 entries from dependency cache.
> > ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-native_2.7.18.bb: Error executing a python function in <code>:
>
>                                      | ETA:  0:01:10
> >
> > The stack trace of python calls that resulted in this exception/failure
> was:
> > File: '<code>', lineno: 14, function: <module>
> >
>      0010:__anon_35__OE_build_oe_core_openembedded_core_meta_classes_devshell_bbclass(d)
> >
>      0011:__anon_151__OE_build_oe_core_openembedded_core_meta_classes_sstate_bbclass(d)
> >
>      0012:__anon_20__OE_build_oe_core_openembedded_core_meta_classes_blacklist_bbclass(d)
> >
>      0013:__anon_177__OE_build_oe_core_openembedded_core_meta_classes_siteinfo_bbclass(d)
> >  ***
> 0014:__anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_python_native_2_7_18_bb(d)
> > File: '/OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-native_2.7.18.bb', lineno: 76, function:
> __anon_90__OE_build_oe_core_meta_python2_recipes_devtools_python_python_native_2_7_18_bb
> >      0072:        manifest_file.seek(json_start)
> >      0073:        manifest_str = manifest_file.read()
> >      0074:        python_manifest = json.loads(manifest_str)
> >      0075:
> >  *** 0076:    rprovides = d.getVar('RPROVIDES').split()
> >      0077:
> >      0078:    # Hardcoded since it cant be python-native-foo, should be
> python-foo-native
> >      0079:    pn = 'python'
> >      0080:
> > Exception: AttributeError: 'NoneType' object has no attribute 'split'
>
> This sounds like a similar issue to the one I fixed in the python3
> recipe:
>
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=cff7db890cdfab41cc8f74e3dc378660d9b6219e


Yes, I've already sent similar patch for meta-python2 yesterday (and today
asked for write access again as last e-mail from Tim clearly said he
doesn't want to maintain it anymore)


> > ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: QA Issue:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being
> package specific, please fix this. [pkgvarcheck]
> > ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
> > ERROR: Failed to parse recipe:
> /OE/build/oe-core/meta-python2/recipes-devtools/python/
> python-native_2.7.18.bb
>
>              | ETA:  0:00:30
>
> Which makes me wonder whether the real issue is a bug in bitbake when
> parsing fails. We did have an issue like that a while back but I
> thought it was fixed by changes both Joshua and I made.
>


> It sounds like the failed parsing is causing the parsing pool to fail
> to clean up properly and its hanging at exit. I don't know why :(
>


> I think after a certain number of tries, its not hitting the magic
> combination where the parse failure breaks the parsing pool.
>
>
> I think the reproducer will be some combination of parsing failures and
> a need to parse a larger number of recipes. I will give debug some
> further thought, I'm not entirely sure how to proceed on this one at
> the moment :/.
>
> I suspect if you're not hitting parse failures, things will calm down
> though.
>


Yes, I'm sorry if I wasn't clear, all these meta-python2 issues I've
mentioned are easy to fix and I already did (based on your changes in
oe-core), they were shown just as a case which sometimes leads to bitbake
to gettting stuck, with both fixes applied in meta-python2 I haven't
noticed bitbake getting stuck (with latest oe-core + bitbake).

In dunfell based builds I quite often see builds getting stuck on jenkins,
usually after parsing error caused by bad SRCREV (developers use reference
to gerrit review like SRCREV_pn-foo = "refs/changes/59/295159/96" but then
trigger many verification builds with it which include some builds where
foo's SRC_URI points to different repository
where refs/changes/59/295159/96 doesn't exit and git ls-remote fails during
"foo" parsing. But again this might be just the huge number of dunfell
builds we do with similar overrides and the root cause for getting stuck
might be the same as what we're seeing now with this meta-python2 in master.

Cheers,

--000000000000dc67b605ba4c6a9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Feb 1, 2021 at 9:21 PM Richard Pu=
rdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2021-01-31 at 14:1=
0 +0100, Martin Jansa wrote:<br>
&gt; On Sun, Jan 31, 2021 at 10:34:48AM +0000, Richard Purdie wrote:<br>
&gt; &gt; Its the first time I&#39;ve heard a report of that and it sounds =
a little<br>
&gt; &gt; worrying. What you say stuck, bitbake hangs? Is it using cpu? A p=
rocess<br>
&gt; &gt; tree of what it looks like when stuck would be interesting if it =
is<br>
&gt; &gt; hanging and maybe the last things in any running or just finished=
 task<br>
&gt; &gt; logs. It could be some issue with the way a failing task is handl=
ed?<br>
&gt; &gt; <br>
&gt; &gt; We&#39;ve seen a lot of weird issues on the autobuilder but not t=
hat. Could<br>
&gt; &gt; you have something enabled in your setup for logging/reporting wh=
ch<br>
&gt; &gt; wouldn&#39;t be in ours and could be causing it?<br>
&gt; <br>
&gt; It doesn&#39;t seem to happen very often and I guess autobuilder doesn=
&#39;t<br>
&gt; include meta-python2 (which is currently the only reproducer in my lis=
t<br>
&gt; of layers).<br>
<br>
We don&#39;t use meta-python2 on the autobuilder so that could explain why<=
br>
we&#39;ve not seen this.<br>
<br>
&gt; I&#39;ve tried to reproduce it with just 3 layers included:<br>
&gt; BBLAYERS =3D &quot; \<br>
&gt; =C2=A0=C2=A0/OE/build/oe-core/meta-python2 \<br>
&gt; =C2=A0=C2=A0/OE/build/oe-core/meta-openembedded/meta-oe \<br>
&gt; =C2=A0=C2=A0/OE/build/oe-core/openembedded-core/meta \<br>
&gt; &quot;<br>
&gt; <br>
&gt; and it happened on 3rd try (cache, tmpdir, sstate-cache were removed<b=
r>
&gt; only before 1st try)<br>
&gt; <br>
&gt; martin@jama:/OE/build/oe-core$ bitbake -k python-native<br>
&gt; Loading cache: 100% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | ETA:=C2=A0 --:--:--<br>
&gt; Loaded 0 entries from dependency cache.<br>
&gt; ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=
=3D"http://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank=
">python-setuptools_42.0.2.bb</a>: QA Issue: /OE/build/oe-core/meta-python2=
/recipes-devtools/python/<a href=3D"http://python-setuptools_42.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python-setuptools_42.0.2.bb</a>: Variable=
 RPROVIDES is set as not being package specific, please fix this. [pkgvarch=
eck]<br>
&gt; ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=
=3D"http://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank=
">python-setuptools_42.0.2.bb</a>: Fatal QA errors found, failing task.<br>
&gt; ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-=
devtools/python/<a href=3D"http://python-setuptools_42.0.2.bb" rel=3D"noref=
errer" target=3D"_blank">python-setuptools_42.0.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:14<br>
&gt; <br>
&gt; Summary: There were 3 ERROR messages shown, returning a non-zero exit =
code.<br>
&gt; martin@jama:/OE/build/oe-core$ bitbake -k python-native<br>
&gt; NOTE: Reconnecting to bitbake server...<br>
&gt; Loading cache: 100% |#################################################=
###########################################################################=
###########################################################################=
############################| Time: 0:00:00<br>
&gt; Loaded 845 entries from dependency cache.<br>
&gt; ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=
=3D"http://python-native_2.7.18.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon-native_2.7.18.bb</a>: Error executing a python function in &lt;code&gt=
;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:01:10<br>
&gt; <br>
&gt; The stack trace of python calls that resulted in this exception/failur=
e was:<br>
&gt; File: &#39;&lt;code&gt;&#39;, lineno: 14, function: &lt;module&gt;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00010:__anon_35__OE_build_oe_core_openemb=
edded_core_meta_classes_devshell_bbclass(d)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00011:__anon_151__OE_build_oe_core_openem=
bedded_core_meta_classes_sstate_bbclass(d)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00012:__anon_20__OE_build_oe_core_openemb=
edded_core_meta_classes_blacklist_bbclass(d)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00013:__anon_177__OE_build_oe_core_openem=
bedded_core_meta_classes_siteinfo_bbclass(d)<br>
&gt; =C2=A0*** 0014:__anon_90__OE_build_oe_core_meta_python2_recipes_devtoo=
ls_python_python_native_2_7_18_bb(d)<br>
&gt; File: &#39;/OE/build/oe-core/meta-python2/recipes-devtools/python/<a h=
ref=3D"http://python-native_2.7.18.bb" rel=3D"noreferrer" target=3D"_blank"=
>python-native_2.7.18.bb</a>&#39;, lineno: 76, function: __anon_90__OE_buil=
d_oe_core_meta_python2_recipes_devtools_python_python_native_2_7_18_bb<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00072:=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifes=
t_file.seek(json_start)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00073:=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifes=
t_str =3D manifest_file.read()<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00074:=C2=A0 =C2=A0 =C2=A0 =C2=A0 python_=
manifest =3D json.loads(manifest_str)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00075:<br>
&gt; =C2=A0*** 0076:=C2=A0 =C2=A0 rprovides =3D d.getVar(&#39;RPROVIDES&#39=
;).split()<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00077:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00078:=C2=A0 =C2=A0 # Hardcoded since it =
cant be python-native-foo, should be python-foo-native<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00079:=C2=A0 =C2=A0 pn =3D &#39;python&#3=
9;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00080:<br>
&gt; Exception: AttributeError: &#39;NoneType&#39; object has no attribute =
&#39;split&#39;<br>
<br>
This sounds like a similar issue to the one I fixed in the python3<br>
recipe:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dcff7db890=
cdfab41cc8f74e3dc378660d9b6219e" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dcff7db890cdfab41cc8f74e3d=
c378660d9b6219e</a></blockquote><div><br></div><div>Yes, I&#39;ve already s=
ent similar patch for meta-python2 yesterday (and today asked for write acc=
ess again as last e-mail from Tim clearly said he doesn&#39;t want to maint=
ain it anymore)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">&gt; ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/py=
thon/<a href=3D"http://python-setuptools_42.0.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python-setuptools_42.0.2.bb</a>: QA Issue: /OE/build/oe-core/=
meta-python2/recipes-devtools/python/<a href=3D"http://python-setuptools_42=
.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python-setuptools_42.0.2.bb</=
a>: Variable RPROVIDES is set as not being package specific, please fix thi=
s. [pkgvarcheck]<br>
&gt; ERROR: /OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=
=3D"http://python-setuptools_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank=
">python-setuptools_42.0.2.bb</a>: Fatal QA errors found, failing task.<br>
&gt; ERROR: Failed to parse recipe: /OE/build/oe-core/meta-python2/recipes-=
devtools/python/<a href=3D"http://python-native_2.7.18.bb" rel=3D"noreferre=
r" target=3D"_blank">python-native_2.7.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:30<br>
<br>
Which makes me wonder whether the real issue is a bug in bitbake when<br>
parsing fails. We did have an issue like that a while back but I<br>
thought it was fixed by changes both Joshua and I made.<br></blockquote><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It sounds l=
ike the failed parsing is causing the parsing pool to fail<br>
to clean up properly and its hanging at exit. I don&#39;t know why :(<br></=
blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
I think after a certain number of tries, its not hitting the magic<br>
combination where the parse failure breaks the parsing pool.<br>
<br><br>
I think the reproducer will be some combination of parsing failures and<br>
a need to parse a larger number of recipes. I will give debug some<br>
further thought, I&#39;m not entirely sure how to proceed on this one at<br=
>
the moment :/.<br>
<br>
I suspect if you&#39;re not hitting parse failures, things will calm down<b=
r>
though.<br></blockquote><div><br></div><div><br></div><div>Yes, I&#39;m sor=
ry if I wasn&#39;t clear, all these meta-python2 issues I&#39;ve mentioned =
are easy to fix and I already did (based on your changes in oe-core), they =
were shown just as a case which sometimes leads to bitbake to gettting stuc=
k, with both fixes applied in meta-python2 I haven&#39;t noticed bitbake ge=
tting stuck (with latest oe-core=C2=A0+ bitbake).<br></div><div><br></div><=
div>In dunfell based builds I quite often see builds getting stuck on jenki=
ns, usually after parsing error caused by bad SRCREV (developers use refere=
nce to gerrit review like SRCREV_pn-foo =3D &quot;refs/changes/59/295159/96=
&quot; but then trigger many verification builds with it which include some=
 builds where foo&#39;s SRC_URI points to different repository where=C2=A0r=
efs/changes/59/295159/96 doesn&#39;t exit and git ls-remote fails during &q=
uot;foo&quot; parsing. But again this might be just the huge number of dunf=
ell builds we do with similar overrides and the root cause for getting stuc=
k might be the same as what we&#39;re seeing now with this meta-python2 in =
master.</div><div>=C2=A0=C2=A0</div><div>Cheers,</div></div></div>

--000000000000dc67b605ba4c6a9f--

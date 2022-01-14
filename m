Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA7AC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:05:07 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web12.10753.1642183506831584687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N4lOb+VW;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id c36so18208291uae.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2lnJ4QhiW2GlVw36ao2StF0+REaRIyn2teuWv+SkR4=;
        b=N4lOb+VWJ+TVuTj/llOGjcr1JlQNhSIgG/lLzRxo4P/35m48UPiBJ3GdQFBs7MtDz/
         tv+KXUNtWvKCHij4bK6m1xmepVBN6CYmBy/o6yZIGCtTulo+cjz4paxwRBp6Xo7mKDGk
         eUnky/Qz4OmFGcMALqzHoJafD7c3vJDnr/Bm/EIZ2fYkrZmym1cPe+nUZt4mfE/TTvN+
         V2HKO/Fm8j1fYfbiK2OgsXHKNDGPlqgaeCwUF6Irp4wKX9CtH6X+Oezi0JI5Wx/hm5B6
         9nHJ/2rQK3O8VOT7JPOvU59ebLopBHhBOs/5XApimEK4zDxXjbFxhGuMljoLnEAiEiTA
         zlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2lnJ4QhiW2GlVw36ao2StF0+REaRIyn2teuWv+SkR4=;
        b=CV72jk7uzOCzpfri55fFIecB8beqI1mnfRW6e/lOTpuTXIMCMmZPM0XIy9sycb647k
         wJLChNjORFS/db6NbUmo/9ELVUDipgBCWDwAH7AqH1qnScjdC26keL2rjUtXmLRwZ+rR
         UfFtb8C/pU5EMdqYVju4d3HDWLoGF6gW72LolnfP/VxPRLXsLAflbx0qIaNv54Kq+cA2
         SPVjTMrlbd9CinFlZ6LqzwtwYbGzAFkF2Gmu20u4x+h7xm/9eoWgBc5TZlL8LQYq5kcu
         pVQqmaAJwP/OD4MeforwszoBaJEDkoa31dWfVzk59E8JlDZnMYKo63GWqE46YYRoW1+F
         BJ0w==
X-Gm-Message-State: AOAM53297pSZK4XBQVubdrvvTe0kIuAOOtoJPY9cj3MUPIZuHHIJ5IkN
	RM/WjE9pKXPS8rTsLOS04/H9vAS2MrfHb4o+63w=
X-Google-Smtp-Source: 
 ABdhPJylc80ZwjE6bJFYoXkkJ36ELqYcbAATvmwXowUq3Yctx9ZgkVtjFsQ2q5EcCDXw0bEgnFdZ7aBih61F48ePYgs=
X-Received: by 2002:a67:f882:: with SMTP id h2mr4650309vso.81.1642183505931;
 Fri, 14 Jan 2022 10:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20220114171222.1788462-1-JPEWhacker@gmail.com>
 <86120c6d-a092-432c-a0fe-26ca5c57792c@gmail.com>
In-Reply-To: <86120c6d-a092-432c-a0fe-26ca5c57792c@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jan 2022 19:04:54 +0100
Message-ID: 
 <CANNYZj9+d9gB4k_2vzK21_Vgk8fM=cR9C77ZjYFyj0O7g48NTQ@mail.gmail.com>
Subject: Re: [OE-core][RFC] classes/native: Propagate dependencies to outhash
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000086f1ae05d58ea408"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:05:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160580

--00000000000086f1ae05d58ea408
Content-Type: text/plain; charset="UTF-8"

While we're here, recipes inheriting qemu class should do this too, but for
the target dependencies.

Alex

On Fri, 14 Jan 2022 at 18:50, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On 1/14/22 18:12, Joshua Watt wrote:
> > Native task outputs are directly run on the target (host) system after
>
> "target" or "host" ? the latter i suppose
>
> > being built. Even if the output of a native recipe doesn't change, a
> > change in one of its dependencies may cause a change in the output it
> > generates (e.g. rpm output depends on the output of its dependent zstd
> > library).
> >
> > This can cause poor interactions with hash equivalence, since this
> > recipes output-changing dependency is "hidden" and downstream task only
> > see that this recipe has the same outhash and therefore is equivalent.
> > This can result in different output in different cases.
> >
> > To resolve this, unhide the output-changing dependency by adding it's
> > unihash to this tasks outhash calculation. Unfortunately, don't know
> > specifically know which dependencies are output-changing, so we have to
> > add all of them.
> >
>
> "don't know specifically know which.."
>
> > [YOCTO #14685]
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes/native.bbclass | 31 +++++++++++++++++++++++++++++++
> >  meta/lib/oe/sstatesig.py    | 10 +++++++---
> >  2 files changed, 38 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> > index 76a599bc15..fc7422c5d7 100644
> > --- a/meta/classes/native.bbclass
> > +++ b/meta/classes/native.bbclass
> > @@ -195,3 +195,34 @@ USE_NLS = "no"
> >
> >  RECIPERDEPTASK = "do_populate_sysroot"
> >  do_populate_sysroot[rdeptask] = "${RECIPERDEPTASK}"
> > +
> > +#
> > +# Native task outputs are directly run on the target (host) system
> after being
>
> see above
>
> > +# built. Even if the output of this recipe doesn't change, a change in
> one of
> > +# its dependencies may cause a change in the output it generates (e.g.
> rpm
> > +# output depends on the output of its dependent zstd library).
> > +#
> > +# This can cause poor interactions with hash equivalence, since this
> recipes
> > +# output-changing dependency is "hidden" and downstream task only see
> that this
> > +# recipe has the same outhash and therefore is equivalent. This can
> result in
> > +# different output in different cases.
> > +#
> > +# To resolve this, unhide the output-changing dependency by adding its
> unihash
> > +# to this tasks outhash calculation. Unfortunately, don't know
> specifically
> > +# know which dependencies are output-changing, so we have to add all of
> them.
> > +#
>
> see above
>
> > +python native_add_do_populate_sysroot_deps () {
> > +    current_task = "do_" + d.getVar("BB_CURRENTTASK")
> > +    if current_task != "do_populate_sysroot":
> > +        return
> > +
> > +    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
> > +    pn = d.getVar("PN")
> > +    deps = {
> > +        dep[0]:dep[6] for dep in taskdepdata.values() if
> > +            dep[1] == current_task and dep[0] != pn
> > +    }
> > +
> > +    d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k,
> deps[k]) for k in sorted(deps.keys())))
> > +}
> > +SSTATECREATEFUNCS += "native_add_do_populate_sysroot_deps"
> > diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> > index 038404e377..abcd96231e 100644
> > --- a/meta/lib/oe/sstatesig.py
> > +++ b/meta/lib/oe/sstatesig.py
> > @@ -491,7 +491,8 @@ def OEOuthashBasic(path, sigfile, task, d):
> >      if task == "package":
> >          include_timestamps = True
> >          include_root = False
> > -    extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
> > +    hash_version = d.getVar('HASHEQUIV_HASH_VERSION')
> > +    extra_sigdata = d.getVar("HASHEQUIV_EXTRA_SIGDATA")
> >
> >      filemaps = {}
> >      for m in (d.getVar('SSTATE_HASHEQUIV_FILEMAP') or '').split():
> > @@ -506,8 +507,11 @@ def OEOuthashBasic(path, sigfile, task, d):
> >          basepath = os.path.normpath(path)
> >
> >          update_hash("OEOuthashBasic\n")
> > -        if extra_content:
> > -            update_hash(extra_content + "\n")
> > +        if hash_version:
> > +            update_hash(hash_version + "\n")
> > +
> > +        if extra_sigdata:
> > +            update_hash(extra_sigdata + "\n")
> >
> >          # It is only currently useful to get equivalent hashes for
> things that
> >          # can be restored from sstate. Since the sstate object is named
> using
> >
> >
> >
> >
> >
>
> Sounds to me like something we should do.
>
> Jacob
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160573):
> https://lists.openembedded.org/g/openembedded-core/message/160573
> Mute This Topic: https://lists.openembedded.org/mt/88425608/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000086f1ae05d58ea408
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>While we&#39;re here, recipes inheriting qemu class s=
hould do this too, but for the target dependencies.</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 14 Jan 2022 at 18:50, Jacob Kroon &lt;<a href=3D"ma=
ilto:jacob.kroon@gmail.com">jacob.kroon@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On 1/14/22 18:12, Joshua W=
att wrote:<br>
&gt; Native task outputs are directly run on the target (host) system after=
<br>
<br>
&quot;target&quot; or &quot;host&quot; ? the latter i suppose<br>
<br>
&gt; being built. Even if the output of a native recipe doesn&#39;t change,=
 a<br>
&gt; change in one of its dependencies may cause a change in the output it<=
br>
&gt; generates (e.g. rpm output depends on the output of its dependent zstd=
<br>
&gt; library).<br>
&gt; <br>
&gt; This can cause poor interactions with hash equivalence, since this<br>
&gt; recipes output-changing dependency is &quot;hidden&quot; and downstrea=
m task only<br>
&gt; see that this recipe has the same outhash and therefore is equivalent.=
<br>
&gt; This can result in different output in different cases.<br>
&gt; <br>
&gt; To resolve this, unhide the output-changing dependency by adding it&#3=
9;s<br>
&gt; unihash to this tasks outhash calculation. Unfortunately, don&#39;t kn=
ow<br>
&gt; specifically know which dependencies are output-changing, so we have t=
o<br>
&gt; add all of them.<br>
&gt; <br>
<br>
&quot;don&#39;t know specifically know which..&quot;<br>
<br>
&gt; [YOCTO #14685]<br>
&gt; <br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/native.bbclass | 31 +++++++++++++++++++++++++++++++=
<br>
&gt;=C2=A0 meta/lib/oe/sstatesig.py=C2=A0 =C2=A0 | 10 +++++++---<br>
&gt;=C2=A0 2 files changed, 38 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass=
<br>
&gt; index 76a599bc15..fc7422c5d7 100644<br>
&gt; --- a/meta/classes/native.bbclass<br>
&gt; +++ b/meta/classes/native.bbclass<br>
&gt; @@ -195,3 +195,34 @@ USE_NLS =3D &quot;no&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 RECIPERDEPTASK =3D &quot;do_populate_sysroot&quot;<br>
&gt;=C2=A0 do_populate_sysroot[rdeptask] =3D &quot;${RECIPERDEPTASK}&quot;<=
br>
&gt; +<br>
&gt; +#<br>
&gt; +# Native task outputs are directly run on the target (host) system af=
ter being<br>
<br>
see above<br>
<br>
&gt; +# built. Even if the output of this recipe doesn&#39;t change, a chan=
ge in one of<br>
&gt; +# its dependencies may cause a change in the output it generates (e.g=
. rpm<br>
&gt; +# output depends on the output of its dependent zstd library).<br>
&gt; +#<br>
&gt; +# This can cause poor interactions with hash equivalence, since this =
recipes<br>
&gt; +# output-changing dependency is &quot;hidden&quot; and downstream tas=
k only see that this<br>
&gt; +# recipe has the same outhash and therefore is equivalent. This can r=
esult in<br>
&gt; +# different output in different cases.<br>
&gt; +#<br>
&gt; +# To resolve this, unhide the output-changing dependency by adding it=
s unihash<br>
&gt; +# to this tasks outhash calculation. Unfortunately, don&#39;t know sp=
ecifically<br>
&gt; +# know which dependencies are output-changing, so we have to add all =
of them.<br>
&gt; +#<br>
<br>
see above<br>
<br>
&gt; +python native_add_do_populate_sysroot_deps () {<br>
&gt; +=C2=A0 =C2=A0 current_task =3D &quot;do_&quot; + d.getVar(&quot;BB_CU=
RRENTTASK&quot;)<br>
&gt; +=C2=A0 =C2=A0 if current_task !=3D &quot;do_populate_sysroot&quot;:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 taskdepdata =3D d.getVar(&quot;BB_TASKDEPDATA&quot;, Fa=
lse)<br>
&gt; +=C2=A0 =C2=A0 pn =3D d.getVar(&quot;PN&quot;)<br>
&gt; +=C2=A0 =C2=A0 deps =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep[0]:dep[6] for dep in taskdepdata.valu=
es() if<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep[1] =3D=3D current_task =
and dep[0] !=3D pn<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 d.setVar(&quot;HASHEQUIV_EXTRA_SIGDATA&quot;, &quot;\n&=
quot;.join(&quot;%s: %s&quot; % (k, deps[k]) for k in sorted(deps.keys())))=
<br>
&gt; +}<br>
&gt; +SSTATECREATEFUNCS +=3D &quot;native_add_do_populate_sysroot_deps&quot=
;<br>
&gt; diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py<br>
&gt; index 038404e377..abcd96231e 100644<br>
&gt; --- a/meta/lib/oe/sstatesig.py<br>
&gt; +++ b/meta/lib/oe/sstatesig.py<br>
&gt; @@ -491,7 +491,8 @@ def OEOuthashBasic(path, sigfile, task, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if task =3D=3D &quot;package&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include_timestamps =3D True<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include_root =3D False<br>
&gt; -=C2=A0 =C2=A0 extra_content =3D d.getVar(&#39;HASHEQUIV_HASH_VERSION&=
#39;)<br>
&gt; +=C2=A0 =C2=A0 hash_version =3D d.getVar(&#39;HASHEQUIV_HASH_VERSION&#=
39;)<br>
&gt; +=C2=A0 =C2=A0 extra_sigdata =3D d.getVar(&quot;HASHEQUIV_EXTRA_SIGDAT=
A&quot;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 filemaps =3D {}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for m in (d.getVar(&#39;SSTATE_HASHEQUIV_FILEMAP&#=
39;) or &#39;&#39;).split():<br>
&gt; @@ -506,8 +507,11 @@ def OEOuthashBasic(path, sigfile, task, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basepath =3D os.path.normpath(path)<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_hash(&quot;OEOuthashBasic\n&q=
uot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra_content:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_hash(extra_content +=
 &quot;\n&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if hash_version:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_hash(hash_version + =
&quot;\n&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra_sigdata:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_hash(extra_sigdata +=
 &quot;\n&quot;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # It is only currently useful to get=
 equivalent hashes for things that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # can be restored from sstate. Since=
 the sstate object is named using<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
Sounds to me like something we should do.<br>
<br>
Jacob<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160573): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160573" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160573</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88425608/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88425608/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000086f1ae05d58ea408--


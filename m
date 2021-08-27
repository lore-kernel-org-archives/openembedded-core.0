Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web09.757.1630094971575799494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 13:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DgIR0R89;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id i13so8170061ilm.4
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 13:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VgAefLMhcWVO4BucHvZ+epcZATInRmJDPbVT1vyiyLg=;
        b=DgIR0R89aXiQB+p1pCvybxSOKbZXUOrcO4eUGiubfeT9xEJu45HZhUstXI6Gf2+II1
         N9cqCKqrfeaj+tPdR2DFLGx+IUIKB5J7PQbJodMhdBpVxNVsKCXFCyO1r5DNZ3P4IT3o
         PfslC5GQ5rCgc4/eSo/IFZqib32d93IHxSPTTKn9tg4mqawVMciQBKYMbn3bc8S6y1Ik
         mLyDIhVGsAzrCwJsR0jxr7ygD57VM5ZaGAqQnK5q6tTuaed6LxPKs+e6C8MdVOdCnE5p
         u7O7TeXzCwBjX8cURCwJ6yfnujch3IoFjIMbay7klxxgNkQdNLlTBNvTG+8P9bwy5Oe1
         mieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VgAefLMhcWVO4BucHvZ+epcZATInRmJDPbVT1vyiyLg=;
        b=gAfqzoRWhnOOKr7TiZDNCcjpG81eCBL0LaKh6MVt1nxu+ayGbmquypIm5u+hxFn379
         9bhjpUijsj1tWB57VxrDQhN4Qxi2mcMxY5jyKtSdWLdoJV0+wcRNOWdojjacoJn8rThs
         Fp1p/tk/vuxazJAnr9V7OVK3jWUsf1XhwYQiMiD87bSxpfSj6KLSMHdDNr1TarSHG1sq
         7kKvEVUyW9Mbs1olRpZBZrDtgv0mCDhbgmEmb6dZwuqhbrppXQn07h4xJYFbVxasz4kT
         /wLXZVP0umdVoiRoJm4TqAdzTmewa7IGUmY/qaV2uTvUR1ZIhDkGeg09Pyz0MaECQgMx
         4bjw==
X-Gm-Message-State: AOAM5303jryxbu/f4r2h84ouZ1EgvGrRboJZsPhAW54C5N02DOPtCXA+
	qSpeQIWn4DKuxzW/sz053fJNtkfggETWtiVQED8=
X-Google-Smtp-Source: ABdhPJzb63LPx4UuvCbwcM0hsxh5WvZ8rQ8kG0SGzjyWeckFvdXrY03qabmgVnaW1OfmLGCPAKSUbiivJjMur04MGKc=
X-Received: by 2002:a92:ce86:: with SMTP id r6mr7814554ilo.170.1630094970850;
 Fri, 27 Aug 2021 13:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
 <20210813151947.55142-1-vinay.m.engg@gmail.com> <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
 <169C1FA457B99CA0.23238@lists.openembedded.org> <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
 <169D3274AAECC435.19323@lists.openembedded.org> <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
 <87dacc6ecc7af109db0039894254c77b43ae8323.camel@linuxfoundation.org>
 <3e7ff50b-57f8-0503-b514-e53a82e0b2d5@windriver.com> <e36985f82120c87f598289c672eafdacb5e37d86.camel@linuxfoundation.org>
 <169E4C0C80951608.1595@lists.openembedded.org> <23bc2196-4f7c-4958-e191-bd6f47223da2@windriver.com>
In-Reply-To: <23bc2196-4f7c-4958-e191-bd6f47223da2@windriver.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 27 Aug 2021 13:09:20 -0700
Message-ID: <CANx9H-BMdX=J9dHiHUOFg9C9sYpbnmkjybmdHUy5vChWaudPDg@mail.gmail.com>
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Khem Raj <raj.khem@gmail.com>, 
	"Orling, Timothy T" <timothy.t.orling@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>, Vinay Kumar <vinay.m.engg@gmail.com>, 
	anbelski@linux.microsoft.com, cardoe@cardoe.com, derek@asterius.io, 
	dev@codyps.com, johan.anderholm@gmail.com, martin.jansa@gmail.com, 
	paul@pbarker.dev, saul.wold@windriver.com, steven@stevenwalter.org, 
	tylerwhall@gmail.com, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="000000000000b0142205ca900fbe"

--000000000000b0142205ca900fbe
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 26, 2021 at 9:05 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2021-08-24 12:48 p.m., Randy MacLeod wrote:
> > Add Steven Walter in hopes that he or someone else
> > who uses meta-rust will help out.
> >
> > On 2021-08-23 5:21 a.m., Richard Purdie wrote:
> >> On Sun, 2021-08-22 at 08:45 -0400, Randy MacLeod wrote:
> >>> On 2021-08-22 7:19 a.m., Richard Purdie wrote:
> >>>> On Sat, 2021-08-21 at 23:12 -0400, Randy MacLeod wrote:
> >>>>> On 2021-08-20 10:48 p.m., Randy MacLeod wrote:
> >>>>> With a patch from Richard, and the http_proxy check removed,
> >>>>> $ git diff | grep "^[+-]"
> >>>>>    --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> >>>>>    +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> >>>>>    -http_proxy = "http://example.com/"
> >>>>>    +http_proxy = ""
> >>>>> we have fixed the oe-selftest that was failing.
> >>>>>    Any volunteers to stub out the http[s]_proxy code in cargo ?
> >>>>> I've written up a commit log that could use some review and pushed
> >>>>> an update
> >>>>> to:
> >>>>>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-17-2021-a
> >>>>>
> >>>>>
> >>>>
> >>>> I'm not sure you need to change cargo, I think if you remove the bit
> >>>> in the
> >>>> bbclass that injects http_proxy, the tests are ok. That will perhaps
> >>>> break
> >>>> anyone using proxies but for now, I think that is a reasonable step
> >>>> of getting
> >>>> this moved forward?
> >>> That's what I hoped for as well but not what my testing showed.
> >>>
> >>> I removed (commented out actually) the http_proxy injection here:
> >>>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rmacleod/rust-redo-aug-17-2021-a&id=a4808f787caf8d0b44cf3946cf204164f24f91d4
> >>>
> >>>
> >>> but the test still fails unless I mangle the test:
> >>>
> >>>      meta/lib/oeqa/selftest/cases/sstatetests.py
> >>>
> >>>
> >>>      -http_proxy = "http://example.com/"
> >>>
> >>>
> >>>      +http_proxy = ""
> >> Right, my point is that doesn't remove it. You need to delete it, not
> >> comment it
> >> out.
> >>
> >> The issue is that bitbake does variable expansion on the scripts
> >> before running
> >> them.
> >>
> >> It can't tell that this is a comment, just that the script differs after
> >> variable expansion.
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >>
> > Richard has fixed several new issues and is testing this in master-next:
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=master-next
> >
> > using the YP autobuilder.
> >
> > We're seeing some odd intermittent build failures especially when using
> > the uninative class (used by default in poky) perhaps on older hosts but
> > we're not 100% sure of that correlation yet. See below and:
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/581/steps/13/logs/stdio
> >
> >
> > If we can't get this fixed in the next day or two, we'll miss the fall
> > release.
> >
> > ../Randy
>
>
> Thanks to Richard's dogged determination and Herculean efforts,
> the Rust recipes are now merged to the oe-core master branch.
>
>     https://git.openembedded.org/openembedded-core/log/?qt=range&q=master
>

Thank you Richard, Randy and everyone else involved.

>
>
> There are still some known problems, such as:
>
> 1. Tim Orling finding that Rust fails to build python-cryptography:
>
>
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/rust_python3-cryptography
>

With the patch below, this branch now builds the latest
pyhton3-cryptography 3.4.8. There are some ptest warnings and errors that
are still in progress. Also the recipes in this branch need a final scrub
before submitting.

Happy to have anyone test the branch if you use python3-cryptography.

>
> Tim says that this change helps:
>
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/rustc-print-cfg-fix


Patch sent to ML for this.

<https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/rustc-print-cfg-fix>


>
> and:
>
> 2. a reproducible build failure on CentOS-7:
>
>     https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/597
>
> where, we see:
>     = note: /bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' \
>     not found (required by \
>     /home/pokybuild/yocto-worker/reproducible-centos/build/\
>     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
>     1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)
>
>
>
>
>
>     error: linking with `\
>     /home/pokybuild/yocto-worker/reproducible-centos/build/\
>     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
>     1.54.0-r0/wrapper/target-rust-ccld` failed: exit status: 1
>
>
> ---
>
>
> Please test, send patches and/or let me know about any other problems by
> email or by opening  a defect in the YP bugzilla:
>     https://bugzilla.yoctoproject.org/
>
>
> I'll work on a commit for meta-rust to remove the components
> that have been moved to oe-core. I'm not sure what the
> meta-rust developers and users want to do as far as what will
> remain in meta-rust but the short list that I have so far is:
> 1. scripts
> 2. Jenkins tests
> 3. Rust version 1.51.0 ?
>
>
> ../Randy
>
> >
> >
> > error: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found
> > (required by
> >
> /home/pokybuild/yocto-worker/reproducible-debian/build/build-st/reproducibleA/tmp/work/x86_64-linux/rust-native/1.54.0-r0/rustc-1.54.0-src/build/bootstrap/debug/deps/libproc_macro_error_attr-9c7a09885c50c72e.so)
>
> >
> >      -->
> >
> /home/pokybuild/yocto-worker/reproducible-debian/build/build-st/reproducibleA/tmp/work/x86_64-linux/rust-native/1.54.0-r0/rustc-1.54.0-src/vendor/proc-macro-error/src/lib.rs:284:9
>
> >
> >   284 | pub use proc_macro_error_attr::proc_macro_error;
> >       |         ^^^^^^^^^^^^^^^^^^^^^
> >
> >   error: aborting due to previous error
> >   error: could not compile `proc-macro-error`
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
> 
>
>

--000000000000b0142205ca900fbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 26, 2021 at 9:05 PM Randy MacLeod &lt;<a href=
=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On 2021-08-24 12:48 p.m., R=
andy MacLeod wrote:<br>
&gt; Add Steven Walter in hopes that he or someone else<br>
&gt; who uses meta-rust will help out.<br>
&gt; <br>
&gt; On 2021-08-23 5:21 a.m., Richard Purdie wrote:<br>
&gt;&gt; On Sun, 2021-08-22 at 08:45 -0400, Randy MacLeod wrote:<br>
&gt;&gt;&gt; On 2021-08-22 7:19 a.m., Richard Purdie wrote:<br>
&gt;&gt;&gt;&gt; On Sat, 2021-08-21 at 23:12 -0400, Randy MacLeod wrote:<br=
>
&gt;&gt;&gt;&gt;&gt; On 2021-08-20 10:48 p.m., Randy MacLeod wrote:<br>
&gt;&gt;&gt;&gt;&gt; With a patch from Richard, and the http_proxy check re=
moved,<br>
&gt;&gt;&gt;&gt;&gt; $ git diff | grep &quot;^[+-]&quot;<br>
&gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0--- a/meta/lib/oeqa/selftest/cases/sstate=
tests.py<br>
&gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0+++ b/meta/lib/oeqa/selftest/cases/sstate=
tests.py<br>
&gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0-http_proxy =3D &quot;<a href=3D"http://e=
xample.com/" rel=3D"noreferrer" target=3D"_blank">http://example.com/</a>&q=
uot;<br>
&gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0+http_proxy =3D &quot;&quot;<br>
&gt;&gt;&gt;&gt;&gt; we have fixed the oe-selftest that was failing.<br>
&gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0Any volunteers to stub out the http[s]_pr=
oxy code in cargo ?<br>
&gt;&gt;&gt;&gt;&gt; I&#39;ve written up a commit log that could use some r=
eview and pushed <br>
&gt;&gt;&gt;&gt;&gt; an update<br>
&gt;&gt;&gt;&gt;&gt; to:<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/p=
oky-contrib/log/?h=3Drmacleod/rust-redo-aug-17-2021-a" rel=3D"noreferrer" t=
arget=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log=
/?h=3Drmacleod/rust-redo-aug-17-2021-a</a> <br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I&#39;m not sure you need to change cargo, I think if you =
remove the bit <br>
&gt;&gt;&gt;&gt; in the<br>
&gt;&gt;&gt;&gt; bbclass that injects http_proxy, the tests are ok. That wi=
ll perhaps <br>
&gt;&gt;&gt;&gt; break<br>
&gt;&gt;&gt;&gt; anyone using proxies but for now, I think that is a reason=
able step <br>
&gt;&gt;&gt;&gt; of getting<br>
&gt;&gt;&gt;&gt; this moved forward?<br>
&gt;&gt;&gt; That&#39;s what I hoped for as well but not what my testing sh=
owed.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I removed (commented out actually) the http_proxy injection he=
re:<br>
&gt;&gt;&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-cont=
rib/commit/?h=3Drmacleod/rust-redo-aug-17-2021-a&amp;id=3Da4808f787caf8d0b4=
4cf3946cf204164f24f91d4" rel=3D"noreferrer" target=3D"_blank">http://git.yo=
ctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Drmacleod/rust-redo-au=
g-17-2021-a&amp;id=3Da4808f787caf8d0b44cf3946cf204164f24f91d4</a> <br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; but the test still fails unless I mangle the test:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 meta/lib/oeqa/selftest/cases/sstatete=
sts.py<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 -http_proxy =3D &quot;<a href=3D"http=
://example.com/" rel=3D"noreferrer" target=3D"_blank">http://example.com/</=
a>&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 +http_proxy =3D &quot;&quot;<br>
&gt;&gt; Right, my point is that doesn&#39;t remove it. You need to delete =
it, not <br>
&gt;&gt; comment it<br>
&gt;&gt; out.<br>
&gt;&gt;<br>
&gt;&gt; The issue is that bitbake does variable expansion on the scripts <=
br>
&gt;&gt; before running<br>
&gt;&gt; them.<br>
&gt;&gt;<br>
&gt;&gt; It can&#39;t tell that this is a comment, just that the script dif=
fers after<br>
&gt;&gt; variable expansion.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Richard<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; Richard has fixed several new issues and is testing this in master-nex=
t:<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=3Dmas=
ter-next" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/=
cgit/cgit.cgi/poky/log/?h=3Dmaster-next</a><br>
&gt; <br>
&gt; using the YP autobuilder.<br>
&gt; <br>
&gt; We&#39;re seeing some odd intermittent build failures especially when =
using<br>
&gt; the uninative class (used by default in poky) perhaps on older hosts b=
ut<br>
&gt; we&#39;re not 100% sure of that correlation yet. See below and:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/116=
/builds/581/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/581/steps/13/=
logs/stdio</a> <br>
&gt; <br>
&gt; <br>
&gt; If we can&#39;t get this fixed in the next day or two, we&#39;ll miss =
the fall <br>
&gt; release.<br>
&gt; <br>
&gt; ../Randy<br>
<br>
<br>
Thanks to Richard&#39;s dogged determination and Herculean efforts,<br>
the Rust recipes are now merged to the oe-core master branch.<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/log=
/?qt=3Drange&amp;q=3Dmaster" rel=3D"noreferrer" target=3D"_blank">https://g=
it.openembedded.org/openembedded-core/log/?qt=3Drange&amp;q=3Dmaster</a><br=
>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you Richar=
d, Randy and everyone else involved.</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><b=
r>
<br>
There are still some known problems, such as:<br>
<br>
1. Tim Orling finding that Rust fails to build python-cryptography:<br>
<br>
<br>
<a href=3D"https://git.openembedded.org/meta-openembedded-contrib/log/?h=3D=
timo/rust_python3-cryptography" rel=3D"noreferrer" target=3D"_blank">https:=
//git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/rust_python3=
-cryptography</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">With the patch b=
elow, this branch now builds the latest pyhton3-cryptography 3.4.8. There a=
re some ptest warnings and errors that are still in progress. Also the reci=
pes in this branch need a final scrub before submitting.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Happy to have anyone test the branch if yo=
u use python3-cryptography.</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Tim says that this change helps:<br>
<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=
=3Dtimo/rustc-print-cfg-fix" rel=3D"noreferrer" target=3D"_blank">https://g=
it.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dtimo/rustc-print-cf=
g-fix</a></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Patch s=
ent to ML for this.</div><div dir=3D"auto"><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex" dir=3D"auto"><a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi=
/poky-contrib/log/?h=3Dtimo/rustc-print-cfg-fix" rel=3D"noreferrer" target=
=3D"_blank"></a></blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
and:<br>
<br>
2. a reproducible build failure on CentOS-7:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bui=
lders/115/builds/597" rel=3D"noreferrer" target=3D"_blank">https://autobuil=
der.yoctoproject.org/typhoon/#/builders/115/builds/597</a><br>
<br>
where, we see:<br>
=C2=A0 =C2=A0 =3D note: /bin/sh: /lib64/libc.so.6: version `GLIBC_2.33&#39;=
 \<br>
=C2=A0 =C2=A0 not found (required by \<br>
=C2=A0 =C2=A0 /home/pokybuild/yocto-worker/reproducible-centos/build/\<br>
=C2=A0 =C2=A0 build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\<b=
r>
=C2=A0 =C2=A0 1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)<br>
<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 error: linking with `\<br>
=C2=A0 =C2=A0 /home/pokybuild/yocto-worker/reproducible-centos/build/\<br>
=C2=A0 =C2=A0 build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\<b=
r>
=C2=A0 =C2=A0 1.54.0-r0/wrapper/target-rust-ccld` failed: exit status: 1<br=
>
<br>
<br>
---<br>
<br>
<br>
Please test, send patches and/or let me know about any other problems by<br=
>
email or by opening=C2=A0 a defect in the YP bugzilla:<br>
=C2=A0 =C2=A0 <a href=3D"https://bugzilla.yoctoproject.org/" rel=3D"norefer=
rer" target=3D"_blank">https://bugzilla.yoctoproject.org/</a><br>
<br>
<br>
I&#39;ll work on a commit for meta-rust to remove the components<br>
that have been moved to oe-core. I&#39;m not sure what the<br>
meta-rust developers and users want to do as far as what will<br>
remain in meta-rust but the short list that I have so far is:<br>
1. scripts<br>
2. Jenkins tests<br>
3. Rust version 1.51.0 ?<br>
<br>
<br>
../Randy<br>
<br>
&gt; <br>
&gt; <br>
&gt; error: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33&#39; not f=
ound <br>
&gt; (required by <br>
&gt; /home/pokybuild/yocto-worker/reproducible-debian/build/build-st/reprod=
ucibleA/tmp/work/x86_64-linux/rust-native/1.54.0-r0/rustc-1.54.0-src/build/=
bootstrap/debug/deps/libproc_macro_error_attr-9c7a09885c50c72e.so) <br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 --&gt; <br>
&gt; /home/pokybuild/yocto-worker/reproducible-debian/build/build-st/reprod=
ucibleA/tmp/work/x86_64-linux/rust-native/1.54.0-r0/rustc-1.54.0-src/vendor=
/proc-macro-error/src/lib.rs:284:9 <br>
&gt; <br>
&gt;=C2=A0 =C2=A0284 | pub use proc_macro_error_attr::proc_macro_error;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^<br>
&gt; <br>
&gt;=C2=A0 =C2=A0error: aborting due to previous error<br>
&gt;=C2=A0 =C2=A0error: could not compile `proc-macro-error`<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000b0142205ca900fbe--

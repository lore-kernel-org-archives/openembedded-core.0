Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.5758.1596718235656037416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 05:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F2AcuURz;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id l23so21336402edv.11
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2020 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9er+gLKN4SRI7sUpEzTBw5U7VTXANghhHeYQ3lwKGzY=;
        b=F2AcuURz+GNzGBqbcfAhYsYXCWFH3UXXKzn3WNsX3rbtPCziW+Rk0lHPFBlLtg2YKL
         Z4CKX3wlJFXQQ2mpSaJdH5/ZUPSoSbPRiA8NVU0Qvsnnzg47uz4EnLqlGe8r2PS4JYrA
         HQOLatzSEc+ylF2Ilgf1Jwfu+mdyM2auED1NSJea15z/ArdT1mMNZdg5RlEraW/QmeCb
         PudBFLxve52OyUAVO8Mf5GA0WNwSM/mhufindvfldsGPuYcx7cFR/6wb87UrllK9F+ts
         eaVCt76VAHGQaQUWktkZ9vtS73xt8imMSFRFfwa3SsyouuQ79sItGi6POoQVksxeFjwi
         aZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9er+gLKN4SRI7sUpEzTBw5U7VTXANghhHeYQ3lwKGzY=;
        b=tq+jJY6HgJOdiaSWeehNVhfQABC+S1WXZrrYiilwsVrv2eCdOKpDYBcBYrhOpCnSWA
         9sU50DyTe9n4aowQml0luQwl4DpGu6HkzbsyWSvkT3+Y/DbTK9zJotus2IK1/wozeOiv
         O5Uju7fuVG6kLuqlV/LOxoolnOQV9dcMAEsnorFkkcEcEEiQ/DSGfuqeWrA7KbHcIA1P
         QwAhia9HN4FfehiHFbstZTJiB0Xea5WHKapzWRxMzLz+amIdJuqH3rwYKGkxlGTzH1R3
         DQvzCVNwhSTl394NWvm60GubOXDRldx76938ZGvTV50ksoZpoHPMlNVLYbS4+rVFNovO
         uYSw==
X-Gm-Message-State: AOAM531V5TNU6hNG+l6iOebQxWV3D1W/SHl33QK5DcGMxmFpGaBpEhkq
	EeQAvCg0j2qgzKtC8mzZ1l/vju6ryVXKIvKHaQ8=
X-Google-Smtp-Source: ABdhPJymaY9mx6/doHsVmeXIUMGDcDSrucqAVHHaEQ2P15rp7QJumAsRPNvxY/tEZnKBbVD6DLyq/iLWxYge72MlQV8=
X-Received: by 2002:a50:ec90:: with SMTP id e16mr4047953edr.234.1596718234150;
 Thu, 06 Aug 2020 05:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594989620.git.bruce.ashfield@gmail.com>
 <16285A84D29254CC.27500@lists.openembedded.org> <7af01e4c3d12d960a7c8820f773f77658d6d59e5.camel@linuxfoundation.org>
 <cc48a8ec9e8066248c2c29662bc9e28dd3d7645f.camel@intel.com>
 <6d7824e5e06d0947d9985d5816577abaaeaa5950.camel@linuxfoundation.org> <1628AE89A53F9C15.7529@lists.openembedded.org>
In-Reply-To: <1628AE89A53F9C15.7529@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 6 Aug 2020 08:50:22 -0400
Message-ID: <CADkTA4OYffccADEypzffVo5tojynwzvKLR0JzNQCdZ4ySmSbhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] kernel/yocto: conslidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, "kexin.hao@windriver.com" <kexin.hao@windriver.com>, 
	"Jon.Mason@arm.com" <Jon.Mason@arm.com>, "ross@burtonini.com" <ross@burtonini.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000272cc805ac34ef5e"

--000000000000272cc805ac34ef5e
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 6, 2020 at 8:46 AM Bruce Ashfield via lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:

>
>
> On Thu, Aug 6, 2020 at 5:15 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Thu, 2020-08-06 at 05:04 +0000, Mittal, Anuj wrote:
>> > On Wed, 2020-08-05 at 12:10 +0100, Richard Purdie wrote:
>> > > On Wed, 2020-08-05 at 12:06 +0100, Richard Purdie via
>> > > lists.openembedded.org wrote:
>> > > > On Fri, 2020-07-17 at 08:56 -0400, bruce.ashfield@gmail.com wrote:
>> > > > > Here's my latest set of patches.
>> > > > >
>> > > > > For 5.4: a -stable update, and -rt bug fix
>> > > > >
>> > > > > For the build: a tweak to the config generation (as reported
>> > > > > and discussed on the mailing list)
>> > > > >
>> > > > > For 5.8 (aka the next reference kernel): a fix for devsrc and
>> > > > > on target kernel building. With this tweak, I have all of the
>> > > > > refrences booting and passing most tests on 5.8, so we are in
>> > > > > good shape on that front. I'll be doing libc-headers testing
>> > > > > next.
>> > > > >
>> > > > > I ran these through the AB and local testing, no issues popped
>> > > > > up, except a warning on qemuarm-alt in my last run. It was
>> > > > > about a console login and didn't look related to the change,
>> > > > > but I'm keeping my eye on it.
>> > > >
>> > > > Thanks, I ran this combined with Khem's binutils change through the
>> > > > autobuilder and your changes are likely fine but we need more work
>> > > > to
>> > > > get binutils in. Basically:
>> > > >
>> > > > * meta-arm needs to add the kernel patch for perf
>> > > > * meta-intel needs to add the kernel patch for perf
>> > > > * the hardware BSPs need to add the kernel patch for perf
>> > > >
>> > > > I've added a few maintainers/people to the address list to try and
>> > > > sort
>> > > > that out. Who is going to handle the hardware platforms?
>> > >
>> > > Sorry, the url for the failing builds:
>> > >
>> > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1231
>> > >
>> > > The kernel tweak needed for binutils 2.35:
>> > >
>> > >
>> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/?h=v5.4/standard/base&id=1fe4ee7f680c3f69f620d68a5d2f7341e8db693b
>> > >
>> >
>> > Thanks Richard. I have included the patch in meta-intel.
>>
>> Thanks Anuj. That fixed the errors but there are still warnings with
>> master-next:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/594
>>
>> I've sent a patch for the first one which is a simple typo. The other
>> one looks to be a meta-intel configuration issue.
>>
>
> Looks a bug in my new analysis tools, if you drop that patch from
> master-next, I can look into it a bit more and try to reproduce the issue
> locally.
>
>
and now I see that you fixed it .. thanks!

Bruce



> Bruce
>
>
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000272cc805ac34ef5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Aug 6, 2020 at 8:46 AM Bruce Ashfield via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;bru=
ce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com=
@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font=
-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Aug 6, 2020 at 5:15 AM Richard Purdie &lt;<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Thu, 2020-08-06 at 05:04 +0000, Mittal, Anu=
j wrote:<br>
&gt; On Wed, 2020-08-05 at 12:10 +0100, Richard Purdie wrote:<br>
&gt; &gt; On Wed, 2020-08-05 at 12:06 +0100, Richard Purdie via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; On Fri, 2020-07-17 at 08:56 -0400, <a href=3D"mailto:bruce.=
ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a> wrote:<b=
r>
&gt; &gt; &gt; &gt; Here&#39;s my latest set of patches.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; For 5.4: a -stable update, and -rt bug fix<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; For the build: a tweak to the config generation (as re=
ported<br>
&gt; &gt; &gt; &gt; and discussed on the mailing list)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; For 5.8 (aka the next reference kernel): a fix for dev=
src and<br>
&gt; &gt; &gt; &gt; on target kernel building. With this tweak, I have all=
 of the<br>
&gt; &gt; &gt; &gt; refrences booting and passing most tests on 5.8, so we=
 are in<br>
&gt; &gt; &gt; &gt; good shape on that front. I&#39;ll be doing libc-heade=
rs testing<br>
&gt; &gt; &gt; &gt; next.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I ran these through the AB and local testing, no issue=
s popped<br>
&gt; &gt; &gt; &gt; up, except a warning on qemuarm-alt in my last run. It=
 was<br>
&gt; &gt; &gt; &gt; about a console login and didn&#39;t look related to t=
he change,<br>
&gt; &gt; &gt; &gt; but I&#39;m keeping my eye on it.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Thanks, I ran this combined with Khem&#39;s binutils change=
 through the<br>
&gt; &gt; &gt; autobuilder and your changes are likely fine but we need mo=
re work<br>
&gt; &gt; &gt; to<br>
&gt; &gt; &gt; get binutils in. Basically:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; * meta-arm needs to add the kernel patch for perf<br>
&gt; &gt; &gt; * meta-intel needs to add the kernel patch for perf<br>
&gt; &gt; &gt; * the hardware BSPs need to add the kernel patch for perf<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I&#39;ve added a few maintainers/people to the address list=
 to try and<br>
&gt; &gt; &gt; sort<br>
&gt; &gt; &gt; that out. Who is going to handle the hardware platforms?<br=
>
&gt; &gt; <br>
&gt; &gt; Sorry, the url for the failing builds:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builde=
rs/83/builds/1231" rel=3D"noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/83/builds/1231</a><br>
&gt; &gt; <br>
&gt; &gt; The kernel tweak needed for binutils 2.35:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto=
/commit/?h=3Dv5.4/standard/base&amp;id=3D1fe4ee7f680c3f69f620d68a5d2f7341e8=
db693b" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/cg=
it/cgit.cgi/linux-yocto/commit/?h=3Dv5.4/standard/base&amp;id=3D1fe4ee7f680=
c3f69f620d68a5d2f7341e8db693b</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; Thanks Richard. I have included the patch in meta-intel.<br>
<br>
Thanks Anuj. That fixed the errors but there are still warnings with<br>
master-next:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/100/bui=
lds/594" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/100/builds/594</a><br>
<br>
I&#39;ve sent a patch for the first one which is a simple typo. The other<=
br>
one looks to be a meta-intel configuration issue.<br></blockquote><div><br=
></div><div><div style=3D"font-size:small">Looks a bug in my new analysis t=
ools, if you drop that patch from master-next, I can look into it a bit mor=
e and try to reproduce the issue locally.</div><div style=3D"font-size:smal=
l"><br></div></div></div></div></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">and now I see that you fixed =
it .. thanks!</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-size:=
small"></div><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
">- Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<b=
r><br></div></div>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000272cc805ac34ef5e--

Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web12.51986.1600723408575916596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 14:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=HgCNdXBQ;
 spf=pass (domain: blade-group.com, ip: 209.85.167.193, mailfrom: yann.dirson@blade-group.com)
Received: by mail-oi1-f193.google.com with SMTP id 185so18598690oie.11
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 14:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WJohIAmf3mZO4ZEbtgRY2dbJSuAni79/59Oj9gu0QkM=;
        b=HgCNdXBQa7MdC5f4ckq2Hv65IRjsDyJV2gXGkMdz2uGl3jAPH38/T1KNFl7DdSwDpr
         hvIJQQs9L64DEHbqRxWScG5RVrPSzfpuGBipSPykc4OILhE11sx3SSI/TlstA9Oa9xpX
         r0b6Q6fmVCrEzzeaBDG7IPR1hx9Q8Ifg5Me8M3gbl3L14DWW4xm3Sf3o5DE5YzpTnLBj
         jW+cHt6OpinJjB1ADr/+/PIk6GIdIqwoMUztqvIKPQ3Dk9QvGr7/BQfJ+oEcacexDGYY
         rt7U4Z9ZndKRvy9MbTY5gafuKQBFDBwnQHvEW9KrrhBgtpOJjOn8Llh2JxnA2bwvtd1H
         8VuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WJohIAmf3mZO4ZEbtgRY2dbJSuAni79/59Oj9gu0QkM=;
        b=Xnccdbraf9NGLLXtF+Ub/3SAP7+6GKLZpgBDYHtw5zQY/45vTWidgoyaYPt0d10FFa
         mgNw0FBc5oKSguywzbAo+Ib/57ArH1DTFVVCFymxUqHMuCkSYPqkcXnmFshj4CWpRbx7
         h7J8Suoi4XTlk4vNbH7yeR/5cIt0xSOR3z+oM/L09VCVEv2S9svdnGtYRVaqYMwM29IF
         KJhmaZE4+AYib6kkrK2a5vmMxSB98Ng2kEaXOQd+TgmRSbPJbzY8mPaED31e0BJpw2rW
         OoCv13QnSRc8cidkfABdh+zmz9dB7PIi644e1C0HdHXfBTYQ3N7yrKiNh8q1n5iTB2iB
         8eWA==
X-Gm-Message-State: AOAM533ktzkDy/mWiJj/4l03dFvJSYKbVGX76X8qK7bF4erqoS1XVZmW
	nOP+tUEoWAoOxdd37+JygiDE01BAPVzW8hcUGpuG1w==
X-Google-Smtp-Source: ABdhPJyVMmrMjIfZ9JC1GT2EGXuelJKP027LFcSfkqSa0QQa1RkfxGpIMJWEgo06Iep34WRyPqHjleGPJV5gxc16Cp0=
X-Received: by 2002:a05:6808:491:: with SMTP id z17mr848048oid.110.1600723407942;
 Mon, 21 Sep 2020 14:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200921141544.3145189-1-yann@blade-group.com>
 <20200921141544.3145189-9-yann@blade-group.com> <1c41fc0d0f0928baeacb628812cafd66de745b75.camel@linuxfoundation.org>
In-Reply-To: <1c41fc0d0f0928baeacb628812cafd66de745b75.camel@linuxfoundation.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Mon, 21 Sep 2020 23:23:16 +0200
Message-ID: <CA+4=imb9n8r-taOxj68JagEVJkisUFk3vHVbKOru8Td24kLHdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/8] New systemtap.bb class, and systemtap-demo.bb to illustrate it.
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="0000000000001d4b6505afd976cd"

--0000000000001d4b6505afd976cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 21 sept. 2020 =C3=A0 21:46, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Mon, 2020-09-21 at 16:15 +0200, Yann Dirson wrote:
> > From: Yann Dirson <yann@blade-group.com>
> >
> > ---
> >  meta/classes/systemtap.bbclass                | 74 +++++++++++++++++++
> >  .../systemtap/systemtap-demo_git.bb           | 71 ++++++++++++++++++
> >  2 files changed, 145 insertions(+)
> >  create mode 100644 meta/classes/systemtap.bbclass
> >  create mode 100644 meta/recipes-kernel/systemtap/systemtap-demo_git.bb
>
> I'm afraid this patch is going to throw warnings all over the
> autobuilder, e.g.:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2488
>
> (and there will be more).
>
> We are trying to ensure all warnings are solved so that any that do
> show are real issues and this patch would significantly distract from
> that.
>

OK, we could default to built just the handful of probes that should always
build,
and give instructions for those willing to use the current behaviour.

I'm also wary that we're now in feature freeze for release so perhaps
> these changes should wait until 3.3?
>

OK, I can reroll a series with just the fixes.

For the rest should I just wait for the gatesgarth branch to be created and
resubmit then ?

--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--0000000000001d4b6505afd976cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 21 sept. 2020 =C3=A0=C2=
=A021:46, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2020-09-21 a=
t 16:15 +0200, Yann Dirson wrote:<br>
&gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=
=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/systemtap.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 74 +++++++++++++++++++<br>
&gt;=C2=A0 .../systemtap/<a href=3D"http://systemtap-demo_git.bb" rel=3D"no=
referrer" target=3D"_blank">systemtap-demo_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 71 ++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 145 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/classes/systemtap.bbclass<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/systemtap/<a href=3D"http=
://systemtap-demo_git.bb" rel=3D"noreferrer" target=3D"_blank">systemtap-de=
mo_git.bb</a><br>
<br>
I&#39;m afraid this patch is going to throw warnings all over the<br>
autobuilder, e.g.:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/build=
s/2488" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/40/builds/2488</a><br>
<br>
(and there will be more).<br>
<br>
We are trying to ensure all warnings are solved so that any that do<br>
show are real issues and this patch would significantly distract from<br>
that.<br></blockquote><div><br></div><div>OK, we could default to built jus=
t the handful of probes that should always build,</div><div>and give instru=
ctions for those willing to use the current behaviour.</div><div> <br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
I&#39;m also wary that we&#39;re now in feature freeze for release so perha=
ps<br>
these changes should wait until 3.3?<br></blockquote><div><br></div><div>OK=
, I can reroll a series with just the fixes.</div></div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">For the rest should I just wai=
t for the gatesgarth branch to be created and resubmit then ?<br clear=3D"a=
ll"></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Yann Dirson=
 &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade-g=
roup.com</a>&gt;<br>Blade / Shadow -- <a href=3D"http://shadow.tech" target=
=3D"_blank">http://shadow.tech</a><br><br></div></div>

--0000000000001d4b6505afd976cd--

Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id DFD767ECE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 17:09:48 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id h8so22397308edv.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YbCO2+B2AhxOkNjJyfFRfZaaMgvCkTzOgeuYv1gbOpg=;
	b=veH8cY0sYLpoCyGcUClNkURn8SEMcq3h7mZ7inXJhR0x/bvsDILMDyLjkys1akHcef
	yx1JJGeZCq5Hx49lXN/D5y7krbX3c5bwNeRaVt/y4nP5NsjVvU/Mhi/GJgQ050egW+Ej
	THnO6SCdwP16bMF2IKwYEsSg5INxw2OB7MnDvS7lE/zk1V7/q8EAubzvMne4JRoIMjRr
	Ks0tMCmr8SDEVPghinYDRddxh7eTctYU6K6IvnCrrPOOITWIEpN1dE8D2jIdsjMEuqpd
	OhGk/Lw28l+MTtheb7x9BYYt2lF6nFVZq683459Q7jwS/XzPv/g9yYbF3QEgRnpVrHI1
	kk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YbCO2+B2AhxOkNjJyfFRfZaaMgvCkTzOgeuYv1gbOpg=;
	b=WiaP6QpasGg0u4KeWXUVjpoFhgvnWr54TlQHpZtTRvm1Q32nsRHo+jEgHMYQ+qpP+E
	Q+viZzQb4L8WnbCED81XXqZ2Pw7ooQ3YTim78he7FYWme7KlzQL/Rt7FFANEF8sEsVGS
	YQpNHosekEGLBprv7Dj/Nwtn5tb3Q88IfFtIoQmjosbrQZ9LMFiLTVgLmMJfkqarOzzM
	q7THiSHLjPjGWdAjRN07b4TkvH3WcIFYjiR7yBDYC8uA3dzxtRMgZ+49vsyaoXxVkngV
	v4f94JAsgPyKd2/lgfh8ICMHxV9yILQ/X/G2HJBLNRdDBDotVUw3KCFlybr3/muC6GJF
	pNEA==
X-Gm-Message-State: APjAAAUGT00GKrew5+427ZPfxuXIFdUrifbEAcKj6IMoscsEmzApS8L1
	WUBSV0NpMVzOsW+wED4x140k++RBdbWB/lKgli0=
X-Google-Smtp-Source: APXvYqxbZ1EVcKNPORyGD0TlsjXOE8ncqu7u8pT4SucYP2Yp9+zJ0c8M2gswGRehTFeQFB+8wIO2ffV7cCH/zYo+xdQ=
X-Received: by 2002:a17:906:2ecc:: with SMTP id
	s12mr625160eji.110.1565802589368; 
	Wed, 14 Aug 2019 10:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
	<f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
	<20190802120733.4a24ca3f@seebsdell>
	<20190802124246.27d4beca@seebsdell>
	<CAMKF1sr-gxJBXUn6OtU=0GtTw=CTLWfFLVWjATB-_k-1NYCP1g@mail.gmail.com>
	<20190803092307.486e930d@seebsdell>
	<6E51916E4A1F32428260031F4C7CD2B64ED7F64C@ORSMSX116.amr.corp.intel.com>
	<CA+chaQcc2996g2xKdzJpaKJN4f4=3t6gHVvA5JREn3yHYLvKHg@mail.gmail.com>
	<3bab2728-8ccd-d435-dee4-c92002555ae4@windriver.com>
In-Reply-To: <3bab2728-8ccd-d435-dee4-c92002555ae4@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Aug 2019 19:09:37 +0200
Message-ID: <CA+chaQd0fS3mXjXkSd=e-C8uj2zECohRe+LRkqTeed3ZmNm_ew@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Aug 2019 17:09:49 -0000
Content-Type: multipart/alternative; boundary="00000000000020b918059016d301"

--00000000000020b918059016d301
Content-Type: text/plain; charset="UTF-8"

"qmake -install qinstall" reproducer from the bugzilla ticket still
reproduces the issues every time even with latest pseudo, but that might be
different root cause than glibc-locale issue.

On Wed, Aug 14, 2019 at 6:02 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 8/6/19 2:51 AM, Martin Jansa wrote:
> > This is the same reproducer I am using in:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=12434
> > but with this SRCREV I haven't reproduced it yet in first 500
> > iterations, so it's definitely improving for me (used to reproduce it at
> > least once in first 500 iterations)
> >
> > Now I'm testing the reproducer with "qmake -install qinstall".
>
> Any update Martin?
>
>
>
> Using a variation of Juro's script and adding a little stress-ng load,
> it _seems_ that I can make the problem happen more quickly than without
> system stress but it's a shared system so _seems_ is underlined.
>
> Using stress-ng was supposed to be a quick check to see if I could
> get the reproducer down to minutes rather than around an hour.
>
> Results are promising so I'll continue to use this approach as
> I add debugging to pseudo and add an inline, immediate check in
> the context of:
>
>
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/glibc/glibc-locale.inc?h=master#n72
> to see if the UID/GID are equal to my UID/GID.
>
> Test runs summaries are below.
>
> ../Randy
>
>
>
> cat src/distro/yocto/b/uid-diff/glibc-locale-stress
> #!/bin/bash
>
> fname='glibc-locale_master_august13'
> max=100
> for (( i=1; i <= $max; i++ ))
> do
>      echo "$i/$max  ${fname}_$i.log"
>      bitbake glibc-locale -c cleanall 2>&1 > /dev/null
>      # add some stress
>      stress-ng -t 1000 --switch 8 --switch-freq 50000 &
>      bitbake glibc-locale 2>&1 > ${fname}_$i.log
>      # Destress
>      killall -9 stress-ng
>      if grep -q "host-user-contaminated" ${fname}_$i.log; then
>          echo "error !"
>        exit 2
>      #else
>        #rm ${fname}_$i.log
>      fi
> done
>
>
> On a (shared) system where lscpu shows 128 cores
> and no stress:
>
> Trial   Iteration Error
> 1       44
> 2       19
>
>
> stress-ng -t 1000 --switch 8 --switch-freq 50000
>
> 50000 was just the frequency that generated a high enough
> but not too high load. On this systems, each process used ~30% of a cpu.
>
> Trial   Iteration Error
> 1       3
> 2       18
>
>
> stress-ng -t 1000 --switch 16 --switch-freq 50000
>
> Trial   Iteration Error
> 1       3
> 2       1
> 3       11
>
> stress-ng -t 1000 --switch 32 --switch-freq 50000
>
> Trial   Iteration Error
> 1       2
> 2       9
> 3       8
>
>
> stress-ng -t 1000 --switch 64 --switch-freq 50000
>
> Trial   Iteration Error
> 1       4
> 2       13
> 3       >6
>
>
> stress-ng -t 1000 --mq 64
>   128 processes using 98% cpu each
>
> Trial   Iteration Error
> 1       14
> 2       NaN
>
> Trial 2 was precluded by other users of the shared system complaining!
> The idea was to cause more rapid context switches. Later, I might try
> this again with say 16 workers. If anyone has a better idea, please
> reply.
>
> EOM
>
> >
> > Regards,
> >
> > On Tue, Aug 6, 2019 at 12:43 AM Bystricky, Juro
> > <juro.bystricky@intel.com <mailto:juro.bystricky@intel.com>> wrote:
> >
> >     I can reproduce the problem fairly easily  (and, sadly even with the
> >     latest commits as 060058bb29f70b244e685b3c704eb0641b736f73 ).
> >     In my case, it seems easy to reproduce if I have 40+ threads running.
> >     The reproducer script (below) fails typically within the first 10
> >     iterations.
> >
> >
> >     #!/bin/bash
> >
> >     fname='glibc-locale_master_august8'
> >     max=1000
> >     for (( i=1; i <= $max; i++ ))
> >     do
> >          echo "$i/$max  ${fname}_$i.log"
> >          bitbake glibc-locale -c cleanall 2>&1 > /dev/null
> >          bitbake glibc-locale 2>&1 > ${fname}_$i.log
> >           if grep -q "host-user-contaminated" ${fname}_$i.log; then
> >              echo "error !"
> >            exit 2
> >          #else
> >            #rm ${fname}_$i.log
> >          fi
> >
> >     done
> >
> >     ________________________________________
> >     From: openembedded-core-bounces@lists.openembedded.org
> >     <mailto:openembedded-core-bounces@lists.openembedded.org>
> >     [openembedded-core-bounces@lists.openembedded.org
> >     <mailto:openembedded-core-bounces@lists.openembedded.org>] on behalf
> >     of Seebs [seebs@seebs.net <mailto:seebs@seebs.net>]
> >     Sent: Saturday, August 03, 2019 7:23 AM
> >     To: Khem Raj
> >     Cc: openembedded-core@lists.openembedded.org
> >     <mailto:openembedded-core@lists.openembedded.org>
> >     Subject: Re: [OE-core] [PATCH v2] pseudo: Upgrade to latest to fix
> >     openat() with a directory symlink [NAK]
> >
> >     On Sat, 3 Aug 2019 05:33:46 -0700
> >     Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
> >
> >      > Will this fix the file ownership issue that we see with
> Glibc-locale
> >      > packages from time to time?
> >
> >     I have no idea. Since I haven't got a reliable reproducer for it, I
> >     can't test it in a sane way.
> >
> >     -s
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

--00000000000020b918059016d301
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(80,0,80)">&quot;qmake -install qi=
nstall&quot; reproducer from the bugzilla ticket still reproduces the issue=
s every time even with latest pseudo, but that might be different root caus=
e than glibc-locale issue.</span><br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 14, 2019 at 6:02 PM Randy =
MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@wi=
ndriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 8/6/19 2:51 AM, Martin Jansa wrote:<br>
&gt; This is the same reproducer I am using in:<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12434" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D12434</a><br>
&gt; but with this SRCREV I haven&#39;t reproduced it yet in first 500 <br>
&gt; iterations, so it&#39;s definitely improving for me (used to reproduce=
 it at <br>
&gt; least once in first 500 iterations)<br>
&gt; <br>
&gt; Now I&#39;m testing the reproducer with &quot;qmake -install qinstall&=
quot;.<br>
<br>
Any update Martin?<br>
<br>
<br>
<br>
Using a variation of Juro&#39;s script and adding a little stress-ng load,<=
br>
it _seems_ that I can make the problem happen more quickly than without<br>
system stress but it&#39;s a shared system so _seems_ is underlined.<br>
<br>
Using stress-ng was supposed to be a quick check to see if I could<br>
get the reproducer down to minutes rather than around an hour.<br>
<br>
Results are promising so I&#39;ll continue to use this approach as<br>
I add debugging to pseudo and add an inline, immediate check in<br>
the context of:<br>
<br>
<a href=3D"http://cgit.openembedded.org/openembedded-core/tree/meta/recipes=
-core/glibc/glibc-locale.inc?h=3Dmaster#n72" rel=3D"noreferrer" target=3D"_=
blank">http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-cor=
e/glibc/glibc-locale.inc?h=3Dmaster#n72</a><br>
to see if the UID/GID are equal to my UID/GID.<br>
<br>
Test runs summaries are below.<br>
<br>
../Randy<br>
<br>
<br>
<br>
cat src/distro/yocto/b/uid-diff/glibc-locale-stress<br>
#!/bin/bash<br>
<br>
fname=3D&#39;glibc-locale_master_august13&#39;<br>
max=3D100<br>
for (( i=3D1; i &lt;=3D $max; i++ ))<br>
do<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;$i/$max=C2=A0 ${fname}_$i.log&quot;<br>
=C2=A0 =C2=A0 =C2=A0bitbake glibc-locale -c cleanall 2&gt;&amp;1 &gt; /dev/=
null<br>
=C2=A0 =C2=A0 =C2=A0# add some stress<br>
=C2=A0 =C2=A0 =C2=A0stress-ng -t 1000 --switch 8 --switch-freq 50000 &amp;<=
br>
=C2=A0 =C2=A0 =C2=A0bitbake glibc-locale 2&gt;&amp;1 &gt; ${fname}_$i.log<b=
r>
=C2=A0 =C2=A0 =C2=A0# Destress<br>
=C2=A0 =C2=A0 =C2=A0killall -9 stress-ng<br>
=C2=A0 =C2=A0 =C2=A0if grep -q &quot;host-user-contaminated&quot; ${fname}_=
$i.log; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;error !&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 2<br>
=C2=A0 =C2=A0 =C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0#rm ${fname}_$i.log<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
done<br>
<br>
<br>
On a (shared) system where lscpu shows 128 cores<br>
and no stress:<br>
<br>
Trial=C2=A0 =C2=A0Iteration Error<br>
1=C2=A0 =C2=A0 =C2=A0 =C2=A044<br>
2=C2=A0 =C2=A0 =C2=A0 =C2=A019<br>
<br>
<br>
stress-ng -t 1000 --switch 8 --switch-freq 50000<br>
<br>
50000 was just the frequency that generated a high enough<br>
but not too high load. On this systems, each process used ~30% of a cpu.<br=
>
<br>
Trial=C2=A0 =C2=A0Iteration Error<br>
1=C2=A0 =C2=A0 =C2=A0 =C2=A03<br>
2=C2=A0 =C2=A0 =C2=A0 =C2=A018<br>
<br>
<br>
stress-ng -t 1000 --switch 16 --switch-freq 50000<br>
<br>
Trial=C2=A0 =C2=A0Iteration Error<br>
1=C2=A0 =C2=A0 =C2=A0 =C2=A03<br>
2=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
3=C2=A0 =C2=A0 =C2=A0 =C2=A011<br>
<br>
stress-ng -t 1000 --switch 32 --switch-freq 50000<br>
<br>
Trial=C2=A0 =C2=A0Iteration Error<br>
1=C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
2=C2=A0 =C2=A0 =C2=A0 =C2=A09<br>
3=C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
<br>
<br>
stress-ng -t 1000 --switch 64 --switch-freq 50000<br>
<br>
Trial=C2=A0 =C2=A0Iteration Error<br>
1=C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
2=C2=A0 =C2=A0 =C2=A0 =C2=A013<br>
3=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;6<br>
<br>
<br>
stress-ng -t 1000 --mq 64<br>
=C2=A0 128 processes using 98% cpu each<br>
<br>
Trial=C2=A0 =C2=A0Iteration Error<br>
1=C2=A0 =C2=A0 =C2=A0 =C2=A014<br>
2=C2=A0 =C2=A0 =C2=A0 =C2=A0NaN<br>
<br>
Trial 2 was precluded by other users of the shared system complaining!<br>
The idea was to cause more rapid context switches. Later, I might try<br>
this again with say 16 workers. If anyone has a better idea, please<br>
reply.<br>
<br>
EOM<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; <br>
&gt; On Tue, Aug 6, 2019 at 12:43 AM Bystricky, Juro <br>
&gt; &lt;<a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro=
.bystricky@intel.com</a> &lt;mailto:<a href=3D"mailto:juro.bystricky@intel.=
com" target=3D"_blank">juro.bystricky@intel.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I can reproduce the problem fairly easily=C2=A0 (an=
d, sadly even with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0latest commits as 060058bb29f70b244e685b3c704eb0641=
b736f73 ).<br>
&gt;=C2=A0 =C2=A0 =C2=A0In my case, it seems easy to reproduce if I have 40=
+ threads running.<br>
&gt;=C2=A0 =C2=A0 =C2=A0The reproducer script (below) fails typically withi=
n the first 10<br>
&gt;=C2=A0 =C2=A0 =C2=A0iterations.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0#!/bin/bash<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0fname=3D&#39;glibc-locale_master_august8&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0max=3D1000<br>
&gt;=C2=A0 =C2=A0 =C2=A0for (( i=3D1; i &lt;=3D $max; i++ ))<br>
&gt;=C2=A0 =C2=A0 =C2=A0do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$i/$max=C2=A0 ${fname}_$i=
.log&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake glibc-locale -c cleanall 2&g=
t;&amp;1 &gt; /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake glibc-locale 2&gt;&amp;1 &gt=
; ${fname}_$i.log<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;host-user-con=
taminated&quot; ${fname}_$i.log; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;error !&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #rm ${fname}_$i.log<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0done<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0From: <a href=3D"mailto:openembedded-core-bounces@l=
ists.openembedded.org" target=3D"_blank">openembedded-core-bounces@lists.op=
enembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core-boun=
ces@lists.openembedded.org" target=3D"_blank">openembedded-core-bounces@lis=
ts.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:openembedded-core-bounces@lists.=
openembedded.org" target=3D"_blank">openembedded-core-bounces@lists.openemb=
edded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core-boun=
ces@lists.openembedded.org" target=3D"_blank">openembedded-core-bounces@lis=
ts.openembedded.org</a>&gt;] on behalf<br>
&gt;=C2=A0 =C2=A0 =C2=A0of Seebs [<a href=3D"mailto:seebs@seebs.net" target=
=3D"_blank">seebs@seebs.net</a> &lt;mailto:<a href=3D"mailto:seebs@seebs.ne=
t" target=3D"_blank">seebs@seebs.net</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0Sent: Saturday, August 03, 2019 7:23 AM<br>
&gt;=C2=A0 =C2=A0 =C2=A0To: Khem Raj<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: <a href=3D"mailto:openembedded-core@lists.opene=
mbedded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core@list=
s.openembedded.org" target=3D"_blank">openembedded-core@lists.openembedded.=
org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Subject: Re: [OE-core] [PATCH v2] pseudo: Upgrade t=
o latest to fix<br>
&gt;=C2=A0 =C2=A0 =C2=A0openat() with a directory symlink [NAK]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Sat, 3 Aug 2019 05:33:46 -0700<br>
&gt;=C2=A0 =C2=A0 =C2=A0Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a> &lt;mailto:<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Will this fix the file ownership issue that w=
e see with Glibc-locale<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; packages from time to time?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I have no idea. Since I haven&#39;t got a reliable =
reproducer for it, I<br>
&gt;=C2=A0 =C2=A0 =C2=A0can&#39;t test it in a sane way.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-s<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-core@list=
s.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-core@list=
s.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
</blockquote></div>

--00000000000020b918059016d301--

Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D4CC6370C
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web12.23460.1650148092758680570
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gv//+w35;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id x17so19102530lfa.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 15:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RIVy1wmMELLoy+EiShM32E5Iu2AMX+H38NzKheg2ILc=;
        b=Gv//+w35htqaUN0F1+q6FWRhh3XNxvmCXRuFUS73cKtx8imN6TGbYjdcfq3ffggORU
         5M7XHG/EQ+RoKB830DMVGzq66ID3IAnAwj+7kPaa4qU5y9+9I8mixXmhh747VEUR4ZYE
         cW9AkFguPtk1sJcNF9QFW0KdNXW96ICEA+v9W4C3AhY29079746rNEVQuNttEugX25E4
         mTUigqzlEUIcczym8wIADgFmhJBfI10oVJP+c1IbI7e9sFk1AR1oB+HQB0megZb8/47f
         JHZUn/x+H3JXilSQBSXRG32eHcgvmYvz9Vz10CL9fxYT2MRzdl/vbAJiJW+uyq9loecw
         Zs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RIVy1wmMELLoy+EiShM32E5Iu2AMX+H38NzKheg2ILc=;
        b=IoXLOCN3b977qqle/5OAmYYFyhIInOiVaYxDcBWZci4K8hoZl+Sk3ctF8jxLIfgoVy
         l0//I41+C/Ro8rX4zkAHMRbTr8geHMZJn4+8E87A2WmkyzY9P4NpDk488sXt24yG9UZO
         D+54stEObmJ8BBvPyI+hbMMFD3bsaqnuAZ1GSkCvIQPhXfVVaf35mn+bWmSSDydvyX5T
         Yc8gBYcp9kHRZPn33aV/+HbMfB3uldqx7Hs2VFPOHD+aIPZ/+F9ZQC47LLG+2LRtAipU
         kqWeEDQfJ4EzkZ6Vj4dKx/Lcb0p4YWgHArJD6Gm6qNskdnXnm2sZlhZtRuJkt5mmYKLO
         WLEg==
X-Gm-Message-State: AOAM531IwAWBJhE6eO0ffe80+dKzUOMvValms5zk3yBapLeN+AB+BbaN
	3htumKk4VQPGJC7Imsa5vKU3YhjaWJthpYfHneg=
X-Google-Smtp-Source: 
 ABdhPJxcSHYjMf1TgTZbXVOKF0uK424Y9qdlIO+EIt9FUviHNjemdtb7rzcPi7ztBd/uEkcjSwOqm1GjiWIkVrLJNhA=
X-Received: by 2002:a05:6512:39d2:b0:44b:230:1658 with SMTP id
 k18-20020a05651239d200b0044b02301658mr3485576lfu.555.1650148090793; Sat, 16
 Apr 2022 15:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220416202401.179351-1-quaresma.jose@gmail.com>
 <3040f0d6eaabad9a0ec2632e49336af0ff189533.camel@linuxfoundation.org>
In-Reply-To: 
 <3040f0d6eaabad9a0ec2632e49336af0ff189533.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sat, 16 Apr 2022 23:27:59 +0100
Message-ID: 
 <CANPvuR=mh73YEdu2=OZMu8Z-cPO+qa1E-VVywezi4wwZJZh7HA@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 1/2] sstate: use the python3
 ThreadPoolExecutor instead of the OE ThreadedPool
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c753dd05dccd0aa4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164562

--000000000000c753dd05dccd0aa4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia s=C3=A1=
bado,
16/04/2022 =C3=A0(s) 22:57:

> On Sat, 2022-04-16 at 21:24 +0100, Jose Quaresma wrote:
> > for the FetchConnectionCache use a queue where each thread can
> > get an unsed connection_cache that is properly initialized before
> > we fireup the ThreadPoolExecutor.
> >
> > for the progress bar we need an adictional task counter
> > that is protected with thread lock as it runs inside the
> > ThreadPoolExecutor.
> >
> > Fixes [YOCTO #14775] --
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 44 +++++++++++++++++++++++--------------
> >  1 file changed, 28 insertions(+), 16 deletions(-)
>
> Are there specific issues you see with oe.utils.ThreadedPool that this
> change
> addresses? Were you able to reproduce the issue in 14775?
>

Looking deeper while testing the patch I think I found another bug in the
sstate mirror handling.
The python set() is not thread safe and we use it inside the thread pool, I
added a new python set class for that in my V2

I don't know if it is related to 14775 but it can be, I can't reproduce the
14775 on my side,
maybe it's better to remove the 14775 mention from my commits, what do you
think?


> I'm a little concerned we swap one implementation where we know roughly
> what the
> issues are for another where we dont :/.
>

I think there some issues on ThreadedPool in the worker_init and worker_end=
,
this functions is called in all workers and it seems to me that the
right thing to do
is calling and reuse the previous ones connection_cache otherwise the
connection_cache
does nothing.


>
> I notice that ThreadPoolExecutor can take an initializer but you're doing
> this
> using the queue instead. Is that because you suspect some issue with thos=
e
> being
> setup in the separate threads?
>

I am using a queue as it is the easy way I find for reusing the
FetchConnectionCache.


>
> You also mentioned the debug messages not showing. That suggests somethin=
g
> is
> wrong with the event handlers in the new threading model and that errors
> wouldn't propagate either so we need to check into that.
>

This is fixed in V2


>
> This is definitely an interesting idea but I'm nervous about it :/.
>

It would be interesting if you could test it in the autobuilder.
On my side it is working well now, I will send a V2

Jose


>
> Cheers,
>
> Richard
>
>
>
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 1c0cae4893..0ede078770 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -977,15 +977,22 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e,
> currentcount=3D0, summary=3DTrue,
> >              localdata.delVar('BB_NO_NETWORK')
> >
> >          from bb.fetch2 import FetchConnectionCache
> > -        def checkstatus_init(thread_worker):
> > -            thread_worker.connection_cache =3D FetchConnectionCache()
> > -
> > -        def checkstatus_end(thread_worker):
> > -            thread_worker.connection_cache.close_connections()
> > -
> > -        def checkstatus(thread_worker, arg):
> > +        def checkstatus_init():
> > +            while not connection_cache_pool.full():
> > +                connection_cache_pool.put(FetchConnectionCache())
> > +
> > +        def checkstatus_end():
> > +            while not connection_cache_pool.empty():
> > +                connection_cache =3D connection_cache_pool.get()
> > +                connection_cache.close_connections()
> > +
> > +        import threading
> > +        _lock =3D threading.Lock()
> > +        def checkstatus(arg):
> >              (tid, sstatefile) =3D arg
> >
> > +            connection_cache =3D connection_cache_pool.get()
> > +
> >              localdata2 =3D bb.data.createCopy(localdata)
> >              srcuri =3D "file://" + sstatefile
> >              localdata2.setVar('SRC_URI', srcuri)
> > @@ -995,7 +1002,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse=
,
> currentcount=3D0, summary=3DTrue,
> >
> >              try:
> >                  fetcher =3D bb.fetch2.Fetch(srcuri.split(), localdata2=
,
> > -
> connection_cache=3Dthread_worker.connection_cache)
> > +                            connection_cache=3Dconnection_cache)
> >                  fetcher.checkstatus()
> >                  bb.debug(2, "SState: Successful fetch test for %s" %
> srcuri)
> >                  found.add(tid)
> > @@ -1005,8 +1012,12 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFal=
se,
> currentcount=3D0, summary=3DTrue,
> >              except Exception as e:
> >                  bb.error("SState: cannot test %s: %s\n%s" % (srcuri,
> repr(e), traceback.format_exc()))
> >
> > +            connection_cache_pool.put(connection_cache)
> > +
> >              if progress:
> > -                bb.event.fire(bb.event.ProcessProgress(msg,
> len(tasklist) - thread_worker.tasks.qsize()), d)
> > +                with _lock:
> > +                    tasks -=3D 1
> > +                bb.event.fire(bb.event.ProcessProgress(msg,
> len(tasklist) - tasks), d)
> >
> >          tasklist =3D []
> >          for tid in missed:
> > @@ -1016,6 +1027,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e,
> currentcount=3D0, summary=3DTrue,
> >          if tasklist:
> >              nproc =3D min(int(d.getVar("BB_NUMBER_THREADS")),
> len(tasklist))
> >
> > +            tasks =3D len(tasklist)
> >              progress =3D len(tasklist) >=3D 100
> >              if progress:
> >                  msg =3D "Checking sstate mirror object availability"
> > @@ -1025,13 +1037,13 @@ def sstate_checkhashes(sq_data, d,
> siginfo=3DFalse, currentcount=3D0, summary=3DTrue,
> >              fetcherenv =3D bb.fetch2.get_fetcher_environment(d)
> >              with bb.utils.environment(**fetcherenv):
> >                  bb.event.enable_threadlock()
> > -                pool =3D oe.utils.ThreadedPool(nproc, len(tasklist),
> > -                        worker_init=3Dcheckstatus_init,
> worker_end=3Dcheckstatus_end,
> > -                        name=3D"sstate_checkhashes-")
> > -                for t in tasklist:
> > -                    pool.add_task(checkstatus, t)
> > -                pool.start()
> > -                pool.wait_completion()
> > +                import concurrent.futures
> > +                from queue import Queue
> > +                connection_cache_pool =3D Queue(nproc)
> > +                checkstatus_init()
> > +                with
> concurrent.futures.ThreadPoolExecutor(max_workers=3Dnproc) as executor:
> > +                    executor.map(checkstatus, tasklist)
> > +                checkstatus_end()
> >                  bb.event.disable_threadlock()
> >
> >              if progress:
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#164558):
> https://lists.openembedded.org/g/openembedded-core/message/164558
> > Mute This Topic: https://lists.openembedded.org/mt/90512350/1686473
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> richard.purdie@linuxfoundation.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c753dd05dccd0aa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia s=C3=A1bado, 16/04/2022 =C3=A0(s) 22:57:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Sat, 2022-04-16 at 21:24 +0=
100, Jose Quaresma wrote:<br>
&gt; for the FetchConnectionCache use a queue where each thread can<br>
&gt; get an unsed connection_cache that is properly initialized before<br>
&gt; we fireup the ThreadPoolExecutor.<br>
&gt; <br>
&gt; for the progress bar we need an adictional task counter<br>
&gt; that is protected with thread lock as it runs inside the<br>
&gt; ThreadPoolExecutor.<br>
&gt; <br>
&gt; Fixes [YOCTO #14775] -- <a href=3D"https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D14775" rel=3D"noreferrer" target=3D"_blank">https://bugzil=
la.yoctoproject.org/show_bug.cgi?id=3D14775</a><br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/sstate.bbclass | 44 +++++++++++++++++++++++--------=
------<br>
&gt;=C2=A0 1 file changed, 28 insertions(+), 16 deletions(-)<br>
<br>
Are there specific issues you see with oe.utils.ThreadedPool that this chan=
ge<br>
addresses? Were you able to reproduce the issue in 14775?<br></blockquote><=
div><br></div><div>Looking deeper while testing the patch I think I found a=
nother bug in the sstate=C2=A0mirror handling.<br></div><div>The=C2=A0pytho=
n set() is not thread safe and we use it inside the thread pool, I added a=
=C2=A0new python set class for=C2=A0that in=C2=A0my V2=C2=A0</div><div><br>=
</div><div>I don&#39;t=C2=A0know if it is related to 14775 but it can=C2=A0=
be,=C2=A0I can&#39;t=C2=A0reproduce the 14775 on my side,</div><div>maybe i=
t&#39;s better to remove the=C2=A014775 mention from my commits, what do yo=
u think?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
I&#39;m a little concerned we swap one implementation where we know roughly=
 what the<br>
issues are for another where we dont :/.<br></blockquote><div><br></div><di=
v>I think there some issues on ThreadedPool in the worker_init and worker_e=
nd,</div><div>this functions is called in all workers and it seems to me th=
at the right=C2=A0thing to do</div><div>is calling and reuse the previous o=
nes=C2=A0connection_cache otherwise the connection_cache</div><div>does not=
hing.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
I notice that ThreadPoolExecutor can take an initializer but you&#39;re doi=
ng this<br>
using the queue instead. Is that because you suspect some issue with those =
being<br>
setup in the separate threads?<br></blockquote><div><br></div><div>I am usi=
ng a queue as it is the easy way=C2=A0I find for reusing the FetchConnectio=
nCache.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
You also mentioned the debug messages not showing. That suggests something =
is<br>
wrong with the event handlers in the new threading model and that errors<br=
>
wouldn&#39;t propagate either so we need to check into that.<br></blockquot=
e><div><br></div><div>This is fixed in V2</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
This is definitely an interesting idea but I&#39;m nervous about it :/.<br>=
</blockquote><div><br></div><div>It would be interesting if you could test =
it in the autobuilder.</div><div>On my side it is working well now, I will =
send a V2<br></div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
&gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass=
<br>
&gt; index 1c0cae4893..0ede078770 100644<br>
&gt; --- a/meta/classes/sstate.bbclass<br>
&gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; @@ -977,15 +977,22 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFal=
se, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.delVar(&#39;=
BB_NO_NETWORK&#39;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from bb.fetch2 import FetchConnectio=
nCache<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus_init(thread_worker):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thread_worker.connection_ca=
che =3D FetchConnectionCache()<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus_end(thread_worker):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thread_worker.connection_ca=
che.close_connections()<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus(thread_worker, arg):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus_init():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while not connection_cache_=
pool.full():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_ca=
che_pool.put(FetchConnectionCache())<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus_end():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while not connection_cache_=
pool.empty():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_ca=
che =3D connection_cache_pool.get()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_ca=
che.close_connections()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import threading<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _lock =3D threading.Lock()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus(arg):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tid, sstatefile) =3D =
arg<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache =3D connec=
tion_cache_pool.get()<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata2 =3D bb.data=
.createCopy(localdata)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcuri =3D &quot;file:=
//&quot; + sstatefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata2.setVar(&#39=
;SRC_URI&#39;, srcuri)<br>
&gt; @@ -995,7 +1002,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetcher =
=3D bb.fetch2.Fetch(srcuri.split(), localdata2,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache=3Dthread_worker.connection_ca=
che)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache=3Dconnection_cache)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetcher.=
checkstatus()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug=
(2, &quot;SState: Successful fetch test for %s&quot; % srcuri)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found.ad=
d(tid)<br>
&gt; @@ -1005,8 +1012,12 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFa=
lse, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error=
(&quot;SState: cannot test %s: %s\n%s&quot; % (srcuri, repr(e), traceback.f=
ormat_exc()))<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache_pool.put(c=
onnection_cache)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if progress:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event.fire=
(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize())=
, d)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with _lock:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 tasks -=3D 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event.fire=
(bb.event.ProcessProgress(msg, len(tasklist) - tasks), d)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tasklist =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for tid in missed:<br>
&gt; @@ -1016,6 +1027,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFal=
se, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tasklist:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nproc =3D min(int(d.ge=
tVar(&quot;BB_NUMBER_THREADS&quot;)), len(tasklist))<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tasks =3D len(tasklist)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 progress =3D len(taskl=
ist) &gt;=3D 100<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if progress:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D =
&quot;Checking sstate mirror object availability&quot;<br>
&gt; @@ -1025,13 +1037,13 @@ def sstate_checkhashes(sq_data, d, siginfo=3DF=
alse, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetcherenv =3D bb.fetc=
h2.get_fetcher_environment(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with bb.utils.environm=
ent(**fetcherenv):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event=
.enable_threadlock()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pool =3D oe.u=
tils.ThreadedPool(nproc, len(tasklist),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 worker_init=3Dcheckstatus_init, worker_end=3Dcheckstatus_end=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 name=3D&quot;sstate_checkhashes-&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in task=
list:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 pool.add_task(checkstatus, t)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pool.start()<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pool.wait_com=
pletion()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import concur=
rent.futures<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue im=
port Queue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_ca=
che_pool =3D Queue(nproc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkstatus_i=
nit()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with concurre=
nt.futures.ThreadPoolExecutor(max_workers=3Dnproc) as executor:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 executor.map(checkstatus, tasklist)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkstatus_e=
nd()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event=
.disable_threadlock()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if progress:<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#164558): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/164558" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/164558</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90512350=
/1686473" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/90512350/1686473</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000c753dd05dccd0aa4--


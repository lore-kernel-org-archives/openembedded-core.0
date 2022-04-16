Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658DDC63707
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.22727.1650140983190438869
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 13:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R2BQ3/X4;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id u7so18856750lfs.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 13:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8R2UG6ekR3+n8Dbqbd50iIfTB6j/OADkDuC4tD8jJcA=;
        b=R2BQ3/X4V97zbd9s+juM4r2wHLsA6jGN8bRusux2zDN9wl63vALnxxJDkWU+63dRAH
         YUBNw9W5P7PBLsc6MMwz+IwhQemvwZ8ytlguRw3pdoEzZ9j/FCH+9ZMUFEa6rfUuSRve
         HL5or0k69LH7KeKxiINbsYpOcBiC4n9P5WoLZxLgIsJJ1lgsNZJk2X0lCyQgdkw3XjoO
         enwxUdTFp7iPrVoKb3SyqqxnnbraRquHz6eyJPgdN8SA6aaiGzMJnXXQiwXcyNIpz9LC
         Paz5V8g/GwVccV9TGlg3tSN2/bB6OmSbQStu9KWnAVL3lYKtph893EogXobCccZHlJBy
         nGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8R2UG6ekR3+n8Dbqbd50iIfTB6j/OADkDuC4tD8jJcA=;
        b=oN8Iav+7Jb4No0C9SyYzHh5RKuIRvnE//PFte683bCdESjUQRXY89ZkgjccHKSMgCI
         M4ZTWq9EewDlbRWvpSOytmIQxrCXT9J1vVTcaVn0YgPG5WIuBYaudnjAuTZW16cJpRDs
         1BdGwlIocWK4cGgDRIF7jLf3ca11Jspdc9TMn5L9rA/EtSbCzb4/9hcyycOdM+gKPv8r
         0GYToDBxO5+hUtLoT631CGoxSkRIM0KUIfKRtZ/fUN/w92RUuHs6KVlKSBze1eDFVnOh
         kcrgU548oojdJLr3ShWtIK9BvO+93FDH47DvxG+L+qHRbe6kCZ9HgtogGmNc/WA5bMcx
         JP1w==
X-Gm-Message-State: AOAM533ugFbpfxwxOdTwOUdfBkXvTYDYu/DqM2Mv0Fpbv/9ljQY8GTKM
	4MewfTtnSsvczqUPaNCci89Q04QBu81rzZi+mTs=
X-Google-Smtp-Source: 
 ABdhPJwC0CQXasNy8VgT4he7hvOw+zCCtvPw73qR/kdbrGKs0ldV9C4R1+Eso1kIFhBBdRjtcFD0aWNEXhPPaXqJB9A=
X-Received: by 2002:a05:6512:220e:b0:46f:7a06:945f with SMTP id
 h14-20020a056512220e00b0046f7a06945fmr3262445lfu.324.1650140981090; Sat, 16
 Apr 2022 13:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <16E67A2E25C82BB2.19917@lists.openembedded.org>
In-Reply-To: <16E67A2E25C82BB2.19917@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sat, 16 Apr 2022 21:29:29 +0100
Message-ID: 
 <CANPvuRnsFQA64SE_30h7jP_1=PrXB+5fYj+C_yeLmVKetYxNqA@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 1/2] sstate: use the python3
 ThreadPoolExecutor instead of the OE ThreadedPool
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000001dccd05dccb634c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164560

--00000000000001dccd05dccb634c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

One thing that yet doesn't work and I don't know why is the bitbake debug
messages inside the ThreadPoolExecutor.

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia s=C3=A1bado, 16/04/2022 =
=C3=A0(s)
21:24:

> for the FetchConnectionCache use a queue where each thread can
> get an unsed connection_cache that is properly initialized before
> we fireup the ThreadPoolExecutor.
>
> for the progress bar we need an adictional task counter
> that is protected with thread lock as it runs inside the
> ThreadPoolExecutor.
>
> Fixes [YOCTO #14775] --
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 44 +++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 1c0cae4893..0ede078770 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -977,15 +977,22 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
>              localdata.delVar('BB_NO_NETWORK')
>
>          from bb.fetch2 import FetchConnectionCache
> -        def checkstatus_init(thread_worker):
> -            thread_worker.connection_cache =3D FetchConnectionCache()
> -
> -        def checkstatus_end(thread_worker):
> -            thread_worker.connection_cache.close_connections()
> -
> -        def checkstatus(thread_worker, arg):
> +        def checkstatus_init():
> +            while not connection_cache_pool.full():
> +                connection_cache_pool.put(FetchConnectionCache())
> +
> +        def checkstatus_end():
> +            while not connection_cache_pool.empty():
> +                connection_cache =3D connection_cache_pool.get()
> +                connection_cache.close_connections()
> +
> +        import threading
> +        _lock =3D threading.Lock()
> +        def checkstatus(arg):
>              (tid, sstatefile) =3D arg
>
> +            connection_cache =3D connection_cache_pool.get()
> +
>              localdata2 =3D bb.data.createCopy(localdata)
>              srcuri =3D "file://" + sstatefile
>              localdata2.setVar('SRC_URI', srcuri)
> @@ -995,7 +1002,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
>
>              try:
>                  fetcher =3D bb.fetch2.Fetch(srcuri.split(), localdata2,
> -
> connection_cache=3Dthread_worker.connection_cache)
> +                            connection_cache=3Dconnection_cache)
>                  fetcher.checkstatus()
>                  bb.debug(2, "SState: Successful fetch test for %s" %
> srcuri)
>                  found.add(tid)
> @@ -1005,8 +1012,12 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse=
,
> currentcount=3D0, summary=3DTrue,
>              except Exception as e:
>                  bb.error("SState: cannot test %s: %s\n%s" % (srcuri,
> repr(e), traceback.format_exc()))
>
> +            connection_cache_pool.put(connection_cache)
> +
>              if progress:
> -                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist=
)
> - thread_worker.tasks.qsize()), d)
> +                with _lock:
> +                    tasks -=3D 1
> +                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist=
)
> - tasks), d)
>
>          tasklist =3D []
>          for tid in missed:
> @@ -1016,6 +1027,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
>          if tasklist:
>              nproc =3D min(int(d.getVar("BB_NUMBER_THREADS")), len(taskli=
st))
>
> +            tasks =3D len(tasklist)
>              progress =3D len(tasklist) >=3D 100
>              if progress:
>                  msg =3D "Checking sstate mirror object availability"
> @@ -1025,13 +1037,13 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e,
> currentcount=3D0, summary=3DTrue,
>              fetcherenv =3D bb.fetch2.get_fetcher_environment(d)
>              with bb.utils.environment(**fetcherenv):
>                  bb.event.enable_threadlock()
> -                pool =3D oe.utils.ThreadedPool(nproc, len(tasklist),
> -                        worker_init=3Dcheckstatus_init,
> worker_end=3Dcheckstatus_end,
> -                        name=3D"sstate_checkhashes-")
> -                for t in tasklist:
> -                    pool.add_task(checkstatus, t)
> -                pool.start()
> -                pool.wait_completion()
> +                import concurrent.futures
> +                from queue import Queue
> +                connection_cache_pool =3D Queue(nproc)
> +                checkstatus_init()
> +                with
> concurrent.futures.ThreadPoolExecutor(max_workers=3Dnproc) as executor:
> +                    executor.map(checkstatus, tasklist)
> +                checkstatus_end()
>                  bb.event.disable_threadlock()
>
>              if progress:
> --
> 2.35.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164558):
> https://lists.openembedded.org/g/openembedded-core/message/164558
> Mute This Topic: https://lists.openembedded.org/mt/90512350/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000001dccd05dccb634c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>One thing that yet=C2=A0=
doesn&#39;t work and I don&#39;t know why is the bitbake debug messages ins=
ide the ThreadPoolExecutor.</div><div><br></div>Jose<div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;quaresma=
.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists=
.openembedded.org</a>&gt; escreveu no dia s=C3=A1bado, 16/04/2022 =C3=A0(s)=
 21:24:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">for the =
FetchConnectionCache use a queue where each thread can<br>
get an unsed connection_cache that is properly initialized before<br>
we fireup the ThreadPoolExecutor.<br>
<br>
for the progress bar we need an adictional task counter<br>
that is protected with thread lock as it runs inside the<br>
ThreadPoolExecutor.<br>
<br>
Fixes [YOCTO #14775] -- <a href=3D"https://bugzilla.yoctoproject.org/show_b=
ug.cgi?id=3D14775" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D14775</a><br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sstate.bbclass | 44 +++++++++++++++++++++++-------------=
-<br>
=C2=A01 file changed, 28 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 1c0cae4893..0ede078770 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -977,15 +977,22 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata.delVar(&#39;BB_NO=
_NETWORK&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from bb.fetch2 import FetchConnectionCach=
e<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus_init(thread_worker):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thread_worker.connection_cache =
=3D FetchConnectionCache()<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus_end(thread_worker):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thread_worker.connection_cache.c=
lose_connections()<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus(thread_worker, arg):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus_init():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while not connection_cache_pool.=
full():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache_p=
ool.put(FetchConnectionCache())<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus_end():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while not connection_cache_pool.=
empty():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache =
=3D connection_cache_pool.get()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache.c=
lose_connections()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import threading<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _lock =3D threading.Lock()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def checkstatus(arg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(tid, sstatefile) =3D arg<b=
r>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache =3D connection_=
cache_pool.get()<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata2 =3D bb.data.crea=
teCopy(localdata)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcuri =3D &quot;file://&qu=
ot; + sstatefile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata2.setVar(&#39;SRC_=
URI&#39;, srcuri)<br>
@@ -995,7 +1002,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, cu=
rrentcount=3D0, summary=3DTrue,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetcher =3D b=
b.fetch2.Fetch(srcuri.split(), localdata2,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache=3Dthread_worker.connection_cache)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache=3Dconnection_cache)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetcher.check=
status()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(2, &=
quot;SState: Successful fetch test for %s&quot; % srcuri)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found.add(tid=
)<br>
@@ -1005,8 +1012,12 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, =
currentcount=3D0, summary=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quo=
t;SState: cannot test %s: %s\n%s&quot; % (srcuri, repr(e), traceback.format=
_exc()))<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache_pool.put(connec=
tion_cache)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if progress:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event.fire(bb.e=
vent.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with _lock:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task=
s -=3D 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event.fire(bb.e=
vent.ProcessProgress(msg, len(tasklist) - tasks), d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tasklist =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for tid in missed:<br>
@@ -1016,6 +1027,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if tasklist:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nproc =3D min(int(d.getVar(=
&quot;BB_NUMBER_THREADS&quot;)), len(tasklist))<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tasks =3D len(tasklist)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0progress =3D len(tasklist) =
&gt;=3D 100<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if progress:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D &quot=
;Checking sstate mirror object availability&quot;<br>
@@ -1025,13 +1037,13 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,=
 currentcount=3D0, summary=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetcherenv =3D bb.fetch2.ge=
t_fetcher_environment(d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with bb.utils.environment(*=
*fetcherenv):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.event.enab=
le_threadlock()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pool =3D oe.utils.=
ThreadedPool(nproc, len(tasklist),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 worker_init=3Dcheckstatus_init, worker_end=3Dcheckstatus_end,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 name=3D&quot;sstate_checkhashes-&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in tasklist:=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pool=
.add_task(checkstatus, t)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pool.start()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pool.wait_completi=
on()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import concurrent.=
futures<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue import =
Queue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connection_cache_p=
ool =3D Queue(nproc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkstatus_init()=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with concurrent.fu=
tures.ThreadPoolExecutor(max_workers=3Dnproc) as executor:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec=
utor.map(checkstatus, tasklist)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkstatus_end()<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.event.disa=
ble_threadlock()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if progress:<br>
-- <br>
2.35.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164558): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164558" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164558</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90512350/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90512350/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div></div>

--00000000000001dccd05dccb634c--


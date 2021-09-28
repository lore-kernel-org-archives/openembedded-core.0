Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D752C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 09:33:11 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web08.11462.1632821590237018106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 02:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EF0Jlegv;
 spf=pass (domain: gmail.com, ip: 209.85.217.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id z62so21310139vsz.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yTcl2m74oEPsr5haJ5KLyHAStaDcu4zxduvF80sBumE=;
        b=EF0Jlegv/qHeiYhzzst+OhQ5szkFmak5jaQElo1Z6lGBLJ+SVpEBv65mZ+tWiEQs/R
         r3w0YYh4NQnwGDICaWjCSSy+235g0ZPtNDAylsCZeRbBZkeoaD13k0+y+jPQZBtPsCAJ
         4jY+WTTMljQqRkJ1tdr2cTg9AWGVqIdDK0+pTnxqOGT/RbinzQNpEKf81ak8NYJ1l/ji
         uSU94BNCv8y/rn4QaGZ8me51LP2InwdlwAdjs/GYaAucHRhNTNbCPWDt9zQhOnn9qy7U
         t5NDkP2SACRDbM3UvcIqNAar5aIJntrGJ0PyGvtMjcbKJlAelB/k7ENgPZxzvbcegA6U
         GXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yTcl2m74oEPsr5haJ5KLyHAStaDcu4zxduvF80sBumE=;
        b=nmR81QygyqJQFFbwmvrtiEUae8mp0zjjJ3kp9JYl2D5sMTnErz0Hhaik2C6DzwwdBn
         ay5isSa07vKJ8Yui5fz7Kq/ZCLd2LS0xloPUNQF26aSQXlsyBepuIhLWn2RIgb5YmHmV
         Mfg+qoslFgYwuAW4a13b3vgM133M1okQw2BF5awNxt85HEluM4q1j98sRyyUOPEn9vid
         2KJtHkrt+KEW2jF3r5nA5ZdUkaaDR0BvXCv6dJaYnAqTzjwWovzKMt79JKKzClPDHb/W
         1h8/WLpFqOtLeBr+wwX9Cl/w0Jmv/iaTxdawGPd0DmN+rPkiIEVTX4qrSva68KmAryYy
         XsoQ==
X-Gm-Message-State: AOAM533cCwsKJT2krVyJkQ3pWS8cJXOF2N8/tCZ5R2Qlpr4VFhXCwwYB
	WZ3GTJUsUVIiXVUOUW83uFnIictOiGVNk2pAcIA=
X-Google-Smtp-Source: 
 ABdhPJyVlg514elWM8Xrb3r4fjNAIUqVQgQH+7AbWXy8WwkWb5phiBDW1kUbO11uCLX3QICI8veqPmdLxSctQeDHTsg=
X-Received: by 2002:a05:6102:21b9:: with SMTP id
 i25mr3848556vsb.1.1632821589105;
 Tue, 28 Sep 2021 02:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210922083506.29630-1-mingli.yu@windriver.com>
 <YVH8PvaqaHPeA+6d@piout.net>
 <1c3f9768-ab73-8013-c8a7-c4ca03af4754@windriver.com>
In-Reply-To: <1c3f9768-ab73-8013-c8a7-c4ca03af4754@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Sep 2021 11:32:58 +0200
Message-ID: 
 <CANNYZj_PH8HBmj2J2uBna6u3w2GEFaD2JFB5kEyq889eDQ_DTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libevent: mark util/monotonic_prc_fallback as
 retriable
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ccdecb05cd0ae659"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 09:33:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156411

--000000000000ccdecb05cd0ae659
Content-Type: text/plain; charset="UTF-8"

How did you run the test? I cherry-picked the proposed fix into my queue,
and alas, the fail from ptest-runner is still occurring sporadically.

Alex

On Tue, 28 Sept 2021 at 11:08, Yu, Mingli <mingli.yu@windriver.com> wrote:

>
>
> On 9/28/21 1:15 AM, Alexandre Belloni wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > Hello,
> >
> > On 22/09/2021 16:35:06+0800, Yu, Mingli wrote:
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> Backport a patch to fix the below ptest failure:
> >>   # ./run-ptest
> >>   Running tests:
> >>   EVPORT
> >>   Skipping test
> >>   KQUEUE
> >>   Skipping test
> >>   EPOLL
> >>   test-eof: OKAY
> >>   test-dumpevents: OKAY (output not checked)
> >>   regress:
> >>    FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
> >>    [monotonic_prc_fallback FAILED]
> >>   1/312 TESTS FAILED. (33 skipped)
> >>   FAILED
> >>   regress_debug:
> >>    FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
> >>    [monotonic_prc_fallback FAILED]
> >>   1/312 TESTS FAILED. (33 skipped)
> >>   FAILED
> >>   [snip]
> >>
> >
> > Thanks, I did apply this patch on top of my kirkstone-next branch for a
> > while and unfortunately, this didn't solve the issue on the
> > autobuilders. What I know for now is that the time difference in the
> > loop is not the issue and what is failing is actually the setup of the
> > build, i.e, the evutil_configure_monotonic_time_() call fails in
> > test_evutil_monotonic_prc(). I still dodn't find why as this should
> > simply return 0 under Linux. We are looking at thet a bit more in depth
> > this week but we may end up disabling that test.
>
> Interesting, the patch did silence the failure in my env.
>
> Thanks,
>
> >
> >
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   ...-monotonic_prc_fallback-as-retriable.patch | 30 +++++++++++++++++++
> >>   .../libevent/libevent_2.1.12.bb               |  1 +
> >>   2 files changed, 31 insertions(+)
> >>   create mode 100644
> meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> >>
> >> diff --git
> a/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> >> new file mode 100644
> >> index 0000000000..754c446a67
> >> --- /dev/null
> >> +++
> b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> >> @@ -0,0 +1,30 @@
> >> +From 8fc3fb57ac1b1b0f338506cb86e3adac29d684d7 Mon Sep 17 00:00:00 2001
> >> +From: Azat Khuzhin <azat@libevent.org>
> >> +Date: Wed, 22 Sep 2021 15:14:01 +0800
> >> +Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable
> >> +
> >> +Refs: #1193
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696934
> ]
> >> +
> >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> +---
> >> + test/regress_util.c | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/test/regress_util.c b/test/regress_util.c
> >> +index 45caa27..a9e80db 100644
> >> +--- a/test/regress_util.c
> >> ++++ b/test/regress_util.c
> >> +@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] = {
> >> +     { "monotonic_res_fallback", test_evutil_monotonic_res,
> TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
> >> +     { "monotonic_prc", test_evutil_monotonic_prc, 0, &basic_setup,
> (void*)"" },
> >> +     { "monotonic_prc_precise", test_evutil_monotonic_prc,
> TT_RETRIABLE, &basic_setup, (void*)"precise" },
> >> +-    { "monotonic_prc_fallback", test_evutil_monotonic_prc, 0,
> &basic_setup, (void*)"fallback" },
> >> ++    { "monotonic_prc_fallback", test_evutil_monotonic_prc,
> TT_RETRIABLE, &basic_setup, (void*)"fallback" },
> >> +     { "date_rfc1123", test_evutil_date_rfc1123, 0, NULL, NULL },
> >> +     { "evutil_v4addr_is_local", test_evutil_v4addr_is_local, 0, NULL,
> NULL },
> >> +     { "evutil_v6addr_is_local", test_evutil_v6addr_is_local, 0, NULL,
> NULL },
> >> +--
> >> +2.17.1
> >> +
> >> diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb
> b/meta/recipes-support/libevent/libevent_2.1.12.bb
> >> index 4b419eab22..3f29c0cffe 100644
> >> --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
> >> +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
> >> @@ -16,6 +16,7 @@ SRC_URI = "
> https://github.com/libevent/libevent/releases/download/release-${PV}-
> >>              file://run-ptest \
> >>
> file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
> >>
> file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch \
> >> +
>  file://0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch \
> >>              "
> >>
> >>   SRC_URI[sha256sum] =
> "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
> >> --
> >> 2.32.0
> >>
> >
> >>
> >>
> >>
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156410):
> https://lists.openembedded.org/g/openembedded-core/message/156410
> Mute This Topic: https://lists.openembedded.org/mt/85785430/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ccdecb05cd0ae659
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>How did you run the test? I cherry-picked the propose=
d fix into my queue, and alas, the fail from ptest-runner is still occurrin=
g sporadically.<br></div><div><br></div><div>Alex<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 28 Sept =
2021 at 11:08, Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@windriver.com">mi=
ngli.yu@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><br>
<br>
On 9/28/21 1:15 AM, Alexandre Belloni wrote:<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; On 22/09/2021 16:35:06+0800, Yu, Mingli wrote:<br>
&gt;&gt; From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Backport a patch to fix the below ptest failure:<br>
&gt;&gt;=C2=A0 =C2=A0# ./run-ptest<br>
&gt;&gt;=C2=A0 =C2=A0Running tests:<br>
&gt;&gt;=C2=A0 =C2=A0EVPORT<br>
&gt;&gt;=C2=A0 =C2=A0Skipping test<br>
&gt;&gt;=C2=A0 =C2=A0KQUEUE<br>
&gt;&gt;=C2=A0 =C2=A0Skipping test<br>
&gt;&gt;=C2=A0 =C2=A0EPOLL<br>
&gt;&gt;=C2=A0 =C2=A0test-eof: OKAY<br>
&gt;&gt;=C2=A0 =C2=A0test-dumpevents: OKAY (output not checked)<br>
&gt;&gt;=C2=A0 =C2=A0regress:<br>
&gt;&gt;=C2=A0 =C2=A0 FAIL ../libevent-2.1.12-stable/test/regress_util.c:14=
78: assert(diff.tv_sec =3D=3D 0): 1 vs 0 util/monotonic_prc_fallback:<br>
&gt;&gt;=C2=A0 =C2=A0 [monotonic_prc_fallback FAILED]<br>
&gt;&gt;=C2=A0 =C2=A01/312 TESTS FAILED. (33 skipped)<br>
&gt;&gt;=C2=A0 =C2=A0FAILED<br>
&gt;&gt;=C2=A0 =C2=A0regress_debug:<br>
&gt;&gt;=C2=A0 =C2=A0 FAIL ../libevent-2.1.12-stable/test/regress_util.c:14=
78: assert(diff.tv_sec =3D=3D 0): 1 vs 0 util/monotonic_prc_fallback:<br>
&gt;&gt;=C2=A0 =C2=A0 [monotonic_prc_fallback FAILED]<br>
&gt;&gt;=C2=A0 =C2=A01/312 TESTS FAILED. (33 skipped)<br>
&gt;&gt;=C2=A0 =C2=A0FAILED<br>
&gt;&gt;=C2=A0 =C2=A0[snip]<br>
&gt;&gt;<br>
&gt; <br>
&gt; Thanks, I did apply this patch on top of my kirkstone-next branch for =
a<br>
&gt; while and unfortunately, this didn&#39;t solve the issue on the<br>
&gt; autobuilders. What I know for now is that the time difference in the<b=
r>
&gt; loop is not the issue and what is failing is actually the setup of the=
<br>
&gt; build, i.e, the evutil_configure_monotonic_time_() call fails in<br>
&gt; test_evutil_monotonic_prc(). I still dodn&#39;t find why as this shoul=
d<br>
&gt; simply return 0 under Linux. We are looking at thet a bit more in dept=
h<br>
&gt; this week but we may end up disabling that test.<br>
<br>
Interesting, the patch did silence the failure in my env.<br>
<br>
Thanks,<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver=
.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0...-monotonic_prc_fallback-as-retriable.patch | 30 +++=
++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0.../libevent/<a href=3D"http://libevent_2.1.12.bb" rel=
=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 31 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/libevent/libev=
ent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-support/libevent/libevent/0001-test-mark=
-util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-support/libe=
vent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch=
<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..754c446a67<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-support/libevent/libevent/0001-test-mark-util-m=
onotonic_prc_fallback-as-retriable.patch<br>
&gt;&gt; @@ -0,0 +1,30 @@<br>
&gt;&gt; +From 8fc3fb57ac1b1b0f338506cb86e3adac29d684d7 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Azat Khuzhin &lt;<a href=3D"mailto:azat@libevent.org" targe=
t=3D"_blank">azat@libevent.org</a>&gt;<br>
&gt;&gt; +Date: Wed, 22 Sep 2021 15:14:01 +0800<br>
&gt;&gt; +Subject: [PATCH] test: mark util/monotonic_prc_fallback as retria=
ble<br>
&gt;&gt; +<br>
&gt;&gt; +Refs: #1193<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/libevent=
/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696934" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/libevent/libevent/commit/04fcd7c6df=
158bb65261867de4b9ec8439696934</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windrive=
r.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + test/regress_util.c | 2 +-<br>
&gt;&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/test/regress_util.c b/test/regress_util.c<br>
&gt;&gt; +index 45caa27..a9e80db 100644<br>
&gt;&gt; +--- a/test/regress_util.c<br>
&gt;&gt; ++++ b/test/regress_util.c<br>
&gt;&gt; +@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] =3D {<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_res_fallback&quot;, test_ev=
util_monotonic_res, TT_OFF_BY_DEFAULT, &amp;basic_setup, (void*)&quot;fallb=
ack&quot; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_prc&quot;, test_evutil_mono=
tonic_prc, 0, &amp;basic_setup, (void*)&quot;&quot; },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_prc_precise&quot;, test_evu=
til_monotonic_prc, TT_RETRIABLE, &amp;basic_setup, (void*)&quot;precise&quo=
t; },<br>
&gt;&gt; +-=C2=A0 =C2=A0 { &quot;monotonic_prc_fallback&quot;, test_evutil_=
monotonic_prc, 0, &amp;basic_setup, (void*)&quot;fallback&quot; },<br>
&gt;&gt; ++=C2=A0 =C2=A0 { &quot;monotonic_prc_fallback&quot;, test_evutil_=
monotonic_prc, TT_RETRIABLE, &amp;basic_setup, (void*)&quot;fallback&quot; =
},<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;date_rfc1123&quot;, test_evutil_date_=
rfc1123, 0, NULL, NULL },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;evutil_v4addr_is_local&quot;, test_ev=
util_v4addr_is_local, 0, NULL, NULL },<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;evutil_v6addr_is_local&quot;, test_ev=
util_v6addr_is_local, 0, NULL, NULL },<br>
&gt;&gt; +--<br>
&gt;&gt; +2.17.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-support/libevent/<a href=3D"http://libev=
ent_2.1.12.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a> =
b/meta/recipes-support/libevent/<a href=3D"http://libevent_2.1.12.bb" rel=
=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a><br>
&gt;&gt; index 4b419eab22..3f29c0cffe 100644<br>
&gt;&gt; --- a/meta/recipes-support/libevent/<a href=3D"http://libevent_2.1=
.12.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a><br>
&gt;&gt; +++ b/meta/recipes-support/libevent/<a href=3D"http://libevent_2.1=
.12.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a><br>
&gt;&gt; @@ -16,6 +16,7 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/=
libevent/libevent/releases/download/release-$%7BPV%7D-" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/libevent/libevent/releases/download/re=
lease-${PV}-</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test-r=
egress_dns.c-patch-out-tests-that-require-a-wo.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-test-r=
egress.h-Increase-default-timeval-tolerance-50.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-mark-ut=
il-monotonic_prc_fallback-as-retriable.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D &quot;92e6de1be9ec176428fd23676=
77e61ceffc2ee1cb119035037a27d346b0403bb&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.32.0<br>
&gt;&gt;<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156410): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156410" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156410</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85785430/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85785430/1686489</a><br>
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

--000000000000ccdecb05cd0ae659--


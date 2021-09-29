Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2482C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 07:19:37 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web09.5524.1632899976634036422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 00:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FjNHYuiT;
 spf=pass (domain: gmail.com, ip: 209.85.217.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id f18so1838151vsp.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MZIFJYaInE5FP7hBZPKW6sVcSPo/s0Z7hUnKsLxRexQ=;
        b=FjNHYuiTyfjz1p6FnZ7wd2CZaIFO+dEJVhoUPLWT19FmEnxHTC8h0RXbuAUO1Vethn
         icRz1wFnUXNDAEgNJ3lT0AzwAGDRZMJiKirrtZ2G8x4s6tefheLNuEl/N0+dgeymNqQ+
         tyyN/Io6FxjcHrIkB007aMINhD4bgJgnW2ngcC6gMn8FqH/2Lw2+X3fzq8HEzHF7m/+2
         oILQ3USsM62OXcOIu/PpXD0hYL7cioKIi3ZxBVZwprFdFZ4gRfZ/S3cYiE+hyeBXD+ge
         Ls6XVqEuvHav34kOAr90WomlmD5LZkTEkBNI2PcLHEl53TRt824d3CkjT1JjvtF6RtL5
         yGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MZIFJYaInE5FP7hBZPKW6sVcSPo/s0Z7hUnKsLxRexQ=;
        b=19rOuQ1LD+Nk2z0rgzTh4gb3OlG3TzEqcQSjO3HIyll/4ZmJG1uZiqCjkQdCDHjnDk
         rwzGA2AzWN966XJblKOztJYqQbbnHkbhEd8aFknO4gtTvBd0I01xz2S/ruZ/oZxJTuO/
         pEnjPJuobfJj+/UWrIhAopmW990XghnQbzG0fPFUWReUaiIovZSU7PvCHpaFNHd9uMuh
         BNfL5nyKXIJNeE4YrqoOz7GRBFhVTitUN7ZdTXbYmHeY1/xESbiEPuzv97clO/Dfk/FO
         nzN0cbyMQHbrDvC+r/XTS0mOWX//SDpEeBi6np5E7Me+wh2oFiVmN2vTnJGL8nhXiBDW
         RuCQ==
X-Gm-Message-State: AOAM533Z2Mc/a/DB2id+TuXGtcQxlqL8JIkImS/rBJ6iRBxqca4EboG8
	qffiQSeiMKBir9nTq8xkpzHC9b64MDZPwTsWFL0=
X-Google-Smtp-Source: 
 ABdhPJwEx16nQcj8L1Z93fnC3Xf0Ux+KAeG+GV9T3qq2z/K1RI5GVrguiMY66Y067pBRIVUeHE1Oyv4fpZ6DGYdoFyQ=
X-Received: by 2002:a05:6102:21ce:: with SMTP id
 r14mr9205685vsg.40.1632899975641;
 Wed, 29 Sep 2021 00:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210922083506.29630-1-mingli.yu@windriver.com>
 <YVH8PvaqaHPeA+6d@piout.net>
 <1c3f9768-ab73-8013-c8a7-c4ca03af4754@windriver.com>
 <CANNYZj_PH8HBmj2J2uBna6u3w2GEFaD2JFB5kEyq889eDQ_DTQ@mail.gmail.com>
 <3fa023e1-f439-c223-360e-47c7f1c36d90@windriver.com>
In-Reply-To: <3fa023e1-f439-c223-360e-47c7f1c36d90@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Sep 2021 09:19:24 +0200
Message-ID: 
 <CANNYZj_VW+HzfHc44DBPqKYgBfJLbeeA6xyk-uioe7j3H8gyHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libevent: mark util/monotonic_prc_fallback as
 retriable
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000007d9c05cd1d2764"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 07:19:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156447

--000000000000007d9c05cd1d2764
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Sept 2021 at 04:24, Yu, Mingli <mingli.yu@windriver.com> wrote:

> regress:
> FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> assert(diff.tv_sec == 0): 1 vs 0util/monotonic_prc_fallback:
> [monotonic_prc_fallback FAILED]
>
> [RETRYING monotonic_prc_fallback (3)]
> OKAY
>

I think our run-ptest interprets the above as 'fail':
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-support/libevent/libevent/run-ptest?h=master-next


>
> BTW, let us use https://github.com/libevent/libevent/issues/1193 to
> track the issue.
>

I left a comment there. The output needs to be adjusted to be less
confusing. We can do it with a local patch if upstream doesn't want to.

Alex


>
> Thanks,
>
> >
> > Alex
> >
> > On Tue, 28 Sept 2021 at 11:08, Yu, Mingli <mingli.yu@windriver.com
> > <mailto:mingli.yu@windriver.com>> wrote:
> >
> >
> >
> >     On 9/28/21 1:15 AM, Alexandre Belloni wrote:
> >      > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >      >
> >      > Hello,
> >      >
> >      > On 22/09/2021 16:35:06+0800, Yu, Mingli wrote:
> >      >> From: Mingli Yu <mingli.yu@windriver.com
> >     <mailto:mingli.yu@windriver.com>>
> >      >>
> >      >> Backport a patch to fix the below ptest failure:
> >      >>   # ./run-ptest
> >      >>   Running tests:
> >      >>   EVPORT
> >      >>   Skipping test
> >      >>   KQUEUE
> >      >>   Skipping test
> >      >>   EPOLL
> >      >>   test-eof: OKAY
> >      >>   test-dumpevents: OKAY (output not checked)
> >      >>   regress:
> >      >>    FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> >     assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
> >      >>    [monotonic_prc_fallback FAILED]
> >      >>   1/312 TESTS FAILED. (33 skipped)
> >      >>   FAILED
> >      >>   regress_debug:
> >      >>    FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> >     assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
> >      >>    [monotonic_prc_fallback FAILED]
> >      >>   1/312 TESTS FAILED. (33 skipped)
> >      >>   FAILED
> >      >>   [snip]
> >      >>
> >      >
> >      > Thanks, I did apply this patch on top of my kirkstone-next branch
> >     for a
> >      > while and unfortunately, this didn't solve the issue on the
> >      > autobuilders. What I know for now is that the time difference in
> the
> >      > loop is not the issue and what is failing is actually the setup
> >     of the
> >      > build, i.e, the evutil_configure_monotonic_time_() call fails in
> >      > test_evutil_monotonic_prc(). I still dodn't find why as this
> should
> >      > simply return 0 under Linux. We are looking at thet a bit more in
> >     depth
> >      > this week but we may end up disabling that test.
> >
> >     Interesting, the patch did silence the failure in my env.
> >
> >     Thanks,
> >
> >      >
> >      >
> >      >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com
> >     <mailto:mingli.yu@windriver.com>>
> >      >> ---
> >      >>   ...-monotonic_prc_fallback-as-retriable.patch | 30
> >     +++++++++++++++++++
> >      >>   .../libevent/libevent_2.1.12.bb
> >     <
> https://urldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$>
>
> >                   |  1 +
> >      >>   2 files changed, 31 insertions(+)
> >      >>   create mode 100644
> >
>  meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> >      >>
> >      >> diff --git
> >
>  a/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> >
>  b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> >      >> new file mode 100644
> >      >> index 0000000000..754c446a67
> >      >> --- /dev/null
> >      >> +++
> >
>  b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> >      >> @@ -0,0 +1,30 @@
> >      >> +From 8fc3fb57ac1b1b0f338506cb86e3adac29d684d7 Mon Sep 17
> >     00:00:00 2001
> >      >> +From: Azat Khuzhin <azat@libevent.org <mailto:azat@libevent.org
> >>
> >      >> +Date: Wed, 22 Sep 2021 15:14:01 +0800
> >      >> +Subject: [PATCH] test: mark util/monotonic_prc_fallback as
> >     retriable
> >      >> +
> >      >> +Refs: #1193
> >      >> +
> >      >> +Upstream-Status: Backport
> >     [
> https://github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696934
> >     <
> https://urldefense.com/v3/__https://github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696934__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJv4-tI38$
> >]
> >      >> +
> >      >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com
> >     <mailto:mingli.yu@windriver.com>>
> >      >> +---
> >      >> + test/regress_util.c | 2 +-
> >      >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >      >> +
> >      >> +diff --git a/test/regress_util.c b/test/regress_util.c
> >      >> +index 45caa27..a9e80db 100644
> >      >> +--- a/test/regress_util.c
> >      >> ++++ b/test/regress_util.c
> >      >> +@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] = {
> >      >> +     { "monotonic_res_fallback", test_evutil_monotonic_res,
> >     TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
> >      >> +     { "monotonic_prc", test_evutil_monotonic_prc, 0,
> >     &basic_setup, (void*)"" },
> >      >> +     { "monotonic_prc_precise", test_evutil_monotonic_prc,
> >     TT_RETRIABLE, &basic_setup, (void*)"precise" },
> >      >> +-    { "monotonic_prc_fallback", test_evutil_monotonic_prc, 0,
> >     &basic_setup, (void*)"fallback" },
> >      >> ++    { "monotonic_prc_fallback", test_evutil_monotonic_prc,
> >     TT_RETRIABLE, &basic_setup, (void*)"fallback" },
> >      >> +     { "date_rfc1123", test_evutil_date_rfc1123, 0, NULL, NULL
> },
> >      >> +     { "evutil_v4addr_is_local", test_evutil_v4addr_is_local,
> >     0, NULL, NULL },
> >      >> +     { "evutil_v6addr_is_local", test_evutil_v6addr_is_local,
> >     0, NULL, NULL },
> >      >> +--
> >      >> +2.17.1
> >      >> +
> >      >> diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb
> >     <
> https://urldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$
> >
> >     b/meta/recipes-support/libevent/libevent_2.1.12.bb
> >     <
> https://urldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$
> >
> >      >> index 4b419eab22..3f29c0cffe 100644
> >      >> --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
> >     <
> https://urldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$
> >
> >      >> +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
> >     <
> https://urldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$
> >
> >      >> @@ -16,6 +16,7 @@ SRC_URI =
> >     "
> https://github.com/libevent/libevent/releases/download/release-${PV}-
> >     <
> https://urldefense.com/v3/__https://github.com/libevent/libevent/releases/download/release-$*7BPV*7D-__;JSU!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJfM99jEA$
> >
> >      >>              file://run-ptest \
> >      >>
> >
>  file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
> >      >>
> >
>  file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch \
> >      >> +
> >
>  file://0001-test-mark-util-monotonic_prc_fallback-as-retriable.patch \
> >      >>              "
> >      >>
> >      >>   SRC_URI[sha256sum] =
> >     "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
> >      >> --
> >      >> 2.32.0
> >      >>
> >      >
> >      >>
> >      >>
> >      >>
> >      >
> >      >
> >      > --
> >      > Alexandre Belloni, co-owner and COO, Bootlin
> >      > Embedded Linux and Kernel engineering
> >      > https://bootlin.com
> >     <
> https://urldefense.com/v3/__https://bootlin.com__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJbAyvLVM$
> >
> >      >
> >
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#156410):
> >     https://lists.openembedded.org/g/openembedded-core/message/156410
> >     <
> https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/156410__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJo1e94_Q$
> >
> >     Mute This Topic: https://lists.openembedded.org/mt/85785430/1686489
> >     <
> https://urldefense.com/v3/__https://lists.openembedded.org/mt/85785430/1686489__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJaGuez1c$
> >
> >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-core/unsub
> >     <
> https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJUWLo-40$
> >
> >     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000007d9c05cd1d2764
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 29 Sept 2021 at 04:24, Yu, Mingli &lt;<a href=3D"mailto:ming=
li.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">regress:<br>
FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: <br>
assert(diff.tv_sec =3D=3D 0): 1 vs 0util/monotonic_prc_fallback:<br>
[monotonic_prc_fallback FAILED]<br>
<br>
[RETRYING monotonic_prc_fallback (3)]<br>
OKAY<br></blockquote><div><br></div><div>I think our run-ptest interprets t=
he above as &#39;fail&#39;:</div><div><a href=3D"http://git.yoctoproject.or=
g/cgit.cgi/poky/tree/meta/recipes-support/libevent/libevent/run-ptest?h=3Dm=
aster-next">http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-sup=
port/libevent/libevent/run-ptest?h=3Dmaster-next</a></div><div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
BTW, let us use <a href=3D"https://github.com/libevent/libevent/issues/1193=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/libevent/libevent=
/issues/1193</a> to <br>
track the issue.<br></blockquote><div><br></div><div>I left a comment there=
. The output needs to be adjusted to be less confusing. We can do it with a=
 local patch if upstream doesn&#39;t want to.<br></div><div><br></div><div>=
Alex<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Thanks,<br>
<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Tue, 28 Sept 2021 at 11:08, Yu, Mingli &lt;<a href=3D"mailto:mingli=
.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_blank=
">mingli.yu@windriver.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 9/28/21 1:15 AM, Alexandre Belloni wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; [Please note: This e-mail is from an EXTERNAL=
 e-mail address]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On 22/09/2021 16:35:06+0800, Yu, Mingli wrote=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; From: Mingli Yu &lt;<a href=3D"mailto:min=
gli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mingli.yu@windriver.co=
m" target=3D"_blank">mingli.yu@windriver.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Backport a patch to fix the below ptest f=
ailure:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0# ./run-ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0Running tests:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0EVPORT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0Skipping test<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0KQUEUE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0Skipping test<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0EPOLL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0test-eof: OKAY<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0test-dumpevents: OKAY (output=
 not checked)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0regress:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 FAIL ../libevent-2.1.12-stab=
le/test/regress_util.c:1478:<br>
&gt;=C2=A0 =C2=A0 =C2=A0assert(diff.tv_sec =3D=3D 0): 1 vs 0 util/monotonic=
_prc_fallback:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 [monotonic_prc_fallback FAIL=
ED]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A01/312 TESTS FAILED. (33 skipp=
ed)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0FAILED<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0regress_debug:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 FAIL ../libevent-2.1.12-stab=
le/test/regress_util.c:1478:<br>
&gt;=C2=A0 =C2=A0 =C2=A0assert(diff.tv_sec =3D=3D 0): 1 vs 0 util/monotonic=
_prc_fallback:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 [monotonic_prc_fallback FAIL=
ED]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A01/312 TESTS FAILED. (33 skipp=
ed)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0FAILED<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0[snip]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks, I did apply this patch on top of my k=
irkstone-next branch<br>
&gt;=C2=A0 =C2=A0 =C2=A0for a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; while and unfortunately, this didn&#39;t solv=
e the issue on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; autobuilders. What I know for now is that the=
 time difference in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; loop is not the issue and what is failing is =
actually the setup<br>
&gt;=C2=A0 =C2=A0 =C2=A0of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; build, i.e, the evutil_configure_monotonic_ti=
me_() call fails in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; test_evutil_monotonic_prc(). I still dodn&#39=
;t find why as this should<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; simply return 0 under Linux. We are looking a=
t thet a bit more in<br>
&gt;=C2=A0 =C2=A0 =C2=A0depth<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; this week but we may end up disabling that te=
st.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Interesting, the patch did silence the failure in m=
y env.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"m=
ailto:mingli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mingli.yu@windriver.co=
m" target=3D"_blank">mingli.yu@windriver.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0...-monotonic_prc_fallback-as=
-retriable.patch | 30<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0.../libevent/<a href=3D"http:=
//libevent_2.1.12.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.12.=
bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://l=
ibevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSi=
Z0whmoaFuYLbnuTgZhJYova8kU$" rel=3D"noreferrer" target=3D"_blank">https://u=
rldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZ=
VfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$</a>&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A02 files changed, 31 insertion=
s(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-support/libevent/libevent/0001-test-ma=
rk-util-monotonic_prc_fallback-as-retriable.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-support/libevent/libevent/0001-test-=
mark-util-monotonic_prc_fallback-as-retriable.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/libevent/libevent/0001-test-=
mark-util-monotonic_prc_fallback-as-retriable.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; index 0000000000..754c446a67<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/libevent/libevent/0001-test-=
mark-util-monotonic_prc_fallback-as-retriable.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; @@ -0,0 +1,30 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +From 8fc3fb57ac1b1b0f338506cb86e3adac29d=
684d7 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +From: Azat Khuzhin &lt;<a href=3D"mailto=
:azat@libevent.org" target=3D"_blank">azat@libevent.org</a> &lt;mailto:<a h=
ref=3D"mailto:azat@libevent.org" target=3D"_blank">azat@libevent.org</a>&gt=
;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +Date: Wed, 22 Sep 2021 15:14:01 +0800<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +Subject: [PATCH] test: mark util/monoton=
ic_prc_fallback as<br>
&gt;=C2=A0 =C2=A0 =C2=A0retriable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +Refs: #1193<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +Upstream-Status: Backport<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://github.com/libevent/libevent/co=
mmit/04fcd7c6df158bb65261867de4b9ec8439696934" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/libevent/libevent/commit/04fcd7c6df158bb6526186=
7de4b9ec8439696934</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec843969693=
4__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTg=
ZhJv4-tI38$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3=
/__https://github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9=
ec8439696934__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whm=
oaFuYLbnuTgZhJv4-tI38$</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +Signed-off-by: Mingli Yu &lt;<a href=3D"=
mailto:mingli.yu@windriver.com" target=3D"_blank">mingli.yu@windriver.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mingli.yu@windriver.co=
m" target=3D"_blank">mingli.yu@windriver.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; + test/regress_util.c | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; + 1 file changed, 1 insertion(+), 1 delet=
ion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +diff --git a/test/regress_util.c b/test/=
regress_util.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +index 45caa27..a9e80db 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +--- a/test/regress_util.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ++++ b/test/regress_util.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +@@ -1672,7 +1672,7 @@ struct testcase_t =
util_testcases[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_re=
s_fallback&quot;, test_evutil_monotonic_res,<br>
&gt;=C2=A0 =C2=A0 =C2=A0TT_OFF_BY_DEFAULT, &amp;basic_setup, (void*)&quot;f=
allback&quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_pr=
c&quot;, test_evutil_monotonic_prc, 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&amp;basic_setup, (void*)&quot;&quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_pr=
c_precise&quot;, test_evutil_monotonic_prc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0TT_RETRIABLE, &amp;basic_setup, (void*)&quot;precis=
e&quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +-=C2=A0 =C2=A0 { &quot;monotonic_prc_fal=
lback&quot;, test_evutil_monotonic_prc, 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&amp;basic_setup, (void*)&quot;fallback&quot; },<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ++=C2=A0 =C2=A0 { &quot;monotonic_prc_fal=
lback&quot;, test_evutil_monotonic_prc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0TT_RETRIABLE, &amp;basic_setup, (void*)&quot;fallba=
ck&quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;date_rfc1123=
&quot;, test_evutil_date_rfc1123, 0, NULL, NULL },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;evutil_v4add=
r_is_local&quot;, test_evutil_v4addr_is_local,<br>
&gt;=C2=A0 =C2=A0 =C2=A00, NULL, NULL },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;evutil_v6add=
r_is_local&quot;, test_evutil_v6addr_is_local,<br>
&gt;=C2=A0 =C2=A0 =C2=A00, NULL, NULL },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +2.17.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; diff --git a/meta/recipes-support/libeven=
t/<a href=3D"http://libevent_2.1.12.bb" rel=3D"noreferrer" target=3D"_blank=
">libevent_2.1.12.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://l=
ibevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSi=
Z0whmoaFuYLbnuTgZhJYova8kU$" rel=3D"noreferrer" target=3D"_blank">https://u=
rldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZ=
VfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/libevent/<a href=3D"http://l=
ibevent_2.1.12.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://l=
ibevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSi=
Z0whmoaFuYLbnuTgZhJYova8kU$" rel=3D"noreferrer" target=3D"_blank">https://u=
rldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZ=
VfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; index 4b419eab22..3f29c0cffe 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; --- a/meta/recipes-support/libevent/<a hr=
ef=3D"http://libevent_2.1.12.bb" rel=3D"noreferrer" target=3D"_blank">libev=
ent_2.1.12.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://l=
ibevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSi=
Z0whmoaFuYLbnuTgZhJYova8kU$" rel=3D"noreferrer" target=3D"_blank">https://u=
rldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZ=
VfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +++ b/meta/recipes-support/libevent/<a hr=
ef=3D"http://libevent_2.1.12.bb" rel=3D"noreferrer" target=3D"_blank">libev=
ent_2.1.12.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http://l=
ibevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSi=
Z0whmoaFuYLbnuTgZhJYova8kU$" rel=3D"noreferrer" target=3D"_blank">https://u=
rldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZ=
VfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; @@ -16,6 +16,7 @@ SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://github.com/libevent/libeve=
nt/releases/download/release-$%7BPV%7D-" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/libevent/libevent/releases/download/release-${PV}-</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
github.com/libevent/libevent/releases/download/release-$*7BPV*7D-__;JSU!!Aj=
veYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJfM99j=
EA$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https=
://github.com/libevent/libevent/releases/download/release-$*7BPV*7D-__;JSU!=
!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJfM=
99jEA$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-test-regress_dns.c-patch-out-tests-that=
-require-a-wo.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0002-test-regress.h-Increase-default-timeval=
-tolerance-50.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-mark-util-monotonic_prc_fal=
lback-as-retriable.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;92e6de1be9ec176428fd2367677e61ceffc2ee1cb1190=
35037a27d346b0403bb&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 2.32.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Alexandre Belloni, co-owner and COO, Bootlin<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Embedded Linux and Kernel engineering<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://bootlin.com" rel=3D"norefe=
rrer" target=3D"_blank">https://bootlin.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
bootlin.com__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmo=
aFuYLbnuTgZhJbAyvLVM$" rel=3D"noreferrer" target=3D"_blank">https://urldefe=
nse.com/v3/__https://bootlin.com__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-=
LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJbAyvLVM$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#156410):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/156410" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/156410</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
lists.openembedded.org/g/openembedded-core/message/156410__;!!AjveYdw8EvQ!O=
V1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJo1e94_Q$" rel=3D=
"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https://lists.op=
enembedded.org/g/openembedded-core/message/156410__;!!AjveYdw8EvQ!OV1jBmLZj=
nKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJo1e94_Q$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/85785430/1686489" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/mt/85785430/1686489</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
lists.openembedded.org/mt/85785430/1686489__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVf=
asjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJaGuez1c$" rel=3D"noreferrer" ta=
rget=3D"_blank">https://urldefense.com/v3/__https://lists.openembedded.org/=
mt/85785430/1686489__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3D=
SiZ0whmoaFuYLbnuTgZhJaGuez1c$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-core%2B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__https://=
lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!OV1jBmLZjn=
KzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJUWLo-40$" rel=3D"noreferr=
er" target=3D"_blank">https://urldefense.com/v3/__https://lists.openembedde=
d.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-L=
zB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJUWLo-40$</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.ka=
navin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--000000000000007d9c05cd1d2764--


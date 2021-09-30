Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EACCC433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 14:30:03 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web10.13430.1633012201875827470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 07:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g3gWiSM6;
 spf=pass (domain: gmail.com, ip: 209.85.217.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id l19so7554981vst.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J4GI3jamPQuIJbcfNsi+jZ6WUpLExuyf3dswltsPH78=;
        b=g3gWiSM6x5MaHMID6RDJYrgJC1AosyqPsSik8SaZ47iZWbELA9rhDwbh41RRgaNBzi
         Rx9Iqd474i3AU3P64QL9GaH0gj3xVPr9yCU+F+q+itFav3whkwu86cWypePjZFa3TQ4t
         tvT7Jh7bR8chnxBVSbSRGm5yZ9/bECyd8HdzPBmionhPT9amJIM6Mq6mrIlEaFpoEQ46
         FpQ3vsSEhr5ahZWsJoAFQyXUOIpqXH1UaXeSmSGl1b9n/6IzwuEkWDMOXrCRGldKU/OY
         VDp8FcjLFc9ceLF8kMIFOwaYsj+Ec8Ly7/16MBvjK1mCM3fLV/3ww0lSNvC9QadCNSVo
         m72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J4GI3jamPQuIJbcfNsi+jZ6WUpLExuyf3dswltsPH78=;
        b=lZNdz1CJaHCZIRfx8eWyQdK3qRXcbq/M1/NPGw0oST8jQal/3MzRhj+6cSf0Fb+F+s
         bYUbpaSNTc6H8O2iqjenR0qvwkwrXxgJbCncXdMWp4pHq9mwbyaMPfDO6IWtx38p35Gq
         9bUBGjYLY014l0J/lDH8HU/88fzR9Yn1RISm+pem8HO+J8J2+N20+yjANxR/iuYVkNZi
         4vsgNlKzp7hE2WVv8oihjLkc/d4Ay1bHtcnJFMC9Ck3twBTKvrnq5c/Ru6zsi60ZVmjh
         Zwdq/7ifBkkZdpQDCit+EB37lJMiN3qeuxKg3A6YDwD0RCkcmJtcD3VIPGyn+0oa0AvR
         wD4g==
X-Gm-Message-State: AOAM532uOmzdPqtsXBw5WkfDOhyw/GkG+fjGW5FetUNGUNNL8VIb5VFN
	T57h7ni2sIEdt+V+6fYSf1T2A1dgAmzjWin/UcSbEnM4
X-Google-Smtp-Source: 
 ABdhPJz/jEGfk03OuCOgXr4uNRir6ykynower8M24tyCANV0jfOBd6/x9ljMpYdtgyeXPzWmuyNiybUf+rwUVnKcsTY=
X-Received: by 2002:a05:6102:21ce:: with SMTP id
 r14mr4163109vsg.40.1633012200887;
 Thu, 30 Sep 2021 07:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210930140801.557763-1-thomas.perrot@bootlin.com>
 <CANNYZj8wSt=Qrqz=n+UUy8zk-gZ7iVzqnBrE4PoRZdkGxoRHQQ@mail.gmail.com>
 <d6fd6fe0f044523209b2e89a1d3d5f8b31b5a35c.camel@bootlin.com>
In-Reply-To: <d6fd6fe0f044523209b2e89a1d3d5f8b31b5a35c.camel@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Sep 2021 16:29:49 +0200
Message-ID: 
 <CANNYZj_99ChPmn+ogGwQ4xrmDog9DCfEh1HXBgLpGzLZeY7uPQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4] libevent: mark util/monotonic_prc_fallback as
 retriable
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, "Yu,
 Mingli" <mingli.yu@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000025d90005cd37489b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 14:30:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156504

--00000000000025d90005cd37489b
Content-Type: text/plain; charset="UTF-8"

Neither the syntax was fixed, nor the other patch was submitted upstream.

Alex

On Thu, 30 Sept 2021 at 16:21, Thomas Perrot <thomas.perrot@bootlin.com>
wrote:

> Hello,
>
> On Thu, 2021-09-30 at 16:11 +0200, Alexander Kanavin wrote:
> > How is this different to the previous patch submission?
> >
>
> I have indicated where patch 0003 comes from in the upstream status.
>
> Was there any other change to make?
>
> Best regards,
> Thomas
>
> > Alex
> >
> > On Thu, 30 Sept 2021 at 16:08, Thomas Perrot <
> > thomas.perrot@bootlin.com> wrote:
> > > Backport a patch to fix the below ptest failure:
> > >  # ./run-ptest
> > >  Running tests:
> > >  EVPORT
> > >  Skipping test
> > >  KQUEUE
> > >  Skipping test
> > >  EPOLL
> > >  test-eof: OKAY
> > >  test-dumpevents: OKAY (output not checked)
> > >  regress:
> > >   FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> > > assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
> > >   [monotonic_prc_fallback FAILED]
> > >  1/312 TESTS FAILED. (33 skipped)
> > >  FAILED
> > >  regress_debug:
> > >   FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> > > assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
> > >   [monotonic_prc_fallback FAILED]
> > >  1/312 TESTS FAILED. (33 skipped)
> > >  FAILED
> > >  [snip]
> > >
> > > (From OE-Core rev: edecbbdacab5227c75e4a199e124389f8036b421)
> > >
> > > [YOCTO #14507]
> > >
> > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > ---
> > >  ...-monotonic_prc_fallback-as-retriable.patch | 28 +++++++
> > >  ...ts-are-marked-failed-only-when-all-a.patch | 81
> > > +++++++++++++++++++
> > >  .../libevent/libevent/run-ptest               | 10 +--
> > >  .../libevent/libevent_2.1.12.bb               |  4 +-
> > >  4 files changed, 117 insertions(+), 6 deletions(-)
> > >  create mode 100644 meta/recipes-support/libevent/libevent/0003-test-
> > > mark-util-monotonic_prc_fallback-as-retriable.patch
> > >  create mode 100644 meta/recipes-support/libevent/libevent/0004-test-
> > > retriable-tests-are-marked-failed-only-when-all-a.patch
> > >
> > > diff --git a/meta/recipes-support/libevent/libevent/0003-test-mark-
> > > util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-
> > > support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-
> > > as-retriable.patch
> > > new file mode 100644
> > > index 000000000000..ea322511d7e9
> > > --- /dev/null
> > > +++ b/meta/recipes-support/libevent/libevent/0003-test-mark-util-
> > > monotonic_prc_fallback-as-retriable.patch
> > > @@ -0,0 +1,28 @@
> > > +From 5a9a5faf27d85c89b40fb610cd23a4b62a7dbf0e Mon Sep 17 00:00:00
> > > 2001
> > > +From: Azat Khuzhin <azat@libevent.org>
> > > +Date: Sun, 19 Sep 2021 00:57:31 +0300
> > > +Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable
> > > +
> > > +Refs: #1193
> > > +
> > > +Upstream-status: Backported
> > > [
> > >
> https://github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696934
> > > ]
> > > +---
> > > + test/regress_util.c | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/test/regress_util.c b/test/regress_util.c
> > > +index 45caa2700a40..a9e80db20149 100644
> > > +--- a/test/regress_util.c
> > > ++++ b/test/regress_util.c
> > > +@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] = {
> > > +       { "monotonic_res_fallback", test_evutil_monotonic_res,
> > > TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
> > > +       { "monotonic_prc", test_evutil_monotonic_prc, 0,
> > > &basic_setup, (void*)"" },
> > > +       { "monotonic_prc_precise", test_evutil_monotonic_prc,
> > > TT_RETRIABLE, &basic_setup, (void*)"precise" },
> > > +-      { "monotonic_prc_fallback", test_evutil_monotonic_prc, 0,
> > > &basic_setup, (void*)"fallback" },
> > > ++      { "monotonic_prc_fallback", test_evutil_monotonic_prc,
> > > TT_RETRIABLE, &basic_setup, (void*)"fallback" },
> > > +       { "date_rfc1123", test_evutil_date_rfc1123, 0, NULL, NULL },
> > > +       { "evutil_v4addr_is_local", test_evutil_v4addr_is_local, 0,
> > > NULL, NULL },
> > > +       { "evutil_v6addr_is_local", test_evutil_v6addr_is_local, 0,
> > > NULL, NULL },
> > > +--
> > > +2.31.1
> > > +
> > > diff --git a/meta/recipes-support/libevent/libevent/0004-test-
> > > retriable-tests-are-marked-failed-only-when-all-a.patch
> > > b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-
> > > are-marked-failed-only-when-all-a.patch
> > > new file mode 100644
> > > index 000000000000..ae7db0b7aa85
> > > --- /dev/null
> > > +++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-
> > > tests-are-marked-failed-only-when-all-a.patch
> > > @@ -0,0 +1,81 @@
> > > +From 36ebd92fa53c0097f1e2f9ec5aa5b5c6ec1b411d Mon Sep 17 00:00:00
> > > 2001
> > > +From: Thomas Perrot <thomas.perrot@bootlin.com>
> > > +Date: Wed, 29 Sep 2021 13:50:35 +0200
> > > +Subject: [PATCH] test: retriable tests are marked failed only when
> > > all
> > > + attempts have failed
> > > +
> > > +Fixes: #1193
> > > +
> > > +Upstream-status: Pending
> > > +
> > > +Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > +---
> > > + test/tinytest.c | 13 ++++++-------
> > > + test/tinytest.h |  2 +-
> > > + 2 files changed, 7 insertions(+), 8 deletions(-)
> > > +
> > > +diff --git a/test/tinytest.c b/test/tinytest.c
> > > +index 85dfe74a720e..bf2882418eb6 100644
> > > +--- a/test/tinytest.c
> > > ++++ b/test/tinytest.c
> > > +@@ -310,7 +310,8 @@ testcase_run_forked_(const struct testgroup_t
> > > *group,
> > > +
> > > + int
> > > + testcase_run_one(const struct testgroup_t *group,
> > > +-               const struct testcase_t *testcase)
> > > ++               const struct testcase_t *testcase,
> > > ++               const int test_attempts)
> > > + {
> > > +       enum outcome outcome;
> > > +
> > > +@@ -348,7 +349,7 @@ testcase_run_one(const struct testgroup_t
> > > *group,
> > > +               if (opt_verbosity>0 && !opt_forked)
> > > +                       puts("SKIPPED");
> > > +       } else {
> > > +-              if (!opt_forked)
> > > ++              if (!opt_forked && (testcase->flags & TT_RETRIABLE)
> > > && !test_attempts)
> > > +                       printf("\n  [%s FAILED]\n", testcase->name);
> > > +       }
> > > +
> > > +@@ -525,22 +526,20 @@ tinytest_main(int c, const char **v, struct
> > > testgroup_t *groups)
> > > +               struct testgroup_t *group = &groups[i];
> > > +               for (j = 0; group->cases[j].name; ++j) {
> > > +                       struct testcase_t *testcase = &group-
> > > > cases[j];
> > > +-                      int test_attempts = 3;
> > > ++                      int test_attempts = (testcase->flags &
> > > TT_RETRIABLE) ? 3: 1;
> > > +                       int test_ret_err;
> > > +
> > > +                       if (!(testcase->flags & TT_ENABLED_))
> > > +                               continue;
> > > +
> > > +                       for (;;) {
> > > +-                              test_ret_err =
> > > testcase_run_one(group, testcase);
> > > ++                              test_ret_err =
> > > testcase_run_one(group, testcase, test_attempts);
> > > +
> > > +                               if (test_ret_err == OK)
> > > +                                       break;
> > > +-                              if (!(testcase->flags &
> > > TT_RETRIABLE))
> > > ++                              if (!--test_attempts)
> > > +                                       break;
> > > +                               printf("\n  [RETRYING %s (%i)]\n",
> > > testcase->name, test_attempts);
> > > +-                              if (!test_attempts--)
> > > +-                                      break;
> > > +                       }
> > > +
> > > +                       switch (test_ret_err) {
> > > +diff --git a/test/tinytest.h b/test/tinytest.h
> > > +index d321dd467542..c276b5339331 100644
> > > +--- a/test/tinytest.h
> > > ++++ b/test/tinytest.h
> > > +@@ -92,7 +92,7 @@ char *tinytest_format_hex_(const void *, unsigned
> > > long);
> > > +       tinytest_set_flag_(groups, named, 1, TT_SKIP)
> > > +
> > > + /** Run a single testcase in a single group. */
> > > +-int testcase_run_one(const struct testgroup_t *,const struct
> > > testcase_t *);
> > > ++int testcase_run_one(const struct testgroup_t *,const struct
> > > testcase_t *, const int test_attempts);
> > > +
> > > + void tinytest_set_aliases(const struct testlist_alias_t *aliases);
> > > +
> > > +--
> > > +2.31.1
> > > +
> > > diff --git a/meta/recipes-support/libevent/libevent/run-ptest
> > > b/meta/recipes-support/libevent/libevent/run-ptest
> > > index d3b5e793c3c5..ef4260d1c413 100644
> > > --- a/meta/recipes-support/libevent/libevent/run-ptest
> > > +++ b/meta/recipes-support/libevent/libevent/run-ptest
> > > @@ -1,14 +1,14 @@
> > >  #!/bin/sh
> > >
> > >  # run-ptest - 'ptest' test infrastructure shell script that
> > > -#   wraps the libevent test scripts
> > > +#   wraps the libevent test scripts
> > >  #
> > >  # Trevor Gamblin <trevor.gamblin@windriver.com>
> > >  ###############################################################
> > >  LIBEVENTLIB=@libdir@/libevent
> > >  LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
> > >
> > > -cd ${LIBEVENTLIB}/ptest
> > > +cd ${LIBEVENTLIB}/ptest
> > >
> > >  # Run only the libevent "regress" test. All other test scripts in
> > > the
> > >  # libevent "test" folder are related to performance, e.g. read/write
> > > @@ -16,9 +16,9 @@ cd ${LIBEVENTLIB}/ptest
> > >  # in the ptest log.
> > >  ./test/regress 2>&1| sed -e '/TESTS/d' -e '/tests/d' -e '/OK/
> > > s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ;
> > > /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
> > >
> > > -passed=`grep PASS ${LOG}|wc -l`
> > > -failed=`grep FAIL ${LOG}|wc -l`
> > > -skipped=`grep -E SKIP ${LOG}|wc -l`
> > > +passed=`grep PASS: ${LOG}|wc -l`
> > > +failed=`grep FAIL: ${LOG}|wc -l`
> > > +skipped=`grep -E SKIP: ${LOG}|wc -l`
> > >  all=$((passed + failed + skipped))
> > >
> > >  (   echo "=== Test Summary ==="
> > > diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb
> > > b/meta/recipes-support/libevent/libevent_2.1.12.bb
> > > index 4b419eab226d..e26e8a9b5725 100644
> > > --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
> > > +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
> > > @@ -16,6 +16,8 @@ SRC_URI =
> > > "
> > > https://github.com/libevent/libevent/releases/download/release-${PV}-
> > >             file://run-ptest \
> > >             file://0001-test-regress_dns.c-patch-out-tests-that-
> > > require-a-wo.patch \
> > >             file://0002-test-regress.h-Increase-default-timeval-
> > > tolerance-50.patch \
> > > +           file://0003-test-mark-util-monotonic_prc_fallback-as-
> > > retriable.patch \
> > > +           file://0004-test-retriable-tests-are-marked-failed-only-
> > > when-all-a.patch \
> > >             "
> > >
> > >  SRC_URI[sha256sum] =
> > > "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
> > > @@ -56,7 +58,7 @@ do_install_ptest() {
> > >         do
> > >                 install -m 0755 $file ${D}${PTEST_PATH}/test
> > >         done
> > > -
> > > +
> > >          # handle multilib
> > >          sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
> > >  }
>
> --
> Thomas Perrot, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>
>

--00000000000025d90005cd37489b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Neither the syntax was fixed, nor the other patch was=
 submitted upstream.</div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 30 Sept=
 2021 at 16:21, Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.c=
om">thomas.perrot@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hello,<br>
<br>
On Thu, 2021-09-30 at 16:11 +0200, Alexander Kanavin wrote:<br>
&gt; How is this different to the previous patch submission?<br>
&gt; <br>
<br>
I have indicated where patch 0003 comes from in the upstream status.<br>
<br>
Was there any other change to make?<br>
<br>
Best regards,<br>
Thomas<br>
<br>
&gt; Alex<br>
&gt; <br>
&gt; On Thu, 30 Sept 2021 at 16:08, Thomas Perrot &lt;<br>
&gt; <a href=3D"mailto:thomas.perrot@bootlin.com" target=3D"_blank">thomas.=
perrot@bootlin.com</a>&gt; wrote:<br>
&gt; &gt; Backport a patch to fix the below ptest failure:<br>
&gt; &gt; =C2=A0# ./run-ptest<br>
&gt; &gt; =C2=A0Running tests:<br>
&gt; &gt; =C2=A0EVPORT<br>
&gt; &gt; =C2=A0Skipping test<br>
&gt; &gt; =C2=A0KQUEUE<br>
&gt; &gt; =C2=A0Skipping test<br>
&gt; &gt; =C2=A0EPOLL<br>
&gt; &gt; =C2=A0test-eof: OKAY<br>
&gt; &gt; =C2=A0test-dumpevents: OKAY (output not checked)<br>
&gt; &gt; =C2=A0regress:<br>
&gt; &gt; =C2=A0 FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:<b=
r>
&gt; &gt; assert(diff.tv_sec =3D=3D 0): 1 vs 0 util/monotonic_prc_fallback:=
<br>
&gt; &gt; =C2=A0 [monotonic_prc_fallback FAILED]<br>
&gt; &gt; =C2=A01/312 TESTS FAILED. (33 skipped)<br>
&gt; &gt; =C2=A0FAILED<br>
&gt; &gt; =C2=A0regress_debug:<br>
&gt; &gt; =C2=A0 FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:<b=
r>
&gt; &gt; assert(diff.tv_sec =3D=3D 0): 1 vs 0 util/monotonic_prc_fallback:=
<br>
&gt; &gt; =C2=A0 [monotonic_prc_fallback FAILED]<br>
&gt; &gt; =C2=A01/312 TESTS FAILED. (33 skipped)<br>
&gt; &gt; =C2=A0FAILED<br>
&gt; &gt; =C2=A0[snip]<br>
&gt; &gt; <br>
&gt; &gt; (From OE-Core rev: edecbbdacab5227c75e4a199e124389f8036b421)<br>
&gt; &gt; <br>
&gt; &gt; [YOCTO #14507]<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windrive=
r.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.=
belloni@bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt=
;<br>
&gt; &gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@=
bootlin.com" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0...-monotonic_prc_fallback-as-retriable.patch | 28 +++++++<=
br>
&gt; &gt; =C2=A0...ts-are-marked-failed-only-when-all-a.patch | 81<br>
&gt; &gt; +++++++++++++++++++<br>
&gt; &gt; =C2=A0.../libevent/libevent/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +--<br>
&gt; &gt; =C2=A0.../libevent/<a href=3D"http://libevent_2.1.12.bb" rel=3D"n=
oreferrer" target=3D"_blank">libevent_2.1.12.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt; &gt; =C2=A04 files changed, 117 insertions(+), 6 deletions(-)<br>
&gt; &gt; =C2=A0create mode 100644 meta/recipes-support/libevent/libevent/0=
003-test-<br>
&gt; &gt; mark-util-monotonic_prc_fallback-as-retriable.patch<br>
&gt; &gt; =C2=A0create mode 100644 meta/recipes-support/libevent/libevent/0=
004-test-<br>
&gt; &gt; retriable-tests-are-marked-failed-only-when-all-a.patch<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-support/libevent/libevent/0003-test-mar=
k-<br>
&gt; &gt; util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-<br=
>
&gt; &gt; support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallb=
ack-<br>
&gt; &gt; as-retriable.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..ea322511d7e9<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-support/libevent/libevent/0003-test-mark-util-=
<br>
&gt; &gt; monotonic_prc_fallback-as-retriable.patch<br>
&gt; &gt; @@ -0,0 +1,28 @@<br>
&gt; &gt; +From 5a9a5faf27d85c89b40fb610cd23a4b62a7dbf0e Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From: Azat Khuzhin &lt;<a href=3D"mailto:azat@libevent.org" targ=
et=3D"_blank">azat@libevent.org</a>&gt;<br>
&gt; &gt; +Date: Sun, 19 Sep 2021 00:57:31 +0300<br>
&gt; &gt; +Subject: [PATCH] test: mark util/monotonic_prc_fallback as retri=
able<br>
&gt; &gt; +<br>
&gt; &gt; +Refs: #1193<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-status: Backported<br>
&gt; &gt; [<br>
&gt; &gt; <a href=3D"https://github.com/libevent/libevent/commit/04fcd7c6df=
158bb65261867de4b9ec8439696934" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/libevent/libevent/commit/04fcd7c6df158bb65261867de4b9ec8439696=
934</a><br>
&gt; &gt; ]<br>
&gt; &gt; +---<br>
&gt; &gt; + test/regress_util.c | 2 +-<br>
&gt; &gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/test/regress_util.c b/test/regress_util.c<br>
&gt; &gt; +index 45caa2700a40..a9e80db20149 100644<br>
&gt; &gt; +--- a/test/regress_util.c<br>
&gt; &gt; ++++ b/test/regress_util.c<br>
&gt; &gt; +@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] =3D {<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_res_fallback&quot;,=
 test_evutil_monotonic_res,<br>
&gt; &gt; TT_OFF_BY_DEFAULT, &amp;basic_setup, (void*)&quot;fallback&quot; =
},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_prc&quot;, test_evu=
til_monotonic_prc, 0,<br>
&gt; &gt; &amp;basic_setup, (void*)&quot;&quot; },<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_prc_precise&quot;, =
test_evutil_monotonic_prc,<br>
&gt; &gt; TT_RETRIABLE, &amp;basic_setup, (void*)&quot;precise&quot; },<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 { &quot;monotonic_prc_fallback&quot;, test=
_evutil_monotonic_prc, 0,<br>
&gt; &gt; &amp;basic_setup, (void*)&quot;fallback&quot; },<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 { &quot;monotonic_prc_fallback&quot;, test=
_evutil_monotonic_prc,<br>
&gt; &gt; TT_RETRIABLE, &amp;basic_setup, (void*)&quot;fallback&quot; },<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;date_rfc1123&quot;, test_evut=
il_date_rfc1123, 0, NULL, NULL },<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;evutil_v4addr_is_local&quot;,=
 test_evutil_v4addr_is_local, 0,<br>
&gt; &gt; NULL, NULL },<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;evutil_v6addr_is_local&quot;,=
 test_evutil_v6addr_is_local, 0,<br>
&gt; &gt; NULL, NULL },<br>
&gt; &gt; +-- <br>
&gt; &gt; +2.31.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-support/libevent/libevent/0004-test-<br=
>
&gt; &gt; retriable-tests-are-marked-failed-only-when-all-a.patch<br>
&gt; &gt; b/meta/recipes-support/libevent/libevent/0004-test-retriable-test=
s-<br>
&gt; &gt; are-marked-failed-only-when-all-a.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..ae7db0b7aa85<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-=
<br>
&gt; &gt; tests-are-marked-failed-only-when-all-a.patch<br>
&gt; &gt; @@ -0,0 +1,81 @@<br>
&gt; &gt; +From 36ebd92fa53c0097f1e2f9ec5aa5b5c6ec1b411d Mon Sep 17 00:00:0=
0<br>
&gt; &gt; 2001<br>
&gt; &gt; +From: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.=
com" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
&gt; &gt; +Date: Wed, 29 Sep 2021 13:50:35 +0200<br>
&gt; &gt; +Subject: [PATCH] test: retriable tests are marked failed only wh=
en<br>
&gt; &gt; all<br>
&gt; &gt; + attempts have failed<br>
&gt; &gt; +<br>
&gt; &gt; +Fixes: #1193<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-status: Pending<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot=
@bootlin.com" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + test/tinytest.c | 13 ++++++-------<br>
&gt; &gt; + test/tinytest.h |=C2=A0 2 +-<br>
&gt; &gt; + 2 files changed, 7 insertions(+), 8 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/test/tinytest.c b/test/tinytest.c<br>
&gt; &gt; +index 85dfe74a720e..bf2882418eb6 100644<br>
&gt; &gt; +--- a/test/tinytest.c<br>
&gt; &gt; ++++ b/test/tinytest.c<br>
&gt; &gt; +@@ -310,7 +310,8 @@ testcase_run_forked_(const struct testgroup_=
t<br>
&gt; &gt; *group,<br>
&gt; &gt; + <br>
&gt; &gt; + int<br>
&gt; &gt; + testcase_run_one(const struct testgroup_t *group,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const st=
ruct testcase_t *testcase)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const st=
ruct testcase_t *testcase,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const in=
t test_attempts)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0enum outcome outcome;<br>
&gt; &gt; + <br>
&gt; &gt; +@@ -348,7 +349,7 @@ testcase_run_one(const struct testgroup_t<br=
>
&gt; &gt; *group,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (opt_v=
erbosity&gt;0 &amp;&amp; !opt_forked)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0puts(&quot;SKIPPED&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!opt_forke=
d)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!opt_forke=
d &amp;&amp; (testcase-&gt;flags &amp; TT_RETRIABLE)<br>
&gt; &gt; &amp;&amp; !test_attempts)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0printf(&quot;\n=C2=A0 [%s FAILED]\n&quot;, testcase-&gt=
;name);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; + <br>
&gt; &gt; +@@ -525,22 +526,20 @@ tinytest_main(int c, const char **v, struc=
t<br>
&gt; &gt; testgroup_t *groups)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct te=
stgroup_t *group =3D &amp;groups[i];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =
=3D 0; group-&gt;cases[j].name; ++j) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0struct testcase_t *testcase =3D &amp;group-<br>
&gt; &gt; &gt; cases[j];<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int test_attempts =3D 3;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int test_attempts =3D (testcase-&gt;flags &amp;<br>
&gt; &gt; TT_RETRIABLE) ? 3: 1;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0int test_ret_err;<br>
&gt; &gt; + <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (!(testcase-&gt;flags &amp; TT_ENABLED_))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; &gt; + <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0for (;;) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_ret_err =3D<br>
&gt; &gt; testcase_run_one(group, testcase);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_ret_err =3D<br>
&gt; &gt; testcase_run_one(group, testcase, test_attempts);<br>
&gt; &gt; + <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test_ret_err =3D=3D OK)=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(testcase-&gt;flags &amp;<br=
>
&gt; &gt; TT_RETRIABLE))<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!--test_attempts)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;\n=C2=A0 [RETR=
YING %s (%i)]\n&quot;,<br>
&gt; &gt; testcase-&gt;name, test_attempts);<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!test_attempts--)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break=
;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; + <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0switch (test_ret_err) {<br>
&gt; &gt; +diff --git a/test/tinytest.h b/test/tinytest.h<br>
&gt; &gt; +index d321dd467542..c276b5339331 100644<br>
&gt; &gt; +--- a/test/tinytest.h<br>
&gt; &gt; ++++ b/test/tinytest.h<br>
&gt; &gt; +@@ -92,7 +92,7 @@ char *tinytest_format_hex_(const void *, unsig=
ned<br>
&gt; &gt; long);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tinytest_set_flag_(groups, named, 1, =
TT_SKIP)<br>
&gt; &gt; + <br>
&gt; &gt; + /** Run a single testcase in a single group. */<br>
&gt; &gt; +-int testcase_run_one(const struct testgroup_t *,const struct<br=
>
&gt; &gt; testcase_t *);<br>
&gt; &gt; ++int testcase_run_one(const struct testgroup_t *,const struct<br=
>
&gt; &gt; testcase_t *, const int test_attempts);<br>
&gt; &gt; + <br>
&gt; &gt; + void tinytest_set_aliases(const struct testlist_alias_t *aliase=
s);<br>
&gt; &gt; + <br>
&gt; &gt; +-- <br>
&gt; &gt; +2.31.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-support/libevent/libevent/run-ptest<br>
&gt; &gt; b/meta/recipes-support/libevent/libevent/run-ptest<br>
&gt; &gt; index d3b5e793c3c5..ef4260d1c413 100644<br>
&gt; &gt; --- a/meta/recipes-support/libevent/libevent/run-ptest<br>
&gt; &gt; +++ b/meta/recipes-support/libevent/libevent/run-ptest<br>
&gt; &gt; @@ -1,14 +1,14 @@<br>
&gt; &gt; =C2=A0#!/bin/sh<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0# run-ptest - &#39;ptest&#39; test infrastructure shell scr=
ipt that<br>
&gt; &gt; -#=C2=A0 =C2=A0wraps the libevent test scripts <br>
&gt; &gt; +#=C2=A0 =C2=A0wraps the libevent test scripts<br>
&gt; &gt; =C2=A0#<br>
&gt; &gt; =C2=A0# Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windr=
iver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt; &gt; =C2=A0###########################################################=
####<br>
&gt; &gt; =C2=A0LIBEVENTLIB=3D@libdir@/libevent<br>
&gt; &gt; =C2=A0LOG=3D&quot;${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%=
m%d-%H%M%S).log&quot;<br>
&gt; &gt; <br>
&gt; &gt; -cd ${LIBEVENTLIB}/ptest <br>
&gt; &gt; +cd ${LIBEVENTLIB}/ptest<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0# Run only the libevent &quot;regress&quot; test. All other=
 test scripts in<br>
&gt; &gt; the<br>
&gt; &gt; =C2=A0# libevent &quot;test&quot; folder are related to performan=
ce, e.g. read/write<br>
&gt; &gt; @@ -16,9 +16,9 @@ cd ${LIBEVENTLIB}/ptest<br>
&gt; &gt; =C2=A0# in the ptest log.<br>
&gt; &gt; =C2=A0./test/regress 2&gt;&amp;1| sed -e &#39;/TESTS/d&#39; -e &#=
39;/tests/d&#39; -e &#39;/OK/<br>
&gt; &gt; s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ;<br>
&gt; &gt; /DISABLED/ s/^/SKIP: /&#39; | cut -f1,2 -d &#39;:&#39; | tee -a $=
{LOG}<br>
&gt; &gt; <br>
&gt; &gt; -passed=3D`grep PASS ${LOG}|wc -l`<br>
&gt; &gt; -failed=3D`grep FAIL ${LOG}|wc -l`<br>
&gt; &gt; -skipped=3D`grep -E SKIP ${LOG}|wc -l`<br>
&gt; &gt; +passed=3D`grep PASS: ${LOG}|wc -l`<br>
&gt; &gt; +failed=3D`grep FAIL: ${LOG}|wc -l`<br>
&gt; &gt; +skipped=3D`grep -E SKIP: ${LOG}|wc -l`<br>
&gt; &gt; =C2=A0all=3D$((passed + failed + skipped))<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0(=C2=A0 =C2=A0echo &quot;=3D=3D=3D Test Summary =3D=3D=3D&q=
uot;<br>
&gt; &gt; diff --git a/meta/recipes-support/libevent/<a href=3D"http://libe=
vent_2.1.12.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a>=
<br>
&gt; &gt; b/meta/recipes-support/libevent/<a href=3D"http://libevent_2.1.12=
.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a><br>
&gt; &gt; index 4b419eab226d..e26e8a9b5725 100644<br>
&gt; &gt; --- a/meta/recipes-support/libevent/<a href=3D"http://libevent_2.=
1.12.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a><br>
&gt; &gt; +++ b/meta/recipes-support/libevent/<a href=3D"http://libevent_2.=
1.12.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a><br>
&gt; &gt; @@ -16,6 +16,8 @@ SRC_URI =3D<br>
&gt; &gt; &quot;<br>
&gt; &gt; <a href=3D"https://github.com/libevent/libevent/releases/download=
/release-$%7BPV%7D-" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/libevent/libevent/releases/download/release-${PV}-</a><br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test-regres=
s_dns.c-patch-out-tests-that-<br>
&gt; &gt; require-a-wo.patch \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-test-regres=
s.h-Increase-default-timeval-<br>
&gt; &gt; tolerance-50.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-test-mark-u=
til-monotonic_prc_fallback-as-<br>
&gt; &gt; retriable.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-test-retria=
ble-tests-are-marked-failed-only-<br>
&gt; &gt; when-all-a.patch \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0SRC_URI[sha256sum] =3D<br>
&gt; &gt; &quot;92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0=
403bb&quot;<br>
&gt; &gt; @@ -56,7 +58,7 @@ do_install_ptest() {<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 do<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -=
m 0755 $file ${D}${PTEST_PATH}/test<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt; +<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# handle multilib<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i s:@libdir@:${libdir}:g $=
{D}${PTEST_PATH}/run-ptest<br>
&gt; &gt; =C2=A0}<br>
<br>
-- <br>
Thomas Perrot, Bootlin<br>
Embedded Linux and kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--00000000000025d90005cd37489b--


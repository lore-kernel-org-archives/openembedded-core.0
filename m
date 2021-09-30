Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFDBC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 08:50:34 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.9824.1632991833006336282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 01:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nmH7DCau;
 spf=pass (domain: gmail.com, ip: 209.85.217.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id p9so919699vst.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 01:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XdSnANIeM+4kKMvzzNRrADNoeoFVyKZeC07MIc4UNBY=;
        b=nmH7DCauc0eu6Y2Z7a2z6Ex+zo+jqdcNftu92yYdTYoUxMJEG4dmLx0J4o6V7krWQi
         aYR3EQO+zqcOeUXfLhZ7ZgKKS97Sa+MoREaSMowp7tqwodQ5eDfp9fzb43LGu4Ot1AnL
         l6RKsOLcZThGpEgUw0oGQm8FdnbDy63pwvwKYdBChBqfmB1tUU8YvzFN3TKQLZb6jGHo
         hYUZHN4+lepNzYCWRWtarCsYH1q6ZQC56t6qIoEs6M/1Jw69+kqjjDOk8LTzfhRgNkyr
         YcrMpLsz5JYp9SvAIJqCPkTa4dRfB6AXk7OpwdzTsdwUqFlU25a79YjgLZ5oXrKaVpnx
         H9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XdSnANIeM+4kKMvzzNRrADNoeoFVyKZeC07MIc4UNBY=;
        b=tXXNO7pzCMpkMvEK9gB0mzXXwrq8fYPwAokarGUaLYo4rlCtaP83vADt7KESZEs4h2
         BSqc8+60If5JJMczh0L8mXC+f70Fg8+VpcTJqCOp3qzY9Fc03gTCMxiFvfE5JJ1gNrt5
         dMFPX/v1+QUZ856Ku2K3asdUgp6Y/9c9GsZwukJmTNzH9xny95zD6cGa5MBxtfBPVBdK
         doy0mWGP9iFvByHGyddKfL58ey2Eh8HAlaUNukg8B8gBYtLn1NdnNBR+G9n0Bnkqx/rJ
         zZ9u1oWHP2mder9tq+GeLolxAEwJZyMyQMOFXDI+BynpiECSdm/9IhPHltYlvdhYREH1
         v9ow==
X-Gm-Message-State: AOAM533vznDYwjZpybd/krPJCdJ1kGmIa0n3ODSxQoKA8Z0iTQh+bjs2
	GAwkAwTYXy61FPyoOPpQ29IfXYMyxJP2HAHph+k=
X-Google-Smtp-Source: 
 ABdhPJzFo1BA0cpiMyKWB1SZJp2o7Mj8uW82ZaV0rsZXjUPZQVOk83ugizpFfbdRez+YUpePmaPQDNsPmCXxV6CCeTA=
X-Received: by 2002:a05:6102:21ce:: with SMTP id
 r14mr2683113vsg.40.1632991831986;
 Thu, 30 Sep 2021 01:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210929150204.3573031-1-thomas.perrot@bootlin.com>
In-Reply-To: <20210929150204.3573031-1-thomas.perrot@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Sep 2021 10:50:20 +0200
Message-ID: 
 <CANNYZj_PKN51p1-ovmt17WwJZd2oUtxeWWNBzYPZbGY1XmiyFg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] libevent: mark util/monotonic_prc_fallback as
 retriable
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, "Yu,
 Mingli" <mingli.yu@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000111d7f05cd328a31"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 08:50:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156488

--000000000000111d7f05cd328a31
Content-Type: text/plain; charset="UTF-8"

Please submit the patch upstream first. Also note the syntax:

Upstream-Status: Pending
Upstream-Status: Backport [from where]

Alex

On Wed, 29 Sept 2021 at 17:02, Thomas Perrot <thomas.perrot@bootlin.com>
wrote:

> Backport a patch to fix the below ptest failure:
>  # ./run-ptest
>  Running tests:
>  EVPORT
>  Skipping test
>  KQUEUE
>  Skipping test
>  EPOLL
>  test-eof: OKAY
>  test-dumpevents: OKAY (output not checked)
>  regress:
>   FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
>   [monotonic_prc_fallback FAILED]
>  1/312 TESTS FAILED. (33 skipped)
>  FAILED
>  regress_debug:
>   FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> assert(diff.tv_sec == 0): 1 vs 0 util/monotonic_prc_fallback:
>   [monotonic_prc_fallback FAILED]
>  1/312 TESTS FAILED. (33 skipped)
>  FAILED
>  [snip]
>
> (From OE-Core rev: edecbbdacab5227c75e4a199e124389f8036b421)
>
> [YOCTO #14507]
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  ...-monotonic_prc_fallback-as-retriable.patch | 28 +++++++
>  ...ts-are-marked-failed-only-when-all-a.patch | 81 +++++++++++++++++++
>  .../libevent/libevent/run-ptest               | 10 +--
>  .../libevent/libevent_2.1.12.bb               |  4 +-
>  4 files changed, 117 insertions(+), 6 deletions(-)
>  create mode 100644
> meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
>  create mode 100644
> meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
>
> diff --git
> a/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> new file mode 100644
> index 000000000000..8a2c78983e1d
> --- /dev/null
> +++
> b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch
> @@ -0,0 +1,28 @@
> +From d01a57a998798da977c470f3b8d6a457c1adb144 Mon Sep 17 00:00:00 2001
> +From: Azat Khuzhin <azat@libevent.org>
> +Date: Sun, 19 Sep 2021 00:57:31 +0300
> +Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable
> +
> +Refs: #1193
> +
> +Upstream-status: Backported
> +---
> + test/regress_util.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/test/regress_util.c b/test/regress_util.c
> +index 45caa2700a40..a9e80db20149 100644
> +--- a/test/regress_util.c
> ++++ b/test/regress_util.c
> +@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] = {
> +       { "monotonic_res_fallback", test_evutil_monotonic_res,
> TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
> +       { "monotonic_prc", test_evutil_monotonic_prc, 0, &basic_setup,
> (void*)"" },
> +       { "monotonic_prc_precise", test_evutil_monotonic_prc,
> TT_RETRIABLE, &basic_setup, (void*)"precise" },
> +-      { "monotonic_prc_fallback", test_evutil_monotonic_prc, 0,
> &basic_setup, (void*)"fallback" },
> ++      { "monotonic_prc_fallback", test_evutil_monotonic_prc,
> TT_RETRIABLE, &basic_setup, (void*)"fallback" },
> +       { "date_rfc1123", test_evutil_date_rfc1123, 0, NULL, NULL },
> +       { "evutil_v4addr_is_local", test_evutil_v4addr_is_local, 0, NULL,
> NULL },
> +       { "evutil_v6addr_is_local", test_evutil_v6addr_is_local, 0, NULL,
> NULL },
> +--
> +2.31.1
> +
> diff --git
> a/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
> b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
> new file mode 100644
> index 000000000000..ae7db0b7aa85
> --- /dev/null
> +++
> b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch
> @@ -0,0 +1,81 @@
> +From 36ebd92fa53c0097f1e2f9ec5aa5b5c6ec1b411d Mon Sep 17 00:00:00 2001
> +From: Thomas Perrot <thomas.perrot@bootlin.com>
> +Date: Wed, 29 Sep 2021 13:50:35 +0200
> +Subject: [PATCH] test: retriable tests are marked failed only when all
> + attempts have failed
> +
> +Fixes: #1193
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> +---
> + test/tinytest.c | 13 ++++++-------
> + test/tinytest.h |  2 +-
> + 2 files changed, 7 insertions(+), 8 deletions(-)
> +
> +diff --git a/test/tinytest.c b/test/tinytest.c
> +index 85dfe74a720e..bf2882418eb6 100644
> +--- a/test/tinytest.c
> ++++ b/test/tinytest.c
> +@@ -310,7 +310,8 @@ testcase_run_forked_(const struct testgroup_t *group,
> +
> + int
> + testcase_run_one(const struct testgroup_t *group,
> +-               const struct testcase_t *testcase)
> ++               const struct testcase_t *testcase,
> ++               const int test_attempts)
> + {
> +       enum outcome outcome;
> +
> +@@ -348,7 +349,7 @@ testcase_run_one(const struct testgroup_t *group,
> +               if (opt_verbosity>0 && !opt_forked)
> +                       puts("SKIPPED");
> +       } else {
> +-              if (!opt_forked)
> ++              if (!opt_forked && (testcase->flags & TT_RETRIABLE) &&
> !test_attempts)
> +                       printf("\n  [%s FAILED]\n", testcase->name);
> +       }
> +
> +@@ -525,22 +526,20 @@ tinytest_main(int c, const char **v, struct
> testgroup_t *groups)
> +               struct testgroup_t *group = &groups[i];
> +               for (j = 0; group->cases[j].name; ++j) {
> +                       struct testcase_t *testcase = &group->cases[j];
> +-                      int test_attempts = 3;
> ++                      int test_attempts = (testcase->flags &
> TT_RETRIABLE) ? 3: 1;
> +                       int test_ret_err;
> +
> +                       if (!(testcase->flags & TT_ENABLED_))
> +                               continue;
> +
> +                       for (;;) {
> +-                              test_ret_err = testcase_run_one(group,
> testcase);
> ++                              test_ret_err = testcase_run_one(group,
> testcase, test_attempts);
> +
> +                               if (test_ret_err == OK)
> +                                       break;
> +-                              if (!(testcase->flags & TT_RETRIABLE))
> ++                              if (!--test_attempts)
> +                                       break;
> +                               printf("\n  [RETRYING %s (%i)]\n",
> testcase->name, test_attempts);
> +-                              if (!test_attempts--)
> +-                                      break;
> +                       }
> +
> +                       switch (test_ret_err) {
> +diff --git a/test/tinytest.h b/test/tinytest.h
> +index d321dd467542..c276b5339331 100644
> +--- a/test/tinytest.h
> ++++ b/test/tinytest.h
> +@@ -92,7 +92,7 @@ char *tinytest_format_hex_(const void *, unsigned long);
> +       tinytest_set_flag_(groups, named, 1, TT_SKIP)
> +
> + /** Run a single testcase in a single group. */
> +-int testcase_run_one(const struct testgroup_t *,const struct testcase_t
> *);
> ++int testcase_run_one(const struct testgroup_t *,const struct testcase_t
> *, const int test_attempts);
> +
> + void tinytest_set_aliases(const struct testlist_alias_t *aliases);
> +
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-support/libevent/libevent/run-ptest
> b/meta/recipes-support/libevent/libevent/run-ptest
> index d3b5e793c3c5..ef4260d1c413 100644
> --- a/meta/recipes-support/libevent/libevent/run-ptest
> +++ b/meta/recipes-support/libevent/libevent/run-ptest
> @@ -1,14 +1,14 @@
>  #!/bin/sh
>
>  # run-ptest - 'ptest' test infrastructure shell script that
> -#   wraps the libevent test scripts
> +#   wraps the libevent test scripts
>  #
>  # Trevor Gamblin <trevor.gamblin@windriver.com>
>  ###############################################################
>  LIBEVENTLIB=@libdir@/libevent
>  LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
>
> -cd ${LIBEVENTLIB}/ptest
> +cd ${LIBEVENTLIB}/ptest
>
>  # Run only the libevent "regress" test. All other test scripts in the
>  # libevent "test" folder are related to performance, e.g. read/write
> @@ -16,9 +16,9 @@ cd ${LIBEVENTLIB}/ptest
>  # in the ptest log.
>  ./test/regress 2>&1| sed -e '/TESTS/d' -e '/tests/d' -e '/OK/ s/^/PASS: /
> ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ; /DISABLED/ s/^/SKIP: /' |
> cut -f1,2 -d ':' | tee -a ${LOG}
>
> -passed=`grep PASS ${LOG}|wc -l`
> -failed=`grep FAIL ${LOG}|wc -l`
> -skipped=`grep -E SKIP ${LOG}|wc -l`
> +passed=`grep PASS: ${LOG}|wc -l`
> +failed=`grep FAIL: ${LOG}|wc -l`
> +skipped=`grep -E SKIP: ${LOG}|wc -l`
>  all=$((passed + failed + skipped))
>
>  (   echo "=== Test Summary ==="
> diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb
> b/meta/recipes-support/libevent/libevent_2.1.12.bb
> index 4b419eab226d..e26e8a9b5725 100644
> --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
> +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
> @@ -16,6 +16,8 @@ SRC_URI = "
> https://github.com/libevent/libevent/releases/download/release-${PV}-
>             file://run-ptest \
>
> file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
>
> file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch \
> +
>  file://0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch \
> +
>  file://0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
> @@ -56,7 +58,7 @@ do_install_ptest() {
>         do
>                 install -m 0755 $file ${D}${PTEST_PATH}/test
>         done
> -
> +
>          # handle multilib
>          sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
>  }
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156468):
> https://lists.openembedded.org/g/openembedded-core/message/156468
> Mute This Topic: https://lists.openembedded.org/mt/85950365/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000111d7f05cd328a31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please submit the patch upstream first. Also note the=
 syntax:</div><div><br></div><div>Upstream-Status: Pending</div><div>Upstre=
am-Status: Backport [from where]</div><div><br></div><div>Alex<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, 29 Sept 2021 at 17:02, Thomas Perrot &lt;<a href=3D"mailto:thomas.perr=
ot@bootlin.com">thomas.perrot@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Backport a patch to fix the below =
ptest failure:<br>
=C2=A0# ./run-ptest<br>
=C2=A0Running tests:<br>
=C2=A0EVPORT<br>
=C2=A0Skipping test<br>
=C2=A0KQUEUE<br>
=C2=A0Skipping test<br>
=C2=A0EPOLL<br>
=C2=A0test-eof: OKAY<br>
=C2=A0test-dumpevents: OKAY (output not checked)<br>
=C2=A0regress:<br>
=C2=A0 FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: assert(diff=
.tv_sec =3D=3D 0): 1 vs 0 util/monotonic_prc_fallback:<br>
=C2=A0 [monotonic_prc_fallback FAILED]<br>
=C2=A01/312 TESTS FAILED. (33 skipped)<br>
=C2=A0FAILED<br>
=C2=A0regress_debug:<br>
=C2=A0 FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478: assert(diff=
.tv_sec =3D=3D 0): 1 vs 0 util/monotonic_prc_fallback:<br>
=C2=A0 [monotonic_prc_fallback FAILED]<br>
=C2=A01/312 TESTS FAILED. (33 skipped)<br>
=C2=A0FAILED<br>
=C2=A0[snip]<br>
<br>
(From OE-Core rev: edecbbdacab5227c75e4a199e124389f8036b421)<br>
<br>
[YOCTO #14507]<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bo=
otlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.co=
m" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
---<br>
=C2=A0...-monotonic_prc_fallback-as-retriable.patch | 28 +++++++<br>
=C2=A0...ts-are-marked-failed-only-when-all-a.patch | 81 ++++++++++++++++++=
+<br>
=C2=A0.../libevent/libevent/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 10 +--<br>
=C2=A0.../libevent/<a href=3D"http://libevent_2.1.12.bb" rel=3D"noreferrer"=
 target=3D"_blank">libevent_2.1.12.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A04 files changed, 117 insertions(+), 6 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/libevent/libevent/0003-test-m=
ark-util-monotonic_prc_fallback-as-retriable.patch<br>
=C2=A0create mode 100644 meta/recipes-support/libevent/libevent/0004-test-r=
etriable-tests-are-marked-failed-only-when-all-a.patch<br>
<br>
diff --git a/meta/recipes-support/libevent/libevent/0003-test-mark-util-mon=
otonic_prc_fallback-as-retriable.patch b/meta/recipes-support/libevent/libe=
vent/0003-test-mark-util-monotonic_prc_fallback-as-retriable.patch<br>
new file mode 100644<br>
index 000000000000..8a2c78983e1d<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libevent/libevent/0003-test-mark-util-monotonic_=
prc_fallback-as-retriable.patch<br>
@@ -0,0 +1,28 @@<br>
+From d01a57a998798da977c470f3b8d6a457c1adb144 Mon Sep 17 00:00:00 2001<br>
+From: Azat Khuzhin &lt;<a href=3D"mailto:azat@libevent.org" target=3D"_bla=
nk">azat@libevent.org</a>&gt;<br>
+Date: Sun, 19 Sep 2021 00:57:31 +0300<br>
+Subject: [PATCH] test: mark util/monotonic_prc_fallback as retriable<br>
+<br>
+Refs: #1193<br>
+<br>
+Upstream-status: Backported<br>
+---<br>
+ test/regress_util.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/test/regress_util.c b/test/regress_util.c<br>
+index 45caa2700a40..a9e80db20149 100644<br>
+--- a/test/regress_util.c<br>
++++ b/test/regress_util.c<br>
+@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_res_fallback&quot;, test_evut=
il_monotonic_res, TT_OFF_BY_DEFAULT, &amp;basic_setup, (void*)&quot;fallbac=
k&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_prc&quot;, test_evutil_monoto=
nic_prc, 0, &amp;basic_setup, (void*)&quot;&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;monotonic_prc_precise&quot;, test_evuti=
l_monotonic_prc, TT_RETRIABLE, &amp;basic_setup, (void*)&quot;precise&quot;=
 },<br>
+-=C2=A0 =C2=A0 =C2=A0 { &quot;monotonic_prc_fallback&quot;, test_evutil_mo=
notonic_prc, 0, &amp;basic_setup, (void*)&quot;fallback&quot; },<br>
++=C2=A0 =C2=A0 =C2=A0 { &quot;monotonic_prc_fallback&quot;, test_evutil_mo=
notonic_prc, TT_RETRIABLE, &amp;basic_setup, (void*)&quot;fallback&quot; },=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;date_rfc1123&quot;, test_evutil_date_rf=
c1123, 0, NULL, NULL },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;evutil_v4addr_is_local&quot;, test_evut=
il_v4addr_is_local, 0, NULL, NULL },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;evutil_v6addr_is_local&quot;, test_evut=
il_v6addr_is_local, 0, NULL, NULL },<br>
+-- <br>
+2.31.1<br>
+<br>
diff --git a/meta/recipes-support/libevent/libevent/0004-test-retriable-tes=
ts-are-marked-failed-only-when-all-a.patch b/meta/recipes-support/libevent/=
libevent/0004-test-retriable-tests-are-marked-failed-only-when-all-a.patch<=
br>
new file mode 100644<br>
index 000000000000..ae7db0b7aa85<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-are-=
marked-failed-only-when-all-a.patch<br>
@@ -0,0 +1,81 @@<br>
+From 36ebd92fa53c0097f1e2f9ec5aa5b5c6ec1b411d Mon Sep 17 00:00:00 2001<br>
+From: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.com" targe=
t=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
+Date: Wed, 29 Sep 2021 13:50:35 +0200<br>
+Subject: [PATCH] test: retriable tests are marked failed only when all<br>
+ attempts have failed<br>
+<br>
+Fixes: #1193<br>
+<br>
+Upstream-status: Pending<br>
+<br>
+Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.c=
om" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
+---<br>
+ test/tinytest.c | 13 ++++++-------<br>
+ test/tinytest.h |=C2=A0 2 +-<br>
+ 2 files changed, 7 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/test/tinytest.c b/test/tinytest.c<br>
+index 85dfe74a720e..bf2882418eb6 100644<br>
+--- a/test/tinytest.c<br>
++++ b/test/tinytest.c<br>
+@@ -310,7 +310,8 @@ testcase_run_forked_(const struct testgroup_t *group,<=
br>
+ <br>
+ int<br>
+ testcase_run_one(const struct testgroup_t *group,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct testc=
ase_t *testcase)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct testc=
ase_t *testcase,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const int test_att=
empts)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum outcome outcome;<br>
+ <br>
+@@ -348,7 +349,7 @@ testcase_run_one(const struct testgroup_t *group,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (opt_verbosity&g=
t;0 &amp;&amp; !opt_forked)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0puts(&quot;SKIPPED&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!opt_forked)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!opt_forked &amp;&am=
p; (testcase-&gt;flags &amp; TT_RETRIABLE) &amp;&amp; !test_attempts)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(&quot;\n=C2=A0 [%s FAILED]\n&quot;, testcase-&gt;name);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+@@ -525,22 +526,20 @@ tinytest_main(int c, const char **v, struct testgrou=
p_t *groups)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct testgroup_t =
*group =3D &amp;groups[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; group=
-&gt;cases[j].name; ++j) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0struct testcase_t *testcase =3D &amp;group-&gt;cases[j];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int test_attempts =3D 3;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int test_attempts =3D (testcase-&gt;flags &amp; TT_RETRIABLE) ? 3: 1;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int test_ret_err;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!(testcase-&gt;flags &amp; TT_ENABLED_))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0for (;;) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_ret_err =3D testcase_run_one(group, te=
stcase);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_ret_err =3D testcase_run_one(group, te=
stcase, test_attempts);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test_ret_err =3D=3D OK)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(testcase-&gt;flags &amp; TT_RETRIABLE=
))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!--test_attempts)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;\n=C2=A0 [RETRYING %s (%=
i)]\n&quot;, testcase-&gt;name, test_attempts);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!test_attempts--)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0switch (test_ret_err) {<br>
+diff --git a/test/tinytest.h b/test/tinytest.h<br>
+index d321dd467542..c276b5339331 100644<br>
+--- a/test/tinytest.h<br>
++++ b/test/tinytest.h<br>
+@@ -92,7 +92,7 @@ char *tinytest_format_hex_(const void *, unsigned long);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tinytest_set_flag_(groups, named, 1, TT_SKIP)<b=
r>
+ <br>
+ /** Run a single testcase in a single group. */<br>
+-int testcase_run_one(const struct testgroup_t *,const struct testcase_t *=
);<br>
++int testcase_run_one(const struct testgroup_t *,const struct testcase_t *=
, const int test_attempts);<br>
+ <br>
+ void tinytest_set_aliases(const struct testlist_alias_t *aliases);<br>
+ <br>
+-- <br>
+2.31.1<br>
+<br>
diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipe=
s-support/libevent/libevent/run-ptest<br>
index d3b5e793c3c5..ef4260d1c413 100644<br>
--- a/meta/recipes-support/libevent/libevent/run-ptest<br>
+++ b/meta/recipes-support/libevent/libevent/run-ptest<br>
@@ -1,14 +1,14 @@<br>
=C2=A0#!/bin/sh<br>
<br>
=C2=A0# run-ptest - &#39;ptest&#39; test infrastructure shell script that<b=
r>
-#=C2=A0 =C2=A0wraps the libevent test scripts <br>
+#=C2=A0 =C2=A0wraps the libevent test scripts<br>
=C2=A0#<br>
=C2=A0# Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" =
target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
=C2=A0###############################################################<br>
=C2=A0LIBEVENTLIB=3D@libdir@/libevent<br>
=C2=A0LOG=3D&quot;${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S=
).log&quot;<br>
<br>
-cd ${LIBEVENTLIB}/ptest <br>
+cd ${LIBEVENTLIB}/ptest<br>
<br>
=C2=A0# Run only the libevent &quot;regress&quot; test. All other test scri=
pts in the<br>
=C2=A0# libevent &quot;test&quot; folder are related to performance, e.g. r=
ead/write<br>
@@ -16,9 +16,9 @@ cd ${LIBEVENTLIB}/ptest<br>
=C2=A0# in the ptest log.<br>
=C2=A0./test/regress 2&gt;&amp;1| sed -e &#39;/TESTS/d&#39; -e &#39;/tests/=
d&#39; -e &#39;/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP=
: / ; /DISABLED/ s/^/SKIP: /&#39; | cut -f1,2 -d &#39;:&#39; | tee -a ${LOG=
}<br>
<br>
-passed=3D`grep PASS ${LOG}|wc -l`<br>
-failed=3D`grep FAIL ${LOG}|wc -l`<br>
-skipped=3D`grep -E SKIP ${LOG}|wc -l`<br>
+passed=3D`grep PASS: ${LOG}|wc -l`<br>
+failed=3D`grep FAIL: ${LOG}|wc -l`<br>
+skipped=3D`grep -E SKIP: ${LOG}|wc -l`<br>
=C2=A0all=3D$((passed + failed + skipped))<br>
<br>
=C2=A0(=C2=A0 =C2=A0echo &quot;=3D=3D=3D Test Summary =3D=3D=3D&quot;<br>
diff --git a/meta/recipes-support/libevent/<a href=3D"http://libevent_2.1.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a> b/meta/re=
cipes-support/libevent/<a href=3D"http://libevent_2.1.12.bb" rel=3D"norefer=
rer" target=3D"_blank">libevent_2.1.12.bb</a><br>
index 4b419eab226d..e26e8a9b5725 100644<br>
--- a/meta/recipes-support/libevent/<a href=3D"http://libevent_2.1.12.bb" r=
el=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a><br>
+++ b/meta/recipes-support/libevent/<a href=3D"http://libevent_2.1.12.bb" r=
el=3D"noreferrer" target=3D"_blank">libevent_2.1.12.bb</a><br>
@@ -16,6 +16,8 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/libevent/=
libevent/releases/download/release-$%7BPV%7D-" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/libevent/libevent/releases/download/release-${P=
V}-</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test-regress_dns.c-pa=
tch-out-tests-that-require-a-wo.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-test-regress.h-Increa=
se-default-timeval-tolerance-50.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-test-mark-util-monoto=
nic_prc_fallback-as-retriable.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-test-retriable-tests-=
are-marked-failed-only-when-all-a.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;92e6de1be9ec176428fd2367677e61ceffc2ee1c=
b119035037a27d346b0403bb&quot;<br>
@@ -56,7 +58,7 @@ do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 $fi=
le ${D}${PTEST_PATH}/test<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# handle multilib<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i s:@libdir@:${libdir}:g ${D}${PTEST=
_PATH}/run-ptest<br>
=C2=A0}<br>
-- <br>
2.31.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156468): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156468" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156468</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85950365/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85950365/1686489</a><br>
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

--000000000000111d7f05cd328a31--


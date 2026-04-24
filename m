Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93375FED3CD
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 13:48:29 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23217.1777038506275682302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 06:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FxF+Spsh;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso107656345e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 06:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777038505; x=1777643305; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFdV+ERAG9OC25BK0Cc7CP0hHQz6tMeQeK04AQsvUy8=;
        b=FxF+SpshATsclGVrvQu834yUmRRJ1tcyXZlJdOaZEPTzzwVpUycH4rj1EcaLOmqUh7
         1wjjrxfdWK+LMvQuhUdLlraR0D1QytJBnKbK4NSaIYFR050KTg2vCz+PX7CxFuI07UB+
         cdeLvZCVjPkCRe9AeiHx9Bb321I27HlGn0ZoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038505; x=1777643305;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFdV+ERAG9OC25BK0Cc7CP0hHQz6tMeQeK04AQsvUy8=;
        b=m3jtdo8vahTWNOFRVxHrfr/QJUvBfVq49ftI6LCNTaYPkLQuwB0SxrgviUOl+41ICq
         7C8JYlGXHhzyux7wfj0XeDNQ2BvFwRE2WOFBDY2RF//U9jJVauKWUqLMeg7f2AD0+qQH
         RQ8SkXhplW0eUPi0d18GsPahFRy3oURxndsPKZN6kkLeKTqMBu4uipVAucGsCgzrrAle
         w913XSzML5uYMuXvgYwUugudOR3r6tznwgfm4lTimw8RKqfTkMpD3ZbowTTPvgUWYrwO
         qhWlYr8TG0EcQLVIJLCKUyCoj0j//fICTY5aL5YOUw96KmBM84diJQD4Zn9r2v5jU74r
         6JEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JZEHbOVQooOPPwVIaAqcZQPsh2pIFtCgXWIsD4jbQse7cVd7sHpjNDYBEYgWHgSDPKnVJMXpkVrIh8QE+9BuZ5w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbOqViKHxonoOlbYlu52tmLPqO3L2D3qr8Vn8+i3Uu1mgFiyAt
	uq14gwZj+pJ/F062SCzr2b1pXkxnxN5I0JnBEFdz9RAI224OvJSrHd7uq6bPo4x/Sno=
X-Gm-Gg: AeBDieuOskb+omgMYPVdkihNDw3fZfh4aiyVU2CeBsL35M25Ut3X7Hdr5EMd2VPYTP9
	Ty7umDEglHcDe/r0YYX8683hGRArpOojJl/6zYzUxguRKAehzXiftgh2ikcQzUz2IK318ufAse7
	sIKR3UXlOiqh3HNT9EZmJtIQ29FKC8k2arhUFFyk/u12PKKUIz2Q6LmuSBC3maJavC3HO540FQD
	LLtF8jx19iHrvawtkJmFX86duOiO00GJm8HsD70+2trsLoqSGSCXTvP+2rcc0+1EqRWKIZZsR9e
	YZvO3+fz6hrc9y6zymHH6rjLjB1/jl10gfjGDPS8yU73+vMHFBdAhplxMX13hZb09g/MRKNcmik
	oVXsfISPLs0cx686waUIAHG9uTnncCSr686ejUDEFL1XEZf09GIL0c/Z3VsQlikUDMVocQdLoIc
	Ae/5eleF0rDUoTwOKhfl8zpjWphq/huHIu/926N804rt2cr0UYpKH73bU9G5bKlFOkEl+DPVeGQ
	/nKMBM2zxZIYSfr15BTMiAhhg==
X-Received: by 2002:a05:600c:8b64:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-48a56dedb1emr212951685e9.11.1777038504486;
        Fri, 24 Apr 2026 06:48:24 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a66533ff4sm16322705e9.6.2026.04.24.06.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:48:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 15:48:23 +0200
Message-Id: <DI1FKQHNI51Y.2E23SAXR2AI4D@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 4/9] bash: upgrade 5.2.21 -> 5.2.37
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
 <20260409092936.1740143-5-daniel.turull@ericsson.com>
In-Reply-To: <20260409092936.1740143-5-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235862

On Thu Apr 9, 2026 at 11:29 AM CEST, Daniel Turull via lists.openembedded.o=
rg wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---

Sorry, I can't blindly upgrade.
Do you know where I can find the changelog 5.2.21 -> 5.2.37 ?
Did you check that there was no breaking change in this upgade?

Thanks!

>  ...T-handler-while-waiting-for-a-child-.patch | 21 ++++++++-----------
>  .../bash/bash/0001-fix-c99.patch              | 20 +++---------------
>  .../bash/bash/build-tests.patch               |  7 +++----
>  .../bash/bash/fix-filesubst-errexit.patch     |  7 ++-----
>  .../bash/bash/fix-run-builtins.patch          |  9 +++-----
>  .../bash/bash/mkbuiltins_have_stringize.patch | 18 ++++++++++++----
>  .../bash/bash/test-output.patch               | 11 ++++------
>  .../bash/bash/use_aclocal.patch               |  5 ++---
>  .../bash/{bash_5.2.21.bb =3D> bash_5.2.37.bb}   |  2 +-
>  9 files changed, 41 insertions(+), 59 deletions(-)
>  rename meta/recipes-extended/bash/{bash_5.2.21.bb =3D> bash_5.2.37.bb} (=
92%)
>
> diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handl=
er-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-=
changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
> index 77d770b364..fae56ce2f2 100644
> --- a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-whil=
e-waiting-for-a-child-.patch
> +++ b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-whil=
e-waiting-for-a-child-.patch
> @@ -1,4 +1,4 @@
> -From 721d5be99eb37d31e48bd66d61808a66a4c5ab84 Mon Sep 17 00:00:00 2001
> +From 37f1f4ea73a737c23b239cc9e8b09587ccf61963 Mon Sep 17 00:00:00 2001
>  From: Chet Ramey <chet.ramey@case.edu>
>  Date: Mon, 30 Oct 2023 12:16:07 -0400
>  Subject: [PATCH] changes to SIGINT handler while waiting for a child; sk=
ip
> @@ -20,10 +20,10 @@ Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.c=
om>
>   6 files changed, 43 insertions(+), 32 deletions(-)
> =20
>  diff --git a/general.c b/general.c
> -index 85c5a8b6..65e2ee06 100644
> +index bda39f4..94a5339 100644
>  --- a/general.c
>  +++ b/general.c
> -@@ -262,8 +262,9 @@ legal_number (string, result)
> +@@ -264,8 +264,9 @@ legal_number (string, result)
>     if (errno || ep =3D=3D string)
>       return 0;	/* errno is set on overflow or underflow */
>  =20
> @@ -36,7 +36,7 @@ index 85c5a8b6..65e2ee06 100644
>  =20
>     /* If *string is not '\0' but *ep is '\0' on return, the entire strin=
g
>  diff --git a/jobs.c b/jobs.c
> -index 6b986ed7..262d78de 100644
> +index d3e4ab0..903cf9c 100644
>  --- a/jobs.c
>  +++ b/jobs.c
>  @@ -2718,6 +2718,10 @@ wait_for_background_pids (ps)
> @@ -96,7 +96,7 @@ index 6b986ed7..262d78de 100644
>         waiting_for_child =3D 0;
>         if (old_sigint_handler =3D=3D SIG_IGN)
>   	set_signal_handler (SIGINT, old_sigint_handler);
> -@@ -4136,7 +4144,7 @@ set_job_status_and_cleanup (job)
> +@@ -4141,7 +4149,7 @@ set_job_status_and_cleanup (job)
>   		 SIGINT (if we reset the sighandler to the default).
>   		 In this case, we have to fix things up.  What a crock. */
>   	      if (temp_handler =3D=3D trap_handler && signal_is_trapped (SIGIN=
T) =3D=3D 0)
> @@ -106,7 +106,7 @@ index 6b986ed7..262d78de 100644
>   	      if (temp_handler =3D=3D SIG_DFL)
>   		termsig_handler (SIGINT);	/* XXX */
>  diff --git a/tests/redir.right b/tests/redir.right
> -index 8db10414..9e1403c8 100644
> +index 8db1041..9e1403c 100644
>  --- a/tests/redir.right
>  +++ b/tests/redir.right
>  @@ -154,10 +154,10 @@ foo
> @@ -123,7 +123,7 @@ index 8db10414..9e1403c8 100644
>  +./redir11.sub: line 77: 42: No such file or directory
>   42
>  diff --git a/tests/redir11.sub b/tests/redir11.sub
> -index d417cdb6..ca9854cd 100644
> +index d417cdb..ca9854c 100644
>  --- a/tests/redir11.sub
>  +++ b/tests/redir11.sub
>  @@ -34,6 +34,8 @@ a=3D4 b=3D7 ss=3D4 declare -i ss
> @@ -136,7 +136,7 @@ index d417cdb6..ca9854cd 100644
>   a=3D4 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 ba=
d 3'; }
>   a=3D1 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 ba=
d 4'; }
>  diff --git a/tests/type.right b/tests/type.right
> -index bbc228e8..e0a66745 100644
> +index bbc228e..c0c1c8b 100644
>  --- a/tests/type.right
>  +++ b/tests/type.right
>  @@ -24,15 +24,15 @@ func ()
> @@ -164,7 +164,7 @@ index bbc228e8..e0a66745 100644
>   builtin is a shell builtin
>   /bin/sh
>  diff --git a/tests/type.tests b/tests/type.tests
> -index fd39c18a..ddc15407 100644
> +index fd39c18..ddc1540 100644
>  --- a/tests/type.tests
>  +++ b/tests/type.tests
>  @@ -25,8 +25,6 @@ type -r ${THIS_SH}
> @@ -221,6 +221,3 @@ index fd39c18a..ddc15407 100644
>   type m
>  =20
>   hash -r
> ---=20
> -2.35.5
> -
> diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/re=
cipes-extended/bash/bash/0001-fix-c99.patch
> index aa810f7d4e..e210e988a4 100644
> --- a/meta/recipes-extended/bash/bash/0001-fix-c99.patch
> +++ b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
> @@ -1,4 +1,4 @@
> -From e9ed388e760ec33dcf9e72c639946c0d0abeec26 Mon Sep 17 00:00:00 2001
> +From 055a7560ef7301ff4c76a5ff2de277633ced0c28 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
>  Date: Wed, 19 Jun 2024 12:57:39 +0000
>  Subject: [PATCH] Fix C99 problems
> @@ -8,9 +8,8 @@ Backport some fixes from upstream to fix configure checks=
 that fail with GCC 14.
>  Upstream-Status: Backport [devel branch]
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
>  ---
> - aclocal.m4   | 3 +++
> - configure.ac | 2 +-
> - 2 files changed, 4 insertions(+), 1 deletion(-)
> + aclocal.m4 | 3 +++
> + 1 file changed, 3 insertions(+)
> =20
>  diff --git a/aclocal.m4 b/aclocal.m4
>  index cc97bd4..7423b99 100644
> @@ -26,16 +25,3 @@ index cc97bd4..7423b99 100644
>   int
>   main()
>   {
> -diff --git a/configure.ac b/configure.ac
> -index a3b5bd7..2a38c6b 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -842,7 +842,7 @@ AC_CHECK_DECLS([strtold], [
> - 	[AC_COMPILE_IFELSE(
> - 		[AC_LANG_PROGRAM(
> - 		[[#include <stdlib.h>]],
> --		[[long double r; char *foo, bar; r =3D strtold(foo, &bar);]]
> -+		[[long double r; char *foo, *bar; r =3D strtold(foo, &bar);]]
> - 	)],
> - 	[bash_cv_strtold_broken=3Dno],[bash_cv_strtold_broken=3Dyes])
> -         ]
> diff --git a/meta/recipes-extended/bash/bash/build-tests.patch b/meta/rec=
ipes-extended/bash/bash/build-tests.patch
> index c1b9b8261f..bb0f11ceab 100644
> --- a/meta/recipes-extended/bash/bash/build-tests.patch
> +++ b/meta/recipes-extended/bash/bash/build-tests.patch
> @@ -1,4 +1,4 @@
> -From 318b762837c2ad25319caeaf0320eff613b64daf Mon Sep 17 00:00:00 2001
> +From 920861d8018cdad96f49b320f6f4eb49ae606738 Mon Sep 17 00:00:00 2001
>  From: Anders Roxell <anders.roxell@enea.com>
>  Date: Wed, 19 Dec 2012 17:18:31 +0100
>  Subject: [PATCH] Add 'ptest' target to Makefile, to run tests without ch=
ecking
> @@ -9,16 +9,15 @@ Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> =20
>  Rebase to 5.0
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
>  ---
>   Makefile.in | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> =20
>  diff --git a/Makefile.in b/Makefile.in
> -index bc97049..937ce39 100644
> +index 0b4df73..7e2a34e 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -943,20 +943,34 @@ maybe-clean:
> +@@ -958,20 +958,34 @@ maybe-clean:
>   	fi
>  =20
>   recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
> diff --git a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch =
b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
> index 60f1852316..f80ae37656 100644
> --- a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
> +++ b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
> @@ -1,4 +1,4 @@
> -From 59ddfda14e3c9aa6286bb4c4c0748f7c1324a65a Mon Sep 17 00:00:00 2001
> +From 157de966e6b8a11bf75beab60776fafe757687f1 Mon Sep 17 00:00:00 2001
>  From: Chet Ramey <chet.ramey@case.edu>
>  Date: Fri, 7 Apr 2023 00:28:46 -0700
>  Subject: [PATCH] $(<nosuchfile) is no longer a fatal error with errexit
> @@ -17,7 +17,7 @@ Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/builtins/evalstring.c b/builtins/evalstring.c
> -index df3dd68e2a7e..6612081cd646 100644
> +index 53a7c0b..c5075cc 100644
>  --- a/builtins/evalstring.c
>  +++ b/builtins/evalstring.c
>  @@ -753,7 +753,7 @@ open_redir_file (r, fnp)
> @@ -29,6 +29,3 @@ index df3dd68e2a7e..6612081cd646 100644
>         free (fn);
>         if (fnp)
>   	*fnp =3D 0;
> ---=20
> -2.40.0
> -
> diff --git a/meta/recipes-extended/bash/bash/fix-run-builtins.patch b/met=
a/recipes-extended/bash/bash/fix-run-builtins.patch
> index 2fa388302e..e567416d5d 100644
> --- a/meta/recipes-extended/bash/bash/fix-run-builtins.patch
> +++ b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
> @@ -1,4 +1,4 @@
> -From 0c4cab9594c96c2dc435a8d9724605824bcbf917 Mon Sep 17 00:00:00 2001
> +From cad8a7b1f355fb677503384adb885e7ef2e96d70 Mon Sep 17 00:00:00 2001
>  From: Dengke Du <dengke.du@windriver.com>
>  Date: Tue, 19 Apr 2016 02:57:45 -0400
>  Subject: [PATCH] fix run-builtins failed
> @@ -16,10 +16,10 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/tests/builtins.tests b/tests/builtins.tests
> -index 9d77520..63f3af8 100644
> +index 8eee43e..71c9eee 100644
>  --- a/tests/builtins.tests
>  +++ b/tests/builtins.tests
> -@@ -109,7 +109,7 @@ esac
> +@@ -124,7 +124,7 @@ esac
>  =20
>   # test options to exec
>   (exec -a specialname ${THIS_SH} -c 'echo $0' )
> @@ -28,6 +28,3 @@ index 9d77520..63f3af8 100644
>   # test `clean' environment.  if /bin/sh is bash, and the script version=
 of
>   # printenv is run, there will be variables in the environment that bash
>   # sets on startup.  Also test code that prefixes argv[0] with a dash.
> ---=20
> -2.8.1
> -
> diff --git a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.pa=
tch b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
> index a9391d6cac..93dc6a5035 100644
> --- a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
> +++ b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
> @@ -1,3 +1,8 @@
> +From c1a2395ebc4473714533a9cebe9197789addedae Mon Sep 17 00:00:00 2001
> +From: Christopher Larson <chris_larson@mentor.com>
> +Date: Wed, 14 Nov 2012 07:55:09 -0700
> +Subject: [PATCH] bash: fix mkbuiltins build failure
> +
>  On hosts with FORTIFY_SOURCES, stringize support is required, as it's us=
ed by
>  the macros to wrap functions (e.g. read and open in unistd.h). Those wra=
ppers
>  use the STRING() macro from unistd.h. A header in the bash sources overr=
ides
> @@ -13,14 +18,19 @@ stringize support, or to not define STRING() at all w=
hen FORTIFY_SOURCES is
>  defined, letting the unistd.h one be used, instead.
> =20
>  Upstream-Status: Pending
> +---
> + builtins/mkbuiltins.c | 1 +
> + 1 file changed, 1 insertion(+)
> =20
> ---- bash-4.2.orig/builtins/mkbuiltins.c
> -+++ bash-4.2/builtins/mkbuiltins.c
> +diff --git a/builtins/mkbuiltins.c b/builtins/mkbuiltins.c
> +index f505ebd..b5b2eed 100644
> +--- a/builtins/mkbuiltins.c
> ++++ b/builtins/mkbuiltins.c
>  @@ -28,6 +28,7 @@
>   #  define HAVE_STDLIB_H
> -
> +=20
>   #  define HAVE_RENAME
>  +#  define HAVE_STRINGIZE
>   #endif /* CROSS_COMPILING */
> -
> +=20
>   #if defined (HAVE_UNISTD_H)
> diff --git a/meta/recipes-extended/bash/bash/test-output.patch b/meta/rec=
ipes-extended/bash/bash/test-output.patch
> index 0ffcc24587..f16477587b 100644
> --- a/meta/recipes-extended/bash/bash/test-output.patch
> +++ b/meta/recipes-extended/bash/bash/test-output.patch
> @@ -1,7 +1,7 @@
> -From 28eb06047ebd2deaa8c7cd2bf6655ef6a469dc14 Mon Sep 17 00:00:00 2001
> +From b0d0e91d2bc9b8d0b3b7fb500c324b7a318fddff Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 15 Aug 2017 10:01:56 +0800
> -Subject: [PATCH 1/2] Add FAIL/PASS output to test output.
> +Subject: [PATCH] Add FAIL/PASS output to test output.
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   1 file changed, 10 insertions(+), 1 deletion(-)
> =20
>  diff --git a/tests/run-all b/tests/run-all
> -index 2882fe0..e21d026 100644
> +index 1f74923..ba36a1f 100644
>  --- a/tests/run-all
>  +++ b/tests/run-all
> -@@ -33,7 +33,16 @@ do
> +@@ -57,7 +57,16 @@ do
>   	case $x in
>   	$0|run-minimal|run-gprof)	;;
>   	*.orig|*~) ;;
> @@ -37,6 +37,3 @@ index 2882fe0..e21d026 100644
>   	esac
>   done
>  =20
> ---=20
> -1.8.3.1
> -
> diff --git a/meta/recipes-extended/bash/bash/use_aclocal.patch b/meta/rec=
ipes-extended/bash/bash/use_aclocal.patch
> index bd6870b386..302bd0d82d 100644
> --- a/meta/recipes-extended/bash/bash/use_aclocal.patch
> +++ b/meta/recipes-extended/bash/bash/use_aclocal.patch
> @@ -1,4 +1,4 @@
> -From d1bf23817afffd5917b74da6946e0c3b7e63e336 Mon Sep 17 00:00:00 2001
> +From f803b05a8d06f3df10aea47ccf9f5eb2fd438630 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 28 Dec 2020 21:04:27 +0100
>  Subject: [PATCH] bash: update 5.0 -> 5.1
> @@ -9,13 +9,12 @@ as needed instead making it work like other autotools b=
ased projects.
> =20
>  Upstream-Status: Inappropriate [OE configuration specific]
>  RP 2021/1/20
> -
>  ---
>   configure.ac | 43 -------------------------------------------
>   1 file changed, 43 deletions(-)
> =20
>  diff --git a/configure.ac b/configure.ac
> -index 50a6e20..a3b5bd7 100644
> +index 52d4029..2a38c6b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -710,49 +710,6 @@ if test x$SIZE =3D x; then
> diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-ext=
ended/bash/bash_5.2.37.bb
> similarity index 92%
> rename from meta/recipes-extended/bash/bash_5.2.21.bb
> rename to meta/recipes-extended/bash/bash_5.2.37.bb
> index 7652e7d87a..8262cea740 100644
> --- a/meta/recipes-extended/bash/bash_5.2.21.bb
> +++ b/meta/recipes-extended/bash/bash_5.2.37.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtar=
ball \
>             file://0001-fix-c99.patch \
>             "
> =20
> -SRC_URI[tarball.sha256sum] =3D "c8e31bdc59b69aaffc5b36509905ba3e5cbb1274=
7091d27b4b977f078560d5b8"
> +SRC_URI[tarball.sha256sum] =3D "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1=
e281175dd1f8a4014da621ff"
> =20
>  DEBUG_OPTIMIZATION:append:armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
>  DEBUG_OPTIMIZATION:append:armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"


--=20
Yoann Congal
Smile ECS



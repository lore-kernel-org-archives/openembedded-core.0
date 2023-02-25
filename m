Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD89C64EC7
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 09:15:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.40742.1677316522160855385
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 01:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hdvlKlgF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q16so1534610wrw.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 01:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PX2r1bT9tcdNVB50Mh3pKxnhZ3PGFsHNKO/ZmkInW7U=;
        b=hdvlKlgF5SX4Ls7xwkwc+Tp0jEQur5i5Gmt1jMoQFE9+R/7SwoyATfaSHi4fALdUaC
         0z6G7eUkSB9sjq+fdXb2VG0i6S+nBKXJdnfi897I9I1zK2UeXbgkdVN/dsknAyt/fRrF
         00y1aWerWjAGcPZ1YV7Hh1COt65ZyL7U7OpWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PX2r1bT9tcdNVB50Mh3pKxnhZ3PGFsHNKO/ZmkInW7U=;
        b=0ZFabS2AIk74uLwj/T8yobxXCyy7vIZ4ywPl+RZJYa+cv8BMdnXnGtUohbnXK9XXsa
         s8TA65/qC2h8DH5eyyGjEXYlmDRQwpod2wcY+OXcyC2sLepZLs9xwz+bpyvEdHcioll/
         viciKJeVeCefQVU/x8j6QKk6g15LDnMu2atW5iEkb02AqtHsv4m4mcTfbM0jZpwExTr5
         3tgdwQkKGlYk5rauHOoWawJFWYhsQx0uiUg+R+uzAIFONZ5W9CHaJGL2a1ocP5dg97uM
         dqvkYNd5HYbobTvwLJ2oHjBLXjb3uib0kKxk3V0zF9V257kX4URbVHgw/z+vkJvbFenC
         A1sg==
X-Gm-Message-State: AO0yUKXGOaHlCJJMVhrtENnMbEHmX1AexrJjgV5q2dBRLjxKcYpL0KML
	c3Ct5DmSSmcWxS3WYuo6FHzmMg==
X-Google-Smtp-Source: AK7set+g44wTSy1mdUzd2JXoL+XDTjHzrbVsSW9jpS5/FgpYK/VXB+WhambF/5zD62uUo0zFFUrFeQ==
X-Received: by 2002:adf:ed81:0:b0:2c9:e3d:88ca with SMTP id c1-20020adfed81000000b002c90e3d88camr1182655wro.67.1677316520286;
        Sat, 25 Feb 2023 01:15:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e7ea:a56:22dd:5e1f? ([2001:8b0:aba:5f3c:e7ea:a56:22dd:5e1f])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d53d2000000b002c70ce264bfsm1223200wrw.76.2023.02.25.01.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 01:15:19 -0800 (PST)
Message-ID: <624348a2e619b8f9a3ad3f3f6cbdc82cb50f532a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 0/6] scripts/resulttool/regression: add
 metadata filtering
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Date: Sat, 25 Feb 2023 09:15:18 +0000
In-Reply-To: <1746D4E8592324E9.29542@lists.openembedded.org>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
	 <1746D4E8592324E9.29542@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 09:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177715

On Fri, 2023-02-24 at 18:06 +0000, Richard Purdie via
lists.openembedded.org wrote:
> Hi Alexis,
>=20
> Firstly, this looks very much improved, thanks. It is great to start to
> see some meaningful data from this.
>=20
> On Fri, 2023-02-24 at 17:45 +0100, Alexis Lothor=C3=A9 via
> lists.openembedded.org wrote:
> > From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> >=20
> > Hello,
> > this new series is the follow-up of [1] to make regression reports more
> > meaningful, by reducing noise and false positives.
> >=20
> > Change since v2:
> > - add filtering on MACHINE field from test results configuration: the M=
ACHINE
> >   should always match
> > - add "metadata guessing" mechanism based on Richard proposal ([2]). Up=
 to the
> >   point where this series will be merged, tests results stored in git a=
re not
> >   enriched with OESELFTEST_METADATA. To allow proper test comparison ev=
en with
> >   those tests, try to guess what oeselftest command line has been used =
to run
> >   the corresponding tests, and generate OESELFTEST_METADATA accordingly
> > - add new tool to ease test results usage: yocto_testresults_query. For=
 now the
> >   tool only manages regression report and is a thin layer between send-=
qa-email
> >   (in yocto-autobuilder-helper) and resulttool. Its main role is to tra=
nslate
> >   regression reports arguments (which are tags or branches) to fixed re=
visions
> >   and to call resulttool accordingly. Most of its code is a transfer fr=
om
> >   send-qa-email (another series for the autobuilder will follow this on=
e to make
> >   send-qa-email use this new helper, but this current series works
> >   independently)
> >   Example: "yocto_testresults_query.py regression-report 4.2_M1 4.2_M2"=
 will
> >   replay the regression report generated when the 4.2_M2 has been gener=
ated.
> >=20
> > Change since v1:
> > - properly configure "From" field in series
> >=20
> > With those improvements, the regression report is significantly reduced=
 and some
> > useful data start to emerge from the removed noise:
> > - with the MACHINE filtering, the 4.2_M2 report goes from 5.5GB to 627M=
B
> > - with the OESELFTEST_METADATA enrichment + metadata guessing for older=
 tests,
> >   the report goes from 627MB to 1.5MB
>=20
> That is just a bit more readable!
>=20
> >=20
> > After manual inspection on some entries, the remaining oeselftest regre=
ssion
> > raised in the report seems valid. There are still some issues to tackle=
:
> > - it seems that now one major remaining source of noise is on the "runt=
ime"
> >   tests (comparison to tests not run on "target" results)
> > - when a ptest managed by oe-selftest fails, I guess the remaining test=
s are not
> >   run, so when 1 failure is logged, we have many "PASSED->None" transit=
ions in
> >   regression report, we should probably silence it.
> > - some transitions appear as regression while those are in fact improve=
ments
> >   (e.g: "UNRESOLVED->PASSED")
>=20
> I had quick play. Firstly, if I try "yocto_testresults_query.py
> regression-report 4.2_M1 4.2_M2" in an openembedded-core repository
> instead of poky, it breaks. That isn't surprising but we should either
> make it work or show a sensible error.
>=20
> I also took a look the report and wondered why the matching isn't quite
> right and why we have these "regressions". If we could remove that
> noise, I think we'd get down to the real issues. I ended up doing:
>=20
> resulttool report --commit 4d19594b8bdacde6d809d3f2a25cff7c5a42295e  . > =
/tmp/repa
> resulttool report --commit 5e249ec855517765f4b99e8039cb888ffa09c211  . > =
/tmp/repb
> meld /tmp/rep*
>=20
> which was interesting as gave lots of warnings like:
>=20
> "Warning duplicate ptest result 'acl.test/cp.test' for qemuarm64"
>=20
> so it looks like we had a couple of different test runs for qemuarm64
> ptests which is confusing your new code. I suspect this happened due to
> some autobuilder glitch during the release build which restarted some
> of the build pieces. Not sure how to handle that yet, I'll give it some
> further thought but I wanted to share what I think is the source of
> some of the issues. Basically we need to get the regression report
> looking more like that meld output!

I was wrong about the duplication, that isn't the issue, or at least I
found some other more pressing ones. For the ltp issue, I found an easy
fix:

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/=
regression.py
index 1b0c8335a39..9d7c35942a6 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -146,6 +146,7 @@ def can_be_compared(logger, base, target):
     run with different tests sets or parameters. Return true if tests can =
be
     compared
     """
+    ret =3D True
     base_configuration =3D base['configuration']
     target_configuration =3D target['configuration']
=20
@@ -165,7 +166,10 @@ def can_be_compared(logger, base, target):
             logger.debug(f"Enriching {target_configuration['STARTTIME']} w=
ith {guess}")
             target_configuration['OESELFTEST_METADATA'] =3D guess
=20
-    return metadata_matches(base_configuration, target_configuration) \
+    if base_configuration.get('TEST_TYPE') =3D=3D 'runtime' and any(result=
.startswith("ltpresult") for result in base['result']):
+        ret =3D target_configuration.get('TEST_TYPE') =3D=3D 'runtime' and=
 any(result.startswith("ltpresult") for result in target['result'])
+
+    return ret and metadata_matches(base_configuration, target_configurati=
on) \
         and machine_matches(base_configuration, target_configuration)
=20
=20
i.e. only compare ltp to ltp. The issue is we don't use a special image
name for the ltp test runs, we just extend a standard one so it was
comparing ltp to non-ltp.

We should also perhaps consider a clause in there which only compares
runs with ptests with other runs with ptests? Our test matrix won't
trigger that but other usage might in future and it is a safe check?

A lot of the rest of the noise is poor test naming for ptests, e.g.:

ptestresult.lttng-tools.ust/buffers-pid/test_buffers_pid_10_-_Create_sessio=
n_buffers-pid_in_-o_/tmp/tmp.XXXXXXXXXXrs_pid_trace_path.XTnDY5

which has a random string at the end. I'm wondering if we should pre-
filter ptest result names and truncate a known list of them at the "-"
(lttng-tools, babeltrace, babeltrace2). Curl could also be truncated at
the ",":

ptestresult.curl.test_0010__10_out_of_1506,_remaining:_06:44,_took_1.075s,_=
duration:_00:02_

We can adjust the ptest generation code to do this at source (we should
perhaps file a bug for that for the four above?) but that won't fix the
older results so we'll probably need some filtering in the code too.

There is something more going on with the ptest results too, I don't
understand why quilt/python3 changed but I suspect we just have to go
through the issues step by step now.

I did look into the:

ptestresult.glibc-user.debug/tst-fortify-c-default-1

'regression' and it is because the test was renamed in the new glibc. I
was therefore thinking a summary of added/removed would be useful in
but only in these cases. Something along the line of if only tests
added, just summarise X new added and call it a match. If tests removed
and added, list and show a count summary (X removed, Y added) and call
it a regression.

I think I might be tempted to merge this series and then we can change
the code to improve from here as this is clearly a vast improvement on
where we were! Improvements can be incremental on top of these changes.

Cheers,

Richard









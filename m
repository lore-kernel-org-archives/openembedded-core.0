Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E72C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 06:24:35 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.16150.1677651873110148335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 22:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mjvbA3Sn;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-536b7ffdd34so339356797b3.6
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 22:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zyBRBMTBgRCCOJrbkP5Hw9JKGOXURxRg16Y+4Ht26mk=;
        b=mjvbA3SnFk2zJGyaDmb4Pe5KC9hWtl01rv+NiNbBPlVpPYaF4VsF9EDFa/b6yFU+qj
         fEFXEsXUZg/F9ys1JfpF6WK6Tofjpxl39ASgkxfHvQ6BJbIK8p5jea2wR+j6VOwr5qNw
         45EJ4kd8tylKBqTKI2ePn7AbEI8p/84Dz+4lxIm76uneRf4Nl65FHUWZDEY/cpfVnpBr
         Zp0Cu5xqNm4XT++l00Dc6Q6jfH9GItwfrV0mROxvGwbP0Qg7sHkU29e53m6YNI8+/q7/
         ZVHZe4S0wEq6+nrBwJ39EH5XbzrgCtDaSzuDWSxfFNIBp7BnCcdtcdG7O0bH4EvNRln2
         xhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyBRBMTBgRCCOJrbkP5Hw9JKGOXURxRg16Y+4Ht26mk=;
        b=CZai5jSpElKQE1wkhZ3txf/sX1L4m0vLVKpCkp2yu1OtFfjOz9n40v4g4xHki5qqol
         9o93iCq4l/mGelFVaUzwTq8nxdUN53uzJVFo5M3KVX72pT0sQwfPwkyJIdyEIhptqLBs
         RykTrLRjW7bjarQg21ru+/9J2YK1aTuV39ybjxOXegF7BQpfdnusBiQzAOMYFfSb3VE0
         32u/BLynRYItaQLt8Lfzu7VMXecMx/YuVjiU6DGK1ZVaygH77KwtZz4OSz5Nls3MQ7oh
         FxNMbRBjFY58bT8QW7A09xu6Iolx/BQIMYyI3yUA7bO+A4XJD4Mehu+xSlsSya+PERYs
         ALGQ==
X-Gm-Message-State: AO0yUKWZ1pG301NUhSnGUNIQ5MKgWay345kUwp3onyTa8dX6JYQMgzwC
	r09OfEeu2h/P6SNn/z/2rLIDbRch8dASjyuAYwrvdYbUJo0=
X-Google-Smtp-Source: AK7set8TWeEecrktCdDMY6Mhdaz5CQvGSMJEfdCRvFjEI3El4LiSuzRL2lJHfzsoBsZ24lV+p13GgSDM8ZT3c4Kkol4=
X-Received: by 2002:a81:af53:0:b0:53c:6fda:835f with SMTP id
 x19-20020a81af53000000b0053c6fda835fmr396392ywj.0.1677651871912; Tue, 28 Feb
 2023 22:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
In-Reply-To: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 28 Feb 2023 22:24:21 -0800
Message-ID: <CANx9H-CphQSxUqc_y2_YPHnhyTBxQKuSn25bHeiYRs79fckDow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] keep reducing regression reports noise
To: alexis.lothore@bootlin.com
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000e1d6be05f5d0c3aa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 06:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177867

--000000000000e1d6be05f5d0c3aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 10:10 AM Alexis Lothor=C3=A9 via lists.openembedded=
.org
<alexis.lothore=3Dbootlin.com@lists.openembedded.org> wrote:

> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>
> Hello,
> here is another batch of fixes to reduce noise in regression reports.
> Fixes are
> directly linked to main noise sources seen in 4.2_M3 regression report
> ([1]).
> - fix some existing selftests for resulttool
> - add more filters for ptests incorrectly logging failures. The root caus=
e
> of
>   those wrongly named test results remained to be fixed to stop saving
> broken
>   test results, but this series fixes at least parsing for existing resul=
ts
> - Stop logging "newly passing" tests in regression reports. Some real
>   regressions are "hidden" in big chunks of newly passing tests:
> foo: FAIL -> PASS
> bar: FAIL -> PASS
> moo: FAIL -> PASS
> [...]
> xxx: PASS -> FAIL
> [...]
> yyy: FAIL -> PASS
> zzz: FAIL -> PASS
>
> We are reaching a point where regression reports are small enough to get
> posted
> on pastebin, so by following [2] you can find a report sample generated
> with
> tooling patched with this series
>
> [1] https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1/t
> <https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1/testresults/t=
estresult-regressions-report.txt>


It seems a bit odd that all the regressions are changing from a valid state
(PASS, SKIP=E2=80=A6) -> None. Does this literally mean the only changes we=
re
dropped test cases?

estresults/testresult-regressions-report.txt
> <https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1/testresults/t=
estresult-regressions-report.txt>
> [2] https://pastebin.com/QgfLKhpx
>
> Alexis Lothor=C3=A9 (6):
>   scripts/resulttool: call fixup_ptest_names in regression_common
>   oeqa/selftest/resulttool: fix ptest filtering tests
>   oeqa/selftest/resulttool: fix fake data used for testing
>   scripts/resulttool: fix ptests results containing a non reproducible
>     path
>   oeqa/selftest/resulttool: add test for error propagation in test name
>     filtering
>   scripts/resulttool: do not count newly passing tests as regressions
>
>  .../oeqa/selftest/cases/resulttooltests.py    | 112 +++++++++++-------
>  scripts/lib/resulttool/regression.py          |  66 +++++++----
>  2 files changed, 112 insertions(+), 66 deletions(-)
>
> --
> 2.39.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177847):
> https://lists.openembedded.org/g/openembedded-core/message/177847
> Mute This Topic: https://lists.openembedded.org/mt/97296204/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e1d6be05f5d0c3aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 28, 2023 at 10:10 AM Alexis Lothor=C3=A9 via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;alex=
is.lothore=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.=
com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">From: Alexis Lothor=C3=A9 &lt;<a href=3D"mailto:alexis.lothore@bootl=
in.com" target=3D"_blank">alexis.lothore@bootlin.com</a>&gt;<br>
<br>
Hello,<br>
here is another batch of fixes to reduce noise in regression reports. Fixes=
 are<br>
directly linked to main noise sources seen in 4.2_M3 regression report ([1]=
).<br>
- fix some existing selftests for resulttool<br>
- add more filters for ptests incorrectly logging failures. The root cause =
of<br>
=C2=A0 those wrongly named test results remained to be fixed to stop saving=
 broken<br>
=C2=A0 test results, but this series fixes at least parsing for existing re=
sults<br>
- Stop logging &quot;newly passing&quot; tests in regression reports. Some =
real<br>
=C2=A0 regressions are &quot;hidden&quot; in big chunks of newly passing te=
sts:<br>
foo: FAIL -&gt; PASS<br>
bar: FAIL -&gt; PASS<br>
moo: FAIL -&gt; PASS<br>
[...]<br>
xxx: PASS -&gt; FAIL<br>
[...]<br>
yyy: FAIL -&gt; PASS<br>
zzz: FAIL -&gt; PASS<br>
<br>
We are reaching a point where regression reports are small enough to get po=
sted<br>
on pastebin, so by following [2] you can find a report sample generated wit=
h<br>
tooling patched with this series<br>
<br>
[1] <a href=3D"https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1/t=
estresults/testresult-regressions-report.txt" rel=3D"noreferrer" target=3D"=
_blank">https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1/t</a></b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It seems a bit odd =
that all the regressions are changing from a valid state (PASS, SKIP=E2=80=
=A6) -&gt; None. Does this literally mean the only changes were dropped tes=
t cases?</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" di=
r=3D"auto"><a href=3D"https://autobuilder.yocto.io/pub/releases/yocto-4.2_M=
3.rc1/testresults/testresult-regressions-report.txt" rel=3D"noreferrer" tar=
get=3D"_blank">estresults/testresult-regressions-report.txt</a><br>
[2] <a href=3D"https://pastebin.com/QgfLKhpx" rel=3D"noreferrer" target=3D"=
_blank">https://pastebin.com/QgfLKhpx</a><br>
<br>
Alexis Lothor=C3=A9 (6):<br>
=C2=A0 scripts/resulttool: call fixup_ptest_names in regression_common<br>
=C2=A0 oeqa/selftest/resulttool: fix ptest filtering tests<br>
=C2=A0 oeqa/selftest/resulttool: fix fake data used for testing<br>
=C2=A0 scripts/resulttool: fix ptests results containing a non reproducible=
<br>
=C2=A0 =C2=A0 path<br>
=C2=A0 oeqa/selftest/resulttool: add test for error propagation in test nam=
e<br>
=C2=A0 =C2=A0 filtering<br>
=C2=A0 scripts/resulttool: do not count newly passing tests as regressions<=
br>
<br>
=C2=A0.../oeqa/selftest/cases/resulttooltests.py=C2=A0 =C2=A0 | 112 +++++++=
++++-------<br>
=C2=A0scripts/lib/resulttool/regression.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 66 +++++++----<br>
=C2=A02 files changed, 112 insertions(+), 66 deletions(-)<br>
<br>
-- <br>
2.39.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177847): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177847" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/177847</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97296204/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
97296204/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e1d6be05f5d0c3aa--


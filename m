Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.3437.1606342142948745347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 14:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bPAbAGBs;
 spf=pass (domain: linaro.org, ip: 209.85.166.180, mailfrom: leonardo.sandoval@linaro.org)
Received: by mail-il1-f180.google.com with SMTP id a19so64356ilm.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2020 14:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JqTx55NOIZ3xqStd+cnLpyKMFWHuI8HIVH/ryRzJxbg=;
        b=bPAbAGBssDDVIL2t5xt2NQOBKzAxCb6LObWW/oswqP+mJBovlYdqe4kLpCiU42l5q2
         QKcPwVENm0z9YH86DKj03cnyA1O6a/N1VX2WBR+2fDYfG1K3ABGY+Jc7AbDLfdZyqY3g
         MBT/HpDILb3dJu+UQhnDecZI+khLEz2LAbAm+qjXA8wHN7QC6TRZdbdcYc879apekfso
         r6f5Ax1L1jrSHrL8tpI/fZxvlbWNCYnSreOz0U63h6vES23bGGzl4YSGNzbgwk9nohex
         DFwXFsboNGtMT1SzlgSyD7tSP2L935S+2FK3s14glbyqqntVHAYSeguGdT/zzeaq7cFq
         Poxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JqTx55NOIZ3xqStd+cnLpyKMFWHuI8HIVH/ryRzJxbg=;
        b=d/vwkfN1H9uiJ2CJuUQL8fylfMQDuBJTT5Lj2dAmJfWEef4KBPgC3oC3lxxW047jdh
         wYZRmLwMdEDrXF8pobrM61FqRZZP+rRqB0PjXKrILOQp/WV3yOtuSpm1jE8CTReslGJk
         mQfa+JfuNrgwfyXQxrIrpLfaOio9RzJUiRoLyoyZcEO9JNkcPZPtvlDYuIzICwVSCur1
         zd7+jibTQd9BkT6gWed57X1LPeXIlQpwuu/2NZsR9S/jpPNYPCYaUdTXHN8aClVJIU4U
         wT7JyVl8CoKbJUn0HSCIFs9cW02ysQLHn1O64hfeazCG/NKU07mGGcLa0sH9BkqmDm0W
         QGGw==
X-Gm-Message-State: AOAM533OY0+MQjVRUq+1i9kGvnLM6ohIMEcSfaim7h5N9vOLWayMeH9k
	Ha1+WyeMbq/HH8xes88Fg7UxwuKsH3X7uuGv7rgADQ==
X-Google-Smtp-Source: ABdhPJwG14VqwMId9J+O7OpUmvhSo07Ge2qC4TH+Tf1zZbwGGYP377TKJ22hv5qoSgXnAbd/RVIpXTaaWx1EactsVZI=
X-Received: by 2002:a05:6e02:dee:: with SMTP id m14mr4722986ilj.211.1606342142269;
 Wed, 25 Nov 2020 14:09:02 -0800 (PST)
MIME-Version: 1.0
References: <1606218546-115087-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1606218546-115087-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Leonardo Sandoval" <leonardo.sandoval@linaro.org>
Date: Wed, 25 Nov 2020 16:08:51 -0600
Message-ID: <CAPLtV=qtux0nP429iJqRTCFRpfHN3B8_fpNPSaeGqreWJFK=Dg@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c73a6705b4f5ac39"

--000000000000c73a6705b4f5ac39
Content-Type: text/plain; charset="UTF-8"

Hi Zangrc,

this patch is now in master-next

  https://patchwork.openembedded.org/series/27030/

but autobuilder detected a compilation error in the upgraded version


https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/2736/steps/13/logs/stdio

Can you please take a look? (seems like a C macro is not defined).

Thanks,

lsg




On Mon, 23 Nov 2020 at 20:08, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> The test log of oe-selftest is as follows:
> 2020-11-23 15:48:49,144 - oe-selftest - INFO - test_crosstap_helloworld
> (runtime_test.SystemTap)
> 2020-11-23 17:06:55,949 - oe-selftest - INFO -  ... ok
> 2020-11-23 17:06:55,951 - oe-selftest - INFO - test_crosstap_pstree
> (runtime_test.SystemTap)
> 2020-11-23 17:08:07,921 - oe-selftest - INFO -  ... ok
> 2020-11-23 17:08:07,922 - oe-selftest - INFO -
> test_crosstap_syscalls_by_pid (runtime_test.SystemTap)
> 2020-11-23 17:09:20,084 - oe-selftest - INFO -  ... ok
> 2020-11-23 17:09:20,085 - oe-selftest - INFO -
> test_crosstap_syscalls_by_proc (runtime_test.SystemTap)
> 2020-11-23 17:10:31,349 - oe-selftest - INFO -  ... ok
> 2020-11-23 17:12:58,052 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2020-11-23 17:12:58,054 - oe-selftest - INFO - Ran 4 tests in 5051.537s
> 2020-11-23 17:12:58,054 - oe-selftest - INFO - OK
> 2020-11-23 17:13:08,416 - oe-selftest - INFO - RESULTS:
> 2020-11-23 17:13:08,417 - oe-selftest - INFO - RESULTS -
> runtime_test.SystemTap.test_crosstap_helloworld: PASSED (4686.81s)
> 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS -
> runtime_test.SystemTap.test_crosstap_pstree: PASSED (71.97s)
> 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS -
> runtime_test.SystemTap.test_crosstap_syscalls_by_pid: PASSED (72.16s)
> 2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS -
> runtime_test.SystemTap.test_crosstap_syscalls_by_proc: PASSED (71.26s)
> 2020-11-23 17:13:08,432 - oe-selftest - INFO - SUMMARY:
> 2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest () - Ran 4
> tests in 5051.540s
> 2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest - OK - All
> required tests passed (successes=4, skipped=0, failures=0, errors=0)
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc
> b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 56fa51d61e..ae735025b7 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -1,7 +1,7 @@
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -SRCREV = "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
> -PV = "4.3"
> +SRCREV = "988f439af39a359b4387963ca4633649866d8275"
> +PV = "4.4"
>
>  SRC_URI = "git://sourceware.org/git/systemtap.git \
>
> file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
> --
> 2.25.1
>
>
>
>
> 
>
>

--000000000000c73a6705b4f5ac39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Zangrc,</div><div><br></div><div>=
this patch is now in master-next <br></div><div><br></div><div>=C2=A0 <a hr=
ef=3D"https://patchwork.openembedded.org/series/27030/">https://patchwork.o=
penembedded.org/series/27030/</a></div><div><br></div><div>but autobuilder =
detected a compilation error in the upgraded version<br></div><div></div><d=
iv><br></div><div>=C2=A0 <a href=3D"https://autobuilder.yoctoproject.org/ty=
phoon/#/builders/61/builds/2736/steps/13/logs/stdio">https://autobuilder.yo=
ctoproject.org/typhoon/#/builders/61/builds/2736/steps/13/logs/stdio</a></d=
iv><div><br></div><div>Can you please take a look? (seems like a C macro is=
 not defined).<br></div><div><br></div><div>Thanks,</div><div><br></div><di=
v>lsg<br></div><div><br></div><div><br></div><div>=C2=A0</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 23 No=
v 2020 at 20:08, zangrc &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.com">z=
angrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">The test log of oe-selftest is as follows:<br>
2020-11-23 15:48:49,144 - oe-selftest - INFO - test_crosstap_helloworld (r=
untime_test.SystemTap)<br>
2020-11-23 17:06:55,949 - oe-selftest - INFO -=C2=A0 ... ok<br>
2020-11-23 17:06:55,951 - oe-selftest - INFO - test_crosstap_pstree (runti=
me_test.SystemTap)<br>
2020-11-23 17:08:07,921 - oe-selftest - INFO -=C2=A0 ... ok<br>
2020-11-23 17:08:07,922 - oe-selftest - INFO - test_crosstap_syscalls_by_p=
id (runtime_test.SystemTap)<br>
2020-11-23 17:09:20,084 - oe-selftest - INFO -=C2=A0 ... ok<br>
2020-11-23 17:09:20,085 - oe-selftest - INFO - test_crosstap_syscalls_by_p=
roc (runtime_test.SystemTap)<br>
2020-11-23 17:10:31,349 - oe-selftest - INFO -=C2=A0 ... ok<br>
2020-11-23 17:12:58,052 - oe-selftest - INFO - ---------------------------=
-------------------------------------------<br>
2020-11-23 17:12:58,054 - oe-selftest - INFO - Ran 4 tests in 5051.537s<br=
>
2020-11-23 17:12:58,054 - oe-selftest - INFO - OK<br>
2020-11-23 17:13:08,416 - oe-selftest - INFO - RESULTS:<br>
2020-11-23 17:13:08,417 - oe-selftest - INFO - RESULTS - runtime_test.Syst=
emTap.test_crosstap_helloworld: PASSED (4686.81s)<br>
2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.Syst=
emTap.test_crosstap_pstree: PASSED (71.97s)<br>
2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.Syst=
emTap.test_crosstap_syscalls_by_pid: PASSED (72.16s)<br>
2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.Syst=
emTap.test_crosstap_syscalls_by_proc: PASSED (71.26s)<br>
2020-11-23 17:13:08,432 - oe-selftest - INFO - SUMMARY:<br>
2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest () - Ran 4 test=
s in 5051.540s<br>
2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest - OK - All requ=
ired tests passed (successes=3D4, skipped=3D0, failures=3D0, errors=3D0)<br=
>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.c=
om" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipe=
s-kernel/systemtap/systemtap_git.inc<br>
index 56fa51d61e..ae735025b7 100644<br>
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263&quot;<br>
-SRCREV =3D &quot;82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd&quot;<br>
-PV =3D &quot;4.3&quot;<br>
+SRCREV =3D &quot;988f439af39a359b4387963ca4633649866d8275&quot;<br>
+PV =3D &quot;4.4&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://sourceware.org/git/systemt=
ap.git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/systemtap.g=
it</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-let-configure=
-write-a-python-location-into-th.patch \<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000c73a6705b4f5ac39--

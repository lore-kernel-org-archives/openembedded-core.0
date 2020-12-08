Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web12.6033.1607418119297482402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 01:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RvjiB92c;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id t16so1207479vkl.10
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 01:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9S+3r3Wg5iK4LbhNlVqmMUWF3a+FnokgLiIMpJVvaz8=;
        b=RvjiB92c6joOOzmyMlntAVq5WAbPd0OzsHD3ieQUYKisWsf/pzEALtnzWRsrrO0h9i
         Qz9nJhmv99///8sUxug3dZz4kYlqX3yBhiBXqcuk13ApzEoFyaK738EdDE8RlUvkAfZb
         yeSWWCRbdt5wPX5YNfxrZKUxtquw7tN6/Y3R5fse185XWpPOWwiDzZMDJXE5bT7z+nbi
         i8txs34FF/PDVxfpF2tsggv0XPn3FHL+JJ7MANQGWBmBzKA7V1zPLISYh5IQrpVysj3m
         v3L3h9r77QZWCbnNAN7SqKw/BCRd5h+kB1zK52O2TDhA9SXjxnUv7rI0HMDSNarr3fFW
         E0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9S+3r3Wg5iK4LbhNlVqmMUWF3a+FnokgLiIMpJVvaz8=;
        b=b87wkEJxANc5zsEGoCfW95T69Wh3KwM5sCjoROQvnlP/NYbdqS+JevhHkTvCh+ePSD
         jZQdkXdnBPZO/GwzK7rbFbXcp9ehrCIlURo4odnNjFJvhFiSsHzngCbToJtn/mgin/VU
         FAFkO4jiWYyeW63iWkNs+jkqVdOmqkVXce/zKJXmIIWYNfZEVMeidfY9ij0hlDsf1G1R
         4QBHo6alfsbTNA9fBLEifD1sbrAU9oXBndh57zid8dof3zJ3ioK2SQJ2r6gTCJQtQ34Y
         iv6VwsIu1DSA6afOL1as3dewiJvQxU0hukYz8gJ7OhtBJ4FePezu0YegK4iOCR6KozHv
         PFyQ==
X-Gm-Message-State: AOAM532BbmQyUvs/GKOMmJ+aEBZov1mvVYINUgIrpJ+QVvg575MFTakd
	DaqMz70IBbDCPHRe5q9uy8Snf9oGKzOSNr0Mw6U=
X-Google-Smtp-Source: ABdhPJwCCoCUxa56xjL2E+1s2yMSfE2p48azzaw6ssX//Fmbtcy88upylvqmay6noycAfcbnlmr3/VZAcJ8Bnwz43kk=
X-Received: by 2002:a1f:a301:: with SMTP id m1mr4348094vke.0.1607418118330;
 Tue, 08 Dec 2020 01:01:58 -0800 (PST)
MIME-Version: 1.0
References: <1606218546-115087-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <CAPLtV=qtux0nP429iJqRTCFRpfHN3B8_fpNPSaeGqreWJFK=Dg@mail.gmail.com>
 <164D60671E1EC649.7952@lists.openembedded.org> <bcd9f08662984ddaa8923c0d3fe13d4c@G08CNEXMBPEKD04.g08.fujitsu.local>
In-Reply-To: <bcd9f08662984ddaa8923c0d3fe13d4c@G08CNEXMBPEKD04.g08.fujitsu.local>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 8 Dec 2020 10:01:46 +0100
Message-ID: <CANNYZj9=m-fOHp+8BT61w46dFamaZ_8TAequuXqm=M5ros6OKA@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Leonardo Sandoval <leonardo.sandoval@linaro.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f2de8505b5f0312a"

--000000000000f2de8505b5f0312a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think sending a patch is better than waiting :)

Alex

On Tue, 8 Dec 2020 at 04:03, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> Ping
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *zangrc
> *Sent:* Friday, December 4, 2020 9:51 AM
> *To:* Leonardo Sandoval <leonardo.sandoval@linaro.org>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
>
>
>
> I think this problem should be because the kernel does not enable
> CONFIG_SECURITY_LOCKDOWN_LSM,
>
> do you need me to submit a patch to open this option of the kernel?
>
>
>
> Zangrc
>
>
>
> *From:* Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98
> *Sent:* Thursday, November 26, 2020 2:18 PM
> *To:* 'Leonardo Sandoval' <leonardo.sandoval@linaro.org>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* RE: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
>
>
>
> I will investigate, it may take some time, if the error is resolved, I
> will send a patch to the mailing list.
>
>
>
> zangrc
>
>
>
> *From:* Leonardo Sandoval <leonardo.sandoval@linaro.org>
> *Sent:* Thursday, November 26, 2020 6:09 AM
> *To:* Zang, Ruochen/=E8=87=A7 =E8=8B=A5=E5=B0=98 <zangrc.fnst@cn.fujitsu=
.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -> 4.4
>
>
>
> Hi Zangrc,
>
>
>
> this patch is now in master-next
>
>
>
>   https://patchwork.openembedded.org/series/27030/
>
>
>
> but autobuilder detected a compilation error in the upgraded version
>
>
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/2736/s=
teps/13/logs/stdio
>
>
>
> Can you please take a look? (seems like a C macro is not defined).
>
>
>
> Thanks,
>
>
>
> lsg
>
>
>
>
>
>
>
>
>
> On Mon, 23 Nov 2020 at 20:08, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
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
> required tests passed (successes=3D4, skipped=3D0, failures=3D0, errors=
=3D0)
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
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263"
> -SRCREV =3D "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
> -PV =3D "4.3"
> +SRCREV =3D "988f439af39a359b4387963ca4633649866d8275"
> +PV =3D "4.4"
>
>  SRC_URI =3D "git://sourceware.org/git/systemtap.git \
>
> file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
> --
> 2.25.1
>
>
>
>
>=20
>
>

--000000000000f2de8505b5f0312a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think sending a patch is better than waiting :)</di=
v><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, 8 Dec 2020 at 04:03, zangrc &lt=
;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-1513054640787591461WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)">Ping<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bor=
der-style:none none none solid;border-width:medium medium medium 1.5pt;padd=
ing:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;bord=
er-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm=
">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;=
Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;fon=
t-family:&quot;Calibri&quot;,sans-serif"> <a href=3D"mailto:openembedded-co=
re@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.openem=
bedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>zangrc<br>
<b>Sent:</b> Friday, December 4, 2020 9:51 AM<br>
<b>To:</b> Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval@linar=
o.org" target=3D"_blank">leonardo.sandoval@linaro.org</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -&g=
t; 4.4<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)">I think this problem should be because the=
 kernel does not enable CONFIG_SECURITY_LOCKDOWN_LSM,
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)">do you need me to submit a patch to open t=
his option of the kernel?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)">Zangrc<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bor=
der-style:none none none solid;border-width:medium medium medium 1.5pt;padd=
ing:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;bord=
er-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm=
">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;=
Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;fon=
t-family:&quot;Calibri&quot;,sans-serif"> Zang, Ruochen/</span><span style=
=3D"font-size:11pt;font-family:&quot;\005fae\008f6f\0096c5\009ed1&quot;,sa=
ns-serif" lang=3D"ZH-CN">=E8=87=A7</span><span style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif" lang=3D"ZH-CN">
</span><span style=3D"font-size:11pt;font-family:&quot;\005fae\008f6f\0096=
c5\009ed1&quot;,sans-serif" lang=3D"ZH-CN">=E8=8B=A5=E5=B0=98</span><span s=
tyle=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif">
<br>
<b>Sent:</b> Thursday, November 26, 2020 2:18 PM<br>
<b>To:</b> &#39;Leonardo Sandoval&#39; &lt;<a href=3D"mailto:leonardo.sand=
oval@linaro.org" target=3D"_blank">leonardo.sandoval@linaro.org</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> RE: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -&g=
t; 4.4<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)">I will investigate, it may take some time,=
 if the error is resolved, I will send a patch to the mailing list.<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)">zangrc<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E7=AD=89=
=
=E7=BA=BF;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bor=
der-style:none none none solid;border-width:medium medium medium 1.5pt;padd=
ing:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;bord=
er-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm=
">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;=
Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;fon=
t-family:&quot;Calibri&quot;,sans-serif"> Leonardo Sandoval &lt;<a href=3D"=
mailto:leonardo.sandoval@linaro.org" target=3D"_blank">leonardo.sandoval@li=
naro.org</a>&gt;
<br>
<b>Sent:</b> Thursday, November 26, 2020 6:09 AM<br>
<b>To:</b> Zang, Ruochen/</span><span style=3D"font-size:11pt;font-family:=
&quot;\005fae\008f6f\0096c5\009ed1&quot;,sans-serif" lang=3D"ZH-CN">=E8=87=
=A7</span><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sa=
ns-serif" lang=3D"ZH-CN">
</span><span style=3D"font-size:11pt;font-family:&quot;\005fae\008f6f\0096=
c5\009ed1&quot;,sans-serif" lang=3D"ZH-CN">=E8=8B=A5=E5=B0=98</span><span s=
tyle=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif"> &lt;<a =
href=3D"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn=
.fujitsu.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [PATCH] [OE-core] [PATCHv2] systemtap: upgrade 4.3 -&g=
t; 4.4<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hi Zangrc,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">this patch is now in master-next <u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 <a href=3D"https://patchwork.openembedded.or=
g/series/27030/" target=3D"_blank">
https://patchwork.openembedded.org/series/27030/</a><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">but autobuilder detected a compilation error in the=
 upgraded version<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 <a href=3D"https://autobuilder.yoctoproject.=
org/typhoon/#/builders/61/builds/2736/steps/13/logs/stdio" target=3D"_blank=
">
https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/2736/ste=
ps/13/logs/stdio</a><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Can you please take a look? (seems like a C macro i=
s not defined).<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">lsg<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, 23 Nov 2020 at 20:08, zangrc &lt;<a href=3D=
"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujits=
u.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor r=
gb(204,204,204);border-style:none none none solid;border-width:medium mediu=
m medium 1pt;padding:0cm 0cm 0cm 6pt;margin:5pt 0cm 5pt 4.8pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">The test log of oe-sel=
ftest is as follows:<br>
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
=C2=A0LIC_FILES_CHKSUM =3D &quot;<a>file://COPYING;md5=3Db234ee4d69f5fce44=
86a80fdaf4a4263</a>&quot;<br>
-SRCREV =3D &quot;82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd&quot;<br>
-PV =3D &quot;4.3&quot;<br>
+SRCREV =3D &quot;988f439af39a359b4387963ca4633649866d8275&quot;<br>
+PV =3D &quot;4.4&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://sourceware.org/git/systemt=
ap.git" target=3D"_blank">sourceware.org/git/systemtap.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>
file://0001-Do-not-let-configure-write-a-python-location-into-th.patch</a>=
 \<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<br>
<br>
<br>
</blockquote></div>

--000000000000f2de8505b5f0312a--

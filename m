Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.31267.1601890639295647048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 02:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AFnJNCYZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id j21so530802uak.5
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2020 02:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CfcInC3lLd486se0HYBB5Zv/pHsRICtkVTY0XehTj4Y=;
        b=AFnJNCYZ1lTCunBpy9MaDNxkof2WGSiq/FZ1yGvoHPON4FSNuEzWzY+usSQK7qOR6h
         SDmvSBerCdCJ953B3zlMYYVziX4BjAz+LIehAj5HeWK35O+YQIoy76E9qTafy7u2zGyW
         BcVjiVjHg/VnJxn6FjXvAQfHZLlqunOcH2KU+cykEneCo76K+7qOBztm3nn+301F3/k9
         fooHC1GSgDCEoKjZ3KahOb/BODI7FmEwPP+UNDbmb8hr0B4mcpsZC5gJo4hHJuqgbUqG
         C8EkDhEwMIZKjVKM2135Ea6Af+CN/OkV/PINVutStvyR28hmhs0Cp8OAOesvvwHAYlJE
         boNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CfcInC3lLd486se0HYBB5Zv/pHsRICtkVTY0XehTj4Y=;
        b=PbEzas+s57PpdgfToflWifSG4PHvy9uLbSoCtYaLxy7p910uz+bALAIHnV4WbwgQfj
         6SADQruzwuByWG1o+00QMd7SJi8X59+xJ87K09+xTuXJCPQa9kxl2mRS6t/WOJyFOMW5
         gq7nTIQTpFlNGCZdvSlxwIixY/VzF1njG6npjmudoz3QKkFWPCrgALUyzOGnSw3X+bz4
         kqClmGg5scOGsPjQEZGcQBrxkUvyU1WGohfwrbjSVhOrclm0k/K2Ju6fLKMfhbQvZNHK
         eUIvlXTxyVj3PNpNb3I0Vk5B2rpio1CgoPqE5/hSdC5wMXRIau8BaNn+iDbksXorQ+W4
         O9XQ==
X-Gm-Message-State: AOAM530G+uaLgVN58SrPmljRiTMBaX4JThsjffjrdl4DAcaqTAbFtuBr
	iHtSDHeLrIjGjaL8ZadRWTCPsTIgaarp/B+Q8Wc=
X-Google-Smtp-Source: ABdhPJxB+OpDaWTfhEsCF3BSPLw1iXYPYE+Teo2DXIdx+dc1U+bhVB6fdCaX4jVpf9Ic/uL4E3hjrg6rPP90zfEj/o4=
X-Received: by 2002:ab0:3b03:: with SMTP id n3mr6383193uaw.71.1601890638357;
 Mon, 05 Oct 2020 02:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201005083843.8405-1-chee.yang.lee@intel.com>
In-Reply-To: <20201005083843.8405-1-chee.yang.lee@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 5 Oct 2020 11:37:06 +0200
Message-ID: <CANNYZj8uGoMq7-6=botbm_uDfycgmn2iCgOdHfNnKKnJDZJRcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] perl: fix ptest test count
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000077e88605b0e93a1d"

--00000000000077e88605b0e93a1d
Content-Type: text/plain; charset="UTF-8"

Hello,

Is this fix meant for dunfell, or master or both? The bug is filed against
master.

Alex

On Mon, 5 Oct 2020 at 10:41, Lee Chee Yang <chee.yang.lee@intel.com> wrote:

> From: Chee Yang Lee <chee.yang.lee@intel.com>
>
> patche added in commit c2710903859a5545aa9dd56251f61667ee8d80bd
> failed ptest perl.t/re/pat. The patch updates incorrect test cases
> count causes the ptest to fail.
> 864 test cases before apply the patch while the patch added only 4
> test cases so it should be 868 instead of 873.
>
> ptest-runner log :-
>   PASS: t/re/overload
>   # Looks like you planned 873 tests but ran 868.
>   FAIL: t/re/pat
>   PASS: t/re/pat_advanced
>
> [YOCTO #14071]
>
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  meta/recipes-devtools/perl/files/CVE-2020-12723.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
> b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
> index ad195cffab..d25f4d4a74 100644
> --- a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
> +++ b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch
> @@ -265,7 +265,7 @@ index 6a868f4..2869b58 100644
>   skip_all_without_unicode_tables();
>
>  -plan tests => 864;  # Update this when adding/deleting tests.
> -+plan tests => 873;  # Update this when adding/deleting tests.
> ++plan tests => 868;  # Update this when adding/deleting tests.
>
>   run_tests() unless caller;
>
> --
> 2.17.1
>
>
> 
>
>

--00000000000077e88605b0e93a1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Is this fix meant for=
 dunfell, or master or both? The bug is filed against master.<br></div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=
=3D"ltr" class=3D"gmail_attr">On Mon, 5 Oct 2020 at 10:41, Lee Chee Yang &=
lt;<a href=3D"mailto:chee.yang.lee@intel.com">chee.yang.lee@intel.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.com" target=3D"_bla=
nk">chee.yang.lee@intel.com</a>&gt;<br>
<br>
patche added in commit c2710903859a5545aa9dd56251f61667ee8d80bd<br>
failed ptest perl.t/re/pat. The patch updates incorrect test cases<br>
count causes the ptest to fail.<br>
864 test cases before apply the patch while the patch added only 4<br>
test cases so it should be 868 instead of 873.<br>
<br>
ptest-runner log :-<br>
=C2=A0 PASS: t/re/overload<br>
=C2=A0 # Looks like you planned 873 tests but ran 868.<br>
=C2=A0 FAIL: t/re/pat<br>
=C2=A0 PASS: t/re/pat_advanced<br>
<br>
[YOCTO #14071]<br>
<br>
Signed-off-by: Chee Yang Lee &lt;<a href=3D"mailto:chee.yang.lee@intel.com=
" target=3D"_blank">chee.yang.lee@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/perl/files/CVE-2020-12723.patch | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch b/meta/=
recipes-devtools/perl/files/CVE-2020-12723.patch<br>
index ad195cffab..d25f4d4a74 100644<br>
--- a/meta/recipes-devtools/perl/files/CVE-2020-12723.patch<br>
+++ b/meta/recipes-devtools/perl/files/CVE-2020-12723.patch<br>
@@ -265,7 +265,7 @@ index 6a868f4..2869b58 100644<br>
=C2=A0 skip_all_without_unicode_tables();<br>
<br>
=C2=A0-plan tests =3D&gt; 864;=C2=A0 # Update this when adding/deleting te=
sts.<br>
-+plan tests =3D&gt; 873;=C2=A0 # Update this when adding/deleting tests.<=
br>
++plan tests =3D&gt; 868;=C2=A0 # Update this when adding/deleting tests.<=
br>
<br>
=C2=A0 run_tests() unless caller;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000077e88605b0e93a1d--

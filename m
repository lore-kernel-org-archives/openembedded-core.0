Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web12.5382.1589059761323561871
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 14:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k7SPH1YP;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id z2so5499055iol.11
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 14:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KMoYgDZPSPGrIpIHUKVsk1dN6q08GHsfEXdCDpI+ppk=;
        b=k7SPH1YPJjYu7Qve0w3gdOTKfi6J29tRCxshzydKh5KaCKoXjzmKevPEgDiNnPZrqD
         1P240Bf//XlBamsMCJ9W1qK8NQCkiDGJuqUNEZvZ/b/85FD1pnXVbje8neaX1XSulLb0
         ExceiWcS6aee0LFGsAEror0l3yOWEK30JUgqCjg/BqneXSrHpFRthhSbeHNQUo6J6pOh
         Lwd/jYDQKQ6RCq78WFaOCCzBfvlDxKcpvyyM9sSA11e9BH+ISTHhjJ/6o8nAEQoXPyfN
         eu3a0wthTLs5NF3mXgFhwJpeMKD7oLxt37OVTYW22kYj9/AQWQFQH+FRC3cNtXocRr/S
         nIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KMoYgDZPSPGrIpIHUKVsk1dN6q08GHsfEXdCDpI+ppk=;
        b=lcvYnmGcnTPzcr0lL6ToW1QyDYCA12r8BBkTfTwc0g92DKyGYjCguEwLUTSxxXzH2r
         t+w37EyZmeqNg4kf+IfQ6eSYM0Tisnrbk33c7PVNLmc0bYyEF2apXYoZ7jr4FYxynpuJ
         wFTZnhdOIhkdso3A+NL2Y89BHwiKlefNIg9p5D/VSg5NCvmiizbwyagU9xsHBw0WHuER
         023Z1ZT54I0+hbLx0T1b8VNGrU7dJHXAcoCIn9vFFcHvysLijOW8VEhEi/J/bf4+cx+m
         xcKaR578SGzp+WcuL86AInCoq/S/0wZmN0P7JQLuaAVmdpSa+wgyBeBJyWJrK5T1TzNI
         kTbA==
X-Gm-Message-State: AGi0Pua5rEUFNdGXkiJpwFynH9VZG+g3lpe4yfRv9kai6YbaB7aDTEKH
	7q6ZBc2wbFi7+Kf/dHG/89/jJRrWp2PCWDZju/Y=
X-Google-Smtp-Source: APiQypJ79pouFdCrVL8BjbKWRxLL1ZZKY3T+6IAHcDKllbGWaJQMHkI1hO1iktP2E4hZbnriRP7q0y0kBgeziF3Kgxg=
X-Received: by 2002:a02:a11c:: with SMTP id f28mr655321jag.22.1589059760753;
 Sat, 09 May 2020 14:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB68810C07AC538B986CE47C92A8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <160D7887899C970D.32017@lists.openembedded.org>
In-Reply-To: <160D7887899C970D.32017@lists.openembedded.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sat, 9 May 2020 14:29:09 -0700
Message-ID: <CANx9H-CiaTE9ahgRUZO3dU43RBn4AmOKoJ_0Nwk6ph=Be3J0kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] pypi.bbclass: mind package suffix on version check
To: Steve Sakoman <steve@sakoman.com>, Armin Kuster <akuster808@gmail.com>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000091115f05a53dce1d"

--00000000000091115f05a53dce1d
Content-Type: text/plain; charset="UTF-8"

This is a candidate for backport to stable once it lands in master.

On Sat, May 9, 2020 at 2:12 PM Tim Orling via lists.openembedded.org
<ticotimo=gmail.com@lists.openembedded.org> wrote:

> This version looks good.
>
> On Sat, May 9, 2020 at 1:33 PM Konrad Weihmann <kweihmann@outlook.com>
> wrote:
>
>> Some pypi packages do have suffixes like dev, or a0 or b1.
>> When doing a version check on these, the version will get falsely
>> identified as major release versions.
>> Add a terminating slash to rule out those false positives
>>
>> Changes v2:
>>
>> - ignore suffix versions instead of reporting them
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>>
>
> Reviewed-by: Tim Orling <ticotimo@gmail.com>
>
> ---
>>  meta/classes/pypi.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
>> index e5d7ab3ce1..ffa8aa3ff4 100644
>> --- a/meta/classes/pypi.bbclass
>> +++ b/meta/classes/pypi.bbclass
>> @@ -23,4 +23,4 @@ SRC_URI += "${PYPI_SRC_URI}"
>>  S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>>
>>  UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
>> -UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
>> +UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
>> --
>> 2.20.1
>>
>>
>> 
>

--00000000000091115f05a53dce1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a candidate for backport to stable once it lands i=
n master.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sat, May 9, 2020 at 2:12 PM Tim Orling via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;ticotimo=3D<a href=3D"=
mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div>This version looks good.</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 9, 2020 at 1:33 PM =
Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com" target=3D"_bla=
nk">kweihmann@outlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Some pypi packages do have suffixes like dev, or a=
0 or b1.<br>
When doing a version check on these, the version will get falsely<br>
identified as major release versions.<br>
Add a terminating slash to rule out those false positives<br>
<br>
Changes v2:<br>
<br>
- ignore suffix versions instead of reporting them<br>
<br>
Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br></blockquote><div>=C2=
=A0</div><div>Reviewed-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail=
.com" target=3D"_blank">ticotimo@gmail.com</a>&gt;</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta/classes/pypi.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass<br>
index e5d7ab3ce1..ffa8aa3ff4 100644<br>
--- a/meta/classes/pypi.bbclass<br>
+++ b/meta/classes/pypi.bbclass<br>
@@ -23,4 +23,4 @@ SRC_URI +=3D &quot;${PYPI_SRC_URI}&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI ?=3D &quot;<a href=3D"https://pypi.python.org/pyp=
i/$%7BPYPI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.p=
ython.org/pypi/${PYPI_PACKAGE}/</a>&quot;<br>
-UPSTREAM_CHECK_REGEX ?=3D &quot;/${PYPI_PACKAGE}/(?P&lt;pver&gt;(\d+[\.\-=
_]*)+)&quot;<br>
+UPSTREAM_CHECK_REGEX ?=3D &quot;/${PYPI_PACKAGE}/(?P&lt;pver&gt;(\d+[\.\-=
_]*)+)/&quot;<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>
<br>
</blockquote></div>

--00000000000091115f05a53dce1d--

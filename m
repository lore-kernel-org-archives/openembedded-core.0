Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web11.5548.1591082258165770399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 00:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eSGoiQ+a;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id g129so1464431vsc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 00:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TBiAPpgAHtOJhmtoG6nSFxXFXAgxByECWYveEZnK710=;
        b=eSGoiQ+a44xVL/FkhtSZhjnc1Tj0j2OL3gBusAz1GcsVYPebqetkalfL9eoJBgvaF6
         kaSsg0PQW06lGJ9dqbUpK6oc8IeWLAAw1Afj04pMy80kzkfiqzhzWjmggxJYlhZijmYc
         /uMDuFXjDt9mxVS+lT6ilCGlX8c9SDj2ZcFTb9BvBdCXwcuNtK3fyq/vsQKJc3PUg0/n
         y0FQwilbNJoMTbnqUyLPJX83kdtuGI0w7ndXV9/8iqtjOMSBNXUw+MAf+lSWVPtwQxCl
         4btFhhv6ereX3eGnJ4sIXO0usSxi6HWRqp1Fduml38FfgPecz/hHIum9IgzPFHeT2XnN
         7ojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TBiAPpgAHtOJhmtoG6nSFxXFXAgxByECWYveEZnK710=;
        b=oEn3WcptFCq2655uQ8IoqjajAkaeLlUW6zT+0NcvTtJ0Jaf8fIeOfffZMc/puPGaY6
         NoPbsN/Q44MQZHBn/pl/88gVgJbBZ/j9IrBi33cFEM0tvBp6WjkRkHmB5jmS3enDt4Ib
         ZoaqlE5u9+slhkNjq12cxdlssRELjN0RFCeXIqx/EO13uvEiBeMsg4FdROL74AHWN06P
         rJ2nqyWWmWz0tKiiVWi10j95YNwF5uBdNIXqwNL88C7e10UWQTIkf8SnQ3Cb+CSgUHYT
         W+quHxYsl6sYsdoLG53Te7BhEINJIQDVk/E3/QZC0u0Ge/rrBuMZI0oteaw6w7C3YEPL
         HbFg==
X-Gm-Message-State: AOAM5313UsjhtK+y+e5n8kl2iziYteiDrKe3S+g3Wuk3DQMmlS5v5vxs
	TAjt8ekMIaU/dqEwcESqw37RLc/RNu4KawmKE+qJENWx
X-Google-Smtp-Source: ABdhPJzKqiTPPxAgYPNfD3z9j6MmEIxcyvOLIjBdVK+Pgs4kculMMTf539DXdfn933DYvh+BSllZxqwKdjIzMDfvMFk=
X-Received: by 2002:a67:6686:: with SMTP id a128mr2484605vsc.83.1591082257374;
 Tue, 02 Jun 2020 00:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-17-alex.kanavin@gmail.com> <CAMKF1sry+bdb+JF9o74GfgERR0=fKwC4ZT34B5pZKN5to+Z=hQ@mail.gmail.com>
In-Reply-To: <CAMKF1sry+bdb+JF9o74GfgERR0=fKwC4ZT34B5pZKN5to+Z=hQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 2 Jun 2020 09:17:25 +0200
Message-ID: <CANNYZj8=wbp_xL53mwW--cZ5d7yMCNHMRFtj9T09mmrZsfzwZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 17/70] strace: upgrade 5.5 -> 5.6
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c261b505a714b403"

--000000000000c261b505a714b403
Content-Type: text/plain; charset="UTF-8"

Upstream builds with -Werror by default, which this switch disables.

Alex

On Tue, 2 Jun 2020 at 04:27, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sun, May 31, 2020 at 8:53 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  .../strace/{strace_5.5.bb => strace_5.6.bb}                 | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>  rename meta/recipes-devtools/strace/{strace_5.5.bb => strace_5.6.bb}
>> (90%)
>>
>> diff --git a/meta/recipes-devtools/strace/strace_5.5.bb
>> b/meta/recipes-devtools/strace/strace_5.6.bb
>> similarity index 90%
>> rename from meta/recipes-devtools/strace/strace_5.5.bb
>> rename to meta/recipes-devtools/strace/strace_5.6.bb
>> index ae552da028..53679cd0d2 100644
>> --- a/meta/recipes-devtools/strace/strace_5.5.bb
>> +++ b/meta/recipes-devtools/strace/strace_5.6.bb
>> @@ -15,8 +15,8 @@ SRC_URI = "
>> https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>>             file://uintptr_t.patch \
>>             file://0001-strace-fix-reproducibilty-issues.patch \
>>             "
>> -SRC_URI[md5sum] = "dbce2e84632b39a4ed86b9fc60447af9"
>> -SRC_URI[sha256sum] =
>> "9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff"
>> +SRC_URI[md5sum] = "f8e0394d4e537b3faadf0a72f5d1d17e"
>> +SRC_URI[sha256sum] =
>> "189968eeae06ed9e20166ec55a830943c84374676a457c9fe010edc7541f1b01"
>>
>>  inherit autotools ptest
>>
>> @@ -27,7 +27,7 @@ PACKAGECONFIG_class-target ??= "\
>>  PACKAGECONFIG[bluez] =
>> "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
>>  PACKAGECONFIG[libunwind] =
>> "--with-libunwind,--without-libunwind,libunwind"
>>
>> -EXTRA_OECONF += "--enable-mpers=no"
>> +EXTRA_OECONF += "--enable-mpers=no --disable-gcc-Werror"
>
>
> Why is this needed ? Perhaps description in comment will help
>
>
>>
>>  CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
>>
>> --
>> 2.26.2
>>
>> 
>>
>

--000000000000c261b505a714b403
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Upstream builds with -Werror by default, which this s=
witch disables.</div><div><br></div><div>Alex<br></div></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 2 Jun 2020 =
at 04:27, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sun, May 31, 2020 at 8:53 AM Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gma=
il.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../strace/{<a href=3D"http://strace_5.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">strace_5.5.bb</a> =3D&gt; <a href=3D"http://strace_5.6.bb" re=
l=3D"noreferrer" target=3D"_blank">strace_5.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/strace/{<a href=3D"http://strace_5.5.bb=
" rel=3D"noreferrer" target=3D"_blank">strace_5.5.bb</a> =3D&gt; <a href=3D=
"http://strace_5.6.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.6.bb</=
a>} (90%)<br>
<br>
diff --git a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">strace_5.5.bb</a> b/meta/recipes-devt=
ools/strace/<a href=3D"http://strace_5.6.bb" rel=3D"noreferrer" target=3D"_=
blank">strace_5.6.bb</a><br>
similarity index 90%<br>
rename from meta/recipes-devtools/strace/<a href=3D"http://strace_5.5.bb" =
rel=3D"noreferrer" target=3D"_blank">strace_5.5.bb</a><br>
rename to meta/recipes-devtools/strace/<a href=3D"http://strace_5.6.bb" re=
l=3D"noreferrer" target=3D"_blank">strace_5.6.bb</a><br>
index ae552da028..53679cd0d2 100644<br>
--- a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.5.bb" rel=3D=
"noreferrer" target=3D"_blank">strace_5.5.bb</a><br>
+++ b/meta/recipes-devtools/strace/<a href=3D"http://strace_5.6.bb" rel=3D=
"noreferrer" target=3D"_blank">strace_5.6.bb</a><br>
@@ -15,8 +15,8 @@ SRC_URI =3D &quot;<a href=3D"https://strace.io/files/$%7=
BPV%7D/strace-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//strace.io/files/${PV}/strace-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://uintptr_t.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-strace-fix-reproduci=
bilty-issues.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;dbce2e84632b39a4ed86b9fc60447af9&quot;<br>
-SRC_URI[sha256sum] =3D &quot;9f58958c8e59ea62293d907d10572e352b582bd7948e=
d21aa28ebb47e5bf30ff&quot;<br>
+SRC_URI[md5sum] =3D &quot;f8e0394d4e537b3faadf0a72f5d1d17e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;189968eeae06ed9e20166ec55a830943c84374676a45=
7c9fe010edc7541f1b01&quot;<br>
<br>
=C2=A0inherit autotools ptest<br>
<br>
@@ -27,7 +27,7 @@ PACKAGECONFIG_class-target ??=3D &quot;\<br>
=C2=A0PACKAGECONFIG[bluez] =3D &quot;ac_cv_header_bluetooth_bluetooth_h=3D=
yes,ac_cv_header_bluetooth_bluetooth_h=3Dno,bluez5&quot;<br>
=C2=A0PACKAGECONFIG[libunwind] =3D &quot;--with-libunwind,--without-libunw=
ind,libunwind&quot;<br>
<br>
-EXTRA_OECONF +=3D &quot;--enable-mpers=3Dno&quot;<br>
+EXTRA_OECONF +=3D &quot;--enable-mpers=3Dno --disable-gcc-Werror&quot;</b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Why is this needed =
? Perhaps description in comment will help=C2=A0</div><div dir=3D"auto"><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
=C2=A0CFLAGS_append_libc-musl =3D &quot; -Dsigcontext_struct=3Dsigcontext&=
quot;<br>
<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000c261b505a714b403--

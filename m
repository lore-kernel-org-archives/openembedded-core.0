Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web08.8041.1623852491721473591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 07:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hz75M+pT;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id x13so1070806vsf.11
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RVcNun1nOYnqExl3lh1ebeq3fEW3mnGpBoBeQj+HExQ=;
        b=Hz75M+pTvQZuty2jTKV+sMyJHBbXQQ5c6Ksym47tTj8W3V7dQlSis9XPOBVGiWFhQs
         3xOTLECq8Q954rEGyJ9Wj2G5bLAQf1yqMj2dw5X1oISZ9r0G4uqXfDvzkJoUfPd2N5XW
         2XrSfab5IHTarIUMPYR7QY7KHc5dyP54t1BQZf8hw5sNCvcQEOgSCcBM9aQSMQwRIhiT
         /Wmh40OquJ6vRquNJbImidmMW4MU/ejoxOIJ+sPnfFdT6VmSMucqzhdNpNsAtJjmeSkI
         lLUCBzeI40k4TJfySbNkrF/jWZZSEkUwHozdBi9S9noaO+gRf1ofooycBB2UCuhSLowg
         S8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RVcNun1nOYnqExl3lh1ebeq3fEW3mnGpBoBeQj+HExQ=;
        b=bb+qSCpMLyv+siABgN+7/NkuE9knoncW3Q3byfpmPckoCmbDNwIjlYRAqKupMsGYUD
         CxDm6L4k0CK10b9w3aXypuWGlE7HgA1VfP82xeww8+i+nY0jcu22VCJtvxQjFFkJuD47
         2egHX3OEPkzHgLdATwIblCMKffmBPw2b8BoFv2kGisd9b8i6OwzHoqcCj4yMRXqGvm3A
         YWVja7dTUe3V3kNhntUDxZGkpmr2s/obB7fftS5p5cGA7sppX67/ICkY7e1m2CGjgzHy
         4/bPR4tL2M7Y1gSXI4U0ZNqboduif9fUgdapxbgA8a5QwPfCEvxEICJI/ZgeJ9E/gLZf
         RE2g==
X-Gm-Message-State: AOAM531mVZjclY9IIaVGy4w/Bm6zsndbD9z2S5hmh7NLyKW7T3EzbmPV
	ulCWhEBuuXuO+uWr4coYZFh2I0gukbq7BVuFffc=
X-Google-Smtp-Source: ABdhPJwZEb7tAKJs51yn8vNIPtzN08n7M1L4Z91zeIZvkT47czwOedVOtzTqYLUuBZrE5fna0SiEzWrYoHreygIsf0M=
X-Received: by 2002:a67:f4cb:: with SMTP id s11mr38364vsn.20.1623852490867;
 Wed, 16 Jun 2021 07:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <1688B34361FD8BD3.6379@lists.openembedded.org> <16890800366CFBBE.20493@lists.openembedded.org>
In-Reply-To: <16890800366CFBBE.20493@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 16 Jun 2021 16:07:59 +0200
Message-ID: <CANNYZj85QuEDkL4N7D7B23PNFe-i1E9ZDx-SdEv+-DzFM84kAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/31] core-image-weston: bump QB_MEM to 1G in qemuarm64
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e2c6ea05c4e29e5f"

--000000000000e2c6ea05c4e29e5f
Content-Type: text/plain; charset="UTF-8"

It seems that mesa, for some reason, allocates a lot more RAM in qemuarm64
(150 Mb more or so), than it does in qemux86_64. I'll investigate.

Alex

On Wed, 16 Jun 2021 at 12:06, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> I'd like to take a deeper look at this, please hold.
>
> Alex
>
> On Tue, 15 Jun 2021 at 10:12, Alexander Kanavin via lists.openembedded.org
> <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>
>> weston tests start additional compositors, other tests are also
>> heavy on RAM, weston itself takes 256M with opengl enabled,
>> so 512M causes OOM errors on arm64.
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  meta/recipes-graphics/images/core-image-weston.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-graphics/images/core-image-weston.bb
>> b/meta/recipes-graphics/images/core-image-weston.bb
>> index 62305cc1ce..e332e19368 100644
>> --- a/meta/recipes-graphics/images/core-image-weston.bb
>> +++ b/meta/recipes-graphics/images/core-image-weston.bb
>> @@ -10,3 +10,4 @@ CORE_IMAGE_BASE_INSTALL += "gtk+3-demo"
>>  CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES',
>> 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
>>
>>  QB_MEM = "-m 512"
>> +QB_MEM_qemuarm64 = "-m 1024"
>> --
>> 2.31.1
>>
>>
>>
>>
>>
> 
>
>

--000000000000e2c6ea05c4e29e5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It seems that mesa, for some reason, allocates a lot =
more RAM in qemuarm64 (150 Mb more or so), than it does in qemux86_64. I&#3=
9;ll investigate.</div><div><br></div><div>Alex<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 16 Jun 202=
1 at 12:06, Alexander Kanavin via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@=
lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv>I&#39;d like to take a deeper look at this, please hold.</div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, 15 Jun 2021 at 10:12, Alexander Kanavin via=
 <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembe=
dded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">weston tests sta=
rt additional compositors, other tests are also<br>
heavy on RAM, weston itself takes 256M with opengl enabled,<br>
so 512M causes OOM errors on arm64.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/images/<a href=3D"http://core-image-weston.bb"=
 rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/images/<a href=3D"http://core-image-wes=
ton.bb" rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a> b/met=
a/recipes-graphics/images/<a href=3D"http://core-image-weston.bb" rel=3D"no=
referrer" target=3D"_blank">core-image-weston.bb</a><br>
index 62305cc1ce..e332e19368 100644<br>
--- a/meta/recipes-graphics/images/<a href=3D"http://core-image-weston.bb"=
 rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a><br>
+++ b/meta/recipes-graphics/images/<a href=3D"http://core-image-weston.bb"=
 rel=3D"noreferrer" target=3D"_blank">core-image-weston.bb</a><br>
@@ -10,3 +10,4 @@ CORE_IMAGE_BASE_INSTALL +=3D &quot;gtk+3-demo&quot;<br>
=C2=A0CORE_IMAGE_BASE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;x11&#39;, &#39;weston-xwayland matchbox-terminal&#39;, =
&#39;&#39;, d)}&quot;<br>
<br>
=C2=A0QB_MEM =3D &quot;-m 512&quot;<br>
+QB_MEM_qemuarm64 =3D &quot;-m 1024&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000e2c6ea05c4e29e5f--

Return-Path: <afeinman@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B901ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 20:25:18 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.79.1663100713241233005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 13:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Q/2sLbD2;
 spf=pass (domain: snapchat.com, ip: 209.85.167.53,
 mailfrom: afeinman@snapchat.com)
Received: by mail-lf1-f53.google.com with SMTP id a8so21861776lff.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 13:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=Ve8D6vROb5L6phuZ48gRqw8qW8AVPer0KSc2m13dIp0=;
        b=Q/2sLbD2h5fl8EYGLeeVfy4Ov9+csDXjupI07refonXvrljvgXfSYKuOMRdl6J4M9P
         GOR8ItBfOsaG1APSs5vksssiTRu1jlq4S1Ly7ZvI4I7iSGeSJeEj6415XKIYeQzxspbj
         KfdR766zJRgfgnERuEZLNAKV++xTSvBUqlS+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ve8D6vROb5L6phuZ48gRqw8qW8AVPer0KSc2m13dIp0=;
        b=OitcTwe82CcV6SQ1wZiZJfNYUijlarFU2s6ngK1mb1J7Ki2nteyMIHbocLQDE3Lg9N
         9mBCOCWdMBP4olCI5rXr80BB/TpN9i2b3pfWLYfCkibvMJcCw2SRkiEJQxkYD/KsfJY+
         ps1Zc4IXmrrmMt4JMJfdDz7lj5LjucXguBrp8SG0ubWCOHLAPtyJfzdjcl42ZuLNLbDX
         aPDedcx0gWuHbWyVz7DEhRU9CoJXpc0dKs9Zn1+Jl1fAGKIewSUH+NghV1geK5P0c/RU
         1f5/Sn7hJ5mcO6Fx9uVoMKbmRlxiYP/mKMkidMXyGHa3XFu+0oyPqHlxGseY8D8/Dvc2
         EM3g==
X-Gm-Message-State: ACgBeo0cDfrvZ03j6HQ/V0bN4ZPq4zG9cC4rBNGgH7L+3i5ojyHzaaMg
	wIcbm5r83QPMvHhEPIk3iO+oru0xLjxMjW/g7chWlHRc9DDKfw==
X-Google-Smtp-Source: 
 AA6agR6tFA7oNuWzBoQ5U7DmWTv/5BhYKCHwD1V41VnKPYrXRw/ry/wVnAeNolPszjpDTmV/q5nBo69i3yFEvW6i1Fw=
X-Received: by 2002:a05:6512:1681:b0:494:6de5:9689 with SMTP id
 bu1-20020a056512168100b004946de59689mr10261240lfb.609.1663100710934; Tue, 13
 Sep 2022 13:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220913123741.3416807-1-ecordonnier@snap.com>
 <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
 <CAMKF1srWRB4vLNjtS+aaY=w2wcx-Y+Gt7gMFPVhftWx84+J1RA@mail.gmail.com>
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
In-Reply-To: 
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
From: Alex Feinman <afeinman@snap.com>
Date: Tue, 13 Sep 2022 13:24:54 -0700
Message-ID: 
 <CANOoYsN_64KXbx1pi_iocL5s1sWk2545qNKQ6K_Cgv_h6Dh=1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg: enable zstd support
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001a48ad05e894cf9d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 20:25:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170610

--0000000000001a48ad05e894cf9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 1:20 PM Alex Feinman <afeinman@snap.com> wrote:

> I do have some numbers. When I was selling this change internally, I did =
a
> comparison on our internal build.
>
>           Combined write IPK times (=CE=A3 t do_package_write_ipk)
>
> xz         162m 35s
>
> gz         52m 13s
>
> zstd       33m 49s
>
> Compression rate for zstd was closer to xz than to gz but not as good as =
xz. For systems that have to cache packages on the device with limited stor=
age xz might be a better option, but for the bulk of projects zstd is the b=
est choice
>
> Additionally, zstd offers much faster decompression than xz so the rootfs=
 build step that includes unpacking all of the ipks, takes 3m 58s with xz a=
nd 2m 44s with zstd.
>
> One other thing of note - if your build includes debug packages, some may=
 be quite large. E.g. one of our components produces a 2.2 GB debug package=
 (uncompressed). On large files xz requires a disproportionally large amoun=
t of time resulting in 15 minutes needed to simply write ipk for the abovem=
entioned packages, whereas zstd took about 45 sec. For frequent tasks like =
bitbaking a single package this translates in a lot of saved time.
>
> Bottom line - I think making xz a default package compressor was not enti=
rely thought through. gzip or zstd is what the default should be.
>
> One final note: I could not find a reasonable explanation for why opkg-to=
ols require code changes to support a different compressor. BSD tar and GNU=
 tar both can easily accept compressors that they have no idea about (via -=
I option) because all of them provide a unified command line interface for =
use in pipes. If this were done similar to tar, we could have used any comp=
ressor we wanted, including the multithreaded versions (zstdmt)
>
>
> On Tue, Sep 13, 2022 at 12:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Tue, Sep 13, 2022 at 12:19 PM Alex Stewart <alex.stewart@ni.com>
>> wrote:
>> >
>> > ACK from me - apart from enabling zstd by default.
>> >
>> > On 9/13/22 07:37, Etienne Cordonnier via lists.openembedded.org wrote:
>> > > This allows the use of zstd for opkg packages by using OPKGBUILDCMD:
>> > > OPKGBUILDCMD =3D "opkg-build -Z zstd"
>> > >
>> > > Signed-off-by: Alex Feinman <afeinman@snap.com>
>> > > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> > > ---
>> > >   meta/recipes-devtools/opkg/opkg_0.6.0.bb | 3 ++-
>> > >   1 file changed, 2 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> > > index 7b351e8123..e38d9d6f3f 100644
>> > > --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> > > +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
>> > > @@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest
>> > >   target_localstatedir :=3D "${localstatedir}"
>> > >   OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>> > >
>> > > -PACKAGECONFIG ??=3D "libsolv"
>> > > +PACKAGECONFIG ??=3D "libsolv zstd"
>> >
>> > Building in zstd support by default is a little suspect to me.
>> >
>> > Unless I'm mistaken, OE-core will only build xz-compressed IPKs by
>> > default. So zstd support would be unnecessary for a distro integrator
>> > who just uses upstream OE-core.
>> >
>> > For distros which use zstd compression in their packages, I think it
>> > would be more appropriate to overwrite the opkg PACKAGECONFIG in a
>> > .bbappend.
>> >
>>
>> This is perhaps fine. I do wonder if there is some performance
>> comparison data between xz and zstd compressed ipks
>> with opkg, it might help users on making this choice and also if we
>> should consider using
>> zstd by default at some point or not.
>>
>> > Is there something I'm not considering here?
>> >
>> > >
>> > >   PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
>> > >       gnupg gpgme libgpg-error,\
>> > > @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg=
,\
>> > >   PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
>> > >   PACKAGECONFIG[ssl-curl] =3D
>> "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
>> > >   PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
>> > > +PACKAGECONFIG[zstd] =3D "--enable-zstd,--disable-zstd,zstd"
>> > >   PACKAGECONFIG[libsolv] =3D "--with-libsolv,--without-libsolv,libso=
lv"
>> > >
>> > >   EXTRA_OECONF:class-native =3D
>> "--localstatedir=3D/${@os.path.relpath('${localstatedir}',
>> '${STAGING_DIR_NATIVE}')} --sysconfdir=3D/${@os.path.relpath('${sysconfd=
ir}',
>> '${STAGING_DIR_NATIVE}')}"
>> > >
>> > >
>> > >
>> >
>> > --
>> > Alex Stewart
>> > Software Engineer - NI Real-Time OS
>> > NI (National Instruments)
>> >
>> > alex.stewart@ni.com
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#170608):
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedde=
d.org_g_openembedded-2Dcore_message_170608&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&=
m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3D_V=
WADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&e=3D
>>
>> > Mute This Topic:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedde=
d.org_mt_93654146_1997914&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRyrKojziBs=
0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DQncdL2I_pCDsz7AMbsT=
gStzC7bt5V2x_E_gIblrtjZY&e=3D
>>
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe:
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedde=
d.org_g_openembedded-2Dcore_unsub&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&m=3DKvCRy=
rKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&s=3DPxAE_3yGzbS=
Z21-LHz_1r3gd2_STPoZcrYDeu9vd_GM&e=3D
>>  [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>

--0000000000001a48ad05e894cf9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Sep 13, 2022 at 1:20 PM Alex Feinman &lt;<a h=
ref=3D"mailto:afeinman@snap.com">afeinman@snap.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_default" style=3D"font-family:verdana,sans-serif">I do have som=
e numbers. When I was selling this change internally, I did a comparison on=
 our internal build.=C2=A0</div><div class=3D"gmail_default"><pre style=3D"=
box-sizing:inherit;margin-top:4px;margin-bottom:4px;padding:8px;font-size:1=
2px;font-variant-ligatures:none;line-height:1.50001;white-space:pre-wrap;wo=
rd-break:normal;border-radius:4px;color:rgb(29,28,29)">          Combined w=
rite IPK times (=CE=A3 t do_package_write_ipk)</pre><pre style=3D"box-sizin=
g:inherit;margin-top:4px;margin-bottom:4px;padding:8px;font-size:12px;font-=
variant-ligatures:none;line-height:1.50001;white-space:pre-wrap;word-break:=
normal;border-radius:4px;color:rgb(29,28,29)">xz         162m 35s</pre><pre=
 style=3D"box-sizing:inherit;margin-top:4px;margin-bottom:4px;padding:8px;f=
ont-size:12px;font-variant-ligatures:none;line-height:1.50001;white-space:p=
re-wrap;word-break:normal;border-radius:4px;color:rgb(29,28,29)">gz        =
 52m 13s</pre><pre style=3D"box-sizing:inherit;margin-top:4px;margin-bottom=
:4px;padding:8px;font-size:12px;font-variant-ligatures:none;line-height:1.5=
0001;white-space:pre-wrap;word-break:normal;border-radius:4px;color:rgb(29,=
28,29)">zstd       33m 49s</pre><pre style=3D"box-sizing:inherit;margin-top=
:4px;margin-bottom:4px;padding:8px;line-height:1.50001;word-break:normal;bo=
rder-radius:4px"><font face=3D"verdana, sans-serif"><span style=3D"white-sp=
ace:normal">Compression rate for zstd was closer to xz than to gz but not a=
s good as xz. For systems that have to cache packages=C2=A0on the device wi=
th limited storage xz might be a better=C2=A0option, but for the bulk of pr=
ojects zstd is the best choice</span></font></pre><pre style=3D"box-sizing:=
inherit;margin-top:4px;margin-bottom:4px;padding:8px;line-height:1.50001;wo=
rd-break:normal;border-radius:4px"><font face=3D"verdana, sans-serif"><span=
 style=3D"white-space:normal">Additionally, zstd offers much faster decompr=
ession than xz so the rootfs build step that includes unpacking all of the =
ipks, takes 3m 58s with xz and 2m 44s with zstd.</span></font></pre><pre st=
yle=3D"box-sizing:inherit;margin-top:4px;margin-bottom:4px;padding:8px;line=
-height:1.50001;word-break:normal;border-radius:4px"><font face=3D"verdana,=
 sans-serif"><span style=3D"white-space:normal">One other thing of note - i=
f your build includes debug packages, some may be quite large. E.g. one of =
our components produces a 2.2 GB debug package (uncompressed). On large fil=
es xz requires a disproportionally large amount of time resulting in 15 min=
utes needed to simply write ipk for the abovementioned packages, whereas zs=
td took about 45 sec. For frequent tasks like bitbaking a single package th=
is translates in a lot of saved time.</span></font></pre><pre style=3D"box-=
sizing:inherit;margin-top:4px;margin-bottom:4px;padding:8px;line-height:1.5=
0001;word-break:normal;border-radius:4px"><font face=3D"verdana, sans-serif=
"><span style=3D"white-space:normal">Bottom line - I think making xz a defa=
ult package compressor was not entirely thought through. gzip or zstd is wh=
at the default should be.=C2=A0</span></font></pre><pre style=3D"box-sizing=
:inherit;margin-top:4px;margin-bottom:4px;padding:8px;line-height:1.50001;w=
ord-break:normal;border-radius:4px"><font face=3D"verdana, sans-serif"><spa=
n style=3D"white-space:normal">One final note: I could not find a reasonabl=
e explanation for why opkg-tools require code changes to support a differen=
t compressor. BSD tar and GNU tar both can easily accept compressors that t=
hey have no idea about (via -I option) because all of them provide a unifie=
d command line interface for use in pipes. If this were done similar to tar=
, we could have used any compressor we wanted, including the multithreaded =
versions (zstdmt)</span></font></pre></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 13, 2022 at 12:43 PM=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Tue, Sep 13, 2022 at 12:19 PM Alex Stewart &lt;<a href=3D"m=
ailto:alex.stewart@ni.com" target=3D"_blank">alex.stewart@ni.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; ACK from me - apart from enabling zstd by default.<br>
&gt;<br>
&gt; On 9/13/22 07:37, Etienne Cordonnier via <a href=3D"http://lists.opene=
mbedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a=
> wrote:<br>
&gt; &gt; This allows the use of zstd for opkg packages by using OPKGBUILDC=
MD:<br>
&gt; &gt; OPKGBUILDCMD =3D &quot;opkg-build -Z zstd&quot;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alex Feinman &lt;<a href=3D"mailto:afeinman@snap.c=
om" target=3D"_blank">afeinman@snap.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonni=
er@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.6=
.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.6.0.bb</a> | 3 ++-<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.=
6.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.6.0.bb</a> b/meta/recip=
es-devtools/opkg/<a href=3D"http://opkg_0.6.0.bb" rel=3D"noreferrer" target=
=3D"_blank">opkg_0.6.0.bb</a><br>
&gt; &gt; index 7b351e8123..e38d9d6f3f 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.6.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">opkg_0.6.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.6.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">opkg_0.6.0.bb</a><br>
&gt; &gt; @@ -30,7 +30,7 @@ inherit autotools pkgconfig ptest<br>
&gt; &gt;=C2=A0 =C2=A0target_localstatedir :=3D &quot;${localstatedir}&quot=
;<br>
&gt; &gt;=C2=A0 =C2=A0OPKGLIBDIR ??=3D &quot;${target_localstatedir}/lib&qu=
ot;<br>
&gt; &gt;<br>
&gt; &gt; -PACKAGECONFIG ??=3D &quot;libsolv&quot;<br>
&gt; &gt; +PACKAGECONFIG ??=3D &quot;libsolv zstd&quot;<br>
&gt;<br>
&gt; Building in zstd support by default is a little suspect to me.<br>
&gt;<br>
&gt; Unless I&#39;m mistaken, OE-core will only build xz-compressed IPKs by=
<br>
&gt; default. So zstd support would be unnecessary for a distro integrator<=
br>
&gt; who just uses upstream OE-core.<br>
&gt;<br>
&gt; For distros which use zstd compression in their packages, I think it<b=
r>
&gt; would be more appropriate to overwrite the opkg PACKAGECONFIG in a<br>
&gt; .bbappend.<br>
&gt;<br>
<br>
This is perhaps fine. I do wonder if there is some performance<br>
comparison data between xz and zstd compressed ipks<br>
with opkg, it might help users on making this choice and also if we<br>
should consider using<br>
zstd by default at some point or not.<br>
<br>
&gt; Is there something I&#39;m not considering here?<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[gpg] =3D &quot;--enable-gpg,--disable-g=
pg,\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gnupg gpgme libgpg-error,\<br>
&gt; &gt; @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] =3D &quot;--enable-gpg,--dis=
able-gpg,\<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[curl] =3D &quot;--enable-curl,--disable=
-curl,curl&quot;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[ssl-curl] =3D &quot;--enable-ssl-curl,-=
-disable-ssl-curl,curl openssl&quot;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[sha256] =3D &quot;--enable-sha256,--dis=
able-sha256&quot;<br>
&gt; &gt; +PACKAGECONFIG[zstd] =3D &quot;--enable-zstd,--disable-zstd,zstd&=
quot;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[libsolv] =3D &quot;--with-libsolv,--wit=
hout-libsolv,libsolv&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0EXTRA_OECONF:class-native =3D &quot;--localstatedir=
=3D/${@os.path.relpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIV=
E}&#39;)} --sysconfdir=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;=
${STAGING_DIR_NATIVE}&#39;)}&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Alex Stewart<br>
&gt; Software Engineer - NI Real-Time OS<br>
&gt; NI (National Instruments)<br>
&gt;<br>
&gt; <a href=3D"mailto:alex.stewart@ni.com" target=3D"_blank">alex.stewart@=
ni.com</a><br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#170608): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_messa=
ge_170608&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs=
0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3D_VWADuvDS3QdSEY=
WTnh8wNH0lOxVHty18QZynvOtpcU&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.=
org_g_openembedded-2Dcore_message_170608&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbES=
WNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrv=
Y25Gwyh&amp;s=3D_VWADuvDS3QdSEYWTnh8wNH0lOxVHty18QZynvOtpcU&amp;e=3D</a>=C2=
=A0 <br>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_93654146_1997914&amp;d=3DDwIBaQ&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCog35w=
onZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqKo_I1=
CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_pCDsz7AMbsTgStzC7bt5V2x_E_gIblrtjZY&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_93654146_1997914&amp;d=
=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5w=
gZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4F=
nZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DQncdL2I_pCDsz7AMbsTgStzC7bt5V2=
x_E_gIblrtjZY&amp;e=3D</a>=C2=A0 <br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIBaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DixV5wgZimxpcSCo=
g35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9aEjEfI4R_J4FnZIK8nDBqK=
o_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DPxAE_3yGzbSZ21-LHz_1r3gd2_STPoZcrYDeu9vd=
_GM&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore=
_unsub&amp;d=3DDwIBaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&a=
mp;r=3DixV5wgZimxpcSCog35wonZKeFaeEVKUbESWNj_K-1j0&amp;m=3DKvCRyrKojziBs0h9=
aEjEfI4R_J4FnZIK8nDBqKo_I1CpnrIJ78DBxgMrvY25Gwyh&amp;s=3DPxAE_3yGzbSZ21-LHz=
_1r3gd2_STPoZcrYDeu9vd_GM&amp;e=3D</a>=C2=A0 =C2=A0[<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>
</blockquote></div>

--0000000000001a48ad05e894cf9d--


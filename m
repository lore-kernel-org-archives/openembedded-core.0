Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.16.1614707424965937578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 09:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZkDr006N;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id w9so10208365edt.13
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 09:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lc3W66u4KPk/4Rrhwlz2ACiMLiCGMOk8PdFDafBpUJE=;
        b=ZkDr006NSYVVQvQHP1iYgDkbSYGP37jPrDwoxQwQgcdFv9gYSkMZglBvFLEoGKk5dG
         wPS9ecu95DeUULvuAyFE9r15cw0WLwr5KOgP2a4PnkQAKAalg3Gl6jk2CKg+DUbuWFwa
         8kYPvo7IqnbY+nF6yuH3bmu+wSgr1WckF1bD7Fnn9cH2bETgyD54Wn8s4j6jkbL/2fXz
         vmys+IMKnIZzi7eSvTrou3R5SMbKLMJVaYXt5SYkzIkgjceIqQLICoaLyQ0OdqMlCp6r
         CE3JzyJCLChLE65F5eZ58XTsqoFeCg3EJfgrOHa0oUu8Q0PfV/mRExuuSYmkki6X9crZ
         A1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lc3W66u4KPk/4Rrhwlz2ACiMLiCGMOk8PdFDafBpUJE=;
        b=XJGmNEaMVluVYmRvo7KiyChcj6Bl0cw+XedrLEbYb73N9El7VcE4YO98tlIQublPtM
         +KVGQZUXhv+Y2ApnW8EQsEfkYUZEK0flJNnLNpfaVm5eolV4GhwX7LM50ONa8X2Y9TXj
         J7VjnUjNtr3F2VYEejT2qesmViArosRIPELKuk1gAsj17xqXbJtFkyLC5Uya8bxPiP9v
         Rk9GvPRgzPvyx5EbQYolOva2o5onyRxQjESsXX4MIy3Y+bgmkQQdR6b/giNa5a+fYYog
         TyOEkT1RFpuquMrIzlqg+sd1QlYCplfMruBuFfQviQ9aTR84h49Jz+Vp24dZJ4w/Y5np
         bk8Q==
X-Gm-Message-State: AOAM5302pzQWKVmI17QgAIRFw6uH0wXuFq4Z7BGkqK5MeOHcoTPmcX1V
	q8vWYdff59D7YigMy/vSV+JI0/R9dRKixW9vIds=
X-Google-Smtp-Source: ABdhPJxijf1C1bQGOki8nftos0EJxSjI1hwupkExgeSyiF7/jTh/Q+pB12D+/vpH+On4Leljr9Kge8+fQVQ0yUvIxEg=
X-Received: by 2002:aa7:dd99:: with SMTP id g25mr10751941edv.230.1614707423215;
 Tue, 02 Mar 2021 09:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20210225174516.639740-1-Martin.Jansa@gmail.com>
 <CA+_AqitMGVbVikHDF2bnimSsXSmM0tfeXBCgYjgeSpFYL2FGOA@mail.gmail.com> <CAHNuFGJSuXT3D3bVtDoy_q_ZrzcVxT34Zte_a6RnW==7N8MC_A@mail.gmail.com>
In-Reply-To: <CAHNuFGJSuXT3D3bVtDoy_q_ZrzcVxT34Zte_a6RnW==7N8MC_A@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 2 Mar 2021 18:50:11 +0100
Message-ID: <CA+chaQfDd_wxriRPe2+XFScZi44WUK2Qt0KgVM7vYZS0LR8zRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: replace THISDIR instead of COREBASE in find_meson_cross_files --cross-file paths
To: Geoff Parker <geoffhp@gmail.com>
Cc: Anibal Limon <anibal.limon@linaro.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006082f105bc915e8e"

--0000000000006082f105bc915e8e
Content-Type: text/plain; charset="UTF-8"

Geoff,

the same question for you, what's the value of COREBASE in your build and
what's the value of --cross-file in your glib-2.0 do_configure sstate
signature?

If both of these are valid issues in sstate signatures then fixing your
build configuration is IMHO better than ignoring a warning from bb.warn().
Or at least for this specific case we would need to find some more robust
solution than this string replace.

On Tue, Mar 2, 2021 at 6:43 PM Geoff Parker <geoffhp@gmail.com> wrote:

> Same here. Our build artifacts get created but, I get a few thousand of
> these errors:
>
> ERROR: Cannot add
> '/home/geoff/yocto-tegra/poky/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/arm-64'
> to --cross-file, because it's not relative to THISDIR '/
> home/geoff/yocto-tegra/poky/build-ccu3/../meta/recipes-core/glib-2.0' and
> sstate signature would contain this full path
>
>  Since the bitbake return code is 1 our CI pipeline does not deploy the
> build artifacts.
>
> Would bb.warn() be more appropriate to use for this change than bb.error()?
>
> On Tue, Mar 2, 2021 at 9:14 AM Anibal Limon <anibal.limon@linaro.org>
> wrote:
>
>> This breaks our builds,
>>
>> ...
>> ERROR: Cannot add
>> '/home/builds/oe-rpb-master/layers/openembedded-core/meta/recipes-core/glib-2.0/files/meson.cross.d/common'
>> to --cross-file, because it's not relative to THISDIR
>> '/home/builds/oe-rpb-master/build-410c-2/conf/../../layers/openembedded-core/meta/recipes-core/glib-2.0'
>> and sstate signature would contain this full path
>> ...
>>
>> In,
>>
>>
>> https://ci.linaro.org/job/lt-qcom-openembedded-rpb-master/DISTRO=rpb,MACHINE=dragonboard-410c,label=docker-buster-amd64/470/console
>>
>> Regards,
>> Anibal
>>
>> On Thu, 25 Feb 2021 at 11:45, Martin Jansa <Martin.Jansa@gmail.com>
>> wrote:
>>
>>> * COREBASE works correctly only as long as this recipe is inside of
>>>   COREBASE directory and leaves the full absolute paths if you copy
>>>   this recipe into your own layer (e.g. to backport newer version)
>>>
>>> * use THISDIR as all FILESPATH should be relative to that, unless
>>>   there is a .bbappend not only extending FILESPATH, but also adding
>>>   meson.cross.d files there (at which point it also didn't work with
>>>   COREBASE replacements as well already) - show an ERROR in such case,
>>>   I don't think it's common scenario to spend more time to support that.
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>> b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>> index 15e9dbaf6f..882a89da7a 100644
>>> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>> @@ -31,7 +31,7 @@ def find_meson_cross_files(d):
>>>      if bb.data.inherits_class('native', d):
>>>          return ""
>>>
>>> -    corebase = d.getVar("COREBASE")
>>> +    thisdir = d.getVar("THISDIR")
>>>      import collections
>>>      sitedata = siteinfo_data(d)
>>>      # filename -> found
>>> @@ -39,7 +39,11 @@ def find_meson_cross_files(d):
>>>      for path in d.getVar("FILESPATH").split(":"):
>>>          for element in sitedata:
>>>              filename = os.path.normpath(os.path.join(path,
>>> "meson.cross.d", element))
>>> -            files[filename.replace(corebase, "${COREBASE}")] =
>>> os.path.exists(filename)
>>> +            sanitized_path = filename.replace(thisdir, "${THISDIR}")
>>> +            if sanitized_path == filename:
>>> +                bb.error("Cannot add '%s' to --cross-file, because it's
>>> not relative to THISDIR '%s' and sstate signature would contain this full
>>> path" % (filename, thisdir))
>>> +                continue
>>> +            files[filename.replace(thisdir, "${THISDIR}")] =
>>> os.path.exists(filename)
>>>
>>>      items = ["--cross-file=" + k for k,v in files.items() if v]
>>>      d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
>>> --
>>> 2.27.0
>>>
>>>
>>>
>>>
>>>
>> 
>>
>>

--0000000000006082f105bc915e8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Geoff,<div><br></div><div>the same question for you, what&=
#39;s the value of COREBASE in your build and what&#39;s the value of --cro=
ss-file in your glib-2.0 do_configure sstate signature?</div><div><br></div=
><div>If both of these are valid issues in sstate signatures then fixing yo=
ur build configuration is IMHO better than ignoring a warning from bb.warn(=
). Or at least for this specific case we would need to find some more robus=
t solution than this string replace.</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 6:43 PM Ge=
off Parker &lt;<a href=3D"mailto:geoffhp@gmail.com">geoffhp@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr">Same here. Our build artifacts get created but, I get a few thou=
sand of these errors:<br><br><span style=3D"font-family:monospace"><span st=
yle=3D"font-weight:bold;color:rgb(255,84,84)">ERROR</span><span style=3D"co=
lor:rgb(0,0,0)">: </span><span style=3D"color:rgb(178,24,24)">Cannot add &#=
39;/home/geoff/yocto-tegra/poky/meta/recipes-core/glib-2.0/glib-2.0/meson.c=
ross.d/arm-64&#39; to --cross-file, because it&#39;s not relative to THISDI=
R &#39;/</span><br>home/geoff/yocto-tegra/poky/build-ccu3/../meta/recipes-c=
ore/glib-2.0&#39; and sstate signature would contain this full path =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br></span><br>=C2=A0Since the bitbake retur=
n code is 1 our CI pipeline=C2=A0does not deploy the build artifacts.=C2=A0=
=
=C2=A0<br><br>Would bb.warn() be more appropriate to use for this change t=
han bb.error()?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 2, 2021 at 9:14 AM Anibal Limon &lt;<a href=3D=
"mailto:anibal.limon@linaro.org" target=3D"_blank">anibal.limon@linaro.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr">This breaks our builds,<div><br></div><div>...</div><div>ER=
ROR: Cannot add &#39;/home/builds/oe-rpb-master/layers/openembedded-core/me=
ta/recipes-core/glib-2.0/files/meson.cross.d/common&#39; to --cross-file, b=
ecause it&#39;s not relative to THISDIR &#39;/home/builds/oe-rpb-master/bui=
ld-410c-2/conf/../../layers/openembedded-core/meta/recipes-core/glib-2.0&#3=
9; and sstate signature would contain this full path<br></div><div>...</div=
><div><br></div><div>In,</div><div><br></div><div><a href=3D"https://ci.lin=
aro.org/job/lt-qcom-openembedded-rpb-master/DISTRO=3Drpb,MACHINE=3Ddragonbo=
ard-410c,label=3Ddocker-buster-amd64/470/console" target=3D"_blank">https:/=
/ci.linaro.org/job/lt-qcom-openembedded-rpb-master/DISTRO=3Drpb,MACHINE=3Dd=
ragonboard-410c,label=3Ddocker-buster-amd64/470/console</a><br></div><div><=
br></div><div>Regards,</div><div>Anibal</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Feb 2021 at 11:45, =
Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank=
">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">* COREBASE works correctly only as long as this rec=
ipe is inside of<br>
=C2=A0 COREBASE directory and leaves the full absolute paths if you copy<b=
r>
=C2=A0 this recipe into your own layer (e.g. to backport newer version)<br=
>
<br>
* use THISDIR as all FILESPATH should be relative to that, unless<br>
=C2=A0 there is a .bbappend not only extending FILESPATH, but also adding<=
br>
=C2=A0 meson.cross.d files there (at which point it also didn&#39;t work w=
ith<br>
=C2=A0 COREBASE replacements as well already) - show an ERROR in such case=
,<br>
=C2=A0 I don&#39;t think it&#39;s common scenario to spend more time to su=
pport that.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a> | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.=
bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a> b/meta/reci=
pes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=3D"noreferrer" =
target=3D"_blank">glib-2.0_2.66.7.bb</a><br>
index 15e9dbaf6f..882a89da7a 100644<br>
--- a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a><br>
+++ b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a><br>
@@ -31,7 +31,7 @@ def find_meson_cross_files(d):<br>
=C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#39;native&#39;, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 corebase =3D d.getVar(&quot;COREBASE&quot;)<br>
+=C2=A0 =C2=A0 thisdir =3D d.getVar(&quot;THISDIR&quot;)<br>
=C2=A0 =C2=A0 =C2=A0import collections<br>
=C2=A0 =C2=A0 =C2=A0sitedata =3D siteinfo_data(d)<br>
=C2=A0 =C2=A0 =C2=A0# filename -&gt; found<br>
@@ -39,7 +39,11 @@ def find_meson_cross_files(d):<br>
=C2=A0 =C2=A0 =C2=A0for path in d.getVar(&quot;FILESPATH&quot;).split(&quo=
t;:&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for element in sitedata:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename =3D os.path.normp=
ath(os.path.join(path, &quot;meson.cross.d&quot;, element))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files[filename.replace(corebase=
, &quot;${COREBASE}&quot;)] =3D os.path.exists(filename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sanitized_path =3D filename.rep=
lace(thisdir, &quot;${THISDIR}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sanitized_path =3D=3D filena=
me:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;Ca=
nnot add &#39;%s&#39; to --cross-file, because it&#39;s not relative to THI=
SDIR &#39;%s&#39; and sstate signature would contain this full path&quot; %=
 (filename, thisdir))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files[filename.replace(thisdir,=
 &quot;${THISDIR}&quot;)] =3D os.path.exists(filename)<br>
<br>
=C2=A0 =C2=A0 =C2=A0items =3D [&quot;--cross-file=3D&quot; + k for k,v in =
files.items() if v]<br>
=C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;EXTRA_OEMESON&quot;, &quot; &quot; +=
 &quot; &quot;.join(items))<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>

--0000000000006082f105bc915e8e--

Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.516.1614711647656028059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 11:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cDqjMHVj;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: anibal.limon@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id o2so3316077wme.5
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 11:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2PuuaUEZwkn/QY+g0XGZfgA69iTmQnbj8kq/U82nyMc=;
        b=cDqjMHVj+qpfEs0VLlOhqwi3NNI6d12ep8u3jV8aNlOEQR1HKnq/Cdv1pe7gyS+t+C
         JaM//uX5wa5fODazaf7mHF0lRDq/IVcdcCFuD6leOmmLNQ1Y/CPU61LlT3fuM+QPrB2+
         3aQVvfQjmk0g2UTQLasp7DXmuRup6h3HfW/0X/1JuOzb3BulpfHtux+6MBtQC1UwuUn+
         WQVfESayugvJJxjCB4i7TVDzdLXtpWIrDHbRmn6stUzQqO/92yrt7aHF2yIIu1Gtqbh5
         wDn3EePL6AnDADRSWdvUCjtxQKx0L78Yo8r1WqJev3JKNt7tutFjpTcGlQY28uz3Taq9
         qzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2PuuaUEZwkn/QY+g0XGZfgA69iTmQnbj8kq/U82nyMc=;
        b=qJMUGWFbrsByuuQ4olulj9GE0q4rSt+4awI+H6RHWeJP60cwK8you4F7S2jincVG/8
         0AeUVpWJrlEp77TfXvdPvhillOqICExDmrTU4rxuy4J/eFoQU7nh44qPw4cp2qNOfDnf
         zjVB4dZYW2Afg4PRN7m1yeRxmYLj29Xb3Qai83gouN5DFDu/trcpprboNJTr/Kvq3nYL
         U8/dqVjlbgkIf8oY2ana6NhCXB9Eu6Ab8TaYQV0FHcFAlE46+x5FBteI52VSglvyY475
         ouI5HfDTCuASfqKr8ghBkhg64aEcMKX8B9i3RqlI2gKLdH0m6rkP1BU8pcJ7gDHm8kU5
         vPkg==
X-Gm-Message-State: AOAM531VIEtjinvqp8mJi1re+7Gr6ynyrhfWm4JkJHOjYDmPYS11FNMt
	fHU2B/KjVWYvR4DPCIsSjeBWd4+MGjW8t6wXSBxOJA==
X-Google-Smtp-Source: ABdhPJw4H6BuhMS97i0OZ8mwwbbR/120A8evs20gg8mEXiaM/v28XnoV9Cgi57NVrnTWlmbzXaG4ZfmceJptjrqnX7c=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr5442785wmj.76.1614711645868;
 Tue, 02 Mar 2021 11:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20210225174516.639740-1-Martin.Jansa@gmail.com>
 <CA+_AqitMGVbVikHDF2bnimSsXSmM0tfeXBCgYjgeSpFYL2FGOA@mail.gmail.com> <CA+chaQevEWE=RaqQzXfGOaQVCSw1Jf814EQF+-Cdx4X46xO1Fg@mail.gmail.com>
In-Reply-To: <CA+chaQevEWE=RaqQzXfGOaQVCSw1Jf814EQF+-Cdx4X46xO1Fg@mail.gmail.com>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Tue, 2 Mar 2021 13:00:34 -0600
Message-ID: <CA+_Aqiu_CEOXFCeixDjPU4Wd0qrDS4DRoTGuFb4ccH-qJV0g=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: replace THISDIR instead of COREBASE in find_meson_cross_files --cross-file paths
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000011271505bc925a92"

--00000000000011271505bc925a92
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Mar 2021 at 11:32, Martin Jansa <martin.jansa@gmail.com> wrote:

> what's the value of COREBASE in that build? Wasn't full path already in
> your sstate signatures - in that case this change didn't break your builds,
> just highlighted an issue in your builds which was already there.
>
> Our COREBASE is,

  COREBASE="/home/builds/oe-rpb-master/layers/openembedded-core"

Expands as follows,

...
# $COREBASE [3 operations]
#   set
/home/builds/oe-rpb-master/build-845c/conf/../../layers/openembedded-core/meta/conf/layer.conf:20
#     "${@os.path.normpath("${LAYERDIR}/../")}"
#   set data_smart.py:931 [expandVarref]
#
"${@os.path.normpath("/home/builds/oe-rpb-master/build-845c/conf/../../layers/openembedded-core/meta/../")}"
#   set
/home/builds/oe-rpb-master/build-845c/conf/../../layers/openembedded-core/meta/conf/documentation.conf:124
#     [doc] "Specifies the parent directory of the OpenEmbedded Core
Metadata layer (i.e. meta)."
# pre-expansion value:
#
"${@os.path.normpath("/home/builds/oe-rpb-master/build-845c/conf/../../layers/openembedded-core/meta/../")}"
COREBASE="/home/builds/oe-rpb-master/layers/openembedded-core"
...


> We can fix that by calling os.path.normpath on THISDIR, but I would like
> to know the reason why THISDIR is set this way for you (also to reproduce
> it locally to verify the fix).
>

I tried it and fixes the issue,

-    thisdir = d.getVar("THISDIR")
+    thisdir = os.path.normpath(d.getVar("THISDIR"))

We use the next config files for bblayers and local.conf,

https://github.com/96boards/oe-rpb-manifest/tree/qcom/master/conf

Regards,
Anibal


>
>
>
> On Tue, Mar 2, 2021 at 6:14 PM Anibal Limon <anibal.limon@linaro.org>
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

--00000000000011271505bc925a92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 2 Mar 2021 at 11:32, Martin J=
ansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr">what&#39;s the value of COREBASE in that build? Wasn&#39;t f=
ull path already in your sstate signatures - in that case this change didn&=
#39;t break your builds, just highlighted an issue in your builds which was=
 already there.<div><br></div></div></blockquote><div>Our COREBASE is,</div=
><div><br></div><div>=C2=A0 COREBASE=3D&quot;/home/builds/oe-rpb-master/lay=
ers/openembedded-core&quot;=C2=A0</div><div><br></div><div>Expands as follo=
ws,</div><div><br></div><div>...</div><div># $COREBASE [3 operations]<br># =
=
=C2=A0 set /home/builds/oe-rpb-master/build-845c/conf/../../layers/openemb=
edded-core/meta/conf/layer.conf:20<br># =C2=A0 =C2=A0 &quot;${@os.path.norm=
path(&quot;${LAYERDIR}/../&quot;)}&quot;<br># =C2=A0 set data_smart.py:931 =
[expandVarref]<br># =C2=A0 =C2=A0 &quot;${@os.path.normpath(&quot;/home/bui=
lds/oe-rpb-master/build-845c/conf/../../layers/openembedded-core/meta/../&q=
uot;)}&quot;<br># =C2=A0 set /home/builds/oe-rpb-master/build-845c/conf/../=
../layers/openembedded-core/meta/conf/documentation.conf:124<br># =C2=A0 =
=C2=A0 [doc] &quot;Specifies the parent directory of the OpenEmbedded Core=
 Metadata layer (i.e. meta).&quot;<br># pre-expansion value:<br># =C2=A0 &q=
uot;${@os.path.normpath(&quot;/home/builds/oe-rpb-master/build-845c/conf/..=
/../layers/openembedded-core/meta/../&quot;)}&quot;<br>COREBASE=3D&quot;/ho=
me/builds/oe-rpb-master/layers/openembedded-core&quot;<br></div><div>...</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div></div><div>We can fix that by calling=C2=A0os.path.normpat=
h on THISDIR, but I would like to know the reason why THISDIR is set this w=
ay for you (also to reproduce it locally to verify the fix).</div></div></b=
lockquote><div><br></div><div>I tried it and fixes the issue,</div><div><br=
></div><div>- =C2=A0 =C2=A0thisdir =3D d.getVar(&quot;THISDIR&quot;)<br>+ =
=C2=A0 =C2=A0thisdir =3D os.path.normpath(d.getVar(&quot;THISDIR&quot;))<b=
r></div><div><br></div><div>We use the next config files for bblayers and l=
ocal.conf,</div><div><br></div><div><a href=3D"https://github.com/96boards/=
oe-rpb-manifest/tree/qcom/master/conf">https://github.com/96boards/oe-rpb-m=
anifest/tree/qcom/master/conf</a><br></div><div><br></div><div>Regards,</di=
v><div>Anibal</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div><br></div><div><br></div><div><br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Mar 2, 2021 at 6:14 PM Anibal Limon &lt;<a href=3D"mailto:anibal.lim=
on@linaro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Th=
is breaks our builds,<div><br></div><div>...</div><div>ERROR: Cannot add &#=
39;/home/builds/oe-rpb-master/layers/openembedded-core/meta/recipes-core/gl=
ib-2.0/files/meson.cross.d/common&#39; to --cross-file, because it&#39;s no=
t relative to THISDIR &#39;/home/builds/oe-rpb-master/build-410c-2/conf/../=
../layers/openembedded-core/meta/recipes-core/glib-2.0&#39; and sstate sign=
ature would contain this full path<br></div><div>...</div><div><br></div><d=
iv>In,</div><div><br></div><div><a href=3D"https://ci.linaro.org/job/lt-qco=
m-openembedded-rpb-master/DISTRO=3Drpb,MACHINE=3Ddragonboard-410c,label=3Dd=
ocker-buster-amd64/470/console" target=3D"_blank">https://ci.linaro.org/job=
/lt-qcom-openembedded-rpb-master/DISTRO=3Drpb,MACHINE=3Ddragonboard-410c,la=
bel=3Ddocker-buster-amd64/470/console</a><br></div><div><br></div><div>Rega=
rds,</div><div>Anibal</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, 25 Feb 2021 at 11:45, Martin Jansa &lt;<=
a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">* COREBASE works correctly only as long as this recipe is inside of<b=
r>
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
</blockquote></div>
</blockquote></div></div>

--00000000000011271505bc925a92--

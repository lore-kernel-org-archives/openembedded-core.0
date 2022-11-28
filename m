Return-Path: <vishal.bhoj@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8521EC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 13:59:50 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.118260.1669643981297565452
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 05:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LIQHl73b;
 spf=pass (domain: linaro.org, ip: 209.85.166.49, mailfrom: vishal.bhoj@linaro.org)
Received: by mail-io1-f49.google.com with SMTP id i85so7605857ioa.5
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 05:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1C2/QzpgSQ8RsFowNwhGN05j8w3blnyQO3BEKNhhlQ=;
        b=LIQHl73b4QJ6EBhKSyapyJh+Pd+4u993eqFFcj11+GwgeKvQgBGkQNLFoWlt7PzJEh
         utvCHVl+S06qwwSco0n/76EnWQQPmGjwsUoPTfqWgWyt+nMdoA9lUG3kU7zY96BT+HFj
         xEwLx7MCxeGI8kSpwMwFYBUdnzSHUJ/NcaZ1TPCZVJ7S9fjNpR5fT6jkFTbLhfTEiiTe
         TWcwafeCwIu34ubAaeXcQuC66jWWuyo3xGG9KykqncCu1/wGlNLNqdNSStSJQQVBfgXX
         oh9MqtjSwVwvbNY6adtkS0+aKy3d8pj6KwUbd8VzryetMp6l5ePX9tMViGPlex8gVHYq
         3Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1C2/QzpgSQ8RsFowNwhGN05j8w3blnyQO3BEKNhhlQ=;
        b=IfChliwtBGKNhRwGrQNugSU0W806ScyKbkRfvw5rrfdoy+XdxW3BSoiMxR7pUuy/+u
         xETMQUBvCuPX5fCKGUpuaF9b4hXJnzN5RJvKQ19TCb+QLzAefH0Naity+3y8YVfDREwF
         D//EFJnzbNdJufGDSuO+y9SqZ5qEOs6B6dRnX9gTXjgHz35RUO+TWalZFi4IgKQHI0ad
         HrmmpGv6Bv68nfiqr0ZdeX7LBp0yEkfLpi5JQ+9gZutnPtpnF4PZwL0J6hjRxVp/b7hX
         DIiWhSFYROQruB3QOkrM55/ROQ8YJzjh9T8NFgIN5kevYRsUekGGTJ8iWzvRYv8Tujgg
         6+LA==
X-Gm-Message-State: ANoB5pllPqqk1od8l7rj6+xRLJUSALsEc8dVguenaQkzl422MBMvQaQt
	NEtGYGHMhQ9Z70mkZDAukKMwd0F10UOM0R7KsaqTdVCdyFs/Rg==
X-Google-Smtp-Source: AA0mqf5ScRo6oHAG3fDnwlleuTgBciy983izpVwoRyFmAaPYC/3RrCVsh+kCg8ESeTAlgJNwg8kJ/Oh8/cOPykQiqWg=
X-Received: by 2002:a05:6638:4410:b0:363:aec1:9a04 with SMTP id
 bp16-20020a056638441000b00363aec19a04mr24081238jab.78.1669643980437; Mon, 28
 Nov 2022 05:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20221127213640.539995-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20221127213640.539995-1-richard.purdie@linuxfoundation.org>
From: Vishal Bhoj <vishal.bhoj@linaro.org>
Date: Mon, 28 Nov 2022 19:29:29 +0530
Message-ID: <CAKdWgSw2tZ68R531RZgi2bqLrdOXkc1oZnxM_rEugv7S-ysOUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC] base: Switch to use addpylib directive
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005b1d7405ee8848c8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 13:59:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173917

--0000000000005b1d7405ee8848c8
Content-Type: text/plain; charset="UTF-8"

Hi,

I get the below backtrace with this patch on master-next. The same patchset
works fine on debian-11. Are there any specific versions of packages that
need to be installed as  dependency ?

Tested on host os: ubuntu-18.04/ubuntu-20.04

tuxbake@b8b6586bfb2c:/source/source/poky/build$ bitbake -e
ERROR: Error parsing configuration files
Traceback (most recent call last):
  File "/source/source/poky/bitbake/lib/bb/cookerdata.py", line 187, in
parse_config_file(fn='/source/source/poky/meta/conf/layer.conf',
data=<bb.data_smart.DataSmart object at 0x7f020867e250>, include=True):
     def parse_config_file(fn, data, include=True):
    >    return bb.parse.handle(fn, data, include)

  File "/source/source/poky/bitbake/lib/bb/parse/__init__.py", line 107, in
handle(fn='/source/source/poky/meta/conf/layer.conf',
data=<bb.data_smart.DataSmart object at 0x7f020867e250>, include=True):
                 with data.inchistory.include(fn):
    >                return h['handle'](fn, data, include)
         raise ParseError("not a BitBake file", fn)
  File "/source/source/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py",
line 152, in handle(fn='/source/source/poky/meta/conf/layer.conf',
data=<bb.data_smart.DataSmart object at 0x7f020867e250>, include=True):
         data.setVar('FILE', abs_fn)
    >    statements.eval(data)
         if oldfile:
  File "/source/source/poky/bitbake/lib/bb/parse/ast.py", line 21, in
StatementGroup.eval(data=<bb.data_smart.DataSmart object at
0x7f020867e250>):
             for statement in self:
    >            statement.eval(data)

  File "/source/source/poky/bitbake/lib/bb/parse/ast.py", line 324, in
PyLibNode.eval(data=<bb.data_smart.DataSmart object at 0x7f020867e250>):
                             bb.codeparser.modulecode_deps[entry][2] |=
bb.codeparser.modulecode_deps[dup][2]
    >                        bb.codeparser.modulecode_deps[entry][3] |=
bb.codeparser.modulecode_deps[dup][3]

TypeError: unsupported operand type(s) for |=: 'dict' and 'dict'



On Mon, 28 Nov 2022 at 03:06, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Since bitbake now supports an official method to inject python modules,
> switch to it.
>
> Anyone using OE_EXTRA_IMPORTS will need to adjust their code accordingly,
> probably switching to their own module namespace.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> [This patch is an RFC as part of a series on the bitbake-devel list]
>
>  meta/classes-global/base.bbclass | 23 -----------------------
>  meta/conf/layer.conf             |  2 ++
>  meta/lib/oe/__init__.py          |  4 ++++
>  3 files changed, 6 insertions(+), 23 deletions(-)
>
> diff --git a/meta/classes-global/base.bbclass
> b/meta/classes-global/base.bbclass
> index c81aa51ef3f..c4ac43c5696 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -15,31 +15,8 @@ inherit utils
>  inherit utility-tasks
>  inherit logging
>
> -OE_EXTRA_IMPORTS ?= ""
> -
> -OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package
> oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa
> oe.reproducible oe.rust oe.buildcfg ${OE_EXTRA_IMPORTS}"
> -OE_IMPORTS[type] = "list"
> -
>  PACKAGECONFIG_CONFARGS ??= ""
>
> -def oe_import(d):
> -    import sys
> -
> -    bbpath = [os.path.join(dir, "lib") for dir in
> d.getVar("BBPATH").split(":")]
> -    sys.path[0:0] = [dir for dir in bbpath if dir not in sys.path]
> -
> -    import oe.data
> -    for toimport in oe.data.typed_value("OE_IMPORTS", d):
> -        try:
> -            # Make a python object accessible from the metadata
> -            bb.utils._context[toimport.split(".", 1)[0]] =
> __import__(toimport)
> -        except AttributeError as e:
> -            bb.error("Error importing OE modules: %s" % str(e))
> -    return ""
> -
> -# We need the oe module name space early (before INHERITs get added)
> -OE_IMPORTED := "${@oe_import(d)}"
> -
>  inherit metadata_scm
>
>  def lsb_distro_identifier(d):
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 0ce90355baf..0fe05beebf0 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -125,3 +125,5 @@ SSTATE_EXCLUDEDEPS_SYSROOT +=
> ".*->autoconf-archive-native"
>  # Avoid empty path entries
>  BITBAKEPATH :=
> "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
>  PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' != '' else
> ''}${HOSTTOOLS_DIR}"
> +
> +addpylib ${LAYERDIR}/lib oe
> diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
> index 92f002d8726..9166420b00e 100644
> --- a/meta/lib/oe/__init__.py
> +++ b/meta/lib/oe/__init__.py
> @@ -6,3 +6,7 @@
>
>  from pkgutil import extend_path
>  __path__ = extend_path(__path__, __name__)
> +
> +BBIMPORTS = ["os", "sys", "time", "oe.data", "oe.path", "oe.utils",
> "oe.types", "oe.package", \
> +             "oe.packagegroup", "oe.sstatesig", "oe.lsb",
> "oe.cachedpath", "oe.license", \
> +             "oe.qa", "oe.reproducible", "oe.rust", "oe.buildcfg"]
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173885):
> https://lists.openembedded.org/g/openembedded-core/message/173885
> Mute This Topic: https://lists.openembedded.org/mt/95297771/3616781
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vishal.bhoj@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005b1d7405ee8848c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I get the below backtrace with this=
 patch on master-next. The same patchset works fine on debian-11. Are there=
 any specific versions of packages that need to be installed as=C2=A0=C2=A0=
dependency=C2=A0?</div><div><br></div><div>Tested on host os: ubuntu-18.04/=
ubuntu-20.04</div><div><br></div><div><span style=3D"font-family:&quot;comi=
c sans ms&quot;,sans-serif">tuxbake@b8b6586bfb2c:/source/source/poky/build$=
 bitbake -e</span><br></div><div><font face=3D"comic sans ms, sans-serif">E=
RROR: Error parsing configuration files<br>Traceback (most recent call last=
):<br>=C2=A0 File &quot;/source/source/poky/bitbake/lib/bb/cookerdata.py&qu=
ot;, line 187, in parse_config_file(fn=3D&#39;/source/source/poky/meta/conf=
/layer.conf&#39;, data=3D&lt;bb.data_smart.DataSmart object at 0x7f020867e2=
50&gt;, include=3DTrue):<br>=C2=A0 =C2=A0 =C2=A0def parse_config_file(fn, d=
ata, include=3DTrue):<br>=C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0return bb.parse.ha=
ndle(fn, data, include)<br><br>=C2=A0 File &quot;/source/source/poky/bitbak=
e/lib/bb/parse/__init__.py&quot;, line 107, in handle(fn=3D&#39;/source/sou=
rce/poky/meta/conf/layer.conf&#39;, data=3D&lt;bb.data_smart.DataSmart obje=
ct at 0x7f020867e250&gt;, include=3DTrue):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with data.inchistory.include(fn):<br>=C2=
=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn h[&#39;handle&#39;](fn, data, include)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0raise ParseError(&quot;not a BitBake file&quot;, fn)<br>=C2=A0 File &=
quot;/source/source/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py&quot;=
, line 152, in handle(fn=3D&#39;/source/source/poky/meta/conf/layer.conf&#3=
9;, data=3D&lt;bb.data_smart.DataSmart object at 0x7f020867e250&gt;, includ=
e=3DTrue):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data.setVar(&#39;FILE&#39;,=
 abs_fn)<br>=C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0statements.eval(data)<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0if oldfile:<br>=C2=A0 File &quot;/source/source=
/poky/bitbake/lib/bb/parse/ast.py&quot;, line 21, in StatementGroup.eval(da=
ta=3D&lt;bb.data_smart.DataSmart object at 0x7f020867e250&gt;):<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for statement in self:<br>=C2=A0 =
=C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0statement.eval(data)<b=
r><br>=C2=A0 File &quot;/source/source/poky/bitbake/lib/bb/parse/ast.py&quo=
t;, line 324, in PyLibNode.eval(data=3D&lt;bb.data_smart.DataSmart object a=
t 0x7f020867e250&gt;):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.codeparser.module=
code_deps[entry][2] |=3D bb.codeparser.modulecode_deps[dup][2]<br>=C2=A0 =
=C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bb.codeparser.modulecode_deps[entry][3] |=3D bb.codepar=
ser.modulecode_deps[dup][3]<br><br>TypeError: unsupported operand type(s) f=
or |=3D: &#39;dict&#39; and &#39;dict&#39;</font><br></div><div><font face=
=3D"comic sans ms, sans-serif"><br></font></div><div><font face=3D"comic sa=
ns ms, sans-serif"><br></font></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, 28 Nov 2022 at 03:06, Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Since bitbake now supports an official method to inj=
ect python modules,<br>
switch to it.<br>
<br>
Anyone using OE_EXTRA_IMPORTS will need to adjust their code accordingly,<b=
r>
probably switching to their own module namespace.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
[This patch is an RFC as part of a series on the bitbake-devel list]<br>
<br>
=C2=A0meta/classes-global/base.bbclass | 23 -----------------------<br>
=C2=A0meta/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 ++<br>
=C2=A0meta/lib/oe/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +=
+++<br>
=C2=A03 files changed, 6 insertions(+), 23 deletions(-)<br>
<br>
diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bb=
class<br>
index c81aa51ef3f..c4ac43c5696 100644<br>
--- a/meta/classes-global/base.bbclass<br>
+++ b/meta/classes-global/base.bbclass<br>
@@ -15,31 +15,8 @@ inherit utils<br>
=C2=A0inherit utility-tasks<br>
=C2=A0inherit logging<br>
<br>
-OE_EXTRA_IMPORTS ?=3D &quot;&quot;<br>
-<br>
-OE_IMPORTS +=3D &quot;os sys time oe.path oe.utils oe.types oe.package oe.=
packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license <a href=3D"http:/=
/oe.qa" rel=3D"noreferrer" target=3D"_blank">oe.qa</a> oe.reproducible oe.r=
ust oe.buildcfg ${OE_EXTRA_IMPORTS}&quot;<br>
-OE_IMPORTS[type] =3D &quot;list&quot;<br>
-<br>
=C2=A0PACKAGECONFIG_CONFARGS ??=3D &quot;&quot;<br>
<br>
-def oe_import(d):<br>
-=C2=A0 =C2=A0 import sys<br>
-<br>
-=C2=A0 =C2=A0 bbpath =3D [os.path.join(dir, &quot;lib&quot;) for dir in d.=
getVar(&quot;BBPATH&quot;).split(&quot;:&quot;)]<br>
-=C2=A0 =C2=A0 sys.path[0:0] =3D [dir for dir in bbpath if dir not in sys.p=
ath]<br>
-<br>
-=C2=A0 =C2=A0 import oe.data<br>
-=C2=A0 =C2=A0 for toimport in oe.data.typed_value(&quot;OE_IMPORTS&quot;, =
d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Make a python object accessibl=
e from the metadata<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils._context[toimport.split=
(&quot;.&quot;, 1)[0]] =3D __import__(toimport)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except AttributeError as e:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;Error importing O=
E modules: %s&quot; % str(e))<br>
-=C2=A0 =C2=A0 return &quot;&quot;<br>
-<br>
-# We need the oe module name space early (before INHERITs get added)<br>
-OE_IMPORTED :=3D &quot;${@oe_import(d)}&quot;<br>
-<br>
=C2=A0inherit metadata_scm<br>
<br>
=C2=A0def lsb_distro_identifier(d):<br>
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<br>
index 0ce90355baf..0fe05beebf0 100644<br>
--- a/meta/conf/layer.conf<br>
+++ b/meta/conf/layer.conf<br>
@@ -125,3 +125,5 @@ SSTATE_EXCLUDEDEPS_SYSROOT +=3D &quot;.*-&gt;autoconf-a=
rchive-native&quot;<br>
=C2=A0# Avoid empty path entries<br>
=C2=A0BITBAKEPATH :=3D &quot;${@os.path.dirname(bb.utils.which(d.getVar(&#3=
9;PATH&#39;),&#39;bitbake&#39;))}&quot;<br>
=C2=A0PATH :=3D &quot;${@&#39;${BITBAKEPATH}:&#39; if &#39;${BITBAKEPATH}&#=
39; !=3D &#39;&#39; else &#39;&#39;}${HOSTTOOLS_DIR}&quot;<br>
+<br>
+addpylib ${LAYERDIR}/lib oe<br>
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py<br>
index 92f002d8726..9166420b00e 100644<br>
--- a/meta/lib/oe/__init__.py<br>
+++ b/meta/lib/oe/__init__.py<br>
@@ -6,3 +6,7 @@<br>
<br>
=C2=A0from pkgutil import extend_path<br>
=C2=A0__path__ =3D extend_path(__path__, __name__)<br>
+<br>
+BBIMPORTS =3D [&quot;os&quot;, &quot;sys&quot;, &quot;time&quot;, &quot;oe=
.data&quot;, &quot;oe.path&quot;, &quot;oe.utils&quot;, &quot;oe.types&quot=
;, &quot;oe.package&quot;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;oe.packagegroup&quot=
;, &quot;oe.sstatesig&quot;, &quot;oe.lsb&quot;, &quot;oe.cachedpath&quot;,=
 &quot;oe.license&quot;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://oe=
.qa" rel=3D"noreferrer" target=3D"_blank">oe.qa</a>&quot;, &quot;oe.reprodu=
cible&quot;, &quot;oe.rust&quot;, &quot;oe.buildcfg&quot;]<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173885): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173885" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173885</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95297771/3616=
781" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95297771/3616781</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vishal.bhoj@linaro.org" ta=
rget=3D"_blank">vishal.bhoj@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005b1d7405ee8848c8--


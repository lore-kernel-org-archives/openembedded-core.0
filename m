Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC7CC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:38:55 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.8371.1646408334497306203
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QqQ4WnZ6;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: ticotimo@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id v128so4653093vsb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JCpFFlboHCW7Su9Bd0Ffmr18vIKRG9Els7QwEaLZJms=;
        b=QqQ4WnZ6KDn2DYrZP/5vajyOCy8tm1sE4a58X0kRhkri3MikdtfsFC6A7KSHfS84u4
         sPghMTMDAro6jXpvkKY23L3f8lJq5lkwxahSJ42rzduidC831dMmMkFPaRNJrTpzlt5T
         MdL7uBsJGLnA5E5rzNyNHcgxSh1rzsmYNx/5RObX/I+eLwXprY70n+Z3rD+oFUXm7tMj
         BFcVpEQ6EI6HqIFZ+IVWIisbgvhZ5mWZmccdlU0y9Jrsl+SSvyfyQMH3TizlJitZy+XB
         7bP75xRXGFxIL2EVHJke2ViPN/g6fl/Zz6Pf9UUk3L48u4P7mMuV5nz2WlRcvcyiSqxN
         TP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JCpFFlboHCW7Su9Bd0Ffmr18vIKRG9Els7QwEaLZJms=;
        b=sHMEf4cLc+yf11nvFdN4BipAEdB7Rb3cY262w1tMaWMQXqfzzzbJ0m6BFqTxMt3GIl
         LDLkrd2/R5tkz0OYGm1fmcBlh70spdxecT87KAkbfmEo4h1q5h7eh7q9SCPMTTdDYsPo
         DoBG1iqeaxOhjZesgUH3nlt+TzNPczd9dTGf5dVlAsWtwNx4Nqj53ZCeYsv4p6x0ImcG
         Nt8AKz62vhMtjmQNkF4n7k/sfMeNe7De3b2Yp0jSlBkQhbamZP/2BsQCg0wl8JHB23RR
         w5KzfG6on/v9AQE/s8KsglW7lTKcjGaku7IJnz0vU1vjxgkMNFZvh/HrRBvhaA2z1bHm
         V3zA==
X-Gm-Message-State: AOAM531lYJNoam0HOMS0jiMV65oCj2I3XTl3lVXugigMiMqcXFClHkSK
	ijJMQPqgIkc0deFWjvyWJxDPRRnhqLuD5p6w52o=
X-Google-Smtp-Source: 
 ABdhPJza1PW4bsQzlUMYr9M+eV4r1lSVm7+DFiEe7flstqnb7bvUJM9o9PL03pmsfGhe1nv619otYLY93M4oYlAij08=
X-Received: by 2002:a05:6102:50aa:b0:31e:6398:3421 with SMTP id
 bl42-20020a05610250aa00b0031e63983421mr14765744vsb.50.1646408333361; Fri, 04
 Mar 2022 07:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20220303204410.1206736-1-tim.orling@konsulko.com>
 <DM5PR1101MB2361057C36BEA31A214B9B96B9059@DM5PR1101MB2361.namprd11.prod.outlook.com>
In-Reply-To: 
 <DM5PR1101MB2361057C36BEA31A214B9B96B9059@DM5PR1101MB2361.namprd11.prod.outlook.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 4 Mar 2022 07:38:42 -0800
Message-ID: 
 <CANx9H-DS5JWz-=j9LCDX8AZ7qRogvp1EwpGxuqJKFN+JqOw+Cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-importlib-metadata: upgrade 4.10.1
 -> 4.11.2
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: Tim Orling <tim.orling@konsulko.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dd84c805d9664f90"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:38:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162738

--000000000000dd84c805d9664f90
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 2:13 AM Lee Chee Yang <chee.yang.lee@intel.com>
wrote:

> Error while do_compile
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3190/steps/11/logs/stdio
>
>
I just have missed committing a local change.

>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Tim Orling
> > Sent: Friday, March 4, 2022 4:44 AM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Tim Orling <tim.orling@konsulko.com>
> > Subject: [OE-core] [PATCH 1/2] python3-importlib-metadata: upgrade 4.10.1
> > -> 4.11.2
> >
> > inherit setuptools_build_meta
> >
> > v4.11.2
> > 369: Fixed bug where EntryPoint.extras was returning match objects and
> not
> > the extras strings.
> >
> > v4.11.1
> > 367: In Distribution.requires for egg-info, if requires.txt is empty,
> return an
> > empty list.
> >
> > v4.11.0
> > bpo-46246: Added __slots__ to EntryPoints.
> >
> > v4.10.2
> > 365 and bpo-46546: Avoid leaking method_name in DeprecatedList.
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  ...-metadata_4.10.1.bb => python3-importlib-metadata_4.11.2.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  rename meta/recipes-
> > devtools/python/{python3-importlib-metadata_4.10.1.bb => python3-
> > importlib-metadata_4.11.2.bb} (88%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-importlib-
> > metadata_4.10.1.bb b/meta/recipes-devtools/python/python3-importlib-
> > metadata_4.11.2.bb
> > similarity index 88%
> > rename from meta/recipes-devtools/python/python3-importlib-
> > metadata_4.10.1.bb
> > rename to meta/recipes-devtools/python/python3-importlib-
> > metadata_4.11.2.bb
> > index ff40def563f..15c468e41b7 100644
> > --- a/meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb
> > +++ b/meta/recipes-devtools/python/python3-importlib-
> > metadata_4.11.2.bb
> > @@ -8,7 +8,7 @@ inherit pypi setuptools3  PYPI_PACKAGE =
> > "importlib_metadata"
> >  UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-
> > _]*)+)/"
> >
> > -SRC_URI[sha256sum] =
> > "951f0d8a5b7260e9db5e41d429285b5f451e928479f19d80818878527d36e95e"
> > +SRC_URI[sha256sum] =
> > "b36ffa925fe3139b2f6ff11d6925ffd4fa7bc47870165e3ac260ac7b4f91e6ac"
> >
> >  S = "${WORKDIR}/importlib_metadata-${PV}"
> >
> > --
> > 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162714):
> https://lists.openembedded.org/g/openembedded-core/message/162714
> Mute This Topic: https://lists.openembedded.org/mt/89534634/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000dd84c805d9664f90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Mar 4, 2022 at 2:13 AM Lee Chee Yang &lt;<a href=3D=
"mailto:chee.yang.lee@intel.com">chee.yang.lee@intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-c=
olor:rgb(204,204,204)">Error while do_compile <br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/3190/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3190/steps/11/logs/=
stdio</a><br>
<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I just have miss=
ed committing a local change.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Tim Orling<br>
&gt; Sent: Friday, March 4, 2022 4:44 AM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH 1/2] python3-importlib-metadata: upgrade 4.1=
0.1<br>
&gt; -&gt; 4.11.2<br>
&gt; <br>
&gt; inherit setuptools_build_meta<br>
&gt; <br>
&gt; v4.11.2<br>
&gt; 369: Fixed bug where EntryPoint.extras was returning match objects and=
 not<br>
&gt; the extras strings.<br>
&gt; <br>
&gt; v4.11.1<br>
&gt; 367: In Distribution.requires for egg-info, if requires.txt is empty, =
return an<br>
&gt; empty list.<br>
&gt; <br>
&gt; v4.11.0<br>
&gt; bpo-46246: Added __slots__ to EntryPoints.<br>
&gt; <br>
&gt; v4.10.2<br>
&gt; 365 and bpo-46546: Avoid leaking method_name in DeprecatedList.<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-<a href=3D"http://metadata_4.10.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">metadata_4.10.1.bb</a> =3D&gt; <a href=3D"http://python3-imp=
ortlib-metadata_4.11.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-imp=
ortlib-metadata_4.11.2.bb</a>} | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)=C2=A0 rename meta/=
recipes-<br>
&gt; devtools/python/{<a href=3D"http://python3-importlib-metadata_4.10.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-importlib-metadata_4.10.1.b=
b</a> =3D&gt; python3-<br>
&gt; <a href=3D"http://importlib-metadata_4.11.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">importlib-metadata_4.11.2.bb</a>} (88%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/python3-importlib-<br>
&gt; <a href=3D"http://metadata_4.10.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">metadata_4.10.1.bb</a> b/meta/recipes-devtools/python/python3-importli=
b-<br>
&gt; <a href=3D"http://metadata_4.11.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">metadata_4.11.2.bb</a><br>
&gt; similarity index 88%<br>
&gt; rename from meta/recipes-devtools/python/python3-importlib-<br>
&gt; <a href=3D"http://metadata_4.10.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">metadata_4.10.1.bb</a><br>
&gt; rename to meta/recipes-devtools/python/python3-importlib-<br>
&gt; <a href=3D"http://metadata_4.11.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">metadata_4.11.2.bb</a><br>
&gt; index ff40def563f..15c468e41b7 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-importlib=
-metadata_4.10.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib=
-metadata_4.10.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/python3-importlib-<br>
&gt; <a href=3D"http://metadata_4.11.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">metadata_4.11.2.bb</a><br>
&gt; @@ -8,7 +8,7 @@ inherit pypi setuptools3=C2=A0 PYPI_PACKAGE =3D<br>
&gt; &quot;importlib_metadata&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;/importlib-metadata/(?P&lt;pver&g=
t;(\d+[\.\-<br>
&gt; _]*)+)/&quot;<br>
&gt; <br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;951f0d8a5b7260e9db5e41d429285b5f451e928479f19d80818878527d36e95e=
&quot;<br>
&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;b36ffa925fe3139b2f6ff11d6925ffd4fa7bc47870165e3ac260ac7b4f91e6ac=
&quot;<br>
&gt; <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/importlib_metadata-${PV}&quot;<br>
&gt; <br>
&gt; --<br>
&gt; 2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162714): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162714" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162714</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89534634/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89534634/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000dd84c805d9664f90--


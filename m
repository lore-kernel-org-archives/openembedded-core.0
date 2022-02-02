Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1180EC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 11:33:43 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web10.63232.1643801621979037933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 03:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hHH7flcI;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id w21so18492458uan.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 03:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pDm2ZIIulcxPveVL4Np1NAYux01Zldp21KdFZ5sr9TA=;
        b=hHH7flcIwPtYmD0xp54VajzxfAiqqE+OaLTNy9e18eWfrUcC5td/IPg3VxDYju6mTG
         ZdGKEI2ELiS6v/b6Bfzsvg9brP7yh/HEsJgp1jYkpoJE3C7SauH3obGm4f7UK7/ElwAI
         uAXppokqvJqIIHwmTrWL2aAmRdPRPNXGvCuJjtj7bon9C1M6niCjGmn3XTwPCh0AeHKh
         x4Ux9c65Ssmd+7yoB4vVJ91nI6eAE6ryVtJQsSatD4xUh05vHCQOu2kSdAQGAI+WXNmx
         tNWVg8wlfBshmgrYnBgmU9K7T1XuIEaTqnROdS3iZZ8hVHD+1hqJmwldVLSSjElmBM5d
         d+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pDm2ZIIulcxPveVL4Np1NAYux01Zldp21KdFZ5sr9TA=;
        b=TZURhYYTjafwf11d1nrLUnZpxOjA0QvcdHrbWy5O23TUm4wZU5fVjEfvZ7yk0//0eP
         D8+64kFJj+6N3/SEyBeTWQGcgM8/9HBlxqPlCOg6/65ae54Sxpk0gVUDBOt9Ry2LVxHd
         YbdbrEYlemtQLKDyIjG6jzkPj8o5+9f0QeisdSeDuzKFZGGBei2NUbm5grY0wU/ibfiK
         q6W8Msfyfq0I6GYjPmSeXzzTjiXRwiR00OdfscsdAUwJi5OUI95p4Ut7L9r2sBUhBuRJ
         zwkG4NEBLV+zSzi+BJH0o1GCBXV11nG2SYd73IA57sETvMD/tmbh7lTgUp8tkbbn0Lbj
         zeAw==
X-Gm-Message-State: AOAM532JPKr5qidOgQcuhOKeGYqDfFvCABEcswzbJnl7aTDKaq/E8AvT
	P3w5yY8MFuuo6zUkwrCeuGw9/WCVR9wkqsP30ZE=
X-Google-Smtp-Source: 
 ABdhPJy1SAc9xWvDA2gzSl1CTWLuQbghynUj7LcBjRLTjiwh8/7fI6LjRVfD6ZCvUIiBvcl28U6fir1XSSJGshAK2+o=
X-Received: by 2002:a05:6102:22d1:: with SMTP id
 a17mr10028320vsh.42.1643801620963;
 Wed, 02 Feb 2022 03:33:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643766962.git.pkj@axis.com>
 <CANNYZj-2w5J+WrjW+jFiY0Z25iP0iJCtFzvRnCTU=qR_fPoeUQ@mail.gmail.com>
 <b1056c7cb7e64f53a36c8119ef43453d@axis.com>
In-Reply-To: <b1056c7cb7e64f53a36c8119ef43453d@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Feb 2022 12:33:29 +0100
Message-ID: 
 <CANNYZj-Je9avbcScAE9MuTpcUkdvgXxKSz_A3jCjSkNLrqT=tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Split split_and_strip_files()
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b2e54405d707633b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 11:33:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161191

--000000000000b2e54405d707633b
Content-Type: text/plain; charset="UTF-8"

Right, the patchset is good for maintainability, my comment was more about
whether it's easier to just package files in a way that doesn't clash in
do_rootfs, then rearrange them in rootfs postprocessing.

Alex

On Wed, 2 Feb 2022 at 12:20, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> Why do you consider splitting a huge function heavy? Honestly, I would
> like to split it even further to make it more manageable.
>
>
>
> //Peter
>
>
>
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* den 2 februari 2022 09:54
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH 0/3] Split split_and_strip_files()
>
>
>
> Sorry Peter, but this still strikes me as rather heavy handed for what is
> a niche use case. Is it possible to simply do what needs to be done from a
> ROOTFS_POSTPROCESS hook?
>
>
>
> Alex
>
>
>
> On Wed, 2 Feb 2022 at 03:00, Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
> This is my third attempt to make it possible for me to hook into the
> split_and_strip_files() function. We need this to be able to rename
> the debug files for some packages to avoid conflicts when installing
> them.
>
> In this version, the first patch splits out the part of
> split_and_strip_files() that is responsible for setting up the
> variables used to implement the various debug splitting methods
> specified by PACKAGE_DEBUG_SPLIT_STYLE into a new function,
> package_debug_vars(). This I believe to be a good thing in itself as
> that function is way too long anyway.
>
> The second and third patch are not needed to allow me to hook into the
> split_and_strip_files() function, but they simplify the APIs used for
> passing the variables returned by package_debug_vars() around.
>
> With these patches in place, I can now wrap the package_debug_vars()
> function with the following local wrapper package.bbclass:
>
> require ${COREBASE}/meta/classes/package.bbclass
>
> PACKAGE_DEBUG_FILE_SUFFIX ??= ""
>
> # Provide the original package_debug_vars() as org_package_debug_vars().
> org_package_debug_vars := "${@d.getVar('package_debug_vars',
> False).replace('package_debug_vars', 'org_package_debug_vars')}"
> python () {
>     bb.methodpool.insert_method("", d.getVar("org_package_debug_vars",
> False), "<code>", 0)
> }
>
> # This version of package_debug_vars() wraps the original
> package_debug_vars()
> # by calling org_package_debug_vars() and then appends
> PACKAGE_DEBUG_FILE_SUFFIX
> # to dv["append"] and dv["staticappend"].
> def package_debug_vars(d):
>     dv = org_package_debug_vars(d)
>
>     dv["append"] += d.getVar('PACKAGE_DEBUG_FILE_SUFFIX')
>     dv["staticappend"] += d.getVar('PACKAGE_DEBUG_FILE_SUFFIX')
>
>     return dv
>
> The definition of the org_package_debug_vars() function is not very
> pretty, but it seems to work, and this solution means a heck of a lot
> less maintenance than to try to maintain a backported version of the
> over 250 lines long split_and_strip_files() function (as it was before
> my changes).
>
> //Peter
>
> The following changes since commit
> 74a8a74a553a33dc5f41939f8070d75e6d57d3da:
>
>   busybox: Add shell arithmetic to work with poky-tiny (2022-02-01
> 07:32:08 +0000)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib pkj/package_debug_vars
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/package_debug_vars
>
> Peter Kjellerstedt (3):
>   package.bbclass: Split out package_debug_vars from
>     split_and_strip_files
>   package.bbclass: Make package_debug_vars() return a dict
>   package.bbclass: Pass dv (debug_vars) around instead of individual
>     vars
>
>  meta/classes/package.bbclass | 127 +++++++++++++++++++----------------
>  1 file changed, 70 insertions(+), 57 deletions(-)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161174):
> https://lists.openembedded.org/g/openembedded-core/message/161174
> Mute This Topic: https://lists.openembedded.org/mt/88849297/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b2e54405d707633b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, the patchset is good for maintainability, my c=
omment was more about whether it&#39;s easier to just package files in a wa=
y that doesn&#39;t clash in do_rootfs, then rearrange them in rootfs postpr=
ocessing.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 2 Feb 2022 at 12:2=
0, Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">pe=
ter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"SV">
<div class=3D"gmail-m_8983766580117225852WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
Why do you consider splitting a huge function heavy? Honestly, I would like=
 to split it even further to make it more manageable.<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;
<br>
<b>Sent:</b> den 2 februari 2022 09:54<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;<=
br>
<b>Subject:</b> Re: [OE-core] [PATCH 0/3] Split split_and_strip_files()<u><=
/u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Sorry Peter, but this still strikes me as rather hea=
vy handed for what is a niche use case. Is it possible to simply do what ne=
eds to be done from a ROOTFS_POSTPROCESS hook?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, 2 Feb 2022 at 03:00, Peter Kjellerstedt &lt;=
<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjel=
lerstedt@axis.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">This is my third attemp=
t to make it possible for me to hook into the<br>
split_and_strip_files() function. We need this to be able to rename<br>
the debug files for some packages to avoid conflicts when installing<br>
them.<br>
<br>
In this version, the first patch splits out the part of<br>
split_and_strip_files() that is responsible for setting up the<br>
variables used to implement the various debug splitting methods<br>
specified by PACKAGE_DEBUG_SPLIT_STYLE into a new function,<br>
package_debug_vars(). This I believe to be a good thing in itself as<br>
that function is way too long anyway.<br>
<br>
The second and third patch are not needed to allow me to hook into the<br>
split_and_strip_files() function, but they simplify the APIs used for<br>
passing the variables returned by package_debug_vars() around.<br>
<br>
With these patches in place, I can now wrap the package_debug_vars()<br>
function with the following local wrapper package.bbclass:<br>
<br>
require ${COREBASE}/meta/classes/package.bbclass<br>
<br>
PACKAGE_DEBUG_FILE_SUFFIX ??=3D &quot;&quot;<br>
<br>
# Provide the original package_debug_vars() as org_package_debug_vars().<br=
>
org_package_debug_vars :=3D &quot;<a href=3D"mailto:$%7b@d.getVar(&#39;pack=
age_debug_vars&#39;,%20False).replace(&#39;package_debug_vars&#39;,%20&#39;=
org_package_debug_vars&#39;)%7d" target=3D"_blank">${@d.getVar(&#39;package=
_debug_vars&#39;, False).replace(&#39;package_debug_vars&#39;, &#39;org_pac=
kage_debug_vars&#39;)}</a>&quot;<br>
python () {<br>
=C2=A0 =C2=A0 bb.methodpool.insert_method(&quot;&quot;, d.getVar(&quot;org_=
package_debug_vars&quot;, False), &quot;&lt;code&gt;&quot;, 0)<br>
}<br>
<br>
# This version of package_debug_vars() wraps the original package_debug_var=
s()<br>
# by calling org_package_debug_vars() and then appends PACKAGE_DEBUG_FILE_S=
UFFIX<br>
# to dv[&quot;append&quot;] and dv[&quot;staticappend&quot;].<br>
def package_debug_vars(d):<br>
=C2=A0 =C2=A0 dv =3D org_package_debug_vars(d)<br>
<br>
=C2=A0 =C2=A0 dv[&quot;append&quot;] +=3D d.getVar(&#39;PACKAGE_DEBUG_FILE_=
SUFFIX&#39;)<br>
=C2=A0 =C2=A0 dv[&quot;staticappend&quot;] +=3D d.getVar(&#39;PACKAGE_DEBUG=
_FILE_SUFFIX&#39;)<br>
<br>
=C2=A0 =C2=A0 return dv<br>
<br>
The definition of the org_package_debug_vars() function is not very<br>
pretty, but it seems to work, and this solution means a heck of a lot<br>
less maintenance than to try to maintain a backported version of the<br>
over 250 lines long split_and_strip_files() function (as it was before<br>
my changes).<br>
<br>
//Peter<br>
<br>
The following changes since commit 74a8a74a553a33dc5f41939f8070d75e6d57d3da=
:<br>
<br>
=C2=A0 busybox: Add shell arithmetic to work with poky-tiny (2022-02-01 07:=
32:08 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" target=3D=
"_blank">git.yoctoproject.org/poky-contrib</a> pkj/package_debug_vars<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Dpkj/package_debug_vars" target=3D"_blank">
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dpkj/package_debu=
g_vars</a><br>
<br>
Peter Kjellerstedt (3):<br>
=C2=A0 package.bbclass: Split out package_debug_vars from<br>
=C2=A0 =C2=A0 split_and_strip_files<br>
=C2=A0 package.bbclass: Make package_debug_vars() return a dict<br>
=C2=A0 package.bbclass: Pass dv (debug_vars) around instead of individual<b=
r>
=C2=A0 =C2=A0 vars<br>
<br>
=C2=A0meta/classes/package.bbclass | 127 +++++++++++++++++++---------------=
-<br>
=C2=A01 file changed, 70 insertions(+), 57 deletions(-)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161174): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161174" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/161174</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88849297/1686=
489" target=3D"_blank">
https://lists.openembedded.org/mt/88849297/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<=
br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000b2e54405d707633b--


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85DFC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 08:54:01 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web08.61385.1643792040443812767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 00:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZC31lgJM;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 48so12204320vki.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 00:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qz/fU6aRmNpbDk+IO/dB2gbmM0HXDpfaLhg9yBYi7lY=;
        b=ZC31lgJMOI26fH7sWrkeGHsKD0Wy+d3xZ2MdyS2/JL1/jGxQ0oa17epXO5ZKVvBKl/
         FCXJiGEhUdV8MgEl7smyLQS50rQPtKPLt6i1E8lnJSb3XYQpub3z8k1hkx9iOQ0Asxfw
         hnRYUqJm5Reub9T5eHtQJjgYbafOz1ZvS01TwSSnx3B2QY+Uk6h800Mny7NUB0FBT2JI
         J8V093NNrrjWy11+bpNYkeoT5oLQCtxjDrArnbUykEytBg2DxgeCpd4P8HfB2Tq3iip3
         i7ER9TUl8QolrlFyK8+g0nV2cF8FEVsQo/Ne+C3Om8mOg0ufeFfOqIVActUxF0uSZbhI
         X/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qz/fU6aRmNpbDk+IO/dB2gbmM0HXDpfaLhg9yBYi7lY=;
        b=hz7MzGitVOuHe2ZfqdWB5906FpRxIx9o9btaBEWtbrTMdcvo2MO2XUbBKMZt1a8vTZ
         jBQ3huf+1dgydBNRdrJfmNqBKe0LpOuZXQqY3JHqQaTVb7r2jEKi6gbOJBgPWJJ5MBKK
         s5eoCrCh7Yua2rrL6rr5u5+ntpeS3jj+wqDGn3KugiA9iN8qvYIXJznzM+zdkgLojyPd
         H3W6MI/NialxEMrM8Yun3RBGa4mJd7DvLHJ/NPFGdhv/VTd9cjdmAZEoRcmGktRnMMmZ
         oJ5ZYhz8wsF/PQ6nQzB8rRrcC/ioDLIWd4pR+3SoNXo9cfb3cFwL4ZKYx23rMSlGzl6Y
         6FqA==
X-Gm-Message-State: AOAM533yMdxMRRpgD2b8rGU+dU3oU8m/vtVsQV2fX6qdyBdhjfeLg5BR
	cULyiBbPAMfu4MHYzzKW5ghrUGpM31zG1RFfRptoi0P5
X-Google-Smtp-Source: 
 ABdhPJwIzDPUYigULzxu5ziQHjR9a1E8ljkjHMOG+4YaEDDRWQCa4Ca8c2c0kpHREuPoOjpdqNf6hcIXoWDewbNol58=
X-Received: by 2002:a05:6122:50d:: with SMTP id
 x13mr11791808vko.4.1643792039450;
 Wed, 02 Feb 2022 00:53:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643766962.git.pkj@axis.com>
In-Reply-To: <cover.1643766962.git.pkj@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Feb 2022 09:53:48 +0100
Message-ID: 
 <CANNYZj-2w5J+WrjW+jFiY0Z25iP0iJCtFzvRnCTU=qR_fPoeUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Split split_and_strip_files()
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000989f5c05d7052824"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 08:54:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161185

--000000000000989f5c05d7052824
Content-Type: text/plain; charset="UTF-8"

Sorry Peter, but this still strikes me as rather heavy handed for what is a
niche use case. Is it possible to simply do what needs to be done from a
ROOTFS_POSTPROCESS hook?

Alex

On Wed, 2 Feb 2022 at 03:00, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

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

--000000000000989f5c05d7052824
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry Peter, but this still strikes me as rather heav=
y handed for what is a niche use case. Is it possible to simply do what nee=
ds to be done from a ROOTFS_POSTPROCESS hook?</div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, 2 Feb 2022 at 03:00, Peter Kjellerstedt &lt;<a href=3D"ma=
ilto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is my thi=
rd attempt to make it possible for me to hook into the<br>
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
org_package_debug_vars :=3D &quot;${@d.getVar(&#39;package_debug_vars&#39;,=
 False).replace(&#39;package_debug_vars&#39;, &#39;org_package_debug_vars&#=
39;)}&quot;<br>
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
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/poky-contrib</a> pkj/packa=
ge_debug_vars<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Dpkj/package_debug_vars" rel=3D"noreferrer" target=3D"_blank">http://git.=
yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dpkj/package_debug_vars</a><=
br>
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
enembedded-core/message/161174" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161174</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88849297/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88849297/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000989f5c05d7052824--


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9407FC433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 15:18:45 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.45287.1635779924476310390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 08:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TMhl55LH;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id h16so11699220qtk.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zezaeCVbhxtxkl1QwTPppiVYai9zXYp1wB2GZ+X6FCs=;
        b=TMhl55LHUwdaV+KH+pvSFPtas+FEoybLXH8Cm/uYbDV9jfJ4R5Cebzv2dfJGH6F6Bp
         Hl31ZezsU2+bcvl8OfQGsp527dqqwptrQ04asUEXf4YtljHJJ9VnvpCHqV/9S8tRqLpD
         US59k5rHAa3ce9elFNGWzYkK/IG0PXYI9px0g67/xw+kHI9nI00MrVCb8KIFZtxfwsmw
         N4FZ65TXwh3CAocLvNzA/DkAHcGWjYEYCBnbbW//S/XShIxFuGmbe9nK9zQ2RPM9fwoc
         vq5wXmwrNMlFes9pgwg4/BSoicSp5Nl4DKunugNvdIBsc9jcdw23M/8gww7OhuujXYtB
         KlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zezaeCVbhxtxkl1QwTPppiVYai9zXYp1wB2GZ+X6FCs=;
        b=FC4jomp/RbSJP+lq8hIaAWUzGmMgZaetwvK5/+qgfRLeb/mEerHINqhQrs8vgvzyc8
         la7lmzC4gcOldjQjRt/lFdwrOXRi8G0krbTT0hwycx0xj+5tbSRta6vjkZSgM46GBWlS
         wf+QKAA+II16M9k5nIg5JRIXEUYJzM/9ssgNEtjsjSEvsb6+P4VSEdbkB0HeEekAbKY9
         +5Y+wBjyaNhCQhQ9t8c4rWR+Om28cVPqQbXnaHIx6zPxcIwZDx4HaVYNpz1D5BCfPweH
         N1U5VzHF5Pd0lQmVGMRrr8Lec0UxrAGMTArBLPqJq2rszx74s3v9rdf50RFJztTORPFq
         tQzw==
X-Gm-Message-State: AOAM533NRn7Ip3IbPcJogjHehGWzo8AmZwkAQ1o57Lk1D707IooHjdsn
	WDzYlKspukzqWh23SyWDMLn3s5w1lNRTL6lwfxRjmIaf
X-Google-Smtp-Source: 
 ABdhPJwefFfZW/avhuNN6oGru1eQvq7xg7ng4GgFH4Qzge/3VIq86P9VLf1rTVzJZPDWYkpZfyjG4CqJPK5rNBDEe8E=
X-Received: by 2002:ac8:7087:: with SMTP id y7mr31539200qto.112.1635779921452;
 Mon, 01 Nov 2021 08:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635778787.git.liezhi.yang@windriver.com>
 <9afb661854796b8ec836b94cca1cebf7aa382655.1635778787.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <9afb661854796b8ec836b94cca1cebf7aa382655.1635778787.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2021 08:18:30 -0700
Message-ID: 
 <CAMKF1soeGMgzS7uz6M27+SaNv4YmnHEAJavTgZxcyjenyNpmfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] sanity.bbclass: Update required gcc version
 to v7.5
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000262c6805cfbbb15f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 15:18:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157706

--000000000000262c6805cfbbb15f
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 1, 2021 at 8:05 AM Robert Yang <liezhi.yang@windriver.com>
wrote:

> qemu-native 6.1.0 requires at least gcc v7.5:
> ERROR: You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10.0)


Which supported distros still ship gcc < 7.5

>
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/sanity.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index ddba1e6e1e..9fbc9c18e7 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -530,7 +530,7 @@ def check_wsl(d):
>              bb.warn("You are running bitbake under WSLv2, this works
> properly but you should optimize your VHDX file eventually to avoid running
> out of storage space")
>      return None
>
> -# Require at least gcc version 6.0.
> +# Require at least gcc version 7.5.
>  #
>  # This can be fixed on CentOS-7 with devtoolset-6+
>  # https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
> @@ -544,8 +544,8 @@ def check_gcc_version(sanity_data):
>
>      build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
>      if build_cc.strip() == "gcc":
> -        if LooseVersion(version) < LooseVersion("6.0"):
> -            return "Your version of gcc is older than 6.0 and will break
> builds. Please install a newer version of gcc (you could use the project's
> buildtools-extended-tarball or use scripts/install-buildtools).\n"
> +        if LooseVersion(version) < LooseVersion("7.5"):
> +            return "Your version of gcc is older than 7.5 and will break
> builds. Please install a newer version of gcc (you could use the project's
> buildtools-extended-tarball or use scripts/install-buildtools).\n"
>      return None
>
>  # Tar version 1.24 and onwards handle overwriting symlinks correctly
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157704):
> https://lists.openembedded.org/g/openembedded-core/message/157704
> Mute This Topic: https://lists.openembedded.org/mt/86742639/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000262c6805cfbbb15f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 1, 2021 at 8:05 AM Robert Yang &lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">qemu-native 6.1.0 requires at least =
gcc v7.5:<br>
ERROR: You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10.0)</blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto">Which supported distr=
os still ship gcc &lt; 7.5</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"=
><br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sanity.bbclass | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index ddba1e6e1e..9fbc9c18e7 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -530,7 +530,7 @@ def check_wsl(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;You are runni=
ng bitbake under WSLv2, this works properly but you should optimize your VH=
DX file eventually to avoid running out of storage space&quot;)<br>
=C2=A0 =C2=A0 =C2=A0return None<br>
<br>
-# Require at least gcc version 6.0.<br>
+# Require at least gcc version 7.5.<br>
=C2=A0#<br>
=C2=A0# This can be fixed on CentOS-7 with devtoolset-6+<br>
=C2=A0# <a href=3D"https://www.softwarecollections.org/en/scls/rhscl/devtoo=
lset-6/" rel=3D"noreferrer" target=3D"_blank">https://www.softwarecollectio=
ns.org/en/scls/rhscl/devtoolset-6/</a><br>
@@ -544,8 +544,8 @@ def check_gcc_version(sanity_data):<br>
<br>
=C2=A0 =C2=A0 =C2=A0build_cc, version =3D oe.utils.get_host_compiler_versio=
n(sanity_data)<br>
=C2=A0 =C2=A0 =C2=A0if build_cc.strip() =3D=3D &quot;gcc&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if LooseVersion(version) &lt; LooseVersion(&qu=
ot;6.0&quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;Your version of gcc=
 is older than 6.0 and will break builds. Please install a newer version of=
 gcc (you could use the project&#39;s buildtools-extended-tarball or use sc=
ripts/install-buildtools).\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if LooseVersion(version) &lt; LooseVersion(&qu=
ot;7.5&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;Your version of gcc=
 is older than 7.5 and will break builds. Please install a newer version of=
 gcc (you could use the project&#39;s buildtools-extended-tarball or use sc=
ripts/install-buildtools).\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0return None<br>
<br>
=C2=A0# Tar version 1.24 and onwards handle overwriting symlinks correctly<=
br>
-- <br>
2.31.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157704): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157704" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157704</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86742639/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86742639/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000262c6805cfbbb15f--


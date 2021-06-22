Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.8392.1624365641709942056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 05:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hFTYsRbg;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id c20so1392352uar.12
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 05:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HKY8XdeVDalURarWfZDwXJDDSJW76bqR4/YgFuVBkSA=;
        b=hFTYsRbgTxXwoYWY68SlYfyZ1UNA/GerOYjx0Q3axXfkhGnVIkdrbIdPqn4t3NL8kj
         8kbFVNP1BvtVCG3zA3K+d+SraVMYRAz39z4LEp/PYksfYY9TGjbmhv3/5BPrkeZxBVHM
         5IsEEcDfnDuVqGZ8RX9nj5302ZiyXZzkFk1cjPF+LLWBz4aoLvvyIq/SSK8yBGADXPzj
         KQ7Yk8BE4oYp20Q8iBsxy3/tnYElP+5ag7IlzUvCja0OCB/C1NbyC3BnF1/s/G/pR5/1
         z7Rl0xm/YAYlfSUyS4uyivgu28cbvZt+U5X/25VSTFQe+60lH6KDAosYEwKg0O1gkYxZ
         fubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HKY8XdeVDalURarWfZDwXJDDSJW76bqR4/YgFuVBkSA=;
        b=RuzPcHyjPtDi3Ux41QpgCjNtDGVVeoqNdqR8btmH4UZLascn9m0ezmXaeSQOeet+GK
         JfhFpO1PkL/GeS51aOOJe9GRaGheYFrtLKCK8HcSKRHKb3rjWZNIlgCyTHMs45CLg1IQ
         Cdn0j/WGDmQEAQ5zz1/LqSvZahDyRvrPXA+oHPt15qo+IxdKxe+6F85cRl8cdIfHfIjc
         SCElYMYRYE1qTQNrd1guQmfXDuaeKDeRRVX/SkqYqXZ0CVrOY/9Zcsu+bujYroBwcCJm
         WWeNbCotA1QJ9VHXUHARFB89SLmXc5OoV5zguuwMjX2zi9WTbepuEFVb02JO0KqD5sPJ
         Iduw==
X-Gm-Message-State: AOAM53287FITczY281UbEORz5itz+Wvtz0Qh0JlPCHeFDOR0/7MqGiwX
	0UzFOe073DdK1EAZvGDXZeNR1/RlccdawVegfOU=
X-Google-Smtp-Source: ABdhPJwed8BY5OoZdPlYWmKq4ACPrt1DOmCH9ZxG4+MVmajZ6h861+qvj/2ZytibftA3el5i/i1mX+OQ1RRO4rhNe1Y=
X-Received: by 2002:ab0:6797:: with SMTP id v23mr3311839uar.71.1624365640887;
 Tue, 22 Jun 2021 05:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210622121531.13424-1-andrej.valek@siemens.com>
In-Reply-To: <20210622121531.13424-1-andrej.valek@siemens.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 22 Jun 2021 14:40:29 +0200
Message-ID: <CANNYZj__D-tKLm4r1wSUOgqkz0da6NUu9xsqoS1Ztso-sM7fjA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] ca-certificates: revert mktemp patch in update-ca-certificates script
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000002b01f05c55a192d"

--00000000000002b01f05c55a192d
Content-Type: text/plain; charset="UTF-8"

This submission is modifying two different patch files (one of which I
think should not be touched), and reverting something that was already
accepted upstream.
I would suggest that you first take latest upstream code, then do any
needed modifications there, then submit them upstream and backport to the
recipe.
Also the patch file metadata is changed and important information is being
removed.

The issue that the patch is aiming to address could also be explained
better, particularly the step by step scenario of where the breakage
happens would help.

Alex

On Tue, 22 Jun 2021 at 14:15, Andrej Valek <andrej.valek@siemens.com> wrote:

> - revert f3eabbb5c15fb55ae3d46b2377c09bb58226d965
> - mktemp from busybox does not support '--tmpdir' option
> - coreutils is usually not possible to use because of 'GPLv3+' LICENSE
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../ca-certificates/ca-certificates/sbindir.patch   | 10 ++--------
>  .../update-ca-certificates-support-Toybox.patch     | 21
> +++++++++++----------
>  2 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git
> a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
> b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
> index f343ebf16e..a113fa8b15 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
> +++ b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
> @@ -1,12 +1,6 @@
> -sbin/Makefile: Allow the sbin path to be configurable
> +Upstream-Status: Pending
>
> -Some project sharing ca-certificates from Debian allow configuration
> -of the installation location. Make the sbin location configurable.
> -
> -Also ensure the target directory exists
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Upstream-Status: Submitted [
> https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
> +Let us alter the install destination of the script via SBINDIR
>
>  --- ca-certificates-20130119.orig/sbin/Makefile
>  +++ ca-certificates-20130119/sbin/Makefile
> diff --git
> a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
> b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
> index f78790923c..6e2171f758 100644
> ---
> a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
> +++
> b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
> @@ -1,13 +1,14 @@
> -update-ca-certificates: Replace deprecated mktemp -t with mktemp --tmpdir
> +From 30378026d136efa779732e3f6664e2ecf461e458 Mon Sep 17 00:00:00 2001
> +From: Patrick Ohly <patrick.ohly@intel.com>
> +Date: Thu, 17 Mar 2016 12:38:09 +0100
> +Subject: [PATCH] update-ca-certificates: support Toybox
>
> -According to coreutils docs, mktemp -t is deprecated, switch to the
> ---tmpdir option instead.
> +"mktemp -t" is deprecated and does not work when using Toybox. Replace
> +with something that works also with Toybox.
>
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Upstream-Status: Submitted [
> https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
> +Upstream-Status: Pending
>
> -[This was originally for compatibility with toybox but toybox now
> -supports -t]
> +Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>  ---
>   sbin/update-ca-certificates | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> @@ -23,9 +24,9 @@ index 79c41bb..ae9e3f1 100755
>  -TEMPBUNDLE="$(mktemp -t "${CERTBUNDLE}.tmp.XXXXXX")"
>  -ADDED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
>  -REMOVED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
> -+TEMPBUNDLE="$(mktemp --tmpdir "${CERTBUNDLE}.tmp.XXXXXX")"
> -+ADDED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
> -+REMOVED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
> ++TEMPBUNDLE="$(mktemp -p${TMPDIR:-/tmp} "${CERTBUNDLE}.tmp.XXXXXX")"
> ++ADDED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
> ++REMOVED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
>
>   # Adds a certificate to the list of trusted ones.  This includes a
> symlink
>   # in /etc/ssl/certs to the certificate file and its inclusion into the
> --
> 2.11.0
>
>
> 
>
>

--00000000000002b01f05c55a192d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This submission is modifying two different patch file=
s (one of which I think should not be touched), and reverting something tha=
t was already accepted upstream.</div><div>I would suggest that you first t=
ake latest upstream code, then do any needed modifications there, then subm=
it them upstream and backport to the recipe.</div><div>Also the patch file =
metadata is changed and important information is being removed.<br></div><d=
iv><br></div><div>The issue that the patch is aiming to address could also =
be explained better, particularly the step by step scenario of where the br=
eakage happens would help.</div><div><br></div><div>Alex<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 2=
2 Jun 2021 at 14:15, Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemen=
s.com">andrej.valek@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">- revert f3eabbb5c15fb55ae3d46b2377c09bb5=
8226d965<br>
- mktemp from busybox does not support &#39;--tmpdir&#39; option<br>
- coreutils is usually not possible to use because of &#39;GPLv3+&#39; LIC=
ENSE<br>
<br>
Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../ca-certificates/ca-certificates/sbindir.patch=C2=A0 =C2=A0| 10 +=
+--------<br>
=C2=A0.../update-ca-certificates-support-Toybox.patch=C2=A0 =C2=A0 =C2=A0|=
 21 +++++++++++----------<br>
=C2=A02 files changed, 13 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.=
patch b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch<=
br>
index f343ebf16e..a113fa8b15 100644<br>
--- a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch<b=
r>
+++ b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch<b=
r>
@@ -1,12 +1,6 @@<br>
-sbin/Makefile: Allow the sbin path to be configurable<br>
+Upstream-Status: Pending<br>
<br>
-Some project sharing ca-certificates from Debian allow configuration<br>
-of the installation location. Make the sbin location configurable.<br>
-<br>
-Also ensure the target directory exists<br>
-<br>
-Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
-Upstream-Status: Submitted [<a href=3D"https://salsa.debian.org/debian/ca=
-certificates/-/merge_requests/5" rel=3D"noreferrer" target=3D"_blank">http=
s://salsa.debian.org/debian/ca-certificates/-/merge_requests/5</a>]<br>
+Let us alter the install destination of the script via SBINDIR<br>
<br>
=C2=A0--- ca-certificates-20130119.orig/sbin/Makefile<br>
=C2=A0+++ ca-certificates-20130119/sbin/Makefile<br>
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/update-c=
a-certificates-support-Toybox.patch b/meta/recipes-support/ca-certificates/=
ca-certificates/update-ca-certificates-support-Toybox.patch<br>
index f78790923c..6e2171f758 100644<br>
--- a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certi=
ficates-support-Toybox.patch<br>
+++ b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certi=
ficates-support-Toybox.patch<br>
@@ -1,13 +1,14 @@<br>
-update-ca-certificates: Replace deprecated mktemp -t with mktemp --tmpdir=
<br>
+From 30378026d136efa779732e3f6664e2ecf461e458 Mon Sep 17 00:00:00 2001<br=
>
+From: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com" target=
=3D"_blank">patrick.ohly@intel.com</a>&gt;<br>
+Date: Thu, 17 Mar 2016 12:38:09 +0100<br>
+Subject: [PATCH] update-ca-certificates: support Toybox<br>
<br>
-According to coreutils docs, mktemp -t is deprecated, switch to the<br>
---tmpdir option instead.<br>
+&quot;mktemp -t&quot; is deprecated and does not work when using Toybox. =
Replace<br>
+with something that works also with Toybox.<br>
<br>
-Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
-Upstream-Status: Submitted [<a href=3D"https://salsa.debian.org/debian/ca=
-certificates/-/merge_requests/5" rel=3D"noreferrer" target=3D"_blank">http=
s://salsa.debian.org/debian/ca-certificates/-/merge_requests/5</a>]<br>
+Upstream-Status: Pending<br>
<br>
-[This was originally for compatibility with toybox but toybox now<br>
-supports -t]<br>
+Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com"=
 target=3D"_blank">patrick.ohly@intel.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 sbin/update-ca-certificates | 6 +++---<br>
=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
@@ -23,9 +24,9 @@ index 79c41bb..ae9e3f1 100755<br>
=C2=A0-TEMPBUNDLE=3D&quot;$(mktemp -t &quot;${CERTBUNDLE}.tmp.XXXXXX&quot;=
)&quot;<br>
=C2=A0-ADDED=3D&quot;$(mktemp -t &quot;ca-certificates.tmp.XXXXXX&quot;)&q=
uot;<br>
=C2=A0-REMOVED=3D&quot;$(mktemp -t &quot;ca-certificates.tmp.XXXXXX&quot;)=
&quot;<br>
-+TEMPBUNDLE=3D&quot;$(mktemp --tmpdir &quot;${CERTBUNDLE}.tmp.XXXXXX&quot=
;)&quot;<br>
-+ADDED=3D&quot;$(mktemp --tmpdir &quot;ca-certificates.tmp.XXXXXX&quot;)&=
quot;<br>
-+REMOVED=3D&quot;$(mktemp --tmpdir &quot;ca-certificates.tmp.XXXXXX&quot;=
)&quot;<br>
++TEMPBUNDLE=3D&quot;$(mktemp -p${TMPDIR:-/tmp} &quot;${CERTBUNDLE}.tmp.XX=
XXXX&quot;)&quot;<br>
++ADDED=3D&quot;$(mktemp -p${TMPDIR:-/tmp} &quot;ca-certificates.tmp.XXXXX=
X&quot;)&quot;<br>
++REMOVED=3D&quot;$(mktemp -p${TMPDIR:-/tmp} &quot;ca-certificates.tmp.XXX=
XXX&quot;)&quot;<br>
<br>
=C2=A0 # Adds a certificate to the list of trusted ones.=C2=A0 This includ=
es a symlink<br>
=C2=A0 # in /etc/ssl/certs to the certificate file and its inclusion into =
the<br>
-- <br>
2.11.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000002b01f05c55a192d--

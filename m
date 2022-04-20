Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEC4C64E76
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.10015.1650472366935978752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NYN8gz/B;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id z99so3019774ede.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3IBCdAQ1pRduc8hHcq4CYRLHHDYNUUIJ2T297fMD720=;
        b=NYN8gz/BUEBobyOGrLis8yCg/u7RueLE7+JaSaBNYfmOLNt636dhwwo6IDwi5JDGdX
         axpkpnup9+9UiO6dEiNTbY4hU3nxJmPoBIhUm0+JdC8wQVhmstuL0P7Gp4GVobEBmLt7
         gmQPboKCyyoD4Ji6gbyMqhksjqotTKfW3ziEdx5PxbwRpnKkc4GwuzckDngl3qawyTW+
         kTUt5M8uoUVxRXOFICTR4ztCuWH7NPOhAX8du17juXC8gcSE8pkdkdRFoBCXMojjg4Cr
         5/g1QWABbPR9unvjGGpgC8fHCQFakymsXf+vtIK0PCDijxBUCIpRhZVO6ALdFVF+w08T
         BZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3IBCdAQ1pRduc8hHcq4CYRLHHDYNUUIJ2T297fMD720=;
        b=fY85pgu4mnK56d9yxH3mFDLaOBOtE9NzSOYgQ5MGQ1AJTgu4ALuOcyOSetXrt/jBZh
         yvvgmRfuFuCasgE6yUJzaFlz+kAbbBUFSS9q9YzMdineR63hj0dUgEOWHeRYezg12czD
         a8PSjVo8+dPedP4YWNmMbhjHynskk+MBhOdIhe37vB9Z36kxOYr5sl7ixuAINlRqFv0Z
         Mftist+9FnxHnKQf1uM7c4tOi0KPn/ljpJB3cNLH8zruFd0QuACN8wPbXhzeBd/cCChe
         GaIN6HyoD6GDTIaO0kYbp5l50WuccENHN5dMnNR3hznv9hgQlMxCIvufzCSgoFnMfm4q
         iMGQ==
X-Gm-Message-State: AOAM533Non0RQr+gDBc1fGZQFYCJQuj4hxrYSj+oWg/Qz7BujijLQKuK
	eR9K0Sx8zKElq6s/Rlp+JnfPZHGKGMYW5nDSIUo=
X-Google-Smtp-Source: 
 ABdhPJzMAqRSggzTy4sSvOiHU6ipH8f4DKKOp9er1VzGBYvcKC6yrFiu1umPGWI+jbXLhgKUFlMInPp+hqY4sd8B53M=
X-Received: by 2002:a05:6402:5186:b0:423:e004:ef1c with SMTP id
 q6-20020a056402518600b00423e004ef1cmr18907693edd.349.1650472365340; Wed, 20
 Apr 2022 09:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220420162738.3371938-1-russ.dill@nikolamotor.com>
In-Reply-To: <20220420162738.3371938-1-russ.dill@nikolamotor.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Apr 2022 12:32:34 -0400
Message-ID: 
 <CADkTA4Pi8bwhNe3k6+eVdgrmvCxE9ScVzRKeg_3N02N8SULv8Q@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto.bbclass: Run do_kernel_configcheck from
 source directory
To: Russ Dill <russ.dill@nikolamotor.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000c3c1105dd188bc8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164717

--0000000000000c3c1105dd188bc8
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 20, 2022 at 12:28 PM Russ Dill <russ.dill@nikolamotor.com>
wrote:

> do_kernel_configcheck utilizes pathnames relative to the sourcedir
> but does not specify ${S} in [dirs]. tasks that do not specify
> [dirs] default to the cwd of the bitbake parent process. This can be
> seen by inspection of exec_func/exec_func_python of
> bitbake/lib/bb/build.py or by placing a "print('CWD', os.getcwd())"
> at the head of do_kernel_configcheck.
>
> This is problematic if bitbake is run from a directory that
> contains a meta/ subdirectory. In this case the code:
>
>     kmeta = d.getVar("KMETA") or "meta"
>     if not os.path.exists(kmeta):
>         kmeta = subprocess.check_output(['kgit', '--meta'],
> cwd=d.getVar('S')).decode('utf-8').rstrip()
>
> Causes kmeta to be set to just "meta" if a meta directory exists
> in the cwd of the bitbake parent process, or to the output of
>

That isn't actually a problem, and is the design intent of that check. It
allows a temporary/local override of the meta data, simply by creating a
'meta' subdir.

Bruce



> kgit --meta if it does not.
>
> Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 1d5a8cdf29..c787b2a122 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -620,6 +620,7 @@ python do_kernel_configcheck() {
>      if warnings_detected and kmeta_audit_werror:
>          bb.fatal( "configuration warnings detected, werror is set,
> promoting to fatal" )
>  }
> +do_kernel_configcheck[dirs] = "${S}"
>
>  # Ensure that the branches (BSP and meta) are on the locations specified
> by
>  # their SRCREV values. If they are NOT on the right commits, the branches
> --
> 2.25.1
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000c3c1105dd188bc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 12:28 PM Russ Dill &lt;<a h=
ref=3D"mailto:russ.dill@nikolamotor.com">russ.dill@nikolamotor.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">do_kernel=
_configcheck utilizes pathnames relative to the sourcedir<br>
but does not specify ${S} in [dirs]. tasks that do not specify<br>
[dirs] default to the cwd of the bitbake parent process. This can be<br>
seen by inspection of exec_func/exec_func_python of<br>
bitbake/lib/bb/build.py or by placing a &quot;print(&#39;CWD&#39;, os.getcw=
d())&quot;<br>
at the head of do_kernel_configcheck.<br>
<br>
This is problematic if bitbake is run from a directory that<br>
contains a meta/ subdirectory. In this case the code:<br>
<br>
=C2=A0 =C2=A0 kmeta =3D d.getVar(&quot;KMETA&quot;) or &quot;meta&quot;<br>
=C2=A0 =C2=A0 if not os.path.exists(kmeta):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kmeta =3D subprocess.check_output([&#39;kgit&#3=
9;, &#39;--meta&#39;], cwd=3Dd.getVar(&#39;S&#39;)).decode(&#39;utf-8&#39;)=
.rstrip()<br>
<br>
Causes kmeta to be set to just &quot;meta&quot; if a meta directory exists<=
br>
in the cwd of the bitbake parent process, or to the output of<br></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">That isn&#39;t actually a problem, and is the design intent of that chec=
k. It allows a temporary/local override of the meta data, simply by creatin=
g a &#39;meta&#39; subdir.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
kgit --meta if it does not.<br>
<br>
Signed-off-by: Russ Dill &lt;<a href=3D"mailto:russ.dill@nikolamotor.com" t=
arget=3D"_blank">russ.dill@nikolamotor.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass<br>
index 1d5a8cdf29..c787b2a122 100644<br>
--- a/meta/classes/kernel-yocto.bbclass<br>
+++ b/meta/classes/kernel-yocto.bbclass<br>
@@ -620,6 +620,7 @@ python do_kernel_configcheck() {<br>
=C2=A0 =C2=A0 =C2=A0if warnings_detected and kmeta_audit_werror:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal( &quot;configuration warnings de=
tected, werror is set, promoting to fatal&quot; )<br>
=C2=A0}<br>
+do_kernel_configcheck[dirs] =3D &quot;${S}&quot;<br>
<br>
=C2=A0# Ensure that the branches (BSP and meta) are on the locations specif=
ied by<br>
=C2=A0# their SRCREV values. If they are NOT on the right commits, the bran=
ches<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000000c3c1105dd188bc8--


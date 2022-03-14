Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE66C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 02:24:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.21940.1647224643402409360
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 19:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SpP29Zhd;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id y22so17884984eds.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 19:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9MwyBx5ATzjhRV8+uNACL9WMNAfjefrXaK2EHgxtQkY=;
        b=SpP29ZhdOW9u4w0vC2RKADo8B0MbvU7xONXc3rwzXiXMMtw6VSd3kT1uG2qmZnmhmb
         gL0hIrfxpaVm7pzcbG0UNxNgaTnwJ1aOKU4UWXcTJGpgEDoK5Z2tnwBkRkM7fQr5BhhA
         G6T99nJ+ScKPYzQZlGkSCXHtD9zDxHLacltqSbzPGXPlU2lmgchC70oDkOelmgsBDN2D
         JyZ+lnP4O3iTt7FrHxpbDFyb2D7/MmlbWzWw64mjaCKS90t40+TfCC7c939Q9w/mGCyw
         CpXS3yoc3mAIJufiTgzzRZf0pudzTTO27k7adw+n+tn343hD4SZNMMwpKPivGBg3fi/U
         RHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9MwyBx5ATzjhRV8+uNACL9WMNAfjefrXaK2EHgxtQkY=;
        b=g5Q2V3VQxNQKQF8QKz8sPWqeGJhXZ8oUeKXT5qiWohTnIxKwuSdsWKEyNhDBMlsG7M
         w4Twp8+ffeuGybzJAb/Uwf38V1GONV+YjcjbxvN/7lBuGUNtTl+EHp0gRMD1Mdw0t2Pi
         Oo1l8V5wMMvF99LeAxLNwf+0Bi6PLoC8DBjpLe00Z+1/3BH+TS3C2rfUSCnMeQT5lQ0W
         1G9pvI5DlWJruZuysLwQMh525OgGTsU8GW2pTPWt3q2r4nCgorqcqxj59nQ5aw5A3z3a
         Dm0MoOV8UNcxgIPRU4Xi8unK8LN0RVyogpodW9n1mWeZG3hhMTO0S1Lt4Z/VRck/UGQZ
         stsw==
X-Gm-Message-State: AOAM531Gwui4eTzbzxH730gj7HO479kn8+2s7J/4gY2Czjf76f5C+asV
	hqna1JM7f7g0OXeFHbtOFEQcDfnWeuK5x7S6qOA=
X-Google-Smtp-Source: 
 ABdhPJwdK00P4EWkETdO3V84hIpwpdoUUOvB4sD7xtjmV3DeuLPNBBzK+q4+0VFexpBPcmxIp1viqzTtjPYpnS2bejQ=
X-Received: by 2002:a05:6402:3715:b0:410:a415:fd95 with SMTP id
 ek21-20020a056402371500b00410a415fd95mr18409297edb.288.1647224641777; Sun, 13
 Mar 2022 19:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220313075932.3031649-1-raj.khem@gmail.com>
 <20220313075932.3031649-2-raj.khem@gmail.com>
In-Reply-To: <20220313075932.3031649-2-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 13 Mar 2022 22:23:51 -0400
Message-ID: 
 <CADkTA4OccVZ6g40ip0WDCUnbB-E1O7iEUCmV=2UkW2e0eyFkmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] linux-yocto: Ignore textrels for ppc64
 kernel
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a3759805da245f9b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 02:24:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163122

--000000000000a3759805da245f9b
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 13, 2022 at 3:59 AM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> index b9715e71eec..9a147023e83 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> @@ -66,3 +66,6 @@ KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc
> cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
> " cfg/x32.scc", "", d)}"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/scsi/scsi-debug.scc", "", d)}"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/gpio/mockup.scc", "", d)}"
> +
> +INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
>

Fine with me. We could also do the same tweak to linux-yocto-dev, when I'm
back from vacation, I'll check on that (if I don't see anything on the
list).

Bruce



> +
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163103):
> https://lists.openembedded.org/g/openembedded-core/message/163103
> Mute This Topic: https://lists.openembedded.org/mt/89747768/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a3759805da245f9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Mar 13, 2022 at 3:59 AM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_5.15.bb</a><br>
index b9715e71eec..9a147023e83 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a><br>
@@ -66,3 +66,6 @@ KERNEL_FEATURES:append:qemux86-64=3D&quot; cfg/sound.scc =
cfg/paravirt_kvm.scc&quot;<br>
=C2=A0KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;TUNE_FEA=
TURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot;, d)}&=
quot;<br>
=C2=A0KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_F=
EATURES&quot;, &quot;ptest&quot;, &quot; features/scsi/scsi-debug.scc&quot;=
, &quot;&quot;, d)}&quot;<br>
=C2=A0KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_F=
EATURES&quot;, &quot;ptest&quot;, &quot; features/gpio/mockup.scc&quot;, &q=
uot;&quot;, d)}&quot;<br>
+<br>
+INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D &quot;textrel&quot;<br></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Fine with me. We could also do the same tweak to linux-yocto-dev, when I=
&#39;m back from vacation, I&#39;ll check on that (if I don&#39;t see anyth=
ing on the list).</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163103): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163103" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163103</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89747768/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89747768/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000a3759805da245f9b--


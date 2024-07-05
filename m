Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78186C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 11:58:27 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.15316.1720180705380472351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 04:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Y76Fi+T3;
 spf=pass (domain: snapchat.com, ip: 209.85.167.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ea79e689eso567834e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 04:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1720180703; x=1720785503; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=57f60NKD1MtB0o3uUh1iRs1vTZYTuzVmA3z70ikN124=;
        b=Y76Fi+T3kFGErpOx1fTwe0+HUNYGAx2W/2b4KF6UnK7AucoUtvi7x+jVNkccnME7VM
         2KlVTkdmfkqVsY7YKVm+TZnwH5e/Z4ljG08E45ev2ET2kJodEWzNMd9jZEkzlv6Ob1sw
         ovvYV1NvikwG3/KPHPdAW4nisbhc9RRpf+Rdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720180703; x=1720785503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57f60NKD1MtB0o3uUh1iRs1vTZYTuzVmA3z70ikN124=;
        b=G+8Vwg3WOoxTDT9Mn3JZ8ZL58mWz8nfFooRJcARJNPoplRgNDqx9V6Fnb0ra4271u3
         Uu1YwjKbMdDO+XL2hmZQwEQLBRwzBg5M3ODJel0D+ICA6mj06GWjftIa6J9h1ZCq/X4S
         ZEL46fWGR2IPFl7TDlGfcwAYDYCHAOzLQlgYTLaWxGI9I4g6alDqz80AApkUyaW6XONQ
         zI3iHhmNakBpVjtfZKy6EOSJ2UOowENm6x9dYLIzofpOyBRtuyaxNpLitE5cs/1PL1du
         Qoi37JVXNQSZCRtfIWBcADa7CKbZJ7zw8BgaDqOgcHpB6cOi+xqK3CeWfxuPHPyu56Ry
         kL5w==
X-Gm-Message-State: AOJu0Yy13gq9xiq3PdT3CCucjhy33iEsb255nuwWQX6O1VfYjYlVgTe7
	euPfZqS6tSTnt1jY3Ouj4+dHoirujW5PgTXBzoJ0v1Oggz3k3zeOlUs4emDGsW50rHaT4korR52
	TqzZEWUOFiKppF+sjfu0DDt+qcue58xr7kEXSCw==
X-Google-Smtp-Source: AGHT+IGPbL+lSrPF3wumac7jsKuixE7ek8HWJVr/+4eCVs4UukkerJDEOp8wuuhpUnpS2FqesWstlzLVH9C6NSsx1rE=
X-Received: by 2002:a05:6512:485b:b0:52c:a5cc:27e7 with SMTP id
 2adb3069b0e04-52ea06c902emr3591284e87.66.1720180703379; Fri, 05 Jul 2024
 04:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240705113129.1798725-1-jstephan@baylibre.com>
In-Reply-To: <20240705113129.1798725-1-jstephan@baylibre.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 5 Jul 2024 13:58:12 +0200
Message-ID: <CAHUKmYbkkPdopJfNyhxtwBGmy9dh0b6myrwosmm5RyBzBqZaLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: fix do_symlink_kernsrc function
To: jstephan@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c6ced5061c7ec76b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 11:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201604

--000000000000c6ced5061c7ec76b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,
did you see my previous patch and the follow-up discussion?
Ticket: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15325
Previous discussion:
https://lists.openembedded.org/g/openembedded-core/topic/103308574#msg19523=
8


I think Richard wanted a solution where this errors out:
> I'm very tempted to say the "using a non default S value" just error
> out.
>
> Whilst I understand how we got to this level of complexity, I think it
> will just end up causing us pain in the long run and I'd rather just
> not support it.
>
> Cheers,
> Richard

=C3=89tienne

On Fri, Jul 5, 2024 at 1:34=E2=80=AFPM Julien Stephan via lists.openembedde=
d.org
<jstephan=3Dbaylibre.com@lists.openembedded.org> wrote:

> According to the comment in do_symlink_kernsrc, this function exists
> for compatibility with old style kernel recipes:
>
>     # Old style kernels may set ${S} =3D ${WORKDIR}/git for example
>
> For such recipes  S will always be different from STAGING_KERNEL_DIR.
> This is fine for the first build or when unpack is rerun because new
> sources are in S. However the following command breaks the build:
>
>     bitbake -C do_symlink_kernsrc virtual/kernel
>
> At this point, S is a symlink to STAGING_KERNEL_DIR, (meaning S !=3D
> STAGING_KERNEL_DIR). We first remove the contents of STAGING_KERNEL_DIR
> without removing the folder itself causing us to lose kernel sources.
> Then we create a symlink from S to STAGING_KERNEL_DIR which results in th=
e
> following broken symlinks:
>
>     ${WORKDIR}/git -> <...>/build/tmp/work-shared/<machine>/kernel-source
>     kernel-source -> <...>/build/tmp/work-shared/<machine>/kernel-source
>
> The build fails with the following error:
>
>     ERROR: <linux_recipe> do_kernel_checkout: FileExistsError(17, 'File
> exists')
>     ERROR: Task (<linux_recipe>:do_kernel_checkout)
>     failed with exit code '1'
>
> Attempting to access the kernel-source directory results in:
>
>     ls: cannot access 'kernel-source': Too many levels of symbolic links
>
> Fix this by checking if S is a symlink, and if so, verifying whether the
> symlink
> points to STAGING_KERNEL_DIR to avoid losing sources
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 89badd90f18..e328151cb59 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -184,7 +184,12 @@ do_clean[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DIR=
}
> ${B} ${STAGING_KERNEL_BUILDD
>  python do_symlink_kernsrc () {
>      s =3D d.getVar("S")
>      kernsrc =3D d.getVar("STAGING_KERNEL_DIR")
> -    if s !=3D kernsrc:
> +    if os.path.islink(s):
> +        _s =3D os.readlink(s)
> +    else:
> +        _s =3D s
> +
> +    if _s !=3D kernsrc:
>          bb.utils.mkdirhier(kernsrc)
>          bb.utils.remove(kernsrc, recurse=3DTrue)
>          if s[-1] =3D=3D '/':
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201601):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_201601&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DADx-AJwK4hclmY2pDBh97bnassJ0KI9f_OAKb9D6WpFFcYvO-chBh9k0SVobjYMK&s=3DN3u=
4aN5Ob1LBtzYAPrUgW7w1Yk_vN3KvuImWnp5g6LA&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_107052142_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DADx-AJwK4hclm=
Y2pDBh97bnassJ0KI9f_OAKb9D6WpFFcYvO-chBh9k0SVobjYMK&s=3DVbM00DcAJR0ZUsuhhPW=
tLEKKZ5MiBkhgS_Q4Aq3X3KM&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DADx-AJ=
wK4hclmY2pDBh97bnassJ0KI9f_OAKb9D6WpFFcYvO-chBh9k0SVobjYMK&s=3D7EbQmI1Lz7r_=
bu1RArY3qabfEim4bh48mxJPm1oN_N4&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c6ced5061c7ec76b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Julien,<br>did you see my previous patch and the follow=
-up discussion?<br>Ticket:=C2=A0<a href=3D"https://bugzilla.yoctoproject.or=
g/show_bug.cgi?id=3D15325">https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D15325</a>=C2=A0<br>Previous discussion:=C2=A0<a href=3D"https://lists.o=
penembedded.org/g/openembedded-core/topic/103308574#msg195238">https://list=
s.openembedded.org/g/openembedded-core/topic/103308574#msg195238</a>=C2=A0<=
br><br>I think Richard wanted a solution where this errors out:<br>&gt; I&#=
39;m very tempted to say the &quot;using a non default S value&quot; just e=
rror<br>&gt; out.<br>&gt;<br>&gt; Whilst I understand how we got to this le=
vel of complexity, I think it<br>&gt; will just end up causing us pain in t=
he long run and I&#39;d rather just<br>&gt; not support it.<br>&gt;<br>&gt;=
 Cheers,<br>&gt; Richard<br><br>=C3=89tienne</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 5, 2024 at 1:34=E2=
=80=AFPM Julien Stephan via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;jstephan=3D<a href=3D"mailto:baylibre.com@lists.o=
penembedded.org">baylibre.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">According to the commen=
t in do_symlink_kernsrc, this function exists<br>
for compatibility with old style kernel recipes:<br>
<br>
=C2=A0 =C2=A0 # Old style kernels may set ${S} =3D ${WORKDIR}/git for examp=
le<br>
<br>
For such recipes=C2=A0 S will always be different from STAGING_KERNEL_DIR.<=
br>
This is fine for the first build or when unpack is rerun because new<br>
sources are in S. However the following command breaks the build:<br>
<br>
=C2=A0 =C2=A0 bitbake -C do_symlink_kernsrc virtual/kernel<br>
<br>
At this point, S is a symlink to STAGING_KERNEL_DIR, (meaning S !=3D<br>
STAGING_KERNEL_DIR). We first remove the contents of STAGING_KERNEL_DIR<br>
without removing the folder itself causing us to lose kernel sources.<br>
Then we create a symlink from S to STAGING_KERNEL_DIR which results in the<=
br>
following broken symlinks:<br>
<br>
=C2=A0 =C2=A0 ${WORKDIR}/git -&gt; &lt;...&gt;/build/tmp/work-shared/&lt;ma=
chine&gt;/kernel-source<br>
=C2=A0 =C2=A0 kernel-source -&gt; &lt;...&gt;/build/tmp/work-shared/&lt;mac=
hine&gt;/kernel-source<br>
<br>
The build fails with the following error:<br>
<br>
=C2=A0 =C2=A0 ERROR: &lt;linux_recipe&gt; do_kernel_checkout: FileExistsErr=
or(17, &#39;File exists&#39;)<br>
=C2=A0 =C2=A0 ERROR: Task (&lt;linux_recipe&gt;:do_kernel_checkout)<br>
=C2=A0 =C2=A0 failed with exit code &#39;1&#39;<br>
<br>
Attempting to access the kernel-source directory results in:<br>
<br>
=C2=A0 =C2=A0 ls: cannot access &#39;kernel-source&#39;: Too many levels of=
 symbolic links<br>
<br>
Fix this by checking if S is a symlink, and if so, verifying whether the sy=
mlink<br>
points to STAGING_KERNEL_DIR to avoid losing sources<br>
<br>
Signed-off-by: Julien Stephan &lt;<a href=3D"mailto:jstephan@baylibre.com" =
target=3D"_blank">jstephan@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 89badd90f18..e328151cb59 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -184,7 +184,12 @@ do_clean[cleandirs] +=3D &quot; ${S} ${STAGING_KERNEL_=
DIR} ${B} ${STAGING_KERNEL_BUILDD<br>
=C2=A0python do_symlink_kernsrc () {<br>
=C2=A0 =C2=A0 =C2=A0s =3D d.getVar(&quot;S&quot;)<br>
=C2=A0 =C2=A0 =C2=A0kernsrc =3D d.getVar(&quot;STAGING_KERNEL_DIR&quot;)<br=
>
-=C2=A0 =C2=A0 if s !=3D kernsrc:<br>
+=C2=A0 =C2=A0 if os.path.islink(s):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _s =3D os.readlink(s)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _s =3D s<br>
+<br>
+=C2=A0 =C2=A0 if _s !=3D kernsrc:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(kernsrc, recurse=3DTrue)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if s[-1] =3D=3D &#39;/&#39;:<br>
-- <br>
2.45.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201601): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_20=
1601&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DADx-AJwK4hclmY2pDB=
h97bnassJ0KI9f_OAKb9D6WpFFcYvO-chBh9k0SVobjYMK&amp;s=3DN3u4aN5Ob1LBtzYAPrUg=
W7w1Yk_vN3KvuImWnp5g6LA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_201601&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DADx-AJwK4hclmY2pDBh97bnassJ0KI9f_OAKb9D6WpFFcYvO-chBh9k0SVobjY=
MK&amp;s=3DN3u4aN5Ob1LBtzYAPrUgW7w1Yk_vN3KvuImWnp5g6LA&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_107052142_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DADx-AJwK4hclmY2pDBh97bnassJ0KI9f_OAKb9D6WpFFcY=
vO-chBh9k0SVobjYMK&amp;s=3DVbM00DcAJR0ZUsuhhPWtLEKKZ5MiBkhgS_Q4Aq3X3KM&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_107052142_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DADx-AJwK4hclmY2pDBh97bnassJ0KI9=
f_OAKb9D6WpFFcYvO-chBh9k0SVobjYMK&amp;s=3DVbM00DcAJR0ZUsuhhPWtLEKKZ5MiBkhgS=
_Q4Aq3X3KM&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DADx-AJwK4hclmY2pDBh97bnassJ0KI9f_OAKb9D6WpF=
FcYvO-chBh9k0SVobjYMK&amp;s=3D7EbQmI1Lz7r_bu1RArY3qabfEim4bh48mxJPm1oN_N4&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DADx-AJwK4hclmY2pDBh9=
7bnassJ0KI9f_OAKb9D6WpFFcYvO-chBh9k0SVobjYMK&amp;s=3D7EbQmI1Lz7r_bu1RArY3qa=
bfEim4bh48mxJPm1oN_N4&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c6ced5061c7ec76b--


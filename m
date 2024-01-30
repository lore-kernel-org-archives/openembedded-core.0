Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7413DC46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 15:39:47 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.21207.1706629180513613499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 07:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=S8NGWdZg;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a315f43ecc3so415141966b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 07:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1706629179; x=1707233979; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe+hqewOoJJ7McfgXLAyfkZzPzzHNL1AqSdznIE6I4c=;
        b=S8NGWdZgv+r6kuKj7FsXvCV/6xT2TFH6fDmIzGsFI6VmvpZ33h4EH1LiqyHF1W2nYk
         oDikAFoX86YqOKuT8fPvCLLo+6JrLlf9fSwFZUIF59w9L0QYysMWZN8FMBnKiXObKeK9
         AJaFW4dhIMjE/EuPgP/1GsY4nonn5ZA0539aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706629179; x=1707233979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qe+hqewOoJJ7McfgXLAyfkZzPzzHNL1AqSdznIE6I4c=;
        b=wVOtkhZ+zVNMeth/y2pFa/Sl4zZc6QhNFtbNS5I53gwnkiuolWS23vg2cpgI1ZnnlH
         ddF1VFn96lX/kqAEBMCa5/CYKTGHstgwt5yP5hGtsFIom0VgCmvDf4AfeyhCB2XxFs7a
         FW9cUkQ7aZ5KMXFq/ORAIJcIUoDo58sqq/d9B9PPliMM6IPcvy4w328v1bzTu90hc9HF
         ApGmkJ69g80m4eCQ8+2pjcnPpC2ysDn8Zf6Fm9gUv2xAdy6ku51is0ceMeQKkAKom0VO
         EzYjKzbIiqj9zLwmVaBDMbRDob31mlOAbfa/Rt5uhQG0pIjJ5L0QxvtzkV45AEvBq9Zj
         FKaQ==
X-Gm-Message-State: AOJu0YzM7a251UcBx+ttGXfgv8u4mS3JlKAdSELKGq4AKizpFB1sRlAh
	P682JDD/6jeqmZLOGn1aBUtWARdgzoWU8gwmrf4g32dVDdh+twFXVDzQEDy0/fg63reqlNKosx+
	sqXW2phBzrH4DrdwGEj37aeachWAR15epgUWpnQ==
X-Google-Smtp-Source: AGHT+IECmw2VjAJI5b1YQysus+XYGBbFqBjefQpi8tQdpmgEmmF2XsUwbK7Dik9RcSdhMYnVMQTU7qjYemyRowMxvDY=
X-Received: by 2002:a17:906:3fc2:b0:a35:47fe:ed67 with SMTP id
 k2-20020a1709063fc200b00a3547feed67mr6061500ejj.77.1706629178784; Tue, 30 Jan
 2024 07:39:38 -0800 (PST)
MIME-Version: 1.0
References: <17A2F72F5D272934.28089@lists.openembedded.org> <17A2F73D8934EE37.10357@lists.openembedded.org>
In-Reply-To: <17A2F73D8934EE37.10357@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 30 Jan 2024 16:39:27 +0100
Message-ID: <CAHUKmYbSB7YvxRbriXxpG9+JumEysDgVW=SxBX=B1yjDCRMrtw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f75f6306102b916f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 15:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194496

--000000000000f75f6306102b916f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
what is the status of this patch? Was it rejected?

=C3=89tienne

On Thu, Dec 21, 2023 at 10:50=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> patch v5: added ignore_dangling_symlinks to avoid error when linux source=
s
> contain dangling symlinks
>
> On Thu, Dec 21, 2023 at 10:49=E2=80=AFPM Etienne Cordonnier via
> lists.openembedded.org
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded=
.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNon=
VuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DUCoMTsJKrnqkV-eQGGRGBeC-wIGTP7H0LR=
PvcTWkn9673LluHqkCpFInRctDEEct&s=3DAf3lZ-qHdVwBo6b8tlJ45PXYNer8GU6q0uxJ740c=
aCA&e=3D>
> <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
>
>> From: Etienne Cordonnier <ecordonnier@snap.com>
>>
>> The function do_symlink_kernsrc is not reentrant in the case where S is
>> defined
>> to a non-default value. This causes build-failures e.g. when building
>> linux-yocto, then updating
>> poky to a commit which modifies kernel.bbclass, and then building
>> linux-yocto again.
>>
>> Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15325
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctopr=
oject.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4=
vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3De=
o9dzHi2uXPV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&s=3De9FG4cG=
4GbLjCy8loEN6qVisSUax4Ngvd_Ok8TPonvY&e=3D>
>>
>> Tested with a recipe "my-custom-linux" which unpacks sources to a custom
>> ${S} directory
>> and ran symlink_kernsrc several times:
>> $ bitbake -f -c symlink_kernsrc my-custom-linux
>>
>> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> ---
>>  meta/classes-recipe/kernel.bbclass | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/kernel.bbclass
>> b/meta/classes-recipe/kernel.bbclass
>> index 9ff37f5c38..45b63f1fa1 100644
>> --- a/meta/classes-recipe/kernel.bbclass
>> +++ b/meta/classes-recipe/kernel.bbclass
>> @@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
>>              # drop trailing slash, so that os.symlink(kernsrc, s)
>> doesn't use s as
>>              # directory name and fail
>>              s =3D s[:-1]
>> -        if d.getVar("EXTERNALSRC"):
>> +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
>>              # With EXTERNALSRC S will not be wiped so we can symlink to
>> it
>>              os.symlink(s, kernsrc)
>>          else:
>>              import shutil
>> +            # perform idempotent/reentrant copy
>> +            s_copy =3D s + ".orig"
>> +            if not os.path.isdir(s_copy):
>> +                shutil.copytree(s, s_copy, ignore_dangling_symlinks=3DT=
rue)
>> +            bb.utils.remove(s, recurse=3DTrue)
>> +            shutil.copytree(s_copy, s, ignore_dangling_symlinks=3DTrue)
>>              shutil.move(s, kernsrc)
>>              os.symlink(kernsrc, s)
>>  }
>> --
>> 2.34.1
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192851):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_192851&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DUCoMTsJKrnqkV-eQGGRGBeC-wIGTP7H0LRPvcTWkn9673LluHqkCpFInRctDEEct&s=3DB4V=
cMp4VsG3L9jLpib5LmpAeOIt_ttUjQEayF-XUy_4&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103308574_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DUCoMTsJKrnqkV=
-eQGGRGBeC-wIGTP7H0LRPvcTWkn9673LluHqkCpFInRctDEEct&s=3D5tvkZnNNtvxAsWwN88H=
i9dl8qljZl0T9lLH0iQgy0Z0&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DUCoMTs=
JKrnqkV-eQGGRGBeC-wIGTP7H0LRPvcTWkn9673LluHqkCpFInRctDEEct&s=3DKa7j1CI_uOKY=
xtXQbSnfvzJwM4X1moECnj3FEMOL_UI&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f75f6306102b916f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>what is the status of this patch? Was it rejected?<=
br><br>=C3=89tienne</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Dec 21, 2023 at 10:50=E2=80=AFPM Etienne Cordonn=
ier via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org">snap=
.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr">patch v5: added ignore_dangling=
_symlinks to avoid error when linux sources contain dangling symlinks</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Dec 21, 2023 at 10:49=E2=80=AFPM Etienne Cordonnier via <a href=3D"https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;=
d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkb=
NonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DUCoMTsJKrnqkV-eQGGRGBeC-wIG=
TP7H0LRPvcTWkn9673LluHqkCpFInRctDEEct&amp;s=3DAf3lZ-qHdVwBo6b8tlJ45PXYNer8G=
U6q0uxJ740caCA&amp;e=3D" target=3D"_blank">lists.openembedded.org</a> &lt;e=
cordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org" target=3D"_=
blank">snap.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">From: Etienne Cordon=
nier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonn=
ier@snap.com</a>&gt;<br><br>The function do_symlink_kernsrc is not reentran=
t in the case where S is defined<br>to a non-default value. This causes bui=
ld-failures e.g. when building linux-yocto, then updating<br>poky to a comm=
it which modifies kernel.bbclass, and then building linux-yocto again.<br><=
br>Bugzilla: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&amp;d=3DDwMFaQ&am=
p;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_=
Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Deo9dzHi2uXPV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__=
SwnF1U1d0O2JxX3PprS_T9BN&amp;s=3De9FG4cG4GbLjCy8loEN6qVisSUax4Ngvd_Ok8TPonv=
Y&amp;e=3D" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D15325</a><br><br>Tested with a recipe &quot;my-custom-linux&quot; wh=
ich unpacks sources to a custom ${S} directory<br>and ran symlink_kernsrc s=
everal times:<br>$ bitbake -f -c symlink_kernsrc my-custom-linux<br><br>Sig=
ned-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" =
target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>---<br>=C2=A0meta/classes=
-recipe/kernel.bbclass | 8 +++++++-<br>=C2=A01 file changed, 7 insertions(+=
), 1 deletion(-)<br><br>diff --git a/meta/classes-recipe/kernel.bbclass b/m=
eta/classes-recipe/kernel.bbclass<br>index 9ff37f5c38..45b63f1fa1 100644<br=
>--- a/meta/classes-recipe/kernel.bbclass<br>+++ b/meta/classes-recipe/kern=
el.bbclass<br>@@ -189,11 +189,17 @@ python do_symlink_kernsrc () {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# drop trailing slash, so that=
 os.symlink(kernsrc, s) doesn&#39;t use s as<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0# directory name and fail<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0s =3D s[:-1]<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.g=
etVar(&quot;EXTERNALSRC&quot;):<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar=
(&quot;EXTERNALSRC&quot;) and not os.path.islink(s):<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# With EXTERNALSRC S will not be wiped so we=
 can symlink to it<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.sy=
mlink(s, kernsrc)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import shutil<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# perform idempotent/reentrant copy<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s_copy =3D s + &quot;.orig&quot;<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.isdir(s_copy):<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copytree(s, s_co=
py, ignore_dangling_symlinks=3DTrue)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bb.utils.remove(s, recurse=3DTrue)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0shutil.copytree(s_copy, s, ignore_dangling_symlinks=3DTrue=
)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.move(s, kernsrc=
)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(kernsrc, s)=
<br>=C2=A0}<br>-- <br>2.34.1<br></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192851): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
2851&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DUCoMTsJKrnqkV-eQGG=
RGBeC-wIGTP7H0LRPvcTWkn9673LluHqkCpFInRctDEEct&amp;s=3DB4VcMp4VsG3L9jLpib5L=
mpAeOIt_ttUjQEayF-XUy_4&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_192851&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DUCoMTsJKrnqkV-eQGGRGBeC-wIGTP7H0LRPvcTWkn9673LluHqkCpFInRctDEE=
ct&amp;s=3DB4VcMp4VsG3L9jLpib5LmpAeOIt_ttUjQEayF-XUy_4&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_103308574_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DUCoMTsJKrnqkV-eQGGRGBeC-wIGTP7H0LRPvcTWkn9673L=
luHqkCpFInRctDEEct&amp;s=3D5tvkZnNNtvxAsWwN88Hi9dl8qljZl0T9lLH0iQgy0Z0&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103308574_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DUCoMTsJKrnqkV-eQGGRGBeC-wIGTP7H=
0LRPvcTWkn9673LluHqkCpFInRctDEEct&amp;s=3D5tvkZnNNtvxAsWwN88Hi9dl8qljZl0T9l=
LH0iQgy0Z0&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DUCoMTsJKrnqkV-eQGGRGBeC-wIGTP7H0LRPvcTWkn96=
73LluHqkCpFInRctDEEct&amp;s=3DKa7j1CI_uOKYxtXQbSnfvzJwM4X1moECnj3FEMOL_UI&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DUCoMTsJKrnqkV-eQGGRG=
BeC-wIGTP7H0LRPvcTWkn9673LluHqkCpFInRctDEEct&amp;s=3DKa7j1CI_uOKYxtXQbSnfvz=
JwM4X1moECnj3FEMOL_UI&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f75f6306102b916f--


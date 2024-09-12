Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB9FEED62C
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 17:29:44 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web11.53955.1726162178144143373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 10:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qc4rHP3+;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-49bbed1dad5so305858137.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726162177; x=1726766977; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C2ps+R0IDPbX17OFyUe3BullqfaKGNq4RjgvIYBKPfA=;
        b=Qc4rHP3+P60lpSQsO0OZXOuOKjW+CXRV2aXK1lZItHUwB9/iLRTNTWGNwpVZ2Rqb9L
         YcMEb+wkzqhuWFsQb7vrbQCsQPccHxU5HgA1r/MMflw/n+i3auelG6CA0JRoNlY4nw7j
         9B40gUz9d4hgpn30n8G7DfNNbtKnVZVgeht9AXWoQikIhw+cYcQJvOyhp8BRZT+dwTHS
         MYGt7QY4dOR34+bAKhJdzTOoGESqB08OgKfHi+xLa9iSGQm9IX3e/EB602V0Sziu0eA8
         RXpOLumNjchX2ucRB4ShoXFxZ6TifmjqkEzp1bnsFA6O+F+Gt1qTLjGaCXlnWDxXSEc0
         pi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726162177; x=1726766977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2ps+R0IDPbX17OFyUe3BullqfaKGNq4RjgvIYBKPfA=;
        b=uDSoNKXq94L4sdsrrDqdIdzuIKSoBptBb1pf9t3BR4eT5ZX6/N63zjaaKZyjtHiNgT
         JeAfkGI4Sw5h6ZhWbs86kp4v5+uB31kGJ/me65IIZd5UWaS8p83iDInzVuC7SXzBSfyN
         RB5nMl2pVLjGWYHeQBhlUyTGuyZL9ZRr8qgJ6DLmyaFsYNW0LjMrSEYfWDZLPRZbnr8s
         EyWiywIv6UQ22tB18pdA+CRom40mMzq9Dv3s6/0OvCgPxnmdX9OHRsPgb+n/FfNSp3fh
         NHfEDa3r442T6tXfh3EXH2EuCQumPBPpMC93nlmLJVWfAa9GSteGj0tGuiPX9sHtocUn
         BjvA==
X-Gm-Message-State: AOJu0Yz0w3sQC2M1B9Ka5CfbAjhK8y09BjQulxSCIcuCqoqWxtVx4v91
	biOUmoGQemT0YSNyx1+JeKQweztiMfs6qMorAxgFGDnPmG74znImx+fx9zhR+Qj2yQf7Sclzeu2
	ak2iq+oICVNRsZU5HiLYtY7DpQHY=
X-Google-Smtp-Source: AGHT+IGZ/qHXERpSeYLbfjlOEwiyJGCLJPIyL0AXKKuEr8aD0FcdGveUFai3ljmkHffpLNb8PP1vS6B/XGICjhoQR78=
X-Received: by 2002:a05:6102:c92:b0:49b:eae3:bdae with SMTP id
 ada2fe7eead31-49d414806a4mr2862938137.9.1726162176877; Thu, 12 Sep 2024
 10:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240912165736.1531460-1-ross.burton@arm.com>
In-Reply-To: <20240912165736.1531460-1-ross.burton@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 12 Sep 2024 18:29:25 +0100
Message-ID: <CANPvuRki7+qYDDvYP96PdSBSFMSE3AKKKNei_q9RNhpdb5F-bA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: check for working user namespaces
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000060affe0621ef7320"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 17:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204454

--00000000000060affe0621ef7320
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross Burton via lists.openembedded.org <ross.burton=3D
arm.com@lists.openembedded.org> escreveu (quinta, 12/09/2024 =C3=A0(s) 17:5=
7):

> If user namespaces are not available (typically because AppArmor is
> blocking them), alert the user.
>
> We consider network isolation sufficiently important that this is a fatal
> error, and the user will need to configure AppArmor to allow bitbake to
> create a user namespace.
>
> [ YOCTO #15592 ]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-global/sanity.bbclass | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/meta/classes-global/sanity.bbclass
> b/meta/classes-global/sanity.bbclass
> index 1d242f0f0a0..72dab0fea2b 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -475,6 +475,29 @@ def check_wsl(d):
>              bb.warn("You are running bitbake under WSLv2, this works
> properly but you should optimize your VHDX file eventually to avoid runni=
ng
> out of storage space")
>      return None
>
> +def check_userns():
> +    """
> +    Check that user namespaces are functional, as they're used for
> network isolation.
> +    """
> +
> +    # There is a known failure case with AppAmrmor where the unshare()
> call
> +    # succeeds (at which point the uid is nobody) but writing to the
> uid_map
> +    # fails (so the uid isn't reset back to the user's uid). We can
> detect this.
> +    parentuid =3D os.getuid()
> +    pid =3D os.fork()
> +    if not pid:
> +        try:
> +            bb.utils.disable_network()
> +        except:
> +            pass
> +        os._exit(parentuid !=3D os.getuid())
> +
> +    ret =3D os.waitpid(pid, 0)[1]
> +    if ret:
> +        bb.fatal("User namespaces are not usable by BitBake, possibly du=
e
> to AppArmor.\n"
> +                 "See
> https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-note=
s/39890#unprivileged-user-namespace-restrictions
> for more information.")
>

The error message could be better imo.
It will also happen inside a docker container that runs without the
NET_ADMIN capability, which is the default.
https://docs.docker.com/engine/containers/run/#runtime-privilege-and-linux-=
capabilities

Jose


> +
> +
>  # Require at least gcc version 8.0
>  #
>  # This can be fixed on CentOS-7 with devtoolset-6+
> @@ -641,6 +664,7 @@ def check_sanity_version_change(status, d):
>      status.addresult(check_git_version(d))
>      status.addresult(check_perl_modules(d))
>      status.addresult(check_wsl(d))
> +    status.addresult(check_userns())
>
>      missing =3D ""
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204449):
> https://lists.openembedded.org/g/openembedded-core/message/204449
> Mute This Topic: https://lists.openembedded.org/mt/108416977/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000060affe0621ef7320
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Ross Burton via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=
=3D"mailto:arm.com@lists.openembedded.org">arm.com@lists.openembedded.org</=
a>&gt; escreveu (quinta, 12/09/2024 =C3=A0(s) 17:57):<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">If user namespaces are not available =
(typically because AppArmor is<br>
blocking them), alert the user.<br>
<br>
We consider network isolation sufficiently important that this is a fatal<b=
r>
error, and the user will need to configure AppArmor to allow bitbake to<br>
create a user namespace.<br>
<br>
[ YOCTO #15592 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/sanity.bbclass | 24 ++++++++++++++++++++++++<br>
=C2=A01 file changed, 24 insertions(+)<br>
<br>
diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanit=
y.bbclass<br>
index 1d242f0f0a0..72dab0fea2b 100644<br>
--- a/meta/classes-global/sanity.bbclass<br>
+++ b/meta/classes-global/sanity.bbclass<br>
@@ -475,6 +475,29 @@ def check_wsl(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;You are runni=
ng bitbake under WSLv2, this works properly but you should optimize your VH=
DX file eventually to avoid running out of storage space&quot;)<br>
=C2=A0 =C2=A0 =C2=A0return None<br>
<br>
+def check_userns():<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Check that user namespaces are functional, as they&#39;re us=
ed for network isolation.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 # There is a known failure case with AppAmrmor where the uns=
hare() call<br>
+=C2=A0 =C2=A0 # succeeds (at which point the uid is nobody) but writing to=
 the uid_map<br>
+=C2=A0 =C2=A0 # fails (so the uid isn&#39;t reset back to the user&#39;s u=
id). We can detect this.<br>
+=C2=A0 =C2=A0 parentuid =3D os.getuid()<br>
+=C2=A0 =C2=A0 pid =3D os.fork()<br>
+=C2=A0 =C2=A0 if not pid:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.disable_network()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os._exit(parentuid !=3D os.getuid())<br>
+<br>
+=C2=A0 =C2=A0 ret =3D os.waitpid(pid, 0)[1]<br>
+=C2=A0 =C2=A0 if ret:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;User namespaces are not usable =
by BitBake, possibly due to AppArmor.\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;See <a=
 href=3D"https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-relea=
se-notes/39890#unprivileged-user-namespace-restrictions" rel=3D"noreferrer"=
 target=3D"_blank">https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-nu=
mbat-release-notes/39890#unprivileged-user-namespace-restrictions</a> for m=
ore information.&quot;)<br></blockquote><div><br></div><div>The error messa=
ge could be better imo.<br>It will also happen inside a docker container th=
at runs without the NET_ADMIN capability, which is the default.<br><a href=
=3D"https://docs.docker.com/engine/containers/run/#runtime-privilege-and-li=
nux-capabilities">https://docs.docker.com/engine/containers/run/#runtime-pr=
ivilege-and-linux-capabilities</a><br></div><div><br></div><div>Jose</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+<br>
=C2=A0# Require at least gcc version 8.0<br>
=C2=A0#<br>
=C2=A0# This can be fixed on CentOS-7 with devtoolset-6+<br>
@@ -641,6 +664,7 @@ def check_sanity_version_change(status, d):<br>
=C2=A0 =C2=A0 =C2=A0status.addresult(check_git_version(d))<br>
=C2=A0 =C2=A0 =C2=A0status.addresult(check_perl_modules(d))<br>
=C2=A0 =C2=A0 =C2=A0status.addresult(check_wsl(d))<br>
+=C2=A0 =C2=A0 status.addresult(check_userns())<br>
<br>
=C2=A0 =C2=A0 =C2=A0missing =3D &quot;&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#204449): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/204449" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/204449</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108416977/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108416977/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000060affe0621ef7320--


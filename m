Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313DBC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 19:02:45 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.22547.1713380557696831487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 12:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJFfOWS8;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c7150cff81so40953b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713380557; x=1713985357; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TamCXk9rvv/Ch6The9jHwgeQyyCwfXbteCHBhA9kXXE=;
        b=KJFfOWS8VCsmwgu4JaZH9j8j0ELjhYPFWzgm1vKYPDGe0sgq/pFyN+Y6zFPRdiyKWu
         7pD7Fkb5kqvnM6EMUT9FD9PutvXC1LsEZ67SewR3jUM3NgIb2hkxlnf5XK/rKKmMEvoH
         w5wetNgUoF8HTbkdPQ3u92wdhMfFsCMddXqzKrmmCj7k4CZwOebYuHcpcyWEvT/6lY2v
         fweHdpbUI9db6uzKNvmbw/ueFm8Go1MqVQqm5aHnJEQvfIX23meq3lxH3uKTd1ZfKQpo
         AntvhQBM80UmNKtlR77eKzPvr9CMWa+mnA5R6OtnyJnNeONqXj2jkPsjgYZd8FYTXbt5
         q5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713380557; x=1713985357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TamCXk9rvv/Ch6The9jHwgeQyyCwfXbteCHBhA9kXXE=;
        b=SO1/fjpycz27sSwpF8LW2q7mHnZ/KM67KuqVag7IQQWo7aA5kLq1pQL41qedpChErZ
         973tX2ASYj63UumyfQaIPsdYTfCnZunWgOSpGiO6HjBQALvPeZAuxYg3x4orSNCRXtfv
         sr/H7uC7PcGrUpef8DpWbXOtCb9tcFS6YWbsBv8bg3Slln1KGZQf1FoaOfsAAv9/lMr4
         myIX53O7COVDZ2dsnC6f6y8oPYwUkPHd+yCVKUG+I5w5j3aessRfPT7IsdPSu6cAjypi
         gW1PMmV8RfBW8vbtIgMhnf/MGCw7s1X43OZJ8COJ9dxFnxzt10s9AXUBUukaTU/ik6jI
         +mkg==
X-Gm-Message-State: AOJu0Yzzwe+H2kP5n6RWDgS7PUqsWHH9ohf7nMoW9mKmEJu7JrYE5feG
	wnCaPg9hl1YM1VRuj4OZiih3LNuuDvEGriGNeh/tJy2/iZ95T292BK+vCDS7gTxwoMF3XksVXNH
	/r5zMkiXZzD+/tWGS42PlOM0fhdQ=
X-Google-Smtp-Source: AGHT+IEUsSF5rLYdk2iQupWfBNxW3MTmiNt1BVCFNZ/qOsxt2z+IQyZRXmlqWrvo2ro9ApnTFiTve5BaTgVGg6XEXws=
X-Received: by 2002:a05:6808:3012:b0:3c7:3140:256e with SMTP id
 ay18-20020a056808301200b003c73140256emr497357oib.14.1713380556860; Wed, 17
 Apr 2024 12:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240417181159.100583-1-wltu@...> <20240417182459.102143-1-wltu@google.com>
In-Reply-To: <20240417182459.102143-1-wltu@google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Apr 2024 12:02:25 -0700
Message-ID: <CAMKF1soiKx-fr4r+eGWNFPk1AQ576MRsVehLh_v4fZtQA9e0zA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-target-config: fix featrue for vfpv4f16
To: wltu@google.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000074f91f06164f7fb3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 19:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198474

--00000000000074f91f06164f7fb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 11:25=E2=80=AFAM Willy Tu via lists.openembedded.or=
g <wltu=3D
google.com@lists.openembedded.org> wrote:

> Based on [1] which fixed the target for vfpv3d16. Adding the support for
> vfpv4d16 with the same set of changes.
>

Lgtm


> Tested with running tokio which hit coredump before the change. It
> worked fine after this change.
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/185702
>
> Signed-off-by: Willy Tu <wltu@google.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass
> b/meta/classes-recipe/rust-target-config.bbclass
> index 926b0630b1..330ad8a3f5 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -21,6 +21,9 @@ def llvm_features_from_tune(d):
>
>      if 'vfpv4' in feat:
>          f.append("+vfp4")
> +    elif 'vfpv4d16' in feat:
> +        f.append("+vfp4")
> +        f.append("-d32")
>      elif 'vfpv3' in feat:
>          f.append("+vfp3")
>      elif 'vfpv3d16' in feat:
> --
> 2.44.0.769.g3c40516874-goog
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198473):
> https://lists.openembedded.org/g/openembedded-core/message/198473
> Mute This Topic: https://lists.openembedded.org/mt/105583303/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000074f91f06164f7fb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 17, 2024 at 11:25=E2=80=AFAM Willy Tu via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;wltu=3D=
<a href=3D"mailto:google.com@lists.openembedded.org">google.com@lists.opene=
mbedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Based on=
 [1] which fixed the target for vfpv3d16. Adding the support for<br>
vfpv4d16 with the same set of changes.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Lgtm</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Tested with running tokio which hit coredump before the change. It<br>
worked fine after this change.<br>
<br>
[1] <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/1=
85702" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/message/185702</a><br>
<br>
Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=3D"_b=
lank">wltu@google.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/rust-target-config.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-=
recipe/rust-target-config.bbclass<br>
index 926b0630b1..330ad8a3f5 100644<br>
--- a/meta/classes-recipe/rust-target-config.bbclass<br>
+++ b/meta/classes-recipe/rust-target-config.bbclass<br>
@@ -21,6 +21,9 @@ def llvm_features_from_tune(d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0if &#39;vfpv4&#39; in feat:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.append(&quot;+vfp4&quot;)<br>
+=C2=A0 =C2=A0 elif &#39;vfpv4d16&#39; in feat:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;+vfp4&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.append(&quot;-d32&quot;)<br>
=C2=A0 =C2=A0 =C2=A0elif &#39;vfpv3&#39; in feat:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.append(&quot;+vfp3&quot;)<br>
=C2=A0 =C2=A0 =C2=A0elif &#39;vfpv3d16&#39; in feat:<br>
-- <br>
2.44.0.769.g3c40516874-goog<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198473): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198473" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198473</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105583303/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105583303/1997914</a><br>
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

--00000000000074f91f06164f7fb3--


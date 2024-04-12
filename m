Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9EFC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 01:40:40 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.37081.1712886035306423034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 18:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MU+xFgPn;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61871ad6cabso4266977b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 18:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712886034; x=1713490834; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X5GIQ1kbwm5HGUvBzGoK30RdwWLkoqG00cxsa96/4vk=;
        b=MU+xFgPnC+t0iq6TuzzqtkbwdFCVZU5o07u+mqqtAVCtk5dIXkHWJ+uL6J3U8gFmnD
         1GAY2v4ZdkqiypysblCXAJfCYnry6j30iXHJNU6btmQTgNmfSVWuxYkJkex83TyzuhQF
         ksYdYL+qOe6vwjgtGFlYWEIelmpMwJ1IfYk7a9Vi8tUxUuV7BiaOFKuHv0DlNqcWBR7d
         zf66c8CXykC+/IfRJJN41uBEmttD5uz6zHJ4xMNeXs5InPB3h0aP+RSu5vlUbms4JpJm
         Ko7fLoXpA6MIy4e+Vrqa882InJSeBMvQTRzc6ZmK3adbYBIT0QYtRwJOrqa7st9sDTsx
         Z4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712886034; x=1713490834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5GIQ1kbwm5HGUvBzGoK30RdwWLkoqG00cxsa96/4vk=;
        b=cRJjuGZp5j8OH8NsTMXcuAi3RrIddAvILEKgM+xxyUtXT1LSaux6RETANtO+SEkpzu
         sYShlJ4jRCNLVf8qt+trXvkojfvl5hODft+oPU8VwaRylQU2nT3u3PQS9f+zh7RVtLiL
         k/cSm3VGf/Njd9QPfCA+wxoxtA5kp7U+ysxvRxskWb2SclTViEugdXB3n3IDQIlEQwcD
         DOFOmsXtPo4FiKR7lW82nHW3tUw+GvGzRupXp8Q2zn72uw40xFRXnS4ySHMl+vOO7TVo
         YOkTndPaN7ztbJ8pWuVYdFTVfOovU+nb7lZqqKZMK8mxC2FMX6IKkMGefOWSZhXirqQT
         5YEA==
X-Gm-Message-State: AOJu0YwukbDCxfwJz2cp4FCrDjXVo2F0KQeFo9VW/yi1Z3QEAeOxp/Et
	nNfeQN5Y+ISfkeM8rhLPisWJM/hZzDIXHoWKasrH2F227MSx4XuOQQn6tksevBivCUCfvXAwKrE
	pAyCGjpPmMZydZ8MK9Nsx+FivlZg=
X-Google-Smtp-Source: AGHT+IELcPeM0n769WPrv5vWBzwzY5LJdQPp0SAoAy03INNacAFHgUP1hfJXlECoJpA5EI9FlVrUmY1DVOZ9FFpaKYg=
X-Received: by 2002:a0d:d5d6:0:b0:618:1034:f4ef with SMTP id
 x205-20020a0dd5d6000000b006181034f4efmr1081438ywd.16.1712886034436; Thu, 11
 Apr 2024 18:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <17C559CE68ECB247.4467@lists.openembedded.org>
In-Reply-To: <17C559CE68ECB247.4467@lists.openembedded.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 11 Apr 2024 19:40:21 -0600
Message-ID: <CACS+7ZQkX_BRzWCfyFgJ1ZxP6JVB2BjoDUJM-_FVALoKawVaSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: add fido2 support
To: Dan McGregor <danismostlikely@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009f991b0615dc5b9c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 01:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198151

--0000000000009f991b0615dc5b9c
Content-Type: text/plain; charset="UTF-8"

Of course.. I thought I saw OpenSSH 9.7 merge, I'll rebase this on
master-next.

On Thu, Apr 11, 2024, 16:19 Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:

> OpenSSH supports FIDO security keys in both the client
> and server.  Add an option to support them in oe.
> This change requires a new recipe that I've submitted to
> meta-openembedded that has not merged yet.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> index 78d1ca81626..6f016b471b4 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -59,6 +59,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', 'systemd', '', d)
>  # and systemd-sshd-service-mode corresponding to sshd.service
>  PACKAGECONFIG ??= "systemd-sshd-socket-mode \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'krb5',
> 'kerberos', '', d)}"
> +PACKAGECONFIG[fido2] =
> "--with-security-key-builtin,--disable-security-key,libfido2"
>  PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
>  PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198146):
> https://lists.openembedded.org/g/openembedded-core/message/198146
> Mute This Topic: https://lists.openembedded.org/mt/105472898/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009f991b0615dc5b9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Of course.. I thought I saw OpenSSH 9.7 merge, I&#39=
;ll rebase this on master-next.<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Apr 11, 2024, 16:19 Dan McGregor via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;da=
nismostlikely=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">OpenSSH supports FIDO security keys in both the client<br>
and server.=C2=A0 Add an option to support them in oe.<br>
This change requires a new recipe that I&#39;ve submitted to<br>
meta-openembedded that has not merged yet.<br>
<br>
Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca" ta=
rget=3D"_blank" rel=3D"noreferrer">dan.mcgregor@usask.ca</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">openssh_9.6p1.bb</a> | 1 +=
<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.=
6p1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">openssh_9.6p1.bb</a=
> b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p1.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
index 78d1ca81626..6f016b471b4 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
@@ -59,6 +59,7 @@ DEPENDS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATU=
RES&#39;, &#39;systemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)<br>
=C2=A0# and systemd-sshd-service-mode corresponding to sshd.service<br>
=C2=A0PACKAGECONFIG ??=3D &quot;systemd-sshd-socket-mode \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;krb5&#39;, &#39;kerberos&#3=
9;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG[fido2] =3D &quot;--with-security-key-builtin,--disable-secur=
ity-key,libfido2&quot;<br>
=C2=A0PACKAGECONFIG[kerberos] =3D &quot;--with-kerberos5,--without-kerberos=
5,krb5&quot;<br>
=C2=A0PACKAGECONFIG[ldns] =3D &quot;--with-ldns,--without-ldns,ldns&quot;<b=
r>
=C2=A0PACKAGECONFIG[libedit] =3D &quot;--with-libedit,--without-libedit,lib=
edit&quot;<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198146): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198146" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/198146</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105472898/361=
7261" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/105472898/3617261</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:danismostlikely=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">danismostlikely@gmail.com<=
/a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000009f991b0615dc5b9c--


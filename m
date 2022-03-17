Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3A7C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 06:53:46 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web09.7414.1647500025166775753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 23:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AesMe9iq;
 spf=pass (domain: gmail.com, ip: 209.85.221.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id h205so647123vke.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 23:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RtKWW3maI9YYapG1hk+1n3Hu9Mo1/fyXyl1uVGEiHQQ=;
        b=AesMe9iqMhnsNeV3sZkVjEI6RoascxrBwunX1kJn7LhNt4EspNL+FYz/8HWKhdAb/y
         v+U26qozxEaFjNvaJAkVMoRDHMVWB4Irj4IflE1HpiT9zn5kwCJq1+1JTxYIfkNnLi4D
         zd2B+SoKeAfV6M+jZIpSdANUSYTaGKU3BoKkH8PEcHcOVOeEJgrvHe4Ynku9AGK0HhBU
         eegTjmraye9dyhiuiwA5ueXbJp5DWi248RNPsOynnISHsaxzABxfeXT494MM09+F5nTB
         kFUCnot1W6A3cImzf4NbS+9gQCC8iOUUFlq8xJAtKiVVf9qTCV0omjC622NRa/dcrAmo
         giMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RtKWW3maI9YYapG1hk+1n3Hu9Mo1/fyXyl1uVGEiHQQ=;
        b=JH0qnduZOr8pEjyDp9rKNNhO5YmMddRXRoh7qPD8FLdAaoQA0j2Y9HTutGVd6XIZvI
         B1YZbmY3XT7Eqma0/sjS7sIHxM6Rk4S1XVOCCrY1DZ2ogTNEzkbXIMVYukmPYpYPl6hB
         eW2dCt6EbKNuLbINkkG69cy4XavE/Zje8frLzg5/3J8oEnIXjNFqA2KPWy8ypq46JAGF
         7YLkGzBpexDH90GfhqPrT/Aya5KdBhgFrXfPWLmvB3e2GwSvEuVY+LVAk4b+Ob/OVKUj
         8fQLpARbKHISblLH8KCu/CZ7RQwlI+fjDbf1bx7oR3qp/YWn+fqAEoox8MdTS4csiMkX
         YxUA==
X-Gm-Message-State: AOAM532XpqMlXJcKwVMq138jhKuJM0AxjgOFNVsMlnRl3BUnr/bf6BrK
	2+zJAzddukI3x7Jgo8uJIe5QHIwmDSmyrhzpqXA=
X-Google-Smtp-Source: 
 ABdhPJxmlqDfIqP2Zwhyfe3JSKl1aQRCZXqgblsBxA72N7rQbhC3+/UCOpLdasoWQWM4OMqHqqG+846gmtCD5/5Zkek=
X-Received: by 2002:a05:6122:208d:b0:337:7db2:8684 with SMTP id
 i13-20020a056122208d00b003377db28684mr1463887vkd.1.1647500024206; Wed, 16 Mar
 2022 23:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220317030519.1423570-1-ricardo@foundries.io>
In-Reply-To: <20220317030519.1423570-1-ricardo@foundries.io>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Mar 2022 07:53:33 +0100
Message-ID: 
 <CANNYZj87yUzr__GtYtsneOGdESX6EsfLCSbHnUdAkme4tAHCzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libpam: use /run instead of /var/run in systemd
 tmpfiles
To: Ricardo Salveti <ricardo@foundries.io>
Cc: daiane.angolini@foundries.io, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b5db4105da647d67"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 06:53:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163372

--000000000000b5db4105da647d67
Content-Type: text/plain; charset="UTF-8"

A link to back up the claim would be helpful. Also, what makes this file
and setting systemd specific?

Alex

On Thu 17. Mar 2022 at 4.05, Ricardo Salveti <ricardo@foundries.io> wrote:

> /var/run in deprecated by systemd, use /run instead, as suggested by
> systemd.
>
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  meta/recipes-extended/pam/libpam/pam-volatiles.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/pam/libpam/pam-volatiles.conf
> b/meta/recipes-extended/pam/libpam/pam-volatiles.conf
> index d8b8259a93..1263feb03d 100644
> --- a/meta/recipes-extended/pam/libpam/pam-volatiles.conf
> +++ b/meta/recipes-extended/pam/libpam/pam-volatiles.conf
> @@ -1 +1 @@
> -d /var/run/sepermit 0755 root root - -
> +d /run/sepermit 0755 root root - -
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163371):
> https://lists.openembedded.org/g/openembedded-core/message/163371
> Mute This Topic: https://lists.openembedded.org/mt/89838112/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b5db4105da647d67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">A link to back up the claim would be helpful. Also, what =
makes this file and setting systemd specific?</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu 17. Mar 2022 at 4.05, Ricardo Salveti=
 &lt;<a href=3D"mailto:ricardo@foundries.io">ricardo@foundries.io</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">/var/run in deprecated by systemd, use /run=
 instead, as suggested by systemd.<br>
<br>
Signed-off-by: Ricardo Salveti &lt;<a href=3D"mailto:ricardo@foundries.io" =
target=3D"_blank">ricardo@foundries.io</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/pam/libpam/pam-volatiles.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/pam/libpam/pam-volatiles.conf b/meta/rec=
ipes-extended/pam/libpam/pam-volatiles.conf<br>
index d8b8259a93..1263feb03d 100644<br>
--- a/meta/recipes-extended/pam/libpam/pam-volatiles.conf<br>
+++ b/meta/recipes-extended/pam/libpam/pam-volatiles.conf<br>
@@ -1 +1 @@<br>
-d /var/run/sepermit 0755 root root - -<br>
+d /run/sepermit 0755 root root - -<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163371): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163371" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163371</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89838112/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89838112/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b5db4105da647d67--


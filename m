Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAF7C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 11:18:10 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web12.5785.1659698281481052718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 04:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hCgNRfgn;
 spf=pass (domain: gmail.com, ip: 209.85.219.170,
 mailfrom: beniaminsandu@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 7so3399204ybw.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=D1hHcqpPUnQILhap8alIakfB/4fMmTlBN0FwZ2vW1Y0=;
        b=hCgNRfgn71Fwd7iC/Ex+CYhHzojOzS2Z15p+cXlgpsSdwAKlBEkTIjBx7mbIG+6q0j
         jv81m3RnJyVshtbSHeBOZGq7AdHw4NuU8C/kw4p+dHWE/lG1SVBtrSg4MlV4L4tlZnSI
         9egn48XARVMKv8ysItGwIjRq66DBYGUMKWqYTDO13dPFt9NYfQGXsZHFwv5E6NzLaUFx
         m3Qibatw8/1LE6rNpBmU3r29K0wsNOySJ03N54UDRa03YE1uATVVsq9HbfiGYSc1MI32
         sjDGZurvD3zFmlnsldPj/6/E59e4Md6Bg2UTSjk461wwoUN0Rr0U9HnXi/4B6wdl42UW
         sAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=D1hHcqpPUnQILhap8alIakfB/4fMmTlBN0FwZ2vW1Y0=;
        b=x8TLVMJSvt+MxB7QTqcIWvF+F+tR9lszsXaiEi6zwalS+U7LAlw59Loa5cMznigvWn
         iczuwKjNabilnVyOUOoEGvx6I+i6PIDsfcPNS2i8+npOCt7304QQJ3HRPhMzkoAGZwYS
         Lev5WGbmreFEURc5AWcd9xLGe+woj24KY9ML22QqXLV9FQSVE7RQIUuLkJ7LgNq0nkHM
         lxrxkTCkoYLS5jpo956lStJLAXCYONJT1dQJG5NdHysBDhWdc/4tsaL7cqEdoB13YhrE
         6NR6am1cY4zVmjmab77qB3tGrO+0ZkNFBuQ4XyxT5P2YNVEQ6Icq1vPA0vYLPcA4i58p
         ZHAQ==
X-Gm-Message-State: ACgBeo0H4ecc9PGuL4w5ZWeBg04N27z9f4pb2e2Hsy5xjaxuqZMujWEh
	5a3mWoVIXXrxYX8Wame8I2tpj527/8b80EAhn0AimlNC
X-Google-Smtp-Source: 
 AA6agR7tKybR2PD6h90Z5MzB5aPo/CR4e5wo+09s4ty5mHYyOxkuistkXblT7Oun2skeLr/SfH7xkD8mJZCvpt4//18=
X-Received: by 2002:a25:74c4:0:b0:676:dba6:1201 with SMTP id
 p187-20020a2574c4000000b00676dba61201mr4927838ybc.438.1659698280476; Fri, 05
 Aug 2022 04:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220804113818.31414-1-beniaminsandu@gmail.com>
In-Reply-To: <20220804113818.31414-1-beniaminsandu@gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Fri, 5 Aug 2022 14:19:03 +0300
Message-ID: 
 <CABQJdOEDPeUg0HGMVBBuDFHyb4QxLj=G3kKC95_h-tPiUKOi_w@mail.gmail.com>
Subject: Re: [PATCH] libpam: use /run instead of /var/run in systemd tmpfiles
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000071336605e57c9e8a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 11:18:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168933

--00000000000071336605e57c9e8a
Content-Type: text/plain; charset="UTF-8"

Please disregard this change, it seems I was looking in the wrong place and
this file is not actually used with systemd.

Thanks,
Beni

On Thu, Aug 4, 2022 at 2:37 PM Beniamin Sandu <beniaminsandu@gmail.com>
wrote:

> Update the deprecated path to remove the systemd warning:
>
> /etc/tmpfiles.d/pam.conf:2: Line references path below
> legacy directory /var/run/, updating /var/run/console
> /run/console; please update the tmpfiles.d/
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  meta/recipes-extended/pam/libpam/99_pam | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/pam/libpam/99_pam
> b/meta/recipes-extended/pam/libpam/99_pam
> index 97e990d10b..a88247be13 100644
> --- a/meta/recipes-extended/pam/libpam/99_pam
> +++ b/meta/recipes-extended/pam/libpam/99_pam
> @@ -1 +1 @@
> -d root root 0755 /var/run/sepermit none
> +d root root 0755 /run/sepermit none
> --
> 2.25.1
>
>

--00000000000071336605e57c9e8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please disregard this change, it seems I was looking =
in the wrong place and this file is not actually used with systemd.</div><d=
iv><br></div><div>Thanks,</div><div>Beni<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 4, 2022 at 2:=
37 PM Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com">beniami=
nsandu@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Update the deprecated path to remove the systemd warning:<b=
r>
<br>
/etc/tmpfiles.d/pam.conf:2: Line references path below<br>
legacy directory /var/run/, updating /var/run/console<br>
/run/console; please update the tmpfiles.d/<br>
<br>
Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com=
" target=3D"_blank">beniaminsandu@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/pam/libpam/99_pam | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/pam/libpam/99_pam b/meta/recipes-extende=
d/pam/libpam/99_pam<br>
index 97e990d10b..a88247be13 100644<br>
--- a/meta/recipes-extended/pam/libpam/99_pam<br>
+++ b/meta/recipes-extended/pam/libpam/99_pam<br>
@@ -1 +1 @@<br>
-d root root 0755 /var/run/sepermit none<br>
+d root root 0755 /run/sepermit none<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--00000000000071336605e57c9e8a--


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AACC00144
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 21:34:16 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.12558.1658871255081552748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 14:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fdfhP/Be;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id c22so9479933wmr.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 14:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=aQWPC1uQpNB+fHdc24FFvmvg4R5RX4gfmfn6c91r7eE=;
        b=fdfhP/BeuVaFVwG1AFzL3Ggbv2ZEcoVKQoaoiRDYKhmzDtG7QDEOCvsXA0RkvyCEK8
         xN9UWdM4FJaHN7fZXfO42nX3vICQLVr2XEIgjPGgCeAxjSnb21MTuPch+5LzF6O/zjrb
         pmXoHAFYgTRUVlm8vM2AOrTk//3qY8miSMu7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=aQWPC1uQpNB+fHdc24FFvmvg4R5RX4gfmfn6c91r7eE=;
        b=Zpb9EewymvveLTQqH5247KqHySkZe+SJMvzNGlG/KeOGp2bEsS2aa9SR6qx8xkCaEN
         9FQt/1Zahg/v2ckQqymuU9u4iA6dl/zk2Q5Ai+dp80pYaotZ6yiOmaBaCEhjsCLArXSp
         iorM+KD6vRQ6WE54XK2fuUj/xKn1zFl9RsLKPlIr0VkQk7pypRrijwKqjgPCz6JvoRY0
         ShTk4xXIbIkS61uO864pT7UQIPD25PhN9tFRr78BlE3TFUDxsOYpQhePs9w3YBTptxG1
         B4RkNDABKku8smzbizyA/OOEHTw4nCEH1/WVdEiVuIrzRQNMhQBV3fqlen1ScDTEgRWt
         GPhQ==
X-Gm-Message-State: AJIora/hbUhhOPtDyOI0hlElFEdd4fe0ITj2n9T0QnVPturyug8oPZ0X
	t+Lv1GZjJT4/aoVarF1kSO5cFw==
X-Google-Smtp-Source: 
 AGRyM1vzJCea8dpBXWDYo8T89MYjuW6vjcRN+c1pL6mdbMclk8RoPuRDoa2ciwPetNxPISDyhYmkCQ==
X-Received: by 2002:a05:600c:3510:b0:3a3:34e7:cfc8 with SMTP id
 h16-20020a05600c351000b003a334e7cfc8mr766366wmq.164.1658871253297;
        Tue, 26 Jul 2022 14:34:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:10da:2f6d:ad7e:fd?
 ([2001:8b0:aba:5f3c:10da:2f6d:ad7e:fd])
        by smtp.gmail.com with ESMTPSA id
 n6-20020adfe346000000b0021d7ad6b9fdsm15434077wrj.57.2022.07.26.14.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 14:34:12 -0700 (PDT)
Message-ID: 
 <17b35aa4c6c3c8f0e1dcb309e7897048ec5f8510.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] lame: Remove hardcoded rpaths
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2022 22:34:11 +0100
In-Reply-To: <20220726202337.2141895-1-ptsneves@gmail.com>
References: <20220726202337.2141895-1-ptsneves@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 21:34:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168516

On Tue, 2022-07-26 at 22:23 +0200, Paulo Neves wrote:
> Due to hardcoded rpaths tmpdir contamination happened on lame
> executable. This commit hot patches libtool to not hardcode
> the .libs directory in the rpath. This solves [YOCTO #14863]
>=20
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/recipes-multimedia/lame/lame_3.100.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-mu=
ltimedia/lame/lame_3.100.bb
> index 5b42795f4e..2d9bd9d29f 100644
> --- a/meta/recipes-multimedia/lame/lame_3.100.bb
> +++ b/meta/recipes-multimedia/lame/lame_3.100.bb
> @@ -24,3 +24,7 @@ FILES:${PN} =3D "${bindir}/lame"
>  FILES:libmp3lame =3D "${libdir}/libmp3lame.so.*"
>  FILES:libmp3lame-dev =3D "${includedir} ${libdir}/*"
>  FILES:${PN}-dev =3D ""
> +do_compile:prepend() {
> +    # Stop libtool adding RPATHs
> +    sed -i -e 's|hardcode_libdir_flag_spec=3D".*"|hardcode_libdir_flag_s=
pec=3D""|' ${B}/libtool
> +}

Any idea why lame has this issue but we don't see it with anything else
using libtool? I'm wondering if there is an underlying cause we should
look at?

Cheers,

Richard


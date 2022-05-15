Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A067C433F5
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 21:42:34 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.21807.1652650950031529143
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 14:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jnjbe9xC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id n25so653418wms.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 14:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=BxaDZ68/fKaYBNMFyQhsg7U2GM3WWJQDJrqygLQ3gQM=;
        b=Jnjbe9xCZ2MikpG3kk3c8BLb4FxuaFyQY93RWbOmST0my97Eph805LyWwJUyxyxsfq
         GQMaftw2W0VDK0VcKC3bEba5zatDYj4Wgo85dTHChNf+VoVq/Jwhns+eVqaa8MfbgNUR
         AT+PRd42CV2IPlSjutgGxMsDyThJ5N0VeuMk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=BxaDZ68/fKaYBNMFyQhsg7U2GM3WWJQDJrqygLQ3gQM=;
        b=wKgosBa3Lbx6HuOVj5DSCLnzF7FzSb8DzRQcUnqORP91xxuDlhUM6h76Y3AGZwkW7r
         joCPHb1h482CZu+qKccUqXs/34qZQEHeFOyJAZEz/WbEaoJAWJYq3RpkWirgFtXSqmw7
         rPO47mHL682oNL3GjW2rEtYuMawmSENV4ERWq4d3I/v+tF2XIbyNYq31BqJCZBMQOqrN
         0dJmKuyudeLpJmxx5gKpv7SRXL9kVsAxT5wM4tX6B0u2xXV2omx3oFcAM0jeP/Xyy/2q
         Wx/EWsV/WExSrDsHl5nfLalQuWB9B+KyayhkaiawHGjcb85K6T+OxTxzAO/3+y6VG8cy
         u9XQ==
X-Gm-Message-State: AOAM530oK4zQ5lh3Aclb+J0gzYxv/oT3BlnIVdlK0acoiO9hefo1vJfj
	4wfCA9NremuNnsNqEJ3dax5Bcg==
X-Google-Smtp-Source: 
 ABdhPJzD0I0l2wfQm60y6DL77QFYthaY6OFluoFQ94ArZAz5qIuxWU+KXTN/whjiO2H0fqj6h+J4cA==
X-Received: by 2002:a05:600c:2210:b0:394:259b:b84f with SMTP id
 z16-20020a05600c221000b00394259bb84fmr13965926wml.156.1652650948402;
        Sun, 15 May 2022 14:42:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:907b:5576:ab63:2b17?
 ([2001:8b0:aba:5f3c:907b:5576:ab63:2b17])
        by smtp.gmail.com with ESMTPSA id
 m19-20020adfc593000000b0020c7ec0fdf4sm9544019wrg.117.2022.05.15.14.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 14:42:27 -0700 (PDT)
Message-ID: 
 <4b08ee55f793b321f6d23c207fdb4fb0802297ed.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone] [PATCH 1/1] mmc-utils: upgrade to latest
 revision
From: richard.purdie@linuxfoundation.org
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Alexander Kanavin
	 <alex@linutronix.de>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sun, 15 May 2022 22:42:26 +0100
In-Reply-To: <20220515124346.8095-2-liu.ming50@gmail.com>
References: <20220515124346.8095-1-liu.ming50@gmail.com>
	 <20220515124346.8095-2-liu.ming50@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 21:42:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165658

On Sun, 2022-05-15 at 14:43 +0200, liu.ming50@gmail.com wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit d98b06c9c6f480de1e5167bfe8392e39300fc02c)
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Why does kirkstone need this though?

Cheers,

Richard


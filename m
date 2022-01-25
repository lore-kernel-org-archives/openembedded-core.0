Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C3CC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 12:08:34 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.6115.1643112513208316153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 04:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DhlKVhzH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so1451417wms.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 04:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=N6iFISxcgPQM1eDv1V7m4YMzlaA/WyXOrAH58IfqQd8=;
        b=DhlKVhzHOjKBN/pUpk1nrwnyy4ToED2nmIwlRNLMg694cym14ciSTzBJdPPLOY+6S4
         nBZasOppA/E49dv7B4ATCA+FZGeEikiwRu8ZBjiAe5Rujt//VKGh6lnCk8zLAyHA+cT/
         UIFdd0M/PyW27JP2qF0siQ9nEO/8gVYN/1hHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=N6iFISxcgPQM1eDv1V7m4YMzlaA/WyXOrAH58IfqQd8=;
        b=mrX45blGbACon/lpB/cthAq+Ow3ofVPyDMXU63zWUD+ygBhji4YXh7UIZx/2t59mE7
         CNIAy/RTTOtHnsAsuoWYoOz+DbMhYlZeojouSVVNfuN1FfywIGTQTdJDtN3DXbr+hKBl
         itdGRypHvxZUPNCLDxa4OptP1528eVYewYl93O1v8/QZMKsoD5QbBUfZYwnWGlhsuJG5
         UYuYUSyfBsnay9VJ3gQCTos0yOhVtJ+l+6kc5PPwUnyRjMfaVkyEa+SU+HU30JMzPPFM
         bBnGATIDNLx9OqFLpM4wSzYniwOKywuYZjXr1HNhhuqQ5Tb9H3vHZ4nt1T6ky/QkPj8d
         LIgQ==
X-Gm-Message-State: AOAM532HIELRMR1H17eCbzfTyEDWJ5E0wSfGRpREXivJ3F2o04a7EEBQ
	jNszOgm/B+3iCf+BhMvtKK2f4A==
X-Google-Smtp-Source: 
 ABdhPJwyY1xOlYvByrDbwa5k39bi44cuhAqc/krIFzqFDTdxI6giJF5TO+M+HOujlqx/Z8QveNJD/w==
X-Received: by 2002:a1c:cc07:: with SMTP id h7mr2759863wmb.50.1643112511284;
        Tue, 25 Jan 2022 04:08:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b0a:3d41:67d:ed83?
 ([2001:8b0:aba:5f3c:6b0a:3d41:67d:ed83])
        by smtp.gmail.com with ESMTPSA id a9sm183422wmm.32.2022.01.25.04.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 04:08:30 -0800 (PST)
Message-ID: 
 <8f5b7c60d42151f7673e22d87930bf1ca68eac7f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-dbusmock: Add native recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Tue, 25 Jan 2022 12:08:26 +0000
In-Reply-To: <b1c00ec1-86e2-b24c-4b80-25b2938ca2d0@t-online.de>
References: <20220124181219.2764108-1-raj.khem@gmail.com>
	 <CAAnfSTvR3oeghGh8aDJmGkM2eWvgGqeAyYtvZSd8uOJ0KiYGuQ@mail.gmail.com>
	 <16CD6DAF232F9743.31937@lists.openembedded.org>
	 <b1c00ec1-86e2-b24c-4b80-25b2938ca2d0@t-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 12:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160917

On Tue, 2022-01-25 at 07:25 +0100, Markus Volk wrote:
> The python3-dbusmock dependency could be dropped if folks is build with
> EXTRA_OEMESON += "-Dtests=false"

What you can often do is make it a PACKAGECONFIG and then change the
PACKAGECONFIG for the native version of the recipe to something more minimal?

Cheers,

Richard



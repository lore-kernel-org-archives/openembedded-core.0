Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25A9C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 21:22:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.2483.1655241739279846027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 14:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IBj6tcAG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id w17so5359346wrg.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 14:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=PYY8Ian9V/refIkyZYJP6evGjRLiQGWVDzzwnYV+X5M=;
        b=IBj6tcAGxgPEeRpqjn5ICrMVxPWDV/1qYS2Iem6GaFVuAQQ6A0HOYLIwvjnIzUkvRO
         1+ZarHTzJzgNYaRsIX90FlUgMO9Bma6H1CzQmcKcJulE9SloQX3rTJStoKBDybn90Cux
         j3L0ofb0HWdnaqNkuafUYaGoN65cnV0+ajDlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=PYY8Ian9V/refIkyZYJP6evGjRLiQGWVDzzwnYV+X5M=;
        b=FQNlIacW/7IZHhmELlLgQeSzLwsM3+JkzlAP/IaMFdnwp6R1fuT6+TIKiEt2OM6o/g
         XmAbO1s8uEHza/hAFOR7/NigBjVvM2XNbkuFEdvgYGyPF6rSMgsn0Wdr/xUUI1Qv9nJL
         7gw8GMi1zLLQcZ4MfcD9/S1tmsZSQ5qfze+jWKHeX2Na7bbiqYDHqKg0kBoNo1zm0RF1
         tT0nP+8AeGHBNvipRp7VqJ4AKxSu6TPhbifksVbVlzLTyP6mzXLAxrIjFquwDUZFfaso
         ZmhM+BCnpKwaVh8kEJmeJgJhI3hk9yf8l6midUtygvWihT+s4kNAmBya1Lidfvk/pmcJ
         SYzg==
X-Gm-Message-State: AJIora/MzYERBajbXuskW5vPXPkxZbW9EWrWjHIdMhKR1zR0R7Cp4mw2
	cv/zndk0jtZsDLzaU4uTlxt/gQ==
X-Google-Smtp-Source: 
 AGRyM1s/3KSpmh9YeVTEXHlbAerjXebj7solxNm0c6JfhOJsYBx5hyE6OIXXd3do84KS5NC1U/FoKg==
X-Received: by 2002:adf:d205:0:b0:213:b49a:9fc7 with SMTP id
 j5-20020adfd205000000b00213b49a9fc7mr6470986wrh.589.1655241737538;
        Tue, 14 Jun 2022 14:22:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5217:2b74:ee57:d3bc?
 ([2001:8b0:aba:5f3c:5217:2b74:ee57:d3bc])
        by smtp.gmail.com with ESMTPSA id
 a3-20020a056000050300b0020d09f0b766sm12829129wrf.71.2022.06.14.14.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 14:22:16 -0700 (PDT)
Message-ID: 
 <219efa38518486ba4382475eaaae98ef17d9979e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: Upgrade 8.2.5034 -> 8.2.5083
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jun 2022 22:22:16 +0100
In-Reply-To: 
 <CANNYZj95pQ0k=E5fy5J75VGGXL==q035hsbcG3SF=ThF8KGGxg@mail.gmail.com>
References: <20220614090549.27507-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj95pQ0k=E5fy5J75VGGXL==q035hsbcG3SF=ThF8KGGxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 21:22:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166906

On Tue, 2022-06-14 at 11:32 +0200, Alexander Kanavin wrote:
> I think SRCREV needs to be adjusted?

Yes, well spotted. I knew there was something not quite right about
this patch and it was too easy!=20

Cheers,

Richard


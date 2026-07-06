Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5F3C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:48:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148379.1783334932335560070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=G2UMhfKT;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so25969095e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783334930; x=1783939730; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfoMnDQMFno+CzKY+OEki7zFHdYk3RX/wBAD/BZu75k=;
        b=G2UMhfKTsudCFFS5TD6rJb/Yxq0RCAA4NGqR/zZ8npS4FAa9qHtjxQZ7Y5uUPHF1Rf
         rvNVYFniE+1ioR/oDPs4ZvuZ+cEVHIfk8XbfXC8py2gecOKLA1cfRO5rU0YNV1irc4Wd
         ZaW7xE5GQjb7ByU3/pCcJ5LaQ0LnuDgJKQdsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334930; x=1783939730;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zfoMnDQMFno+CzKY+OEki7zFHdYk3RX/wBAD/BZu75k=;
        b=H7uc1xImyZNhSO7UjTIygCOKng3SALPDo2++IHTuc8R8R+iOrr4W7XjUoaoxoeJEqL
         hDBj4k7aZ1x8nl2zyeEQ24F//BP4f3xSYj+oE7Qc0yXFhZd5knP7MOPQS13yr6ehtbBo
         oPdZHppMTnGqklYmVcSDVV9xuqSg3RR1QR+AtDPMaIgR4aQSUeJt6HZBEwunrYCPJ7Lp
         f437o9GcrAukqIklFpYfoBUDgbnJZD7QgtpGzmk1EYvv8XO/bffsuRJ5DPFpOB/+9hnD
         dTh+2i7EgRywZMXG0YmjCwnNdNP6Iv8yFqRuR/bYQaMwCr7HhmN6wJ7lviEF4+2rFT40
         h5Fg==
X-Forwarded-Encrypted: i=1; AHgh+RrLNNApa57pst3r0OstYMrRZmOKfWdg8HaJPDQL9DXxKsGKrVO18kcK3AwtdbGOo5qWfb5nH1LSVEEGPTMOcZPx0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9LAJQwczm2orcq8ChFNVJ9aZ8XZSilndM5uahJ508318+KJVf
	p8PQx4ScclW+DdZFbUf9jqvIDsIoZuUDGPyQ4TUQr6hIml03a2qfHx4avefyDtYJDx4=
X-Gm-Gg: AfdE7ck+XBdiL45KzRCjikumHoQgsa8jDxoctUm/Uisum3qPfWQYy2dak/2K5RdwUZR
	NiPqv1WvIixBel4evgP+f9J+yK22ZQF3rudBMBVxSKltCaQmDYiIVKcSuE6tAuzduJ/vs5fXQ18
	4QLDz29CRG7o5Kqn4RVu3hAbrWDOBCA3sD0yOZ2cMwQ0oi6PJNWJm0MEXPvwXreRGqw0zjkEsAH
	Bqy6mLVisiqKhxOjJbV5LiSl7/SGG9vpiIw4N8zQjRSmpGzkEKvU2DIcbhPpsYU8Wd/RfbtpN8n
	+bLDJHXh5UXjVzlcq8/LPAhiRhtYkOPvsWv5r5mZhlU2R1NGUQtyn63FTn/bFw+3fHuTV705fhK
	w4brA29je/697JuERHEOeG4hO5VI4Q77sS4MJ54eW9ISksUfBQ3OrcFFhl8ogUYMPgXTEEPtmUJ
	IMef552fKJr/kdlwMnC8EwVnCZ7Q==
X-Received: by 2002:a05:600c:8716:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-493d11ceed3mr102218245e9.5.1783334930550;
        Mon, 06 Jul 2026 03:48:50 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef23feasm331597435e9.2.2026.07.06.03.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:48:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 12:48:49 +0200
Message-Id: <DJRFH0SEFKOW.32G7TAT5KOGXA@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/7] gnutls: Fix CVE-2026-33846
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
 <DJ0529SO7U38.2KY8QAKJ8TRSU@smile.fr> <DJ0JDC0E8QIM.2PLQBKV0K6TIN@smile.fr>
In-Reply-To: <DJ0JDC0E8QIM.2PLQBKV0K6TIN@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240245

On Thu Jun 4, 2026 at 10:10 PM CEST, Yoann Congal wrote:
> On Thu Jun 4, 2026 at 10:57 AM CEST, Yoann Congal wrote:
>> On Wed May 20, 2026 at 10:13 AM CEST, Hugo Simeliere via lists.openembed=
ded.org wrote:
>>> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@wite=
kio.com>
>>>
>>> Pick patch from [1] as mentioned in Debian report in [2].
>>> Pick pre-patch [3] to minimize conflicts.
>>>
>>> [1] https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735=
b7df3d383d1ff78
>
> Hello (again),
>
> This patch is in the 3.8.13 tag but not in the 3.8.12 tag used on
> wrynose. There was a 3.8.13 wrynose upgrade sent but I can't accept it.
> So, this patch (as well as at least 2/7, I have not checked the others) m=
ust
> be sent to wrynose before I can accept them on scarthgap. Can you do
> that and ping back here when it's done?

Hello,

I will now drop this series. If the above situation changes, please send
a new patch.

Regards,
--=20
Yoann Congal
Smile ECS



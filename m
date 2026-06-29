Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDE4C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:19:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90848.1782735557038238374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1fR2LKCH;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b27c7451so5981945e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 05:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782735555; x=1783340355; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsGDVaqDuXZKlNHOwnKEtHNu9aFHj0O4OEKpKJnmAgo=;
        b=1fR2LKCHByERjyLIxhUbtzHMKb2igxXaaP/wxgcuajkYErmyWgmISphYKwEgcCTQvc
         pBQso5RzQ8fyn5rQOOxbKjhmjm6gNPFppMZYUqL1Ehx05l8+KiGnPDz6nbh48N9AwJcM
         7hBQFnTTp13brYboQZqZ+9QVDgHlI/3+6qQjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735555; x=1783340355;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsGDVaqDuXZKlNHOwnKEtHNu9aFHj0O4OEKpKJnmAgo=;
        b=PDiOBzKlvGDmBqG8HUj9thFj/hziC6Z9dJRLCSvJMegDuo2f0Q2Ni2sSPOKRRCXgWp
         t+tOpUpfQ4GnW25887d6nOgvAFfdC7Ds+TgVMh4MZET88d1oi+HOboQJhTN1mPA3TpXm
         mQ30KZMW8nHCcBC1+Y15QeDVwjv6JFuy1bIpC6ru97jR8nUpVnHqgSigNQNIaCqx034/
         53oVBA0Y9YZMx2i6Lh152P6MyKC6zdhwEa2W8vgVbOQKzU273SBP/5chbaifqGfv//M9
         IPu0sovJYxvTFdaoyK/X1RScoYfNLBjAcwiNr7wq1+iDrpcX+F6r8P/C4yt51uzulthE
         BsgQ==
X-Forwarded-Encrypted: i=1; AFNElJ890dW0U6zTfkTzZZFCO1M9R+DFeC6Q5ZYtGiO/Edpo8aYVcc14aRwf85Df45KMJds9ngx4vC+4f6MgRFIcL1Rirg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyuTkBPFRQo8B0ZLfKeK7Eq7/YR/j8WAFnLtRGiDIP7vFTb040+
	uFfYucOa061U1nHXdnHZAp0aIalVjmwf8VxoVBTnxCoqOg/X3ri+e+lAX3lzxiphZ6g=
X-Gm-Gg: AfdE7ck5GAHI8jZWfhCTMI/9+gunMGsX0jgnJ0VRMG4391ivkYv2vm9PYlUeA+0wi1J
	JyHs6lCST4wLRXjO6cOoAn5gqYogDnX9gAYLHY4P8bnQ4AbS93kN9wtEf3eSu66Ua+vu47GkKcI
	7192aF3YkHBOv4c1qW/JAzTGSnm4CMiukq1Yt6oaB/5N5iHkifNj13FormifBkKx0KcXqXmPX3u
	jhrx7Q5AbZD4+vM88P58nSIX6kaAuOeTWIG7/lcB9OTEfMECK1oKf5hKcGYaY0FZHcL4V+YjAOl
	xesmrJhNFc/6p9JC65/Ri+Yfd6XmfSIk74DdiDDyLDrM6G2zd+lTI8/aqSrFm3dD7+vpy0B3I7j
	alyhXc7JOQ4Plabd4W6LlsYViC5Gp4ncnTI+PaRNsrwdaeuRFUxrwQi9b+iLYN0agSrf49BMkrS
	/Gaoidu0CWUqy0bJw1sdguzUt6HJ4db8/5Q4F19uhl9wlswGFPbdZLE0u6Xw4iz0gAeP6rvJXsL
	DZ+bzjRQyY=
X-Received: by 2002:a05:600c:3490:b0:492:714d:8c4 with SMTP id 5b1f17b1804b1-492714d095amr123317645e9.11.1782735555231;
        Mon, 29 Jun 2026 05:19:15 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b76e03b9sm468815e9.3.2026.06.29.05.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:19:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 14:19:14 +0200
Message-Id: <DJLJ0FNH7OI5.1MHSGLFVKQYW@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH 1/7] curl: ignore CVE-2026-4873
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629104801.972184-1-adongare@cisco.com>
 <DJLIGNIA29T0.UP5MNHAPJBCH@smile.fr>
 <330317.1782734927543862033@lists.openembedded.org>
In-Reply-To: <330317.1782734927543862033@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239761

On Mon Jun 29, 2026 at 2:08 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> Hi Yoann,
>
> Thank you for the clarification.
>
> You are right, CVE-2026-4873 should also be handled for wrynose, and I mi=
ssed
> sending the corresponding wrynose patch before continuing with the scarth=
gap
> series.

Also double-check other patches of this series, 2/7 seems to also have
the issue.

> I will review the pending wrynose items from Patchwork, prepare the requi=
red
> wrynose fixes, and send them first. After that, I will rebase and resend =
the
> scarthgap curl CVE patches as needed.

Sounds good!

> Apologies for the inconvenience.

That's fine! Please note to do this for all the future patches and it's
all good :)

> Regards,
> Anil Dongare.

Regards,
--=20
Yoann Congal
Smile ECS



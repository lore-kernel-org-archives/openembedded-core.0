Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3CCEB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 10:20:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.5082.1688034034625655817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 03:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=F8014BbF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fbac8b01b3so3802435e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 03:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688034033; x=1690626033;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pt2pi954hFl19saYNS65rWOjtsVv1klLaaEwzlzwt/k=;
        b=F8014BbF9gxM/XEVjbHJtTOGaou5zqtSw0uxhRdQ3L2SVarOzHfUtvt8cXsinBhEls
         xdiJ0+Uw1avibMrimlh7oZ7iuzW1OVk3ShisCq7B1vfDgK8aoXUTHTeD3sphkPyBYD8L
         aZmBWpmWWKp0OARxX6zy0TdqIRwbWfrudjQkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688034033; x=1690626033;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pt2pi954hFl19saYNS65rWOjtsVv1klLaaEwzlzwt/k=;
        b=NSxGpHm3QN9S2c3CXnYyYi2mT3nNl6IA3x0MrxPmpjQTWGel56Jpom6+IrukDgb1kI
         3IXZh50dNNppWclTf936OdwKWablyUJKaUwdwIfldMIYEC6DuzsX59MmtIG0kwYPNwEy
         zqxxbApbirou8teiiwzqSIq7z8Wt6NvuKfovA4saxBZ6OyViR2Ti+VFFxD06ICQzNm1f
         2+ZpP4xQIBC+MrYE7PBDpIB88veTbc8tkB6sUBTPpVr/6zTgOUMfGd37ctAG48+EFvr/
         jxOlFXfcumIBp9JzRQXv2BUIMGk6i+TaXREUijfTiXA/Df32q8I4N7OTwJ+aikCAXQjR
         mbOg==
X-Gm-Message-State: AC+VfDzmbLe3hKBpYu6H2u4l+9dOJNZ8k97VkEldemxFhBZPbSu6+/Jp
	p2BdEyjwydFzTAGqznEuqt0gyw==
X-Google-Smtp-Source: ACHHUZ5yXW9IU4LOl1h9dNq6O8GbphZrHeNY7oE+337Rs8VsOKjgwA+dywbhQQ1l2QeiG1axw+ztXQ==
X-Received: by 2002:a05:600c:880c:b0:3f7:e78e:8a41 with SMTP id gy12-20020a05600c880c00b003f7e78e8a41mr4119824wmb.18.1688034033163;
        Thu, 29 Jun 2023 03:20:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717? ([2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717])
        by smtp.gmail.com with ESMTPSA id w10-20020a1cf60a000000b003f9bd9e3226sm15972875wmc.7.2023.06.29.03.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 03:20:32 -0700 (PDT)
Message-ID: <d4bd00790d09ef7c43dbb42456bb0300f5c9428a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: Install the default qemu emulation rpm
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Date: Thu, 29 Jun 2023 11:20:32 +0100
In-Reply-To: <cb52a3c5-4153-3f77-5307-95229f69650b@windriver.com>
References: <1768C72652DD9852.10197@lists.openembedded.org>
	 <cb52a3c5-4153-3f77-5307-95229f69650b@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 10:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183619

On Thu, 2023-06-29 at 10:01 +0800, Yu, Mingli wrote:
> Please ignore this patch and use the patch "qemu: Add qemu-common=20
> package" instead.
>=20
> And the patch "qemu: Add qemu-common package" fix the backward=20
> compatibility as=20
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230627105627.2=
583973-1-mingli.yu@eng.windriver.com/.

How about we simply add:

RRECOMMENDS:${PN} +=3D "${PN}-system-all ${PN}-user-all"

I think that solves the issues in a neater way and preserves the useful
-all packages?

Cheers,

Richard



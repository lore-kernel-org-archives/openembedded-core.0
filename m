Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0A0C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 11:20:16 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.4079.1639999215791502807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 03:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JHx2ipqw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id t18so19281925wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 03:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ipbLjpAFl318bbbyDXyXDT+nbZcV7IK/iwJLj7ZZdp8=;
        b=JHx2ipqw2UJmJm+rbT2X6xg90NFhtuaNPKiavG96sJRis2yVH3iiNb5+MLalC8OLr5
         BqSnBCY6dwe+oVlsFXf+TLNwVQje+ROaF3dL8vV7n45FZQbxRUe+zIK+WNAcy8I4++l5
         sfpgINsGH+eJjAZlREwwQfhYd4jY7+TLeOQ/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ipbLjpAFl318bbbyDXyXDT+nbZcV7IK/iwJLj7ZZdp8=;
        b=gVavdEuGTWEbEAnZk8VCGwWrjr45KUx30GvOe9GMFlYIfVoHlfzUeAQnSKL5FTHLr4
         IaHCaxRa40qOXCXCrbUYlf1DZe7aEQZ4d1zMKv4WkcjBgpFvxIs3VCVPic++JrYOARqn
         modfLvYnjYlyNEwGyI9wTpDgL0XQ693vTxm3RNkQBVfd4j3jjzPgsAF6pFD9br1C46Nr
         VOxyd3zkGqmNxl/e0b3kWh8T87WByUTOxCFviv879Gyj+VqvyYKuyzoOiPIHdNiTJPl9
         9LXiLqDEZ/dx8gc+U8U9VlNTaz2TKBpK8VoTZzMuVYgQ7N/Fho7xGztXCQ1iMiAYdNMM
         034A==
X-Gm-Message-State: AOAM533dJpt31erYQyUSW5TRV0hrCc2kZiUCJpaOHa5WkHDBOQ6RpdW/
	HfvYNHaxjHKA9ShZYmofeD3SKw==
X-Google-Smtp-Source: 
 ABdhPJxTGfbbsEkdW07y0vbLRCEIk64dTFgJVqnaLKFzPT5Rk2nFwjHmiu4n5KnJ7CNKX//34MVw0A==
X-Received: by 2002:adf:e545:: with SMTP id z5mr12442095wrm.444.1639999214373;
        Mon, 20 Dec 2021 03:20:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2f2b:ae5:15d4:240b?
 ([2001:8b0:aba:5f3c:2f2b:ae5:15d4:240b])
        by smtp.gmail.com with ESMTPSA id
 m6sm18920913wrp.34.2021.12.20.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:20:14 -0800 (PST)
Message-ID: 
 <35ef1b81e16d9319a9696beb3f590c6087622be7.camel@linuxfoundation.org>
Subject: Re: [OE-core] Manifest for host (nativesdk) is empty
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: oobitots@cisco.com, Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Dec 2021 11:20:13 +0000
In-Reply-To: 
 <PH0PR11MB490252E71EAA39C3EAF277ACD77A9@PH0PR11MB4902.namprd11.prod.outlook.com>
References: 
	<PH0PR11MB490252E71EAA39C3EAF277ACD77A9@PH0PR11MB4902.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 11:20:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159864

On Sun, 2021-12-19 at 12:16 +0000, Oleksiy Obitotskyy via lists.openembedded.org
wrote:
> Hi All,
> 
> I'm working with gatesgarth and after 'bitbake core-image-minimal -c populate_sdk' into .../deploy/sdk
> contains image installer .sh and manifests *.{host/target}.manifest. Host one contains list of nativesdk packages.
> 
> In honister target manifest is ok, but host manifest is empty.
> So, my question is it known behavior/done in purpose or not normal behavior?

It is unexpected and needs to be looked into...

Cheers,

Richard



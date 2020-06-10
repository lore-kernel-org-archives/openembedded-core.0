Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.6471.1591779467554576647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 01:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qzq5xE5D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id c3so1296006wru.12
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=aO7SLYFnFaJCrLlIAKH+WH3CPV6BO72PG9L9oDV1sPM=;
        b=Qzq5xE5DSQljM1QwOnxPITLLUSWtF7XYi7EcoP4KPh2d/hMIFAIBks9wlyxSk57OhB
         RpOkaozg3rMi56ftYqXKdIVWlPkSwVqlWKvlMgc8NwhdQQ+gABAXJ+ZT3OErThImxEdq
         GtOy3KM+zBq9gWMixVsqhsGwtJzscfuwhpoo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aO7SLYFnFaJCrLlIAKH+WH3CPV6BO72PG9L9oDV1sPM=;
        b=JRBg55O81fj8LUyLh6RQvksdZOtzXn6KZCXbOdtZjEJxxzoiED1kUYjZ0A4A/QTIyh
         ONSIywjV6YuOFNJDmxz+eTeSD6rcGeQv1UrtDdkAdYxM793cOog0bkpt6QUop5hcAlKJ
         UKwjkvnF0Og2u6/LE5DfVJZPX7ZYNVnp2R6AaKbFiWm3f5qlu4OccCT3D20xLXHRkTLE
         tIwT/O99emOtdEFgKPMTASnbBzMfwQr43wSmZ22814bRP9leeviMfjVxnsJHethA1DIU
         ZE8UtSLn1F/Lwv+SioYBBTM6p/+aAs0WUn7JW1soNEpZJ1ihFJ6CtYhD/+ywhbQdbJuU
         6AhA==
X-Gm-Message-State: AOAM532M+fohpmI3N7VmY3MeEFf2lQREicMuOldUrcxnM6Z3mHEL1cMG
	DkaaFCPJaFmE+62F6IxeciPAwg==
X-Google-Smtp-Source: ABdhPJzxplt8D1LPO84afDlsUTyrZbdxy9b+m/X78x1BVm6z6Nl35EAthrgyr/U1toH8pellTYgBHA==
X-Received: by 2002:adf:e381:: with SMTP id e1mr2344092wrm.320.1591779466019;
        Wed, 10 Jun 2020 01:57:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 128sm6189331wme.39.2020.06.10.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 01:57:45 -0700 (PDT)
Message-ID: <88a87bb30460a13a10b8e9a749ad8e2faff878b9.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] Modied the license to GPLv2.1+ to keep with LICENSE file.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2020 09:57:43 +0100
In-Reply-To: <584df8ef8e7f4eff9841ad09b52c6ac7@G08CNEXMBPEKD06.g08.fujitsu.local>
References: <1591638879-97684-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	 <918d16ff5776f0a9991e46b5b4da3f5a0d286dc3.camel@linuxfoundation.org>
	 <584df8ef8e7f4eff9841ad09b52c6ac7@G08CNEXMBPEKD06.g08.fujitsu.local>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-10 at 01:20 +0000, Zheng, Ruoqin wrote:
> Hi Richard
> 
> > No, you simply cannot just do that.
> > 
> > If upstream takes the patch we can apply as a backport but until
> > they accept a
> > license change we can and will not.
> > 
> > Just because the license file says something doesn't mean every
> > file is under
> > that license if that file's header says differently.
> > 
> OK, I got it.
> 
> > I suspect upstream won't accept this patch either.
> I'm sorry, but I don't know if you noticed 
> https://gitlab.com/gnutls/gnutls/-/issues/1018 . 
> Our team have dicussed this issue in gnutls's gitlab, and the
> community has recognized this modify.

Having the upstream author recognise this means we can make the change
but we need to quote that in the patch with a reference, specifically
the comment:

"I see from the log that I'm the only one who touched this file, so as
far as I'm concerned this is the same license as the rest of gnutls.
Feel free to update the license to right one." and a reference that if
came from https://gitlab.com/gnutls/gnutls/-/issues/1018

We have to be extremely careful about licence changes like this.

If we can backport an upstream patch that would be even better.

Cheers,

Richard


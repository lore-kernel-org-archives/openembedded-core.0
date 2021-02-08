Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.33269.1612779408919616158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:16:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aVuOFqF+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id r21so139564wrr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=lW4RzG9thdVQft28SKwYarYXUu/rwfI+8TvgEZ/ecvE=;
        b=aVuOFqF+7e5NpLAW/W34kvPjqynuz5OTX0e3qVifnNfk4GBHhu4jBrL/lETTe2GBZW
         YQj1n8FmqU05zn3TwEM1UTC5Ht1rQ1V+Oz8U8xXN0+W33vR5pzOe2Q4teul+pfcE5k1g
         Pzc5OesESkA159DkVoatOoTQB+/WVmenlB3ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lW4RzG9thdVQft28SKwYarYXUu/rwfI+8TvgEZ/ecvE=;
        b=S0UPO3345APPqc7FC8Kn4bp+VvtD7G0TeQD6gmtD0As+w7v6ue2LNPkD+RFHnpuBVR
         QdsdoGxmW6jDyWhd/5Q99ZUAttZtTDIwDuz1A0DfWcQ59Usumbw1I2RLkBptFiSMT8CN
         QEF9bBP43KffveFXkxXLrq4czr2xot0FJiH3J/FEs7XuUPe4K/2xJmZ4fv4R+H5eBeYr
         t59g7V6aDCx4k8eKkIbLvDnCcOyVrJwLSCYQQW+dncxd+Fuip12WZpTFatMPGYO4vav1
         PYQbu6hf9QCe0uSlYPt6JEIaQrolKTYxfR2wOV8grH0d1sd4LrFauYmJDeOvvaB97A2S
         zoAg==
X-Gm-Message-State: AOAM530J8QppJsmOheoND91lsa3864FNEQGHppqafk16U9Qb78hjDG/L
	H3Ql/0POyHRcc/wNYGF19BtQGA==
X-Google-Smtp-Source: ABdhPJz0+uqmAS80+aA7FP2+6M177QZHuTOrEheenc60fCw4+knm2M6949ZG8+GFGc7VRcjR8DA1zg==
X-Received: by 2002:adf:8104:: with SMTP id 4mr6596409wrm.265.1612779407133;
        Mon, 08 Feb 2021 02:16:47 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ff1a:4654:ede1:462c? ([2001:8b0:aba:5f3c:ff1a:4654:ede1:462c])
        by smtp.gmail.com with ESMTPSA id i15sm18117658wmq.26.2021.02.08.02.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:16:46 -0800 (PST)
Message-ID: <86120a48209d7305382958e303e55e0f1a012da9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] cve-check: add include/exclude layers
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 08 Feb 2021 10:16:43 +0000
In-Reply-To: <20210208055130.892351-2-akuster808@gmail.com>
References: <20210208055130.892351-1-akuster808@gmail.com>
	 <20210208055130.892351-2-akuster808@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-02-08 at 05:51 +0000, akuster wrote:
> There are times when exluding or including a layer
> may be desired. This provide the framwork for that via
> two variables. The default is all layers in bblayers.
> 
> CVE_CHECK_LAYER_INCLUDELIST
> CVE_CHECK_LAYER_EXCLUDELIST

Do we need to document these?

Cheers,

Richard


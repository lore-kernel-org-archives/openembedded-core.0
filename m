Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.2927.1590573157275644789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 02:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GOMXr7i2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id x6so9742043wrm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8LfVTcwuzymmvUwJCzj9lUssSMiFEU8pHTE1TyJx3RQ=;
        b=GOMXr7i2nXzlVzcj2GZwMaHXhAQvlYYuGt6GXbdyrMtU1/yMrZ/RBj0D4dRaJB02Sm
         jYe4bUUnx184o/CwCmjCtWyISQ29vN4fzu5zqZ78xChXBtWEoWHGIRDM1GzsYNz57P9c
         WWySBRJhOHlmKMsBD21nPPeAm0PKBeMs4lajw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8LfVTcwuzymmvUwJCzj9lUssSMiFEU8pHTE1TyJx3RQ=;
        b=tvfplbcUPm9+M0WmRIXFRmkvxNIKdCvca5WFm7CpD+5btIr1lC0Gnj8goeN0pChFlE
         xrar++ODveHsJommywExm6gIa/RLC/sEgnpnzzvQsTw4V23lcnH7rokECJZgVJIb1NF+
         xi6qPV2ItsUfH4f8+7let/xUKdyOGhVAH4VUYEGM8Vam0ujFdWOjcW2eZXlGYQgJU5Qp
         aodfJWHdS4dFSEaS1OLO3B/rcDhvpmZYXw5CxRSoyLmfORGE4T4eIVLpBojwMLVqgPJB
         HKmPMh8oHpqubuv4+4oFVbznY38QSEEYab4tkgNeM9y3nY5veRSiNjDy7D9yQD3wtWD8
         si6Q==
X-Gm-Message-State: AOAM532lC9SGukzT0kF2nQ6a0UteOBEhO7zzQBTPMv0amqFvDGruXzst
	DltJS0Y2aTKiUPkMUAe15xGk777v52FGaQ==
X-Google-Smtp-Source: ABdhPJzm7fi5LXffONICl6XV57Q5ZSEMgpGaFnBMLPBuUjUeye/hbg8smPpRuJSWzWfKuq3g/kqSvw==
X-Received: by 2002:adf:fdc1:: with SMTP id i1mr26338324wrs.0.1590573155961;
        Wed, 27 May 2020 02:52:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 62sm2408106wrm.1.2020.05.27.02.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 02:52:35 -0700 (PDT)
Message-ID: <b86fb730228c5c66dc33111de6d9628ab88badfc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] initramfs-framework/udev: umount /run/media/XXX
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: hongxu <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2020 10:52:34 +0100
In-Reply-To: <20200525030622.28426-1-hongxu.jia@windriver.com>
References: <20200525030622.28426-1-hongxu.jia@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-05-25 at 11:06 +0800, hongxu wrote:
> In initramfs-framework, before swith_root rootfs, if udev have time
> to
> run (before being killed), it will invoke hook mount.sh (which is
> provided
> by udev-extraconf) to mount /run/media/XXX.
> 
> Release the mounted disk after udev being killed.

This feels like a workaround. Would we be better off not installing the
mount scripts into the initramfs in the first place?

Cheers,

Richard


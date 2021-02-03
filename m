Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.3519.1612388206484569025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 13:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZH3VBADG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id 7so1040020wrz.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 13:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MX319uualAm2lWnbydrrVz1deicpsJeQ0VMHysBss0M=;
        b=ZH3VBADG+4fpyNBqVP55aStyqIYaVR1GmddBpkMNYasjSn1eMmH/pt2me9pUXVa/PW
         5SHHKifUQD3CDzZC+1gIYTnVkQ6JHmzvN1jacRTKE0qWsWKDK7H/H1e4sBXZ7uajKVfm
         AhK63v0Y/TtJ+R5VZ5c7nvJhUzn4889b3+l7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MX319uualAm2lWnbydrrVz1deicpsJeQ0VMHysBss0M=;
        b=DpzP1sBCHQ+IWYBkQWWU2z5+/dEQk6E1oyWp5nORBzwV54+0uHfcNp2Rhqm3rWV9tE
         mMq5oKSpyTG5Rmi9sIr13LTcSxprv4/k2XVxHac6e8cBFy7LxQ4G6odc1Ch549Jds/2P
         56SqoHPnxxh5orkb5kgfFlK2YA/ohcNFFs01+d+3f3ajEXMYCpoOH0FKiA37Jp0mZRSO
         Z/oQHsMRAXbHzwed79dkMoCOgxWDkqIFE16Kk5falRCvCkcLd/8WVoQ+w7Zv6lx8Vi0E
         j3eGXWXmAW7XvnV1ngIw+zy0rT9fA9bDTCRoJePIxPZtTFzk4eDwFkVlndqDThbWmp8T
         XaaQ==
X-Gm-Message-State: AOAM533ZFG+G5ZXRokNFsUVrtUfwRonak3uHct932aqWNPqSuDz3F9Jz
	X/MmvTp36ZPAOnXolmPao0ovzQ==
X-Google-Smtp-Source: ABdhPJzLo57SGflFoF6lVCkE9ikuFov4CUjPcKLDI7z5Wo9jPR2ztNeYZik3qnGJs7Nmy7eaaJDNTQ==
X-Received: by 2002:adf:82f8:: with SMTP id 111mr5531691wrc.321.1612388205024;
        Wed, 03 Feb 2021 13:36:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:62ae:a739:5537:66d9? ([2001:8b0:aba:5f3c:62ae:a739:5537:66d9])
        by smtp.gmail.com with ESMTPSA id w4sm3983112wmc.13.2021.02.03.13.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 13:36:44 -0800 (PST)
Message-ID: <91e34f20a0c329c0d27a85f4a0595527663a9fc6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 08/13] pseudo: Update to include passwd and file renaming fixes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Feb 2021 21:36:43 +0000
In-Reply-To: <CAMKF1srLi6QnKPva2rm2tE_SWvPz37k4M-egQcWjCBhL99=W0A@mail.gmail.com>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
	 <20210129102419.1360572-8-richard.purdie@linuxfoundation.org>
	 <CAMKF1srLi6QnKPva2rm2tE_SWvPz37k4M-egQcWjCBhL99=W0A@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-02-03 at 11:56 -0800, Khem Raj wrote:
> Hi Richard
> 
> I am seeing compile errors for pseudo, it could be glibc 2.33
> introduced and perhaps pseudo needs some forward porting ?
> 
> https://errors.yoctoproject.org/Errors/Details/566884/

Looks very likely that we'll need to fix it to work with 2.33 given
those errors...

Cheers,

Richard


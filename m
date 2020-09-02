Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.9574.1599059145982491487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FTKurV06;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id w2so4753956wmi.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=56jPMSjKJq+dTIHEh3d2w+gNFLK1bAsKHZGGo/rtbcw=;
        b=FTKurV06Fv6mwdv+9vGRWOg7stACnCpuoDZA1ltt5IRLMnr91RkkbLJWpSwl0H+o6c
         Z1x76m61LQPtXeZcHetc90fQtxFEgih0mKEydzKbuk2m5p/hRY10XTdLoWbILSueOjAL
         qxqRubjFlbIVyT8/MtJV2+JlSReAc1ISEksfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=56jPMSjKJq+dTIHEh3d2w+gNFLK1bAsKHZGGo/rtbcw=;
        b=sXQ6N9JFX44ai+69m573U7CG7XKstp773TWOjzFBPhWF005vamVgl89iCAwAsqFXlb
         lTZP3cRkcYIkg4RInDh/IEuFX5lY6Zk0NcpOPUTMnntD6etcAMNYyTVQ4InhjI3/yR2H
         RAoMBsL6L0Uo9PK1W/EwpbyXG31oZ4kGbhcwyrmTgMnUhMwPev8M2sjRjSfVEPvz/4Vn
         nmfPCsM3sIIDvhdFYWMSq0/HW06d4uzbqVmghsVS8W6sopduoBSOFrEpZyHXt9BZi1Tv
         CTUMUBis54apX8JhFHHAH/AAHU8fjlH0Gggl9P9T8zQZTP4yPTDWJqZVBXyx2qDwGPFT
         d54Q==
X-Gm-Message-State: AOAM532eukexUNr4p4y/nih0XgMxbNH0DuIOwFYmUHqXL2oC/1flq1s6
	fobC6RLrlXHvQ0j9/2Mvjnm7Zw==
X-Google-Smtp-Source: ABdhPJwE6631ZIRzxY2+HdHpko9nOJhQbyiycf5UhGiJsZXov9wtV6Eqv7G+WqbDvyXxV0LYAK/w0g==
X-Received: by 2002:a05:600c:4142:: with SMTP id h2mr1093396wmm.128.1599059144339;
        Wed, 02 Sep 2020 08:05:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.a.9.e.c.f.e.5.5.1.2.c.8.4.d.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.a.9.e.c.f.e.5.5.1.2.c.8.4.d.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9d48:c215:5efc:e9a4])
        by smtp.gmail.com with ESMTPSA id c10sm6861112wmk.30.2020.09.02.08.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 08:05:43 -0700 (PDT)
Message-ID: <dcd092b4d3a9acb4e8654b9c726115366578d47a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/8] dhcp: remove from core
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <diego.sueiro@arm.com>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>, akuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Date: Wed, 02 Sep 2020 16:05:41 +0100
In-Reply-To: <AM6PR08MB346157300A58D375F6699979922E0@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20200901152236.9377-1-akuster808@gmail.com>
	 <20200901152236.9377-6-akuster808@gmail.com>
	 <CAMKF1sqospEX2wHmRUce79TTzfYW3ePGETFu7sK7WJeWrECFfA@mail.gmail.com>
	 <AM6PR08MB346157300A58D375F6699979922E0@AM6PR08MB3461.eurprd08.prod.outlook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-01 at 19:15 +0000, Diego Sueiro wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Khem Raj via
> > lists.openembedded.org
> > Sent: 01 September 2020 19:11
> > To: akuster <akuster808@gmail.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH 6/8] dhcp: remove from core
> > 
> > it seems its used by
> > build-appliance-image and packagegroup-core-base-utils so you need
> > to
> > take care of that as well. in meta-networking networkmanager recipe
> > depends on it too which I think I can take care.
> > 
> 
> Armin,
> You added a new recipe for a dhcp client but what is the alternative
> for the dhcp server in oe-core?

Its kea.

Cheers,

Richard


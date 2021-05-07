Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.12380.1620402738069430013
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 08:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U7UaixEg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id d11so9757850wrw.8
        for <openembedded-core@lists.openembedded.org>; Fri, 07 May 2021 08:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SxbGsE5GcYB0n4KLrgXHJ2aDCgrxZISx7cuEjY79ujM=;
        b=U7UaixEgrvY8N5ccyJH5+PDCxx7oszmyDEhFYXCTg+0N0TsOY8tvdXDrcXNsWrP38K
         FGGa/+4/JOMPjt37x/H3FkGIHmuIs47rps5j9nGXBw1Xc8z57MnMyJIUVbioeORmLx4+
         VO0GL7lLDGOzuNVS5aHnSKXC7Tb1ZNnx/xkg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SxbGsE5GcYB0n4KLrgXHJ2aDCgrxZISx7cuEjY79ujM=;
        b=stgZNUT/Wf2OxoPgDDayVx8iWMKOvWRD/fXgandw7GXrjeop9KZ7YIaGZkBtnVciKf
         Awv6Ksye/nAb9jYTRn2/HeBTYP3bUZc6ZvW0/zzXIYYmqugOcmwEw6a+/DbxlaBK1EYj
         r4klRXac1ks9vdTk7Lf8/cTRCJ2WxePkoTXZsE+GUFfx3Vu1jQFE6VuvwyZSlEd6j6vO
         C6w4gxKF+2njeA80e/aTjPCkZc/KwbMlul1WrGECFmbDMesnrWtIMW8opTotCOy6k99N
         nfsiRxV5lp/UKUOtPoVpF6E6J4PlDLGNlW2JWxxJ7YUHo+NKinC/UI+m6Q3I3ANHK3vU
         /I0A==
X-Gm-Message-State: AOAM5314yJIhRaLxO5LWBLydmgcwK98feDkU74jRvK/ySdtoX6Iu7qoc
	GkqQdQ5GGAEEyZkcil7Ys38hAA==
X-Google-Smtp-Source: ABdhPJyFDrcZmMMNlN3s1nyorSA5o4cG5ybZEMDNn2f33cly/uLikUpBCr0RlMbtlvtQfMhfbNIoHQ==
X-Received: by 2002:adf:e98c:: with SMTP id h12mr12921323wrm.314.1620402736493;
        Fri, 07 May 2021 08:52:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b293:70f:415f:a3e? ([2001:8b0:aba:5f3c:b293:70f:415f:a3e])
        by smtp.gmail.com with ESMTPSA id x8sm8498438wru.70.2021.05.07.08.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 08:52:16 -0700 (PDT)
Message-ID: <aa7fae35ad317e3a8249fe88cea6bffeb2894bf8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] linux-yocto/5.10: qemuppc32: reduce serial shutdown issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Bruce Ashfield
 <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 07 May 2021 16:52:12 +0100
In-Reply-To: <CAOSpxda+ArVQ78hweJm6ckd7ga=aXhzssMGVPv9317b_e++hEQ@mail.gmail.com>
References: <20210506125721.27515-1-bruce.ashfield@gmail.com>
	 <CAOSpxda+ArVQ78hweJm6ckd7ga=aXhzssMGVPv9317b_e++hEQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-05-07 at 05:18 -1000, Steve Sakoman wrote:
> Would it make sense to do a version of this patch for 5.4?
> 
> Though much less frequent on dunfell, we do see it on occasion.

The change is a simple removal of a defconfig option so should be realtively 
simple/safe...

Cheers,

Richard


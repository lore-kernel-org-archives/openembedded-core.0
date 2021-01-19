Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.11315.1611064705550204928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 05:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SPf+icAG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id a9so16369808wrt.5
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 05:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=52/G6qdJZ95k3RaIfaCJVeW7p8vHDu3G6jyZWd11xBE=;
        b=SPf+icAGekBWnQiUjha6OHFQ9JfYiLX38C+xJ6tj+9CQOFA2+b/XyrlKxQGOLNpr0z
         Q5TFXTnNZU0k6KjpuoROzlj7E0Rk8ZHw63zhnzKZc9oKCAEkVUwKCmn7ePcy+jLqcUU9
         iIQiTMgvkl+DjWdK9wMbD3cPOUFwSxg3L6cIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=52/G6qdJZ95k3RaIfaCJVeW7p8vHDu3G6jyZWd11xBE=;
        b=XxTRqNLFRE6OXU8XQmkXHvfWh4ihXiX+kZyl9zYiTFARy+CZPTKGzy+nwLfEL8Bv+c
         f/m51t3vJ33kyzzPUrMytLd74/BLrO1MAFfp/fdEQwl41nwlL4FcMJFCzL6oCMhZQF1P
         lrazKk9C+XORCEEZ9VQZWqmOR4DCybiHb9001Tl/irK9WbGJWzY3aIHzOX5/LHsTiCqV
         QiSjqS2oZ8sTYwBKm5SnAzLXFMpqYOKSH3vwN2suB8ZwDxN03fgIqo6vOSlkybw9yZif
         5RjNR6+2KSFHGYizmx1gaXm1TMKl+BSgIvCyGx5d3syOjbaLnb/QaWamfva1t6hVISWh
         ByjA==
X-Gm-Message-State: AOAM531FapMsqKeBLfDzDP/Sc7VWDsJUNh2UJfsLQm+yJ+ayPOULvx73
	lXpBJ5SZnv+lPrHihqQCEQHG0g==
X-Google-Smtp-Source: ABdhPJx9myc0yY9FQxDChBJP2BE7kLAnlUwiLP59lnWy7PvWUuB7MKc3uFNfjGQYp57lpNvOYzb0Vg==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr4502483wrp.172.1611064703912;
        Tue, 19 Jan 2021 05:58:23 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id z63sm4921161wme.8.2021.01.19.05.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 05:58:23 -0800 (PST)
Message-ID: <ec9dfc865a596ddb88f11f280b2ca2dcad5737b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH] rootfs: add option to allow delayed postinsts on read-only rootfs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anton Kachalov <rnouse@google.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2021 13:58:22 +0000
In-Reply-To: <CADVsX8_hASp4VjXO0Dk3HmLW3d6TdWiDzzZHdQfAzRRCBz1KAw@mail.gmail.com>
References: <165A723B7A040876.29781@lists.openembedded.org>
	 <CADVsX8-aLgbLwqT_zVAh3jBG11KrPMvGKR8Kpi087y75Ao__ow@mail.gmail.com>
	 <7d05167fb80882dea83fb8c4ec0da8f28a61243a.camel@linuxfoundation.org>
	 <CADVsX8_hASp4VjXO0Dk3HmLW3d6TdWiDzzZHdQfAzRRCBz1KAw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-19 at 14:48 +0100, Anton Kachalov wrote:
> Thanks! I've expected some kind of ack :)

That would add a lot of mailing list noise and work for me when its
relatively obvious looking at the git tree! :)

Cheers,

Richard


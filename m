Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.4888.1621981027511756008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 15:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VQkHSKgJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z17so33775279wrq.7
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 15:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MeU4m7xqtkHUr3qdcej/PpyNDZD6koellT0bUpVRuiU=;
        b=VQkHSKgJRxB6bKfJLvwRTSXpJJqVPAQUHnAunmM1QD7jlDC1+ieBR1FiaSsLmC5Z97
         LkSLjMlxvlRVlgAlrY6upnJ283jYq5fKgOYupysfA3DW0eJqqLgqfV9VetCRVpw3QUJ6
         C3ZGFFIaev3ggsf8lGzVtHb/J7M0M7vPe7EDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MeU4m7xqtkHUr3qdcej/PpyNDZD6koellT0bUpVRuiU=;
        b=gi8ffJtvV3Cziu7H2VwFlKDmqX3jCAVggmpl/4xiewGsmeyNQa7YB00ynD2sqc1WOO
         fOR+Gl7gFdLsc+LrVmzI+dFtkWDdS7eHP+UuIX5cU2j8FcJsVBAsKPtdXNjOp2pCVOB+
         Ri8QIvil+hOWf8MRQfBzR+WSeFs06pR6AFKUvoB9ATV83sDlwbDZJreNlhTuIaL8bS7J
         h4FkrwgeXoK5kdlV3l70dRmXAOJQ3am222ruV3spGd1jnLaAAJYCsdSLGEi6Exr+/eOW
         gE2mbN84fpsyXvZWbfnLaMynwUKjVDfrHIj1pQJLBedEHQ8RLfi+kTd/AXt6bcWYYo7B
         ui5g==
X-Gm-Message-State: AOAM533vg8107Ei6pHEtWOBZTWa21L+1u6W0iOfeuBJRS7GQYWsFQwFZ
	F0EiAqiSglH9pztaiaC0Xoki1g==
X-Google-Smtp-Source: ABdhPJxFUaby5eNwq+Pq8CSlBr7HLARBtbaW39OaCYVS/r/zDurOldYyuWY/OtkkI83ROJnMfT6SSg==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr29524356wre.157.1621981025988;
        Tue, 25 May 2021 15:17:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9654:ad4a:4a61:2e32? ([2001:8b0:aba:5f3c:9654:ad4a:4a61:2e32])
        by smtp.gmail.com with ESMTPSA id c6sm17903283wru.50.2021.05.25.15.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 15:17:05 -0700 (PDT)
Message-ID: <8de2b83c408696703284e7204da5285c0b594a47.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Steve Sakoman
	 <steve@sakoman.com>
Date: Tue, 25 May 2021 23:17:04 +0100
In-Reply-To: <DB8PR10MB397786AA74112101B3D9845192259@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20210525090910.11581-1-andrej.valek@siemens.com>
	 <168247B8E1E1063C.25934@lists.openembedded.org>
	 <DB8PR10MB397786AA74112101B3D9845192259@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-05-25 at 12:50 +0000, Andrej Valek wrote:
> Hello everyone,
> 
> I have an another question regarding to backporting this to dunfell branch. 
> Is it possible to apply this upgrade to this branch? I would like to have 
> an very important fix for CVE-2013-0340 (https://github.com/libexpat/libexpat/pull/220) 
> there. But there is a lot of changes, means just applying the patch is not very promising.
> 
> How we can handle it?

Adding Steve to Cc. It is possible if there is a good case for it and there
aren't bad side effects from the change. I don't know enough about expat here
to comment on that.

I suspect we should be adding something to the expat recipe to make it match 
libexpat CVEs, maybe CVE_PRODUCT = "libexpat"?

Cheers,

Richard



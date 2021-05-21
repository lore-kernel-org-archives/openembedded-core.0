Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.9981.1621607308816355890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 07:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O6HAbbhx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so6906762wmc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XCG0TD7uGuSqxrVKcEvPaaxbAMTnBQRhMSOusnqEpI0=;
        b=O6HAbbhxxQ+6Sn9/bKbZh6CtfHgQS6dWWhwjB5LodNM76M4rThtTC2L24BHNbvpgni
         kVWXMzUbgvSV5eZfcBlfLxaYny4qH7/3ko9Tpmj+3WENuuDrdrOREEx0jKphhcPi4TGw
         H66u7moh6z1a97l5VwiQgVlE5N43xFlbUSZII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XCG0TD7uGuSqxrVKcEvPaaxbAMTnBQRhMSOusnqEpI0=;
        b=t88fVRrFugHsx70PYcDpNldRGS4IrFCLSKYLmEOS0Rjt6ik2hD6j7N5gSkn9bW3Cie
         7jw5vHfCfxizynUT8Je5TfCdGEkDThpWJcqCseCyxCrvdUiYXS7aiOY6IHkusavTTlI9
         NpfJKUr0ZhOLZ58HQGWiCpKTg4Xctuc6YC9/wq6WfDFJFIXKNzRLH3zoXqDJbCVdf8M4
         Qgb+c57YKOYCB3RhRHMn/ksgPF1xbRnyhmDxNO8FjatTh4y1yGBWZJBc+GQNUjPoG+1s
         wq7r/JJiRJpnDZz6G2X9ypoUqWENLRRq+owHQLv1YgUWRoSZuqotUM88+tLxuKHGraih
         dGxg==
X-Gm-Message-State: AOAM532isoKWQetGeW0W4yGbd84eF3x8oAjFE4jWJofHlRqNej4EhqnZ
	XGtzmftJ7hC33GsCCyzS5EbVww==
X-Google-Smtp-Source: ABdhPJxZ1/0E5ELtPPqRDBpnlCjzqoiEKSmMFZ2PmqHUMcx3q5S9eDUbgroq2Ev0Bf0dcQWN6JLcqA==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr9131162wmh.130.1621607307283;
        Fri, 21 May 2021 07:28:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:c394:d896:3913:6568? ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id z9sm6167793wmi.17.2021.05.21.07.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 07:28:27 -0700 (PDT)
Message-ID: <74350fb1207d2596a5fe555461392408147f78ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: fix wrong separators
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 21 May 2021 15:28:26 +0100
In-Reply-To: <20210521122032.196712-1-liu.ming50@gmail.com>
References: <20210521122032.196712-1-liu.ming50@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-05-21 at 14:20 +0200, Ming Liu wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> Change to use '-' rather than '@' as separators.

Why? The commit message needs more information.

Cheers,

Richard


Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.11065.1593785389985298985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GNbWKxl+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id z15so21556598wrl.8
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=dnEj/aLrKk6S/DUI7+4i2xQHvUIBOcAFtEZ74chaegE=;
        b=GNbWKxl+piZpzS3hrNhYMlUvj4SqobnXZiKMRVYGkqghKrxNsYyXwNYVrsbbLkybeX
         VJR0rFpU38n7gXqmvTEkhQeeznHZRhSnXs0QJOyIa3s28QS1Uc3gdT7EylMp4d46b5Wj
         Ktk3n0ltB2v12TdlLkUzD4dYij4OCD0dWSZlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dnEj/aLrKk6S/DUI7+4i2xQHvUIBOcAFtEZ74chaegE=;
        b=r0+ZhKbdG7eToV2PGGrfqD7h21j1qxVUlPlRq9H7A0mmAFu9uCMXqLVoWoiEjAE9kG
         xxIY2csrnofxQzA9apTQ9bX1n/1dbYmdpPVqFMVrQ5sca8J7KpnpQQiXdT/lv0GHvLZC
         DqNrItLmhpzB9EbXV+AHlS7fU4tAcOaw3L/JG3by5Qm/W74ksJ+/MyWlZppFh/QeK7ho
         4wGuiyAF7m9Znsqws9UxDEQIJZyEKaQYdJZB2nX3YTlg1eE1YclqRoeOFxdg/1UTug4w
         ghPQ6IW/IubUw5KOy4fQkqEjypCt3BjFX6uk7UBPzkVAh5WGDzxFMKIKeAr2lVzc/w5G
         YVTg==
X-Gm-Message-State: AOAM532ffG/L6WliUPK54zaKf7udt8nwdFWuB5i9SqCTYgckwnH5y9E9
	9mC5CfXKKRACJ5JV/VoeOy8Y8A==
X-Google-Smtp-Source: ABdhPJynxf9ODlZahdJX5rZpP705YZyiMeIxVzpc27KvF4f2oehoMMVxtbaGQf25kV1CdbcDUwPk2A==
X-Received: by 2002:adf:e4cc:: with SMTP id v12mr38662898wrm.92.1593785388491;
        Fri, 03 Jul 2020 07:09:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c20sm17826965wrb.65.2020.07.03.07.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 07:09:47 -0700 (PDT)
Message-ID: <c34ebc781c80eeb6d8617337871d55abfe7978d9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] u-boot: support merging .cfg files for UBOOT_CONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Noor Ahsan <noor_ahsan@mentor.com>, "Hussain, Ahsan"
	 <Ahsan_Hussain@mentor.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <sakoman@gmail.com>
Date: Fri, 03 Jul 2020 15:09:46 +0100
In-Reply-To: <43478b9e0d2e46da87bb23e97c124cbb@svr-ies-mbx-02.mgc.mentorg.com>
References: <cover.1593420599.git.ahsan_hussain@mentor.com>
	 <63967d5c25d4235fe0d80ec0399463e26d087faf.1593420599.git.ahsan_hussain@mentor.com>
	 <43478b9e0d2e46da87bb23e97c124cbb@svr-ies-mbx-02.mgc.mentorg.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-03 at 13:39 +0000, Noor Ahsan wrote:
> Hello Richard,
> 
> Can you merge this on Dunfell,

Steve (ccd) is the dunfell maintainer, not me...

Cheers,

Richard


Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.10557.1587905988127275528
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 05:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D+c7RBd9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id j1so17230204wrt.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nWgoUySiR9fjvUe9hK0cLPnViRt6Ilg2Nf0NtRYiKtg=;
        b=D+c7RBd9KbLsL/RUtWRIMSWDzlyI1pGVWsW79LRVK9hdXOB4tuDWXy983t2AynJ9UH
         +o4todUpQECmzwuCsP/3Qlk+40ZeIDPIuB0hu2RlmQNFSNNe5emL/NcIWnaK1/Bx4fRK
         4st87J8f5Z2J/HzhvdBZfSjuZt6mAiWM2+Lws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nWgoUySiR9fjvUe9hK0cLPnViRt6Ilg2Nf0NtRYiKtg=;
        b=J/Aq/NxAMGVAOYuYT0sng/5GaDMhTiXZJxQ6Vzzh2s9b7GANBz53q60rJ7Y01LMakm
         7idmb2HH4r66Ic73M157N7xCHl+iQvFB6xjM2EGEkV6bKHKmRWorlNgEvZRnA73E2KgE
         OH1+eAhuIxjUa6dII3gO2i+ha8+kqabf4LNU6AvvrVuC5wuMI6F/wHgA+VteFlFI2FsE
         rZNjj1TsnnaCqSf1JK7cODVru78sx3JUOAIuKEPFV9Ax0HPbgLhz21MtnwM6djYnvMo5
         kgLhYQDOUiXDIGObUlRxNRYZCtA40q8qvtE1k/VWMgb9Wv4QQpveDKejGvhVMFN4Te9n
         8xLg==
X-Gm-Message-State: AGi0PuZ/i6GYcPGkYnfC5F6U9eKeERjOQC7ApcOOxbtpd8CRJc9jwqEY
	qL8kdlwEZHy/we5UL3i3NGh7cQ==
X-Google-Smtp-Source: APiQypK3SoZuqYelqccQYITI0ZZc1QDEdGhz14vOj34h6J2E8HToyDOwncbrW78lyUTWCf8CzFuxsg==
X-Received: by 2002:adf:dd07:: with SMTP id a7mr21604045wrm.349.1587905986538;
        Sun, 26 Apr 2020 05:59:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d133sm12730256wmc.27.2020.04.26.05.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 05:59:45 -0700 (PDT)
Message-ID: <d3664a46f7e733018205320264a2b9f8ec7522d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 07/10] wic: misc: Do not find for executables in ALREADY_PROVIDED
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda <ricardo.ribalda@gmail.com>, openembedded-core
 <openembedded-core@lists.openembedded.org>, Paul Barker
 <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Sun, 26 Apr 2020 13:59:44 +0100
In-Reply-To: <20200419063539.1467641-8-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
	 <20200419063539.1467641-8-ricardo@ribalda.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-19 at 08:35 +0200, Ricardo Ribalda wrote:
> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> 
> Executables like tar won't be available on the native sysroot, as
> they
> are part of the ALREADY_PROVIDED variable.

ASSUME_PROVIDED :)

I fixed the commit message in -next.

Cheers,

Richard


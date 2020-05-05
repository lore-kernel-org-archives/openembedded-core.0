Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.4576.1588672416895857283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 02:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kj83g41d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id y3so1989398wrt.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 02:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RK9z8Xco7L4QgjDmnJykEJ+p9xzEk0qobjfnHfsFCSU=;
        b=Kj83g41dEbf553yBrDOCWm/JJBKI2wAZloCyVFdJLLkuq66tc9771wDv1ZbSYRekGJ
         5RTLMzth5Q8RiDHuHQyc5BnSwFVEfmOC43lMifEwWVV3ZUgD8s3MGSprCXeqBSmYP1Vi
         69vfNFAqhSneO/r2oqQCMR4MzzUzgqoy9fydc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RK9z8Xco7L4QgjDmnJykEJ+p9xzEk0qobjfnHfsFCSU=;
        b=ImLqqbP+USZMSlZQSlZMHk6Tt2GRlTH/19Jp4ROrflmb5bQnUCUHHLpMpLLo2YKvvH
         ifw1/gLSjxuRV9ym1eXsAhFWux2Vy7cowZi0xCj2CJl7t47rWnNZ1Ehd7rLiamhIHO6K
         VbN4V6XNFnqHYN+NYW9GIvZGe7Br/KLLH90ht98eEhYD/s4IErBlFb0om4R1TUWXg9Du
         eOpDa50wupi0knH1vukI8tgUgSVYFTFo4V1CFf4uvAMApXoj7n2ukFu9HUibx1bwm7L9
         9tP8FmAULkN8M34ZgSPVDueXDv7IErha2seQusWX9ZSw6UKteE/WGMKaf8mVtBHyIKBq
         sI3g==
X-Gm-Message-State: AGi0Pub4SRX6Wi456fDsvO9wWmXR+n9yLQCXWyCruoX8icfraCyX0NVk
	5jHlY3h+nauIzhzmVqMG+pBaw558Rxo=
X-Google-Smtp-Source: APiQypJQ6TIn/7m7viXeBeRNpaMPhYmUqZaDYeBAJXmIXfRfbVBraIkliC9XtZ8CMRsnEBudURhbvQ==
X-Received: by 2002:adf:ea05:: with SMTP id q5mr2604274wrm.87.1588672415231;
        Tue, 05 May 2020 02:53:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j11sm2328817wrr.62.2020.05.05.02.53.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 02:53:34 -0700 (PDT)
Message-ID: <3ac91d68927fd1e9c4a8fe07b52427e58405cf99.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 00/14] Pull request for dunfell (cover letter only)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 05 May 2020 10:53:33 +0100
In-Reply-To: <cover.1588545160.git.steve@sakoman.com>
References: <cover.1588545160.git.steve@sakoman.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-03 at 12:39 -1000, Steve Sakoman wrote:
> The following changes since commit
> 1795f30d8ab73d35710ca99064c51190dc84853e:
> 
>   build-appliance-image: Update to master head revision (2020-04-07
> 22:15:32 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib
> stable/dunfell-next

Merged, thanks!

Cheers,

Richard


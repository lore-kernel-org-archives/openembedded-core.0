Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.1833.1619032886914927955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 12:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BIFic47A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id y5-20020a05600c3645b0290132b13aaa3bso1814592wmq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 12:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8V/TyF337gAH9vdlKDbbG9A2b8+yU9h2MItELQFueUE=;
        b=BIFic47AoSORAgV63EhsPqKn+YK7NRFwIG/aB8OztLXs/sfLESLrIHCVk72YI+amah
         esDWk1fNo2zyODfDpKzx74EF+BoWtTelNi/M8KY6Hd3KQGdyErs6+p/iXlb7aP8bYXTL
         A4e3+QXBMzOlLYnBgLwy5k7X+WtNa+Rz0RyYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8V/TyF337gAH9vdlKDbbG9A2b8+yU9h2MItELQFueUE=;
        b=oWRQnSmN4lHPWJHmZAr6ZBUx6Xn+ye72ftz0QCtO79h6HXgKfHlanagg5ZnPcRiyyB
         broYn3ci7DbDZgftUE3nJTVdTRhCRbvumCrtJNKojI2uftIrsqNkPQ1ordQZSZx3VuDg
         2xyoXguRf+G5i6bA1CaTwLuz3EDYKvq/zRDBuwK6C7Vs6pCYoP5vUmnxKudAV7VHkIQY
         iy0yisFfEsgAIYVNNdsmwib/yHTHkDYouUOQDIz1RYaMRIuOS7zPLk1huOzVc9zWkPvb
         g907LF8TCj5CZPuN16zuJYqcCgcAZnq6SP+YTZGGL/ajSwrLypuagTx0A7NJ58zq3w2r
         gFzg==
X-Gm-Message-State: AOAM533X7COyi5LLIzU4EbuAww20ObPHunKwFku8S5mwOu8BzQbumv06
	mpaYW5XzvIOOcY+ET7Hjl+7pRQ==
X-Google-Smtp-Source: ABdhPJzkZzrXoXf8zrQ+xnPPLRoK8qrVE88QIlYdf3U0TPF0KSrH0mLZ5Yxr9YjWCyiiaC6bPl4zqw==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr11175342wmq.128.1619032885455;
        Wed, 21 Apr 2021 12:21:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:95dc:b210:2777:ba53? ([2001:8b0:aba:5f3c:95dc:b210:2777:ba53])
        by smtp.gmail.com with ESMTPSA id p13sm450201wrt.0.2021.04.21.12.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 12:21:25 -0700 (PDT)
Message-ID: <aebbbcf8d29afec37b4a9c459eca8ab24112137f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>, OE
	Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Apr 2021 20:21:14 +0100
In-Reply-To: <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
References: 
	<d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
	 <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-04-21 at 16:15 -0300, Devendra Tewari wrote:
> That's a neat idea - if the exception handler catches OSError with error number 
> 18 (Invalid cross-device link) in os.rename, it should attempt shutil.move, 
> otherwise it should re-throw the exception with raise. A wrapper function 
> will make it easier to handle other situations as they arise. I'll update the patch.

Sounds good. Could you also please split the patch into two, one for bitbake
and one for OE-Core since they are two different repositories.

Cheers,

Richard


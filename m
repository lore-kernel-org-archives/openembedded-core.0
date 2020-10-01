Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.574.1601563635087364926
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 07:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TczKInTc;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: uvv.mail@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id c62so5568871qke.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=bI+xfgwPA5GPlTNpBfXrpQA7zcCBzYkMcSfQw8HOhng=;
        b=TczKInTcLKf4oUQhgyXPZP4ZyADv1a9FBdNNoOJZIB4CAXnoaZr7MasOY/Ti22M3Ju
         4YwVpIMtQItlU7VB0ZJYEym5wyooPMTf5REwKD95plxnQcrR64Dj78eQHduNb/cMZahx
         d2qNHs3cOk+6N869ovOe8DBEyzTzarT0lJKCnAx+IBEAMWUUtXQRziPrYCyfqp/9JxsU
         jvIETkOUIs3bWNNNTrhpiKERCbK0GP+L5bwfnD8dPYYRvx+j/pMzlXzlPVptgx86h0py
         fV1Ra59xaf3XyY92OJssGudXCMocVRkGTp92U/wGcJDQNlDZN3/yqGXeMkSBHw+3Mo9U
         4dOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bI+xfgwPA5GPlTNpBfXrpQA7zcCBzYkMcSfQw8HOhng=;
        b=av2dhjN8ydmBkYgGcycoUk2ve+/+ARpYI4UhZ+tORQs/a55kBEbLqoT2538gStM6Hf
         a4OECxyuMEhkd0yaGJSU9Egma9Dl4uFvSCb8090kc/EtYCOZ5j+yTiHUVeqLDS+NHGNF
         lbaJG2GFy0OFiI/wXwJgkWdIh0r5FRfj8WJfgznIddyjBuJM0ZyurWMoB2A9J3edWJK0
         Xdr6YPdM/J/e3KSRyI1kwsK7mc6fglHDdecnpUGEY4VX1VKVA+HKk0q4p7HbnaXdVn8W
         uR01JUd6yoTsMSu5adiiyuINOmgxRwusGUA09/0bJciRWVNx1i9WDq8xtlOl/JDSZ7j1
         9rYw==
X-Gm-Message-State: AOAM530QCcKsZFI8D55itwTQvd6NTI9dy+oGhKlNzsctkHEfu/ZsQvox
	/ITWF5kUPOviBDpAF6sWO44=
X-Google-Smtp-Source: ABdhPJycGc29D3bZCScPth2RVAPSUlpm74JMYNyAAOwUjtbt5o1ECoO/0Gg7SItFaf7PgR66RnBTzg==
X-Received: by 2002:a37:5d8:: with SMTP id 207mr8220930qkf.352.1601563634275;
        Thu, 01 Oct 2020 07:47:14 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.205.180])
        by smtp.gmail.com with ESMTPSA id m10sm6856591qti.46.2020.10.01.07.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 07:47:13 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] module.bbclass: add HOSTCC for out-of-tree modules
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <Openembedded-core@lists.openembedded.org>,
 Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
References: <20201001135927.721794-1-uvv.mail@gmail.com>
 <CADkTA4OZNhbMaykKi_pU_Af49D-wAjeqQ=3L-y241Lcj7TUd2A@mail.gmail.com>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <c71e99aa-5669-a75c-1e72-81c176ee71fa@gmail.com>
Date: Thu, 1 Oct 2020 16:47:10 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4OZNhbMaykKi_pU_Af49D-wAjeqQ=3L-y241Lcj7TUd2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 01.10.2020 16:36, Bruce Ashfield wrote:
> We already ran into this with the main kernel flags, and we don't want
> to duplicate them here.
>
> Why aren't what we have in kernel.bbclass working in your scenario ?
>
> Bruce
>
Because kernel.bbclass is not pulled in into the environment of 
out-of-tree module recipe. Should it be?
This can easily be checked when you do 'bitbake hello-mod -c devshell' 
and examine $EXTRA_OEMAKE variable.

Vyacheslav

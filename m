Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.6777.1596633341380574994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 06:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N2oMEFtN;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id b30so24239767lfj.12
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jqTkOjMt4WLYTzONP+S75I7VE9bM3UsxyeIl5qYgv40=;
        b=N2oMEFtNOpynB1rUGyi49i+e5lRertfja2WWldu5hkj47HCDbE2/sXSlHoCAPyDEC9
         YsiZAWf1w3vchfqNgSRBGm3asHNqxeUg1pApLJB7DgWqwMc7KhmIdamuV028oMXhGGfA
         m3bGen7vU9N8CYtU4Ux/Hlp79rhVs3um+dlY+2bNedUYMc2dSsr+9xgQLcRxMf1Rjdcj
         z+5Y0hDb0XKdgsfQHKwgOa02pURptS8ca0mnS9FBZt6k/9I9yDzD1ndXiDeojnGz8Qun
         D+PxHm1tDKxtnSt9uDwncJGLeWZ9SQt2sHMHJyLYk3gpw4CxUZ5qRKxlb6JNoU+EkK2N
         ZPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jqTkOjMt4WLYTzONP+S75I7VE9bM3UsxyeIl5qYgv40=;
        b=qCnL0SDyHDXYgwp35u2mQWxvZP7T+WqEjsdZ72zYvsjZa20ORdlTUsgL/QQ1/PCk3C
         L9kfkj5i0p65VWdPTfonbrB4E/5ro5xt6L2wvvqCZHUBwVltE6SmWBgvlQViLEtCcgfH
         psX9TQuldThxppznm9KMhnfSDkUnF7PGLxzgizs9D+Wt6DeIPXq5PMdHWBYmOT2b7L+y
         hFypviVm2PVF45edEcWZ06kKEgEYOdirAkE3WnXBMfS3cwEaQ2vJSB9TsjkMEdeR0ikm
         jd/baOjxqYYVmMSkHlWSK66Vm0rudFYcRuCqglkHo5TYJFA9ls2wI1gm+tRZIg6PDJya
         c2Ig==
X-Gm-Message-State: AOAM531n02rXLNeC9O+2ACHhFJpeL+j7YK6rfgKEicTL3sbugtAx0fJu
	kAkQ31tdnUxzln3v1cXSDW2pL8cB
X-Google-Smtp-Source: ABdhPJzwo68fMoLoWOGO+UgfMLP/XrfN4+ZY6kjFAJRqE1G7hrLHSWDpPpuV6OpRB+XuAlnHiEub+Q==
X-Received: by 2002:ac2:4adb:: with SMTP id m27mr1630296lfp.90.1596633339302;
        Wed, 05 Aug 2020 06:15:39 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id g11sm1112068lfc.46.2020.08.05.06.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 06:15:37 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200804082019.76320-1-jacob.kroon@gmail.com>
 <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com>
 <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <3237f09f-7b55-97b2-9c39-8bc7bf1a62c9@gmail.com>
Date: Wed, 5 Aug 2020 15:15:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/5/20 8:17 AM, Khem Raj wrote:
> here is a recent build with clang11 which also switched to using
> -fno-common and errors are pretty much same you will see with gcc10
> with this patch to revert the -fcommon defaults.
> 
> https://errors.yoctoproject.org/Errors/Build/107234/?limit=100
> 
> I was waiting for upstream packages to get fixed before switching the
> defaults back to -fno-common.
> 

Yes I understand, maybe its better to hold this for now.

Having a list of recipes that needs fixing would probably speed things 
up. I can have a look at some of them.

Jacob

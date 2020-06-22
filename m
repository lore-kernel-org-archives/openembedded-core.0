Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.2251.1592847384118763326
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=owh12APO;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id cm23so98501pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QKk/Z85aG3NpvYEE5OGHJA3tt/C0RBML8le2O+gEWpg=;
        b=owh12APOIz1LMCj9yNaxJKt27dRqs8ozICRm5H4Q2MkW8usehq/B2yR5LgRpVx2Riu
         sbSMRt4UbBqu+LhVu3995BWul5jgzw2Foj0hdftXJkH6h7igJMtA27c60GggYXDemJlK
         jPSBs/RiUxnVgZirbqIxE8GaIroy9azDEQHmsfrqX10gtg7MtcX/zaPAK5Ro8/OVdZvi
         tHngAyQnF7OU3lxjgweyQxrzabYL446aPoJzcgcexIVuc1LeFoSsXHQ63c8ScjjkTlHL
         E8Zc4E8x/LwoA3hDg/VGAzyYgS3wplJp4XUG/xEkCrEKk4DgVFdanvdcNvD5e3IO6skL
         VzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QKk/Z85aG3NpvYEE5OGHJA3tt/C0RBML8le2O+gEWpg=;
        b=M6S80bE+lrzplW+Zx5tJDjF47cfFc9epxgGOoz9QqosLrkGGZOTtgH1NHLeXM5G9Sm
         Z+kQTxTv5iE9CUaAktvYyOb+RYs1CLyxtkTnpTpouLsGIfyQHD8aRKHxv26FXW7uoTr1
         0tjK+L0TAnj5o3aEcZqAQyc0aoLHpB2FRtlwYdXbwnb+td5PM0cleOxQvcam5k0NYJ+K
         AavxcUS6Ymdj7fJJaMQ+hL4YWGvOqGCZtJw/Sl0i9fY/GnAQfXzBFtbxJrJAelU/Uns7
         g0mWPI2k0ET0/cuRBtWFZNiAwopPA9RQVw/Eqsmh0YVf72JbcPLKIOfq/MELP4rE6Bx1
         AOeQ==
X-Gm-Message-State: AOAM533OXoWXip3E9NzdSmo2J0dAWLh/wBOwd0NfEH/jh2iKKTRS0NtZ
	VfGZMEb4eJWiN6Mzgan9/NE=
X-Google-Smtp-Source: ABdhPJwPQ5uOLKbnj3hr0bR4yscuTXG3pkG3cLacVaRiLG4mFm9qRK3MYI6Rfhn80fgu9HxOKgX/CA==
X-Received: by 2002:a17:90b:4d08:: with SMTP id mw8mr19428464pjb.119.1592847383615;
        Mon, 22 Jun 2020 10:36:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:3ce8:8e51:3e8d:ab7a? ([2601:646:9200:4e0:3ce8:8e51:3e8d:ab7a])
        by smtp.gmail.com with ESMTPSA id n1sm142996pjn.24.2020.06.22.10.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 10:36:23 -0700 (PDT)
Subject: Re: [OE-core][PATCH 1/1] oeqa/runtime/cases/ptest: Make output content path absolute
To: Andrej Valek <andrej.valek@siemens.com>,
 openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
References: <20200622173307.29538-1-andrej.valek@siemens.com>
 <20200622173307.29538-2-andrej.valek@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <84aa3636-44b2-4bec-1e57-912a7a25dcbe@gmail.com>
Date: Mon, 22 Jun 2020 10:36:22 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622173307.29538-2-andrej.valek@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/22/20 10:33 AM, Andrej Valek wrote:
> The output content is created in current directory, because json content
> has no defined absolute path to WORKDIR as in bitbake.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>   meta/lib/oeqa/runtime/cases/ptest.py | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
> index 1b1474adcf..919901d465 100644
> --- a/meta/lib/oeqa/runtime/cases/ptest.py
> +++ b/meta/lib/oeqa/runtime/cases/ptest.py
> @@ -42,6 +42,10 @@ class PtestRunnerTest(OERuntimeTestCase):
>           # testdata.json is generated.
>           if not test_log_dir:
>               test_log_dir = os.path.join(self.td.get('WORKDIR', ''), 'testimage')
> +        # Make the test output path absolute, otherwise the output content will be
> +        # is created relative to current directory

'is' is not needed in above comment.

> +        if not os.path.isabs(test_log_dir):
> +            test_log_dir = os.path.join(self.td.get('TOPDIR', ''), test_log_dir)

will it expose full paths in final logs ? that may be shared publically ?

>           # Don't use self.td.get('DATETIME'), it's from testdata.json, not
>           # up-to-date, and may cause "File exists" when re-reun.
>           timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
> 
> 
> 
> 

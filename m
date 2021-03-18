Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.2361.1616105820700925465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 15:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SOc11KYp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id z2so7135303wrl.5
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 15:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FVIApNhaecB/RpzTVn58v2/hci6rz83gcEXv6ESl7kQ=;
        b=SOc11KYpyrxz02y61eqTP0sUSagIE35yP+RL9fdRXdGyhUle1Cfj4rwhclbq51sNN2
         yplh4j2vhadwtblJOPdkY3sSBVFP01X9EER3yakVzWeSw0qxj7sB4nmNXV9+D5Up1VZb
         7vfoGU9oPKjuhwTuOQOOhwSKjbjpp8wNnJdoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FVIApNhaecB/RpzTVn58v2/hci6rz83gcEXv6ESl7kQ=;
        b=RkNksuAqU19P49hgA4DCH81jG2DW4mtmQZkOWF96oAYeGdcB3PEIKAybfGfqfgd8fh
         J4McDTDWB9N18EkIpdi4ns2FTE2gVh46xkpEmkJDpPGuOQXR93wQABc63JQFtgygfw7E
         5q7B2+fg6D1l42vgShjv9Sn+ssxOiXAOs2Av0NOZqtUEiQxo7/cKjf9S4NMeWfV0v5CI
         fXU1+gcTsyMVMhtE0h/rU34P58Z0j+bTQlcIK7bmA8f6aFWy19JpzeAIAifxMDiD1nZL
         CUmzjDCV6POxygVm4d2bxl7WzOVW8HMNFLT1qj5L0zI6jb4PvZV6nctrPTt/ydviqAzn
         tIyg==
X-Gm-Message-State: AOAM530ZTMwmgKvWxYQf5QtK8oW2uXBH+oPCy6/Jkl46LZk9qyQX5V7q
	Pu5ZLjG7Z7AQ5Tyg/EzxePA/Fw==
X-Google-Smtp-Source: ABdhPJz+HIHEMG5NP5IDXWbIMg2RDa+cCA4LRIVGEXC2O3XLs4Lm8drlV/Y8iiggNLgZgv2voxiTUA==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr1410756wrm.260.1616105819066;
        Thu, 18 Mar 2021 15:16:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:8e52:d330:3893? ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id s18sm5481088wrr.27.2021.03.18.15.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 15:16:58 -0700 (PDT)
Message-ID: <3f8fdefd12d982dea2e9bf36bef5e8de2fc627a8.camel@linuxfoundation.org>
Subject: Re: [OE-core] Fix error in do_patch when using "PATCHTOOL = "patch""
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Mar 2021 22:16:57 +0000
In-Reply-To: <1615770124-15950-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1615770124-15950-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-15 at 09:02 +0800, Wang Mingyu wrote:
> error message:
> checking file gcc/configure.ac Hunk #1 FAILED at 6602.
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../0002-gcc-poison-system-directories.patch  | 105 +++++++-----------
>  1 file changed, 43 insertions(+), 62 deletions(-)

The shortlog in this commit isn't right, it doesn't start "gcc:" to say
which piece of the system is being modified. It also explains where 
the error occurs but not *why* (file being patched multiple times in
a single patch).

I've fixed this patch up but in future things will merge more quickly
if the commit message is correct.

Cheers,

Richard




Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.10700.1611060005377394983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 04:40:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FKjpi7NP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id a12so19559898wrv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 04:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=dDq5Pevh1Ti4cVCIJ5IPSf525Tk/73muDoWvLZJzuvU=;
        b=FKjpi7NPXcGPHjXht1eMvTpDmzlFyRjVo026Sp85/Kgfyyj8rr89qxAUSMp1tlNOxU
         2b1YGwSjZHgvgEspzDbVj8lelARp488oe/IHZQ7tbCYfXT4IlwEUJpHAngC+9tDNqAfF
         bctiy8JcumunzSO56O81k+IPd4KRz75TKlPVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dDq5Pevh1Ti4cVCIJ5IPSf525Tk/73muDoWvLZJzuvU=;
        b=eKxppCkDe5xm+m3LDQDm1TMEbHRf+BSD6QFTqUZS+CwCZkrNH/iMbMEcl4I+UAgFGz
         hMJVdz6Ktj0FuECrqGmkuUIy1eqDlEzxtljcLQo/aWd3N5OsjHagKEorDUXnWbXYRttP
         dSJZitZN9coLjqdBydXINw3JRGV/cwjB0R3CiIhBLnWF53vkk6aAsnIlPHlJEDHtgLyK
         q+VYtTiKsbRKuMsYucz+vHBMyhX/A8AF/kYGt0iVFuHxxxp0KbWNlMSGZuEwCFh6a006
         H8KOom6nFbcfr4dTj0v+X/GzZ6gRnbp0ZFWiMb6zk7vIPhiOJ+W8LRSF6qPDqam4AvZQ
         vpWA==
X-Gm-Message-State: AOAM533sTaMAxLcTFkbDbRk8vRr3MP5IoJx0bs0KAqIEpkkU1Ipf0+fh
	z8Nl2zU070F2CxRM7qKvl9LeXw==
X-Google-Smtp-Source: ABdhPJzRsV7LnAvPxjO7/HvWCPhGOFg/ny3/tseqZ3gMCng5GbhgxeDbLYkTBofvHbzUzhIdFHdbOQ==
X-Received: by 2002:adf:d20b:: with SMTP id j11mr4119618wrh.318.1611060003976;
        Tue, 19 Jan 2021 04:40:03 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id k9sm4654135wma.17.2021.01.19.04.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 04:40:03 -0800 (PST)
Message-ID: <d36f56ea7d0ad862d7ed8fe3aafe64b680aead56.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] libxml2: Update checksum for testtar
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zhengjunling@huawei.com, openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2021 12:39:44 +0000
In-Reply-To: <20210119062545.625-2-zhengjunling@huawei.com>
References: <20210119062545.625-1-zhengjunling@huawei.com>
	 <20210119062545.625-2-zhengjunling@huawei.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-19 at 14:25 +0800, Junling Zheng via
lists.openembedded.org wrote:
> For some unknown factor, the checksum of testtar(xmlts20080827.tar.gz)
> is mismatch with that of remote. Let's fix it.
> 
> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> ---
>  meta/recipes-core/libxml/libxml2_2.9.10.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> index 07ae68610c..cab234f9b7 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> @@ -28,8 +28,8 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
>  
> 
> 
> 
>  SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
>  SRC_URI[libtar.sha256sum] = "aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f"
> -SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
> -SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
> +SRC_URI[testtar.md5sum] = "3a944b972f2da90b97d8a57c6f939fa8"
> +SRC_URI[testtar.sha256sum] = "9b2c865aba66c6429ca301a7ef048d7eca2cdb7a9106184416710853c7b37d0d"

$ wget http://www.w3.org/XML/Test/xmlts20080827.tar.gz
--2021-01-19 12:38:58--  http://www.w3.org/XML/Test/xmlts20080827.tar.gz
Resolving www.w3.org (www.w3.org)... 128.30.52.100
Connecting to www.w3.org (www.w3.org)|128.30.52.100|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 638940 (624K) [application/gzip]
Saving to: ‘xmlts20080827.tar.gz’

xmlts20080827.tar.gz                  100%[=======================================================================>] 623.96K  1.27MB/s    in 0.5s    

2021-01-19 12:38:59 (1.27 MB/s) - ‘xmlts20080827.tar.gz’ saved [638940/638940]

$ md5sum xmlts20080827.tar.gz 
ae3d1ebe000a3972afa104ca7f0e1b4a  xmlts20080827.tar.gz

So seems ok to me?

Cheers,

Richard



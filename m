Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.22121.1627639865425743836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 03:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G+Sl5xbW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q3so10676326wrx.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=tmFDIAnfns+uQZe4sSqNduYmtmztkzGn9iQz5jtEXGo=;
        b=G+Sl5xbWd/nMbxmFPZ38j20lWjk961vwNMFsR9mq5hItnVlnqaMJuYYd5eEQGzT5Uj
         7WzsdGfE6mu//mleFLq2qqRdMsUnWyeH+2BAFTdfXZt22DB/MApkzAx15QOhxw3553D5
         fMUUZLNQW775bSDJ3zFLlHigWDLOgKK9prMn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tmFDIAnfns+uQZe4sSqNduYmtmztkzGn9iQz5jtEXGo=;
        b=OLW1j6Gxbxj+2/3LqLGblaqkHTisccKYGIf1LG02Dm9ScBvTaTD4DXm/EuneCa7ux1
         hS8oEeJ9UMgCDsQnXKL24wLmnJvmslo2O2aRS9LIpyEDYzqaOyLyh0Y+36nt0h7CJ9Bs
         O8iith3VAFzy/6NqvSectn+ht2VPIWjTHmc27OMxvKwMSJOd4FBT6OnyN963N/eZ0p+B
         Gvtyl1vL5eMf2AIUyQR0+0t5HGkckAtVcdv9mT24xK2THWGwAe+OBIbxYf+ve/DjabHN
         4/w1kVAN+xee6gGf9LI/8ioVV0iu6So8KA/7jE/82V2P6Zy0HeZpszY8eNhPHgLVsZYg
         gYKA==
X-Gm-Message-State: AOAM531QiACKX49gGpakZDk6Hufkj/RYvj8GWeeElLU63Xg1+Lm+8H9y
	9CLckZ8fhg6TGCUjZUvAO3MxHA==
X-Google-Smtp-Source: ABdhPJx/cL3HvBlfs1po0be4cEbiVVTnraE+XsAW7zjy0kEaRBgC5XZLd4VnG+B5bdA6Lns3mDFBrA==
X-Received: by 2002:adf:f046:: with SMTP id t6mr2239257wro.266.1627639863646;
        Fri, 30 Jul 2021 03:11:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b? ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id z20sm1099403wmi.36.2021.07.30.03.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 03:11:03 -0700 (PDT)
Message-ID: <4befba5f96824bce16d6d67c4e525b5d5ecd84d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-pytest: fix display version info
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Cc: yuanc.fnst@cn.fujitsu.com
Date: Fri, 30 Jul 2021 11:11:02 +0100
In-Reply-To: <20210730033855.23941-1-kai.kang@windriver.com>
References: <20210730033855.23941-1-kai.kang@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-07-30 at 11:38 +0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It does not show correct version info of python3-pytest by:
> 
> $ pip3 list | grep pytest
> pytest             0.0.0
> 
> Remove 0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> and depends on python3-setuptools-scm-native to make it right.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...he-setup_requires-for-setuptools-scm.patch | 36 -------------------
>  .../python/python3-pytest_6.2.4.bb            |  4 +--
>  2 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> 
> diff --git a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> deleted file mode 100644
> index 1abd531c62..0000000000
> --- a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From ead04f2da75efeca3369feff6161ea4a8baecbc9 Mon Sep 17 00:00:00 2001
> -From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> -Date: Wed, 28 Aug 2019 16:12:27 +0900
> -Subject: [PATCH] setup.py: remove the setup_requires for setuptools-scm
> -
> -The setup_requires argument forces the download of the egg file for setuptools-scm
> -during the do_compile phase.  This download is incompatible with the typical fetch
> -and mirror structure.  The only usage of scm is the generation of the _version.py
> -file and in the release tarball it is already correctly created
> -

Recipes should not be downloading during do_compile. We need to fix this in some
other way, we can't just remove the patch.

Cheers,

Richard



Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.16952.1598528403467222468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E0M7D8E9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id d10so4131003wrw.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1FEaPT/TWPYPGX4I+NYWeSj8T+nU0hTnReYEQW+pzbo=;
        b=E0M7D8E9jgJyz5c28/ZFN+0fudFnZjBsti4RLanFoCORvf3efB3NS0cNLr+UkjiILA
         xdXnER0xVorQy25oTd/lSceYLc9fwqQxhuyN5XQaZjPXlVOheJGbfS6uvuCSjBvx+tVK
         ulsH9RSnruojanOAoScMKf8laWUgIt+l5Jlrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1FEaPT/TWPYPGX4I+NYWeSj8T+nU0hTnReYEQW+pzbo=;
        b=ZMK4wi4ikMw3LM2m+UyT/adNUw7LRUJu6MA3/I/8BqS1cO2rmOy2ABiw+HgNrzgvtL
         yx3ByKfP+LHMcKHFrxIrX9t54JAbHJQhWbxW743WZrENssrDwf8x6d0fzuet5+vj1J75
         +I/qtqRcc/ghb82wa+5dpqabuECGod5sWGF5bKXrBIPCsjgLH6YSP7EzrRU+C2e6DNwG
         5Q6g+VfO9+PoRLv0fmDqYja/2ZZO9edZjFyYK3ANIDK4n4O6NYPHyOWa14KrvS65z3TO
         UW7Ldt/BEvWlwlXwXhCQzAyAhn2AympWcBUotogjdRRksvygRlVQv+ZlZBCAsbmvA/a2
         CvUw==
X-Gm-Message-State: AOAM530zu8M/0UggjkY7KEXRZL9TmgwcwxjS2LIwQSJ9ebzoY205BqHa
	8j8D48j32mfmADQF8gie4zr2KA==
X-Google-Smtp-Source: ABdhPJwRpjXeEOSEfXu7eU0V89VJSZCi4FGZ5O2hlSpWO7APfVE7fN0sCvisleNPfX8lCuOZ1ZrDqw==
X-Received: by 2002:adf:ca06:: with SMTP id o6mr19077916wrh.181.1598528401749;
        Thu, 27 Aug 2020 04:40:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id v16sm4418875wmj.14.2020.08.27.04.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:40:01 -0700 (PDT)
Message-ID: <e0e03fe18f60cc219a8ec5176b77fcdd5de73f18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-gplv2][PATCH 1/1] util-linux: remove GPLv3 and pylibmount
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Thu, 27 Aug 2020 12:40:00 +0100
In-Reply-To: <20200827112816.2138122-2-adrian.freihofer@siemens.com>
References: <20200827112816.2138122-1-adrian.freihofer@siemens.com>
	 <20200827112816.2138122-2-adrian.freihofer@siemens.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-27 at 13:28 +0200, Adrian Freihofer wrote:
> python bindings are GPLv3+.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  recipes-core/util-linux/util-linux_%.bbappend | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 recipes-core/util-linux/util-linux_%.bbappend
> 
> diff --git a/recipes-core/util-linux/util-linux_%.bbappend b/recipes-
> core/util-linux/util-linux_%.bbappend
> new file mode 100644
> index 0000000..abd31c5
> --- /dev/null
> +++ b/recipes-core/util-linux/util-linux_%.bbappend
> @@ -0,0 +1,10 @@
> +# pylibmount is GPLv3 -> remove
> +LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> +
> +PACKAGECONFIG_remove = "pylibmount"
> +
> +do_install_append() {
> +    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
> +    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.*
> +    rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__
> +}

I think this change unconditionally changes the recipe and means
including the layer adds the change. That will break YP Compatibility
and means meta-gplv2 isn't YP Compatible. I think (but haven't
confirmed) this will break the yocto-check-layer tests on the
autobuilder.

Also, resetting LICENSE is a really bad idea as if someone adds a new
license, this will hide/override it. A remove there may be better too.

Cheers,

Richard


Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.1012.1588830754879908817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 22:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XwhznnNz;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id y4so4937352ljn.7
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 22:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Fj4aCAJhDDb4rCfXdFUsy1iEeYtv3vo5nCfkfY+g2pI=;
        b=XwhznnNzdneT18DQmht7Cx8kylGTeJBgFhhPdNfgc7fvGZcUupedOYi6eLgYJEucr/
         R5wFe02bCD8kqDjV/L9vHss+Z4k6VN/66zmSX4WFu8B0xRlXG21eSK9/MltjiWPDcZLD
         lfKl5tDlUPjm06WIS6X911j3NHVuUu3FQCGl4pxvQgC++xtTOJZgEJyIzxqjcoUpNCmh
         7ziV41ArjY5rI5SNTSReuyfAqX7Gu+fKh2zJ/fFfp68m1OtvDIKRq5gp4rn53z0PISNO
         J6FkXZwhBayYmdLGk8dklURmxu4e2N8MTCh8PwI3Y2HAn4ZkFqxlhGItywUqOtmJ9D06
         g9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fj4aCAJhDDb4rCfXdFUsy1iEeYtv3vo5nCfkfY+g2pI=;
        b=JLiXWHCe0UYnUkqZYwhu/8QiKwILlbvcbC3rpDf6RYNq078LxdRn/F/OGL5/hwl71I
         WuLETTcQaZkkxFQl27/MIzHHNARgM7K/EqUQ9RvGnx8c2PfsM7baeAi7UVBxBODbqBZt
         XprM5sS+Vey+qJLtnRpq3T1MvYXrpbI18LZL9DRAnHOinW8eHYKcOiA4ghLpPEFrOTCp
         mRrlXOqcKpTAesSxMJKG1rmFZWQQ/GvbRvuKS4LIk5mtT7rxmtZ0BWRw7IBX+V0fhZsK
         egYzB9yETj09yUQARgomgJKHeJQxG6gjep7ZDHPEOrK/5uTVXanjUTTcdKRPcF2+zF6K
         Al5g==
X-Gm-Message-State: AGi0Pua89jmas9qcZPgD09jh+6nQ7afUVGe4AQsJl5q3YkbW3EIxtxQy
	504t4DQj5vZUrwajD8nVdeXBxTltYmc=
X-Google-Smtp-Source: APiQypI5MMrPiuklfiWCpmXfyG2cNwwDgIPYNI+ry3rBXA4vlpOt68D6knvF3Cg3w4tB+cV6pW8qEQ==
X-Received: by 2002:a2e:9843:: with SMTP id e3mr7244152ljj.249.1588830752408;
        Wed, 06 May 2020 22:52:32 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id v26sm2589836lji.43.2020.05.06.22.52.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 22:52:31 -0700 (PDT)
Subject: Re: [OE-core] [scripts][PATCH] Newer Linux kernels are producing built-in.a files.
To: openembedded-core@lists.openembedded.org
References: <20200506202649.23638-1-jan.vermaete@gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <ee93c1f1-f653-ce1e-2a36-19a78be4ca3e@gmail.com>
Date: Thu, 7 May 2020 07:52:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506202649.23638-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/6/20 10:26 PM, jan wrote:
> In the past the file was named 'built-in.o'.
> Nowadays it is 'built-in.a'.
> 
> The script is modified to work with both.  I expect
> it will not happen that there are built-in.a and built-in.o
> files in the same kernel.
> 
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>   scripts/tiny/ksize.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
> index 8316b85cb1..63c5495c91 100755
> --- a/scripts/tiny/ksize.py
> +++ b/scripts/tiny/ksize.py
> @@ -4,7 +4,7 @@
>   #
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   #
> -# Display details of the kernel build size, broken up by built-in.o. Sort
> +# Display details of the kernel build size, broken up by built-in.[o,a]. Sort
>   # the objects by size. Run from the top level kernel build directory.
>   #
>   # Author: Darren Hart <dvhart@linux.intel.com>
> @@ -48,7 +48,7 @@ class Report:
>           r = Report(filename, title)
>           path = os.path.dirname(filename)
>   
> -        p = Popen("ls " + str(path) + "/*.o | grep -v built-in.o",
> +        p = Popen("ls " + str(path) + "/*.o | grep -v built-in.o | grep -v built-in.a",

Looks to me like you don't need to add the last grep; you're only 
listing *.o to begin with, no ?

>                     shell=True, stdout=PIPE, stderr=PIPE, universal_newlines=True)
>           glob = ' '.join(p.communicate()[0].splitlines())
>           oreport = Report(glob, str(path) + "/*.o")
> @@ -59,7 +59,7 @@ class Report:
>               p = Popen("ls " + subglob, shell=True, stdout=PIPE, stderr=PIPE, universal_newlines=True)
>               for f in p.communicate()[0].splitlines():
>                   path = os.path.dirname(f)
> -                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.o"))
> +                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.[o,a]"))
>               r.parts.sort(reverse=True)
>   
>           for b in r.parts:
> @@ -139,7 +139,7 @@ def main():
>           else:
>               assert False, "unhandled option"
>   
> -    glob = "arch/*/built-in.o */built-in.o"
> +    glob = "arch/*/built-in.[o,a] */built-in.[o,a]"
>       vmlinux = Report.create("vmlinux",  "Linux Kernel", glob)
>   
>       vmlinux.show()
> 
> 
> 
> 

Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.6927.1588927562895388156
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 01:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AQCJaVNZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id u4so795636lfm.7
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2020 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=gKQZUwi3FWI3md9IZqrw+43kzb/wSXqKNwdt+yuwF8E=;
        b=AQCJaVNZdUyyWg/vv8JCHprTD7xnqR0DqNQ7YUjofux2jbSaegKgzf0wr6upT3a33r
         i3U/SclqFS2GmC0H43JW7mi9SSwhsHRfHGmnwKbRgAoExhS1CBxZ+FFmPcriz4XrlXSe
         P8237yC44MNuoXu1BMU1V0OqIv+4zlmhpVQcSN01bfrg6enqvoompWnv1CnaAZbsClsS
         DC1G0MeSV70bF25ARAmpeBDJz/faQRH4CXd3NBg7CVG8xYi9tySNJE7+k1oMQoAvdhk+
         nZS1n8quZrKNZ+xNDzq4PA4EIoUqsenOlLKH0dDg3LTU56WV47CwwVBPUpE3Wg1UQ8fp
         tJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gKQZUwi3FWI3md9IZqrw+43kzb/wSXqKNwdt+yuwF8E=;
        b=gesc0NXavcOD+afhFNAtsXP+AtthdGNc5v/jOyBbn2i+DsuBXNY/WRD4JOssfRITur
         sZXAfYfkSAvXjohrW+59daQFNTJn0vkKht74+O77RgN0EbBc2SzABxssAejWzPCP8aGR
         QyfvqIh+gLdbGv5Ssyde3eEq3eqOI8mcXvAqYFGgPmAst42lE3Jwbwv7Wk0TQpy2s7CO
         DQAekLo6v/iOvZDV0mlhwwfy/cq2KnjHcjr+TOD8Ubo9t4sSNN7y6gttljTcMMNnIeqL
         84B67WPTLO3OYVa4ocjRxTGg6O6qY20StNXDMqw2lijfrIpOoCtSrTHVdSEj8AVLZh73
         V2UA==
X-Gm-Message-State: AOAM531pGBNkY2Rn59T+P/CGKqdX+b3E2imL06D3IvYvru0HMLRtZSP8
	ErsO7UDkIPzfm/J8mwhw/ouKny/eNAs=
X-Google-Smtp-Source: ABdhPJx/+i30beFivv+mJJj37rpo0Hr4UhgumfbJ4XGwG+ndDxuBvb1JxxVsaPuECx0f+ThEzzOCrQ==
X-Received: by 2002:a19:cb57:: with SMTP id b84mr1164898lfg.112.1588927560431;
        Fri, 08 May 2020 01:46:00 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id m20sm685581ljj.94.2020.05.08.01.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 01:45:59 -0700 (PDT)
Subject: Re: [OE-core] [scripts][PATCH v2] In the past the file was named 'built-in.o'. Nowadays it is 'built-in.a'.
To: jan <jan.vermaete@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200507132536.25613-1-jan.vermaete@gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <6ff338a2-dad7-1634-36a3-b174ee67accc@gmail.com>
Date: Fri, 8 May 2020 10:45:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507132536.25613-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/7/20 3:25 PM, jan wrote:
> The script is modified to work with both.  I expect
> it will not happen that there are built-in.a and built-in.o
> files in the same kernel.
> 
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>   scripts/tiny/ksize.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
> index 8316b85cb1..db2b9ec39f 100755
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
> @@ -59,7 +59,7 @@ class Report:
>               p = Popen("ls " + subglob, shell=True, stdout=PIPE, stderr=PIPE, universal_newlines=True)
>               for f in p.communicate()[0].splitlines():
>                   path = os.path.dirname(f)
> -                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.o"))
> +                r.parts.append(Report.create(f, path, str(path) + "/*/built-in.[o,a]"))

Is that "," really part of the glob syntax ? I'd expect "[oa]" to work 
just fine.

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

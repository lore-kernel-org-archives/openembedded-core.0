Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.71.1595609800477150127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 09:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IquHpxvR;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id k4so4781597pld.12
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 09:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=nAHVganb5QbFVG0HMMb00OZkvjZir2izwhBuk3knGno=;
        b=IquHpxvRW4VFq+MZSp/dRI92J2ImaeIxnYFD3lbDgWNWkEFjWaxqfZGM9nemtFm+L/
         0isMBO9Jjia2FXWMahzV3qZRmzQPsH03il72Vu+kDKJ8BJNcAeiI+l74L8bdUmzSavTT
         KZKsvmVB2nwKJ0hdG8eFGZ4kpgustXZWOM2jXzxMb1fOdRlrB0xMp1y1kWYl7Q5hr0kt
         PjGud5gY1SJv+L7uTnRXZY9rrNElsP6/Ha+6YiB3wcf3iZmTWHeiwLSlzrv/r7sTgKjs
         sQuljo79XIeVuGdcipn4OUP2iYf5NeW5WhYc8FZiIVxJwMifTTKUy6oN2iWfkwCRCRqt
         8STQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=nAHVganb5QbFVG0HMMb00OZkvjZir2izwhBuk3knGno=;
        b=W5TneMi51sMv6S6ZAcXPQRKtZ77GjmMwSmfQoxpkWoZA4YKUyMpzoAOpneOaE55Ttv
         sPGNMpnwEY+BaWDYnX0lSYM/RhIqj8aFIRnPbhsvg3SoyBkM6crxXRukWLcddrljGfAv
         RqCvSnFMumqwr492ZzGELqjXDnfPPTocd3je/xvDqEf008UQ5g5tvZzUWeeqki5+zJ7G
         fi5iQLz4nSxYQ1Dkjwc/vkbRzDPM35SBQdWJ08KSNf0aJjsTw6pyPrRaK3VHt3ddwxwt
         Y+vd5JFp996zF64bVh3aIdTL2ts+E1iCuBB5PgGzB2lpj9Aj+993Gfr0chtsJhWvR/gR
         0ZxA==
X-Gm-Message-State: AOAM5304y7RD1qQ7nRaYmoQu0QwwmxRBwT0uYm/1dZv1rsiL9AU8Fqr5
	3nptS/daplciE4gEbj4vq2w=
X-Google-Smtp-Source: ABdhPJzULXn5tRMKBkQlqGFsodWQ1HA3J64fp3MIXbVqGZzpxHvFlk4BLyw2CBatxDaSDZr0nKC0bw==
X-Received: by 2002:a17:902:8a90:: with SMTP id p16mr9172453plo.167.1595609799995;
        Fri, 24 Jul 2020 09:56:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c16f:613f:b5e6:25b7? ([2601:202:4180:a5c0:c16f:613f:b5e6:25b7])
        by smtp.gmail.com with ESMTPSA id 129sm7034714pfv.161.2020.07.24.09.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 09:56:39 -0700 (PDT)
Subject: Re: [yocto] error about cve_check after a 'do_populate_sdk: Succeeded' on poky master since 20 july on ubuntu18.04/Debian 10/Debian 9.12
To: vygu@protonmail.ch,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
References: <4ndNL9YzwzexePdkb2TsG1deKpyrFQKKBcgbPArK1n89-zKVAjhgWkLksbQrXK27ug5O4Pr69snx4PJnHM_BittA4cTWn9ADxSGhjwGvHKI=@protonmail.ch>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <4d181c4d-32b3-c5d2-919d-64459ea84c64@gmail.com>
Date: Fri, 24 Jul 2020 09:56:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4ndNL9YzwzexePdkb2TsG1deKpyrFQKKBcgbPArK1n89-zKVAjhgWkLksbQrXK27ug5O4Pr69snx4PJnHM_BittA4cTWn9ADxSGhjwGvHKI=@protonmail.ch>
Content-Type: multipart/alternative;
 boundary="------------879C3B6CF16576F14E07FE3C"
Content-Language: en-US

--------------879C3B6CF16576F14E07FE3C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

This error has been reported earlier.

I am working on a fix .

-armin

On 7/24/20 5:25 AM, vygu via lists.yoctoproject.org wrote:
> Hello,
>
> We observe this following error about cve_check after a populate_sdk:
>
> ERROR: Execution of event handler 'cve_save_summary_handler' failed
> Traceback (most recent call last):
>   File "/home/user/poky/meta/classes/cve-check.bbclass", line 65, in
> cve_save_summary_handler(e=<bb.event.BuildCompleted object at
> 0x7ff6d41af0b8>):
>     
>     >    shutil.copyfile(cve_tmp_file, cve_summary_file)
>     
>   File "/usr/lib/python3.6/shutil.py", line 120, in
> copyfile(src='/home/user/poky/build/tmp/cve_check',
> dst='/home/user/poky/build/tmp/log/cve/cve-summary-20200724111814.txt',
> follow_symlinks=True):
>          else:
>     >        with open(src, 'rb') as fsrc:
>                  with open(dst, 'wb') as fdst:
> FileNotFoundError: [Errno 2] No such file or directory:
> '/home/user/poky/build/tmp/cve_check'
>
> 


--------------879C3B6CF16576F14E07FE3C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    This error has been reported earlier.<br>
    <br>
    I am working on a fix .<br>
    <br>
    -armin<br>
    <br>
    <div class="moz-cite-prefix">On 7/24/20 5:25 AM, vygu via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:4ndNL9YzwzexePdkb2TsG1deKpyrFQKKBcgbPArK1n89-zKVAjhgWkLksbQrXK27ug5O4Pr69snx4PJnHM_BittA4cTWn9ADxSGhjwGvHKI=@protonmail.ch">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div>Hello,<br>
      </div>
      <div><br>
      </div>
      <div>We observe this following error about cve_check after a
        populate_sdk:<br>
      </div>
      <div><br>
      </div>
      <div>ERROR: Execution of event handler 'cve_save_summary_handler'
        failed<br>
      </div>
      <div>Traceback (most recent call last):<br>
      </div>
      <div>  File "/home/user/poky/meta/classes/cve-check.bbclass", line
        65, in cve_save_summary_handler(e=&lt;bb.event.BuildCompleted
        object at 0x7ff6d41af0b8&gt;):<br>
      </div>
      <div>    <br>
      </div>
      <div>    &gt;    shutil.copyfile(cve_tmp_file, cve_summary_file)<br>
      </div>
      <div>    <br>
      </div>
      <div>  File "/usr/lib/python3.6/shutil.py", line 120, in
        copyfile(src='/home/user/poky/build/tmp/cve_check',
        dst='/home/user/poky/build/tmp/log/cve/cve-summary-20200724111814.txt',
        follow_symlinks=True):</div>
      <div>         else:<br>
      </div>
      <div>    &gt;        with open(src, 'rb') as fsrc:<br>
      </div>
      <div>                 with open(dst, 'wb') as fdst:<br>
      </div>
      <div>FileNotFoundError: [Errno 2] No such file or directory:
        '/home/user/poky/build/tmp/cve_check'<br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------879C3B6CF16576F14E07FE3C--

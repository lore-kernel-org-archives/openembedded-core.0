Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.13560.1606842982145517688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 09:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=YYiY8kJb;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id 142so4155614ljj.10
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 09:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rg6g/B+Ayu+dtk8YtF3CRya9rBdz0W3HNj+Ft6D69b4=;
        b=YYiY8kJb3doxUyqAAXtzCbE0+S4xx6sesn38MGnwTogbRKojsuuwAE3SJU8UGcylMD
         dojWLYpu8DAF2nKpAMLp6Z/s4mXH3VaatXGEjDVDjZ1i9LixxgGx5DoKK+N6hm6/lLK6
         clOl4wqScL16mlHo4r2L4aUXgj2QfxiJar0tciHkMZnDFiNO0v1H9o/sCsKIuBOP1Vw9
         K6QyjDv+OF6ppbIm+saJQA9eVQE5wIl4Q3Ohwrug+o8meq5T1G8blU9OOgoiyHX8eedh
         m+/IGYzzS44BJl9KTlpUr3MsbnpYKnngApZP6xH+/mr3eWyfa/GTv1dkmbsaz31TwJHt
         RepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rg6g/B+Ayu+dtk8YtF3CRya9rBdz0W3HNj+Ft6D69b4=;
        b=j/lbHdJIQrN0mxcWQnSr8kWTo0NALxEO2yggZqO+ngqTyt5nauIvIv5am8pOaZEmcw
         RzwxGfzGbojBHgjghqAwGrdbA0WKU6QdBay+aiTwOdfEeOAYcG2N/h22t8ZrtkBT4CIk
         FsVqvor8lJ7ovLm5TnDzFCQKkt8vY83RxDHJnE7AaC/LjVNtFKepUrnJuy+03abdUUyf
         K9tgeytfyLWBNA9nBQmv8RGN8O0CRFabf1g9jDARswTn838dEGqnoPCWfCaidJSxou+O
         asM7JIvo4L9yNMZj9sSC0NVuVtsuouJxetefso4NihIbviMBXPMIYXZg935WOrAbwIwy
         apMQ==
X-Gm-Message-State: AOAM530O3h8a654/xkjwDo9I6Zg5NFLlZj3NdvYeayTJ3UCxmPXYM0YH
	9PhH1hxkUpFhmaHVsNsjIgQE0wpMQlyT7voRIzhNZw==
X-Google-Smtp-Source: ABdhPJw0ypRhH/O3ifzCEklCio7esxriKYcshqWtnBv2ob5PmG4avBlHiBwBxxZHfJuX1MfLLRrbd7twcQp3YOp7p0M=
X-Received: by 2002:a05:651c:2005:: with SMTP id s5mr1987205ljo.36.1606842980323;
 Tue, 01 Dec 2020 09:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20201201152305.2375723-1-ross.burton@arm.com> <20201201152305.2375723-4-ross.burton@arm.com>
 <04b925bedf42ef5a8828bf262a39c5f85fdc2f85.camel@linuxfoundation.org>
In-Reply-To: <04b925bedf42ef5a8828bf262a39c5f85fdc2f85.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 1 Dec 2020 17:16:08 +0000
Message-ID: <CAAnfSTv=GdCS6Ybup5Y77sHiG1DZ7ev+sgbgeutCrPb7=GL8bQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] reproducible_build: clamp the rootfs tarball mtime to the epoch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Dec 2020 at 15:45, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm not convinced this is correct as it could mess up the timestamps of
> stamps set in other recipes?
>
> It's also tar specific and should really be across all image types?

Yes, it most likely should be done at rootfs time instead.

Ross

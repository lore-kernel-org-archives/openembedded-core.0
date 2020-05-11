Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.11041.1589201118214469910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 05:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DMkbt0QU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id y16so3604486wrs.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4C0OzP6mhMwKb2mPLyPbhoM+umJWKHmwknwEWmjQaRQ=;
        b=DMkbt0QUMG40oit8a7DodWPvUl2tDGX+cZLTAq6JnYabde07tEWo7iWAikXHAwcj4C
         KtN+rAvnIaChrUkHehwPyV0z2jfuHa0Xit8Z+7GkRg7Q7TnuqrGdSsqEcBF/aACt/fwi
         zqAxZCUc1JIWk+RTHFEmSVs+CNuXUKAH8mqmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4C0OzP6mhMwKb2mPLyPbhoM+umJWKHmwknwEWmjQaRQ=;
        b=K1i1s9aPO+Do++F2uaDF+FpYV2LKKzvjqMmOvx1WqWphEi+1D8aHiwoNedEKwhGWiM
         QxHXEp/a/0WPSXsxP4NwFtoat0kPMVOiAKcTmHJsc8gbBm+ftMPg4c2W2WWrplTGrTpa
         u3SDZj8OkWuBPsBmqH567EHBUw3GbILAW6EQAn+UEf5f+HJMB2qkGLcDHX/uKR1VOOrY
         +I0/qcnoy7ziwImw213uZma6Lwo2C70MT75l9bchdFQhQlsOKkC32B+4WrLb3GIvYuqn
         V3has2p68P3hMXk+SKCSS4RIuEkv8GTtRSZtVPqPtYsSkkKlco1oEFB7wpaNclxClJ5k
         75pA==
X-Gm-Message-State: AGi0PubAEHK2l9coU8Da0VEO5uWU8BhysZQucA3wK48BwA1v4AGUJc91
	NEYFuV5FowPPdKN1hKOnOEiQL6QWb+o=
X-Google-Smtp-Source: APiQypINCfFIEHUAuiMVKZMz5Omh1wB2YOwX9iBMhJtF8lLT/6kB0fuwY+ZP6+HMphJsYnPuqlifnw==
X-Received: by 2002:a5d:65ce:: with SMTP id e14mr18650132wrw.314.1589201116346;
        Mon, 11 May 2020 05:45:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s12sm25839298wmc.7.2020.05.11.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 05:45:15 -0700 (PDT)
Message-ID: <9c6bfc2b37121a36c866bffff3f72efe91e847aa.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v8] expat: Added ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org, Joshua Watt
	 <JPEW.hacker@gmail.com>
Cc: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
Date: Mon, 11 May 2020 13:45:14 +0100
In-Reply-To: <20200430165529.23657-1-oleksandr.s.popovych@globallogic.com>
References: <20200430165529.23657-1-oleksandr.s.popovych@globallogic.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-30 at 19:55 +0300, Oleksandr via lists.openembedded.org
wrote:
> For ptest support of expat package:
> 
>  - expat_2.2.9.bb recipe was switched on cmake-based building system
> to
> avoid cahnges in autotools build system  which considered in upstream
> as
> potentially deprecated (
> https://github.com/libexpat/libexpat/issues/330).
> 

Thanks, this is definitely getting there. There was only one test
failure this time, with meta-mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/1884

I've cc'd Joshua in case he has any insights on this.

Cheers,

Richard




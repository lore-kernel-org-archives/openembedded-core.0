Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.36088.1585227374750485281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 05:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=G3wTW4r7;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id u4so6128940qkj.13
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 05:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=GBJyYN0CkHI60d7wQuI6LiinT63bV1Inu67/6dPvr7A=;
        b=G3wTW4r7zFGFJ8xh4yu10MsmRlRuc2vJje7cPVHpiOCjuIfxlQaxEHW07+D2kZxcOY
         Yk/9DLtMp7iodcA7G1viCiV1ANh5xXEfR5RHrHHiwAHmR/txwfjTjMM7XiAZU8lDbmGw
         zqXOF73WqZLwto2DF2ntSPNjsOuGjuf7mCI8WK20PyYLQ1elBJZ28xx5QO1+qNbWQ4xm
         YaBK6nZuWQ8326O81CpLJPPYoNARxgaV8jj3cD6jHAm03WCzJSh61TN+5kJDL39iSHOA
         DHlzh8ZCL+bTkRj7RdsdqeNPAwjLlFKC91CJiEi+8V+l4pSl9kbMqwCm9uSZcmBo4ccu
         DhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=GBJyYN0CkHI60d7wQuI6LiinT63bV1Inu67/6dPvr7A=;
        b=ZaSjcVfhn9w65Xckx/9tgINdsXd2H3TPBHfSqg9XW8tLJ6u0iZqrBuj8a6JKwN9GHY
         eJCunOr3rFZyNeE/1GZsiayS+s5f9Te1buV8oUMWMCoXlPTD6wYe1nZJbMMACIjuigQE
         IzPwjgD0fiAhyHrJYicUqowNzm5n9qyhuWl8ur6tA+IL7CoG729hmKN5fg0ZFZzvtpSK
         0NrkS5f1xeaq0R1XSSN4bfonqghNZuQ8yLdeqzfjt96R/1y8EP6tfRD5AdIn6pfev5k/
         FJtbUTWRbXugiH+R/Qn9DpONv5/BC5ed5SQYwvxEHWEvtQCVuHIEU2duu5Bwq+R5YvWG
         KNsA==
X-Gm-Message-State: ANhLgQ1WLB3pa1p5AIAZKUlorDV14BlDhs2ISlOm4GM5Et+HS0MKbzHS
	a3wBl2p5zEz5Q94FhnsjLpTWT5AfQp3obA==
X-Google-Smtp-Source: ADFU+vsq/KmjoXPW+2tW4o3rXgeU4DbPiW/p5oV8jMog8o4RbUlF67H8/SR5Z34Z0/BNRDcKx5FmYw==
X-Received: by 2002:a05:620a:49d:: with SMTP id 29mr8255975qkr.206.1585227373556;
        Thu, 26 Mar 2020 05:56:13 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id a19sm1481120qtp.5.2020.03.26.05.56.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 05:56:12 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f52.google.com with SMTP id m2so2780569qvu.13
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 05:56:12 -0700 (PDT)
X-Received: by 2002:ad4:5427:: with SMTP id g7mr7914705qvt.23.1585227372343;
 Thu, 26 Mar 2020 05:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200325231637.802324-1-raj.khem@gmail.com> <9c14fe5a594e1edd4cb678340ec27859ba9df864.camel@linuxfoundation.org>
In-Reply-To: <9c14fe5a594e1edd4cb678340ec27859ba9df864.camel@linuxfoundation.org>
Date: Thu, 26 Mar 2020 09:56:01 -0300
X-Gmail-Original-Message-ID: <CAP9ODKomZjQ30ZGSnt3MpHvBQPHSfj=71tBQ+VxzaVOwLLTrZw@mail.gmail.com>
Message-ID: <CAP9ODKomZjQ30ZGSnt3MpHvBQPHSfj=71tBQ+VxzaVOwLLTrZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Pregenerate autoconf files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 9:45 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2020-03-25 at 16:16 -0700, Khem Raj wrote:
...
> I'm also worried about patches which touch both configure and
> configure.ac since the timestamp changes can cause things to autoreconf
> even when we're trying to avoid that. As such this is actually quite a
> risky change given past bad experiences :(
>
> I'm not completely against it but I am worried.

+1

I also prefer to generate them. The patches are easier to upgrade and
allow for easier fixes, as mentioned.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

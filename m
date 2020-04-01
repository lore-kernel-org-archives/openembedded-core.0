Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.1311.1585779405364972068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 15:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PkA7lsW1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id p10so1927985wrt.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 15:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HnoRGS8MjW7XDIXnE33XdxYSUbT7EGQtt7zYoWxS6Es=;
        b=PkA7lsW1CZCkxG21EMkW9/8gpggYG4nTUBlfvmRAq1B47y5Nvv+zdzR5r8nIvx+0ua
         6dt+RoCUMA0XIPW4z92JT5/hve+BoyYgpy4cayS/9oYzghxFUxwvMrE2UwyX13ElJkfg
         Oj6exFTOIVjov7c+VWmcN7Jmke367fLSAGdDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HnoRGS8MjW7XDIXnE33XdxYSUbT7EGQtt7zYoWxS6Es=;
        b=rotzHTHhREdnIv6dSl111CKCikkYnLtsBndQ1mChKxuYCYqruBDZt579PwonCTCdNR
         8oXkQmiIfRSxIm2ChAtxbbolG3tjFL4LnGYuMFhsKvrgjtHjxXuqvDNXqCsNAjKmq0qS
         0GqBkBpxR0j2KPOuMg3+UuulZ49D0XcZ6ZiYmPNag4mSTa6It1sBGTxA1rt/mLN+l9pW
         yzrDCUcHxS3IPmmS87Y+hCgkgWOW7vN155DNJZF/4jhTwLqIF65jbx9QqGG85zPmdi1W
         eXmF5Fujm6M9tLNMkHFbRst0L7tbwiAIfaDq6joEeEM8u793KL8kXDqguc4EEdhnjpW7
         +BSg==
X-Gm-Message-State: AGi0Pubmsv+9uB1bdRZ2RJd4X1C1BVjbZqiNlaW5ijYcWJOnsfjGqYzG
	oLJUkijiAXNhWxXfNoU1GR1oNA==
X-Google-Smtp-Source: APiQypLaQyjD3Lnvm8G5hbNt9GbCTHqzFQsYwsMa9BQ6BmCrgArKcrYxF616Oy2OQLfSGb9kaeSWrw==
X-Received: by 2002:a5d:4611:: with SMTP id t17mr174324wrq.16.1585779403841;
        Wed, 01 Apr 2020 15:16:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id p10sm4678955wre.15.2020.04.01.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 15:16:43 -0700 (PDT)
Message-ID: <9bd493e6c0a4117b04e636bc0f3200e84ab30cbd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] scripts/install-buildtools: improvements
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Tim Orling <ticotimo@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Tim
	Orling <timothy.t.orling@linux.intel.com>
Date: Wed, 01 Apr 2020 23:16:41 +0100
In-Reply-To: <CAJ86T=WwkHPTyi4K7jg0=XOV4OgSGAjN8NcYhQ8JvUY5JY7jxw@mail.gmail.com>
References: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
	 <CAJ86T=XCX7MGRVzoTzaaD3Xe9FqdWM9zX2Zha5Mk8Zo2y1MRVg@mail.gmail.com>
	 <1601CF873C42565A.6346@lists.openembedded.org>
	 <CANx9H-BNf9ubLHJr3V_2ZAHcpucYooRtXkA9bOJ8_Q1_aPQmjw@mail.gmail.com>
	 <CAJ86T=WwkHPTyi4K7jg0=XOV4OgSGAjN8NcYhQ8JvUY5JY7jxw@mail.gmail.com>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2020-04-01 at 15:09 -0700, Andre McCurdy wrote:
> On Wed, Apr 1, 2020 at 3:02 PM Tim Orling <ticotimo@gmail.com> wrote:
> > On Wed, Apr 1, 2020 at 2:32 PM Tim Orling via
> > lists.openembedded.org <ticotimo=gmail.com@lists.openembedded.org>
> > wrote:
> > > On Wed, Apr 1, 2020 at 1:09 PM Andre McCurdy <armccurdy@gmail.com
> > > > wrote:
> > > > It looks like there are some assumptions about the minimum
> > > > version of
> > > > python3 on the host in order to even be able to run
> > > > install-buildtools. Should that be checked explicitly?
> > > 
> > > To be honest, everything was written on CentOS-7, where ‘python3’
> > > is now python36.
> > > 
> > > The remaining supported holdout for 3.4 is Debian-8 (Jessie).
> > > Which also happens to have tar 1.27. At least it has git 2.1.4,
> > > so it’s not a complete mess.
> > > 
> > > Python 3.4 is already EOL. We should not support it for the
> > > complete build system, but I can see that the install-buildtools
> > > script should ideally still run on python34. The whole point is
> > > to make it easier to install the pre-built buildtools.
> > 
> > Python 3.5 is now required in bitbake/lib/bb/__init__.py
> > Which is needed for bb.utils.md5sum_file and sha256_file to check
> > the checksum of the download. I’d rather not have to rewrite those
> > functions.
> 
> Looks like copy and pasting ~30 lines? Maybe not even much of a net
> increase in code size if you can remove the existing code to check
> that bitbake libs are available...
> 
> def _hasher(method, filename):
>     import mmap
> 
>     with open(filename, "rb") as f:
>         try:
>             with mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ) as
> mm:
>                 for chunk in iter(lambda: mm.read(8192), b''):
>                     method.update(chunk)
>         except ValueError:
>             # You can't mmap() an empty file so silence this
> exception
>             pass
>     return method.hexdigest()
> 
> def md5_file(filename):
>     """
>     Return the hex string representation of the MD5 checksum of
> filename.
>     """
>     import hashlib
>     return _hasher(hashlib.md5(), filename)
> 
> def sha256_file(filename):
>     """
>     Return the hex string representation of the 256-bit SHA checksum
> of
>     filename.
>     """
>     import hashlib
>     return _hasher(hashlib.sha256(), filename)

Can you send a patch against master-next please? The buildtools
installer is one place we probably do want to support older pythons and
it shouldn't be too onnerous.

Cheers,

Richard


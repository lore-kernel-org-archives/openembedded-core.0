Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.1010.1587850192977067133
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 14:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BMPTNo1+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id y24so15970605wma.4
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 14:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=J8g7or+p45zu0XcfRtjGMwmvJZ0niLw3LVDlGZe0vF4=;
        b=BMPTNo1+VO6F8zASwv283rV+Nib3Fynl7ifp2vCvnTCyO8S8Dxgi1AjTlw1gn9m3j/
         gLNun1V2nnoWR0ksdbE6vjLslEFGIEm5WpBv8cyRnIMHpV/UTnFYnnqYhbFuPBbzH6Aj
         TlGr8xMmsfUOsHzpoar/lUZ9G0Pif4GRbg6RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=J8g7or+p45zu0XcfRtjGMwmvJZ0niLw3LVDlGZe0vF4=;
        b=rCfOsLAZmud7KMcnE1pMLDJrH3eUYykQ0QEYvYakXolrJzLf2mLq/DBkWZQglaSmKJ
         2O8JaeWc/3DOVfrB2emNBMtxBoiygvOYfY3/6dDmdSknSnk5zb+XGIBzXIC9UT8qnrds
         loT4hOIvjulS+bfPnZgCOOpbyFJhPNmkZ0cTCmBzCqdRD5Hblo2zTTy3rMFyNUzKzSc2
         p0cCA++nL7iML+A+lup+fNiHHXK7hepgCZKXHdU4YFCjAFZI0+x7mJ2pfkAvkyFgumdv
         Ab+kFZ2U4YsGEfT0FjeZCz3HpaCbrbgYYs8fC/RKFJVDrbAYSBASijNuwQbHjbDFhINo
         620w==
X-Gm-Message-State: AGi0PuYim1CJlaxwdTBGgmtV/a/2a/DjiFG8OVhigWqVOMn8yNHku8s8
	dvK64j4AxUwWyLC97qGwnIMalg==
X-Google-Smtp-Source: APiQypJWh2yvfqUha8NjlT2qOD1yfDD1Ksau5RSbh9akkLA1tb24GJr1wZv0lEQz4bTnH+/51sVNeg==
X-Received: by 2002:a7b:cdfa:: with SMTP id p26mr17715868wmj.186.1587850190949;
        Sat, 25 Apr 2020 14:29:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h188sm9506417wme.8.2020.04.25.14.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 14:29:50 -0700 (PDT)
Message-ID: <714c9522fe1f5377f019f67cf43ec75eecf6fec0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Paul
 Barker <pbarker@konsulko.com>
Date: Sat, 25 Apr 2020 22:29:49 +0100
In-Reply-To: <CAPybu_0n37=eUhXtAZiOoxogY6Wyb4N8VLJSQre=RUO7U8ScqQ@mail.gmail.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
	 <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
	 <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
	 <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org>
	 <16086D1E57B63D5A.14079@lists.openembedded.org>
	 <CAPybu_16DsHfqq-Frixoq+ySqCbb2qvGmapZR-UbKGgmT8sJyA@mail.gmail.com>
	 <d15d1601fdec27b7667dd16f62db13fc9ff475cd.camel@linuxfoundation.org>
	 <CAPybu_0n37=eUhXtAZiOoxogY6Wyb4N8VLJSQre=RUO7U8ScqQ@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-25 at 23:25 +0200, Ricardo Ribalda Delgado wrote:
> I have also been working on the issue, and eventhought I have not
> been
> able to replicate locally the bug, the code insspection was pointing
> to the same direction.
> My running hypothesis is that the logger keeps writting to the
> filehandler because nobody has removed it, so the second time we use
> qemu, the log file is missing and all dies
> 
> 
> Eg: Here I cannot see where the handler is removed
> https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/targetcontrol.py?h=master-next#n122
> 
> 
> Eg: Here I can
> 
> https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n353
> 
> 
> Unfortunately, as I said, I cannot replicate it, so it is a bit
> frustrating.

The line I gave in the last email should reproduce it reliably. The key
is to have a runqemu session which you then clean the image for
(devtool does), then a write happens to a directory which no longer
exists from the logging.

> Since you can replicate it, could I send you a couple of patches, not
> to fix it, but to find out if I am on the right direction?

Since my other email I couldn't resist poking at the code. Locally this
patch fixed it so its now also running on the autobuilder:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=3e7d64adba65559e9b8af42e973c8524988b216a

> Can you also publish a git branch somewhere with the current error,
> so we work on the same codebase?
> 
> Or you just prefer to continue on your own?

Happy to have help but I'm simply using master-next and with any luck I
might have found it.

Cheers,

Richard




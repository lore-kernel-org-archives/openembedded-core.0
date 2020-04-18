Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.1147.1587227461555666473
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 09:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FvYe5b1h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id j2so6606612wrs.9
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=p3VsLKesuU8jFgW6dOVqXSQ/VNCu6WngYW+8JW4Ov3s=;
        b=FvYe5b1h+QaglG2CneizlnujAgZsj7ErlYh7eEsqI25F18+lESvbex9UKo03L076Vo
         tXcwwb7aQpuZj6A+zas3hXuCpxxG0ETbw1SDnKEk6DpyLAZ5tAXKb8I21CXiqC+Ng4lf
         ovnkgk+EIHwYITUhdE7dXj0XQ15CQrytwSE84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=p3VsLKesuU8jFgW6dOVqXSQ/VNCu6WngYW+8JW4Ov3s=;
        b=NI4KWrfWAl4P9YzrZDlKFVhvbnn/4LM2R7svpIxm/Cwjdxc8GWUq6fsN5gVXvohSom
         JHuawCTbubGIsBRJfIkFLF1v/JODrK4p0EWD4QeGpfvbs7jQl9GzYLc5oPhOhHTHrkDi
         yZBjoYvqfDZ0oOR7wG/XDlcy6g4B8x50xVIWBw5xhdWkFWMph1T4MDS+pDx4r5shFsHu
         6Cujvt4QKL81ECi2iVNFLJhBlp+qL7NzIXuOKyY7/irookgW7ujjzJMdF+1ZdIMBXkou
         +TD+XAyJ+qHjCGVmGZFDI3pW8Aqir0q6H8wSOqdbUtrB4zxj6TwPI9qzdeDXQGC1hpcv
         85ww==
X-Gm-Message-State: AGi0PuYP37U28JDNbu/D9BgINKlMdRu4tXU1vLUeGvNJHJ9B3k3e0FEV
	LRjEKGNgldfys7jDBnA4LnvhQA==
X-Google-Smtp-Source: APiQypJX/gS3LEGm/T4ow+PRqnD97KMYVBjLPdNBrfNbrkTRAHsveQB78+KmMh3jfktXY/vNTcOUEA==
X-Received: by 2002:adf:9e08:: with SMTP id u8mr9589445wre.155.1587227460041;
        Sat, 18 Apr 2020 09:31:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d7sm5237978wrn.78.2020.04.18.09.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 09:30:59 -0700 (PDT)
Message-ID: <e610ad1ecb7cd084ab61fe4bcf56b01568c5edc7.camel@linuxfoundation.org>
Subject: Re: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 18 Apr 2020 17:30:58 +0100
In-Reply-To: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain>
References: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-18 at 12:04 -0400, Robert P. J. Day wrote:
>   perusing the OE init scripts, and noticed this in
> oe-buildenv-internal, line 42:
> 
> if [ -z "$BDIR" ]; then
>     if [ -z "$1" ]; then
>         BDIR="build"
>     else
>         BDIR="$1"
>     ... snip ...
> 
>   i'm curious ... under what circumstances would BDIR *not* be unset
> (or not be the empty string) at that point? i'm just puzzled as to a
> possible flow of control that gets to that point where BDIR has a
> non-empty value, since i've never seen any mention in the docs about
> such a possibility.
> 
>   doesn't hurt, of course, just not sure what that test is trying to
> accomplish.

You can do:

$ source oe-init-build-env build2

and if your shell supports it, build becomes build2?

Cheers,

Richard


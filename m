Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.1197.1624482767824413863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 14:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OZk42xQz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id f16-20020a05600c1550b02901b00c1be4abso4850832wmg.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 14:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rBBei8JiZk2I+bkQs3EQvjdno+e7tgiqw5Nx/tVvfXY=;
        b=OZk42xQzKKoqv/kHNp5+w8DbPtO2fCjGXEj7iTssJ1Lae2RFI7TQL5hI4/0wRSJxjY
         lQsK97Sx2PA8YvkHm5QnFcNL2/IfYRIrwkhy0k6b0Rr+2BSy7XmvRdRcNEUEdfb4ip9R
         iQ/FJNm7WCvyZepaLrlAn4M0BRaYmHF5LcnN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rBBei8JiZk2I+bkQs3EQvjdno+e7tgiqw5Nx/tVvfXY=;
        b=egpBBjF+yKMbQVpKhGTx7iQ05ZGPkdoSlAv6OtH6y2SDKHswNnbV9VG0jlf3tnu+nL
         IYKUP1QCJb35Av+NP4sQexShGBCUKvqCBQaOLpLxFJ/iJsYF1fp3/WA6v1ymCt84ehNx
         xm4Qz88jrCMbWtS4nkAlx973LBxQCfEZn8arhEMs6SmLOoZT3m4DcO9vPvzXYA+8oPUh
         XLMcuKmjvqg1LgkNiFXP5zFFeqqc8dI9KhJ3/dv5xhLhAbjI3V8UHVycAGLOzS8NC2jk
         b299dqVjxBY1NywuvjOHiSnkF88570dRtJbiAXV7JYrCCQUn6ZXTfW3NkgcxZAYcLn6q
         LwnA==
X-Gm-Message-State: AOAM531Pzck/PjAwPG+1PVwBd9Vs0FcXwxhn7ckbHxJHbBSu8+qPl27I
	/xH7qifHBxtgyaKCgE4VUs2pVw==
X-Google-Smtp-Source: ABdhPJxK9bZFs6+c8vMqvgzqpnM18R1TA3qRKanYfEbkfa7yOyNwWqAvhwjD3aHopCy2x/qDUCmzWA==
X-Received: by 2002:a05:600c:1d1a:: with SMTP id l26mr33821wms.21.1624482766143;
        Wed, 23 Jun 2021 14:12:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:3438:b737:d8c:ddd4? ([2001:8b0:aba:5f3c:3438:b737:d8c:ddd4])
        by smtp.gmail.com with ESMTPSA id o2sm1113374wrp.53.2021.06.23.14.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 14:12:45 -0700 (PDT)
Message-ID: <d34b528f4516de14f2307022856191a6ff1faba7.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] README.skeleton: add readme to meta-skeleton layer
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Scott Weaver <weaverjs@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy MacLeod
	 <randy.macleod@windriver.com>
Date: Wed, 23 Jun 2021 22:12:42 +0100
In-Reply-To: <CAJGjTV_yVtjf6sW7vyapmavA=u_Lzw-sVjtiUOURV+Mhdy3O-g@mail.gmail.com>
References: <1686C6B4AE0761BC.32729@lists.openembedded.org>
	 <CAJGjTV_yVtjf6sW7vyapmavA=u_Lzw-sVjtiUOURV+Mhdy3O-g@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-06-22 at 17:50 -0400, Scott Weaver wrote:
> I didn't see that this patch was picked up (but maybe I'm looking in the wrong place) and I received the email
> from Stephen that the issue should be moved to 3.4 M2.
> Did I send this to the wrong mailing list or is it not the solution you're looking for?
> 
> I elaborated in bugzilla on why I think just adding the readme file to close this issue is enough but you may
> not have seen that comment or agree. :)
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13612
> 
> Scott 
> 
> On Tue, Jun 8, 2021 at 9:46 PM Scott Weaver via lists.openembedded.org <
> weaverjs=gmail.com@lists.openembedded.org> wrote:
> > Added to satisfy the yocto-check-layer tool readme file test.
> > 
> > [YOCTO #13612]
> > 
> > Signed-off-by: Scott Weaver <weaverjs@gmail.com>
> > ---
> >  meta-skeleton/README.skeleton | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >  create mode 100644 meta-skeleton/README.skeleton
> > 
> > diff --git a/meta-skeleton/README.skeleton b/meta-skeleton/README.skeleton
> > new file mode 100644
> > index 0000000000..25468dc87a
> > --- /dev/null
> > +++ b/meta-skeleton/README.skeleton
> > @@ -0,0 +1,7 @@
> > +meta-skeleton
> > +=============
> > +
> > +The meta-skeleton layer contains example recipes and configuration files.
> > +
> > +This layer is not intended to demonstrate a Yocto Project Compatible software layer.
> > +Disable the signature check when testing this layer using the yocto-check-layer tool.

Sorry, it takes time to page in the context for this.

I think we should fix meta-skeleton to work with yocto-check-layer. I think this
may be relatively simple, we can change the busybox bbappend that is causing the
signature failure to be 'distro' specific, e.g. something like:

-SRC_URI += " \
+SRC_URI_append_mydistro = " \

and then an example is still there but it doesn't break the checks (and isn't
enabled by default). We could add a comment about it being enabled by a custom
distro called 'mydistro'.

That change, along with your README addition should allow the layer tests to pass.

Cheers,

Richard



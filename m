Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.36630.1585515460847109727
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 13:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BguI2FY7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f6so12578531wmj.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2020 13:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=hofPH7/A2NfEGO/MSoZ8ziaoPjxQz8e7bB/0iEicY0k=;
        b=BguI2FY7pYdciwctYkd2wHTuyZ7p7jBWzMsUr/dPKZtnGpH+oZoi84fpCeA/C+cGes
         6qx1xaIhWchoxYF+oLje7kA75LViWblSxBDuxpts7o00TCdQLdjCk4pf5kbJJSGXKAJw
         l97moBa8TIldyWY9UrdT76ZFYjGagcPU0b9Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hofPH7/A2NfEGO/MSoZ8ziaoPjxQz8e7bB/0iEicY0k=;
        b=KVANcfM5vSQOvVXST/XjGgruiWrWHju8mi6lrlsoCMy5EQi6BqxgtUS/X0p3GwNMpo
         KertHcsVxiC2H291QCKvO2ThUx7StOjWEKNemvTLq4Hy3JdasxMRBNgW0UQIAWwSydVs
         Dt04shwQmhfyX9GItb5plNe5+MJFqOltTULfNuJsKJ2oswtA6zWFM9eHrDXXShQgwur6
         muR9POqu4OF2al2QAowly7oDLQXpgkYnmnfdmD0P+E0oo23IV9zyAW9m4YrgXaR3ant+
         /z56THYpUEqxWPlaBgjSA45brGLzmSKIDkLVopLf2TyPa0Y1LQIjsZIIeaQTkVIb0k3Q
         A4ww==
X-Gm-Message-State: ANhLgQ1o+WKsu/iVJuHT9eBOn4UcXHGL0YlaRtwLOs60j2bvRVPNlQfp
	PuQ9m0XN8iSM2NuEQRRqTgfVbA==
X-Google-Smtp-Source: ADFU+vsTUsfmAy3xMq+vdpdBBuI5/ch8VFrWEPweQCcfQddH93LIWBg3NifUM2Ukw8FMkvo4D3iSZw==
X-Received: by 2002:a05:600c:2306:: with SMTP id 6mr9807308wmo.86.1585515459391;
        Sun, 29 Mar 2020 13:57:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id f12sm17918518wmh.4.2020.03.29.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 13:57:38 -0700 (PDT)
Message-ID: <05433105f301e1f6889af8d59a6a5c5d365a712e.camel@linuxfoundation.org>
Subject: Re: [PATCH] lttng-modules: update to 2.10.14
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>, Daniel Dragomir
	 <Daniel.Dragomir@windriver.com>
Date: Sun, 29 Mar 2020 21:57:37 +0100
In-Reply-To: <487a31ba-dfab-d09b-5414-f3acdb1e75a4@denx.de>
References: <20200329172752.285451-1-marex@denx.de>
	 <e1863defc13c09b072ffbca84ff5c23274d0057a.camel@linuxfoundation.org>
	 <487a31ba-dfab-d09b-5414-f3acdb1e75a4@denx.de>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-03-29 at 22:41 +0200, Marek Vasut wrote:
> On 3/29/20 10:37 PM, Richard Purdie wrote:
> > 
> > This patch doesn't apply to master as lttng-modules is 2.11.2
> > there?
> 
> It's for zeus, sorry for the confusion.
> 
> (how do I indicate that in the patch right away?)

[zeus] in the subject.

Cheers,

Richard


Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.983.1588011398749190539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 11:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C3mfYqmm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id g12so698188wmh.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eXbFr/mL1nki2z3+dMtV5g9IRUL5vvjYxGN4VGrFxRQ=;
        b=C3mfYqmmf10Bsb1EtjDoRnX8vHjeipk8qQpXjpXDbXG070dQnmWsD33RygG59vtWdF
         whSiKEF1kuR83OcKrmDa0qUGqGiNDVZc+pubWonIbLSSjcE6PUVgGT3p8ZsxyejAYX8R
         VKNZ8bQlka1WdjFe7IW4QxaAaP3RcMH10vq94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eXbFr/mL1nki2z3+dMtV5g9IRUL5vvjYxGN4VGrFxRQ=;
        b=R4eUd27bcfnzdcT2qt2ZBqCtbyoXkmWJCGLDUT4aOkYL27quKNaxJFaW7kE2bQPgGL
         6lyfKsSnjijv/vFirDdEnTfXArrbOaoXDRlI5l+y1XFH/QOrZ2kT08KFC+DmOLQLWKEi
         hvhMRRgsO3Rkh71rMiI23/7UZ8KdubBAXAIxj18CaKtEeoZXz2xsKM1qBwC33E3guK56
         07zdFErxhlls2KTRLB2KzUK6/9Hy6PaFfMwVuA1FUZrpOQdYl5cXfcqwvEr/UAieyM56
         n+pko7b+MId94+XjOSu5Ev5AeroEKPJBxpoS9TrsOOYrNtJzTY5Ejx3Ib70fXdLpst+g
         8A2A==
X-Gm-Message-State: AGi0PuZupD1224wpqoZuz8JHzXGuaG234hmzXJeInt2b2TIidn+eg/wE
	SUjVYEfkLwVUpUW+F4FLCzYFzA==
X-Google-Smtp-Source: APiQypLE6nikKFQ4n23oHkB++yFr7hKwK5jJ93Ycw5KwaoWFuYI6p4HaN+fizxExfvdUbTaNK/iecA==
X-Received: by 2002:a05:600c:2306:: with SMTP id 6mr830712wmo.17.1588011397225;
        Mon, 27 Apr 2020 11:16:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id p6sm21924629wrt.3.2020.04.27.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 11:16:36 -0700 (PDT)
Message-ID: <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Rahul Kumar
 <rahulk@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2020 19:16:34 +0100
In-Reply-To: <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
	 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
	 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
	 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanavin wrote:
> You need to look at configurations defined here:
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
> and replicate them locally. Then you can reproduce the failures that
> the AB gets in those configurations.

That start of the failing logs on the autobuilder also list out the
configuration options for that build.

Cheers,

Richard


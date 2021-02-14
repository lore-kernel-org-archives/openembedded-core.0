Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.15523.1613300854804701892
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 03:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X+Od6vM0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id b3so5163278wrj.5
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 03:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AwtJKeR6b7QfhSwfmGrSeDeQpwEFty9tXxzQSyGPUnQ=;
        b=X+Od6vM0Uh3MDJ1NOLapz+TNBTT3ezVCROpnsbatowXUaHkIfEha94eM7DkJNs7W11
         fBLY4sbKQk7Xd8B9Wl3Uy11tkeL0J8FBOt3eMMV4SPxImE3cQks8JBAFOUWZR4jVqVo1
         hMT7ZGp48taidwEZUXXo6ikooett6+VV7TTos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AwtJKeR6b7QfhSwfmGrSeDeQpwEFty9tXxzQSyGPUnQ=;
        b=X6T0F0VUx4ezBUvYjRaLEDIZwYAo5mdblw0M0FP3ePbQLRf3ZEkj5Sx0jvlZByyKqv
         g22RkcwxvC6BEqrEOUjB3zsbFkb/WyuG/rg3OLBKa/T8lpOqTsly7TQ0XW4aG338WdQv
         qMCkOCEBwaJsXQOXtweXIqHTX1LVzp//L3jAwPQ2QgSoGkhQWKAi2ol20qZ8+4Cc2m3J
         t0MegjQR5MLznbXWZm3z0+lnqZFVx7+0Cc9bT09kj1m1uWfFye9jtsGLWzcN1HYDOLaa
         pk84XtgIPqAhL8sP0BVJBhqGJZMO+PB7L9D0hQFOMCqM2m41g8YBUWDThe8on6ZwLkal
         lY8w==
X-Gm-Message-State: AOAM533azd06eL/ILYeJY5LQk+ECxeEuKJKJ7UOJzqIDmQeQzMmiRFx9
	m64pK7TcsszchZ49aWSIa6ZVWg==
X-Google-Smtp-Source: ABdhPJyUMsSZuzBX+7Cdke1FFK4TqXFc7gB7RlowV6fmoFI+I/bX+5ZgQA54E2K16gnJ1GgDqBPq2w==
X-Received: by 2002:adf:c6c1:: with SMTP id c1mr13512139wrh.326.1613300853350;
        Sun, 14 Feb 2021 03:07:33 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6c46:cb67:3902:3f00? ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id w3sm17062382wrn.27.2021.02.14.03.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 03:07:32 -0800 (PST)
Message-ID: <02b9f0d2f96913ae8751522e5d03cd0bf1b83f2d.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] manifest.py: Add tests to empty image
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Milan Shah <milan.opensource@gmail.com>
Cc: openembedded-core@lists.openembedded.org, akuster@mvista.com, 
	randy.macleod@windriver.com
Date: Sun, 14 Feb 2021 11:07:30 +0000
In-Reply-To: <CAKdz3nETSJeuFnNFFQ9ewH4TAmP2rGj_UTewWeuuska8soqs3A@mail.gmail.com>
References: <20210122055805.14834-1-milan.opensource@gmail.com>
	 <267ec66436e2a7cb1c049dbc98b69c3d90001d55.camel@linuxfoundation.org>
	 <CAKdz3nETSJeuFnNFFQ9ewH4TAmP2rGj_UTewWeuuska8soqs3A@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-02-14 at 11:49 +0530, Milan Shah wrote:
> Yes, Richard
> Looks like now there are two patches for the same bug. As the bugz
> was not updated, I also worked on the same bug.
> 
> As It is already merged, you can neglect my one. Please update the
> Bugzilla bug and mark it as resolve whoever has worked on it.

Sorry about that, we try and keep things in sync but its hard to catch
every change. I'll make sure this one is resolved.

Cheers,

Richard


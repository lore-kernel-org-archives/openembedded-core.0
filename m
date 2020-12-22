Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web12.8470.1608620666344358923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 23:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ApTylFya;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id t8so11114993iov.8
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 23:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s4aTKWQqZl0wkMfTtwx/pRaUfRxXDaDGZmZyKFbAHTs=;
        b=ApTylFyalewy/Pd/KxxfMgv8uc1AQuUxxQNyEZ/O8vXbZne4DAWXC9cMk6I8ov5j1S
         yWlZF8yfSAd3sFYdWhNfstsrFUB8pUY/GgKC9U91+4WVNy55dKNYLW8poguvKNi4ZbEs
         /YsRnPuiV5bipvuRp0Qz2ma28BTiieZFjhREUku1Vi0WsP+Oi1weMG/k6XzV+mmW4qgs
         ikrT1FoMTs7o+nRTHadYrqwvNmAdizSln6VjtcK69MWNC/mWv5LUTX5LLCNiLLa0twov
         ElMCOHgnZym0C4DZX0U1YnaPUraEOJCBxFqXiUXkrr3w974eBkUorTkDrtJOBOKU2HZr
         jZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s4aTKWQqZl0wkMfTtwx/pRaUfRxXDaDGZmZyKFbAHTs=;
        b=eqfQaVSvuot+5h9+mtehZuIseh81jRT5AQHLlkTht0hNrPYIcFYEO9uAF7NR/9t+4R
         lsLCDGorRKmL0QsbWX6Txb/rAdWE5ZiWVjnXLAvfZpyANwCwLrNxkhPy0tIu/Ayh0Bpp
         p9fW7AXnPd2ZB/dm3qTbe/nxgGLuW0I+pkGLeVAXBx9rWUGtulcNCKLEyPrm7dgKus5H
         I+F2K2FTTPhR99kGGVOkUe0bGgT3bGOJDiTwn9LwTaR9EDZZeCk2K9jRifDUpX/s/U5o
         gBHJZM8Ji7xsC9D1HJUNR083uC1H57DxX4TCUo5Sv3rVYJaKirCO4Rc8kn3VIJlTh/Aw
         qgsQ==
X-Gm-Message-State: AOAM531Ls6CUx/W+7Dt/871uIdKvWP545TarnkhSrTs2kW2cL30LTI1A
	6LWHhSQfR4HGMJyfniRFR/1Ygn6ennykcA==
X-Google-Smtp-Source: ABdhPJxClk30XFJaYHwq0ocnW4r0va8LC2Ug4AFLc+haqJ46J1Eo5S/OteQZDiOMTvLbuR/ZYZRk4A==
X-Received: by 2002:a6b:d21a:: with SMTP id q26mr17025525iob.128.1608620665611;
        Mon, 21 Dec 2020 23:04:25 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id h70sm23069041iof.31.2020.12.21.23.04.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 23:04:25 -0800 (PST)
Date: Tue, 22 Dec 2020 02:04:22 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] sysvinit/rc: show text progress
Message-ID: <20201222070422.GA40685@localhost>
References: <1652F7C39C28176B.11411@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1652F7C39C28176B.11411@lists.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Oops, there is no 2/2, this is a singular patch.
Should I resend?

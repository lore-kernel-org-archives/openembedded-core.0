Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.16187.1585326908530000071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 09:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MBzft5Z3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id z18so12083700wmk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 09:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mINKE/dPloZiD/4tJc4FG9HweNm5OvpHvVdZqGjbCPs=;
        b=MBzft5Z3xF89DqTcnhBRaDu1O9RUmklxmZkrOIfE1FrxkaBoGfM422Z0W+OsDtx5LT
         9bOgloHZq5QK+HbuUZlQM1ipIDXN6b3TvCrsj1qCW5BPG1csQqAzCaa6rXBGtNd6shlB
         SMBRggL37hk7u4WK1Dq52sz5C0QZBB/5yuA80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mINKE/dPloZiD/4tJc4FG9HweNm5OvpHvVdZqGjbCPs=;
        b=OLe/NJF8RuKLS86AYVpXQ82WSeSz1J8xibUenx7Mfj62iXSawyC3aiBut/kR4XPuy9
         HxQyxKv5Y3KZA3SndN3h1Sezaw6fQCO+1JWXW7oKTx/Finw5GmtYTQibzro19RA8Cdb9
         qnBZ9Ws7Gs/KiwdG0dM8YWCdX5Sx7gzN+EBol8+WWKqvMR+rXYLNs8MGHzgzdppEOaBo
         0QQkP4+CbD5V+Z8oaY7oGOoM2JKAIq93RU83nXeUkXG9ufhOANbj8vMObF5GPCjVXdRP
         mUT84H49ObFBnsuLbmKzdGpAlZbN3zQGL+bw/67I4cSWqigOkWETobqu9t4zZ8a0TMvX
         JyNw==
X-Gm-Message-State: ANhLgQ0zChMTiIShdOXoezYMg75oAOEQckkOiLpZpYttIvEUErphRNgz
	ORrGchiZxWjRBV9rMxTQqT3tiA==
X-Google-Smtp-Source: ADFU+vvD//V99KTW0GtwcOkQ+nlxLBspmUWQnRBWVEvv2X+LFzGh1pOYjtdXvsvHGA88g4+T+weGrQ==
X-Received: by 2002:a1c:4987:: with SMTP id w129mr6568010wma.168.1585326907058;
        Fri, 27 Mar 2020 09:35:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k9sm9548904wrd.74.2020.03.27.09.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 09:35:05 -0700 (PDT)
Message-ID: <6a748f7bf39bba8b9bb2680360c15f57d9009dce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] classes: Add a new bbclass that abstracts the generation of FIT blobs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nandor Han <nandor.han@vaisala.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 27 Mar 2020 16:35:03 +0000
In-Reply-To: <20200327082918.1213345-1-nandor.han@vaisala.com>
References: <20200326214308.1042374-1-nandor.han@vaisala.com>
	 <20200327082918.1213345-1-nandor.han@vaisala.com>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-27 at 10:29 +0200, Nandor Han wrote:
> FIT format is very versatile allowing various combination of booting
> sequences. In the same time different U-Boot boot stages can use FIT
> blobs to pack various binaries (e.g. SPL supports reading U-Boot from a
> FIT blob). Because of the allowed level of customization, the generation
> of a FIT blob using a fixed image tree source, becomes challenging and
> increase the level of complexity where different configurations and
> combinations are needed.
> 
> This bbclass will know how to generate a FIT blob, leaving the mechanics
> of the process (dependencies, task order...) to be handled by the users
> of the bbclass. In the same time will allow to separate the knowledge of
> the FIT format leaving the user code cleaner and more readable.
> 
> Signed-off-by: Nandor Han <nandor.han@vaisala.com>

Have you considered adding automated tests for this?

Does adding this class remove or obsolete any of the existing
code/support?

Cheers,

Richard


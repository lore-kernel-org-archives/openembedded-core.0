Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.351.1621270325186680678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 09:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YbjC0H7J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id v12so7150286wrq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=mdFxqqmyuN6o/RkOWfk5HRpxSjBgk4BuZCydofFFNuU=;
        b=YbjC0H7Jp02q2Sqcr1zNd2SB50lDfnOKE5byzrYfOwaMrE+ni+KHbQwlD445nKjefZ
         z1s2hLTkHb3pwYjkV61RldiUA6xtTj1OwYjrk6NdqLp6bh/EhogMuk4f8j3RB7qHzGCr
         PEhLJ7P/ZEcZi9uymL+mnipj1zD7gLZChYmKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mdFxqqmyuN6o/RkOWfk5HRpxSjBgk4BuZCydofFFNuU=;
        b=TDmUfHB+LG8cYjxFmxXnsmXB1H9fmAhMFcrbuJD/r6ugrZM8MSea39B8O93OCszoNN
         2sP7AfLhRd2/CM9IlJf1a/jnLkng+r8ECLDNxu91ba7giFmFmraFfqavlE1MYzygoxhn
         jlRQU1L0LXHvK6O99KDuEphEAq8lXXSRjWk3Rv/LyVVIiziBivkXDN+kfFxrwu8c+ROZ
         xfdc0HqTKtchto/y2WZThYiGLM015tmCZx1xCCe0ARGyKlCDl6sP2GwzeJW4A0gsm2uJ
         FGsxmzoJ8AhS2p8N3GdzYq6qlP5Ig5zdShWLpqIGpSfLU5PpbTl4KdeUwkhVZ8UVqMSR
         D51A==
X-Gm-Message-State: AOAM532jT0JdB8vx3QNggfG2gQm4dwzJk7E2CdgXOAT9cYpIgK+NzK7O
	jStZBdd8g90zrw2wL0CfVk01vA==
X-Google-Smtp-Source: ABdhPJw6hH0zyU/1MUtme6B5Sn2uEJp4om8dIsb3bf4TnzC0/mM3wFB83CP3GzeQt41giZUymrzsiw==
X-Received: by 2002:a05:6000:551:: with SMTP id b17mr760090wrf.32.1621270323729;
        Mon, 17 May 2021 09:52:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc? ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id v18sm21718791wro.18.2021.05.17.09.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 09:52:03 -0700 (PDT)
Message-ID: <a848f6f7abe983b43769bcbe72200d3ab4724919.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/27] libxcrypt-compat: upgrade 4.4.19 -> 4.4.20
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 17 May 2021 17:52:02 +0100
In-Reply-To: <CANNYZj-EA8WJoysLgVwaXbg2GTAygXxQDjkA_k2vL5433NSt-Q@mail.gmail.com>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj-EA8WJoysLgVwaXbg2GTAygXxQDjkA_k2vL5433NSt-Q@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-05-17 at 10:07 +0200, Alexander Kanavin wrote:
> The main libxcrypt recipe was overlooked?

Yes, I've fixed the patch, thanks.

Cheers,

Richard


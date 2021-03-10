Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.8843.1615384715495021793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 05:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RkhgXoLt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id u187so7157701wmg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 05:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=z7I9f19Gs+SG9zwB/Ki9znvD1zQw1Izxo3NWmsKbdqA=;
        b=RkhgXoLt3WrKZ26NxqQqg4eFlZqueOLOEip3POUbbZXghRjvBtMf3TEbMcspxROGdA
         qP1rT9AJIy+/8BL1VZJ3dA7SVZbl5v1aZ9ejPQZ4KTVgGXYY17v1PTEOVBY/H8fgxwac
         dWfEtcw0M4NBN2fvkaldihsolWTc9bXuU9T9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=z7I9f19Gs+SG9zwB/Ki9znvD1zQw1Izxo3NWmsKbdqA=;
        b=V/kJlWZ2II8dWOXTdD19mRznSzJq44afJpVs1hQXGqVhYk652dR+pWvewRjGBfFt4C
         cPQb2prWJp+Np31hYLKqNsMepC8d9xb1jbkrlAn4WePUTrY7IuYnQmbl2ulJ8rx3jurM
         D93ryH4+MEiZOF9c+MT1x3sWvlXRmIb+x8sHETzVVOnuOg/b5iFBm6qKVHsVTRCK0zXC
         /jzKrpLvfZ1ruPEoCUBe8W+BIBcjr3ki0gt8Ym0ymrCZiIpTKFK7TngifSFS3quWIwvY
         tNhXF5dmlBSAbfInAHBxzqj6WqubxiWHE4Lsf50QvfC0mgVRdbW9KqN9IR9JAVva3UBS
         0dpA==
X-Gm-Message-State: AOAM533O+9o/83WGfBaAY/4OZCX5xTq+kR0So0Vmy1s7NKUPykK1u/rF
	IB8jAE2s/kC48eONdTZOlevaMQ==
X-Google-Smtp-Source: ABdhPJzH2NafrcxqHrQEscjPl4xJ9DwsbCbXHalMPhhaKDFLt4lCRFYMizEJ8M1CZ+DDe/1jKHuzuA==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr3486679wme.107.1615384713916;
        Wed, 10 Mar 2021 05:58:33 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:723d:6f27:5f9:3d7b? ([2001:8b0:aba:5f3c:723d:6f27:5f9:3d7b])
        by smtp.gmail.com with ESMTPSA id s18sm25910702wrr.27.2021.03.10.05.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:58:33 -0800 (PST)
Message-ID: <8d673369cf2afb9a9c4eb0c7178525b1d11e5913.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/6] perf: fix reproducibility issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, =?ISO-8859-1?Q?K=F6ry?=
	Maincent <kory.maincent@bootlin.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Mar 2021 13:58:31 +0000
In-Reply-To: <CADkTA4PFwiJM+TBiC3457jNa-GOtiGYa3-g9iy7DKCAcsfyK8g@mail.gmail.com>
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
	 <0e2ab3111ac8446d0657e8f4d8d400f50f4e245b.1615317549.git.bruce.ashfield@gmail.com>
	 <20210310114234.1b838cd8@kmaincent-XPS-13-7390>
	 <CADkTA4PFwiJM+TBiC3457jNa-GOtiGYa3-g9iy7DKCAcsfyK8g@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-03-10 at 08:37 -0500, Bruce Ashfield wrote:
> I'm unfortunately out of time on this, so obviously this can be
> dropped and I'll work on it again for next release.

I'll merge it since this is an incremental improvement, I just won't drop
perf from the exclusion list yet. Its a great step forward, I think
there is some remaining linking order issue lurking somewhere.

Cheers,

Richard



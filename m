Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.9649.1588690811381783292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 08:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CIb1f4CF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id h4so2658604wmb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HqwzJk9JP9mp5V3aWW3Mf/Sl34C2yhkXCtt4ZjkEkpI=;
        b=CIb1f4CFefwBSWYJPt5DmCtBhDYD6aiBHov+X6zvVvOPPJM+GYSMMnbWHxJ6hF6A6P
         DU+JSuC8qroI4RzLa7eBh1VASHQyJD2noSaToAlEgBJuUAb8I10QbDP6tYX7MRoyxGFK
         w/lRbWxnuoCym1A3UAJ6v27P5It4v6lupe3dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HqwzJk9JP9mp5V3aWW3Mf/Sl34C2yhkXCtt4ZjkEkpI=;
        b=ABSjUM3/rkMrmX4WhnSOuhXLVTemXG0+Y3w9Je+JCrgKyeiWny6USxLeLUry5AqFrI
         eoUyrPfNyUY70NdIVRoYjzK8FNhLRZoRwDnNMrBlTizvjv2KMdWV/Rx/wpfIANt97Jum
         P3iNdAyz5I4FN7uY0iVeC6X720ZrjU5EouR8eYcEbfRUrCG0bogeEnv9J9Ny+/7AooPv
         jkF3qqAlXRVQ4F8ebH5rA5rTap/PeE8mNBsgS/IMCYwpzcx8MFBeYiEMogMXevAWsJr8
         lGYQAhCGqAEqXX/QSJIbrDuwxuJizyxukKBCV+wYHskmz2mwQm5vSfuGwGW30KHxfk/n
         xnjg==
X-Gm-Message-State: AGi0PubnWALUqQmy5mP2yXsIBLqoBDBevwqzY+il4NF0d5VKACtcHply
	Ubo+/J9+u2it6IxUZTQkLhD3THB6dLQ=
X-Google-Smtp-Source: APiQypKYQf8W3wJ8p89pVdkIpw9WFjNUHYvPZ7Cd5HEcBfUKHgqmtcRrOsBPj8nxzPmVy/8NyuPACQ==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr4074814wmd.117.1588690809607;
        Tue, 05 May 2020 08:00:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id n12sm3801754wrj.95.2020.05.05.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 08:00:08 -0700 (PDT)
Message-ID: <c87e24dbc0db75e91726ecb3a09c77de63dc4509.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3] icu: upgrade 66.1 -> 67.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Date: Tue, 05 May 2020 16:00:07 +0100
In-Reply-To: <20200501113952.15847-1-andrej.valek@siemens.com>
References: <20200501082616.11296-1-andrej.valek@siemens.com>
	 <20200501113952.15847-1-andrej.valek@siemens.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-05-01 at 13:39 +0200, Andrej Valek wrote:
> - 0001-icu-Added-armeb-support.patch - rebased
> - 0001-Fix-big-endian-build.patch - removed, already included in new
> version
> - icu-pkgdata-large-cmd.patch - removed, implemented correct size
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>

This is failing to build on arm native machines:

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/1187
(and other arm native builds)

Cheers,

Richard


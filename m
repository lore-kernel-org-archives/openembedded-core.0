Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.10166.1611056228498665710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 03:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UTNtW2Ud;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id e15so10001766wme.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 03:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=9SWeASUMwv1/YdYEZrMT04YldPFUXZHGhPYzNRrp4Ao=;
        b=UTNtW2UdXnT6yJh9efJRvtl+erl+rXH/TxyGDZGadhIqHtcZFOmwS9Hk1O5ZhFcnf7
         Bzd6DPq31V9nqJl20zggL+4NVcmyZWoUIzukjva6Of59fJnYsD2f/3B4pBgJMZcRBt++
         rgOTAKPbN2BUcY0aeR2u7/21BppYCj4T27CEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=9SWeASUMwv1/YdYEZrMT04YldPFUXZHGhPYzNRrp4Ao=;
        b=ee39vYF62uDfDZGKns7FWhmK/5di8JgcW45OKYqJJk0eduJtVJddp0mP7Tkx4eYC9p
         I1fkNju2eeKwNRV+k0YrwYinIpCkkKSFM3g1vVhtFQUPQ6moNeo8eZVeBNkp32YyNPEF
         c2quy21c5v4hFjDVifse9vBcJOVZvVsn9h5b+joDZ8Xwr3xbzd0v+M9KOlOQUG9PGiaE
         Qca1zN2Xf6BnPw7fehxqZ3FqIC6FqjSTLONSwaVYaRhBkDyZRzZx9W4KGPTzJdnTZFio
         sRs4UJAU/zqp6cUIoTXAUSdnJb1b+3D1Q9dhKj/zTdVl0RzDRT3f8fhnu7qKirlAejYZ
         JKTQ==
X-Gm-Message-State: AOAM530/FGmXFt0XKdofrdH/mxK5EiWVIT5f/9jaeoyEiEgnNdTdpM1s
	3fRUHz2iZTvIQbezn4YjbieH7yQf+y4D1w==
X-Google-Smtp-Source: ABdhPJy8Ev+NroqHH8shHVeEZ6SoytJ6JUPuz62xh3iHk9a4SKdd5f9dGCjXB540+wJ997/gBAzo5g==
X-Received: by 2002:a1c:a406:: with SMTP id n6mr3703522wme.53.1611056226840;
        Tue, 19 Jan 2021 03:37:06 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id d30sm2702701wrc.92.2021.01.19.03.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 03:37:06 -0800 (PST)
Message-ID: <72c1c6b8c90c6415c08d7b53f6f5a648c9508744.camel@linuxfoundation.org>
Subject: Build and Integration help from Bootlin
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, swat
	 <swat@lists.yoctoproject.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 11:37:04 +0000
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi All,

I'm pleased to be able to announce that Alexandre Belloni and some of
his colleagues from Bootlin are going to be helping us with the process
for testing and integrating patches within the project.

There are multiple reasons for this, not least that it helps not to
have a single point of failure and that I could do with the help and a
break! :)

As such, they are are going to be leading the SWAT process and you'll
therefore be seeing them giving initial responses on patches and
helping with the autobuilder failures.

I'd like to welcome them on board and hope everyone will support them
as we figure out how the finer details of this will work.

This is being made possible by support from the Yocto Project members
which is very much appreciated, thanks!

I will be continuing to do the final patch review and merge and am not
going anywhere, this is some very much welcomed support to try and
ensure we continue to scale and maintain our quality and testing.

Cheers,

Richard



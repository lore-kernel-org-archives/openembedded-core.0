Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.162.1618520736250056120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 14:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LY7+vyAJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id o21-20020a1c4d150000b029012e52898006so3459832wmh.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 14:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=JNd2dnYRG1JKAlRIzH7c1iaL9hc/26pdH90rhLTShN8=;
        b=LY7+vyAJKPhv+COXJhmxy3JdqEOsch6ESy3auqRhr0R9YyVYy4j4bmD0M0xWJoOZOL
         Lis2Op3b9eWYf/yTlBaD8AVu+kLjH5ar79/QOsodvORzHzBE1HfrZMC1a4FEyEKvruc8
         bP77TLyBcdPKHgynSgW+CPue4CwyuQ5rmkkL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=JNd2dnYRG1JKAlRIzH7c1iaL9hc/26pdH90rhLTShN8=;
        b=deYHJD8clOJQB/1Amn0Iyue6rU201jN+Ozeoki3orxH+kbUS/WVNnWdU58NatYmyLL
         qKVlg/mRGl4aIA4wN7h6AgVGIEyiUG8iF0l78Mi2lQEwYcbS3Z+nLmNk744kmZAcFdBz
         m3DVpFY+FPDl+qHL0psBU+jr+qE6A+UJpURVNMMcyQ1oVPRb6C5yETwii+18xn3S8wl0
         Oyan+dYMvGZZD6+XpX6kJO8sxgRIy37zvlrwHoNAYzo3005W8fKgO5ka+6An9xHT9Je8
         zA3Q2L4YzruMxPG/ND13YO5OGUpAjVo4PWMKT+XcK3lPLkM4BGW4NiYzO50kidMWMUBc
         zvQA==
X-Gm-Message-State: AOAM533nIiQrmSWVyXm+SqM4N/RKK6S6h3fUdKHmkBgIhX0FWFY+iG0M
	Wh4X56iHUKdL4JSEv1zWSs/HBGj0gldOIA==
X-Google-Smtp-Source: ABdhPJykE8LwCdfhlJrjZKRkoq2MeDdCulcX7Q2nAnEdtdTYeVnqcvWAASpcTjCnmX9uUTourUlTLA==
X-Received: by 2002:a05:600c:d4:: with SMTP id u20mr4931227wmm.164.1618520674589;
        Thu, 15 Apr 2021 14:04:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b9e0:fe1a:1091:177b? ([2001:8b0:aba:5f3c:b9e0:fe1a:1091:177b])
        by smtp.gmail.com with ESMTPSA id g84sm5025880wmf.30.2021.04.15.14.04.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 14:04:34 -0700 (PDT)
Message-ID: <db22d3a0cfa0a00f187ad6364fe872d697e11291.camel@linuxfoundation.org>
Subject: Maintainer for hardknott needed
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Apr 2021 22:04:31 +0100
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi All,

With the release of hardknott, we're in need of a maintainer for the hardknott 
stable branch which would be maintained for around the next 7-8 months until
our April release next year.

If interested please reach out to me, or I'm sure our past/present stable 
maintainers would also be happy to answer questions on what is involved.

Cheers,

Richard





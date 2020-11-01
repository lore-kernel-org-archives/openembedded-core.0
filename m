Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.14719.1604238000903216414
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 05:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IiFEEwKN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id p22so6897851wmg.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=tPogw96wrqHKq0e5dhE0xR8NcHC5lUn0l7LEKScSlF0=;
        b=IiFEEwKNYaOB5qAOSi9OeiLYeBHGbxTW5svpHQul4cVgVlm4faqr7sQoeb83OjB5DN
         zRSs109LcvDtVT0WK/NyHslCbrIlSp/pYwURZSYlWkPhS/97XEjbE0kvEF63eIy5MP2R
         uYxwTrdskvmnSq3NDZHrkMrHQnUZbRGNiJ2I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=tPogw96wrqHKq0e5dhE0xR8NcHC5lUn0l7LEKScSlF0=;
        b=AGh3FckhcBakPrIozK41ObNNoYCdoMW8X8TmjgNwh7ru5zqLrqtKslYeY4hOklFrKa
         4Il+nFlNZib/+AUMBtqnecySVfnmasLx77eeNlxEnITMni1xW+Yih+/f0MIiv7shDerP
         dVo2wgdjT/ExAf3euzIRRAIS/QmeswVymX0XwRTsyMLmEyb9nTOFwbyfLO6V409Cy418
         J/WQXswKH0RNRH3efgGLs1iovsFusAGvbpGOk7LtXhlHlOtq3d9wopSwvS8SZSAUGMvq
         O4AeaalpyD3PS8mtZ6pNRMdGSvGokW+GsrBaKDjbAr50wfX97TXI2J5zjdZxd4shnt8F
         7X7Q==
X-Gm-Message-State: AOAM531/qWhG5DQyYY69hkBstaLGgA4j4Iz7js1P+3PAZ9FDa5ZXQeAH
	3bxA/ONAn6+9TfSh0gWM4qw3NEVfMbqROw==
X-Google-Smtp-Source: ABdhPJxaogT076WMHsDfvZo9oghXV03R/UsIolPEmfKQx3LwWaKdBkS9QRTnV8fmM9M74juxjvjTSA==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr1687174wmi.2.1604237999201;
        Sun, 01 Nov 2020 05:39:59 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id w4sm5179616wrk.28.2020.11.01.05.39.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 05:39:58 -0800 (PST)
Message-ID: <f9234c1de8b2c54dae4cf406d39435858c4364e5.camel@linuxfoundation.org>
Subject: Gatesgarth Maintainer
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 01 Nov 2020 13:39:56 +0000
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

With the gatesgarth release imminent, we need to think about how we
plan to maintain it. Its scheduled to run for around 7-8 months until
the next release comes out.

I did talk with Steve and we concluded he doesn't have the bandwidth to
handle gatesgarth as well as dunfell. I personally know how hard it is
for one maintainer to try and track patch status in multiple branches
for something with as many moving pieces are core.

Do we have anyone interested in helping with Gatesgarth stable branch
maintenance?

Cheers,

Richard


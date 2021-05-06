Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.7932.1620300146488874839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 04:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SriRcmEP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id a4so5204305wrr.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=QaFX3xYRLBjv6PfoSjeFP1JDDZM/FOsXrWwvaRxZxhQ=;
        b=SriRcmEPhBZClLmKxVEFgXzt2TZHXn6IkI2AQ2u8hShyhuDEMWItrnEtH+D9+FzV5/
         VdDvcEdW1IQ5cmVwPVZpaNJH7nPXDsxQx7xXSbjPVuUwv1G5uGsBHDiq6Vp2mCMTDxck
         lIAZCR2odx4kQarRo6xoJcsvPPEOZzRWIlFbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=QaFX3xYRLBjv6PfoSjeFP1JDDZM/FOsXrWwvaRxZxhQ=;
        b=oVKZb1RNKAQd0HWFVXcn39F+10hx+OJUVOwzmzm/VRAjOOu3We5tf6C3zmGFAsxx56
         DyHHSUHfsMBNI44OvH543sasgsCTo0aPk2ieAHhhHfR9G6gzJV5y4C/JEOawIEcMY0y1
         VTdKSKufbzrrM69JXTJlPgCN6GQz9Hz8vL/4ykxz9FBhOfIQM6Qirr8ojQqplJ9uAfmy
         bfUX0CfpLnNzRVt8+Jh01zUDo5lcDGIzipfw2dAGXn2tfuU+Eic2qdAjrZGCWielD5La
         Tavx+Rf1vdE+YoFhCRI9iRU42cYBLd48MwnwAaqZNu84fIEIifLgKfV1ZJHYgztt92u5
         xLrg==
X-Gm-Message-State: AOAM531TzUI8TUZFmZjWqY0oov9ubht2USgL4qxmzV0Rp3w+jeA5ReFY
	dIoUrdtiKsXJllhluz2cdvtN+g==
X-Google-Smtp-Source: ABdhPJySP+7KhCHS+RKDaMaa+mWwmLTphsRCnLp6xeKDrIrTdhphZdkXR0iLLlPNtaZTI0t8vDMCmQ==
X-Received: by 2002:a5d:4304:: with SMTP id h4mr4560774wrq.210.1620300144992;
        Thu, 06 May 2021 04:22:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e? ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id l5sm2930463wmh.0.2021.05.06.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 04:22:24 -0700 (PDT)
Message-ID: <3878e27fb895718b8c5d65f444fea443a56e0587.camel@linuxfoundation.org>
Subject: Next Yocto Project LTS - April 2022
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, openembedded-core
 <openembedded-core@lists.openembedded.org>,
 "<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>
Date: Thu, 06 May 2021 12:22:23 +0100
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I'm pleased to be able to announce that the project is planning to have
the April 2022 release next year be our next LTS release.

This fits in with our original announced plan of 2 year cycles and 
recognises that the LTS has been well received by members and our 
community. It also aligns well with LTS releases of other projects
meaning we have "co-travellers".

The current dunfell LTS would be due to end at that time. There has
been discussion about extending it beyond the currently planned 
timeframe but no agreement/decision has been made on the extra finance 
that would require at this time. There is also some concern about the 
potential pressure on layer maintainers in wider ecosystem which we
plan to investigate further.

By confirming this now, we're hoping to give people a chance to align
strategies and plan for feature development to land into the LTS. There
is a clear need for any new/experimental changes to be planned/developed
now in order to ensure they're ready and stabilised for the LTS.

Cheers,

Richard






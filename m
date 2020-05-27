Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.1048.1590561689575258078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 23:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NkfXzgXc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id x14so17453754wrp.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 23:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=Il1InRNfTsjmBxTxaHY4/J9V8Yy5/Bcrn+x7NQGq9P8=;
        b=NkfXzgXcqGmN0WJFd0OvVAAK252X8WSXiBXoXHmzBx5MNo16zyi37bNifJ2MbugdYD
         9HUWcG+WysuKQlNsFs9QByHnTt0hbGik1jTxj1F4kCQuahYXbmyGQqQ8fwOPf1Z9eqX9
         cy6JFsls/iBojVxQVaWVMzjbgk819FpQED0t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=Il1InRNfTsjmBxTxaHY4/J9V8Yy5/Bcrn+x7NQGq9P8=;
        b=m30k+vVeBAWa6ggFmI1qqpC+99BssFP9aieIoeqOTrzSmS5Hs4fBgGLMT1CdLwOHix
         67hZVFDNnJSgh4xuKY+FVA8H7gckpgLHmLDTmw3F2XfMHGgqlNOee7ukQJqTYHj5IWHl
         QzLBuaKCsOOXzSiz1kwPGi3Hiki519hdiCOuUuPB9f6bfl1bpvwtekG76VLWi9Yva90s
         HDr5KEWlV6PYgKiMm1Eu10O7TGOPwhqtDkDC12Tnby4QcMat7B9GjO+2+P41e9nD3era
         kR62kA821DNyoSrvW0emdbpW2AUsz2RUTSEailYjgnULd4WGBFswlyh9gMdwXaBCOFBt
         jn8Q==
X-Gm-Message-State: AOAM532xR+g46+9Q59wZLYaxYa+MYB1TL5Keb9Ku56ovuBqfjvSivEs8
	kdBmZTTZ9ERHb2Wm0uLqrt19+D206bV2GQ==
X-Google-Smtp-Source: ABdhPJwY7QHragt0LtrEAo6ivPx30j/2JikmBq2V6bl5R2Or+crDtONo2n+1ob+LseJZ/yPVoSagxw==
X-Received: by 2002:adf:8b55:: with SMTP id v21mr17958961wra.187.1590561687728;
        Tue, 26 May 2020 23:41:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l19sm1792294wmj.14.2020.05.26.23.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 23:41:26 -0700 (PDT)
Message-ID: <e7d33c70b4fff3bdf9994c1030ad63512a370845.camel@linuxfoundation.org>
Subject: [warrior] Backport 'prservice.py: fix do_package with newer Python in Ubuntu 20.04'
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: "Armin Kuster (akuster808@gmail.com)" <akuster808@gmail.com>
Date: Wed, 27 May 2020 07:41:24 +0100
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I just wanted to give people a headsup that I backported OE-Core rev:
4b26eaf7152fb712aba47a0c746333578f58ee8d onto warrior.

The issue wasn't ubuntu 20.04 but that we were seeing the same issue on
Fedora 30 and it wiped out the rc1 build.

I'm trying an rc2 with that applied.

Cheers,

Richard


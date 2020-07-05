Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.37464.1593958193746618975
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 07:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CBvbMn1f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id 17so38838485wmo.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2020 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=I0qM130BzYI91cNVLGYcNttuquAv5o5FEobjjriGuwM=;
        b=CBvbMn1f5yJUiCrljpB5EvFeI6M0x+ZSSvyNywTEZopPIJzZeBZVv2qb+F0v14OnUX
         AFBf/yTVBmCK19RJDgsGNU46u3/DKvSI4NvGVMoy9+QkeXKj4VcxGggCKAmy39LaWRPn
         Z650wU4rkP8NSciqGpAxgV7FAgclgncVjhYdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=I0qM130BzYI91cNVLGYcNttuquAv5o5FEobjjriGuwM=;
        b=h+o+3QTTCQDk5eZt992g7m4j09Q5UKqtqsCjHxUgMN68aeWnak0hI80fLrhLt2Pptr
         aAFznaix3NEE326RngeytOn655ZGakDU1onyncBretgeOLvuxzOcyyYjGpZ1j2iDqauj
         9HDEeFM3yyYk4TKa2MvlBW3YdEqa9Ts6jddvTnTKAFIFO+QNQ3SknGp967dV+a9GEKuv
         NRSwGLZzUxIIh62IgllwG0VWJsxYuQHSBUVqwIShFiizP0MKpkfp/M5jhpUED1tsQkQT
         vSNXqALsfhM71h1V2gSBi7sVVumLS2pJwLse4Q3t4+CbcdkIvubT3lOXHMwmfVSj2Nby
         ZiNw==
X-Gm-Message-State: AOAM531CcJEPumVuXiujjBMghkBv1yTWK6CQy1LEyx3+4wddWXloxF0U
	4FT0TqQxnsMc8/3q4OtLLfH9Zg==
X-Google-Smtp-Source: ABdhPJzd0LNV22OkWjFcag+nsRO8EEM6TMMz4V9pVbVVXqPU7QEHJDcnK1Wztf6lWAEpajdKqVqKkA==
X-Received: by 2002:a1c:9650:: with SMTP id y77mr40907347wmd.101.1593958192397;
        Sun, 05 Jul 2020 07:09:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t15sm20185483wmj.14.2020.07.05.07.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 07:09:51 -0700 (PDT)
Message-ID: <01db6de24a109ce450dc2ba428ac5694bf67b442.camel@linuxfoundation.org>
Subject: Re: [OE-core] [zeus][PATCH 08/10] kernel.bbclass: Fix Module.symvers support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Sun, 05 Jul 2020 15:09:49 +0100
In-Reply-To: <20200704211322.GB24166@localhost>
References: <cover.1593474787.git.anuj.mittal@intel.com>
	 <03248953d1eacede00971289dc9fff8d97d00464.1593474787.git.anuj.mittal@intel.com>
	 <20200704211322.GB24166@localhost>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-07-05 at 00:13 +0300, Adrian Bunk wrote:
> Please drop this patch:
> https://lists.openembedded.org/g/openembedded-core/message/140233

Later in that thread Bruce did change his opinion although this is a
tricky one...

Cheers,

Richard


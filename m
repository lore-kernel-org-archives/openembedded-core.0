Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.21188.1627916670522707577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 08:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X16wyEZe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id h14so21825618wrx.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=izJCZb1plYeXgOM8SiHg5TVJxQdBGOaafc5lMe1P9iU=;
        b=X16wyEZeqQNhR/hhGWFJEX2+VrIOuUi+Kz32bQTP512ERMOxIdAoBoPswfoLnwOA8W
         IU9KVIXD25IPTDWRFL/l0G7HgkyqLd+/0pMjmsGOcsTmxw/qgDk1gEEA6gR6E4hKlhkL
         Wo88DeVEjgQ3Cu+ZYYpZ87OPzAStY8krmO2mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=izJCZb1plYeXgOM8SiHg5TVJxQdBGOaafc5lMe1P9iU=;
        b=nro7EvP2Y4tK4rOixsOJimk1Y8/dux+3wQgZkppFBruE6S3CrGUfY+zlNWyWwXiQAV
         aXfkWFloYKIwGMFTsIbVoxR4lROeN2KI73037V1WBwJuvTpbVhUyDfoWlJLhlE3ZVU0C
         oO3wZ2xBstrS3flKVzrAK3i31KI0rjRnvf063P5hi0+2c75ssQAMG7NXWb/M5zfgdohK
         Pf1pDrBAaSUXQp/pckJJJZJQTwyL5wEaSPgwOW365qiWW2Ren2rSzq58ZmDbDrOp0hQ+
         Cokrnl51zqan/3bqafavinujCglRFQhaeZKQia9QHtVp3hW/RtPLolMV9MBgE4SwWc9d
         jjPA==
X-Gm-Message-State: AOAM530Z9r9UKf0gUYNamQJum+q/EQsYQoxv4eCXabpaxM26EIg+Cmsz
	yp7fp/jquffBxzeyvzm6RU2sog==
X-Google-Smtp-Source: ABdhPJzJRVqiRDlnSCMByDlbinCkVAeMgdF8YJcGCewlrxFZX9vTb27vy9ARZxYBGXlVukdyaF+cjA==
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr18091005wrm.220.1627916668937;
        Mon, 02 Aug 2021 08:04:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9aac:cd42:2ef7:1a7c? ([2001:8b0:aba:5f3c:9aac:cd42:2ef7:1a7c])
        by smtp.gmail.com with ESMTPSA id d7sm5061416wrs.39.2021.08.02.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 08:04:28 -0700 (PDT)
Message-ID: <7419111ad58a262461b858dd92771c075f7ae1bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Nicolas Dechesne
	 <nicolas.dechesne@linaro.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Mon, 02 Aug 2021 16:04:27 +0100
In-Reply-To: <CAOSpxdaMyYkAnuM72SjwZYMegvRyPN3oAL+Qo1BjiFjC8R67Yg@mail.gmail.com>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
	 <33b5d60e01b3995046709b17b8014fd45b0c48e5.camel@linuxfoundation.org>
	 <CAP71WjxcSk64Snj8Hd0Vy9nJyUH8mE9MjnkfAZC095mPt9bd6g@mail.gmail.com>
	 <98ab2870e07ad6d296d29322b7ee78bade43b9ea.camel@linuxfoundation.org>
	 <CAP71Wjz5-CQJ7nJzRU+Kij7itOLFeyxsyYkc=XGm=U5iWHqN7w@mail.gmail.com>
	 <CAOSpxdaMyYkAnuM72SjwZYMegvRyPN3oAL+Qo1BjiFjC8R67Yg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-08-02 at 04:57 -1000, Steve Sakoman wrote:
> On Mon, Aug 2, 2021 at 12:35 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> > 
> > These patches are now merged in master, and I believe they should be merged in 
> > dunfell and hardknott too. The 4 patches apply as-is in both branches. Let me 
> > know if you need anything from me!
> 
> Done.  I assume I also need a version of the autobuilder-helper patch:
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-
> helper/commit/?id=fe72e222961d69dcd4d638e7e05b437a65e8f34c
> 
> It seems that dunfell is checking a much more limited set of layers
> (only meta-intel for check-layer-nightly)  Should I expand this list?

There has been work to get some of them working, so yes, I think it would
be good to test and see where we stand.

Cheers,

Richard


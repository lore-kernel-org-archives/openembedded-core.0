Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.19738.1630919575106073883
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 02:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lzm5G2XB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id u15-20020a05600c19cf00b002f6445b8f55so4280271wmq.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 02:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=afD9ep4DibdJRqxHbxex/4ZeLYc73mIe8E143akWIrE=;
        b=Lzm5G2XB/HIP9abVFapQlhFkcQ95SYvULNaNegNoTxrCnSRSLVXbUM7453SreRXpgi
         ayEi6RT/J6fV8wPx6S3+pLRtm0rWfn6PqPx2Zq5eXFuOvxZmlZe0zqzOD4+9Wg/lrhbF
         NdWZE/1no00mIOTyeTzJbjQKWg4zuqHNC/Sw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=afD9ep4DibdJRqxHbxex/4ZeLYc73mIe8E143akWIrE=;
        b=E7WcpD8c7eJkAVTVFWdo2OpQud36UIn9pG2tMl/gjulinrSLVHEXCfu/gIgJVjmtzi
         3agiqa/NaviQ1te9U2NjJLgZzoBICPQZ6mgmj6IuU9+om9gTEEay7cpAgJLhDgiQ+jBZ
         2aedTCxam4y4/IbNFM56kFXgUqdXqUkKVIPqmECJztWIcbzk7zjCdjSy21/W/TdYhG0L
         h+lHYOT34fhg1MVu9/EBAR5FiBTlsSrEmmJK6tTB6hKV2K8qdZ0R8ZbWZpAwlVDc4H2m
         RfOlJV5pRziGbyvZ+MbH1DYUtIkIz0n4w0WX+3JkN6LXUIOiTmf9HNbiDOJjdWyuY2wj
         AnFw==
X-Gm-Message-State: AOAM530ylmFUc/rdLFnZTRaqdE3dwWWCYTE/2SZZzwSzc/vxyRiJb23s
	7jGAVxAY111RuWd8Zr3CuGlBZQ==
X-Google-Smtp-Source: ABdhPJyNxUM+pfZLZ1u1FzD/Wn8ysvtzIzybDyMxstRxx0sDoEFiEhPgM1h7FAyEdds4+pj6Ab37eA==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr10339210wmh.137.1630919573445;
        Mon, 06 Sep 2021 02:12:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:612e:ab48:3553:3f2? ([2001:8b0:aba:5f3c:612e:ab48:3553:3f2])
        by smtp.gmail.com with ESMTPSA id x21sm6765983wmc.14.2021.09.06.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 02:12:53 -0700 (PDT)
Message-ID: <551bc6089c4a244710a8a51fe7b8cc94d0af41ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] is oe_soinstall() from utils.bbclass actually used?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 06 Sep 2021 10:12:50 +0100
In-Reply-To: <ea0f368-83a0-c9d8-fbf3-bd3634c52b85@crashcourse.ca>
References: <ea0f368-83a0-c9d8-fbf3-bd3634c52b85@crashcourse.ca>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-09-05 at 11:34 -0400, Robert P. J. Day wrote:
>   just going over the mechanics of how shared libs are installed
> properly, and noticed that while utils.bbclass defines the helper
> routine oe_soinstall(), no one in my current collection of layers
> seems to use it; rather, the popular choice is oe_libinstall(), which
> seems to subsume the earlier routine given its "-so" option.
> 
>   is oe_soinstall() still used?

I doubt it is used and oe_libinstall is the preferred option now. That said,
that function could be useful and is generally harmless so I'm inclined to leave
it.

Whilst looking, I did notice oe_machinstall which looks more problematic though
and there was a small bit of dead code in oe_libinstall so I sent patches for
those.

Cheers,

Richard


Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.744.1596577599654540298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 14:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h32aNSmi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id p20so3858421wrf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 14:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=4aXIXwK/I5ijSSP/jblWbIZ6/XVswghaGuT0WqTN+wU=;
        b=h32aNSmi3wMJ5AKJToZGI30yakEs4wKzGvKaVMOZhtgH9sxBVlpsyx22gsnzWsK4s3
         43yD9UInk3ObZH5jav+61gT4vgwiSlc2z+w3AAYsWSkG84BBckUshBv/17zf1JI1tVKT
         CEXy2gMt5DU+OkiHUR7K0YdLeDB97KqaQKc7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4aXIXwK/I5ijSSP/jblWbIZ6/XVswghaGuT0WqTN+wU=;
        b=q3Pi2yekQal1BCdLOgBS/uGWSbDu81nz95Fv1rG/FSWOo29Dw3SNaXF7hNuDz/l2gv
         u1nXzwa5tylelEABpewZSBmelFtSECPo0gytNio//IEHf/1ZRJfntHomtCTH2xO7yRV7
         8YwwpdufRhToFCe2PbfSulA4IELcHRtN7cKy0arwdtnMXprm4do1cS8+fAg5+ubFnXYh
         2w0DOkXTHU7HszYTwcjhbZ8VLtcbLvl6+KPu+Bkqd2mywujtiX72HNaZvn2vUMdgo09z
         P03tpeHYAzJkhmwEZ51hRqZoaFYSj3boFwGiE1wh8Ft2nyVCY1YyoVzm9CgBrsMosvIA
         8YFQ==
X-Gm-Message-State: AOAM533s/dIIu9Zg1NuNafIEw3mifMuuYFKH8PFaEi9vK3qURv60DUkd
	LnO30s6vHkwlV/4UX43zxPbtxQ==
X-Google-Smtp-Source: ABdhPJzJAvo5BTuVSASY8L92Q+zDBZDidV25y/ywEvylqhS9/J4UvNI+5zct5wIXVzYoAza9urCOUA==
X-Received: by 2002:a5d:4942:: with SMTP id r2mr19481784wrs.285.1596577598120;
        Tue, 04 Aug 2020 14:46:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id f63sm172638wmf.9.2020.08.04.14.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 14:46:37 -0700 (PDT)
Message-ID: <a6cd8adae83c5cbe1aabc48fc2a613bc03f93f4e.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 05/12] layer.conf: fix adwaita-icon-theme signature change problem
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 04 Aug 2020 22:46:36 +0100
In-Reply-To: <0a664b963c116786382fbba6f3386a7105a01122.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>
	 <0a664b963c116786382fbba6f3386a7105a01122.1596464561.git.steve@sakoman.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-03 at 04:26 -1000, Steve Sakoman wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> allarch package adwaita-icon-theme inherit both allarch and
> gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62
> [gtk-icon-cache.bbclass: add runtime dependency]

Did we add that to dunfell? If not we don't need this fix?

Cheers,

Richard


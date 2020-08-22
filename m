Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.151118.1598081267849369238
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2020 00:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HS5aMWUe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id b66so1507869wmb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2020 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KfovxAmvIHNQewCkkfKk+uzmTrhcSFL83wZ+gVxFPmM=;
        b=HS5aMWUeB44Cvbx1X+BNk6PVq4Nt1IXyU5w9bHxA3q2s+vMKugmnW1jagtRtZFVlhU
         BWLZxn3x/9fas9uXSD0D631Kzvsc3EMaCxz1np9VjEpnD6LACfNt86NBpZtQEM6eTV4W
         rjvUPTXtF36SZmTxIyEi8w9Tba8cX7M+/+Dfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KfovxAmvIHNQewCkkfKk+uzmTrhcSFL83wZ+gVxFPmM=;
        b=jwzU/XhegiRIVKZ1yJzGil6+l7m2hBuJIAFF7BeMV/krBd9WbUsl5CoEFdlsAvkdiI
         f5xIQCzZvKZJo/ZyPYdS3cpJIbMNe9XjBQcg7h+XO1mVVUu45j5RX3+AG+o9yu45/zcB
         uIwdNCK7ALuAoYMeGDyumrpPh4b2wdNhlDpSqAbXeJuGVop5rN0xv/nPN4vF3R/u2auo
         4il0HgNJMhNAZz7dqYR6XxE72lX6k/MWbeuQee5uWccYrkTCu6Mqnnr8B+W2yYUMD1Zv
         wOhY4xfuV7sCymh3pZzefc57a7dgATWb6kWEb3K+/UGnkyb0jegwg2Ro3kvt+F4y1hcL
         EfaA==
X-Gm-Message-State: AOAM530tmlsbWT/3T0uDXFGI94bFjUofInDbPLACpQiz8f+m4WZEkmvO
	rhzykQViiGxQA8/2f54I9W0L/Q==
X-Google-Smtp-Source: ABdhPJxb4lMfkEpciq4O/jj1/tNWLoYFLxchTtsM9rZTymRhjBIGIwlkKbx46aC69ot9OBWkK/AXgQ==
X-Received: by 2002:a1c:96c5:: with SMTP id y188mr7444694wmd.72.1598081266259;
        Sat, 22 Aug 2020 00:27:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:45a5:d6d5:8308:90dd])
        by smtp.gmail.com with ESMTPSA id t4sm6142886wre.30.2020.08.22.00.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 00:27:45 -0700 (PDT)
Message-ID: <4e07ca8b282abc62ede7969bc7c7dd6bd34014fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] cleansstate
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tom King <ka6sox@gmail.com>
Cc: Joe Slater <joe.slater@windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 22 Aug 2020 08:27:42 +0100
In-Reply-To: <CAHQecY4KmaTb6W_r88fRaqTVCsGDmiQMqk5pZvckAraHBLu+_A@mail.gmail.com>
References: 
	<BY5PR11MB3992C1180C5A53CCD612FD47885D0@BY5PR11MB3992.namprd11.prod.outlook.com>
	 <92644e498d7a7ab6cbd2dba763d7c0900309c31b.camel@linuxfoundation.org>
	 <CAHQecY4KmaTb6W_r88fRaqTVCsGDmiQMqk5pZvckAraHBLu+_A@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-21 at 17:32 -0700, Tom King wrote:
> What would be a use case for cleanstate?

I never really wanted to add it at all. There is/was some case for
wanting to remove sstate objects and ensure something really does
rebuild from source. When sstate was new and had more issues, people
really wanted it and I was pushed into having it exist.

I understand why people want it although it should never really need to
be used.

There are some users who do use it regularly and they really need to
think about why and whether they need to. Personally, I don't use it.

Cheers,

Richard


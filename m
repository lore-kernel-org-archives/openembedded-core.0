Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.12635.1617718509301041696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 07:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NLCr1u4H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id o20-20020a05600c4fd4b0290114265518afso4588750wmq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gSU0M55hEBZjBxl9KN44jLCe7iYXkucYWLkh+NwihbQ=;
        b=NLCr1u4Hxasqib/Xbcr6ethYEjDgvRLVAXcFEJZTxXBoqF6SpWscJ/2GqHRzcMupnI
         axgjP8sq1cfxMCytUzb0u3P6UA8Ne0J5NN1xnPbgI0JHc7ODdCvfiKhD0PrPf51KntGG
         Q+d3pWc3CBdK0coWiYg+CkSb5ZdZouwZ2C0Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gSU0M55hEBZjBxl9KN44jLCe7iYXkucYWLkh+NwihbQ=;
        b=jlk9dyhQmBNO++a37+Do9Wf4uXhDzmNGdIN+ovPrJaCTwV4dYwc+A3k2mRtgGqCFTj
         8gF0rYr0jSAw0vPvZHPTGPq4JbkSp51XJviHCR2sVdCMmoBcuzRs+4RqfVrSp5xmO00G
         OYYi3PKWzYieoC6fBzfLL8ZIF/Qdb9W4jVPSjAIpcTsiRRTWd52ROTkGJ9on4NxmnK6X
         lZl6zOachc9JDcwth2d1Y1tIuBve7T9J60MHkpMFREgSliZ7YDHQfHSy2SNf5+RDrhag
         5Tqp+F1ucM7JDD3hA27hKijQLZkAxgF/7eaEH+a9yoYTYdbtk5j6mELbIlp4/Su4AVhW
         +8tQ==
X-Gm-Message-State: AOAM532/rTsCVoQ7AS9qOl3J4UM8oUJ/8DKoLxYFxXpmxTCTUXFkWAeA
	i4mP4egG/kMKFprceayMTcZZwg==
X-Google-Smtp-Source: ABdhPJwXEjDvBCbGgAlZjI+cKoNogHzQ0S7bc0sNnTBTEUwYMbnU3PK03RIsCD2fimd2ekjLIp3gbw==
X-Received: by 2002:a1c:2781:: with SMTP id n123mr1935378wmn.64.1617718507620;
        Tue, 06 Apr 2021 07:15:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7a9e:d3b:5548:6469? ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
        by smtp.gmail.com with ESMTPSA id k7sm22653777wrd.24.2021.04.06.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 07:15:07 -0700 (PDT)
Message-ID: <983a9f0aa3fc3afe29219453e83343121f8b28a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCH] buildhistory.bbclass: store MAINTAINER variable
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Purushottam Choudhary <Purushottam.Choudhary@kpit.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>, Nisha Parrakat
	 <Nisha.Parrakat@kpit.com>, "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>
Date: Tue, 06 Apr 2021 15:15:06 +0100
In-Reply-To: <PNZPR01MB422418D2A13262F2ED54139390769@PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM>
References: 
	<1617262550-10558-1-git-send-email-purushottam.choudhary@kpit.com>
	,<3e693a34b87c151c4672fcd59b23aab3bf6b55de.camel@linuxfoundation.org>
	 <PNZPR01MB422418D2A13262F2ED54139390769@PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-04-06 at 14:07 +0000, Purushottam Choudhary wrote:
> Basically, the whole idea is to generate the metrics dashboards of each components. 
> so, that Maintainer variable in buildhistory could help us to collect this data from 
> automated CI which will maintain KPIs like unit test results, coverage rate, 
> clang-tidy warnings etc. for the components that will map to software domains 
> which consume the component.

That isn't what buildhistory was designed to do. The more appropriate place for that
sounds like pkgdata. Also, test results are in resulttool and testresults.json, not
buildhistory.

I do think we're going to have to step back and redesign some of these things to
adapt to emerging needs (like licensing). I appreciate adding MAINTAINER to 
buildhistory looks simple but it will lead to a long list of different variables
different people will want to add and morph it into something it wasn't intended
to be. I have denied similar requests in the past before too.

Cheers,

Richard


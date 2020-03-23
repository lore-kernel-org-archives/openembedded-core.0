Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.2054.1585007645644400972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 16:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ub7KW/tv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id h9so19370587wrc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 16:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7GE5UW0HpKgJU59PFWlQymRKmCcjmBbOf+cmlfrzQLY=;
        b=Ub7KW/tvqEnxIvhivd0BK/WcBUyQbSsFa1Kq9u+aTQa/p70F3EHzIJFKmdHYZmwsKE
         9+jcR42ojHSk0UAgTZab/l9RkfJVzCRa/H7H01ie+M0pwXbl4PBKZbYc0QNixuy+/FV7
         yKIwhhpNN1e0mI9/5bfmtI3E5ztWByPEVB2Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7GE5UW0HpKgJU59PFWlQymRKmCcjmBbOf+cmlfrzQLY=;
        b=JZT5WP6wVEcenU/H3XSfWqAHkQ7cg+RiFVp0F1Dj7YtLNq1TuR5zeuSVQNcwTjE6KG
         kN39MVS+5HDladcxmHGaa/nbKRsbdK82fw/WCkUdvc0Z5xOpZmg+YEKk5QwC0ddd5/P9
         0EsP7pm+9DQMgDFCntS23YNH7pNvoO6PAXID9OP8Q+D3nIqrumD59fIJaHs2OKe0KANr
         lJznLPfEidd5lZ50Em1sz6901y+MtWpUGMyZHtw3eQSKtiHiGmCso8bOkfWUr1GuEon8
         wxi7hVZ42QLZPlAe/9hCkZ/oohmyi+DrJwMN5t+6VaegfGGntFqLjnoSsRmglFa7ijG8
         0GBQ==
X-Gm-Message-State: ANhLgQ0IFuCQQeYyADI6NhuatTnlFabjfkXv7gF4jXb9oti3JlagWUYY
	TRq1hVKU8EriprZ6zBqzjxEqcg==
X-Google-Smtp-Source: ADFU+vtj6WbhfhYFMgianl+zHCX9K3jlNJnnuho9OwQpMOtULU+2UkiswRmCkXbG+eRW/50J25L5Xg==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr33495649wrn.106.1585007644072;
        Mon, 23 Mar 2020 16:54:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 138sm1706865wmb.21.2020.03.23.16.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 16:54:03 -0700 (PDT)
Message-ID: <4025bbbdb096438636ee8ef67c86e0bb73ec6887.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icu: fix CVE-2020-10531
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Mar 2020 23:54:02 +0000
In-Reply-To: <40262b4b71155231ec89c97563933ea7dc02244d.camel@intel.com>
References: <20200320010156.120590-1-anuj.mittal@intel.com>
	 <40262b4b71155231ec89c97563933ea7dc02244d.camel@intel.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-23 at 23:44 +0000, Anuj Mittal wrote:
> Please note that this one is for master. I had sent separate patch
> for zeus as well.

master was upgraded instead. Not sure of the new version still needs a
CVE fix or not.

Cheers,

Richard


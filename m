Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.5159.1592037076727203981
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2020 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QsCFBmkc;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: uvv.mail@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id di13so5475990qvb.12
        for <Openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2020 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1SKsufXd9uoZxVxYtcXCVe+ELadwRBOmZMF2enBJdkk=;
        b=QsCFBmkceMHiMe+gKWx7BgFIG3itLipHmHSnsurTjQdcaRNz+XG9I16vXZ9TxP2SeG
         A+CXLhycYXhAPfTzO1QeL7vgv1peZRNKGvk+IteHO14LlRUWLn8VPPyYpnMjf6p8gNoO
         0SgKcRTvMtg2TeEgty/IN0BV4mAPj1ECyFRsQbc6mE4fEqqiSFUR3Ok+WJRmLOlp9yhL
         6JbY966FG++iFpq1bPoBgJ9moiyH1dpZpMet6CAMkEDRxLVI0WJwZRhL9eYgMWMsSkWu
         r0e/ozMLqZgS3PX/QV4nI+DWZYdfJNuj0AeITIlkwnsc190Xgbdb2CO3P41Yj9lLNrve
         xXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1SKsufXd9uoZxVxYtcXCVe+ELadwRBOmZMF2enBJdkk=;
        b=bmfDT6ORmzy+d24a5qR/0pydGyiyDwdOyKahSlDjjZtc98P28tmUquS1kLypnBjZj3
         RbFGybUAK+74JgTqviG7jtqtiDB/nUX+xw9tyAViAOBHojqes35UfVIUDNASnGMTJFcB
         dmzdoB/Y8476blgxqSM6Je3yeZ1Q760RduX+fpNs1El5UmTbHSB4OtgCOjRJm3sajAJ1
         hRg5l7wcU0B+/+M9DSWbmyiXuz8r2YcIwGNbBBzc7//R7IIOpliQGJ7KXfVGtK5gcJ6E
         m+cJL+uZ480hzgm+9fIKlA70xE82YLJdmbYErie3+NxK7wwREoLsFhPgfMWr5Tgm+dIm
         k50g==
X-Gm-Message-State: AOAM532f96WwFX91UO+HRGS7HD7rJUnW4pb0BtUXLcNgIgxBi4ZbyicU
	mKUVrwENPAx20f3H2WX9+Vw=
X-Google-Smtp-Source: ABdhPJyB1HahCuKwRNc4dhI/Qk3gAIWGN9jT7q2Sl7zMVGqdcQn4GHdjpPWT8vla10ASdDCTkM05Ew==
X-Received: by 2002:a0c:e710:: with SMTP id d16mr16426994qvn.158.1592037075868;
        Sat, 13 Jun 2020 01:31:15 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.205.162])
        by smtp.gmail.com with ESMTPSA id r5sm7127334qtc.40.2020.06.13.01.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 01:31:15 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] dhcp: use included bind version
To: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
Cc: tmark@isc.org, Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
References: <20200610143520.2727827-1-uvv.mail@gmail.com>
 <6dd0de0be72028b355cd759e40fee22c9d24ca7b.camel@linuxfoundation.org>
 <b10c95a7-5d8b-d922-ad40-6d97cceb9c85@gmail.com> <14618585.ZI4Hmrvx6b@tyche>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <af72cd9c-2ce8-a2d8-e6d2-89028f576294@gmail.com>
Date: Sat, 13 Jun 2020 10:31:11 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <14618585.ZI4Hmrvx6b@tyche>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 13.06.2020 02:41, Khem Raj wrote:
> I think it would be good to share if we can. Shipping two versions of bind
> libraries is less than ideal, have you explored disabling threading in the
> bind recipe and see if named is happy with that ?
>
Yes, I have. It partially solves the issue. At least DHCP doesn't 
crash/fail anymore, but warnings from epoll enabled are still seen in 
the logs. The other question is do we have to strip down BIND 
functionality in order to make DHCP work?

I understand that maintenance effort is at stake and we are looking for 
the best possible solution here, but IMHO having one set of bind 
libraries for both BIND and DHCP servers is not one of them.

We could also go Ubuntu way here, by having two bind-9.11.x for DHCP and 
upgrading BIND server to the latest stable (9.16.x if I'm not mistaken). 
Then security support could be only done for 9.11.x version, the latest 
stable should have most of security patches included already.

Vyacheslav

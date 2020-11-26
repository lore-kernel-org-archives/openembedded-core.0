Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web08.5938.1606402300674193841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 06:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G29HY6On;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id z7so2429553wrn.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2020 06:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uE1WefL+Na/IsfhS4DXJzx3ptDFwF4EVeNWg2/e3kcc=;
        b=G29HY6OnDWIjI64/1lWJJ5sHaUt3Q7mQSuQhFFhq5QX5OAX7wtaIBxUCuuxG1SXSBN
         v2513fbe3nh3oBsXqvqGjQDFzJxc6UtInrN256yO7GfKaH3UJV3FT551ILJrTeC47XU9
         qVD9lMly7l2N8zvIMoPYUDFjlzFyLeeBtOW/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uE1WefL+Na/IsfhS4DXJzx3ptDFwF4EVeNWg2/e3kcc=;
        b=lTc7NA3VTm301k3a1hkA8czo856vzOzEoQSoSGrl/6fpjbwNmxqZuRMH47AccCdZqH
         IEpcWMXGn03ShmZCsD6kqpgplfJ/lpvNOWwhURLk6FfU6Gg/jbZ9l9HPRZinK+ljNKlV
         H6OvfL5qSM2Vxfz6qhzpL1y5WCC5FOpUMs5Ct5ini8F4ho9BFX8jwdEOP+Kn3nQY+OZa
         o+8i8NE/ga8I1eUvLr2TowcfMZ6Xd5g2iwL8AC1qZSXGYvFxIf7odosn+C6HCp61WPZs
         YllKPJ1d9RUOejKBc4EYYrPGZ0mkTzxRHEAGW+7F6ZTSoqoGmmFnp5XaePAOxC1WrvGn
         47QA==
X-Gm-Message-State: AOAM530h+uReOctjuL2DAomJ+Gjkr2ao4zqEtlPC2+hnLofejTIHiGe2
	vYPQ2HUQcmhcTEA/6tzSgn9yj9V4U0Paag==
X-Google-Smtp-Source: ABdhPJwEUhsBs6ED/276tAt3TV14xQrTpjADYuj7hFPWBzw1h4e7pD1OHi7gXGYjXuZKzf+x8W6GJA==
X-Received: by 2002:adf:e5d0:: with SMTP id a16mr4474040wrn.340.1606402299291;
        Thu, 26 Nov 2020 06:51:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.8.3.c.5.5.3.2.b.b.3.d.3.f.0.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.8.3.c.5.5.3.2.b.b.3.d.3.f.0.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:80f3:d3bb:2355:c387])
        by smtp.gmail.com with ESMTPSA id 189sm9188140wmb.18.2020.11.26.06.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 06:51:38 -0800 (PST)
Message-ID: <2c0da7ad07d9339449faa6842740edc5471ecf83.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] kernel-dummy: fix executing unexpected tasks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>
Cc: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
Date: Thu, 26 Nov 2020 14:51:38 +0000
In-Reply-To: <DB8PR10MB39775710E456F17F2FAE85A792F90@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20201125165417.29781-1-andrej.valek@siemens.com>
	 <20201125172045.8697-1-andrej.valek@siemens.com>
	 <ef5e35d36905471304587803bd685ce2297ae889.camel@linuxfoundation.org>
	 <DB8PR10MB39775710E456F17F2FAE85A792F90@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-11-26 at 14:44 +0000, Valek, Andrej wrote:
> No it's not a leftover. I've just copied it from kernel.bbclass,
> where this task is written correctly. But you can change it to
> previous version I guess.

I'm trying to work out why we need the extra dependencies when the
tasks are empty.

I can see how adding the inherit would help, I'm less sure how adding
the deploy task after the others does though.

Cheers,

Richard




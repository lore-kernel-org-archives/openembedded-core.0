Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web08.470.1606772220449179980
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 13:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XV8hthjJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id e7so18297031wrv.6
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 13:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=E4kSrbqdoxRjMT/ZF+bQwMERy8ODwa7iI8NbCO93SIQ=;
        b=XV8hthjJ+EKi48tKU6NJ1VYEyTcoys+tCfC5Om9swAs3JWpVDA7Uvqgj+xWcGkUsJm
         2VmqPAb6v2ir0lPa/frV8Jftfg5fZH46glzW8sy03maBzVR2jGdAQrUFJD0j3l5Q+cjV
         JHnLTuENNs9BllWocTtKUpOHJLWxL/W7R/ZAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=E4kSrbqdoxRjMT/ZF+bQwMERy8ODwa7iI8NbCO93SIQ=;
        b=BR4UzvAb/OuXXlH55Yp4sgYInxPyecczvFHQ/1ha16onDYavDgRYCvrfpe0xgxyZm4
         K1NKGHiXR/4y99wxoUSde0Gy0QZOil+g0zGy4lwPuoACNphmrU1fIjfxWtwnKw6RVwD8
         U/Vqz6OxFA+ZoxMOr2xaHUGiLUa1IieUKqwZ93MNKg8JNLr9uoj5wOsDpE1iWHqXppDe
         n1aloJPq0V8hgeb7az3PBieRm2eal9lGw4R+HhXSiLbVKqsLCEosPqy7TeGbI1HXGZd6
         Ao7dvIUyjJA6eGK9XaIOCAMPZMe6L3pfMBwkDVNI9iOlTyJ8psfp32wYJdqI6UsdNjMq
         yQlA==
X-Gm-Message-State: AOAM533wBFwPx3JzfPYU9LlEKPfxvYTOyiS2yjZd3jdDUTrHYnRfoC1v
	AGLWQhrdU7aUOATANC8nKiDT/w==
X-Google-Smtp-Source: ABdhPJw5HLyghlv+X1yQYPzkF8lD8XO+cpF5QYbrkzzqAlE9SuculBkeuYepke4X3dqNCts8kWJPZQ==
X-Received: by 2002:adf:b74d:: with SMTP id n13mr30884216wre.101.1606772218934;
        Mon, 30 Nov 2020 13:36:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b1c8:3e5a:82cc:7486])
        by smtp.gmail.com with ESMTPSA id w10sm29855948wra.34.2020.11.30.13.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 13:36:58 -0800 (PST)
Message-ID: <59e03e67690a8811cca94b2f1cea684da85c2807.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 00/18] Move python3-pytest to oe-core
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2020 21:36:57 +0000
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-27 at 20:24 -0800, Tim Orling wrote:
> From: Tim Orling <timothy.t.orling@linux.intel.com>
> 
> We are increasingly needing pytest in oe-core, so it is time to move it
> from meta-python.
> 
> This series first imports the recipes -- as-is -- from meta-python.
> Second, the maintainers.inc is updated to add myself as maintainer for all
> the new recipes.
> Third, the two recipes that have stable updates are updated to their
> latest releases.
> Finally, a fix caught during ptest runs is added for RDEPENDS for
> pytest.
> 
> This was built on 'nodistro' with only openembedded-core and tested on 
> qemux86-64. All the new recipes that have ptests pass all tests.

That series was an easier one to test and merge :)

Thanks Tim!

Cheers,

Richard


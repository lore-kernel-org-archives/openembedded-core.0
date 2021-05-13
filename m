Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.411.1620921989095491337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 09:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g/2y121/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id s8so27416933wrw.10
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Nu2cEAIkZS+E09+v/oqKRBZECZEQpT7rLSHQekj3lHM=;
        b=g/2y121/844sBgk23bV8Z6u3TIIQPjnJQjfFat1oOxXoeRPlmCmwt41vNM/d9rpHQd
         Qrc81wQ/CFqgi/wM3YH8cH0aAd3xqFgD4gsPVrjUOyw1yvlBPMzw5ZPEWtxOtqdiNLKs
         NzFerCxsXjsRJOYsv/yW4yElqqWLWJ12BJM3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Nu2cEAIkZS+E09+v/oqKRBZECZEQpT7rLSHQekj3lHM=;
        b=Pf7ZltSnAywKyFJQisC1TgQtkBH7kCabVQWkIONw0pGOp0Ae2VsjWQKwDnL6HHNK3i
         mk+42Ce0p2KtS38Aj2JvpA/LEUakm9hYsfDYHa6MyLfVxNCSJuSlHi2qejBgb78w9FYm
         zf7OLSjAL92jHXmGSpHVzC3WjJBjbg7+VyT1P4zPicIhGuOx9ks0Q6I7C1VgyEJEAnbE
         vLuYojcXTsqP7/0eIpgG8R0cIcMdxvDQGUGr01H6N835Moj9r6zaXd72hWU1dMmKzp7l
         7WGRf+uiaLxeXlb2oZ+IMPRF7jvfbaloSWh7OQJICr6ZtVfnfOrEuD9DQBrGYzUmyXlz
         Xp4Q==
X-Gm-Message-State: AOAM532Vmv1tjoQ9oeGQma/ofmgaa9MeOvwbFPrO6peuUX+9isUEwnHy
	o37pYsMa+pW9pKQMbcfSkSrR1A==
X-Google-Smtp-Source: ABdhPJx1rZ9Syc9rAbjR813uHzSlmovAPSG3zzt7FFGj8bKkPKlJhHNscWalU6pqus1zeF0/a5h5Zg==
X-Received: by 2002:a5d:56ce:: with SMTP id m14mr19217189wrw.35.1620921987590;
        Thu, 13 May 2021 09:06:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f649:3481:d239:bb03? ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id w7sm3187088wru.51.2021.05.13.09.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 09:06:27 -0700 (PDT)
Message-ID: <ac5c9794b628c2699810343783eaff3747c2166c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libnotify: Make gtk+3 dependency optional
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, yocto@mac.mcrowe.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, Mike Crowe
	 <mac@mcrowe.com>
Date: Thu, 13 May 2021 17:06:23 +0100
In-Reply-To: <CANNYZj8E6Rem_gy-NieFXyBBmb=qBB9rcX1C9D01dhtymFm9pQ@mail.gmail.com>
References: <20210513143632.1211604-1-mac@mcrowe.com>
	 <CANNYZj8E6Rem_gy-NieFXyBBmb=qBB9rcX1C9D01dhtymFm9pQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-13 at 16:43 +0200, Alexander Kanavin wrote:
> On Thu, 13 May 2021 at 16:36, Mike Crowe via lists.openembedded.org <
> yocto=mac.mcrowe.com@lists.openembedded.org> wrote:
> > +PACKAGECONFIG[gtk+] = "--enable-tests,--disable-tests,,gtk+3"
> > 
> 
> 
> Was the --enable-tests scenario tested? Specifying gtk+3 after two ,,s seems weird.

It means to add a runtime (RDEPENDS) rather than DEPENDS. There are 
options for positions 5 and 6 too if I remember rightly.

Cheers,

Richard


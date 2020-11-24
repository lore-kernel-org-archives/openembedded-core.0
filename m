Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.54204.1606233155830053106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 07:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J5ZE3o+f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id p8so22826085wrx.5
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 07:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xOq3hQjh9sWjQmo3a7Dbv++lg1l9MoEr0k8lluszzPo=;
        b=J5ZE3o+fAAlzW8AAyEbodskWKDd7qqaFsql2xxP8DikUnbTSFe1of9MfsaIOT+WaJP
         xSyrOKTN6biqzw6K0qxEdSCLA4GoXWCdphla7Zb5zrm+3noGnzbqNh6YVDRNac9tB/G4
         mroRrt4tW/J6koAxGHTcGzf1i++RxQglmRf8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xOq3hQjh9sWjQmo3a7Dbv++lg1l9MoEr0k8lluszzPo=;
        b=pMv6bcMia/8+ltLkLGF2kVG7Yug0RU5+IdrOHxcDosfBZDfRaFOguiGBUW21fFk0yY
         jWG1RHruSJSUy6tz/SMa0l/3LfJkdZpk0xzEpCbg+RqqX31FNDsoWo88M14bZVX4rAyJ
         S7ijaM807y40Am0zT9tZKmbeCW5Mcq3qRlB1P3Q87rYFHjwZK8adK64vTu3cWMbZKnxd
         OWy05qgIX6QpoPVvBMmoA5/ZK2+SeaOsWfeRv7gxKdKlyyx2C6+sJuN2STi0R/2EaXwX
         K0zd6anxC3g3I9KVAPmpSSg0GP56ZG1D4ctNDy52V0TpN994UE9yxeQPQUpzfDyOIx4w
         9SkA==
X-Gm-Message-State: AOAM530cYntcOjtb5UpRqRShGDonZi2vuSygsSjFsIXZTFubiM3OivQx
	rMYi02LdSRc3aWhs3t9E8broYQ==
X-Google-Smtp-Source: ABdhPJzd2lUKrfvVppFXrH+9sqEwMTlOgTNke1fo7FnmyNjF2c+OxQILO9oxcb2rO5edEEHedRs6dw==
X-Received: by 2002:a5d:4612:: with SMTP id t18mr6046410wrq.401.1606233154334;
        Tue, 24 Nov 2020 07:52:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:906d:2276:ed4:2134])
        by smtp.gmail.com with ESMTPSA id c187sm7194226wmd.23.2020.11.24.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:52:33 -0800 (PST)
Message-ID: <50edf6012e58b2d75be5c013dcab19365e5e4818.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libsdl2: Add directfb to PACKAGECONFIG rdepends
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Mark Jonas <toertel@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Nov 2020 15:52:31 +0000
In-Reply-To: <CAJ86T=URx1WJ9=+7-pQ+iUoTi5yT4jJaPdct0zOqa0gYFTF8Mg@mail.gmail.com>
References: <20201123191349.7503-1-toertel@gmail.com>
	 <CAJ86T=URx1WJ9=+7-pQ+iUoTi5yT4jJaPdct0zOqa0gYFTF8Mg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-23 at 11:54 -0800, Andre McCurdy wrote:
> On Mon, Nov 23, 2020 at 11:14 AM Mark Jonas <toertel@gmail.com>
> wrote:
> > When building libsdl2 with PACKAGECONFIG[directfb] then directfb is
> > added to the DEPENDS. But the automatically generated runtime
> > dependencies do not add the directfb package to the runtime
> > dependencies. Most likely this happens because libsdl2 does not
> > link
> > against directfb but uses dlopen() or similar. Thus, the runtime
> > dependency to directfb needs to be declared explicitly.
> > 
> > Here, a runtime recommendation is used to allow ignoring the
> > runtime
> > dependency using NO_RECOMMENDATIONS.
> 
> Why would anyone want to ignore the runtime dependency?

Agreed, that does seem strange. Whichever way this goes, the patch
shortlog needs to match the commit (it says rdepends right now).

Cheers,

Richard


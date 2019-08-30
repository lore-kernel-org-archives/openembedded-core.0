Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B5D687E6AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 08:39:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l2so6542144wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 01:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=i0l/0IpUi39g4ppMn0a7HAKKVvTqMBBn8fZCdUYpyV4=;
	b=bbN8hHbnHX1KWv+vTM2KOKju6sdgHX5Y/Z7WyJ0AAmFdtsJmE0YebRq7ggScTReDwW
	O7k7PhhvT8xACobF3l7EVXgLmzbNXH/w8+NL7hbUg2RPn0GZ2Ss2rlKffTt8mky5Xu61
	lSg5rA+fckpM8S3R+Z4viE/5teBQ9FGpCv4OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=i0l/0IpUi39g4ppMn0a7HAKKVvTqMBBn8fZCdUYpyV4=;
	b=hO7B4X3uf7sGB4wXQfgK7pBAZdDP2EOYlHwCn4Z4aMAX9dOvaLxx66/irSZe9mpIN6
	txNO4z/TNtNpGf8TrU0msQWsW44teotRiLvAf/J1P62yUikL4l9QlIwUgtrYjPhkgWpt
	K+heBpn7ZVwW0BHjywJK94p+vE8JxaG9UncYwkL0w2xr5ysauyLvEQyuTwuAu5UP7mdj
	dMIM9+UQ/H511vcZg79CyRtkzzvCcQtgC6Scokq9PgQFGAJHKlrVTuM1yuY9F5z7LIkO
	4DAbA2/sh3TduXTal0qcQSOcyfTnanhWvMWy11LUbEChDRPzSKiauNsH5JVyYV28319c
	+U7A==
X-Gm-Message-State: APjAAAUjtV80CCuZWvDuh2YI+2HICoz4+eQ9/qlidEb7cbgrXJ3nhtAk
	eLj8oHFKWGL9mV6V+QgJbJuyB4BZEWgumg==
X-Google-Smtp-Source: APXvYqzteQIunwXQ8DPBiM3FEhlboR9+abw0frPlXFsZKn3yvVlz3GL7lLjhFxxWFopemtjXuOhTjw==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr16971275wmk.149.1567154384098;
	Fri, 30 Aug 2019 01:39:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j17sm3877515wru.24.2019.08.30.01.39.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 01:39:43 -0700 (PDT)
Message-ID: <3ddea138c43dbf7b4f586124e901562f61e210b5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Adrian Bunk <bunk@stusta.de>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 09:39:37 +0100
In-Reply-To: <3023c089-61bf-dfc0-bc7e-1a5864febcb9@windriver.com>
References: <20190825172116.23759-2-bunk@stusta.de>
	<3023c089-61bf-dfc0-bc7e-1a5864febcb9@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] Remove LSB support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Aug 2019 08:39:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-30 at 11:04 +0800, Robert Yang wrote:
> Hi Adrian,
> 
> On 8/26/19 1:21 AM, Adrian Bunk wrote:
> > The only part with some (marginal) usage is lsb_release,
> > which is split from the lsb package into an own lsb-release
> > package.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> > https://github.com/AdrianBunk/meta-lsb contains a preliminary
> 
> Do you have a plan to move it to git.yoctoproject.org or
> git.openembedded.org, 
> please?

I'm happy to have it on git.yoctoproject.org but we need a
maintainer...

Cheers,

Richard



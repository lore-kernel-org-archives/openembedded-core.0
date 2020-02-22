Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F66161773
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 14:11:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a6so4875448wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 06:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=BRnHINMns5NtZx46vBAcfUqiidCnELhm8R5Mr66tmIc=;
	b=To8LrHN/3yXVBUqag6vpW1zv6MG8MMMxXZdTWowIxl0FM7Jg7V1vYwGxbrDSWrDdjW
	OTLphW+70ON8SkIVLXDzW6k8hn3jH7m4ZxJRvwqJJ7F7K82YdOQyH4yeOKWGvfYbQ3k3
	1Kn+CUAEKcu2yxLfp58wlL5vxd6HCDLmt0KcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BRnHINMns5NtZx46vBAcfUqiidCnELhm8R5Mr66tmIc=;
	b=Nojpt8HvFVSmgoDT2M3ZJvcllqlKeFCpdU5B7lPRDTtiiOFNDmZYYv5KhNbcg9ASsX
	yKcpMNb9EClBvzHi+3LFY0edI9KrPzCVmmaEPsU1sKslcIEYnfE6Vpr6kyxa6DusDvci
	hcWurppeNs8STrC+bpYBnrcdm9jgnHjJxiIAqQufE90C0c3OQMmkUT+ZnlB8htRKCQ1t
	mFog5H3OrrAik9jun172Rfbw7j7smeumGIe9eSHAbtLtYH5rYzyivGuFOxEvm+TMfrLo
	f2ych2S3oXHiKkSMtoyUVBxfSL1tsRFlVMrOHj7rUqA0u+xOpVwp3dE59nsolJq9gcao
	Jk+A==
X-Gm-Message-State: APjAAAWzCdAl3DewrAcmJRkS3cufY5HRnQyun+mkHfltMpQlC6PvzecJ
	vC9PRMqez33MtnwQYp0gzzpWcw==
X-Google-Smtp-Source: APXvYqwEjUUjPWe6fg81ZxmCeTBhNrsW+68V2QsHVp6Ak9mlUnw1FDiL93tSJchYqi4Pso2iBsy9Bg==
X-Received: by 2002:a7b:cd8e:: with SMTP id y14mr10678138wmj.150.1582380683771;
	Sat, 22 Feb 2020 06:11:23 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k7sm8607077wmi.19.2020.02.22.06.11.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 06:11:22 -0800 (PST)
Message-ID: <054a99af2dfbeed2fcf000423304959f17f0be96.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Praveen Muthusamy <praveen.lisieux2011@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 14:11:21 +0000
In-Reply-To: <20200220182537.4423-1-praveen@linumiz.com>
References: <20200220182537.4423-1-praveen@linumiz.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH V2] alsa-utils: upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Sat, 22 Feb 2020 14:11:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-20 at 23:55 +0530, Praveen Muthusamy wrote:
> Signed-off-by: Praveen Muthusamy <praveen@linumiz.com>
> ---
>  ...lsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} | 0
>  .../alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb}         | 4
> ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.1.bb =>
> alsa-utils-scripts_1.2.2.bb} (100%)
>  rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.1.bb => alsa-
> utils_1.2.2.bb} (97%)

Thanks for the patch. Unfortunately there is something wrong somewhere
as this seemed to cause this failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1600

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB2067D41F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 07:37:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b9so1821196wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 00:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LAfnw3f/5oVTkVJV5Mma77NorIv34W245yMypX+2+wI=;
	b=aduTpYMes1emNvKcX67dCuKRc6cYMgBnx9oSAjZ7WFSfGoXEOoaGNyho1pK+ghQUTs
	Nhsl8hcI5capa/6F6veOXaoRX3Jh4NBv10TBXVXIe12EDhxbh3A22S/aSKwhw0Lts0RD
	aq9wtnASc+VbR2FR9EP6SGlfOXgrhbsS7IpC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LAfnw3f/5oVTkVJV5Mma77NorIv34W245yMypX+2+wI=;
	b=Wzyawv2E3hBRJC8145PNsJL4x73QllpElfFLMvUvQ1sabYRLudQ5Q6ni/+A8Dpq1OC
	GvzG7na3GqT4towVpMirynXVlZhlXT0ma1qtOvrg8+5mZe6ONKDOo4EOd+untZD4j4VG
	Gi6ya+ihAD30SbA1a80tRFf+Ikk0APQrNxJBYqbKCaH4xNVG5K+TDbVEKKXDYQ1XdUzn
	Ek5ocfGmsdhpXCRQLf2PwU5t78ATpYzpWbwc9KuQi5iell7bNZAVeub4nJmh9myKfLxN
	wq6TM5HkipRJlW59m0fEdHpeD7nV8g5ecZLTK+tauMnC53GQPyKGoc6cU22twhhdi23c
	JJMg==
X-Gm-Message-State: APjAAAVlPf84ZHZ8ySsDf8qJKSbE40n3/1UJ7UyvkE36NQ0Qjm1+t1WD
	Jjcd88s0KbBVjvh7Y8oz3SuIFA==
X-Google-Smtp-Source: APXvYqwYOClZlmmN90nB7k0z/CY7AtT8ebDdIQ2/bMGsD5/x1XH/evGBqd6jajZjEaqwA7wu8/4eDA==
X-Received: by 2002:adf:b6ac:: with SMTP id j44mr4996819wre.156.1570088274320; 
	Thu, 03 Oct 2019 00:37:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a10sm1659092wrm.52.2019.10.03.00.37.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 00:37:53 -0700 (PDT)
Message-ID: <8686591028f78ef628a4c3ae6f664e2dd1630a20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Oct 2019 08:37:52 +0100
In-Reply-To: <1570059354-83716-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1570059354-83716-1-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] testimage.bbclass: Add kernel provider and version to testresult
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
X-List-Received-Date: Thu, 03 Oct 2019 07:37:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-10-03 at 07:35 +0800, Yeoh Ee Peng wrote:
> In running QA testing, we sometime need to select custom  provider
> for
> virtual/kernel and version. To track the selected virtual/kernel
> provider
> and version used during test, we need to add these information to
> testresult.
> 
> This patch add the virtual/kernel and version into the testresult
> configuration section.
> 
> Example of virtual/kernel and version added to testresult
> configuration:
>    - "KERNEL_PROVIDER_VERSION": "linux-intel_4.19"
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/classes/testimage.bbclass | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)

My reply last time this was posted:

http://lists.openembedded.org/pipermail/openembedded-core/2019-September/287138.html

still applies.

Cheers,

Richard



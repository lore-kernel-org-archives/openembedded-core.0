Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7549C7E78C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 21:43:37 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id f9so755266wre.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=8LJx3HLEfC+wivYggPWGxwbsLW8Z9EVhbWYSkUzPI7g=;
	b=DCL3CELcZHkWOHGu8O6PZWfG0Tct3MIEl+bp+M8xggY4T6/aieioefYqUALsb36Q7x
	ddYrjI33TalNlebD4VRLSmYUpHdYkH8vcID7t+KgJX1WBBZ4jfPaSIwwYSw19izTPuVe
	lcb/3G306TZu8dkDN3S3cRVnHX0kjlG0t4eq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8LJx3HLEfC+wivYggPWGxwbsLW8Z9EVhbWYSkUzPI7g=;
	b=Jwtf6weJuddhpHq9aMvdZV4WOEJKvuV+BjWl8w6qQCdeP7n/3zz1gdVvnuFCds0NL/
	glrfa6SVrhs9OPjxuQ3JX8kOEx+JCJrS5ffaYQVM+VaFmSSdoFvT3W9V+nxTtnVrSULc
	CEAbf72155RQ4YxKaw7AQh5N23iUEc3zFHNdGZHP0Agc7G9kEgJB++5TBdlTlOBmAjhg
	8cg0b9ovSY5G5WMw5i4qa5mCbdHGHYiJhT2PqURhM76CU6M9TI3aOgdP5b7Y4xZcWUcT
	FgUsrDons2Bfqh3ROyWH2eSfkFHck3M4dWsjVcFY8gK6E1kFmoyanyYJ7y8pieAZuTv1
	l+Sw==
X-Gm-Message-State: APjAAAUnitP0AaidT6YBz3J46i86LDyAqMOje7NUCaDjtC3ADgtkvCdH
	l/YarHZJe8DO2+RHOQIwdjC4HA==
X-Google-Smtp-Source: APXvYqzEJsJM5fr0y50xq03YXmEfloQ7aCAoqt//TD2zh6wplOKefTA8BOTIgCuwmfplMaYW+niWtA==
X-Received: by 2002:adf:ff90:: with SMTP id j16mr9941173wrr.135.1560980618280; 
	Wed, 19 Jun 2019 14:43:38 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x8sm24833729wre.73.2019.06.19.14.43.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 14:43:37 -0700 (PDT)
Message-ID: <e8ab13ac2b8030adabdce237417718fc184d92fd.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 19 Jun 2019 22:43:33 +0100
In-Reply-To: <CAO5Uq5R2D9g-+nikuMbrWbWYWBE51E=VLBPWtXvCQkJU4eHPfw@mail.gmail.com>
References: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
	<f1aeb71da144e3cf77b9f1c1e402bb0f5f71e847.camel@gmail.com>
	<CAMKF1spZojFkRCEqOE-RLkYpeTuub9O3i9OWg9sQpV19zjv+Xw@mail.gmail.com>
	<615d805a254f145c076ef586e4aaead67f689e97.camel@linuxfoundation.org>
	<2cd9ca60d5b70de9ed931d57cffca652d16bc984.camel@gmail.com>
	<CAO5Uq5QK8+bF812AF4o-AG+sOMb4E51Wj88CoLWL4jSccLdy6A@mail.gmail.com>
	<2964bfd2c8101f0497faf7c4de54b78172b5631d.camel@gmail.com>
	<18e05da8a22ebe92979079187d1782413195cef4.camel@linuxfoundation.org>
	<CAO5Uq5R2D9g-+nikuMbrWbWYWBE51E=VLBPWtXvCQkJU4eHPfw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Ayoub Zaki <ayoub.zaki@embexus.com>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe,v2] kernel-fitimage: introduce FIT_HASH_ALG
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
X-List-Received-Date: Wed, 19 Jun 2019 21:43:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-19 at 16:30 +0100, Alex Kiernan wrote:
> I've a bunch of stuff I need to get out of the door at the moment,
> but once that's out of the way, I'm going to see if I can get qemu +
> U-Boot + FIT image as part of a test image as a starting point.

That would be great!

Cheers,

Richard



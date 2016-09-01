Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B018D7016E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 16:04:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i138so13222862wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Sep 2016 09:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oYpJ/+QtdePaqyUvP47Ahtx7VxsIMgkb06uou7MgLsA=;
	b=GzeHOXG8LF20eWLrYx9QiRTBqKBC9KaVV5SAH+/6CLVIkE4Tgkgyt15bHfHN6S9nvL
	3MGn+nRHgvAZjKcckqjW3s6eK4r8hYKoWBedLJl81ewj/gtaXu/WGZlh1BzfNjBEuCtA
	oXmma+RwUR4u8revLwbN37c6ZuFLszHnPzyqNijxQFcfhhd4Pk9HOs4upF3t5iqsPykE
	k1P5F00Ld7NNL3VksO5Rc7nUQwYVETdZvC7VkLz+SbjeUViC+pLnUaPjr6ROR9VuZj1v
	x+hA75cjn2WVxHwObhXPD9eupq6P0TxosGnWjVeflZO946MACIiUAxi8cesx2lz323xJ
	id8Q==
X-Gm-Message-State: AE9vXwPmhllWOWijXInAORvOZ2JcnT4ajFenEBDRF4ZJlEblj0turyHGvb4teDnuQ4dZlQ==
X-Received: by 10.28.10.194 with SMTP id 185mr26527034wmk.53.1472745852558;
	Thu, 01 Sep 2016 09:04:12 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	b128sm29921023wmb.21.2016.09.01.09.04.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Sep 2016 09:04:11 -0700 (PDT)
Message-ID: <1472745847.27417.49.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 01 Sep 2016 17:04:07 +0100
In-Reply-To: <95e22ec6-7453-6a40-8359-37cdde69dd20@windriver.com>
References: <20160826103152.6211-1-git@andred.net>
	<95e22ec6-7453-6a40-8359-37cdde69dd20@windriver.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libnl: fix packaging mistakes
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
X-List-Received-Date: Thu, 01 Sep 2016 16:04:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Do, 2016-09-01 at 16:19 +0800, Robert Yang wrote:
> It seems that this series cause errors when multilib:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds
> /930/steps/BuildImages_2/logs/stdio
> 
> // Robert

Thanks Robert. I didn't get a chance to look at this today. But tomorrow!

Andre'



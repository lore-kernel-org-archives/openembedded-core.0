Received: from mail-ve0-f176.google.com ([209.85.128.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UdIVr-0006Zt-Sw
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 13:07:55 +0200
Received: by mail-ve0-f176.google.com with SMTP id jz10so2676188veb.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 03:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=HYQv341TH3LUrFdlhtaeDeMt8kA9AxRmrZYwkNr9vEs=;
	b=a2Uyzbq+i7rMbFaZHHDyrlS2EXcJ8sCbWYDfgv518Zd6tfol6vKnorU116f8pZ9j1W
	++W4SvodhmmUlkPYvHlC2eyZDMUBzBwsPRwiAWCWDO4vkZ3oXZhwn5t45VkIXidt6KsA
	IugoI4CUp1BEshRmZuL5A4laxpBULvZfvVQHbCTg9/aXnH9TQMPPPwxSMCoWExFEIBBj
	MouZO6Pa+dxOlNL8s+j3IWvKKt2mDBjj5VGMW6UuCQFtjJd24dGMfpE0o8hhd3EP3wS2
	4+02790t3joQMD851LCQet+J2ZMRsREpy1NV7QpB0lWJwCg+JbD234KY2C+I4Ir3Ln75
	6cmg==
X-Received: by 10.52.165.99 with SMTP id yx3mr24902062vdb.34.1368787775871;
	Fri, 17 May 2013 03:49:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Fri, 17 May 2013 03:49:14 -0700 (PDT)
In-Reply-To: <18b03e64401ab99a14b03fe662f84cb58ac3ddc9.1368783549.git.ross.burton@intel.com>
References: <cover.1368783549.git.ross.burton@intel.com>
	<18b03e64401ab99a14b03fe662f84cb58ac3ddc9.1368783549.git.ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 May 2013 11:49:14 +0100
Message-ID: <CAJTo0LZ5uKHsUFyNc6gB8Agy5r92dcSu1Ka6XoBBgZvboksEvw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQmncKDiF3yb6D8jYJw0kqtUdYMa4t+ZAd62QogeqfLE8cyhNOZw4AcbeOVhhbx5PMMqnP+u
Subject: Re: [PATCH 1/5] pixbufcache: update the loader cache when installing natively
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 11:08:00 -0000
Content-Type: text/plain; charset=UTF-8

On 17 May 2013 10:40, Ross Burton <ross.burton@intel.com> wrote:
> Register a sstate postinst function so that when installing a native package,
> the gdk-pixbuf loader cache is updated.

Retracting this, a last-minute change introduced a dependency cycle.
V2 coming shortly.

Ross



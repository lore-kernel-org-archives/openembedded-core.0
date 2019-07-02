Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A6D297EB4E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 09:15:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v19so103494wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 02:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ZZJHPFbJ53Sx32bl0McQFohQeuEBiSJx2VJKQzoXS8w=;
	b=Rp/AJi1EoEtHfxJ9RbFWPimewpeGB/Wx0QJlojkCXIGOGKTQ95BuvrYHJEa8f6v7hh
	GebguA2ZklWkUsgCOwImckRc+MHVT7C7LiwhkHn4WcmdbRI0zg1qcO0xNXjZDyH6GQqR
	gEMPki8FOCmVY/RSh1BOJO7EcQJeR4OJfjr/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZZJHPFbJ53Sx32bl0McQFohQeuEBiSJx2VJKQzoXS8w=;
	b=SANz3VXGRzxVfvB2siDdiMKAwDG7IS88cTivNhyWkxu32/320APNC+Kpy7S7JYcCDs
	5gPEPEhqMCc4wCBXskZzJlfz6zH4b0d5edCf6FPL5OAEBcUqszhX+2sYxEQeOzSIROep
	/5HULDPE9ih8KTwHJQ4lLciPwmJC+H5lucpw+NVLLSqGUDuxVfciOpdyx7Az+ocL5nH6
	yxh4sqLaw3FHbNBNwfB4UorGFjvc0r1vkcjOnsz0sx61MVa0Xzu6qGZAAg8b9+oL6nVQ
	DwOdfvg2eVrnGJIkN7t9Ay3lBkhePjtNli7IJRxQbcq+/P92MiPymqCDzXdIpO4zr9Af
	ls1w==
X-Gm-Message-State: APjAAAUa1+tq6MfccUAK9PpjRm4ZQ4uINJbOKRxkYMhGZ7TzcpN7Q9oz
	A4sitqPnfBIwgTZj0oZ6GXG4KQ==
X-Google-Smtp-Source: APXvYqzsDueXtqwTM5aLEx/xtd+75HszZa8LvbDRKP5+dLu74iHPGurRjkP3xbjCSI8n5/dp+9c6WA==
X-Received: by 2002:a1c:4041:: with SMTP id n62mr2813016wma.100.1562058953339; 
	Tue, 02 Jul 2019 02:15:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z126sm2950633wmb.32.2019.07.02.02.15.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 02:15:52 -0700 (PDT)
Message-ID: <a07b9a91c616469e29d1df6d0faba6b0505e954f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Pierre Le Magourou <lemagoup@gmail.com>
Date: Tue, 02 Jul 2019 10:15:51 +0100
In-Reply-To: <CAEz4NHoQ+Yx6BAv8raKokE95Pk2NCd9oEvfLZUyqyi9kYoH=zA@mail.gmail.com>
References: <20190624094438.7596-1-lemagoup@gmail.com>
	<19369a4e-80ec-9659-faa0-fc0f5925aa87@windriver.com>
	<2baee5f7-f293-f9ce-447a-c2a6297a5529@windriver.com>
	<dee71c54f502a346433289c8cc3e268c5f719614.camel@linuxfoundation.org>
	<CAEz4NHoQ+Yx6BAv8raKokE95Pk2NCd9oEvfLZUyqyi9kYoH=zA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cve-update-db: Use std library instead of urllib3
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
X-List-Received-Date: Tue, 02 Jul 2019 09:15:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-07-02 at 11:10 +0200, Pierre Le Magourou wrote:
> Hi,
> 
> > > On 07/02/2019 03:39 PM, ChenQi wrote:
> > > > A recent do_populate_cve_db failure:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1005/steps/7/logs/errors
> > > > 
> > > > 
> > > > Could you please help look at what's going on?
> > On Tue, 2019-07-02 at 16:08 +0800, ChenQi wrote:
> > > I just tired to open the web but failed. The web seems down.
> > > 
> > 
> > We were making some changes to the autobuilder to speed it up
> > (changing
> > database backends), its back now.
> > 
> 
> The NVD website is down, cve-update-db should not fail in that case.
> I
> need to update it, so it prints a warning instead.
> I am also wondering if we should mirror NVD json data feeds, to avoid
> too many requests from Yocto users. (but I don't know how to do that)

raising a SkipRecipe() if the class isn't configured (inherited) might
be one way to at least reduce the load to the cases where its actually
configured and being used?

Cheers,

Richard



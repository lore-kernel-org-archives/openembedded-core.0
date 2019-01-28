Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6A92A7C388
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 14:26:03 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k15-v6so14359945ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 06:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=jSgqYUAryiZp/AxVGfabmOIVfqeT9tw8VYHjo91k1EU=;
	b=PUc6nELDHwzRYmDG5Bxtnay1juXh5AbKUihtHqinSxofNFCQP5of2ArHZ0GrVaD/sK
	NRzZOVrYIJMmJAjhogj56YA0f7wribA7/y/KrngONHt0/7oAFJEbYh39h49JUAzLRT6S
	SCM6R0wZpEFLfWnUacHVuEor2TThNPjcVKDu8cMwqMzFuhbunqYwuRGKlIZrJJhZHwyH
	j2dC4/nImt1UKGju9CeG2YCznQ+TiT/h3DK8POlX4ILMhTgmF1lpd7yETm5IhJlIUbX5
	GUUp0Z2C/4loIq6WbqRsmuqMcASZmBtCxKDEy6M49fw0ADGVRZIzqdAjL2fxtxQutYhu
	9YMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jSgqYUAryiZp/AxVGfabmOIVfqeT9tw8VYHjo91k1EU=;
	b=jop7jYyluxTzXPXrkH8uv9oUeP52zxE6rqz0xR1yjfWx61OgR3JXXtsjxbcSujfYuP
	WYhlhKS4ga52gfOqYUG6quRyCAK11lkORRxWynu4PvUqWJrUT0mwxR5y5u1hkWk6GL7Q
	rKg+twS+FS15CEcQ850wTve4AqIEQdhfxmVtrhWlCY0YxXQHc/pjBCtjhl2JL+LWkk3h
	1KgMg2Yh822eIsq3/ZCOOV3i6KMJVFti5b/MIDSSpnJeaztUc4sQeh7HuokZ0M72oV4k
	li+8IVKjyn44Ezf9nqnpatbJ6XStbI+QMhOf0aYu1zL0IDV7Tb/QuyGLU1jQnpiB9kNK
	xvdw==
X-Gm-Message-State: AJcUukfyVAgRjFS3FGNVRTviDqxKiNvTMYNNfLILD3OoFXxE8T9ODtU8
	DdsXFD4MJjZ7/Rq+Y3hwUjnYeN6z0qQ=
X-Google-Smtp-Source: ALg8bN5dIwMUPs9VU06IKKU0UA2F0lAb3ZJKIMXt05M54vKqY6LjyIxPgq0X8DJ2FvfUPhG/vDNLaA==
X-Received: by 2002:a2e:2a06:: with SMTP id
	q6-v6mr16441434ljq.37.1548685563628; 
	Mon, 28 Jan 2019 06:26:03 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	6sm3217371lfa.27.2019.01.28.06.26.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 06:26:03 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190127093821.4803-1-jonas@norrbonn.se>
	<9649a5c523c4f0809c9f73a9c5326eead5ae12d5.camel@linuxfoundation.org>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <c4b576fc-741a-0fac-efdd-738bf7e9c141@norrbonn.se>
Date: Mon, 28 Jan 2019 15:26:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <9649a5c523c4f0809c9f73a9c5326eead5ae12d5.camel@linuxfoundation.org>
Subject: Re: [PATCH v3 0/5] systemd patches
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
X-List-Received-Date: Mon, 28 Jan 2019 14:26:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 28/01/2019 14:55, Richard Purdie wrote:
> Unfortunately this series failed in testing:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/226
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/167
> 
> so it looks like it may need some tweaks before we can merge it.

OK.  You'll have to bear with me here as I'm not familiar with looking 
at the buildbot output.  From what I can see, the failure is when it 
attempts to boot the image... is that correct?  In what way does it 
fail... where do I find that?

When I build locally this all runs fine.  So what should I be building 
locally in order to see a failure like buildbot sees?

Thanks,
Jonas


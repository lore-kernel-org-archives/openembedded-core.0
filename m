Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 90D1A6D3A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 17:32:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 96so4273871wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 09:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=OvVN3CfvfadmTLa/XKQg+a+A4mP1ALUlWEBS8WqAbBc=;
	b=PiZzw3hjU7DTJYKlVH3t6nrCnrelssxhso5p6ZnMWvvNCp9yFPVI5oVbwbt6Csbp5p
	5GVAskPhsOAhafIw6Z/nNQN+NE+HPYx751cOjnK6v6qUozqCSnCec2P8hLSxv5Z7OOPQ
	tRjJKkW2SIox5vpkwJrN51jVYS1VcivSVXWLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OvVN3CfvfadmTLa/XKQg+a+A4mP1ALUlWEBS8WqAbBc=;
	b=XphbjfFhHpnKJ0tWfCH3MVJ4xxdMzw+NK9IhzB/ukZt1s8dzXK1e5O6wipHe67BaF+
	WWXw5cUI9FSshWt1vS2GYqJaAdZsHA4Z71myUliXQXSyVISZf3SMN5rSJ4xtMnFl1kas
	aEe0WhF+kG/5lKXk34MnZWOsNi48tRaG1gbdzBip5h4R8RQyxLnkX4GgF+2GSkwGhMn9
	l4+LRAuv3PdWSWbx2+ZjFw6ydfISQL5LjYWkuLdXPfkO1NyQDRGvIsUuTQ3hXw4kepPk
	hM02O6bTvmcFPdkGrRzIJDeXle1V1El+F+E1Om9HweBZWbalpAaQLhit7ZR+dRrI3BJI
	3Kzw==
X-Gm-Message-State: AJcUukexwZz5HLykMzxRjgEo+7ISNE0mNor2DCvzgLJYaQQs9NDqw2i6
	Q0IEGrr8imi6FG6zVzYRNFQd6Px5otU=
X-Google-Smtp-Source: ALg8bN7RF6d+vijiVZuLPiLl47lWdrvffD4XMHjZL4tkcb24WSynSqR79U87Jl3uHc22aSh2tRy89g==
X-Received: by 2002:a5d:4202:: with SMTP id n2mr34958449wrq.260.1548955976215; 
	Thu, 31 Jan 2019 09:32:56 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s132sm5876630wmf.28.2019.01.31.09.32.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 31 Jan 2019 09:32:55 -0800 (PST)
Message-ID: <ddfc998a62b9e3b4ae346a449845e5341cf0a3e2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonas Bonn <jonas@norrbonn.se>, openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 17:32:54 +0000
In-Reply-To: <eca0ac37-bd7a-b3d9-55a9-937215963f31@norrbonn.se>
References: <20190128205848.12834-1-jonas@norrbonn.se>
	<2acd4017b1a5bf6882bb54e2e559588b7d8cac67.camel@linuxfoundation.org>
	<eca0ac37-bd7a-b3d9-55a9-937215963f31@norrbonn.se>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 0/6] systemd patches
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
X-List-Received-Date: Thu, 31 Jan 2019 17:32:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-31 at 14:19 +0100, Jonas Bonn wrote:
[...]
> So with that:
> 
> a)  Does buildbot use connman, systemd-networkd, both, or something 
> else?  How do I find this out?

We're building standard poky so there are no non-standard settings,
other than for those images, enabling systemd. You can see the
configuration and revisions used in the logs.

On the host side, the autobuilders are configured with static tap
devices which the user running the build has permissions for.

> b)  I'll poke at the patch series again once I get a working 
> origin/master build so that I have sane state to work from.  The
> systemd patches work fine on Thud... I suspect the problem lies
> elsewhere.
> 
> c)  Are others seeing similar errors with connman?

Our builds work fine with current master, as soon as we add the patches
they break. They break even with just the machineid changes. I haven't
looked into why, I just know our regression tests go red with your
patches :(.

Cheers,

Richard



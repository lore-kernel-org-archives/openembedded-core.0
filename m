Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4604971A0C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 20:17:43 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id s3so1890583plp.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jan 2018 12:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=iz9Jkv2ilyFwr7g5Ura0VSUaos6bDMZ01ONyi/uGP1k=;
	b=o05Ov6ptV6HhD+Uom6mRMoE21fJyHQBOvxaIpW468V8JkpVJTlkzZfewyARunBRJIw
	41PTGEv3Js5R483aJS96DABDw6y9mJc7pQJiQkUFunc9rI+WTxOHSjXEmf8ENyBBvEFZ
	VwKut2/vygwEl3qiaXuJsVQo5xMuNSioED9krp64WNcF42Zsn3Mshus2Nvj0IVKv0R+t
	qDRuHslvdgFqyX9pBqDypFcAicuSM1cK+P9JgQ9s0QosqD2nChLinQxi8HOrugIvIxmQ
	gqtfZDgpBMw36h0bI1/w8M9x5TPztDxicgAL5IdMBvpLoUv3La0Rtaj3Z7Q7T//acIN7
	G64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=iz9Jkv2ilyFwr7g5Ura0VSUaos6bDMZ01ONyi/uGP1k=;
	b=CjB8uHBU1gPFb+GicWYEavPpMBsOgcp9lktMX/yivFmuo/GzSvVR0jPCWn1outIRE8
	Qnba9soiVvIHovtNl2RrQGjyN6Zp4/WsmItpbJDbBzpvfLMcihltanfs2anmJaB9bjlc
	/5ztvz9LOROxJ7Zo5Hxi3M9d7SZnffhyvrU0WUxnVbC5Q78maNOLkNZyv1km5w1keZ6l
	IY5jI5qX06bRcJ2O+PDO228XFFrMi8cRB6TO5KDRyZmtzMA14VAqqIGD/6QJSq8dyoPe
	kVBDbWS5JOapl7vEjIefNSi+iGPgnqLcONkR9nrSz0uVARwucRYwNatbX2IhW7GX59GE
	ktEA==
X-Gm-Message-State: AKGB3mKEQWtrVEHTuH3gpQzm3SYsQtcUYQgzgVzaZPg9Y1x91wBeR4AN
	S+tvKb7BSpY6Fn4TfuKwnAc=
X-Google-Smtp-Source: ACJfBotEb007bh6zUf9ps6kyubb1s6kji3X0ktv+k1IYhX42RjLgyVXL/Tv6fHSJiApAsFcXnq4q5g==
X-Received: by 10.84.132.2 with SMTP id 2mr2392638ple.360.1515010665260;
	Wed, 03 Jan 2018 12:17:45 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:118f:a6ff:8496:e77b?
	([2601:202:4000:1184:118f:a6ff:8496:e77b])
	by smtp.gmail.com with ESMTPSA id
	h63sm3597811pgc.71.2018.01.03.12.17.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 12:17:44 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <661e1908-ae7a-3125-cc49-fc87014ee1cb@gmail.com>
Date: Wed, 3 Jan 2018 12:17:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
Subject: glibc update
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
X-List-Received-Date: Wed, 03 Jan 2018 20:17:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

I noticed all but the glibc updates where merged from Khem's
toolchain-update branch. Is there an issue with the glibc update,  was
it just missed or pending more testing?

I have some patches I need to submit but I don't want to chase a moving
target.

kind regards,

Armin



Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 78FD2731B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 22:20:24 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id o185so7043896pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=lDpJqXSIM2djGl+4YD6lv7IBSwft+irnCh/axEkGBtw=;
	b=iYMEJDNWsxjGJtOTto+pIyDEC5Ex2sMNYSZSBj8yy9+2lvZmMaZTIT2EfDKcLwSOLq
	ph2fiYQOiHib8bF0xeWrw1yWD5RddoQOhiQw0FuGITyMdDEh1QIz465xpnWNWZtTbd7M
	NoeN1MqFS2kAFOhaaXIAVF6/JLLf+4uRRnZKTAw5Maim1KvETOh9LPNKcXSv6QbJnrPg
	wELJfTJXzBgV3qIz7MmxFl2xKreYhPCeN2cywlD8vmVdlA68nNj1bbb2Hwi2tcGgxEN6
	ZcDzC6gYKtGGprTXYA68jJF9+Kp/8CUMnbYGsLjBNZKWvZZMn300u5hU2d9QCIUhRuHe
	tYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lDpJqXSIM2djGl+4YD6lv7IBSwft+irnCh/axEkGBtw=;
	b=OYik5ujek0EioNA4fdFV0NZaOk7b0Ybq2xbbMYqdQKJjMCfe1BcpxM7TEu+2x1pfj6
	fz3lECpH1tRGERCYRooPqv8ROha/kwqefs4+E6XAru+gZoi/07CG4V4JO5LC/ByLRMCt
	EbFFs+RXmLQbWiI5JkYnbU4ww7jcXnAlQryElCaJP6PTViu4hdr1FmJp7dSfktMY3tR9
	+oAfV5eKjKcXYkfIL+8eVrgIlaurmZ+ehLLqNnWWwKW3y/3BKpbbm5QGUhQqOTbAd5zu
	a2gXAtxGMR99s2QWT56FvUERRvEa4Pn9B4VXMmvcLXsg2fNSrfAXU1/+6GGCj0b2AJ1k
	459w==
X-Gm-Message-State: AG10YORwMUV75Sf+Gqvdo7/zHiZQqVlAmQrP2NyE7GemgvEuR2KND0XWoQafMiAKBR2/gg==
X-Received: by 10.98.74.71 with SMTP id x68mr45470032pfa.80.1453933225812;
	Wed, 27 Jan 2016 14:20:25 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	76sm11282162pfl.36.2016.01.27.14.20.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 14:20:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Wed, 27 Jan 2016 14:20:20 -0800
Message-Id: <1453933221-23617-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] Jethro libpcre update request
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
X-List-Received-Date: Wed, 27 Jan 2016 22:20:25 -0000

There are 19 security fixes. I propose moving to the next patch
level release instead of backporting that many patches.

Armin Kuster (1):
  libpcre: bug fixes include security

 meta/recipes-support/libpcre/{libpcre_8.37.bb => libpcre_8.38.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.37.bb => libpcre_8.38.bb} (94%)

-- 
2.3.5



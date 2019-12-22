Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB207F93B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 12:49:16 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id d73so13274904wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 04:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=mojlfLyqxNi9fq6aMkXRDC+yVILu2WFEaxzm/+LXGok=;
	b=RB3cNfusGFYpziA9QoNjTK/HCyyrukvkzeP9GgG5CbHYPr0z8pXDRryO7EOqZlt12n
	C2A5xY0Qia1cnMxNFovi6cdAHs3XbhjLRJgsGRXOoawBmXlQHGDZkFmPcGn17z/egVJ7
	IHJxHqKpw+cQJJBS/7+XKs0CT4cE31ihj65jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mojlfLyqxNi9fq6aMkXRDC+yVILu2WFEaxzm/+LXGok=;
	b=kF7nv4rkB76h2fSXjCIOzl0j27pgKYLYQ9spi9abFvW6wzkQXZ5mqvR0U0tXz39vJj
	WYWuJV0F8/ML8nWnu4wV+vqeqMqQNey2mCSpsKmphlZQ14+zrb42uzCesWrVtwZmURq+
	+wBbd0wBYrTqPs0zFxnyPVLWKtF7ZNJ50MZwvztV6bac+d7QBSiW0j2O7SAC6yZwk5pj
	qX3nHJQ6daxNGIGTMfLXKnB2fzuXTi6YTfmxD4KYV8kobcBYlLZbczmZZxVkrzp+sc9a
	cvS+yAt8a69vPnw8MwwNoGuO/syeO43n+zVv/KLgw1ExAwNVFkc746eJz9zX9C6M0AZT
	sDag==
X-Gm-Message-State: APjAAAWSp5TnawJWz1Nn2XmmMu5V2uRdqof/DkXp/CBjD0EwGWN6lKUo
	jngxMB+eXhwBqZzOUGaIctSfiw==
X-Google-Smtp-Source: APXvYqxDBSwlqlmLBSZzsmFReixlN0S7sZ0YcuVat7vzismcNTFKbJDkiubHRR5XdPOXJR6n/95jWQ==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr8937190wmj.100.1577018956761; 
	Sun, 22 Dec 2019 04:49:16 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x1sm16474148wru.50.2019.12.22.04.49.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 22 Dec 2019 04:49:15 -0800 (PST)
Message-ID: <a73ba44d3f16704691971ebfede683de21b2e65d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 22 Dec 2019 12:49:14 +0000
In-Reply-To: <f92e77c992efa93542732e335a99177b5903a11f.camel@linuxfoundation.org>
References: <ce6615e19c75117b5d4458334af60107fba830a6.camel@linuxfoundation.org>
	<f92e77c992efa93542732e335a99177b5903a11f.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Debug from failing hashequiv builds - server side problem?
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
X-List-Received-Date: Sun, 22 Dec 2019 12:49:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-12-22 at 12:08 +0000, Richard Purdie wrote:
> On Sun, 2019-12-22 at 10:54 +0000, Richard Purdie wrote:
> > I did a little digging on the weird hash equiv failure. I've
> > attached two logs, one is the simplified console output, the other
> > is the reams of debug.

I did a bit more thinking about this. These hashes represent m4-native.

We do have a problem that a given input hash for m4-native can
represent two different output states depending on the architecture it
was built on.

For the same input hash, the output hash of these two things will never
match. Nor will there ever be present sstate for them to trigger the
report equiv mechanism.

At query time in a clean build, the hashserver cannot know which of the
two output hashes it needs to return the value for.

I can think of two possible options:

a) When we report after running a task, we check if that input hash
already has a value and then reuse it for the output hash mapping.

b) We start adding some kind of suffix to the reported hashes for
native output which is used within the hash equiv server but not
sstate.

I freely admit this needs much more thought...

Cheers,

Richard



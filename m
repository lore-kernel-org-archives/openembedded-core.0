Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7277DF86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:36:19 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r7so2296636wrr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 01:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ac+IDUkQylJaTgNfEe/SifotT9pAq6hcfIc858McXwU=;
	b=T4roLl0+j6ZUZbalWgz4OXKk06v2VzPpEDmhW38xTDpJCKUprAREoIDWRorvRGL9Kc
	BBZd2SKTCe8AVw+vC2Bkz6RszLO5DCjp5bMu8mA71zezjVaEGqj14xb5vyBa4gAETHzT
	nYrLWmrwWV3bx5FtRyS2CA8WczF+WJ23GnTBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ac+IDUkQylJaTgNfEe/SifotT9pAq6hcfIc858McXwU=;
	b=lPSj4DnqqW5qmqiUtbYEwqeZ1dGGwXPapoqw01YDtv9ij8MeF7JDB7IPdZydRfU1tp
	ZrNrZMI1LI8pssGCeMcYxXf7vAn0MjViuWf1tfOrHVLbIU8Lo2c2mr80miWOhQC0WNxt
	oomzrajo2KJxAa3oLRgO5H7bSdR9kNV2vTT5w/tyX8JbYyD/0o4zd1KA1mu5I8mNyLi1
	Mj9CrQB26oQG740wnr9SKA9aNo4q4exXQjIsX6Bjsdp18mZnE1GKeifkfAYPya7BaVyb
	PztgoilCEZpJ8Bgbxe1XDNhxKEYoy02V7nEgk95amJvjghodcoGMztSSmX5gG2u7JH7D
	myUQ==
X-Gm-Message-State: APjAAAWzvxEvzvPLbVTzL6dRIjJfA3FjYFbb8JucaOlSr7CdJntTVXo0
	xu14q1bmQmgmAO6pSl4pj4V4Tw==
X-Google-Smtp-Source: APXvYqwuXmlnRoWEaePq+7NnRKspRIwgaAWcCjt5gwNwWVpiA6TtgVqJcSNkkzxEE05H7XSP8v5oKw==
X-Received: by 2002:a5d:54c9:: with SMTP id x9mr10370462wrv.266.1557995780083; 
	Thu, 16 May 2019 01:36:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c2sm3091485wrr.13.2019.05.16.01.36.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 01:36:19 -0700 (PDT)
Message-ID: <8090e1dda78942a654410f6546407dcfb38f54b3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC@Cisco)" <oobitots@cisco.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Date: Thu, 16 May 2019 09:36:18 +0100
In-Reply-To: <d0be2f64c3564298aca4a3598fb5c9d9@XCH-RCD-007.cisco.com>
References: <20190416153442.26880-1-oobitots@cisco.com>
	<d0be2f64c3564298aca4a3598fb5c9d9@XCH-RCD-007.cisco.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] protobuf: Fix ptest compilation
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
X-List-Received-Date: Thu, 16 May 2019 08:36:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-16 at 08:32 +0000, Oleksiy Obitotskyi -X (oobitots -
GLOBALLOGIC INC at Cisco) via Openembedded-core wrote:
> Any comments?

meta-oe changes need to go to openembedded-devel, not openembedded-
core.

Cheers,

Richard




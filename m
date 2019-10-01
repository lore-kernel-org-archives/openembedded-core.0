Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7BBEA7CFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 21:27:12 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id r19so4910900wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 14:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=n1FStLvIvy7Pi+iJ4eFoGirxvSAJbWMNC1Wd/ZcB9mk=;
	b=UW/46gl8adNivujhF25ZmWyA77HXMg3CQ2ZUunc+eJ3ofmjQK7+ELJmX89gCptnUE4
	+uX04Yn4AxJ3z8Ly3fHp0h1QN92Gqz9WTwQofHundxf2stM9+Cp8OXlT4wlx6P+Lt3Px
	vTyFmFN87hZN18pvXGfg4KHIKpbpCboe0voXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=n1FStLvIvy7Pi+iJ4eFoGirxvSAJbWMNC1Wd/ZcB9mk=;
	b=LKw14AmZcWm+PLiWdyj3AJnUfqVl4hIakeCSBhKhp0wiq5abrLURl40hUl39T4WJr0
	DQWVjoQf5YZsO6i705MCKLYylePg8nq/DpdcSqb2SefiXCIg6uirtWO6Szyl96tjvBNn
	sFPNJFs7qedhzqywt1/ROc3znynNwd8uHaMy3ZuOwvTEb0pZfDJo4MgSW5AEtADpQ1px
	tAPdI/u2MGxfxE5yCSFppUAiu49qFhYxgVu5jLeGMT+8Hfr1bmmRB8pBN7QUtP6hd4vX
	Ra4n7KpqA8fq7QojbQBQpHJ79/ZI5Ci9mq5Bb1m6DA1vgywUKpjY7DimAUVPbkp7Y3bz
	w62A==
X-Gm-Message-State: APjAAAVRReCcVDY+9FcCuxFhcnDr8A9OoLdaIwDQGbt+nKtbFbis6YyX
	HYU+MIWHgMUWnzYreohtJAGWMQ==
X-Google-Smtp-Source: APXvYqwG77xeQo6HuBp/H2XCoPZy44sDN/RqbGPOJVVXsZMicsLleFErr5cCoIIVaewtvebyzq0jGA==
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr87705wml.169.1569965233171;
	Tue, 01 Oct 2019 14:27:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r9sm20830081wra.19.2019.10.01.14.27.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 14:27:12 -0700 (PDT)
Message-ID: <d8171f242dd7275f16f43d7bec6351199c6f098a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, Stephen K Jolley
	<sjolley.yp.pm@gmail.com>
Date: Tue, 01 Oct 2019 22:27:10 +0100
In-Reply-To: <CANNYZj9q28NdSq8w1fHsJE3yLGoQJjqCwVewni3TXz1YVfJ=NA@mail.gmail.com>
References: <CAK5yBb9KAnpTGSC_V4W40AwD7nSPm-Q+RcxRBqMLHLw=ykBcNA@mail.gmail.com>
	<CANNYZj9q28NdSq8w1fHsJE3yLGoQJjqCwVewni3TXz1YVfJ=NA@mail.gmail.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDDigJkxOQ==?=
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
X-List-Received-Date: Tue, 01 Oct 2019 21:27:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-10-01 at 21:16 +0200, Alexander Kanavin wrote:
> On Tue, 1 Oct 2019 at 16:54, Stephen K Jolley <
> sjolley.yp.pm@gmail.com> wrote:
> > A significant performance problem has been found on the autobuilder
> > where some builds are scaling in time badly as the sstate cache
> > grows, taking 12 hours or more in some cases. Unfortunately nobody
> > seems motivated to help work on this kind of issue.
> > 
> 
> Wait a moment, I believe there is a patch for this issue?
> http://lists.openembedded.org/pipermail/openembedded-core/2019-September/287445.html

Sorry, that was copied form last week and should have been updated but
I became distracted in completing the blockers list.

There is a patch and the plan is to test that on the autobuilder to
compare performance, I appreciate the patch!

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 60202617FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 12:11:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p18so10798501wre.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 04:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=HijLxyCnTLiHWz45ApuKIoYgkI0tzMJFImbIfkIJZw4=;
	b=AIja0RrRr0JzO8tXcFBxc83l6U2pxNzBO+Q2YY2gKzVvMrf1nY+v4kdm1XaPE4/PGU
	mH0ygq2xW6pNlYaoT5kNQaDvAOj7J0P2SvmUqat8LQmydjWE6TDtiJTpZ0Wr4Q5pJE79
	KUOUpiZ/o8H+wFHkFr65zlM6ZAvQ+/RLHHn7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HijLxyCnTLiHWz45ApuKIoYgkI0tzMJFImbIfkIJZw4=;
	b=jFGYyRL986R7NsqaVl/UIpSuaBY8elGwPugQ8R0nNfjr2JPmudWf6ddSKEF0Q9HgVA
	5KW9ILTNLAxKtBIiQ7oo7R5aSd+Z5g1NGKPEmByv2Y6z8CbDp5G6sN7sYwTDPGx9gJzH
	YACPj1X0KBWQx8MoZmTCQj/hkxaBUD+ex9qqAL2cQ+tcWF5+DmfTmTBI1thakyEea0qm
	oZJR2zdZocjPnbdm0jRSGy4K63bqaKV683ufSF8tLjhI3zk54cH8l8tZrSx+cs8BR9r5
	bDhT60SUbYpjcPwO0z1Ic56U/odBWjzQNd/72OZoU/fmrdnvc8LDa4X8R25ARA/8z7aX
	ga8A==
X-Gm-Message-State: APjAAAWRlhdRqbTTpL5ddFMDTdrGHCd68UmQh+j2wlWRnEhofGk+zcBf
	s3A2gyf8zlYBTxnrxt/xatbl+A==
X-Google-Smtp-Source: APXvYqx3EYQFQPkqBr91pK8CEnQfRFvbkNSQiZ8bv2fSly4+7Gm8n4EM90rXiVVg9Qf7UXqk3kt6og==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr3396022wrp.333.1582632701089; 
	Tue, 25 Feb 2020 04:11:41 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z6sm23730717wrw.36.2020.02.25.04.11.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 04:11:40 -0800 (PST)
Message-ID: <87c5cc0c50a7060f3a38c51103d1a3603bd21843.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gzatko@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 12:11:39 +0000
In-Reply-To: <20200223132257.4867-1-gzatko@gmail.com>
References: <20200223132257.4867-1-gzatko@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: Gregor Zatko <gzatko@zoznam.sk>
Subject: Re: [PATCH] docbook-xml: update recipe to stick with the upstream
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
X-List-Received-Date: Tue, 25 Feb 2020 12:11:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-02-23 at 14:22 +0100, gzatko@gmail.com wrote:
> From: Gregor Zatko <gzatko@zoznam.sk>
> 
> Until now a Debian package has been used as a source.
> This change just switches it to project's upstream.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13270
> 
> Signed-off-by: Gregor Zatko <gzatko@gmail.com>
> ---
>  .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 60 +++++++++----------
>  1 file changed, 29 insertions(+), 31 deletions(-)

I know this was discussed in the bug and the older entries were removed
as a test. Unfortunately this does break builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1851

(so far)

We may need to rethink that.

Cheers,

Richard



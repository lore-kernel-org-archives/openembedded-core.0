Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7204D79AE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 20:56:06 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q18so28975546wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 12:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/b+YKc9pDciQPd2YYUJCTU3g2Kkr2nP1lhGqwW33tqs=;
	b=Xzlr5RZ57iAo2tLCDRVCN+6aBld7kaJ4NV7ZTO3Z6NezJpu1M0Wmnq5Ql+ot0Le065
	pQfgIVHRFJ1fY/SjxBrdEVpr3QzRUfAscsXpWs39NUcH4pQs8z6ogle9MgvOJW5BLvEQ
	N+I8n1i4RLp4Sr9+/NSRm/jm4tesAE3+c3PDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/b+YKc9pDciQPd2YYUJCTU3g2Kkr2nP1lhGqwW33tqs=;
	b=a/JQBwMuUrziQS8GQPoHOB+vmYPAKX7K+eSFAED45t6KA0X3lwmzeOhRU5QtcBEz1x
	Fw0rXQ4e39oNhJ/QY2gRQb5EUgD2girKbCTfccxuQPOcLctkiX2jta+VK3ytcwFdYbfI
	Pln04YUlqeGKxvQVSaGFCQO5Euif7HP5i4aLVfJY65mUDnpJkit1QfGj6wmLM3olVua7
	2VSYmOpF4smdimj9nXQlSpENWVhZWgBgjkUhvQ9rEG16m+3VI/AzlGNILlkxROuEy6G8
	k2Z61A8KERuaB7zPjKAyS3Xyb7sY1fVc3h5xuUbI7CiUrRr/6I7+FmYbZRUCzLTH2svS
	Ei9Q==
X-Gm-Message-State: AJcUukc5evOIoYYAEVZGlQ5svbM4ZC6FmG0VpmBIs9FZO25KWzwCZRjt
	68+yS+cchisynJvX8U/huTb6bmtJpBU=
X-Google-Smtp-Source: ALg8bN6bQ0Ld21i8Brn826NMzUsX3BG2orDfwvsJorwXL8wDc2jYzEahGL3k2x6kplVBbjKnyG4FvQ==
X-Received: by 2002:adf:9168:: with SMTP id j95mr33844457wrj.217.1548190566918;
	Tue, 22 Jan 2019 12:56:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	67sm149529839wra.37.2019.01.22.12.56.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 Jan 2019 12:56:05 -0800 (PST)
Message-ID: <00e28f40c80a0d5411d85acb33754075ad659b51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2019 20:56:04 +0000
In-Reply-To: <88612759fcbff8ec983740eb130002e604329aa1.camel@andred.net>
References: <88612759fcbff8ec983740eb130002e604329aa1.camel@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: sstate siginfo question
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
X-List-Received-Date: Tue, 22 Jan 2019 20:56:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-01-22 at 13:06 +0000, André Draszik wrote:
> Hi,
> 
> I am hoping to optimise some network traffic here a little by
> reducing
> sstate upload to our central server.
> 
> These might be stupid questions on that subject:
> * Are *.tgz.siginfo files without a matching *.tgz useful to be
> shared

They're useful if you need to debug signatures as they link other
sstate hashes together. The system doesn't use them except when
debugging (e.g. dumpsigs/diffsigs).

>   (uploaded to our centra sstate server), or is there no point?
> * which siginfos can be safely avoided to be uploaded? I'd assume all
>   *_rm_work.tgz.siginfo

There probably aren't many but rm_work/clean/cleansstate are pointless.

>   Any others?
> * Can such an approach be feasible?

Not sure it would save much.

The sstate hash equivalence work should be much more promising for
this.

Cheers,

Richard



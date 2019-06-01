Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E4D567E5B7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 21:00:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e16so457784wrn.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 14:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=avdQX5lTyPWoj0N2+xc+w7R+xyGTTP0e+MhzYgmd+Bo=;
	b=RZcDt2gc0meb6L1N9mrE09AYf0JxSyVSv/xpPsDn0520hZVVc/cKvMVMCibSLDRqQG
	E/+XafO2JIMElbw7q6d7dczKl6pvtUx7DA1QCu8JcjUMxMzlexOlefKQ7AmXzhPAlSmM
	jm7SpLolJxCZxF3CiI7HY5EfK7iKzDAJVhO/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=avdQX5lTyPWoj0N2+xc+w7R+xyGTTP0e+MhzYgmd+Bo=;
	b=AdQRo7uVOnofi/AZDdWQ0jOxXgffMIc3DNXnqXM2GYtUH/r6PqdYZib7XM+SaBdEiA
	vcXExZ+bUfy7wM/8bwjop32PXgA5nKv3BzZ2wj6XkUJcJuiFA6ohA/x1GTb8B0QJqUuH
	ef7/dgT4EFr+3FvoLrDsgYfolhDtxYPhm8jfYYRpSq5eduQrAb77ejvF3oKJagKAIBtd
	ITDQvmXBZZUq1bqwUJ9xcCOCpJOCJ4yJV4w/EllkGkkgxFxaxKbZOdJ7MoLGOhifV1fa
	gc45kQgux24Yfqv8Vrp3sBYaLwp6gGTTIplFUdLBZ7g+mSWWLy2+5x3thKgEElbBoHKJ
	W2yA==
X-Gm-Message-State: APjAAAVVZolR9og3AShqH/F5Nx4XoJZJa4LgKeXP1Zb7+geTWrfSuK/H
	YO/yWi6qp+q4zkVxBG9jELeaQg==
X-Google-Smtp-Source: APXvYqzBBV9k9us1tUnF/niwOmyPjKAV8Z1tZ0JXUGiUaSyVrQ6fweORUfRFeTghui236oKxeZkItQ==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr3054206wrv.329.1559422804689; 
	Sat, 01 Jun 2019 14:00:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o21sm10234459wmc.46.2019.06.01.14.00.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 14:00:04 -0700 (PDT)
Message-ID: <bea64728d6e035a2656e5677c1ca1d091606a713.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: bruce.ashfield@gmail.com
Date: Sat, 01 Jun 2019 22:00:03 +0100
In-Reply-To: <20190601184539.15436-1-bruce.ashfield@gmail.com>
References: <20190601184539.15436-1-bruce.ashfield@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto/5.0: fix systemtap on arm
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
X-List-Received-Date: Sat, 01 Jun 2019 21:00:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-06-01 at 14:45 -0400, bruce.ashfield@gmail.com wrote:
> Richard,
> 
> If you apply this on top of my latest consolidated pull request,
> system
> should work out of the box again:
> 
>    root@qemuarm:~# stap --disable-cache -DSTP_NO_VERREL_CHECK
> ./hello.stp
>    WARNING: Kernel function symbol table missing [man
> warning::symbols]
>    [ 1721.562007] Kprobes globally unoptimized
>    [ 1721.617209] stap_2107: loading out-of-tree module taints
> kernel.
>    hello world

Good find, thanks!

I'll requeue things for testing and see how they look. Running on the
autobuilder now.

Cheers,

Richard



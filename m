Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD657F7B1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 17:18:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d16so30796039wre.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 09:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=BG3TzspEG5I6ehusNX/PC78p7n2BNbWCSUViLzbvwqU=;
	b=OW6xtimcw+W3YLjmrTK82qRyUJhx8vU2nuMfbcfclwf4TlTY+/2hfnIkvDitUSBK8k
	cpx2/PWS0XGjc49KWh4JZxXl7vNSk9LUFm7MGC0tVw4TjPSzD6kac065znWXjY3xC6mH
	EYqxhUUEVlg3+A+4vxLQVkqw+bCR5l54Cao04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BG3TzspEG5I6ehusNX/PC78p7n2BNbWCSUViLzbvwqU=;
	b=WBzNeXK6g9y5Yv7+uMbdn7grGj3tHXhqRSVME+yekarH6O7yqXc+VnISqc1XTWtzMd
	L5OM6SopWM7QjMOtHYVNbuRk6RSSmGzQhouxSKGldlAcMIgYvFZQEtq7r6zi7cqA16BF
	J4JbXrcw7JQy7oZ3TuS8DSrV8L5qno1Fg/IsjOMNvy0LeBDzS//a44ixAlLXY+BnopJ5
	mCCDcSLIdDpTyLjmUZv+fNm9dqjmY6piXZZRZyLMe2bBp2cG7N4C2QZbAgNvA9MYYOxT
	2YGQKcJXY7xc4LO1BX/O2rk14gh6AJRIiXotJbyKEcS3FAiTjkds1Qp2Le1nFM2/j6jn
	8EUg==
X-Gm-Message-State: APjAAAVqFvDReM3SnISyv70Sh9eO3vox8/ancGSCE/YgZwGg+3svK/sL
	6Wu2OJPirDsP4jaDB6mMEgV3MZ6AhzM=
X-Google-Smtp-Source: APXvYqxEHzWCFo3URYYGEc21Y86QSBJN5vUyOrPvALynQUlBjh8t/mdi0ngjyo5WoTQcub0NAS4bUA==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr65180709wrn.320.1577639930835;
	Sun, 29 Dec 2019 09:18:50 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 18sm17624980wmf.1.2019.12.29.09.18.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 09:18:50 -0800 (PST)
Message-ID: <157a380729b0bea497ea3a03c3bb006692292a95.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 17:18:49 +0000
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 01/11] elfutils: upgrade 0.177 -> 0.178
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
X-List-Received-Date: Sun, 29 Dec 2019 17:18:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-12-20 at 17:23 +0100, Alexander Kanavin wrote:
> Remove 0007-Fix-control-path-where-we-have-str-as-uninitialized-
> .patch
> as issue fixed upstream.
> 
> Rebase other patches.
> 
> Adjust ptests, pass rate is now 100% again:
> 
> ======================
> All 206 tests passed
> (6 tests were not run)
> ======================
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

I'm guessing a bit but I think somehow this is breaking rpm on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1395

(the libdebuginfod.so reference which is new in this version of
elfutils)

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C097B7D784
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 13:20:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q1so21968656wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 06:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=h1qg9Evxan4G/eEkkxGDSP15LUSPlkqh/4BzuO2lRoE=;
	b=NzSe5xBUh05u1FJ2Ge+HlDP7L8hbI6Kl1BTwjTxBkmDMOIEN67IJFLC82o7SXpVmDj
	0QyZHbc7IBtlPRS8MqkhaAtnqbHRQVsD3pFlm774MeVu0qUeqc1lq+zDr43chyVJ2gEU
	ql0u26vlGPEz/+QaHbQ3jQU5hlgKu7qcm4BNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=h1qg9Evxan4G/eEkkxGDSP15LUSPlkqh/4BzuO2lRoE=;
	b=ZeWAwlaf8Nlckk/B2cx9wPqyZpGS9J5Z14HoQ/fyXQjl8AebTvdn3vwaMKG81yLiJH
	F0U3pMb+9GF5F/8os0vZnlk38RpklJOxsZF1/NkfYalxNBBAY2PUw46I2nKvqCwKPL4u
	tnIlyivROYPhde5AMa6aLZM1X7R70Ro0KEQ68iz888u6/HF7awGWm9BCqT99MxelXMXK
	WlHSIcrQvCXIaLmJ1M+Cv0Bx2LfZSUfdVmvFKgti4+1wK8+oTY6SEVQkXC2TguQrbNKM
	+z6ittCXdNCiAy+MJuIpNUBWffAqaIjORYUZKrUxE1dH7/zbeAv4wWGYdvJ+c5mMmeY/
	2utA==
X-Gm-Message-State: APjAAAXOLVofOv/Zuhrx2+cIMQwVsR2ab/Z+8hwiOp8FtR88/slhReZ4
	BSJBScqGeI3OkYlKPirjn6U32A==
X-Google-Smtp-Source: APXvYqxHVZuuU/qEZQplrduvUm7eBP2yzKHYIjJgizVBAWJPXcpJUcF5JFD3NIhVVm0k+nEV1wqhgw==
X-Received: by 2002:a5d:684e:: with SMTP id o14mr50949545wrw.138.1555334422362;
	Mon, 15 Apr 2019 06:20:22 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s10sm21837594wmh.0.2019.04.15.06.20.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 06:20:21 -0700 (PDT)
Message-ID: <a6d8db1cab09ee762353d355107975a59c74b67e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 14:20:19 +0100
In-Reply-To: <1555060891-180878-1-git-send-email-mingli.yu@windriver.com>
References: <1555060891-180878-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] elfutils: add ptest support
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
X-List-Received-Date: Mon, 15 Apr 2019 13:20:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-04-12 at 17:21 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> Add testsuite-ignore-elflint.diff from debian
> (
> http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
> )
> to fix below ptest failure:
>  | ./run-strip-strmerge.sh: line 33: testrun_on_self_skip: command
> not found
>  | FAIL: run-strip-strmerge.sh
> 
> Add check for gcc for two test cases such as
> run-strip-nothing.sh and run-strip-g.sh which
> depends on gcc at run time.

I'm afraid this doesn't work on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/510

Cheers,

Richard



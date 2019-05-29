Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E118779AE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 21:08:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 15so2473731wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 14:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=EWEi3jd7Jlo6AdNlinvxe7uWn5wUdFQlVt5q8uKJ5i0=;
	b=b3XJqTg4KcivoXcDOPjxWxcQQsbCJVZjMfZ7+f3gZj6SBg0rLeVlmd36jaIm4Z5+U1
	1ORYBuRWMQlnVMGF6DlVw+nFWDIHMU4WFm8rWt+DUcdX6X14fEtGkb+0xyZUivEKsCtO
	cQonj3tv5NjE5SM253HtQouRuYtvuQK1YbgzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EWEi3jd7Jlo6AdNlinvxe7uWn5wUdFQlVt5q8uKJ5i0=;
	b=Vq8hoyiYWdTjdl4i0nNk4q1T9hWpZnahC2OTyxYgzmnrllVSUmOKtBTX/WNJxgWnX7
	CsgsW2B9yHF5ohaS+iDz2I0bn4J7TteHHJB0TWcajwGyGZPknFWuOlTJKo4SESP7za/o
	COdXNXtQ6CvSTPkzDf/cgXI9CnaoS5wzEikthOpcvhFcDlNH8qjqgCzpRid1jWZ9tYcd
	1jYP1QklLQ2j4Psr4eLyTTsFAxyyv7zibAH0NhTTf86+ukvHqTwIxDqJiLmdU4JqY3XR
	mzkW0leE/sMwyX0aUreQJvZElakrzk5mnip/4QuLqWMoRPKzEXwE+F3xg1fontEDLggV
	Xd7Q==
X-Gm-Message-State: APjAAAUHa4WeLt+w+Uzi/Y3jdlrcvyZLnFQuur54h6b8JOMi2Pe3lV87
	7hcVPgwbJzpCZs5X6q+8A+5nxWUn8hQ=
X-Google-Smtp-Source: APXvYqxr5hF8mnhrvsW/+RddQQ59dvzouoq3ePEPub4lJD68UpDcp0YjGGEL3nfY5Ew3DmYyBbZo6Q==
X-Received: by 2002:a7b:c189:: with SMTP id y9mr66523wmi.116.1559164121701;
	Wed, 29 May 2019 14:08:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a124sm732956wmh.3.2019.05.29.14.08.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 14:08:40 -0700 (PDT)
Message-ID: <dce2a365f14750b5635f15b1084a696bbd5b0d63.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2019 22:08:39 +0100
In-Reply-To: <CAMKF1spg=EbGRyrt7KFebScrrqMEk-N3KZNLOn-oFW05Sak1JQ@mail.gmail.com>
References: <20190522234018.30565-1-raj.khem@gmail.com>
	<CAMKF1spg=EbGRyrt7KFebScrrqMEk-N3KZNLOn-oFW05Sak1JQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH V2 1/4] pam_systemd: Include missing.h for secure_getenv
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
X-List-Received-Date: Wed, 29 May 2019 21:08:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-27 at 09:45 -0700, Khem Raj wrote:
> ping^1 for the whole series ..

The maintainers entry disappeared in the second version of the patch
and the series is generally confused in my inbox.

I also have doubts about whether the elfutils changes give functional
binaries which are useful on musl systems.

Could you resend the series please?

Cheers,

Richard



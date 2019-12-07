Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2FD27D1F9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 22:48:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q10so11822491wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2019 14:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=OAhq0Hml03YEfZXh2tfcg0LWTvHP4gRl4/vNaW9B9t8=;
	b=cB45kVhf+W3pDDYMCDT42NmaeThUccbf3gj3F8SBcfgXu5c9MIjP+UlyzI0530EaUq
	UxwV8wNGfhrIxyAqFwIz5WdPK+GmBYHjOBn/MTwJMwf7BpYuewdWfpBx1oZkUfnCzuCn
	9xzgxU92QcGSPMW8gYGNP0ktZK+5dqN3DT8I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OAhq0Hml03YEfZXh2tfcg0LWTvHP4gRl4/vNaW9B9t8=;
	b=VKJTNPYsoTv9Kh7BFcBq66tFGxYRxD39amqr4z67NgCUKgdmqj2XpIvBcF1Qxh7tcn
	ZQaX4klvLqD69qXdkh1wUxtK1HV2u/qMNzpbEBiqXTJPl9/tx7GwuJtET/3K5ds+I/Pf
	w5IuE2fj1Bfs7OAdKnxGv1sLkf2ZxIpL00gW6Ez3XXvBPCm8jkmDf9QQKP+mYoynhFDp
	L56KL7WZKJb+0NutpM8XA0seRmL53i+hXjObV/c2lluxm+6X8OqkcxdouwpSUb/Ez8+3
	s1faoE3F5tMuOD0ixRo3Bz5qpTKqKcz6WQknriePA7LSw4IU35wtMsUd4KjDLqajkhuM
	laOg==
X-Gm-Message-State: APjAAAUN9yWVSSR3ChsRWq//ZEyHZKTBFHJWRTXrYiJLC2e7JCQ9OUQ2
	qpMPqDHmk/RDC7GeX1HkUfCxrQ==
X-Google-Smtp-Source: APXvYqyts8PhEKubOww1IfKF5R4OvKkbGiUsMjg3FHiC7uuubrznjOopUHhTlu1UXkej5W8zMQUgzA==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr22880240wrm.293.1575758894469; 
	Sat, 07 Dec 2019 14:48:14 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 62sm5740133wmb.27.2019.12.07.14.48.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 14:48:13 -0800 (PST)
Message-ID: <2dd45ad42e8ec7a336ef12e4beebb19a6bab2a77.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 07 Dec 2019 22:48:12 +0000
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 01/24] rpm: upgrade to 4.15.1
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
X-List-Received-Date: Sat, 07 Dec 2019 22:48:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-12-05 at 16:43 +0100, Alexander Kanavin wrote:
> Drop patches that were merged upstream.
> 
> 0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> modifies a file that was removed upstream.
> 
> Add a 0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> as unfortunately the new parallel file classification feature from
> upstream trips over somewhere in libmagic when inspected files are
> compressed:
> https://github.com/rpm-software-management/rpm/issues/756
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

This patch series (and your following patches) is showing quite a few
problems. This gives an idea:

http://errors.yoctoproject.org/Errors/Latest/?filter=2cfc5dd223815df65d2001a6a9c352eadf936f94&type=commit&limit=150

I'm going to drop:
* gettext changes (needs testing in isolation)
* python 3.8 (build failures)
* debianutil upgrade (build failure)
* sysklogd upgrade (build failure)
* atk/at-spi2* (build failures)
* rpm upgrade (load of segfaults in do_package_write_rpm in previous build)
* libtasn upgrade (build failure)

so we can at least try and get the simpler pieces sorted out first...

Cheers,

Richard



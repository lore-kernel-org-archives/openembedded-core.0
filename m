Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B36A67E66A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 09:29:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y19so2692599wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=9CgJguwyrRpGY24FD+Bn5qk6Gd3sUmr8+Nket3GXmRk=;
	b=WyCcXRuYk7zs5X4/zPmNzhPr4/t+5tIyuw1TQMVLMuse6XyyiIFbiZ/EixyknmdItI
	UOVW6e1fx3FtIRyHnuj+FPgd4waRgiRfHFheI8XUH4m1SKGOVlf9rIEEhUvgrz7sf4mt
	k/UBrYZUSEFbw69qy07ZzrbCxLmqJMCBECaOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9CgJguwyrRpGY24FD+Bn5qk6Gd3sUmr8+Nket3GXmRk=;
	b=e+6r+lLkvbpm9FG60fOfEjo8QtC3kLXHhsH012N9G2YCLHWIYy1eGJShwwFM7m+Zdb
	hZeGe13srCF42KRhEiCdx0JdHXfeJp8+Zdq7FrZp3vOb/oFN58ZFpYbvi3Xvxo2jl8og
	9nwjD6A9vh1FdTcc916ylR4lxBuyaOMt8YfhUfyk9kwg/4Jg79e3yaCCkm1/efQHEzRs
	9NTaJRzY85sk4mppxltRUGEY63qw7FmIz2LLWJjkhvQ8PtK3Lvm+O4HxUxtshqu68xrT
	Sj4zm/pAAnxsLofvDhbeROP34M53YxrlMnkJZP2R/LrwBHmIArkDUTRm5TSw1YR3XZj2
	CbFQ==
X-Gm-Message-State: APjAAAWjuELf1hy4BcV+Zd/hI85LTnA4muC0flU1soOZURCRaQhu+Xib
	0PgAom0D3Aj2uRr70hkNMlLMeA==
X-Google-Smtp-Source: APXvYqzxABOBq3eWAM68fybdlgKeJKGleSKDifrNmhSc7mZhSWlKjIYy4M137OeNgLztXQ+iQTplyg==
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr10068637wro.106.1567070991384;
	Thu, 29 Aug 2019 02:29:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n12sm2560976wmc.24.2019.08.29.02.29.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 02:29:50 -0700 (PDT)
Message-ID: <28547fae8ada44e4f2383f02bd1d8e0f3ce96b52.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: bruce.ashfield@gmail.com, Jonathan Rajotte
	<jonathan.rajotte-julien@efficios.com>
Date: Thu, 29 Aug 2019 10:29:49 +0100
In-Reply-To: <cover.1565796002.git.bruce.ashfield@gmail.com>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] kernel-yocto: misc build / config changes
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
X-List-Received-Date: Thu, 29 Aug 2019 09:29:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-14 at 11:31 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Hi all,
> 
> This pull request is a collection of smaller fixes that I've been
> collecting
> while I work through the 5.2/5.3 kernel intro, new libc-headers, etc.
> There's
> no reason to make them wait while I finish that work, so here they
> are in a
> single branch.
> 
> There's nothing major here, just a some legwork changes, licensing
> update
> and a short term workaround for embedded host paths in the kernel
> binaries.

There appear to be a few issues with the new headers. ppc looks to have
particular issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/70/builds/976

eudev:

util.lo ../../../eudev-3.2.8/src/shared/sysctl-util.c
| ../../../eudev-3.2.8/src/shared/log.c: In function 'create_log_socket':
| ../../../eudev-3.2.8/src/shared/log.c:123:43: error: 'SO_SNDTIMEO' undeclared (first use in this function); did you mean 'SO_TXTIME'?
|   123 |         (void) setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(tv));
|       |                                           ^~~~~~~~~~~
|       |                                           SO_TXTIME
| ../../../eudev-3.2.8/src/shared/log.c:123:43: note: each undeclared identifier is reported only once for each function it appears in

neard:

../neard-0.16/plugins/p2p.c: In function 'p2p_connect_blocking':
../neard-0.16/plugins/p2p.c:324:33: error: 'SO_RCVTIMEO' undeclared (first use in this function); did you mean 'SO_RCVTIMEO_OLD'?
  324 |  if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, (char *)&timeout,
      |                                 ^~~~~~~~~~~
      |                                 SO_RCVTIMEO_OLD
../neard-0.16/plugins/p2p.c:324:33: note: each undeclared identifier is reported only once for each function it appears in
../neard-0.16/plugins/p2p.c:328:33: error: 'SO_SNDTIMEO' undeclared (first use in this function); did you mean 'SO_TXTIME'?
  328 |  if (setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, (char *)&timeout,
      |                                 ^~~~~~~~~~~
      |                                 SO_TXTIME
../neard-0.16/plugins/p2p.c: In function 'p2p_connect':
../neard-0.16/plugins/p2p.c:555:33: error: 'SO_RCVTIMEO' undeclared (first use in this function); did you mean 'SO_RCVTIMEO_OLD'?
  555 |  if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, (char *)&timeout,
      |                                 ^~~~~~~~~~~
      |                                 SO_RCVTIMEO_OLD
../neard-0.16/plugins/p2p.c:559:33: error: 'SO_SNDTIMEO' undeclared (first use in this function); did you mean 'SO_TXTIME'?
  559 |  if (setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, (char *)&timeout,
      |                                 ^~~~~~~~~~~
      |                                 SO_TXTIME
Makefile:1973: recipe for target 'plugins/src_neard-p2p.o' failed
make[1]: *** [plugins/src_neard-p2p.o] Error 1

and errors from lttng-ust (cc'd Jonathan).

qemuarm is erroring due to /dev/fb0 disappearing, which is probably kernel?

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/975
https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/976
https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/986

and we also have an unintended side effect multilib build failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/995

which might be due to changed dependencies, I need to check into that one further.

Cheers,

Richard




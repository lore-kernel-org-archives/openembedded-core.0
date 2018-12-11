Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8F16A6C4E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 10:42:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f81so1679739wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 02:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=0YEawaBOengcyOAPu4unKppuLYWluiZbQsi385cX7Lc=;
	b=HmtNwO0kIcZa50UCJheVMlm/b1yZQ3AhfdqfNWkSh3yT08nqbdfAGvBlfBYDqDn/lu
	1JI7Q23fwH0tM/lPsC68o0CWkkSPxHjKTATcgnGJtxJgMcFSPqJERZtXQRq478V5zVxx
	GqB+3PthU9X6S66Tb4VmEr52uNv2JYoCXA+XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0YEawaBOengcyOAPu4unKppuLYWluiZbQsi385cX7Lc=;
	b=hadF+bYzIT9U6zt3tepyVvmLhWHIwcEIr6kHGl1bwAIzjd309sxuWRQbUh5hW/693u
	aVShmhWOnCVio7ppEJ19fCnI/1s19P5lIvwTdACLhFP8thQuGOUKHXzB+kidcO9vG4jr
	dvdPDj6mUj2FcVWW03ouGjlzp2hgagy9UOC3mIPbdP2KQAK4+OtqYxvp/MyZE1sxpt50
	NHd2KOmBnKZaexa+2ZE0HhZnQwy+quCW5laH6Ti2pd/dKuw+oznOIe3aVJApWRCxe4eM
	ERrTplJUqtCwor0oxx0rdPiSzc4jFSl4e+MwB9/A9Gck6eZN/5XqsngJ/bjFfsto8XbO
	4nuw==
X-Gm-Message-State: AA+aEWbSViwbbwbnFBBUEVvZ/GwCKJJF4c/rP5nlCYPVa24XaE2MsLz5
	nL7yDAC4Wpw5ercKl9gkcihu7ZoWhA0oCw==
X-Google-Smtp-Source: AFSGD/UnZX1MwCvg0cb0PTw/NWwN3qPbGDAUEWKeFxgi98t92vszFsOVzYGQ0rnkiD3xCrAjOUiwzg==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr1878943wmf.97.1544524971149;
	Tue, 11 Dec 2018 02:42:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q9sm13502339wrp.0.2018.12.11.02.42.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Dec 2018 02:42:50 -0800 (PST)
Message-ID: <ad5b21cd26692c6a74384be336ed27e6592571e4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 10:42:49 +0000
In-Reply-To: <bb74d937-c676-77d2-2258-0db6037fce51@windriver.com>
References: <cover.1544408339.git.liezhi.yang@windriver.com>
	<bb3ede855b1af3d681a1007ccfff34be43cf6c27.1544408339.git.liezhi.yang@windriver.com>
	<37ad7314e33e17f8d20004e609c32fb03b90dfdc.camel@linuxfoundation.org>
	<117c2412-f698-45a5-d82a-e1ee3210ec44@windriver.com>
	<0b4127efa7077e49230199b08757d7aa13fb518a.camel@linuxfoundation.org>
	<bb74d937-c676-77d2-2258-0db6037fce51@windriver.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] base.bbclass: Remove invalid ccache related code
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
X-List-Received-Date: Tue, 11 Dec 2018 10:42:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-12-11 at 18:12 +0800, Robert Yang wrote:
> On 12/11/18 5:44 PM, richard.purdie@linuxfoundation.org wrote:
> > On Tue, 2018-12-11 at 17:24 +0800, Robert Yang wrote:
> > > On 12/10/18 6:29 PM, Richard Purdie wrote:
> > No, that isn't correct :(
> > 
> > The problem is that "gcc" can be linked directly to ccache by the
> > host
> > distro. This means you end up using the host ccache just by calling
> > "gcc". This code is still needed if we want to control ccache and
> > be
> > able to disable it and use ccache-native for determinism.
> 
> I did a test:
> 
> $ ln -s /usr/bin/ccache /folk/lyang1/bin/gcc
> I got errors with/without the code:
> 
> $ bitbake -p
> bb.BBHandledException
> ERROR: Error running gcc  --version:
> 
> $ ls -l tmp/hosttools/gcc
> tmp/hosttools/gcc -> /folk/lyang1/bin/gcc
> 
> $ ls -l /folk/lyang1/bin/gcc
> /folk/lyang1/bin/gcc -> /usr/bin/ccache
> 
> It worked well if I run gcc --version manually:
> $ gcc --version
> gcc (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609
> Copyright (C) 2015 Free Software Foundation, Inc.
> $ echo $?
> 0
> 
> There must be something wrong in such a case. I will fix this later.
> 
> Let's get back to he code:
> 
>              srctool = bb.utils.which(path, tool, executable=True)
>              if "ccache" in srctool:
>                  srctool = bb.utils.which(path, tool,
> executable=True, direction=1)
>              if srctool:
>                  os.symlink(srctool, desttool)
> 
> 
> * If tool == "gcc", then srctool would be gcc, too.
> * If tool == "ccache", then srctool would be ccache, too.
> 
> So I think that the code doesn't help when gcc links to ccache ?

https://www.unix.com/man-page/suse/1/ccache/

When the distros we tested on did this they placed it in something like
bin/ccache/ so the code detects the "ccache" element of the path
returned by which() (something like /usr/bin/ccache/gcc but I don't
remember exactly).

Try using /folk/lyang1/ccache/ or /folk/lyang1/bin/ccache/ in your
example.

Cheers,

Richard






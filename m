Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 687416B061
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 10:31:02 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x10so5082732wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 02:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pEXfjvgXXQHdP7Uz4AGz3fSsj2nMqnhAWLiGSOQGTRI=;
	b=ONZrLa06g5+Mtp6UQvT7RNnmZz6lziRs8MUzOnpa8N19EPBw2BY+V+dpnXZBW5RJZH
	jfBjuXXk3hKUr0y3veTBT9I3NjEdReun4q57tBQYUma6JJQbjD23A7jyr1Ulvb98rGbp
	o8z8NfYTLmtxFdKfS4RAPm0N56Oh4ECnro2c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pEXfjvgXXQHdP7Uz4AGz3fSsj2nMqnhAWLiGSOQGTRI=;
	b=XWLHDVj8oWF7OhL58BC/GJ/Lk2CfJJzq77iPW/XuU8gjK2/bM2qtzdGPFqez+SXBSC
	sdR1WpgecdcZVGZp7kySCeXHL/UognSRYr9wY7K4g2VUBo0mlIJ/pdXldFFHbHFig5TS
	HIQreL2K5301Qe/pqw8JAUNfMtEgnk8GnjiQKt7X7hFQC11bpSFVlVRxkgM4AZwKj2bG
	OikmcRzTkEW8huvtJ2eZxepD8CIuFvsIfqWFR0JPVowixuAN42sNkXtMT02J8UZ4vB3m
	0B9IhhwFwZ6265okhvikuOHZCGyDpjG0cCtLMbl06xiVuqc/PSpmhseLGBhgQ5AGyYQY
	St2Q==
X-Gm-Message-State: AA+aEWbes34Sw2qNm2sK3ZtitPBlMx8TefxA42ITpzzoP7XJbg038xS0
	8Rum50KhIlCU31oaJgAVVgUcXp4hFfM=
X-Google-Smtp-Source: AFSGD/WiX+zdc5VUPa4mKXwy9m1PJSIhsp9DTorgg9OK74dqYWVO0hjR+bFsJjt+5wJnRZBrG6qoVw==
X-Received: by 2002:adf:c6c3:: with SMTP id
	c3-v6mr5056639wrh.243.1542796262702; 
	Wed, 21 Nov 2018 02:31:02 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j33sm13535905wre.91.2018.11.21.02.31.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Nov 2018 02:31:01 -0800 (PST)
Message-ID: <34b4d3a7293b94b628cd20dc274373369d863286.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 10:31:00 +0000
In-Reply-To: <443e9905-4658-ba4b-4138-ab1a4cef99ac@windriver.com>
References: <1542793159-82086-1-git-send-email-zhe.he@windriver.com>
	<a62020398837a76303dfc2b9d880279731d955e9.camel@linuxfoundation.org>
	<443e9905-4658-ba4b-4138-ab1a4cef99ac@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: Re: [PATCH] scripts: Use fixed temporary file instead of pipe for here-doc
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
X-List-Received-Date: Wed, 21 Nov 2018 10:31:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-11-21 at 18:21 +0800, He Zhe wrote:
> 
> On 2018/11/21 18:07, Richard Purdie wrote:
> > On Wed, 2018-11-21 at 17:39 +0800, zhe.he@windriver.com wrote:
> > > From: He Zhe <zhe.he@windriver.com>
> > > 
> > > A workaround for possible "*** Compiler lacks asm-goto support..
> > > Stop."
> > > linux-libc-headers is built by gcc on build machine, which could
> > > not
> > > contain the
> > > fix.
> > > 
> > > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > > ---
> > >  ...-fixed-temporary-file-instead-of-pipe-for.patch | 60
> > > ++++++++++++++++++++++
> > >  .../linux-libc-headers/linux-libc-headers_4.18.bb  |  4 ++
> > >  2 files changed, 64 insertions(+)
> > >  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-
> > > libc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-
> > > pipe-
> > > for.patch
> > 
> > How old is an "old gcc"?
> 
> I put the full explanation in the commit log of the patch inside.

No, you did not. I went and looked at the link (which I had to un-line
wrap) to understand this and the problem is in binutils in the
assembler (as), *not* gcc. Its also not just some "old gcc" but any
current released version of binutils which is quite different.

Please improve the commit message to reference binutils, not gcc,
mention the current version of bintuils (2.31) and that it and all
previous versions have the bug.

Also please set the Upstream-Status correctly.

> The fix below for the bug has not been released from upstream. Since
> there has
> not been gcc-cross when building linux-libc-headers, we have to use
> build
> machine gcc which could not contain the fix for the moment. To work
> around the
> error, we create a fixed temporary file to contain the program being
> tested.
> 
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=
> 2a50366ded329bfb39d387253450c9d5302c3503
> 
> > 
> > If this isn't going upstream, I'm not sure we want to take and
> > carry
> > this either. Unless this is a gcc people would commonly run into
> > I'm
> > tempted not to take this.
> 
> This is a gcc issue, but the fix would not quickly goto versions
> being used
> by users. So this patch is used as a workaround to prevent the
> failure.
> 
> To be specific, we encountered this in docker where the /tmp could be
> rarely used that very low number inode may be allocated and triggers
> the error.

That should also be mentioned in the commit message as that does put it
in a different light.

> > 
> > Also, your patch subject is wrong as this does not change our
> > scripts
> > directory.
> 
> If this is OK, I'll send v2 to change the subject.

Along with the other changes please.

Thanks,

Richard



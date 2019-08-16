Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8C6F7F365
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 21:50:23 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g67so5167922wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ta+yN21MqW2ahvPi2tyzR5J5f7/5ShULGTqX9M3jl5A=;
	b=VaaiOctktdEQR85a7Y4G7ZzJmvtxTrPCCtlUXGF9JylbFNElvj9P0mEYYqk0ETfIwg
	t0eCw3Rlt65jT+mBUNUFGrEl3GPdWfxAejB6squ08iq1189NRakNiXVNif1/jsO9sRb2
	FUOPJtLdGcKZdTQvE0fOMS1zZ3qfBxlBP8GZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ta+yN21MqW2ahvPi2tyzR5J5f7/5ShULGTqX9M3jl5A=;
	b=Hcyu/VY/KkhvCkI/0qUR22xZgBk5gneyjGGulPYGvMxuOL3ElnZ/2RLOog0oeQFII7
	SMvubo9v/e5D/q7L6U0BHk4OVB4m+kjZWOajGlzAzF+IURC/5XdkP4gzuuSpwZSPdw4m
	HnteNTZbZ5QDgCJSbv46Jsb3oqZQkaJtShZX/dDeTo+6nlBtgvXyQt9RHxWdx37nV/c3
	A8MFMztpH8pNPObTCNa/UaCior2Xj9OkKC1ncKzfesyEVu/3wQUzBUBBQuYJQWHN/Mhf
	WjPeok9GPZUPVqvg4114PMPofiAa3LzFEIGTjAJv1KQ1uLqTmLa4kiqr3J8R76bjGQrz
	0obQ==
X-Gm-Message-State: APjAAAU+CaRLCctibBjO4R1pJt98PorJSQjmXOsmUKph5o4AHu3Edjda
	3FKjL0K5YFut1U8rTjop1ujJcQ==
X-Google-Smtp-Source: APXvYqylsBwsuFk3lBBlfkSC7D0wizbU/tsdNdzpmiKpynTD8r2B45Tz+yR0T1HVQSOV95Ph+y1LvA==
X-Received: by 2002:a1c:45:: with SMTP id 66mr8862865wma.40.1565992224370;
	Fri, 16 Aug 2019 14:50:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y7sm4195364wmm.19.2019.08.16.14.50.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 14:50:23 -0700 (PDT)
Message-ID: <4c57097b88e7267dbe2123a844dfe4f014b48342.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 22:50:22 +0100
In-Reply-To: <CAMKF1sqMA37YFn4QRC7-60aKNoADsU7D8asW8Cmzu0zZhCe5iA@mail.gmail.com>
References: <20190816210605.62377-1-jason.wessel@windriver.com>
	<CAMKF1sqc4M-0ykKNhAao+sQk9WXwetqX4P6VLh44ypCv1LZKtA@mail.gmail.com>
	<283ea4a282885878d26308925690e3428a08c841.camel@linuxfoundation.org>
	<CAMKF1sqMA37YFn4QRC7-60aKNoADsU7D8asW8Cmzu0zZhCe5iA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] cross-localedef-native: Add hardlink resolver from util-linux
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
X-List-Received-Date: Fri, 16 Aug 2019 21:50:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-16 at 14:29 -0700, Khem Raj wrote:
> On Fri, Aug 16, 2019 at 2:25 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This was discussed on IRC. We really really want to avoid that as a
> > dependency if we care about build performance. Its really easy to
> > just
> > add that in but the implications are significant :(
> > 
> 
> A captured version of this utility would also mean that we have to
> keep this in sync for bug fixes and security fixes etc. which could
> also be considered as expense, so how much do we lose if util-linux-
> native is brought early into dependency chain?

The tool is being used for a specific purpose at build time. Its not
exposed on target and its use is extremely constrained to a specific
set of files where its behaviour should be deterministic.

As such, yes there are questions about bug fixes and about security but
I don't think its going to be a serious burden. We'd need to carry this
until such times as the host systems we support have hardlink which is
probably a few years out but will arrive.

The impact of having util-linux-native in the dependency graph at this
point is significant. I say that as someone who has done a lot of work
in trimming down the times of our bootstrap process. This is exactly
the kind of dependency I've removed and avoided.

glibc is special in that its the worst choke point on the dependency
graph. Nothing to do with target binaries happens until it is ready and
then gcc-runtime can build. Whilst the locales are split from glibc,
they are still connected in the task graph for packaging purposes so
this is important.

Its been pointed out there are other places where util-linux-native has
crept in, in particular python3-native. My preference would be to
minimise these dependencies rather than use them as a way to justify
adding it here too.

Cheers,

Richard



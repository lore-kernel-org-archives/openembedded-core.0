Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 974D17E262
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:51:41 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f204so3531371wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 08:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=jcistXys5iocJiO0PXIHEr8zFYxGrasd7dWyFNX2wAg=;
	b=Kvc5B5MJFmyqnjsbHnhCWtgk3EQAZdfvVgsZh/8vU9oIP+VR9Z6tDJzrcNZSn9pFK3
	2t+rUPsybTr3usi6AIPWpa5gwfUlb2gmvdB/YD6gbrPfyyeCmcZZ7yrT0y5yc+BnqAzU
	BbtpkaddR7MhC7b1vU65cEaVey0FswXwG0mGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jcistXys5iocJiO0PXIHEr8zFYxGrasd7dWyFNX2wAg=;
	b=Ry01k0yzpANZvgKkhOMfLPBO8ElbJTdatSvyrkKtxMqP1nx4S+HXtN9nkTrPZqomQb
	mzyZJJdzrgL9625SJoEvoxNwSBh0nqK/Hc3Gi8mBJszDyWGF/JDkuVZ31PzcO9kePKTP
	iJ9pjIHT8UP/5QDzPDYr5MmqD+rqIQYOnOmxXJs5/ChOtgNdpMd582nl4/QqVf3UeoBk
	6myY5Fh65J+4C7t5VRjZQwuTpc0/qAIU86YKzTZ+2TbMx8Jn/nlsFHP+RT5r062D1Zlr
	oW6gfxEJigkH7gCPqGoYMKZwW46oEuQvGMfeDZiuR+pVEttpQLGy/uTEsQLzyklnx4Pj
	coKg==
X-Gm-Message-State: APjAAAVKRKOVAi8JVATaQNxV6KGrKc3upqZff5MW0cFNcxkfJJto7uuB
	YpkIDgz0eTqP1lu1dVb7/YE5Lw==
X-Google-Smtp-Source: APXvYqxJt6iGTcv4s4qE1pctTCx6HjHm89K0Nqu4rGUG8B6KsdVbJwdDiW4OHumXQ3QMhiEgz0IH+g==
X-Received: by 2002:a1c:f102:: with SMTP id p2mr3751808wmh.126.1558453902263; 
	Tue, 21 May 2019 08:51:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n15sm23814371wru.67.2019.05.21.08.51.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 21 May 2019 08:51:41 -0700 (PDT)
Message-ID: <a98f26e5f0a5cd5eb0cd0949bc739512d7c5b821.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 May 2019 16:51:40 +0100
In-Reply-To: <CAKmqyKNx0ygQ=0+24x3A8K4HjuZo1oWZ+0dtkd1RCZpKSxSx0A@mail.gmail.com>
References: <20190517235308.4139-1-alistair.francis@wdc.com>
	<5677817951fee18102345b773c66546f550bb3e6.camel@linuxfoundation.org>
	<CAKmqyKNx0ygQ=0+24x3A8K4HjuZo1oWZ+0dtkd1RCZpKSxSx0A@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gdb: Upgrade from 8.2.1 to 8.3
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
X-List-Received-Date: Tue, 21 May 2019 15:51:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-21 at 08:37 -0700, Alistair Francis wrote:
> On Tue, May 21, 2019 at 12:32 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 2019-05-20 19:03:42,463 - oe-selftest - INFO -
> > ===================================================================
> > ===
> > 2019-05-20 19:03:42,463 - oe-selftest - INFO - ERROR:
> > package.PackageTests.test_gdb_hardlink_debug
> > (subunit.RemotedTestCase)
> > 2019-05-20 19:03:42,464 - oe-selftest - INFO - --------------------
> > --------------------------------------------------
> > 2019-05-20 19:03:42,464 - oe-selftest - INFO -
> > testtools.testresult.real._StringException: Traceback (most recent
> > call last):
> >   File "/home/pokybuild/yocto-worker/oe-selftest-
> > ubuntu/build/meta/lib/oeqa/selftest/cases/package.py", line 148, in
> > test_gdb_hardlink_debug
> >     if not gdbtest(qemu, binary):
> >   File "/home/pokybuild/yocto-worker/oe-selftest-
> > ubuntu/build/meta/lib/oeqa/selftest/cases/package.py", line 137, in
> > gdbtest
> >     elif re.match("Breakpoint 1.*hello\.c.*4", l):
> > NameError: name 're' is not defined
> 
> Argh! I ran the tests but it must not have trigger the GDB test. I
> see
> that you fixed it and pushed it to master, thanks for that.

Sorry, I was going to reply that I'd tried the obvious fix and it fixed
so it merged with the other patches it was tested with. I'd got
distracted before I'd done that :(

So yes, its sorted now, thanks!

Cheers,

Richard



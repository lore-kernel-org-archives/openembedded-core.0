Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 993CB6102E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:09:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11so11937866wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 10:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=dWzzpz/dqwiA8SszzWZp/BgrgQM65uQtArSIAJR9B4Q=;
	b=gFGsKx2hXHF3e7KxwKb32c/r0dLQJ4IY+scjzKNaZNp+v2I+3vRDyJmIYwJlLTrs1Q
	i8fVpf/Wjag+4I2NCKObWGNxXzwdLEppgnS/hd+AEbbUe9wq9WiHCU5juXQLdvoH0gMB
	r0tU1ItbqTjjPb1wHkkGWcp99ZNgLZdjwUAms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dWzzpz/dqwiA8SszzWZp/BgrgQM65uQtArSIAJR9B4Q=;
	b=EpkFFyYVXmm25tzHqXgT+tLNPJmCx21IVYASkXXf7LDVOH2JmQ3DKQzDPehfQzK10I
	3LvR96dtLa47j+KbwJAjNWuOWJruoLfcABvuoSQu0BfoVJ9pf24ta0xddK2+df3Ph1Uc
	ZJzkftRGHQ/ALPf7go0o5zW4CrieJFXXMiUY2zFvS0sQU2Y1JGVo+29pg3UYVvHd2bf+
	mDCJXRx3ZawvbMRUCeNyhp3nzBzlCD2Ujv8jxnpwZ4fmURJFSXjP1eVFsp5PPIoyW5WS
	GMlZ/H3m1l085d0cXDu3B1nGmJl+XGUEV4oOBshiW7b3z6jBcMfS4yqTysGIuCeOkraL
	csig==
X-Gm-Message-State: APjAAAXu2IvaMQGTo0pDTrVnTtHJmUGoMsDbwV0gyp9gYjdMeAyceYKo
	N6s81MMIAzF2aMHJP14j6LpOBQ==
X-Google-Smtp-Source: APXvYqyPDdAmvazIy7XveMdK348FjlB0H1DQZ6aTOI0lQ5Z7eGZwo9tiSI6nddBZM+FO2Q9rGkyEIw==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr5068101wrp.17.1581703773280;
	Fri, 14 Feb 2020 10:09:33 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id m9sm7964532wrx.55.2020.02.14.10.09.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 10:09:32 -0800 (PST)
Message-ID: <a5d9f275ebd6cfd6f34b8c3be712ca878c134a28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, He Zhe <zhe.he@windriver.com>
Date: Fri, 14 Feb 2020 18:09:31 +0000
In-Reply-To: <CADkTA4MS5J-xHpucB96HqwxfjMk9zVaRy2i+_vxX8iXSp3UY8A@mail.gmail.com>
References: <20200214035737.9975-1-zhe.he@windriver.com>
	<CADkTA4MS5J-xHpucB96HqwxfjMk9zVaRy2i+_vxX8iXSp3UY8A@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] perf: Correct the substitution of python shebangs
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
X-List-Received-Date: Fri, 14 Feb 2020 18:09:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-14 at 08:18 -0500, Bruce Ashfield wrote:
> On Thu, Feb 13, 2020 at 10:58 PM <zhe.he@windriver.com> wrote:
> > From: He Zhe <zhe.he@windriver.com>
> > 
> > To make the native python3 is always used,
> > 
> > - Use sed one-liner instead
> > - Add substitution for ${S}/scripts/bpf_helpers_doc.py to fix the
> >   following warning.
> > 
> > File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
> > _temp = __import__(name, globals(), locals(), ['build_time_vars'],
> > 0)
> > ModuleNotFoundError: No module named '_sysconfigdata'
> > 
> > This issue is first reported by Joel Stanley <joel@jms.id.au>
> > The sed one-liner is credited to Anuj Mittal <anuj.mittal@intel.com
> > >
> 
> Thanks!
> 
> This looks good to me.

I'm not sure how but with this applied we see breaking kernel module
tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1555
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/275
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1559
(mips/sysvinit, mips/systemd and mips64)

I'll remove this patch from -next and retest see if I can confirm it is
this change somehow.

Cheers,

Richard



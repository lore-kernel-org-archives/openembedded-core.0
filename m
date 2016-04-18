Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 252EE605BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 22:49:52 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id zm5so83287445pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 15:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=SoM0YJGKE5PUvU1wGt0r1a+ueELZWFhAgg8VVHp9imo=;
	b=F/449TaBpIE2cn1w4t1wZQ9TEjf12MqtgYmxHlGN+GcS8CZ2U1gv/tkXiVpmqWipn3
	x9+6vKkVo9EHQCn8+ydPk2nAQhzcV5XfEpUDtM9MsH8F1N6eSKTjQboWaEK6rcXQNXUH
	/awFa5JkHqxBPtQw79IZiaWaduFk9EnCPteFEneQEtOibxdVnTrS48HDCBXOlm7zkpox
	ZBctDWZedypQPngYlxorBzaNBKpxTujUiJpbCYuSHPF01w8hnQdzo+H1Jd2Beg1gYsfj
	h/B7c7ZRC+bpRCQz5yp4irlWpM1ieoB+YVNMK7ZmrNRBAPVk41QJeSBbvgkn1KEXQcnJ
	xoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=SoM0YJGKE5PUvU1wGt0r1a+ueELZWFhAgg8VVHp9imo=;
	b=HuLK/dlUzeQ2zYQY8wsA2aGcukiWn4ZMkTe3prL6eCxiIB6m6r8A0csSUZ1dcOa/XU
	kJQjCTXxr/8iVVsgVCEsaRTKmxC/NN6gzz2m4jrIKexXM/Q9qjASTIxKFbeIgR1LO44v
	qoR2Utb0axjoSTaUllMMoIrXgVP7mEnjnNFgZCfFD9wnrFUJMeWbuDYDzcmwOmY3lvU4
	muvbbdsFrKPv1WWfVcex3jM3sd/+TBcmGiv4jemY0xZAqTEJZame731bviex8BBx699e
	XYCBaMG9uaZma19M1/Y1l30WyNA9RJbbzcgeWXkusulUR52pN56kci6QhtmdS5cNYRPe
	fAQg==
X-Gm-Message-State: AOPr4FUYzSdJZc5SqwCsbmmsO+jUJnqSk4Ej7mJ+3oRBftgNVD2jADOXrTykSZvvx1rshQ==
X-Received: by 10.66.66.77 with SMTP id d13mr53636503pat.75.1461019793370;
	Mon, 18 Apr 2016 15:49:53 -0700 (PDT)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com.
	[209.85.192.182]) by smtp.gmail.com with ESMTPSA id
	a77sm40063183pfj.2.2016.04.18.15.49.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Apr 2016 15:49:52 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f182.google.com with SMTP id 184so85623406pff.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 15:49:51 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.80.10 with SMTP id e10mr53190271pfb.141.1461019791480;
	Mon, 18 Apr 2016 15:49:51 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Mon, 18 Apr 2016 15:49:51 -0700 (PDT)
In-Reply-To: <1461019553.9308.223.camel@linuxfoundation.org>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LaVL04OQaipNFn1hyCGruFZ7itmrxH00i=L+OkcsZexQw@mail.gmail.com>
	<20160325105025.GC2555@jama>
	<1458905339.3073.53.camel@linuxfoundation.org>
	<20160325115503.GE2555@jama>
	<CAP9ODKpZc=zKfUHtbJOJt5sTdXDkrEOMdKOZXBkxPUJCwmxFyg@mail.gmail.com>
	<1461019553.9308.223.camel@linuxfoundation.org>
Date: Mon, 18 Apr 2016 19:49:51 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoNFy_=_q4mCDnr7hCbtKccmjAfwK=4Syrn8pd9UyJs4w@mail.gmail.com>
Message-ID: <CAP9ODKoNFy_=_q4mCDnr7hCbtKccmjAfwK=4Syrn8pd9UyJs4w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Mon, 18 Apr 2016 22:49:53 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 18, 2016 at 7:45 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2016-04-18 at 19:31 -0300, Otavio Salvador wrote:
>> On Fri, Mar 25, 2016 at 8:55 AM, Martin Jansa <martin.jansa@gmail.com
>> > wrote:
>> > Was there some agreement about variable name?
>>
>> meta-qt5 5.6 is using this so we need a final decision if it will be
>> merged or not. I am in favor it as I think it is clear enough.
>
> It was an RFC and I still don't get a good feeling about the names
> used.
>
> I suggested:
>
> PACKAGECONFIG_CONFPARAMS
> or
> PACKAGECONFIG_CONFARGS

I like CONFARGS.

> as it then makes things slightly clearer these things are coming from
> PACKAGECONFIG. We have a namespace which is a bit of a mess and I'd
> prefer to try and improve with new things if we can...
>
> The fact meta-qt5 is already using this is bad, it really shouldn't be.
> We're also very close to the final build of 2.1 right now so this would
> be a very late change :/.

I think it is a safe change but I am fine in postponing it for 2.2. In
this case we need to revert the usage of it in meta-qt5 (which I also
support).

Martin?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


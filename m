Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3156C0ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 13:03:07 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 32so10942231ota.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 05:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=pdfjqAQYHS4AdL4XMt/UZL3SaupLbPD3YS1eRElKCiY=;
	b=ZMeymQBD2m9PpT55ScJ84Pp0t1Wezr+85fkHBosmge0Csi92BDeevZZkDuLWQUAM/7
	h4/z02rQrwY5SbU74uxHgoSmJINQbZdDevtj56VeZif1SIjkp9TuTzmuYyHQYXeyMrcF
	Fpzty5lNNLCvrL7aGKnL35gOHzlc2TyYkrr5MjMxK7RoZ+DC7apQF9jxE7jzQ3rxCmlz
	0MCSWj4Eqx+RwNNK7w6opIolF+3Sj3wGQ/zAhdKe6++J0cxdMkp1o4eYSIzADve/CsLw
	cXjDxQOj8etY1gwJtNlBfXrwcTH8F5guDQMIaex0Im0Zo+Q8l6dGlZIiEXUE04kc1V8N
	SOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=pdfjqAQYHS4AdL4XMt/UZL3SaupLbPD3YS1eRElKCiY=;
	b=mZfTx7n+7J5ZqCM24iKVfeCiEIg/YBEyqDU2LD3gTfAdSIiZY8qPKWrk3Hdu3b/NQG
	O8aHINqM5CDrjC3WniyOrADl5izFznsuDVaTTqmSqbxEDNIEqhYZH2MnvkY77WTW2R2A
	nWAnvnG3VcSHgQMI0JxBtssiqBAHDw2Hj9Z6+HEHGDyGxmVkzpGzED6AO9tkcb6TBXXY
	GYWVNFiq/YPYqs4WxgXwDV4XjZx1yCcHIQB9AhPf6CZlfmIzxYXPIxOf65NfAOL0xOlp
	MVH7gDwpGDUocTSU2SRj2muN5xdNVtMAZC+BjP0zyKXfHgrJ0xm+pgeWsCnqMRqV9mdx
	GT9Q==
X-Gm-Message-State: AHQUAubNhzi+mZBbGxwIvEwy9LkGrn6hizIyUv0+2AWFAhOrNmyLTloc
	aATwjhdaUDYwI6wdItzgisa+W+93IMy62g==
X-Google-Smtp-Source: AHgI3IZkG/qTQd4UKqK1phpJ4Yw5iniphKtgm40wG+enVbqfH4ffONlJGBzU+HD5nEwsgz25lzRupQ==
X-Received: by 2002:a9d:80e:: with SMTP id 14mr4723313oty.108.1551186187609;
	Tue, 26 Feb 2019 05:03:07 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
	[209.85.210.52])
	by smtp.gmail.com with ESMTPSA id i9sm1467185otl.43.2019.02.26.05.03.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Feb 2019 05:03:06 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f52.google.com with SMTP id i5so10954499oto.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 05:03:06 -0800 (PST)
X-Received: by 2002:a9d:4799:: with SMTP id b25mr15409801otf.294.1551186185914;
	Tue, 26 Feb 2019 05:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20190226113559.9398-1-otavio@ossystems.com.br>
	<CANNYZj_XPzrqbSZ7_XmqkwhLYyMgJ_L5J8AUSkkFBjPf-U80mw@mail.gmail.com>
	<CAP9ODKo8P91Ex9Go+pvnphKVUaun3QOjnXwNJTemy4Apt-9ovQ@mail.gmail.com>
	<CANNYZj_X8eJ8uqMpfkCeoSG6i_9Duy08LWgWAGtUBkAMfbAbRg@mail.gmail.com>
In-Reply-To: <CANNYZj_X8eJ8uqMpfkCeoSG6i_9Duy08LWgWAGtUBkAMfbAbRg@mail.gmail.com>
Date: Tue, 26 Feb 2019 10:02:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKprHE672WgZmQyd=XKFJdMm2HVU+uCkTm+AeckY=MdnjA@mail.gmail.com>
Message-ID: <CAP9ODKprHE672WgZmQyd=XKFJdMm2HVU+uCkTm+AeckY=MdnjA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>, "Burton,
	Ross" <ross.burton@intel.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Tue, 26 Feb 2019 13:03:07 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Alexander,

On Tue, Feb 26, 2019 at 9:57 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> On Tue, 26 Feb 2019 at 13:29, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>
> > > I'd rather not deviate from the upstream, and use what the upstream
> > > provides. Especially considering that perl version does have command
> > > line options that the shell version does not, and the difference might
> > > increase in the future:
> > > c_rehash [-old] [-h] [-help] [-v] [dirs...]
> > >
> > > If you really really can't afford perl runtime on the target, and want
> > > the shell version, how about making it a PACKAGECONFIG?
> >
> > Well, the c_rehash has a specific use case and this version is
> > /already/ in use on 1.0 (for both target and native) and on 1.1 for
> > native. If c_rehash is not good enough for use, we should remove it
> > from native as well.
>
> 1.0 version is no longer used in either native or target, 1.1 version
> is used in both cases, as they have the same file name and would then
> clash.
> The native use case is specific and controlled - running
> update-ca-certificates. There is no guarantee that on target the
> utility will not be used from somewhere else, making assumptions that
> are true for perl version, but not true for our shell rewrite.

Really? What forbids me to use the c_rehash native side as part of my
build scripts and tooling? So or it is good enough or it is.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 72D077CA91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 12:28:18 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c18so18221030otl.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WdGUXOw4gcnlMYpJnylZhB1PnRlR0OoACz0i35M6aUI=;
	b=breVkZsue+8yAQYkkG5uvQ6qnf4mJgbzLViSKSZ/8+n9p6Ozep4LJ/FY7e1M/HXn7q
	cd4Wp2xbnnZ4MkRbcIqLj2nLTc70mjdB1oQzXwaQ0XGtvFagnLp1jiMzLhT44LDLVt4W
	3tfjFPDKTvxTKS5wTtBjxuMdxbBQ3WT0gmrBQ/pFrs9gph3m3o0I9qVQHcPo5tie+Dr8
	G3EWOaNssIS5xIWGhDjyG0fJ8+MbrgkQJvEQ5vM9rR/E5b9xRMY/Kf9dkLqAWV79/Ujl
	hBnMQL0gLF1GqwHFLDi+Us9IDbIoeZUu17rGL47ib6BY9pM+uVK1l+6MwBxup6zV4XY4
	2yWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WdGUXOw4gcnlMYpJnylZhB1PnRlR0OoACz0i35M6aUI=;
	b=mDgx/45YL4CREbdtWbXFpkKQi8om/zCb6xOMFz93fxLgHdtdQ7o53ICPAise7Pu41G
	svQgRT4fr7mXQsBkg8aSq83lqJKXMLXbjUseV2eogsXeXcqu0hKpMfI/okVL2mq2/5N+
	2irACWLffjZg1/ZseAZEK63bbNGd8RIwmvmsrRqIeVPHqt1XT9wXczJG65c8CTD3X7hb
	iUipcuPaW5expaI/9p/t4uTSiZS9jxZf+xDSd0K8FAqmnAgpJmYzJc7MsxtcSbDUqVTV
	WYHZtQVvlAXFSO3cKYQDco989dMgI4R2jKVP6pIBC2C+gQIa0a1Whzhn3fNsCa+CrIDa
	TSTA==
X-Gm-Message-State: AHQUAuYzYFV4P/iqwUwrDyVC75qF9LoYnhVpN2HVyvATq05HFjbDywyj
	oiWLXTH4KBygrX+ed19H8gDatKlAPHoZN3Q1QK4=
X-Google-Smtp-Source: AHgI3Ibjo1qD4WMD6fVv65eOm4dRjLCHaQpAanMkgPp5/omb61yQnhOy8fkLaDjsxKpWE/7PaM6B9LGQ/Q7DQeiJgyA=
X-Received: by 2002:aca:4b51:: with SMTP id y78mr5908542oia.88.1550665699290; 
	Wed, 20 Feb 2019 04:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
	<CAMKF1souMyUMczQ+-s_+W2Tomi=Q-7dj7Us1bwQ23rDS5CPx=Q@mail.gmail.com>
	<CANNYZj9Abo0ZeUVq7jgkHLc6rENns=GptXNHq9eN-j_rJ20noA@mail.gmail.com>
	<bd16855764cfba4d700e2be8c8ea7cecbf2dec9e.camel@linuxfoundation.org>
	<CAP9ODKq+MoA6w7e4E=U4Ak6=KjfejBtx+WHmXPmx5mh53cV_HA@mail.gmail.com>
In-Reply-To: <CAP9ODKq+MoA6w7e4E=U4Ak6=KjfejBtx+WHmXPmx5mh53cV_HA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Feb 2019 13:28:07 +0100
Message-ID: <CANNYZj-gepKL-gF5utwLax6PHNAjopEQmz8on=FLpFNAvqTvTQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] mesa: Update 18.1.9 -> 18.3.4
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
X-List-Received-Date: Wed, 20 Feb 2019 12:28:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Feb 2019 at 12:56, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> > On Wed, 2019-02-20 at 08:52 +0100, Alexander Kanavin wrote:
> > > I guess xrandr needs to be in X11_DEPS, this was added in the
> > > original
> > > mega-patch, but overlooked in the split version.
> >
> > There were failures all over the autobuilder from this as well :(
>
> Please provider the links so we fix them.

There is just one issue, Khem's message contains the necessary info:

configure: error: Package requirements (xrandr) were not met:
|
| No package 'xrandr' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you

And my/Anuj's patch already had this fixed. Add 'xrandr' to X11_DEPS please.

Alex


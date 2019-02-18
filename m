Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id C6E6A7C87C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 14:58:12 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n71so28659394ota.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 06:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T1p96iAKnEx+5iC0k1eUbMywPRm0fLPK3AVeTJO/WQY=;
	b=HsoFNO7qzDvkXlcpHRpis/U3nX5eyB3V6kozhSgCRs2hJhtgTslwYNKsJhL8+MywDW
	KnYhJxOuVrPxToVG1rMtxnejtT9GbV6e4uMOFVroWV+E8fmjpwlR7kp8gOFdM1a+j68e
	DBhyhAVj847iRzMuY1RCMGe9XA6kPYzJeiHSiCgt8PHGD23j2mobSciOiJvBKsjBXf9T
	pxfDMLEsNJTikDxK/czCF+ZBFa1X/nJ0+S3cCU5FCg/i+QsaQW4QAzAj79SBxHKlAASy
	SPQQyBXfDYLEcLGjWurMNNYgnqWbBkWAEn4Wcz5Is4gdaSziOYq4JzY2jayFnSp6k3Pp
	RHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T1p96iAKnEx+5iC0k1eUbMywPRm0fLPK3AVeTJO/WQY=;
	b=Cr6NiVTTYiGFrlebg+HdpNB0O3nMLhMIvxQtmkz9VD3ewTWYGKizSrhc/zqSa2+OY6
	oVVmz94gIiXaGaNzGCX4G56Fnic2kCcHT2sAarWKvvT4dhuH5p5Si0zf0FUdHmn0wDtG
	0AB2M3QFHOeGH5I/AIQ9wpaCzmgg9tZu484yAmufPcREoYvgsjkl/EyNdERLTkYb65Ox
	qq/jaOeRQ0mBniFwj5zNczmJShMRsLvACq38GveCFXunJixc4Y/IuY34mTGovozPSdgi
	BQ7IWdpkVR6zfCcytORVSmluGbAZEnMRUOZyAzSQgdd1iOcPJmuTE0CrDfceBP6APZ6X
	WfOA==
X-Gm-Message-State: AHQUAuaUwDue90tuc6B5RLNrqfKuxszALwcJ2xSKxSP0lhY/H+Im2Ebm
	+gxYEl10phZnm++gq70SUyHiSyMphB0m6JCC8YY=
X-Google-Smtp-Source: AHgI3Iai6lc874Ut1RgY+lNNK9Skv9mH9SHSfDeWMbjVJQTXOiBUtPLcBsYmCaFJa2xMhu2ZLhUzVjlaEbhWpfHSajA=
X-Received: by 2002:aca:6206:: with SMTP id w6mr14832717oib.132.1550501893693; 
	Mon, 18 Feb 2019 06:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
	<20190218132948.27668-2-fabio.berton@ossystems.com.br>
	<b44b056e67f02f40a40be9cef5614123b1caf906.camel@linuxfoundation.org>
In-Reply-To: <b44b056e67f02f40a40be9cef5614123b1caf906.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Feb 2019 15:58:01 +0100
Message-ID: <CANNYZj_XPBcXkqEkpkRZNqY6YQZTq0iNOmxa7HJZP77kUUZ_5w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Mon, 18 Feb 2019 14:58:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Feb 2019 at 15:18, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I think you need to leave DRIDRIVERS = "swrast" here or the x86 appends
> wouldn't have swrast listed?
>
> Do we really want to limit the native version to swrast only? This
> seems a fairly major change of behaviour and not what the original code
> was intending?

Currently the native version does not build any dri drivers at all.
This is intentional: mesa-native is used only by virgl, so I made the
most minimal possible configuration for mesa-native so that a) virgl
works; and b) build time is as short as possible.

With the switchover to meson, dri support is enabled only if also at
least one dri driver is enabled. swrast seemed like the best choice.

If/when we have more use cases for mesa-native than virgl, we can add
other bits to the configuration.

Hope this makes sense.

Cheers,
Alex


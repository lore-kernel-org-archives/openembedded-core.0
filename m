Return-Path: <max.oss.09@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2680E775DD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 16:23:53 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id m124so58181625oig.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 08:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hMC6uYopa6cTxqPyKXksHVqS7LdxluwjIo1iBEhva8k=;
	b=GBNYjGDYlWeyCS+Fzr+uixBDJqrAAwEUOlUL/8JFhDMGKqdpX38QRv/BAIcXsWUf8l
	n/QLSiu4CMKcbNJnDN+y3q/j/OSLNVCbPxpKA7FyIaVlZSQTxahEhq8AMZW6+jBnlEsT
	o6WX7cdOnfz2QpOMtGfdwz9Zf6x9IiTjoKix0gCftZzKTrQPp7uPVmVwOwrM7xAA/+NF
	OiR/l6Nvy/oM2huq/Rcgqx1rs35SiVpAxDEk5t7jQ/wv0HS1CPPO9JrclU9ytYG9W0Ud
	F69WrLPglSlzErubtl40PTsf4OQjt7D2CtK2RBdjYxEthLhLGE9tyuaZW3wpDiRGvPsA
	Sf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hMC6uYopa6cTxqPyKXksHVqS7LdxluwjIo1iBEhva8k=;
	b=oku2cjqsSRh98uDS8CN/A32XlgcsWcRuMTGvtY65/eOHqS054YEUNXDb/8vtKfZYK5
	0w95AGgevE9ltvvZl1G0RSNBh1xoSpPoEJ6EOzEdA2Vs71IhVBOE9ghpM6Vn8j5nxxl4
	k/qgCmixo4sh5N9PzyZfLB87dvqz3is9Q0aamRnzfhcj/EcDJKax6YfBhr7oiV9ssvlF
	dsenPgrWSeqDNvxOlzNtrxav2slhsyGLlbMe3JVfC2yUdUAZxoeuw8H6zOnDavaVUz5i
	rjuKtE9qnzPe9zQeSzuoIqqPyS8Z1SeOS/yNE8mmaTAhT7ZGIJSqkXtPzoOy+Pjjz+SV
	7JzQ==
X-Gm-Message-State: AMke39kiOPOTsFOhIUeCNil12Jf0UFqLotelUM3AIXrnYwVmUl1vDGScYAw487lADPi4wTMu6GHFm6fiKrUoHQ==
X-Received: by 10.202.214.79 with SMTP id n76mr1831357oig.142.1488558234920;
	Fri, 03 Mar 2017 08:23:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.2.39 with HTTP; Fri, 3 Mar 2017 08:23:54 -0800 (PST)
In-Reply-To: <cover.1488539819.git.pkj@axis.com>
References: <cover.1488539819.git.pkj@axis.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Fri, 3 Mar 2017 17:23:54 +0100
Message-ID: <CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/5] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Fri, 03 Mar 2017 16:23:54 -0000
Content-Type: text/plain; charset=UTF-8

Hi

2017-03-03 12:17 GMT+01:00 Peter Kjellerstedt <peter.kjellerstedt@axis.com>:

> To circumvent this, I created dummy versions of the tools that always
> fail and placed them in the scripts directory. Thus, if the real tool
> has not been installed in the RSS, the dummy version is used and the
> build fails. For good measures I even output a message that says what
> needs to be corrected in the recipe.
>
> Included is also an update to linux-libc-headers as it apparently
> needs to inherit pkgconfig, which the introduction of the dummy
> version of pkg-config showed.
>

I tried the whole series, i.e. applied on top of openembedded-core,
20c6e87 and bitbake 6fe07ed.

The resulting build failed in linux-libc-headers because it picked up
the dummy script instead of the real pkg-config binary which actually
is installed in the RSS.

run.do_configure has a PATH setting with first ...meta/scripts and
only then the paths to the different RSS directories.

Changing that order in meta/conf/bitbake.conf line 450 fixed this for
me, however I'm unsure of posible sideeffects of that reordering.

Max


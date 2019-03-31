Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFC67CFDE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 16:50:07 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id t81so5337810oig.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IBFUyiD5/C0lUqWiaT2YukWKVwt+EnX/nZ5+DyuVq2Q=;
	b=uJEJAW6R1djvqoBYrM+A4YJTFsftSGGFixPixAIF8TvrR+zpN/iq7p2SQu2Onyv0bI
	XRU0umYAX4zpYPZVuceMb51R2KWArvYcWGT1cwR0eFZa+zoY1D96+FAf9k3bjKzEjPae
	S+MpLacQoHgHxEZgMVOFT/EA+X5qYxhVKaqk2ptSAnoJOMNK+J064m4hvh+RlEb+bijj
	j3HQBefZeoxgJOJx39coCoIJnkvuIQRCS2oNLhdiSvXticuWMTDgeRIRdELNr+qj1Nh5
	jZXur7piZG8mm1AWWecFCtnycEUY60gQmPUGX2yyEbMY3VUEJ+JFIDqNSPaEbOmYt+Sb
	Zfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IBFUyiD5/C0lUqWiaT2YukWKVwt+EnX/nZ5+DyuVq2Q=;
	b=LZZYDJGHG08iAaldJxwNL/iVP29bvzDqmh5Xz6sIAC/brpcWlsyT+7YLrvY1+7TeBI
	IVyHVYMZK3AQxWPef1ynjN5wyBNpgkvyPOhlH6UxSSDc+7ZJR8LDcwHcuUmQ4fVJjc4Z
	SnOioLyHugU9qTzmz6AcumO2FipLU1Y1Konk5sS5vBpsWqBY1iXbqF4+QuXplkHaOf+9
	BNETnPaafRFY1Ix5zs4S6pdZvCTXekKWcZkDOvMCXBSh7cBjCfuaGltzUvDLyIXltwHr
	a6RvcMbMz3cxB2rKJdVtggLBycWoQwzwtzMMJL3U3lu/a22/JthGP3fERTj9KYjDdwl/
	ZlaQ==
X-Gm-Message-State: APjAAAVmeiwUUXUkxW8ymrFRQe1GFijv5zPVMMYPpVByQFAqnmUz48HF
	4UfsqrAZzjTvNQ51dR+mA/ewrTd6cRwSHmwapzJYjg==
X-Google-Smtp-Source: APXvYqxoMSQy5IK1P622NlnDtJlUoUyHBmUh6bpoNn5KfFxMJVTWO2/ksuS6iIlza/nC7UPC9mbk1TQ7psRnGLoPXn4=
X-Received: by 2002:aca:ac94:: with SMTP id
	v142mr10155472oie.135.1554051008226; 
	Sun, 31 Mar 2019 09:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190331154158.19019-1-open.source@oleksandr-kravchuk.com>
	<CANNYZj-JWSZ_oe6qK1xq0nRpwZh+BuOkS8CfX9u1cgj_8oJ7XA@mail.gmail.com>
In-Reply-To: <CANNYZj-JWSZ_oe6qK1xq0nRpwZh+BuOkS8CfX9u1cgj_8oJ7XA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 31 Mar 2019 18:49:56 +0200
Message-ID: <CANNYZj_+ZaZ5GSVhWF=LorsvC2X33bYpD_ERejXRMsU_43LMPg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iproute2: update to 5.0.0
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
X-List-Received-Date: Sun, 31 Mar 2019 16:50:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 Mar 2019 at 18:46, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Sun, 31 Mar 2019 at 17:42, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
> > -According to Kevin Tian:
> > -Upstream-Status: Pending
> > -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > -Signed-off-by: Shane Wang <shane.wang@intel.com>
>
> These lines were lost from the new patch. Which can happen if the
> original patch is malformed :( Can you edit them in please (as the
> commit msg body).

By the way, it's now feature freeze so these updates won't make it
into 2.7 most likely, but don't be discouraged: the patches can be
stashed until the new cycle opens. All effort to keep things current
is appreciated.

Alex


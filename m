Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF107EC95
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 14:56:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so3690975wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=fut4qfFfs3+STHpnLiJxPPALQuLn2RfJyqDoVpzrvhg=;
	b=ek0VzXrLOm7+5MxK3OdOEGW2nW1grqr+anlbMaGhfY8W490oHaMfTkJ+MoxC+Kyvqp
	V6vJnpjS0QnHmuBg0kYR6fQ6Nqc7qncM73BiDD2lkrgoAqaI3/MDyQEokWzUMosOrqBc
	FKnuWtP7FOd3cjFdVTaglRNl/k3K6taBNxQEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fut4qfFfs3+STHpnLiJxPPALQuLn2RfJyqDoVpzrvhg=;
	b=jG4QbKnOJW65mBfw/w5tORa+bVWNgkPQJ9mgmWC73bNDthfyuYEVQFrxZkrv1q+PqN
	BnrGFARS4QOe4krx0GD8rnklUqzhKgSMCvoHpzCjvJo/DqFpwk2pqpNej+C2KULkt1iQ
	dLmeaUg863FCPZru8K+Vb0vZ1P6XPfhNKVkhpb4mioTkrhVXVx3yzQGNskIllwgihenD
	TjTbdeCNIz2gOiUQQamfGtSv186Alxsc8i6oNfbivCNEiF8+fVVleJMSDJFUwYI3o6zb
	h/i3/7nAcu0wVSvPTrMFARAu3fG7j7OLfUI3PZiw2sJwW+XUYe96fzE2zJKtm8rCDJ9o
	/v3g==
X-Gm-Message-State: APjAAAVmdo1agGWOhjU51KaHj1IeMHena+S/9ehYVklHGP6hrU22cCwg
	Kn6aZ6UnGJy/OrotGBYgxdyxMg==
X-Google-Smtp-Source: APXvYqyn1dvJ/0QBWk7F0rQm1AWGBufU7N3SmtniU3k7AsC7Gg62ZplzN9WdTb/w7Gb3ucFSwQ0/Kg==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr5101460wrt.367.1578495396006; 
	Wed, 08 Jan 2020 06:56:36 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w17sm4581210wrt.89.2020.01.08.06.56.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 06:56:34 -0800 (PST)
Message-ID: <876e766eb70a446d43442d50556184dc41408e06.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 08 Jan 2020 14:56:33 +0000
In-Reply-To: <CANNYZj_5W1GsfjBNr+A64m42pvA6w2hK18SwzAxedUpHBYsimA@mail.gmail.com>
References: <20200108065117.4556-1-yi.zhao@windriver.com>
	<CANNYZj90XtZ2Oi2q1u0UU9Z=+o711YQ2T0=URCxK_MdwsT_4RA@mail.gmail.com>
	<0fa2ddf5f8c860dd796addeaa3252db8dc009373.camel@linuxfoundation.org>
	<CANNYZj_5W1GsfjBNr+A64m42pvA6w2hK18SwzAxedUpHBYsimA@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] maintainers.inc: cleanup entries
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
X-List-Received-Date: Wed, 08 Jan 2020 14:56:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-08 at 15:54 +0100, Alexander Kanavin wrote:
> On Wed, 8 Jan 2020 at 15:47, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2020-01-08 at 12:17 +0100, Alexander Kanavin wrote:
> > > Just a note: there is an oe-selftest for this which you can use
> > to
> > > verify that all recipes still have a maintainer listed:
> > > 
> > > oe-selftest -r distrodata.Distrodata.test_maintainers
> > 
> > Perhaps we should extend it to check for recipes which have a
> > maintainer but no recipe? :)
> 
> But how to do that? I know how to iterate over existing recipes, but
> I don't know how to iterate over entries in maintainers.inc, and then
> check whether a recipe exists.

Python for loop over d.keys() and k.startswith(XXX). Not recommended
for speed but quite capable for something like this.

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 95E55745A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 09:53:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id t27so22511220wra.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 01:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+DLYmmgrBjDw//DkcoZ1PkhJ/6rEIOjWKbTgleI+gi0=;
	b=E7aa4gbAO0Xv42yLwBJ8UgtnNaMZuVi/VFDhxzoKAKx9wKKOd/dcLMa0/7j/PrC2/y
	thhlB/v7nqzN2/8ipSSaeGWq7r/gHD2uz954ItFR7M2JqMsLvX1TX4Lwf1d96pvvdDjq
	v5YF4NVx/vWysCyu9Nf+3jj56qfyGLkS2JvWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+DLYmmgrBjDw//DkcoZ1PkhJ/6rEIOjWKbTgleI+gi0=;
	b=tH3cv5fZKyunXXSLaBxjPwGBMkxodkOS5UGUUAN1t0djTl4FxHSdKFfr98dANmxdwO
	VdDc+HTnv4MXk6yAoaS68ZxolvHFJVgnlKixQyUKsGbA+WYlJN5i7v6TzTcT0RcjwdN3
	DV1xaItYyEyJh9uC5DrJL+lO6hMqnP7/nW33GmHHUjBR5t3sEYrT2nomBIU90uVIlaMP
	KtyeVbuhDuAqyLGxIOwTZmvSpCMeJ5DzQKr7vADHD1XlQ/838fhyn8ig5MgDMWkcsgNd
	KQoAUiZpgJo2Z5lcGqHvONdxM8dErYg+PYH1Qp103Ujx2lBNRX1peSsmgWV8K4vjPhVe
	1j1w==
X-Gm-Message-State: AJcUukewjehEgCW/tSOOfq7wrYdyzHBKSJIJ0hCKTLwyrLdCfIDFDbv6
	T2llOARPzeST8PfZDMuN2nUA2w==
X-Google-Smtp-Source: ALg8bN44m0eJmfrT0E8a2bJngV6Gzw9vqjes/+O2qsHBgoPGMcMMdrWixbAeG7F0DQkLMPM1AvVuiQ==
X-Received: by 2002:adf:e891:: with SMTP id d17mr29222832wrm.140.1548064420206;
	Mon, 21 Jan 2019 01:53:40 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w16sm106517880wrp.1.2019.01.21.01.53.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 01:53:39 -0800 (PST)
Message-ID: <adcb2224cfb62745ee54c5f04c1c75ff9d803ed1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2019 09:53:36 +0000
In-Reply-To: <f2b0687b21913c2806aebdb3355a6444649ec08d.1548062956.git.Qi.Chen@windriver.com>
References: <cover.1548062956.git.Qi.Chen@windriver.com>
	<f2b0687b21913c2806aebdb3355a6444649ec08d.1548062956.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] devtool.py: remove fetch results from download directory to avoid failure
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
X-List-Received-Date: Mon, 21 Jan 2019 09:53:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-21 at 17:29 +0800, Chen Qi wrote:
> The fetch results need to be removed from the download directory to
> avoid
> failures like below.
> 
>   Submodule path 'doxyport': checked out
> 'db3e1a6eb8677d3166d90d82c3068689803ce547'
> 
>   fatal: reference is not a tree:
> 67cad692720982ac3cbd99bf1c3421edc69b08f9
>   Unable to checkout '67cad692720982ac3cbd99bf1c3421edc69b08f9' in
> submodule path 'doxygen2jsdoc'
> 
>   ERROR: Function failed: base_do_unpack

I'd like to understand the problem here a bit more. My worry is that
deleting files manually from DL_DIR is bad practise, particularly if
that directory is shared between builds like on our autobuilder.

We've had similar problems with cleansstate since that can also remove
artefacts from the sstate cache which another build may be using. We
can do this only when the sstate directory is not shared.

Cheers,

Richard



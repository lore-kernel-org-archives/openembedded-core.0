Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC65616BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 06:03:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x7so859191wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 22:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ksYapVq4Pzqccp6Mh65nM5o190gkWOJSqnSB38w7nEs=;
	b=A0UaulBznGSxj7OH0QZeXAr2XJQUbW1dKUcDVbxmi8JkwZzTNXlGp82Mv5kw+ntmW6
	yI52iZ4wSDzR3lChzW8xrj94eVkIdl2yrA/L0UokCu9o3vlyc2MKXCiKNGpyXg7YP1rB
	mn1PAm9KOq4KTu8+z61VNDau/nuyis6j/jGhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ksYapVq4Pzqccp6Mh65nM5o190gkWOJSqnSB38w7nEs=;
	b=g/PWAdWGRQqDFWfqmCggmLMTnwMaky8PwW6xYUjTeZdHHM1YOIuHj5YgFaUlyNGLX7
	VpjG6vtykYCEVecfMjY7UYBE5Q15HCEtjzu7CIZtpH9j8GSNq3up8TgjZBvL6ICp9v9J
	k/+iuAfY32eNjIYYAiUwQ5JW3QNvKEJc4swxXLBvQ8+nmM6q9B1XT5fd5AAC6J9kPtFi
	XgiyoAiuwSIpvQrpy5pv4eBTmLfQtF+BUPIunjZr6/fIWqonqiaBDbhdXedt8x1MjXRy
	j7oIZTE8EVQHmXU/e2Acvh0YDjmWXKmWrC91VCkyM8YGLxUHi8MJKZUwpf8xICC8HVlX
	NRMg==
X-Gm-Message-State: ANhLgQ263VXa49Qa/KmiO7USuKD17XoZAtpDPT7pkhtcny6XEFjLiGMY
	eE9nnku+vtMGAqH0d3p7UvaCiA==
X-Google-Smtp-Source: ADFU+vteOfJoYDxaC7iDFM6d/rRPjuNTDFZwUF5HzEazZgiIhtPjX2BocpWfyfIyMqENVWRrAyXZOA==
X-Received: by 2002:adf:e98f:: with SMTP id h15mr2221163wrm.263.1583301787948; 
	Tue, 03 Mar 2020 22:03:07 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k126sm2337526wme.4.2020.03.03.22.03.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 22:03:07 -0800 (PST)
Message-ID: <58536cd2e8f56acd7f52637ab80cac88a6102e6d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	=?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Date: Wed, 04 Mar 2020 06:03:05 +0000
In-Reply-To: <CAP9ODKrAAyFCwOtAiQ+ziT09gwV3qp4QwmH49inXNE6NS3Hriw@mail.gmail.com>
References: <20200303160513.17645-1-git@andred.net>
	<20200303160513.17645-4-git@andred.net>
	<aec561f0ad71112c5a86a826653123369a0ef647.camel@andred.net>
	<CAP9ODKrAAyFCwOtAiQ+ziT09gwV3qp4QwmH49inXNE6NS3Hriw@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] reproducible: try to ensure reproducible xz archives
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
X-List-Received-Date: Wed, 04 Mar 2020 06:03:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-03-03 at 21:31 -0300, Otavio Salvador wrote:
> On Tue, Mar 3, 2020 at 1:08 PM André Draszik <git@andred.net> wrote:
> > On Tue, 2020-03-03 at 16:05 +0000, André Draszik wrote:
> > In an ideal world, it'd parse the output of xz --verbose --verbose, 
> > to catch
> > all possible ways people might be adjusting the thread limit, but
> > that's
> > non-trivial.
> 
> Couldn't we just "enforce" at least two threads? It is quite unlikely
> we ever use OE on a single core machine (as it'd take few years to
> finish the build hehe) it seems like a reasonable assumption.

An earlier patch does, unless you actually set XZ_THREADS = "1". If you
do that, things are still reproducible in that the output will be
consistent, just not with any other value of XZ_THREADS. So I think we
should be fine without this patch.

Cheers,

Richard



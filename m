Return-Path: <scott.murray@konsulko.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 041457E28B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 23:20:45 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id b19so6239899iob.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 16:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version;
	bh=Tmdb0UL2ZU8KgIYnH8XB6AD3VCGpG/qGB0EmhNJNVdc=;
	b=Prmdlucq0qSv5GV284TEPRZTPmf1ag6yq/wPnO7V8+36nw9beInXZccCtfl2oHBuia
	+OBGYEWf62CrbJdlv1jTnMMVBChGY8gfuRJzJg56++xzS2hj2EP1O5GEhXpd8eNYEoJ/
	odYliwK/YTsNeiqFdg/HiJPHqhvm0MDfMXDPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
	:references:user-agent:mime-version;
	bh=Tmdb0UL2ZU8KgIYnH8XB6AD3VCGpG/qGB0EmhNJNVdc=;
	b=PDzqsNPVclLTouvyws+02n4RuSfs77sWAK19TdEVQcF1nJya9Mj+OpR3CzXnmni53m
	LrSJh3XrVcIREvP8KnLVunOyLY81UVY8yT59GXeN1DMYNNk+Lz6vs/SRINbm7foLtrvq
	jDAnoDSOe0SsJTboLDI/j0T+qkUP3069meSkIQx2xkuczg5cokb6GhEs9DpxSzVhLZTt
	FLM/pqXIrNfocL+YOdyte8Rk5udIbluXEibq62iyqNFMiGrv3RwcczgDRFS5umxTTxHG
	Wc2q5G+dTietG8siZ9BUzNLJhNxzGoTEIEEAdM/b/qW6TNX7c9agaFh3GYGqs9W+FYEG
	OJMg==
X-Gm-Message-State: APjAAAW/FEHeHox67hiQeavx6slf8EyW8kPhkCGiyE8MzgEzvwY0MEYh
	EfIhE3DXEZZrypJuttzNV2xOHY0nGxc=
X-Google-Smtp-Source: APXvYqy5ZtbtvmE6XWOd2cI/Rnh1mM2VkUreESnocVGXf/oGgazmnz65RdsPYvRBUj1z+M0U48Mvqg==
X-Received: by 2002:a6b:b291:: with SMTP id b139mr2796198iof.281.1568416847044;
	Fri, 13 Sep 2019 16:20:47 -0700 (PDT)
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
	by smtp.gmail.com with ESMTPSA id
	x5sm24408481ior.46.2019.09.13.16.20.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 16:20:46 -0700 (PDT)
Date: Fri, 13 Sep 2019 19:20:45 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
X-X-Sender: scottm@godzilla.spiteful.org
To: akuster808 <akuster808@gmail.com>
In-Reply-To: <01f9c9d2-619e-b365-8b52-7e844d424d50@gmail.com>
Message-ID: <alpine.LFD.2.21.1909131917180.5588@godzilla.spiteful.org>
References: <20190913215809.34402-1-scott.murray@konsulko.com>
	<20190913221123.GA31095@localhost>
	<alpine.LFD.2.21.1909131822190.5588@godzilla.spiteful.org>
	<01f9c9d2-619e-b365-8b52-7e844d424d50@gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH v2] systemd: upgrade to 243
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
X-List-Received-Date: Fri, 13 Sep 2019 23:20:46 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Sep 2019, akuster808 wrote:

> On 9/13/19 3:28 PM, Scott Murray wrote:
> > On Sat, 14 Sep 2019, Adrian Bunk wrote:
> >
> >> On Fri, Sep 13, 2019 at 05:58:09PM -0400, Scott Murray wrote:
[snip]
>
> When your happy with the series, I will through it on AB this weekend
> for a testrun.
>
> let me know.

Okay, I've sent a v3 with the two musl patches updated per Adrian's
notes.

Thanks,

Scott



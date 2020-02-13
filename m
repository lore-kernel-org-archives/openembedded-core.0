Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6D59E60C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 15:27:19 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a9so7216194wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 07:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4vY7LdaN5JgKnose/v9722wzstY6JS5vLcCUsyaiYdw=;
	b=PeHoLihU4DCh68ZdU3aSi5e4sUIgOOohWe+dP5PWEcuMzMQ6QrbW4DzyxuZ4mgfvdF
	ejGmmTIATqWXqsiaZWxj+jKy3I/fQcvGe+YY53gtgDnbvQZ9DuxfV+c865G0OfV4O4Q/
	ny0MQCgGiAkWejMng1Lu6V5+uzcEArvNQWsws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4vY7LdaN5JgKnose/v9722wzstY6JS5vLcCUsyaiYdw=;
	b=jfqL2ULAsoSr9LRrTO6uyhhiuD5IS3E06dv1bVWwwcpYomD4G4gsRvvuwftEMJB1lt
	VhIr6m8CJgjb6PcLv55cKNgB3OHHPQ7rnCxloKeSOuEHtI6jkeAL8u9nsIyCA7hdIsMn
	lR+j/mSnd+iXKP0L78HgtKYaQR8GJiWBScPjBYqQJcnT0mZI39nQ9f1OYsQbUwceYZJ7
	nFafVY0crLJK3eATTSC0eWkLbyBy0N6bafMjjTQVUzH0tI65pG9TeV47IEc3NgXcp98o
	kqzqmDQ9OYLFOWMoxkqHAwjW3kEaSMlPKYKDPghMa9MOyCIG5QGG792K7fgUU1Ux2bN9
	DqTw==
X-Gm-Message-State: APjAAAVdV+vxzB1kZLv0oB0GTFfSdUy+CBaOXKnLqwWB948L+NiWuSil
	zB/NGJJ7DyitQ/9D0T0t7aE6FQ==
X-Google-Smtp-Source: APXvYqzpye2h7kTEB9IKWqMs4+WMVdKPE56XjQobxYdz7TJxetX9S2HNyn+QtF2L1hjDVZV5LRTTuA==
X-Received: by 2002:a05:600c:2c44:: with SMTP id
	r4mr6265816wmg.140.1581607640003; 
	Thu, 13 Feb 2020 07:27:20 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y139sm3523532wmd.24.2020.02.13.07.27.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 07:27:19 -0800 (PST)
Message-ID: <928575d17e93b117b6f555d674089560161d6c97.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Maxime =?ISO-8859-1?Q?Roussin-B=E9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Thu, 13 Feb 2020 15:27:17 +0000
In-Reply-To: <CAE=T-s6CdNNZjqitGhYrAV8EiufQrPZJY8JLTmnPAEHC-sSHbQ@mail.gmail.com>
References: <20200210214211.2696-1-maxime.roussinbelanger@gmail.com>
	<fea6b9336e34c7df3cd23217cf2715b04fbd9ae6.camel@linuxfoundation.org>
	<CAE=T-s6CdNNZjqitGhYrAV8EiufQrPZJY8JLTmnPAEHC-sSHbQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant: add virtual supplicant
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
X-List-Received-Date: Thu, 13 Feb 2020 15:27:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-02-13 at 10:22 -0500, Maxime Roussin-Bélanger wrote:
> On Thu, Feb 13, 2020 at 9:24 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > I know its not easy to understand but we don't support virtual/* 
> > names in the runtime namespace, only the build time one
> > (PROVIDES/DEPENDS).
> > Grep for VIRTUAL-RUNTIME to see how we handle this (its ugly I
> know).
> 
> Hmm interesting! 
> 
> If I follow correctly that's mean I have to create:
> 
> VIRTUAL-RUNTIME_wireless-daemon and then people can override it.

Correct.

> If the (R)DEPENDS on a recipe change depending on the wireless daemon
> that
> was chosen(i.e. connman), do you handle it with d.getVar and
> d.setVar("DEPENDS... inside a 
> anonymous python function inside the recipe?
> 
> The packageconfig would like this ?
> 
> PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, ${VIRTUAL-
> RUNTIME_wireless-daemon}, ${VIRTUAL-RUNTIME_wireless-daemon}"
> 
> Example:
> 
> if VIRTUAL-RUNTIME_wireless-daemon == "iwd":
>     DEPENDS += "iwd"
>     EXTRA_OECONF += "--enable-iwd"
> elif VIRTUAL-RUNTIME_wireless-daemon == "wpa-supplicant":
>     DEPENDS += "wpa-supplicant"

At this point it suggests they're not interchangeable and therefore not
simple runtime switchable dependencies.

The closest analogy is the "ld-is-gold" DISTRO_FEATURE when you have
something that isn't compatible like this.

Cheers,

Richard



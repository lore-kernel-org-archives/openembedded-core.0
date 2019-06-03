Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CBA5C7E320
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 14:17:31 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e16so4019813wrn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 07:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=YuNRAIsVwY9QYecNa0Uri3hqTn9IR+JuPKKxf3nsiXw=;
	b=ZOTGhevXW2TkaGN0XY2+qWizZm6AyHvW6qG+M8MqpOmPBPgOcZ2MNgWBOPvUfb3scU
	SEYHVxRRWzUNStDZPK1W+sxur26BVzcgKorHmYxjmUpxcPqS8Z9cxIEBKsg9lJOSeEmy
	VEj1HZ7wnMYGdK+6CRKGK0FcJAQW/NDRBufI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YuNRAIsVwY9QYecNa0Uri3hqTn9IR+JuPKKxf3nsiXw=;
	b=ElscPVUi0ZXK985Ap9raxDtiJawaDExctV2PIse1amDB1EL5PxW56yYKCahfEGNQ/D
	mdvmlDZqEh5ADwwLWuA0UQTmnUkgJBIB4Y8bCVWfyKgFTIn/SHtUFh+KsIx22V2gYI3I
	FpikK6tIVuQjHlKftQvRT8PkH1x8k7rBetqMdiLw765UYPZWbrtiVaiWscqR/10WPlIA
	ek94JKuDEZf42S0fMcs1c74p+uQ8bwk6mpNxBypiDrDhcdow2BN37a/MsvyrbLj5nJjV
	p8UHEegsH8/VixqTfO8tomFydaa4QFz7zyItFzwc1BZ2Bidytf33uqTUgwSwOAsGySMg
	oHFA==
X-Gm-Message-State: APjAAAUFpFLz0zJEtN3swKkiouHd9+dl4vV3JgcASMjQPkixps55wyTU
	stoWdgxLxzFmQnTBRGYyA5ph8A==
X-Google-Smtp-Source: APXvYqw+othb6fK5N2X9LYT77K8hS30FFc7To61Ebh4+LDN/V+WAzE/sKsxesdutFKwlseg8+GxgDA==
X-Received: by 2002:adf:efc3:: with SMTP id i3mr1164487wrp.45.1559571452516;
	Mon, 03 Jun 2019 07:17:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id p2sm5282717wrx.90.2019.06.03.07.17.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 07:17:31 -0700 (PDT)
Message-ID: <97abec3482ffe9b87955eb9a1715f81213589601.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philippe Normand <philn@igalia.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 03 Jun 2019 15:17:30 +0100
In-Reply-To: <c716be4355dd149975d466b2d9b4c47ea38f0002.camel@igalia.com>
References: <c716be4355dd149975d466b2d9b4c47ea38f0002.camel@igalia.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: GStreamer recipes migration to Meson and _git.bb recipes?
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
X-List-Received-Date: Mon, 03 Jun 2019 14:17:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-03 at 14:46 +0100, Philippe Normand wrote:
> Hi folks,
> 
> It would be convenient to have _git.bb GStreamer recipes, for
> development purposes. There were some in the past but they were not
> very well maintained and they had outdated SRCREVs. Would it be
> acceptable to include _git.bb recipes relying on ${AUTOREV} in the
> tree?
> 
> We also plan to migrate the recipes to Meson, especially because the
> autotools build will be removed from GStreamer upstream, most
> probably
> before the 1.18 stable release.

We don't have AUTOREV by default since it means network access and the
system needs to be able to work without that.

What I'd love to see is someone finishing Ross' work here:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/gitup&id=56a7f12c3175f5a29fdaa9a6939919d7cf586a8c

i.e. a class which allows one recipe to support a git and tarball
version.

We could bring back poky-bleeding which set AUTOREV versions in
combination with that.

Cheers,

Richard



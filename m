Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 18F7F6B06C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 08:09:11 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id u200so1333914ywu.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 00:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xJukuL7Wxd3yjGRqrdQgMoxttzPFIgesBxQaGdZcjcU=;
	b=BSn00EkA2lSlIF6qwfMr4gqH7ZqRKzVXAaMvAWsOA+mODXc6qLPa1VP5hSTGxg2CEf
	M+U3CgDk8DJA1exjJEpmqxTsZCdpfh/5waElT/U8kElv57FkGRxwRUmGwXdgsT7pca30
	OnHnflu7fyEX1J/i61laKwi39L9bvGqyJCCzbJyay0BQHM/mpTP69Ls7yLf6L9BG9evG
	9nGhFaO1bqJwVD4cRdCF0uDOm1v3D1CG0JJJ9vfi+bSh7vUeRR84QJ+YpW0fk3EpNfNS
	ApxEMm5eiy4zKLRWG3FpgrUdiZOW62KWP0YCvDeNO4EgOEegaTeCgk+5jZJrfAK4HyqB
	wUwA==
X-Gm-Message-State: AHQUAuY/9cMlrKslo9iN4tl/x+5xii5OeCPY7jStYf/e2UfJa19zR0uz
	257PLnI57AXfxLuBRJHLIGFj03IJ
X-Google-Smtp-Source: AHgI3Ia6BOf/4dAZsUY+daONqRD0A6C/4N24RMltQXWcT8hNV326mBn7jhPRNX/py51QsZxeIzlHLA==
X-Received: by 2002:a81:ac15:: with SMTP id k21mr2800052ywh.460.1549354152652; 
	Tue, 05 Feb 2019 00:09:12 -0800 (PST)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	n65sm233469ywc.107.2019.02.05.00.09.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 00:09:11 -0800 (PST)
Message-ID: <500d8543dd2a0df45239cb6b1b8da75d76a1255d.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 05 Feb 2019 08:09:09 +0000
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v6 00/13] util-linux: one package per binary
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
X-List-Received-Date: Tue, 05 Feb 2019 08:09:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-02-05 at 02:32 +0000, André Draszik wrote:
> v6:
> 
> This version now also builds nativesdk-util-linux fine for me.
> 
> * introduce patch 04: util-linux: fix packaging nativesdk-util-linux-lib*
>   - this is to fix nativesdk build failures triggered by later patches
> * update patch 10: util-linux: simplify meta-package RDEPENDS /
> RRECOMMENDS
>   - make sure to walk each bindir only once, to better
>     support nativesdk and usrmerge builds
> * update patch 13: util-linux: final cleanup
>   - commit message updated

* introduce patch 01: update-alternatives: correctly escape PATHs when updating FILES_${PN}
  - this one is also new

> 
> Cheers,
> André
> 
> 



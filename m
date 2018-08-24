Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 65CFC795F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:01:51 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id w11-v6so7387166iob.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 08:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ycD9ssamJfyI58tD57H1wOQoRIxrsw4+4gHAgQ3Ax70=;
	b=MZEKdYbf1NEYJ5QuM0qm/dTJAG+Xbm+4J80QDSjS+WZM2T5og0jkYUa3tXy/D9aOyS
	7tw0LgoSEjge/GEtVitSQ3/cfGPkXWjsMVd/NaBLz42bZwzhcXFGFkZfjm3Wb7wsBT9R
	KVPHK+FkCkA+oqimLOEcLlwAiRcOo21dflHT27RH8Pul26GNV6WI3Srx2Vvyfk4FH1Sg
	ls0kSp2kXn/EhX92VuXeWZRjSnj8JZQnPXipO9qdQtU0c6/fZ1yXSxbTjyVg4Zm7VVOm
	iOJlT6Kqxxx+v0OnlzBArKxoIyO/z3gWnKmRVwmxX3WkBW7DIyXSJyuffz/fj0KMawoM
	Lwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ycD9ssamJfyI58tD57H1wOQoRIxrsw4+4gHAgQ3Ax70=;
	b=OM3kobQ2577Ec/JT+yk/o3pcnbWOnGP2f03PBdESx7gin66WT1Jj2cV/PZNM9STzzh
	juj4nt+H7Jkk6UDOH/ATsZvvBSQHW4knlmJivDJE7gVs9XGQaL8mMhOuwJ84GSECwO0H
	rB2qnOdlqY8mFqh7+0ITRd1B3XyUnaQT6eT0abssTPfN2ijB8b1DvBSSwU6h2gaMg/sd
	/CDP0wrAMK91X6hNNLLPoSGJlkHMmwrtXMaewwafxJIluPpVB7jWnvECkzjWNta7KGcR
	rw5TkbbuV5sqFkTWf31JTRoaoPFUZRh0c4QvONJ6eXbqFe+0uo59PEroNCkDw6e/u9Tr
	reLQ==
X-Gm-Message-State: APzg51DIoyEZwXWGx+nbzpJM76Jb47/tWY+I+teWE/e2Q1Sovov0offT
	Ww0vmRxnexjdRMyxx6yxxeQT6hQT
X-Google-Smtp-Source: ANB0VdbNHbTJRahXG/B+BG3C7YEp/qApRqxzeHQqyQBtrZHGMWYtWd9TDaGM+0YaGNEWrSuCbasrNg==
X-Received: by 2002:a6b:cac3:: with SMTP id
	a186-v6mr1559898iog.116.1535122912208; 
	Fri, 24 Aug 2018 08:01:52 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	j14-v6sm2397713ioa.37.2018.08.24.08.01.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 Aug 2018 08:01:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <3ecc5eaa5b552bf06cfd88434d90bc3d0a89926d.camel@gmail.com>
To: openembedded-core@lists.openembedded.org, Armin Kuster
	<akuster808@gmail.com>
Date: Fri, 24 Aug 2018 10:01:51 -0500
In-Reply-To: <20180823212437.10711-1-JPEWhacker@gmail.com>
References: <20180823212437.10711-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Subject: Re: [PATCH] swig: Remove superfluous python dependency
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
X-List-Received-Date: Fri, 24 Aug 2018 15:01:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Armin,

Could you please backport this to sumo now that is has been accepted to
master (409c8a32659ac707d427cd4cdcd105eb17d6f733)?

Thanks.

On Thu, 2018-08-23 at 16:24 -0500, Joshua Watt wrote:
> The actual dependency on native Python and is handled by inheriting
> python3native
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-devtools/swig/swig.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-
> devtools/swig/swig.inc
> index bf61b02d6fb..aec544997f9 100644
> --- a/meta/recipes-devtools/swig/swig.inc
> +++ b/meta/recipes-devtools/swig/swig.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a
> 7dde4c846626b08fc6 \
>  
>  SECTION = "devel"
>  
> -DEPENDS = "libpcre python3"
> +DEPENDS = "libpcre"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
>  
-- 
Joshua Watt <JPEWhacker@gmail.com>


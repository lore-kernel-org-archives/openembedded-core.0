Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3A31A609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 22:44:31 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id f51so8503540qge.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 15:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RtfLOvu4c2/Et6ax3axviDJdBHey3Bx8Coo2v0lmPns=;
	b=hN6Hij1WrLD1pLKatCdRQvkRVIuoVQnvl63qJ6BzugsMmpS6C8HvuDDjNOB6/a3/13
	gM7bDvy8PzurmELNKFTx16wBzJO3l3TkKVnt0kXoUneQVlEKC9xeMIDG1EtatS1cLsFB
	PjLVLBKdnS9NDQ49NMJREB+sLmVTbyzUSL0s1hfShHA1x+6CvHC3LQNcLqjQtZzM4FV1
	gc8nrBKIqfq/Z27GBZQFlE8VwcIQlqUkMv/LcgP5yp2JeqjfxJUIs5yh/JQklpIbMn+h
	yRHF/SiGnDan/VwpMJ+y1z/oLSKdS8dc1vIPVs+g4Vs2uCMilBICmRSrh+gHtZQONmzw
	HZIg==
X-Gm-Message-State: ALoCoQkDfDHFqjCuFtSGFpDe3GfzobvEay0J3DoycW147KDKm7PAUklq+rF8ZNO5yAqXLeJAjJjE
X-Received: by 10.224.103.65 with SMTP id j1mr23925991qao.17.1411685072983;
	Thu, 25 Sep 2014 15:44:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 25 Sep 2014 15:44:12 -0700 (PDT)
In-Reply-To: <20140925192722.GP25706@jama>
References: <cover.1403654908.git.sgw@linux.intel.com>
	<e33bb2eefbdda30378a55346ff60fb0fb90baff2.1403654908.git.sgw@linux.intel.com>
	<20140925192722.GP25706@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Sep 2014 23:44:12 +0100
Message-ID: <CAJTo0LYDznT=8Q5LO7isxbcb2zpLhGBr6xh1SWPN07ipYMgogw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/10] curl: Convert CURLGNUTL to PACKAGECONFIG
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
X-List-Received-Date: Thu, 25 Sep 2014 22:44:32 -0000
Content-Type: text/plain; charset=UTF-8

On 25 September 2014 20:27, Martin Jansa <martin.jansa@gmail.com> wrote:
> Can you look into this floating dependency?
>
> curl-7.37.1: libcurl rdepends on rtmpdump, but it isn't a build dependency? [build-deps]

Thanks for the heads up, patch incoming.

Ross


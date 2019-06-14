Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D89817E99B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 16:23:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so3150023wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=rgr8WpZsZTOTOdL9CsRkBPg7qmcC1tHgRZNgn4NSS88=;
	b=R+r+f+8KlfZ3BmGMiW0M04v+l2+72dB09WvfHAScAGowCxoA7JTiVjit1AAa2717F8
	5Ir0UMkFOn3ucZ3yqeX0WcfzYixFdu6S/E0ibmk7HDi/5GXxiru/zSGfKGYQ/2lIFkNE
	0ZLGgJwZ3o6Vqqwis7SaqfHL11JWRVqWDqqlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rgr8WpZsZTOTOdL9CsRkBPg7qmcC1tHgRZNgn4NSS88=;
	b=EyR/+r/2G+VTZaJXFWFrtyaMQSkERDcLt5RtSQbEBmXzieWpUzBSyTjfwCXVuGjGiN
	D8cCdmyamuMrjMPLn9MtmpDx4nXBmWq8h/VPq8vjM+LR97LPkZThF7oLuxeJYdG6IoOT
	OMvEyM+C49obVG6L8PbItuUL+Ff/KS5c5JSVLDiEMhMoZDRQYI/gINOocoIDN/iWhdDH
	yr926qX6s7B3LgjXsGT5RN+9JkUGfIllBvJmYHT5oLlkI4DS8+rOwvGCUPGFkkibz1LY
	y9DNGELGL+jk75EvBhP10q36W1U/iNr50q2gmVvR0CDM1dGU+PQUlpGy0OmDzGXgBCTn
	xAIw==
X-Gm-Message-State: APjAAAUPKYDYZQ7Tp8leGaXg/EMkTSzL2dWfzJ78Y8KEHPKK70J6B77i
	gQe45CPIrnAxC2FswNW0pfbt65Fwg4c=
X-Google-Smtp-Source: APXvYqy2R0EmVrJc+LV/WpB5I9vLb0E9glKqmrLSkaynNCBNuR9gz2eKB3VL5wBNY5bix2v0BW9jnA==
X-Received: by 2002:adf:e301:: with SMTP id b1mr13909759wrj.304.1560529430450; 
	Fri, 14 Jun 2019 09:23:50 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s188sm3951359wmf.40.2019.06.14.09.23.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 09:23:49 -0700 (PDT)
Message-ID: <7dfc2889b06074410d65ec1a2cda992a12e6a80a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2019 17:23:46 +0100
In-Reply-To: <20190614160229.6144-2-Randy.MacLeod@windriver.com>
References: <20190614160229.6144-1-Randy.MacLeod@windriver.com>
	<20190614160229.6144-2-Randy.MacLeod@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] libcap-ng: split into libcap-ng/libcap-ng-python
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
X-List-Received-Date: Fri, 14 Jun 2019 16:23:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-14 at 12:02 -0400, Randy MacLeod wrote:
> util-linux's setpriv needs the libcap-ng library but
> not the python package so split the package up to enable
> this without a dependency loop.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-support/libcap-ng/libcap-ng      |  1 +
>  .../python.patch                              |  0
>  .../libcap-ng/libcap-ng-python_0.7.9.bb       | 27
> ++++++++++++++++++
>  meta/recipes-support/libcap-ng/libcap-ng.inc  | 17 +++++++++++
>  .../libcap-ng/libcap-ng_0.7.9.bb              | 28 +++------------
> ----
>  5 files changed, 49 insertions(+), 24 deletions(-)
>  create mode 120000 meta/recipes-support/libcap-ng/libcap-ng
>  rename meta/recipes-support/libcap-ng/{libcap-ng => libcap-ng-
> python}/python.patch (100%)
>  create mode 100644 meta/recipes-support/libcap-ng/libcap-ng-
> python_0.7.9.bb
>  create mode 100644 meta/recipes-support/libcap-ng/libcap-ng.inc

This is going to fail on the autobuilder due to a missing
maintainers.inc entry...

Cheers,

Richard



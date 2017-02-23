Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 84D8C72FE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:21:27 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m70so1615669wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 01:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OwlloESDX7cR9EHJR9bldXSjkErcmoUo9ZwY9uUisls=;
	b=n54fmGckkpDckWbip+eVlOfPzXBcPUKR4MGd8dPArM98MVlIkJlAZfAOwR3MoSRqzR
	EOYnl5tX4+LrFm0AVmDYPAxeYzadRWK+uwjLa64DhHKR4eaybEjraasBBNuLB3QDSJ68
	gGaiKXdTKoJoBm1p1lhVtAl2VBUI+Ebc8yWBBkUFXS9i7mDQSwGoofYnnQ61eYk5b/rX
	c64WfeN9KxaKDpRAcv41YDekVPADyDtrqo6sE3aqsvIrzgsy0OCi8goNcexGCUZ167KV
	UfSc9pqW0ycoPjYY5ZMuEvYkg1WJAJjDn3QiiNq3304d7asg3TtFw1/1+hlolQ7jF1UK
	QAZA==
X-Gm-Message-State: AMke39k0fqRbjurPMOHlxRd94AYx+95vmjKjwHmcg5mzBVrfaRgXYMtEabPkGBRAdTFgJA==
X-Received: by 10.28.71.220 with SMTP id m89mr2927538wmi.120.1487841687908;
	Thu, 23 Feb 2017 01:21:27 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	191sm5524856wmo.21.2017.02.23.01.21.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Feb 2017 01:21:26 -0800 (PST)
Message-ID: <1487841686.32665.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 09:21:26 +0000
In-Reply-To: <73bd00392c81ac3cfaf9e013052071b1ee6b66ff.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
	<73bd00392c81ac3cfaf9e013052071b1ee6b66ff.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.22.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 09/24] boost: update to 1.63.0
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
X-List-Received-Date: Thu, 23 Feb 2017 09:21:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-02-22 at 16:51 +0200, Alexander Kanavin wrote:
> Drop backported 0002-boost-test-execution_monitor.hpp-fix-mips-soft-
> float.patch
> Rebase consider-hardfp.patch to 0001-When-using-soft-float-on-ARM-we-
> should-not-expect-th.patch

I would think that the arm specific soft-float hack 0001-When-using-soft-
float-on-ARM-we-should-not-expect-th.patch is not needed anymore, given that
boost should be able to handle all soft float environments now, but am not
in a position to test this.

Cheers,
Andre'



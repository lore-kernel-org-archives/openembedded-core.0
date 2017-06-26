Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id EAED571A15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 10:32:56 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id 77so142373706wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 03:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AElnBkoxhcq9rwmhzmUAU6YbPm/3vtkHPomEEI322kk=;
	b=hi5SluRUodaOjBo0gZr+XcNgAwqchgnYpucZeBN9HaHmZ4r2wf6kw+d9HlL1OMQZg4
	+DwIhb+WBq69LOPlEz6wgIzIPs1UX26mPAEHdrE2OCLNOTMX09GxJB6ut9ErSSEoy+90
	M8PH+LLDPvZ+VTfjx5m3Cbu2imXMMcaKYUCNjZmZsfwCm4Fh+13p9+EtRrSWV+mylVLk
	9n2jESKr0SmzcMyTOW3wWyl2vxcnWOlFE4cJPoYmH01BoHKCEuJ7Iodrhm384O0XphVr
	yDjxUwRFe13a2oIm+PqtuHMJRgbWJq9DR/AUvOOudKFG2tnw+E//JgZgIrix7hZP1iIf
	+QWw==
X-Gm-Message-State: AKS2vOzy+a7xnpWJM8kwVKDdVOekto2+bsn8twNHWwRcBkPSLXyUiZqY
	P2a3diRR8agOvvKKIrY=
X-Received: by 10.223.175.229 with SMTP id y37mr14063139wrd.61.1498473177445; 
	Mon, 26 Jun 2017 03:32:57 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m188sm7932076wmg.34.2017.06.26.03.32.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Jun 2017 03:32:56 -0700 (PDT)
Message-ID: <1498473175.25895.28.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 11:32:55 +0100
In-Reply-To: <20170626090130.2382.3945@do.openembedded.org>
References: <20170623145924.21097-1-git@andred.net>
	<20170626090130.2382.3945@do.openembedded.org>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJzZWxmdGVzdC9hcmNoaXZlcjogYWRkIHRlc3RzIGYuLi4iIGFuZCAyIG1vcmUgKHJldjcp?=
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
X-List-Received-Date: Mon, 26 Jun 2017 10:32:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-06-26 at 09:01 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: "selftest/archiver: add tests f..." and 2 more (rev7)
> Revision: 7
> URL   : https://patchwork.openembedded.org/series/7443/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 20b3574749)

I'm not sure why this is failing, I made sure to rebase onto 20b3574749
before submitting.


Cheers,
Andre'



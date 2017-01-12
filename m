Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 92F6171974
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:00:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l2so3917943wml.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 06:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zl4fug6I5mw5HlbfG5uiJdoKGNaqMiViW6WYGQHVN3Y=;
	b=VjK0cvoj8j7b2solYZ8hyN4eueSiXKITLZuMcacMlUssBYPufvLab/fWAMm7BEJWTk
	cyXd+aRQz5imQzGvwfap1/35qEgVGPjm16V+b4iR6BSNCLTAizQRsosimbZacCKeRX3s
	jv9s/Mf3tHtdSKMDGdFVtxxes5pmdMzP/iIgSCmr7jm1YjjvBML0t+Bu64QvOCVRUX2V
	PCyoTJypuOrfnEcM1du2cxrzeptCxN/m20QRZznX79cRBWepzKV9YTidtDJkneQrjrV0
	s/eUlKh/sMVuxSo4HpCPpLt5cy8Q1yy7TNjG9SgAEpl4RM1UfGYC469t6044vxy3m7VJ
	vkAA==
X-Gm-Message-State: AIkVDXKWjdEJEh5kFGny2vlU2WQqXoezTL1f9klC7mQn4/LYPzmmDTrGiqQL0C8AB+k6ow==
X-Received: by 10.223.164.130 with SMTP id g2mr7145283wrb.84.1484229652957;
	Thu, 12 Jan 2017 06:00:52 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id b15sm3357985wma.5.2017.01.12.06.00.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Jan 2017 06:00:52 -0800 (PST)
Message-ID: <1484229650.7594.26.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 14:00:50 +0000
In-Reply-To: <a2754fb6-0fda-fb36-eb3e-7f9ae50fd8b2@linux.intel.com>
References: <1484167889-3198-1-git-send-email-anibal.limon@linux.intel.com>
	<1484211839.7594.16.camel@andred.net>
	<a2754fb6-0fda-fb36-eb3e-7f9ae50fd8b2@linux.intel.com>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Thu, 12 Jan 2017 14:00:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-01-12 at 15:47 +0200, Alexander Kanavin wrote:
> On 01/12/2017 11:03 AM, André Draszik wrote:
> 
> > The patch 0001-target-mips-add-24KEc-CPU-definition.patch should also be
> > removed, as it's been merged.
> 
> Why is it applying without error?

Because the context doesn't change (at all), only line numbers.

Cheers,
Andre'



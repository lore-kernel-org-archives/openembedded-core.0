Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9A3608BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:46:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so2478140wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 02:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=+9z8mozUDsbQ98eUtpo7Vhv8+Aplrh3mBHUXB3dMaiw=;
	b=XzxzWPHvPKnjXVtugO3dg9D04CixRcu3FiRbk0AIoA6glE/1KHu4VxTSUI8shvMSTD
	GEQ55rlL8EYuTCAL9vwUC76euVjAj0MUIpOLwIib7zVdxfWNXSn3WAyaRpVt3NRP6/DP
	OtgPh2lVm+Xn5oRjMZfurfmp80LnFiVAimm6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+9z8mozUDsbQ98eUtpo7Vhv8+Aplrh3mBHUXB3dMaiw=;
	b=g74b/V4+mNSrPNIc8B315i1LILGYrLfuQFkxokH1UAzzrU/ZEVeeDYHsi76DTkucv4
	CTtLnYtM8DyqykKiPnZQabZHzdu9cKTt8Grlbbq2hlUD27MLccnbG9ipLYI2kWtA/kjY
	ac1IxOPpg/3rgSsk0f04vooRS04w69u6AG1jXEwoxzmwwhTGShdjsIN4wY+VoeXD0EI3
	OVAHo1eFzLFFRIm2Ql6HRhoaVdpsfJO4U6uFNwFVLA8ceBUNyIRkqyTHdNSBaBTDdOIX
	tu23kazbhapLxWoWW+PMt0mo9/acm9pbk1U13mPHOqqmmcfDBdV+CUR/rwUNER9G4/2D
	+FdQ==
X-Gm-Message-State: APjAAAVMOmBQoY4xZ5IX0Y9M+HRfTViPzyTtRpbramdLzrX5OpcxEgGc
	D67BkDo2F9aGR8CFKHKGEhdfng==
X-Google-Smtp-Source: APXvYqyMqNoZ+TTB6y7HV07MS1Vf5HXm2CpY5URpc2H67820ojZirvFuVGc2y5W518P8ypQLFYA6eg==
X-Received: by 2002:a1c:3b09:: with SMTP id i9mr4542142wma.31.1582627590101;
	Tue, 25 Feb 2020 02:46:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z133sm3645593wmb.7.2020.02.25.02.46.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 02:46:29 -0800 (PST)
Message-ID: <628af1221089667f1377f419dd9375637ac1d028.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Branden <scott.branden@broadcom.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 10:46:28 +0000
In-Reply-To: <20200225001115.18188-1-scott.branden@broadcom.com>
References: <20200225001115.18188-1-scott.branden@broadcom.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: Mircea Carausu <mircea.carausu@broadcom.com>
Subject: Re: [PATCH 1/2] common-license: add fdk-aac license file
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
X-List-Received-Date: Tue, 25 Feb 2020 10:46:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-24 at 16:11 -0800, Scott Branden via Openembedded-core
wrote:
> From: Mircea Carausu <mircea.carausu@broadcom.com>
> 
> Add Fraunhofer FDK AAC Codec Library license.
> 
> Signed-offby: Mircea Carausu <mircea.carausu@broadcom.com>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>

I'm not sure this belongs in Core? Is it a commonly used license? This
recipe isn't in OE-Core? Does the license have an SPDX identifier (I
couldn't see it on https://spdx.org/licenses/)?

Cheers,

Richard



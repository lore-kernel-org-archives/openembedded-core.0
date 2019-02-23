Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 02FB47CC14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 13:46:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r5so5226641wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 05:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xUG87Ubk6JrGM3qoksej7kVlPNgHCimLcKYv+dbarC4=;
	b=D7CC8o/vkmKEhp9dUfWqKK0ZmDUoC5ZnaMW3d4PNCXM/feHT2jsI1WsI4gSSiNTyEM
	o3XQC2mhAuKSHpZzTLsFBOo+3Rd4WIdOXcTzj8i8mxGsvUDFnF7ElDf6LmJd/P0f5VHC
	GBbtR+DsaKzdUS9TdQO9A9RH76RspW8HJSWuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xUG87Ubk6JrGM3qoksej7kVlPNgHCimLcKYv+dbarC4=;
	b=mkIS+uIJk+ArGlAvV9zlY59+9Z6NKlBZeYod0gO6sczZ+LAb601ZH15EsCKBBd8GSk
	qhEE1AHxmwVHDz3X2QFv6kUFYrbp0TgqLTozWDjGz2Axn+9bnnny7badJQ19xwXMocD1
	oIzYoAAfPi8cwNA5mr9hlBQkt4E6gulG+qiRszwhEpxC5OE+STL9rhD4otAAtgg+JVdg
	Hcy/G4pd2CTocfpT+7Yi33mR57CKaqVkbyLZVigh/H8hflP+6aQSFy38fsFp+6DtgIEN
	h49BBsX1/F2U0Q+hlLHN3Q8+7gGyimh2I0caQbfkM8kTKYP7TLp9FNTvxPo+6zIFd/Uo
	R6+Q==
X-Gm-Message-State: AHQUAuYE3wuP/WmwtYCFPOoDpr7jxhjjluOcFn2K06++ztbCsByVWyH2
	DPKox+xZa2YYrvAyVWfKdSMOquEYW5c=
X-Google-Smtp-Source: AHgI3IZ/fd0uQvuPW+BIIhbXs+f5bGn5KLF6CSAGoSAJ7AgE35OdP0Wfspd8zcg41thinJuI6N0bEg==
X-Received: by 2002:a5d:4605:: with SMTP id t5mr6419431wrq.311.1550929582650; 
	Sat, 23 Feb 2019 05:46:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id p4sm2985903wrs.74.2019.02.23.05.46.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 23 Feb 2019 05:46:22 -0800 (PST)
Message-ID: <ed3d51442db177eb42d15ac170905052663ff6af.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Feb 2019 13:46:21 +0000
In-Reply-To: <CANNYZj8es+kfAvJ-TadGefJGR0WvAehrGdi7ALrNXQoiTx-p+w@mail.gmail.com>
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
	<6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
	<10aa3afa4b558884e16f600954422435aa8a6023.camel@linuxfoundation.org>
	<CANNYZj-Q96NJ9eh-DxTHhCC0CFPtQ26jx2cJG3PkNdDYprDLGw@mail.gmail.com>
	<04f40efe02dcc883306aa15a611952ad2aeddece.camel@linuxfoundation.org>
	<b17f7567b65f6b1ee4e33345364b489058d96b80.camel@linuxfoundation.org>
	<CANNYZj8es+kfAvJ-TadGefJGR0WvAehrGdi7ALrNXQoiTx-p+w@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gdk-pixbuf: convert from autotools to meson
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
X-List-Received-Date: Sat, 23 Feb 2019 13:46:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-23 at 14:43 +0100, Alexander Kanavin wrote:
> On Sat, 23 Feb 2019 at 14:36, Richard Purdie
> > I think the problem is in staging_populate_sysroot_dir(). It's
> > confusing target and native package_archs since in the case we see
> > this
> > its x86_64 where the target and build archs match.
> > 
> > Not entirely sure how we'll fix this but that is where I think the
> > problem is.
> > 
> > Not sure why we're suddenly seeing it now and whether the patches
> > somehow trigger it or not...
> 
> The reproducer does fail on master too, so the patches may only have
> shifted the timings such that the race outcome is sometimes the
> failing one.

Agreed, I think we've just exposed a bug. I've sent a patch to fix the
problem in the function since its clearly not doing what was intended.

Cheers,

Richard



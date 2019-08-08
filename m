Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0A34E7F2C6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 13:57:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 10so2519454wmp.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 06:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=GClpzs+OV0NXU7TE075uHSSPHoPOUZzyQPajjl/LXFM=;
	b=ZywNP5uKEDDYT4rzaHj9H/jfQg9ZHhqfwGnG+qdKpYvnobwoewqRly/cgSTg3iGjKr
	XaLn3UqHs/TA5jDUjAOqVQkv75MzcfdhKV1XyBzC6/1fgeb5ai5ZJy4QR7IFHh6BrwEF
	V+6rT1u2Y6lZ+WmREeWcp0rg8mUrCfwSQMC06MZHM8UOuCuKhf4E9eIR28yEBINFlv8s
	9AQ+5CSY+mAh6pRlUToF9N/6ezGrXLQ4UnWCwQRwrqx7hY4e1r4CR3VnO5SQgnT1T0/h
	LD/BOR32VpqpgMFOJJmFfPC+hayKqYDVQvcY2BvLF9GgSWz7zAV90sNcPNV5ctKRKFjr
	1Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=GClpzs+OV0NXU7TE075uHSSPHoPOUZzyQPajjl/LXFM=;
	b=TE1Go4QQKDu/ugSQ/6XIkGrjWej62t9aSeMU3QlB/XDZm/oapcqpdoXtJOog282dx2
	Snd1qxsWl5DKZRhL0/19SC9lwuooeCRmBZFFdcc66bYX71IUzzIj5vLEs0Le10apCZKn
	p1k+nyZWIV9A/EZrynROXwCB0JUaiNmoyspxcIzspDnyCLSUGNU7lcgGF6c+gcYqv1GK
	5ujIGR+A8UQ5EMctTaZsi8yJx2Es6eC5aHd6FPWm8eOzzLRgJY2qox0zc58E6C0SewYh
	mYNWq5Qyvy6JwAt9k2R8G7i6MfQ18iQgWPF4JpjitIZ3/URwpNHcnoWp6ER4+w511i/Z
	OiGg==
X-Gm-Message-State: APjAAAXLH3NStam81AbPAYzV9FM4gBqsVgojFnA56546czb81zMvsteD
	Lgxx3qp3ag8+DHdrLsw0Pd4=
X-Google-Smtp-Source: APXvYqzKYts1+huthG6VZYA95XQhAbzoj1wDHpQcrmzhHejzd+krKTF600JlRd/tM5yxy7K9Jx2yDg==
X-Received: by 2002:a7b:c8d4:: with SMTP id f20mr4803608wml.90.1565272659375; 
	Thu, 08 Aug 2019 06:57:39 -0700 (PDT)
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
	by smtp.gmail.com with ESMTPSA id
	l15sm8189229wrq.64.2019.08.08.06.57.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 06:57:38 -0700 (PDT)
Message-ID: <f3afb57f910ef0b3d804ac4095d271ad7a2c8e57.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 08 Aug 2019 14:57:37 +0100
In-Reply-To: <CANNYZj9NOARrMH8Vm1QXMwXzVUu7yTisK2X25jta_3xDCO0HeA@mail.gmail.com>
References: <20190805105232.16148-1-luca.boccassi@gmail.com>
	<20190808114701.20464-1-luca.boccassi@gmail.com>
	<CANNYZj9NOARrMH8Vm1QXMwXzVUu7yTisK2X25jta_3xDCO0HeA@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3-pygobject: move python3-setuptools from RDEPENDS to DEPENDS
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
X-List-Received-Date: Thu, 08 Aug 2019 13:57:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-08 at 14:03 +0200, Alexander Kanavin wrote:
> On Thu, 8 Aug 2019 at 13:47, <luca.boccassi@gmail.com> wrote:
> > -DEPENDS += "python3 glib-2.0"
> > +DEPENDS += "python3 python3-setuptools-native glib-2.0"
> 
> If this is required, then the build should fail, and it doesn't
> (neither on the autobuilder, nor in my local setup). Is this really
> needed? Does the build fail for you?
> 
> Alex

Hi,

You are right, it doesn't fail - upstream lists it as optional. I do
not know enough about this package to know how important it is - so
I'll send a v3 that just removes the RDEPENDS, which is the one thing I
cared about.

Thanks!

-- 
Kind regards,
Luca Boccassi



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 808B07CB35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 23:15:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r5so14560433wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 15:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=bRXk35S8QSvl+NEhGoTMHnjhYjAE8ab4WChP6esvhRw=;
	b=GJVHh54O5ch5rESqPqhsgHE0ld+DrYv2DBwhgtwBCMjB0xme9Iz0G9HZQCcK58CXwD
	d0DSLEnVMm7oGCatPeFHQDRa/Mu5OLS0sQw8JmQ8SkeHqPLauEVOGwWUHQG/koyuO/Ku
	yveY3NxUY0jd+YNfsYawneV5EO5lZXLRi0I8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bRXk35S8QSvl+NEhGoTMHnjhYjAE8ab4WChP6esvhRw=;
	b=ALdPxMc20Bx+8cvhOpWjpoG0N94y04Fpa/QV4A5KzBAdWMVZHhZWle/VyGtta4TXn/
	trHqTk+tiywk+JsFR60abdUxD4ikE81pTRfFLF6jy+bj6tUi6h98zkiyn7ryfj7uJ3eS
	ujXnzIdf/o0Dzjh0NFwLw+ZgCH4Obrhk6MgDBQCkXlGnGmsoNtnq3pdk0S5LNzvzPPg8
	XnYLWoM7MYacvZGD+nNB4cZn+o+ih2NkD8ywMlmh2OpyU1eircH3HbvINRUUokGdL8zv
	utnvhnIJ3I2P6WVA4OLKDcKUEoitBVGtoXDu0YeK73NABGZSC4Sv5CJeMUEPxc8mbzK0
	PVyg==
X-Gm-Message-State: AHQUAuYqzpaKiMOd35lynH+FqwE0B6sCqDt3AppaFi25Qul86z9G3K87
	4I0AlHk3oNznonf8vAJKlH04Vg==
X-Google-Smtp-Source: AHgI3IYQgJE1LNj1eP5YywTEJctA1VzD6HTUSfodjwFjfl/jlWTVhShF7Yd0Dd3gDujM1ByXE3MOCA==
X-Received: by 2002:adf:ed0f:: with SMTP id a15mr26325922wro.249.1550704551183;
	Wed, 20 Feb 2019 15:15:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g10sm7378202wrq.61.2019.02.20.15.15.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Feb 2019 15:15:50 -0800 (PST)
Message-ID: <6fe6cbadaf29e01975ec71a1b005d2fdb7885484.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>, Philip Balister
	<philip@balister.org>
Date: Wed, 20 Feb 2019 23:15:49 +0000
In-Reply-To: <BYAPR02MB6005274C95E7FE6ACA65292DB97C0@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <1550192184-13460-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<1550192184-13460-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<679c61e2-f179-c986-b6ca-b69b95b5e22a@balister.org>
	<BYAPR02MB6005274C95E7FE6ACA65292DB97C0@BYAPR02MB6005.namprd02.prod.outlook.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel-fitimage.bbclass: Introduce a way to provide external dtb
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
X-List-Received-Date: Wed, 20 Feb 2019 23:15:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-02-19 at 19:34 +0000, Manjukumar Harthikote Matha wrote:
> Hi Philip,
> 
> > -----Original Message-----
> > From: Philip Balister [mailto:philip@balister.org]
> > Sent: Sunday, February 17, 2019 3:47 PM
> > To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> > Cc: openembedded-core <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core][PATCH 2/2] kernel-fitimage.bbclass:
> > Introduce a way to
> > provide external dtb
> > 
> > With these patches, I made a fitImage that booted on the mini-zed.
> > It would be nice
> > to include a note on how to enable this. I took at few stabs at it
> > and ended up with
> 
> Thanks for testing it out on mini-zed
> 
> > PREFERRED_PROVIDER_virtual/dtb = "devicetree"
> > 
> 
> Yes, I should have added this in the commit message. I will update it
> and re-send V2

What may also help a lot here would be some tests. This is currently a
blackhole in the tests :(


Cheers,

Richard



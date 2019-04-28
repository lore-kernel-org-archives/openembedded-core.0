Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7427D486
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2019 08:22:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id g3so10900412wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2019 01:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=kgq9d4LQnJxXZnCOd07H44gaamlNMi34Wj97n0XUw7A=;
	b=EXP2oihQEZHa7zvLdfYqV8mCPv8KIhKMAoTVQeLqqIAeMOfZ1eRo+xKHyRYZKQKZa+
	lY6IWPUuO8Qv+41RMzfQOsgM/QBnLiTXwpz1ccVseYxd9pTHEzYFSIFUyWgARgXFn5ga
	oNPvSKN361aEt+F7Yv93aMBzofaCjIujES/IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kgq9d4LQnJxXZnCOd07H44gaamlNMi34Wj97n0XUw7A=;
	b=lWc2ZkDCWE3KkTxJNU7dKbuaI6KPlhJZORcmfpgZuJhtMOjhLEgxwIP8Q5WnbLmTw+
	HpPAPSSjsjFfNnq/+u57UnmH5jOxwanTRdyO3rGdI6nRl9gEdu8E+ISlntm5HWz3NxXI
	2BEg2xBTxCuskbpZjPksQr8m6oW/nJuWlzpZP4dioVlnupOet9erwqLAH4ZisgZR8K+8
	7l1ESdKD3ggH+m8JRvf+3K3I77U8mvwIOL0KIktFnnvAsAgNp9u6vTWamtkLCgWnlWLl
	vz7c9ziEiSjReynI4tGcAdT9p0nZ3LuABkJayjNtp5jJvUYl6jlnpQWHXwb+bYoDaM1p
	AEzw==
X-Gm-Message-State: APjAAAVFEhI6tgSKwnD/G0b2p9RsEAMvy7LpyLZ2uWWpBd2lCeP0FT7x
	RTFcFtRBaEvO9FaP39E11dXplA==
X-Google-Smtp-Source: APXvYqzhiYlakPuLKUqDa4bTk00fDtoz31FGlAB5md6rOdEoYU6ZOr4FEkFFjc5xcicTYIXpJ8H2kg==
X-Received: by 2002:adf:db05:: with SMTP id s5mr5949290wri.247.1556439757973; 
	Sun, 28 Apr 2019 01:22:37 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h8sm33673336wrx.45.2019.04.28.01.22.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 28 Apr 2019 01:22:37 -0700 (PDT)
Message-ID: <476bda846c17a7b1a4479806803cf7ede4f88830.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 28 Apr 2019 09:22:35 +0100
In-Reply-To: <CE98D515-E3E6-445D-BDFF-574A1F0F031E@gmail.com>
References: <20190425135557.8967-1-fabio.berton@ossystems.com.br>
	<c05b9ebe4d9e79e34897851477e3c9b2a9e7602b.camel@linuxfoundation.org>
	<7e08518b4381a936e225eccdadee24a5a5521000.camel@linuxfoundation.org>
	<CE98D515-E3E6-445D-BDFF-574A1F0F031E@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC, v5] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Sun, 28 Apr 2019 08:22:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-04-27 at 11:32 +0200, Alexander Kanavin wrote:
> This one is not about Mesa but rather failure to build recently
> updated vte-native due to host gcc being too ancient?

Yes, the mesa+musl problem is a valid issue, I hadn't realised the
virtgl-gtk issue was actually vte-native so that one has a fix
elsewhere. Sorry for the confusion, this is the challenge with bulk
testing patches...

Cheers,

Richard





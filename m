Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D82197DF5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 14:03:13 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l2so15413363wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=u7s17vTTRIe5IQlanpY2BGTtIgOHeaeokCGEpm1BLhg=;
	b=VkIskcw/xGQSukO8rG01xMt9bGLY/K87MkRg2nLqCn/NI164n9XFhvpavd0xOOCViJ
	MR7046BHA82izZo50nRK6P4WOSugkTS8YP6KveClJrhckq4OkAwE1RFSXOI/B8YFWmNe
	xuzMprX2S1x0sUd0Hs0h1kCF3JS0/MRGHDIn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=u7s17vTTRIe5IQlanpY2BGTtIgOHeaeokCGEpm1BLhg=;
	b=WeKL6oKGYpNCciyEgKMuoMbfQ9cVuB6BaYsEtNhQipIA8uEdcjTY4SsGV9CAiGtJiV
	y2K6d0/pVZE/gUpSoENoyPlPMxhkfSO7KWfneHM0WujiSB0o28sil2mhnhtSypMm6Vlp
	WF528wh2BWn3XOKEIJzatuRRXlZ59QV/TKh1YjG0VLW1CIu7pedmALlCV8Jz5oO3lfA4
	rc2tmp0K0a1+ZKLNvJ0et1rppBYj0Hcy6SzQmfzEDb9Mf1CzrgoIiYmrzj3r1uHK2YPG
	6M+Un6L831jVjl9zztBNXBgfTCROYD3zPzwYvOa/wHsHGUUWGz84Zb0glKn1YdG9kRH/
	z0aQ==
X-Gm-Message-State: APjAAAX2fsgRNrRzjG+z5KB2e1Lui3sHjm8+itM/p924ACsK20gnUsG/
	XRsv3d/Gx00FVRJMUW01OJBnpA==
X-Google-Smtp-Source: APXvYqw9FUCiCLT+9w2AfVKKJeCiu1o7hM3KUtcKa8gKs6mk3ZY/fcF2icC/1K/V0yXi+UW70hG0bw==
X-Received: by 2002:a5d:6710:: with SMTP id o16mr15208275wru.173.1557756194553;
	Mon, 13 May 2019 07:03:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t13sm16538956wra.81.2019.05.13.07.03.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 13 May 2019 07:03:13 -0700 (PDT)
Message-ID: <22400f2278d5502b4576bc75faae09d69fe4c887.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Mon, 13 May 2019 15:03:12 +0100
In-Reply-To: <CANNYZj-g5RMyUwkx9SHgXmOut8VngL70tfW++x9jziYTURZcjA@mail.gmail.com>
References: <20190508135459.84886-1-alex.kanavin@gmail.com>
	<20190508135459.84886-3-alex.kanavin@gmail.com>
	<000386a97aab0dc593e908b4d7f50f1c8a079be9.camel@linuxfoundation.org>
	<CANNYZj8WQasbaiPZnifQ474QMPyNS-YZC3fgqbK7eMZSWCenig@mail.gmail.com>
	<c1411d0a06b8e9778f581247d4fa9fb20859021c.camel@linuxfoundation.org>
	<CANNYZj-g5RMyUwkx9SHgXmOut8VngL70tfW++x9jziYTURZcjA@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] webkitgtk: update to 2.24.1
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
X-List-Received-Date: Mon, 13 May 2019 14:03:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-13 at 15:56 +0200, Alexander Kanavin wrote:
> On Mon, 13 May 2019 at 15:46, <richard.purdie@linuxfoundation.org>
> wrote:
> > I agree it shouldn't be in self hosted which should be more
> > minimal. I
> > think we do need a webbrowser image which we test *somewhere* and
> > this
> > ties into the discussion we had in the bug triage meeting regarding
> > bug
> > 12991.
> 
> The problem with the web browser is that webkitgtk is one of the
> heaviest things in oe-core to build (in time, RAM and disk space).
> Otherwise I would just stick it into core-image-sato, and write
> something reasonable for testimage to try doing at runtime. Tips?

We create a core-image-sato-webkiosk image and only test it on x86/arm?

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id BF6AE7DC65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 10:53:25 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y197so3340234wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 03:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4XWOlhERWCgyoipnuSKINU3VBRcdVedlYvYU0igICBQ=;
	b=WLcx/TkUfTgQzYQPlCZPRCUsD32JFdOlTbDVBxqK1cdo/5A4d+uNx8r8e3QxU1vrXR
	QB/5tJrvcyK1Bl3z8+rne02Rn8wwynSY092strJDe3XXg+rK8g9g6nFaTZL8GveS/QVt
	2mW3O3A8lZxB8Y/zMYt4Zj3lBtWQSk4cqjJLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4XWOlhERWCgyoipnuSKINU3VBRcdVedlYvYU0igICBQ=;
	b=I8GPRp/j8xwRZfYmLYVj9Fbccu+31lw6BIxG5lCLKMJvRP8RtJTr8tAtuAed3ueK/4
	y7J2SBr0aoGaIg9UY4kA0skmigaP0zVDQVOVAhnO6HX1ug7zxJ1mCLJkIM2yDKspqJ8P
	P1adnxyehM00AyF9nsDPCYe7hBn9/pDkRg0+a2WXMoA8IN5o+nb1Dofq9iMdo8x+Gups
	G24Pv/XecoM+DZApS/piWVgYpTxBZufAIx/2rwwv1rfk7T/fVq8VktDP7eMXJNuSyXOS
	CDHsFyE49sxd6LsiaiAk3syjqiI8DEaFZmY+GH+b9YlhiFEJf1cwDY9zbUwPUEAAThXm
	68fw==
X-Gm-Message-State: APjAAAW3X3wv0xoM/A9VCLGMdTgJsiASqLAkRgWmS4khC6CwYnvjw/WS
	Xug4KVDnlPyhCIroMngnjdP/Bw==
X-Google-Smtp-Source: APXvYqwa52kuR8ggc38ofQql8AnecglSteBCUXt74KDENYtyMF7CgO9ElSuJHnDkP7trg0ksIcOU5Q==
X-Received: by 2002:a1c:2743:: with SMTP id n64mr2591935wmn.19.1556621606535; 
	Tue, 30 Apr 2019 03:53:26 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o16sm25161091wro.63.2019.04.30.03.53.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Apr 2019 03:53:25 -0700 (PDT)
Message-ID: <a9333c6e475b7bd4fc4b687715ef7b2b6354814b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Apr 2019 11:53:24 +0100
In-Reply-To: <CANNYZj9VG3Ty8OLyft2Hn67AvYYUeqknaU1kdBgb1zeRW+o3Dw@mail.gmail.com>
References: <20190429140730.2899-1-schnitzeltony@gmail.com>
	<20190429140730.2899-2-schnitzeltony@gmail.com>
	<323098102d47a837b953a3c399f8db65b1c43349.camel@linuxfoundation.org>
	<CALbNGRRuLKUfornkTS6e2PBskpyxuWo-XnLrd=boHYPJMkDhhQ@mail.gmail.com>
	<19fa74d55f965241b227fd1e63241be600f93b5a.camel@linuxfoundation.org>
	<CANNYZj9VG3Ty8OLyft2Hn67AvYYUeqknaU1kdBgb1zeRW+o3Dw@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] vte-native: reduce c++ requirements from c++17 -> c++14
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
X-List-Received-Date: Tue, 30 Apr 2019 10:53:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-30 at 12:48 +0200, Alexander Kanavin wrote:
> On Mon, 29 Apr 2019 at 23:22, <richard.purdie@linuxfoundation.org>
> wrote:
> > vte-native of an older version is looking like the best option
> > unless
> > Alex says I'm mis-remembering...
> 
> I checked what --enable-vte actually does in combination with the gtk
> UI in qemu, and it makes the serial console tab in the gtk ui behave
> like a real gnome-terminal tab (selection, scrolling etc). In the
> absence of vte support, the serial console tab is still there and you
> can still log in and issue commands, but it is more "dumb" regarding
> terminal capabilities. This serial console is an addition to the main
> tab where the output from the virtual graphical card goes.
> 
> So to conclude: we can split the vte option into its own
> PACKAGECONFIG, and leave it disabled for native. I would rather do
> this, than make vte and vte-native versions diverge.

Sounds like a plan, can someone send me a patch please! :)

Cheers,

Richard



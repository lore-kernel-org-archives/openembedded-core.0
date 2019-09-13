Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id DEBC26BA11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 13:42:07 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id j31so7095088qta.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lz663qGb71AO4/BZlU/P+o+17aMliWUEh9ufVnnXaDQ=;
	b=h7axYet+WoW4wtJQeRc6qQZnbdSuSHiYmLlKKp5++TCntNsFsr6MNypgpIvUucQ0Zp
	UQq3BqS7hAmaLO9Rb9pxMq7kO5rQI8MPbI77gMltSFP9BlbfLZgJ6/kXzVoxpJFsiGLV
	zeOZlJOwLrfbp7W9Eh0IXz9yXwb75liou7RZ3Ic2NUyNMGIuAogG2uZAm6+1SblZKq0L
	B5Yqhj0The65v1ya+m45DO6pQh0ErgvCg2s0eCoAXrH05g989lZSBRJ3Sw+uhrKoTxKJ
	pMihcIRS65kJNPanjRe56pKFj5vzZArcAKMsiME5yT1pbX6o8l/xaUPWBTQXQLJOIX9b
	jhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lz663qGb71AO4/BZlU/P+o+17aMliWUEh9ufVnnXaDQ=;
	b=m6nJbk4f/CXxyHvBYX1GlkreRRkgQ3kFTNsMFE1wTGR4TqudWs7M2hRi3DeC2iq7X5
	RFN1E44KkCi2nfkfUdq3o6YqRS9co7jcdHQ7nIp8UuaakwZBySbiRQMOLNtjJERbFAEj
	FyyFco5it4OaImEU6oE5YdIGLtXtCnjywazktGcY44E0a+7ebno0FC05JoUcFCblenYy
	GKNEKQtVuXj47kyhLM2+d5NF1bwdG1TJ95qjoySkmxEMvJgdon2NK2ILId1yhJ0rfNfJ
	CSzgT+/NtKCS59Ws/QeMK7FDu1erM85nY8nepr+BBSSl+vd+NwElVv2hXxTDUt+e11a+
	lRrQ==
X-Gm-Message-State: APjAAAXJUqCCAODuy0uF8ZW+mph+rpmEo6XaYj5x1+bSukBYkL4/iTbe
	RNPHw/2JFhsIRY6+DHCsTspA3WrVv/rK7GMK55ZkEFRC
X-Google-Smtp-Source: APXvYqxeLSIMDQ2gHSiwhgiv3gO1U6HW+ienCuzvYxHbqb8Sk+SlRSz2NOfz3xO4ZJcvdcGWU5ynk3lBRhkNtKv/P3w=
X-Received: by 2002:a0c:e811:: with SMTP id y17mr20597669qvn.68.1568382128505; 
	Fri, 13 Sep 2019 06:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190911042903.3047253-1-raj.khem@gmail.com>
	<984e3147-bddd-56a5-ea90-eea87d8a792c@intel.com>
In-Reply-To: <984e3147-bddd-56a5-ea90-eea87d8a792c@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 06:41:42 -0700
Message-ID: <CAMKF1sr9S=7H5_2QL7eeZFnGfNAo=PeHMkSX5B+CJ=WnoQE_Sw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] weston-init: Add possibility to run weston as non-root user
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
X-List-Received-Date: Fri, 13 Sep 2019 13:42:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 13, 2019 at 5:27 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 11/09/2019 05:29, Khem Raj wrote:
> >   .../wayland/weston-init/weston.ini            | 74 +++++++++++++++++++
>
> core-image-weston now fails:
>
>    file /etc/xdg/weston/weston.ini conflicts between attempted installs
> of weston-init-1.0-r0.noarch and weston-conf-1.0-r0.qemux86_64
>

on x86 qemu right. Sent a V4. give it a try

> Ross


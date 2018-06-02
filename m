Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 843487521F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 05:24:13 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id f79-v6so10295479oib.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 22:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jIOTddUANNeq+NHAwl/ErDoGTz2gFgdZikhjiKABUYs=;
	b=dFuht+22UXuU1JbD7RXHd+UmIRDrCR4rE7SQdz2i4muDDtE1U6UT9GUPGHfvmlXnIW
	C0bIkUC9onjB3+1a7N4Ka+V/7DHZDdxLrg8WGtyLIBQkJrmAFzBMAvFq6XcGk/7EfizB
	NamG/yzEbWpEi/2EcKORuUu8sN5dRgAjeKUIeJ4ZpijEeWhZUent1C8UUQmY3h5eoI0y
	BtMVCju0fGhkLddIvSeQ5Mc/piDLXKn/RcdRVVWwgHzzSO0kX3SvtrcF0IZwaNOvfc7C
	YG++YKtBzTcrgL44iYa/ifi4MpAzIZ0KRgN1pv10LNvaiXPiYEZ44hNvjdC2eCNh93T4
	7XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jIOTddUANNeq+NHAwl/ErDoGTz2gFgdZikhjiKABUYs=;
	b=Gvicdb+wK4Ccpt2PGhxYHa/VJRkVlhesM/8GVusrlrOtMlFFmaOrE38xEO0EmYGq3V
	TETXwpqkFhKQMQQpqQ2HrjPTHeQm9Rw5oVNnYafjH/fMghi01B4yEigk7Xmizpue1kDh
	v2Khj0tQBULfteHVnncPQplxRz+UpFLdlrdvsUomGQ3Q4QA1DCaYHzIi46OX0L21x6n3
	blkUWVK5XdYVEkVhX6nExaOirK9H0n79TIj78uOkrfdeykpSdFKLNobdcQmh6U13eznB
	g0eFQEtFO7fOMioKyw8yWf7zBpxV5I+IazChQr8CO2IdmOaGsWlQoyffvhr5q7CCQ2/t
	fosw==
X-Gm-Message-State: ALKqPwdJcc5QbNILo1ZqzkbJ7QAI+U979IPZYLrLxb8DpW1g+O4tWp34
	YAG/dCRFNbcFxEjCGSqsfus8H3/9NSdtwTUKfS0=
X-Google-Smtp-Source: ADUXVKJsNpAs1RIJhFuiQJQ1uoXvvrPIKs8nRQpDlBLo/nhyhG3Z2CuDcqseiQzeGL4Kf3G6M9yxFcLVb2nCyLlFwTU=
X-Received: by 2002:aca:47c6:: with SMTP id
	u189-v6mr8266573oia.100.1527917054430; 
	Fri, 01 Jun 2018 22:24:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 22:24:14 -0700 (PDT)
In-Reply-To: <20180601221440.29992-1-dev@sashko.rv.ua>
References: <20180601221440.29992-1-dev@sashko.rv.ua>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Jun 2018 08:24:14 +0300
Message-ID: <CANNYZj8VhXbaD93SpM130mx4v4b1Hjfr7fe8F30g+MR-+FaQxw@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] chrpath: fix SRC_URI
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
X-List-Received-Date: Sat, 02 Jun 2018 05:24:13 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-02 1:14 GMT+03:00 Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com>:
> -SRC_URI = "https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
> +SRC_URI = "https://src.fedoraproject.org/lookaside/extras/chrpath/chrpath-0.16.tar.gz/2bf8d1d1ee345fc8a7915576f5649982/chrpath-0.16.tar.gz \
>             file://standarddoc.patch"

It's better to stick with debian, the tarball is still available
through ${DEBIAN_MIRROR}:
http://http.debian.net/debian/pool/main/c/chrpath/chrpath_0.16.orig.tar.gz

Can you also investigate the other instances of alioth, namely shadow
and minicom please?

Alex


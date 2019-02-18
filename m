Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACD47C898
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 13:42:28 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z19so28351633otm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=MnBIKZG0bBqxD7yqWq9bwRUOquhEbpjyACrRgmPiQfc=;
	b=q4g9d1DIWwaVxPmoR4Q2Jr7UxphMPXaH1yfYy54dHvvUu1Hpt92VHVRxTGPfjXC/vm
	1BkyEmF32CPp1Ep9eRcGxRoPtksKb6CjzuNDEqMjdu7Vsb10zi7h1nOXm4hGdUvpdI8V
	2wEnmAGMtBUUUOkxuwXRPW+wPUGG/43Q0h+/htur6lD2y1252pQe/bN/sdvPoC/9BPSF
	lUflQL0FZSz9yIHiSUWSvMm2z0vPA0keF3qQCPZzXLZnQ7Ftkc+oO780TPYUt4q0B11n
	MfE3YJZs/JHGpe/1laks7NbME4i0z2HINqq1UTBqRMa4KHQ7yZSroYXUki8wHmLYe00q
	6PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=MnBIKZG0bBqxD7yqWq9bwRUOquhEbpjyACrRgmPiQfc=;
	b=UelBku9qHOOvQPxPi67IjprHyV0JqalkL9HekLe3KchtaaLY7CKJEzY6Nm2CUh3oAm
	HWkUMAq/YT320imiSefj+PY+4IOgwW1YPi4LQ9xuV8kyaLWujaanDqgkdqVCRdQYkekW
	XHWFGj4jtT3fXPFENx3FXZeccvJdsFSLeK3mSwRTifxwYuR391cyLfs8HqmyBqUc64AJ
	2nV3JFDejwANjTBZBMOkUCfe8b0mRLvxHyssedXRu2SrZiCczy/neF5l1+WekoMYsvma
	BgjhBqoeb2D+xdq2dm5/nydVqPHnqbB0EjsFfHvNUHb7tfriU4TZKj3GFok7wnR/fmDa
	mCUw==
X-Gm-Message-State: AHQUAuZpz87E7nr2STfIaeEk2fHE9jQA28CfcPc5NQAQeOe3njarfvon
	xKAhP0XXSfkvoNZ07k2BJCJiEb2SsfGMzA==
X-Google-Smtp-Source: AHgI3IZXpHzKTev+OQBG3fZYMLEAxdRTDsL/5Bl2zoByqnqye+rB/lEHVU4GtLK8E/j7QL0CzJ6GCA==
X-Received: by 2002:a9d:5f83:: with SMTP id g3mr15580247oti.346.1550497349317; 
	Mon, 18 Feb 2019 05:42:29 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
	[209.85.210.52])
	by smtp.gmail.com with ESMTPSA id z6sm5450562otq.68.2019.02.18.05.42.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 05:42:28 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f52.google.com with SMTP id s5so28280960oth.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:42:28 -0800 (PST)
X-Received: by 2002:aca:ecd5:: with SMTP id
	k204mr13570339oih.153.1550497347796; 
	Mon, 18 Feb 2019 05:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
	<20190218132948.27668-2-fabio.berton@ossystems.com.br>
In-Reply-To: <20190218132948.27668-2-fabio.berton@ossystems.com.br>
Date: Mon, 18 Feb 2019 10:42:16 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo6=a1rF6=bxFPw4NAke6hCNDWuveHUcQ_2EVOUTr_m6A@mail.gmail.com>
Message-ID: <CAP9ODKo6=a1rF6=bxFPw4NAke6hCNDWuveHUcQ_2EVOUTr_m6A@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Mon, 18 Feb 2019 13:42:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 18, 2019 at 10:30 AM Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
>
> Instead of using a native specific packageconfig option, we now set
> the swrast as the supported driver.
>
> Based on https://patchwork.openembedded.org/patch/158748/
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


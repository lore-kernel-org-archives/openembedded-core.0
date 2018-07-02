Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 36E94789F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:56:21 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id d189-v6so8916629oib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=MOc1YaQeorwvzi6lIzyXx+40206Ab0syN5/+lcT83eA=;
	b=cmnjrzYiWo3HaNd7TC5KVD9o3uDyOdLKfw2JchM7vfYambyoaiYdp9EUvl0Nreajfz
	JmoNY5a/AloAswSPTu7v4RLqMyZmVfr00sgsasRHi+Hz1mmWGsRGvkykUYEhcZ/088A4
	rmPfXQB0a92SRe3a7d9964lRB2nG56704GqS2JjWrTopg51+BUYDMFkr88PJt7yyLmnG
	jMjC+IspSAVa3uuMRAJx1Ux1T5N7FUvyMe9rx1iIW+oKdsqt1cBtWk1A3AF17BIei8oS
	lDvamlHCmN3VoHpJBwOfJ2C/oJ8WVWCFSzju4ERuSUua19F1Q9iQZQoTaZSJebOp5OHc
	WsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=MOc1YaQeorwvzi6lIzyXx+40206Ab0syN5/+lcT83eA=;
	b=bZdBexxAQhxtp4rlvHRakX0QzEjQZ7wNK9MrdzbUMg3SyYfAZ1vxHgMrF7u2+SAA93
	zVZw9EN5Q5Ys2JoqnFdHk2/3mGU7RAuzLTfOf2z1AONOpzAH6M7FTIR0CWLozcbNjtWz
	+0LVNIKQpK19WbkFJMIrELiHSt+evLviVTowPQ0zqsamdhhDtAdDl6sP8H9jTRPSNLjS
	Dup2NkeGqJKbsHIFLngEpngmcd6q6aiRzKlGQELluu0JKOzcLFGd966VuyakhX4lEIGN
	xrqJiUFThzyKWudPmaslELg34KCTXkam1xO0OCmjIiHc6Yk1YJ6DFgRFfKXW12I+rkAZ
	7eog==
X-Gm-Message-State: APt69E2+bHMjnnV22PQlMwFCS6XiEsHF4U/nEKaUT0evcL0hdspb9stU
	ckYM+DPNrP1Zieef4NVc1t1mAxtf
X-Google-Smtp-Source: AAOMgpddNoyLTlrZOPHygiK8nmKZT1X4o7c8KfcacAsq2yHok54QHfxSTOFdVBRR70K+pU8wWfcYsw==
X-Received: by 2002:aca:758c:: with SMTP id
	q134-v6mr9948734oic.334.1530550581750; 
	Mon, 02 Jul 2018 09:56:21 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51]) by smtp.gmail.com with ESMTPSA id
	w3-v6sm7583665otk.2.2018.07.02.09.56.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jul 2018 09:56:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id w126-v6so10347149oie.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:56:20 -0700 (PDT)
X-Received: by 2002:aca:f516:: with SMTP id
	t22-v6mr17691670oih.56.1530550580022; 
	Mon, 02 Jul 2018 09:56:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:58c5:0:0:0:0:0 with HTTP;
	Mon, 2 Jul 2018 09:56:19 -0700 (PDT)
In-Reply-To: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
References: <cover.1511207344.git.Martin.Jansa@gmail.com>
	<CAP9ODKrVe=GTLqtXjF54a4sHoRymY85Q6y4=mN++-twUPHYk9Q@mail.gmail.com>
	<CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
Date: Mon, 2 Jul 2018 13:56:19 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpewMn5oXLPhcMv3B2oGU5hFgoCA60sV9fzgyPzsv1vyQ@mail.gmail.com>
Message-ID: <CAP9ODKpewMn5oXLPhcMv3B2oGU5hFgoCA60sV9fzgyPzsv1vyQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/5] Kernel artifacts naming changes
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
X-List-Received-Date: Mon, 02 Jul 2018 16:56:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 2, 2018 at 11:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Any comment about this RFC?
>
> Should I send rebased version?

Yes, please.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


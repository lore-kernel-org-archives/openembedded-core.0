Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D69D61892
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:26:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i10so6959768wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 15:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=v+yNW84pzuNt87WEt/21VGTumAqcz8NImmTXtIm/ktw=;
	b=I36Zsd1VCCLrxh+YL1HuVXLR4a5Mm50uyXBRpFrGTu5uvZNox2Hr4tysLxInjddS6z
	qQNwRY1wbI0iSbyUEbrjWGllMBikoslVFERoJGnNbZ00k1rSebeDf352012YFv5j3rD0
	DnQ37VoHJ3jEXPsoJFOwPUkr7PGsa92aX1rfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=v+yNW84pzuNt87WEt/21VGTumAqcz8NImmTXtIm/ktw=;
	b=ulGdgyl5S3GKABh2TZ7Ctm//Tu9Iaf/NSySZNZ8EroL6inrWaGLGDVvfPQls5KZyu+
	lIst7mnJMtR1QXo/zxig7fSv+SLv40vB3nuYo3Dq+ElwPuou7fLdkIQrGaaTj4i3Yw6l
	rnD7VzyaMrpA9GcqI0eKcS+SlN8u7N7P7s8A332QSog/Hpc51C2CYXkmuWQAovhctykm
	x5omsYJe+la6kT64zB8NCAa2MDTboZRxFDF9jtcdHNpT/IWxis+P8Ei/RnKFtEM/cwdo
	E6fVl8qTLn55h9RZE/8iYHDGKVeUyKucE7tI8MlMSlIImPQmbtFkfJk11RAqbrnSsRs7
	qrRA==
X-Gm-Message-State: APjAAAXQ90KPACFbYd+CsKRolxx7Dv6Rng8cK5qkfAP5V9bZKX7PQQXR
	AbNxgXzi/NbpzOyo+iC7R0y2pA==
X-Google-Smtp-Source: APXvYqyQOx1Mh8BN8quXiDhAed/aYAWulKEKhVa3Mb/ZyWuR7rr+nf/aqyk54sCOnNEkg3jdwK61ag==
X-Received: by 2002:a05:600c:414e:: with SMTP id
	h14mr1072184wmm.179.1582846018703; 
	Thu, 27 Feb 2020 15:26:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h13sm10619688wrw.54.2020.02.27.15.26.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 15:26:58 -0800 (PST)
Message-ID: <a0aceaefac62b9b582f8dba155f5d6118d096bea.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Trevor Gamblin
	<trevor.gamblin@windriver.com>
Date: Thu, 27 Feb 2020 23:26:49 +0000
In-Reply-To: <CANNYZj-EJ8kzbvRd5fnb2HKGUHFVnmnZfMfta99cFxO+q8Abpw@mail.gmail.com>
References: <20200226180746.121476-1-trevor.gamblin@windriver.com>
	<20200226180746.121476-2-trevor.gamblin@windriver.com>
	<CANNYZj-EJ8kzbvRd5fnb2HKGUHFVnmnZfMfta99cFxO+q8Abpw@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2 v3] coreutils: add ptest
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
X-List-Received-Date: Thu, 27 Feb 2020 23:26:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-26 at 19:13 +0100, Alexander Kanavin wrote:
> valgrind, gdb and strace are already pulled into core-image-sato-sdk-
> ptest (the one that runs the slow ptests on the AB), so there is no
> harm in adding them here as well.

Actually, there is.

Adding valgrind to the RDEPENDS of coreutils means all builds end up
needing to include valgrind. We really don't want that.

I know this is bad but it is the way dependencies work today :(

Cheers,

Richard





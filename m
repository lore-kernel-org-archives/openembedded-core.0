Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 610F97E95B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 11:43:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so2149096wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=AbY5RVad0dISP42Qhg9oZS7Zgq+g9TWugKCMuoPN8jM=;
	b=A9c94KwA7aPM3k/tj8tGul6MSsTQ7OuWchOk3uqxDoyoKTXrVEsHe2gel61L/yl+k1
	oeZ65Ekk0mJxuC0YJym81ZnDmap49W+51kejLHlazErhhT3cJ9+kAc8K0nZs4XyzKYtn
	9bTQCd6m87yAzxiTMRy4sO5KXRzuL8c1oUvWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=AbY5RVad0dISP42Qhg9oZS7Zgq+g9TWugKCMuoPN8jM=;
	b=CMp54HE2u7zjVjS8JLZ2fBSrnk5FbxZ3+3j4SXblctvaMzG81p3lTEkANUURBLn6Ul
	eXlo2bn51/mWataG1pwqA6ESIlo5Zz18OyyNjl9o/PxopfykfUdXh2YhUE1EPwbcuEU2
	kgSsYypxDybq3XOZSkMwyn7rTU5CFiNHq8hTUD5BfasWZnOXaiiXhoc7M12sOvcajLL7
	RnaiBnZzFEY/8XXsCj2sDcMfQTp+Tg0TSeTQyEnmct+4yxh2yiIRnxJXxQ4gOIxGOrol
	U2tyJCytDB0FX+uTieFXDcbdxPvH8oO9QIaKTgMx9Yt1Upb5fo7XTW2xDIuTwktU06RH
	7auw==
X-Gm-Message-State: APjAAAXPeNGRqYh5aW0EYW3ApPHsC1DCKZ3kZdnTWa+cFU6+doxnQdQa
	fUb/7dGg5oKtnabA2vsBCNfX6kqq+Ik=
X-Google-Smtp-Source: APXvYqw74brHE8FxsVdaqDp9hnbN3QiOIV+0LVSfKH+F9JLn09JWambcWBscK5k9UPfQFcjiWrabtA==
X-Received: by 2002:adf:9e89:: with SMTP id a9mr50286333wrf.78.1560512621053; 
	Fri, 14 Jun 2019 04:43:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r5sm4820296wrg.10.2019.06.14.04.43.39
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 04:43:39 -0700 (PDT)
Message-ID: <34f4c3911dcbb9e4856848a27a87ed6f6a9a3d4d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2019 12:43:38 +0100
In-Reply-To: <20190614072956.13672-1-bunk@stusta.de>
References: <20190614072956.13672-1-bunk@stusta.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [RFC][PATCH] systemd: Remove clearly incorrect musl patches
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
X-List-Received-Date: Fri, 14 Jun 2019 11:43:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-14 at 10:29 +0300, Adrian Bunk wrote:
> This removes clearly incorrect musl patches and marks
> systemd as incompatible with musl until these issues
> are fixed.
> 
> The previous status quo where systemd was made compiling
> with patches that are known to introduce bugs and security
> vulnerabilities silently delivered a sub-standard package
> to users, this change makes it clear where work is needed
> to be done by people interested in systemd on musl.
> 
> Patches that are merely questionable or not upstreamable
> are not touched.

I'll be interested to see what others think of this, I can't imagine
this move being very popular...

You can make arguments both ways.

Cheers,

Richard



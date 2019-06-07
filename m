Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AFCFA7E500
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 16:28:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c2so2762499wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=g6v//8hE3qjujWQCY8xI8ORu6U24TjfSnoQECvbm6SE=;
	b=WtmzB1OFGj3f14qABrlSlAcNdLmjf+A0d1T3TQyCG9xbxr6ch8cjKUPoXLMT7G8n8R
	E2CjnEw4eb638riHJ6oUdMP0TtO3pEqRdbCcTGUxA1Du3KPMM1c6F1/KXQ2lCzho4eaD
	hw4AW7aLsbRX0j9QOFyWNyYJ5gf84k6Wvp8NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=g6v//8hE3qjujWQCY8xI8ORu6U24TjfSnoQECvbm6SE=;
	b=rQWM22Ot5x4gkYQPXHFkzNE75VP6Pkkbmuden2cIYIHDMW0cDWiGElyEx/ls7duLaE
	A9AHqr7ZIbsG7bdO6SXB8BISqkkc0Ebdb+JSzOp+62xxBq4ujAChVOoLaYuY34I4UQLn
	STqUB3Vh79A97NA9HGFxwnSA8yMywG3LrsgM+uU+DFbiZttvtwHmPeAwrk0QgXwPWW2f
	BhqZM1NHmrdXtTLltcMJ6UNv50m6v7NwTwOa1MG7Gp8+oIlfQHz6XLDxMdpRv+jGiAua
	pWdokhdgubP8ldkkA3/BNqyhlK/Ez9+NmkM/ARnEXFW1Ifi5UM9qvV/N+RbXLO8l8wyL
	taMA==
X-Gm-Message-State: APjAAAXjvv7I0rAQq0y+JcX9SYAbE3hrvRaYFD1Y/4xykGZ0LaN6Tre1
	JmS23zbryJYOUBZodaKVW37tDg==
X-Google-Smtp-Source: APXvYqzsk3NzRFahKPA0XA5d8dlR7rtoF3UMvg68h7T4uYXjjsFMD5ogdq85gBPPliTyu2lc8CEwrA==
X-Received: by 2002:adf:efc8:: with SMTP id i8mr6197647wrp.220.1559924914452; 
	Fri, 07 Jun 2019 09:28:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f2sm3502258wrq.48.2019.06.07.09.28.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 07 Jun 2019 09:28:33 -0700 (PDT)
Message-ID: <e417891dfed7f62e557491f8e521df60ac17c77c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, Michael Halstead
	<mhalstead@linuxfoundation.org>
Date: Fri, 07 Jun 2019 17:28:31 +0100
In-Reply-To: <CANNYZj8KtBGkrzCVzB8NYxswQj4w_ksNvgrCny4ubnsR-zUojA@mail.gmail.com>
References: <20190607121954.116898-1-alex.kanavin@gmail.com>
	<7249681b3f030618eb01d15a597a01c1f3a10cfe.camel@linuxfoundation.org>
	<CANNYZj8KtBGkrzCVzB8NYxswQj4w_ksNvgrCny4ubnsR-zUojA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glib-2.0: udpate 2.58.3 -> 2.60.3
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
X-List-Received-Date: Fri, 07 Jun 2019 16:28:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-07 at 18:23 +0200, Alexander Kanavin wrote:
> On Fri, 7 Jun 2019 at 16:03, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > So far we've seen:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/682
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/680
> > 
> 
> Both are the same issue, and a rather bizarre one: instead of
> starting the build, ninja goes into a loop trying
> to re-run the configuration step and recreate build.ninja (its
> equivalent of Makefile) and not being happy when it finishes.
> 
> The issue is specific to opensuse/tumbleweed builders, and I was able
> to reproduce it locally by setting
> meson.build's modification time one week into the future ("touch -d
> 'next Thursday' meson.build").
> 
> Which brings me to a question: is the system date and time set
> correctly on those builders?

Perhaps not:

rpurdie@opensuse151-ty-1:~> date
Fri  7 Jun 11:25:45 UTC 2019
rpurdie@ubuntu1804-ty:~$ date
Fri Jun  7 16:26:20 UTC 2019
rpurdie@tumbleweed-ty-1:~> date
Fri  7 Jun 11:27:09 UTC 2019
[rpurdie@fedora29-ty-1 ~]$ date
Fri  7 Jun 16:27:52 UTC 2019

Michael? (cc'd)

Cheers,

Richard





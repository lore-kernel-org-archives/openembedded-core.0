Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3C86D4C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 15:03:01 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c1so14741201wml.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=x/g7H0liKLx9uGTkrfOaVTVmRSLPTErY6lJEFBjw2sY=;
	b=JHby/u5Q5xV6Pi8qB/CSy++QSGqq6Hud4PkkZlGgaYq27jTuRp5huqvGSk2BLQNxFj
	YB7L+OW8lsYjvEtmg6tBVgZSs9MnYA5OUrEf46EyE4sGSAriyxGixFoTd6LXy/A55mxN
	HYUXEjerS6Ds1D6vRoW7gjrggEFVZ9/kNvXX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=x/g7H0liKLx9uGTkrfOaVTVmRSLPTErY6lJEFBjw2sY=;
	b=RBfCtLvzPhpcZuec75TGXH9874rMYHUnoMAaFFM2DIGRZ0oUooZv4acyrEQLlpg9g4
	wxknwgcdadAH6Oh9pV6/2yP4UOeX+XDBUAN6BC1DrQVB8+YuyTzqLeD1aYg5VXV5v8lM
	b5uHA2Etu28ALJLJOg4mQ38g7uiEHwBJp52xcOMvqhD+rEY10Q59SGRctk4gd/bbcHBl
	X9Ga0y7mhB07FMH7trUvEd8LdufwDDyV42cdxmmDCGexLKFPR43VeywQNrULl3A8cNVJ
	ETDmmr9+8f8Rnkr7h1ppo5+T500DvcE8U6iCt5TgsqVEIPQwCuXoTGWzF91dFM6RtojW
	HOqg==
X-Gm-Message-State: APjAAAV6xYDZ3FEhviA8uVsVteocdPwDeDLsK1N1UwUZy+8s/NDVEqEI
	O/O7OR+YgyK86Y3ub2db8PgfvA==
X-Google-Smtp-Source: APXvYqxnrdYSlc/DB5mgrb9pSSyUa1Z9Kwp9yUOqZQoEUWfcgQcwR7QMRjkkZ5YPQh6PUl62ZucIrw==
X-Received: by 2002:a1c:a00a:: with SMTP id j10mr12651249wme.15.1555945382702; 
	Mon, 22 Apr 2019 08:03:02 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o1sm18556903wmh.47.2019.04.22.08.03.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Apr 2019 08:03:02 -0700 (PDT)
Message-ID: <9e7716f3cfd4ece8f022ba1e9816e9def1d4e451.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 16:03:01 +0100
In-Reply-To: <1555936919-19078-8-git-send-email-akuster808@gmail.com>
References: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
	<1555936919-19078-8-git-send-email-akuster808@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [QA][PATCH 7/7] manual sdk: remove this manual sdk test
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
X-List-Received-Date: Mon, 22 Apr 2019 15:03:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-22 at 06:41 -0600, Armin Kuster wrote:
> This is done during nearly all qemu testimage
> This seems to test "release" artifacts on the web

This does two things, it tests release artefacts and it also tests we
can run two qemus at once.

Whether those are useful things to test I'm not sure about but we
should make a concious statement in the commit message if we are
deciding not to test that.

Cheers,

Richard





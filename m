Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3894B61299
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 04:47:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so1289519wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 20:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=3AYAA4MCKxocCp1BRw4bkiaUd9e3J/dU9gd+iSXKTx8=;
	b=NRWkimZBi71CzKHjNzkIgpUflw7G4zw7Vgztd7BumL9oz8YVp9xYNLi5Uft8Bjrk6p
	+vqcpOkU2kEpyYGeOjFUlsvSE9gXVEe6KAC6t/uk4XeTs4cYmEu6sLuXwAY5vl10T+L8
	/HQPXmy5wq5AcnKi5SzwXXw2YaO5Xat3b5Fu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3AYAA4MCKxocCp1BRw4bkiaUd9e3J/dU9gd+iSXKTx8=;
	b=a+PC/poumWbUDC4Ma4x8ECOGTFX1YFCcbXggn6niJoOSS/nD5w2zoOJfAMEciXm+jW
	00FpZhsYhi34chklmlU1+h6+PnXwSAZ4ezSiHWULN7RQsQgdgkmc6IxbybEOhwB4TFx4
	Vq+/loXM1s85hmFKbUHpqo3+foY+Zx1A6CiDEfkaaT7ZD0IUctg5n/17aykuNYkvIFU4
	LqdGeQ8p4wm+TLfc/LwCvedK4AIOE4R/x1UR7T510YhLeh4KQA7d6iQvWodJovitPXxt
	syt/Pgd9VwsklD+dklRKQZW2sdb1gVqyWrz6j/mAazG/IDcAUSYvfynJsVZ3XK92hRIA
	WZNw==
X-Gm-Message-State: APjAAAW7xhSQTD2n3K79HpYdkToW08CkUcAsRh15di7p6ALU3IuDaRO5
	CaMk03k2gAZcEIf+2IcEvWOapw==
X-Google-Smtp-Source: APXvYqy1YQtDfbtXQ9teZkm7jT98IRSgxcMf75wahL4I77TA3Ad0GmHvfqERNrezohx03juMarDICw==
X-Received: by 2002:adf:a3ca:: with SMTP id m10mr3060570wrb.148.1582692422916; 
	Tue, 25 Feb 2020 20:47:02 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c141sm1180637wme.41.2020.02.25.20.47.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 20:47:02 -0800 (PST)
Message-ID: <beec08fcb1f0b492dced91217f2fdd598228f87a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Date: Wed, 26 Feb 2020 04:47:01 +0000
In-Reply-To: <20200224200202.61426-1-bruce.ashfield@gmail.com>
References: <20200224200202.61426-1-bruce.ashfield@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto/5.2: update to v5.2.32
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
X-List-Received-Date: Wed, 26 Feb 2020 04:47:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-24 at 15:02 -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Updating linux-yocto/5.2 to the latest korg -stable release that
> comprises
> the following commits:

This was included in testing on the autobuilder and we saw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1612 
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/315 
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1616

and I'm not sure if they're from this?

Cheers,

Richard



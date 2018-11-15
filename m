Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 381F96C190
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 15:12:07 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q26so8272970wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 07:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eh7awASliYhJiNVVuky7Wg9wCU/xtFqQnX23B5vLDZg=;
	b=B68G54yYesmKl0di4E8V2BRTB3WvD09RB9lAszJ0kCdxiNVRcIzF62mgeyVtAsYvZu
	98RcLf/cHgfLRxnBICcHKjvUal39JrS92J39j+E00yHP+YNEHKmRu2YkZBknmP6bmzsc
	jUIZq3DypkW8JmCubw+JscFByCiSA7yqxiH3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eh7awASliYhJiNVVuky7Wg9wCU/xtFqQnX23B5vLDZg=;
	b=dE6Sw6zDrho08edF+fR2k/M/579wNqKQmDen3Pe7S+YKM7FdMYUnoBDndzTiAXbovQ
	I0LLO1wyt0KizrfvVCcDbKht0DTY+IUvUwmMoi6oSZNjFW1zbfO7HlWhOAPx9450jLuO
	mWr5dhuIC+JUgZ+tilCEDNoK4TPuhCDhrIXzfqJnbJpJ8K5zEWtI2UksFOdXVPM63XfG
	HTETgpcnenCBI63suiBg0aHGqCqTseue+7mDNCO+5zOeObdBm8LsKeTKY/l/ax0WH+fY
	QYTwz4Qox8i5SdpB7bVCW445ecst4wIPGM5n2t+1bUjfxifAEYCQxqhE7IwSk4ls7P9D
	20mw==
X-Gm-Message-State: AGRZ1gI7VkHvW6S0ZOHGupwqR36Vr3/7P3RIVZAT9XcjiQpmN2T0gzrY
	MeMg+sV9bRYBSQwf0AKBcU2qCA==
X-Google-Smtp-Source: AJdET5f8V5yLvRPDXSnVPfwMCwoaAowIerVk88WKj+bfOjMKcWtwN6TUW3J+n2RDwMakl9RHknzWVQ==
X-Received: by 2002:a1c:8791:: with SMTP id
	j139-v6mr5717727wmd.76.1542294727427; 
	Thu, 15 Nov 2018 07:12:07 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t5sm3613680wmg.43.2018.11.15.07.12.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Nov 2018 07:12:06 -0800 (PST)
Message-ID: <542aa42e3bdbdbe65f951c12a9df2c3a03171a41.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Burton, Ross" <ross.burton@intel.com>, Marek Vasut <marex@denx.de>
Date: Thu, 15 Nov 2018 15:12:05 +0000
In-Reply-To: <CAJTo0Lb=60EqJOVYYi2LQ_jiu+bKhKF=4T0bQAnVivjSP4bVvQ@mail.gmail.com>
References: <20181115124339.19543-1-abrodkin@synopsys.com>
	<23029415-903d-40f8-9f72-7d97d67aee7b@denx.de>
	<CAJTo0Lb=60EqJOVYYi2LQ_jiu+bKhKF=4T0bQAnVivjSP4bVvQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>, alexey.brodkin@synopsys.com,
	OE-core <openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v2] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 15:12:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-15 at 15:00 +0000, Burton, Ross wrote:
> On Thu, 15 Nov 2018 at 14:50, Marek Vasut <marex@denx.de> wrote:
> > I have to admit, the recipe name becomes a misnomer then. But
> > renaming
> > this recipe would be hard, since it's used all over the place. Any
> > ideas?
> 
> Call it u-boot-tools, potentially merge the other recipe tool, and
> add
> RPROVIDES for compatibility?

You mean PROVIDES since we're talking PN namespace, not PACKAGES?

Cheers,

Richard



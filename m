Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E65277ED36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 11:44:54 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p13so24432612wru.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 04:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=nsHzHC0uqEesI/+CLANdC0UKnZI9rlFl+sFWX78e+sE=;
	b=ghhXCdrOC5fuBTkwNLypq4eU3TlC70Mn0ubogmhU8mfWDjRpvqRqlxzZ6RcOdgqG59
	JHJ188bKjfANtwtg2pz1hLRFcEz3AXJfNNWXgPAQFVCYV8AnOB/7AgFGhwE4mXi/vDeQ
	6LDlmlmTcJOEac+bm0GCkGNznHpm6DOm8DNFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nsHzHC0uqEesI/+CLANdC0UKnZI9rlFl+sFWX78e+sE=;
	b=JvmWIlbMS0KJ+GjdlkYHOS0eg4we+e/nWh4BmnmDb+HM1kUyNIdOUiwg1kX3gIxJfA
	08P0LEo2/nfefdQ0ci4XnTiG5IGXh26p+4bqfwT1ti4muwSALiLhYf4YWRXF0gn/pxWu
	t/iqFt2ko+dUhKbKqTRBpwjmhAm3ct92SMsiuEumyfv47F84aGGlvwxjEF4vCwZtqT82
	BFbrd22Jtnp/CckHYh6sEFBIfRkmQHgSVhPTZd7bI1Dfo204ymOq6dN5Vpn4ZBis3haZ
	/PXi7xXJxtbT3v0Iu1k7rtjZCQCiBG5Sw9wbqvRhUEFnBlf/3e85JTiPX/J/dj7d1HWS
	lSEg==
X-Gm-Message-State: APjAAAU9Qi0iMZNtiGLYm6g0OaMf9oJfXA0tqLgpDSuXSI6vNz5OuHmH
	0xgbaiiRG+W5MaNYUFghOmEMTRIcE8M=
X-Google-Smtp-Source: APXvYqwBdW9sF+RxMopoiYy8PbUyrRWT35/SIuemC5Z2HJDkdpjOSKrtJuNTbC8CAz4gnS/+IN/igQ==
X-Received: by 2002:adf:de10:: with SMTP id b16mr11192543wrm.296.1563363895653;
	Wed, 17 Jul 2019 04:44:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j17sm28518481wrb.35.2019.07.17.04.44.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 04:44:55 -0700 (PDT)
Message-ID: <a098852b41fcdb4adcda5060a3fd87694391e0ea.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@bmw.de>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 12:44:54 +0100
In-Reply-To: <1563354517-31850-1-git-send-email-mikko.rapeli@bmw.de>
References: <1563354517-31850-1-git-send-email-mikko.rapeli@bmw.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] busybox: enable unicode support
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
X-List-Received-Date: Wed, 17 Jul 2019 11:44:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-17 at 12:08 +0300, Mikko Rapeli wrote:
> While creating and deleting files with unicode or other
> encodings works, it's annoying when ls and other core utils
> show questionmarks instead of the unicode characters.
> In 2019, it's quite common that users of embedded devices
> based on yocto need unicode support. Debugging a box with
> unicode encoded file names is a bit annoying when core utils
> from busybox don't support them.
> 
> The unicode config fragment has the same config as Debian in their
> deb and udeb builds of version 1:1.30.1-4.
> 
> If developers do not want this or other default yocto features in
> busybox,
> or optimize the configuration for size, then they likely run a
> completely
> custom configuration. Thus I think it's safe to enable unicode
> support
> by default.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/recipes-core/busybox/busybox/unicode.cfg | 10 ++++++++++
>  meta/recipes-core/busybox/busybox_1.31.0.bb   |  1 +
>  2 files changed, 11 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/unicode.cfg

Can you give an idea of the size implications of this change?

Cheers,

Richard



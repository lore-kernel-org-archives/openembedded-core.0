Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AAF166021B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 22:42:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j16so4578266wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 14:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=RSZhiCz5yJ8BfeuIaSE6uiuJfuaXmkeWy8KRHeoGaR8=;
	b=MQrat6CCBhtHPaX4K6EK/lTc0BW7sMbY7OhyQNQ/8ShWal9KzixwwlJc5feeerbVf8
	R+sd1tHEpTV89Z4eFyEOzeeGHjA79HpkSrrTh9ZqiWs93FkJmNd2JA+R4s5nHov5rDnw
	C8NdJeN7cNLRWytAXfo2t6yMpDbXOIr3y2u0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=RSZhiCz5yJ8BfeuIaSE6uiuJfuaXmkeWy8KRHeoGaR8=;
	b=mYD6O8xuxSInrm1sEZ4JoDZ/3K5q+Pl+nGHzDchPWPuOi5CR95yfFTqftUtQgF7ITn
	jdg31UN39cCmyWM0hIDfliXKf85oxK011v3RNn66VJ/9sIuiehB+UxljofHgI4WpFZGA
	hq8/xy3jtS8b2fl92wdLM9AccawOZ1hr5ABkcXn0PfzlJqQ02Y33ig3WAQSOgcJz5vCn
	I+Fuc7lnkvd/OtXK8utwwdf3i1pM5tpY7RU5YxhPRyR/YZpf7LTnBE/O4v2fdaQEQcvo
	5+/R1FpFiz9jYl3Bt9HwWQg21rbDvnmdp6Sx7GeZ1J+r5kkNXuDc77FaXSlJWKaR2uhV
	UNKg==
X-Gm-Message-State: ANhLgQ2pjr3Hssrn54rbMI4gIB9tGBdWVAOqWokvXVoGlJ6q1/Drcrno
	V2lH0JXrSl3i4lC2QBwZ7bv9ng==
X-Google-Smtp-Source: ADFU+vuf34WNCAMoQOxlSvcFOFJ5IFuRriN7W/byXh7m6Yjlm0lPHqsLOFDvsyCgoludSSHR8mSgOw==
X-Received: by 2002:adf:9521:: with SMTP id 30mr6048368wrs.349.1583361726321; 
	Wed, 04 Mar 2020 14:42:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o27sm43530272wro.27.2020.03.04.14.42.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 14:42:05 -0800 (PST)
Message-ID: <efd0caee261782a0b8d752c728c25be23f69cbae.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Stephen K Jolley
	<sjolley.yp.pm@gmail.com>
Date: Wed, 04 Mar 2020 22:42:04 +0000
In-Reply-To: <CANNYZj83rytWFgGPj6BS6R874eqa6_KCoeoMA5afgnx-_YBunw@mail.gmail.com>
References: <107c01d5f174$bbf566a0$33e033e0$@gmail.com>
	<CANNYZj83rytWFgGPj6BS6R874eqa6_KCoeoMA5afgnx-_YBunw@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW09'20
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
X-List-Received-Date: Wed, 04 Mar 2020 22:42:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-04 at 14:00 +0100, Alexander Kanavin wrote:
> On Tue, 3 Mar 2020 at 16:59, <sjolley.yp.pm@gmail.com> wrote:
> > coreutils ptest blocked on libmodule-build-perl reproducibility
> > issue
> > 
> 
> I sent a patch for this.

Thanks!

Just FYI I think there may also be a couple of other packages coreutils
pulls in and they may also have reproducibility issues (gettext-ptest,
glibc-locale-* and procps*).

Cheers,

Richard



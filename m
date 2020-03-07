Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id D214361996
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 17:02:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id p9so5703826wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 09:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xMTrnbeIpgYeSM8HuHg938sZg84lc2Htn0bg5Nk80dc=;
	b=SW0fG8QLUHmTwF5Zh46E9lPO/Dk+o3DmqjDwn/6rO1eofjp1llGl/dL9fbjumUr5SA
	xHfCmmSKcxPZjjqK9pWzS9wAHkacacYAuNYXAhpcVRzKgrgNFlKXC1xHPMW7tnPQdSnT
	7ZHYDhJgSggocaSDYpCTx38DTYeL50iwhPeAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xMTrnbeIpgYeSM8HuHg938sZg84lc2Htn0bg5Nk80dc=;
	b=E5/XRo677K9q6raFoT6EvoRdiLYdx1bW+I6hf5sccpbPmnSl95NpaSjzIQJUTmu7QG
	cv90WPKrz+pgbjVmGdvI8lU11MJwtTtbCU3ccBYGeawG8hbB3ba4tlFGhXWuM0LOIwwT
	dqqMJjZfdXdFAiByE69unLaRYulWc6OYHSPLhs+K9q01WeoRX1JbHnPloo7liug0yOMG
	W0hf4Wu2nVZMTCJWSmxeZHfaj4Bksc1mw0Tg8SV88vmKn+sePLZpprYHOR1JQiGkLxKN
	p1nNBA/rApYFDeUquI++oeIuRIRdBpsSpi149H7h2kS2Mv3r2nKSK9CdDbHUMBpMMGz3
	p9Kg==
X-Gm-Message-State: ANhLgQ2bhBfnvWMPlqPMD4lFRgsxtNlLrDQjJGxWqI9MDh0eOnsgDf+5
	1UuhD4zMHw93+376ZB0a70Oxzw==
X-Google-Smtp-Source: ADFU+vtGnw717iZcoePbjDaIU8Qs+5yuU4ejDzea5UwkuKvPhIw5wVBCtax+ugP2aatZbrF9YiYFcg==
X-Received: by 2002:a1c:5585:: with SMTP id j127mr10465699wmb.35.1583600554535;
	Sat, 07 Mar 2020 09:02:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id u8sm8421587wrn.69.2020.03.07.09.02.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 09:02:34 -0800 (PST)
Message-ID: <a1676c407198a6512d6069ad9a40a9c5a11cb03d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 07 Mar 2020 17:02:32 +0000
In-Reply-To: <c348a21730c09536d06458ac5e5d50377f381f4e.camel@linuxfoundation.org>
References: <107c01d5f174$bbf566a0$33e033e0$@gmail.com>
	<CANNYZj83rytWFgGPj6BS6R874eqa6_KCoeoMA5afgnx-_YBunw@mail.gmail.com>
	<efd0caee261782a0b8d752c728c25be23f69cbae.camel@linuxfoundation.org>
	<CANNYZj_Q72+SDFEeq68d214wt+Ft4NA0gUYHEYsdCmzkv+b_pw@mail.gmail.com>
	<c348a21730c09536d06458ac5e5d50377f381f4e.camel@linuxfoundation.org>
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
X-List-Received-Date: Sat, 07 Mar 2020 17:02:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-07 at 16:58 +0000, Richard Purdie wrote:
> On Fri, 2020-03-06 at 22:53 +0100, Alexander Kanavin wrote:
> > On Wed, 4 Mar 2020 at 23:42, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > Just FYI I think there may also be a couple of other packages
> > > coreutils
> > > pulls in and they may also have reproducibility issues (gettext-
> > > ptest,
> > > glibc-locale-* and procps*).
> > 
> > Patch for gettext also sent :) glibc-locale and procps I could not
> > reproduce :-/
> 
> Thanks for that fix, it helps!
> 
> FWIW, what I'm seeing with glibc-locale is that these files
> "disappear"
> from the packages in one of my builds:
> 
> ./usr/share/locale/vi/LC_MESSAGES/libc.mo
> ./usr/share/locale/ko/LC_MESSAGES/libc.mo
> ./usr/share/locale/en_GB/LC_MESSAGES/libc.mo
> ./usr/share/locale/ca/LC_MESSAGES/libc.mo
> ./usr/share/locale/fr/LC_MESSAGES/libc.mo
> ./usr/share/locale/pl/LC_MESSAGES/libc.mo
> ./usr/share/locale/id/LC_MESSAGES/libc.mo
> ./usr/share/locale/hr/LC_MESSAGES/libc.mo
> ./usr/share/locale/uk/LC_MESSAGES/libc.mo
> ./usr/share/locale/ja/LC_MESSAGES/libc.mo
> ./usr/share/locale/gl/LC_MESSAGES/libc.mo
> ./usr/share/locale/es/LC_MESSAGES/libc.mo
> ./usr/share/locale/el/LC_MESSAGES/libc.mo
> ./usr/share/locale/pt_BR/LC_MESSAGES/libc.mo
> ./usr/share/locale/sl/LC_MESSAGES/libc.mo
> ./usr/share/locale/lt/LC_MESSAGES/libc.mo
> ./usr/share/locale/rw/LC_MESSAGES/libc.mo
> ./usr/share/locale/sv/LC_MESSAGES/libc.mo
> ./usr/share/locale/cs/LC_MESSAGES/libc.mo
> ./usr/share/locale/nl/LC_MESSAGES/libc.mo
> ./usr/share/locale/zh_CN/LC_MESSAGES/libc.mo
> ./usr/share/locale/ia/LC_MESSAGES/libc.mo
> ./usr/share/locale/fi/LC_MESSAGES/libc.mo
> ./usr/share/locale/be/LC_MESSAGES/libc.mo
> ./usr/share/locale/ru/LC_MESSAGES/libc.mo
> ./usr/share/locale/nb/LC_MESSAGES/libc.mo
> ./usr/share/locale/zh_TW/LC_MESSAGES/libc.mo
> ./usr/share/locale/tr/LC_MESSAGES/libc.mo
> ./usr/share/locale/de/LC_MESSAGES/libc.mo
> ./usr/share/locale/da/LC_MESSAGES/libc.mo
> ./usr/share/locale/pt/LC_MESSAGES/libc.mo
> ./usr/share/locale/hu/LC_MESSAGES/libc.mo
> ./usr/share/locale/eo/LC_MESSAGES/libc.mo
> ./usr/share/locale/it/LC_MESSAGES/libc.mo
> ./usr/share/locale/bg/LC_MESSAGES/libc.mo
> ./usr/share/locale/sk/LC_MESSAGES/libc.mo
> 
> I can conform they're not in the glibc stashed-locale sstate object
> so
> they disappear somewhere before that in the glibc recipe itself.
> 
> Quite where/why I don't know as yet.

Just to save anyone digging, the difference is in configure, one has
msgfmt in the sysroot, one does not. It is there later in the build so
its probably task dependencies not being right.

Cheers,

Richard



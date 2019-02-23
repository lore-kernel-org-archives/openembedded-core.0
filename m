Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 572807CC7C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 09:36:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id z84so3987435wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 01:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+T8QgRxS/v5GnTeFbdPQQtah9JVBOztXwQQD/d6EKoY=;
	b=G35Dqg7olGuhWCRIl1awdH/MhQIMd7q65fDZeWTHzr0SWWMGtczRhOjckxKoyO/rpO
	a6lyihCU3MC1s65k6s1j9DIOaTezABNkR4VSgy0B7plYajKliGj+imsQ4/ZWSEeWZv33
	vTrB7Nnh5QCajFLTTvVTi+wyHRglXPi36XP/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+T8QgRxS/v5GnTeFbdPQQtah9JVBOztXwQQD/d6EKoY=;
	b=CM4fWVmfXqH6fbMCOX26HtWmXH7RrG0M3XOzD6wV0qcyjU8o2sqPM90CXEHnt2vqFb
	32zNAT4J1jntfh+Ve7becaSpHKw5gf3ZbQLV8Zc3dViDjQAG2UthOPagXu7nxtbbQF6O
	IDItGd18ZC5WX4POeFK+QR30V8A+kEwT3kOrRcUWJQJXjr2r2MBKoDEeSXjHA6ZRPzic
	bsMdyJWSfDicWiRaSCOG2hKGXOWBcIngrBJmH/pSTupRnMbgBULARlizEe7qRl2M3HXD
	vrWdfWEefEroEIYVAB6fkrWMUyQArpPwhvBePYRP9/yNxyaVXoyoSlvBsXmPGbGRTH1j
	1HUg==
X-Gm-Message-State: AHQUAuaoT9dNs31BQFHp0YAYqDa32yTSvVdhIia/s1awWvxiFY8hoxeB
	gSGL1dEwnaB2VAHJOQc+KR8LQg==
X-Google-Smtp-Source: AHgI3IZGVERHNt4b5Cv7SOdJbVa6EGzGje20Dgx1yLsEabmLVg4vrUtw7esihzXIqFdP1LhwI9Irbw==
X-Received: by 2002:a1c:a4c4:: with SMTP id n187mr5026764wme.15.1550914581930; 
	Sat, 23 Feb 2019 01:36:21 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u17sm6436361wrg.71.2019.02.23.01.36.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Feb 2019 01:36:20 -0800 (PST)
Message-ID: <4171dd4196ea514bac20b44b37ebf28acc1958eb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Anuj Mittal
	<anuj.mittal@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 23 Feb 2019 09:36:19 +0000
In-Reply-To: <0414b3b6a2c7404883f691c4198b8007@XBOX04.axis.com>
References: <20190220071247.3758-1-anuj.mittal@intel.com>
	<20190220071247.3758-2-anuj.mittal@intel.com>
	<0414b3b6a2c7404883f691c4198b8007@XBOX04.axis.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] glib-networking: upgrade 2.54.1 -> 2.58.0
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
X-List-Received-Date: Sat, 23 Feb 2019 09:36:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-21 at 23:46 +0000, Peter Kjellerstedt wrote:
> This does not build any more if USE_NLS = "no" is used. Has anyone 
> looked at making this work together with meson? Otherwise I guess 
> there is trouble ahead now that more and more packages are being 
> converted to use meson, since the code in gettext.bbclass currently 
> only supports autotools. A quick look at meson's i18n.py module does 
> not indicate that there is any easy way to disable the gettext 
> support, corresponding to autotools' --disable-nls. Apparently it 
> was discussed in https://github.com/mesonbuild/meson/issues/821, but 
> it seems they only added detection of the gettext tools without 
> adding support for disabling gettext and then closed the issue.
> 
> Looking at 1d6648102 (json-glib: fix native build), it seems Ross 
> encountered a similar problem for json-glib and opted to workaround 
> the problem by overriding USE_NLS. However, that does not seem like 
> a long term solution...

Once, we did have people who had interests in these things *and* time
to be able to go and work on them. The way things are at the moment,
the people who would have once done this are no longer available.

I agree this would be nice to have and we do rely on it for some parts
of the build system but it will need someone to step up and work on it.

I don't know how to attract more people to help with these kinds of
things, I think over time things will improve but we are struggling a
bit with it right now.

It is worth opening a bug for so we can track it.

If someone had time to talk to upstream meson, that would also be
useful, see if we can convince them its a good idea.

Cheers,

Richard





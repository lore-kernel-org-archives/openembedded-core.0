Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 633A161491
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 14:52:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a6so18794737wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 06:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=yY+G2SGuy8SS41uepVVRpx/9ba7fh7hOYPYtIx7sNGM=;
	b=cH99ZL4d7KNqF1ayCb9AzMs8V/98IGbL4ehAmTjyzaOcdp32bBzLDAyOLGAj7eKQJZ
	ORrxHLxF+KX2gWxK3NvrsR5mIVI7MEWSt5H43liJPlDP1Eq7/eR1QifJ0r4omooiY9R1
	qvdGuwH/8qPJnOZ+4mIwIr2pV3ITDhEw3tSuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yY+G2SGuy8SS41uepVVRpx/9ba7fh7hOYPYtIx7sNGM=;
	b=Me1jZR+Lz5UYGrxzfUMwxPowZxjoxM5XAP6oEA6IpzcJLyuPUxDJOH7dvO+hji+W+h
	n2fny8197uXlmxnChjWGIMV8Yi7CzSyMEUSigaNAqNNpkZcB2gcOugcJAJjJWXLmtVhT
	vALJHG+fXEL/d74CDvLFKI5tU1rNWFezQ4eAZgUoC7dPkPTmD0lruvURubpYCFT+xQwe
	eH5g8Ovyklk6VZxuqSUaKK9kVE++AHWxMJBFjSKXOM6/Z8YvPOp1iW9ufKgCk78WHD8j
	7KkXd4HVsLRFYqHX1+dgTIsuc3Glo879ZrmuNuFm02Y9t61XxajoesRrY3mqrDaXhDJU
	/+kg==
X-Gm-Message-State: APjAAAWIRL9OSLStePWtvk2NdreiDBpLNV7vBLO5lVAphqdT9aelBfSh
	AVxKHRdUFv7bC29d1jzvpyQK8w==
X-Google-Smtp-Source: APXvYqzAmOArPNmC9HIKC8LEwS13boN7J7x7Jen22W9Z57k8tKfkXq95eOACSE8NbiZGCABwx8xbsQ==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr22342426wmg.86.1581951159076; 
	Mon, 17 Feb 2020 06:52:39 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e18sm1271770wrw.70.2020.02.17.06.52.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 06:52:38 -0800 (PST)
Message-ID: <115c4464591f20859c7800b2116b8c692d8fd537.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Feb 2020 14:52:36 +0000
In-Reply-To: <CANNYZj8-66ksJFTysmwus3uQZz_KamJH19uo2gbUy6B7Z13tBw@mail.gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-9-alex.kanavin@gmail.com>
	<aceb5729c55050e1b1c9c62a316e500e621e33df.camel@linuxfoundation.org>
	<CANNYZj8-66ksJFTysmwus3uQZz_KamJH19uo2gbUy6B7Z13tBw@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/10] wayland: convert to meson build
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
X-List-Received-Date: Mon, 17 Feb 2020 14:52:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-17 at 15:50 +0100, Alexander Kanavin wrote:
> On Mon, 17 Feb 2020 at 15:35, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2020-02-16 at 16:50 +0100, Alexander Kanavin wrote:
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  ...-the-native-wayland-scanner-directly.patch | 27
> > > +++++++++++++++++++
> > >  .../wayland/wayland_1.18.0.bb                 |  9 ++++---
> > >  2 files changed, 32 insertions(+), 4 deletions(-)
> > >  create mode 100644 meta/recipes-graphics/wayland/wayland/0002-
> > > meson.build-find-the-native-wayland-scanner-directly.patch
> > 
> > I pulled some of your patches into -next:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/718
> > 
> > I think the failures are related to this patch?
> 
> Going slightly mad here:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1581/steps/8/logs/step1b
> libxkbcommon and mesa have failed in do_configure, but I am not
> seeing the tasks being run?

If I click the "download log" button there and download them I do see
the failing tasks in the log?

Cheers,

Richard





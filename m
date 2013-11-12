Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9311B6D8C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:39:17 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id lf12so2127231vcb.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 09:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5eutpsidbNfzQhQ+c3i9rEGz+zJvgMeGwsqTp/a2fX8=;
	b=Pd+ox/4ewHlcfcpY0F42BChweEzOeoQYK47snX/w5JXAypep5ORuYu0rYmOsFfbwWm
	sCdTJ12xBQLREzsjVJNRBon5GN565theQNwxfmu0/X/u0ge3ew/d8JPVOlxJ3zpm51h5
	yGsvlD/RJ+X9OPfa6CEFv+wwktGYrMWch9AraiseU8FeJHYc5jEKEZqQCD9n6HZIMCwv
	A9wMWRuHs9DUmGhucR5bD91MorGAnqQyRy3mLlafGqeyH5M1/quIZbCIO6RknEFFQP1k
	p6NiXiDMX9QjT+AIFf7h+lYAV82OPrKQgnVDPWJ/FaHKIDE4IuTl3Jg60QwqaJjueEBv
	1RHg==
X-Gm-Message-State: ALoCoQmTnZci+oHrCSgpWVLuSr1C2OFL2JfQWRViz4P1zW3IRFCXqM1LyVns8oMzWgRCY2XibNJx
X-Received: by 10.52.186.228 with SMTP id fn4mr2391906vdc.34.1384277959129;
	Tue, 12 Nov 2013 09:39:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 12 Nov 2013 09:38:59 -0800 (PST)
In-Reply-To: <1384148703-6189-1-git-send-email-raj.khem@gmail.com>
References: <1384148703-6189-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Nov 2013 17:38:59 +0000
Message-ID: <CAJTo0LbPenhYbNAcGU4qv91faZH8y6HUnixpxjGntQCBBPFeJA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] systemd: Upgrade 206 -> 208
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
X-List-Received-Date: Tue, 12 Nov 2013 17:39:18 -0000
Content-Type: text/plain; charset=UTF-8

On 11 November 2013 05:45, Khem Raj <raj.khem@gmail.com> wrote:
> -PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install ${PN}-rpm-macros ${PN}-binfmt"
> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
> +             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh"

You're creating an empty ${PN}-pam package here.

Ross


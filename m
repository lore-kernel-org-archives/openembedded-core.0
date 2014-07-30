Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 273516ACD6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 05:48:51 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id tr6so864022ieb.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=G1+jdVTqKO41HHdXGu6xdsBQaRG8GbazGA0Gp/2ZaQk=;
	b=A9L35tdOQB1HMsH7DXaBvK2zCLO+3mhF1J7OMrOt/hgcn4qBmMFtkdgMjHvoWyS0pw
	oXB9UDnqo5S0JbqtKcDH5KgVXyT3zfxhp3nO5Yh0BjjtsmBzlLwoiepVjzXkkyYcG+Hh
	xyvEhJWoU305/AhnqpT1i4SxCWoPMwn/1CU9EGZyqvyFeZz0KZsTJeh2jRmzbcmIR/Vv
	yaKpqudj0CCcg+9BgMqhZstocLDdkCi+GovVk2HRz4KANMn0Y+QM2m8GQqbOBz2JpUUx
	vHdG0sfHU9+Aw/YbRO9Y+rtScsbFz/adWo2R0Pqhj/R3jop0PmEl4qQmlPt2M7l1aRuM
	qtXQ==
X-Received: by 10.50.13.102 with SMTP id g6mr3818178igc.20.1406699332434; Tue,
	29 Jul 2014 22:48:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Tue, 29 Jul 2014 22:48:22 -0700 (PDT)
In-Reply-To: <1406667922-15716-3-git-send-email-dv@pseudoterminal.org>
References: <1406667922-15716-1-git-send-email-dv@pseudoterminal.org>
	<1406667922-15716-3-git-send-email-dv@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jul 2014 22:48:22 -0700
Message-ID: <CAMKF1so7iAY_b4U+TD1R4Pj7vFxiTdcsxaV_gEXGBWtoexao9w@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/7] gstreamer1.0-plugins-good: upgrade to 1.4.0
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
X-List-Received-Date: Wed, 30 Jul 2014 05:48:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 2:05 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> -X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
> -X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
> +X11ENABLEOPTS = "--enable-x --enable-xshm"
> +X11DISABLEOPTS = "--disable-x --disable-xshm"

could you also explain why this change is needed ?
may be in commit message


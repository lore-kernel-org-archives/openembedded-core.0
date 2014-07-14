Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 79CA77044B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 14:37:35 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id i50so719007qgf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 07:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yHezY9PXxGM5JewMHKJkTkvOMZVb+149WSgv0eCSpdM=;
	b=g8ZxEM0B1CCTqBNal+9oKZYL0b09XV7HIMTvXN/7KrJ/wiS6Um6VSggASwtb0fqbUI
	gfB0sDPtivn5t6SMJoLKi/BQ045fI+m3CQ3DE1IYpl9TUYzyKwqsbNOGN+ST7kF4mn9J
	nQ+hf5RkaPUMaJZj8E2mvZ98Dgw0+alcxx0pE/bDAvaoEhzyCR/s84J7M2vsTFceF0Uq
	uU7ApLokNR7sMHmYOPN9AMjK3SPVfqOTjc4wlOr7A45tt1Pd825nCLTaZ6T4POdPGN6K
	ZywEbPmm7EgSCH7SjfAxjozGA4U0khC1d5vhS4zRuAzUKaoDAxDoiKpZpL/y8JG8/Cqw
	O1oQ==
X-Gm-Message-State: ALoCoQmLbXk6p2vU9q5n9je0dw7oTScQFULYu5TNwkOpSHkZ3HI9wky4m+Mwwm7yW4PMQr257o2S
X-Received: by 10.140.91.164 with SMTP id z33mr23892775qgd.65.1405348656982;
	Mon, 14 Jul 2014 07:37:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 14 Jul 2014 07:37:16 -0700 (PDT)
In-Reply-To: <1405132947-32495-1-git-send-email-pab@pabigot.com>
References: <1405132947-32495-1-git-send-email-pab@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jul 2014 15:37:16 +0100
Message-ID: <CAJTo0LbzhpJb_CMkqRy6etVJnah0HACkP8k_8mKw3A+8s5kkwg@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cups: extend cups-no-gcrypt.patch to apply to configure script
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
X-List-Received-Date: Mon, 14 Jul 2014 14:37:37 -0000
Content-Type: text/plain; charset=UTF-8

On 12 July 2014 03:42, Peter A. Bigot <pab@pabigot.com> wrote:
> The original patch removed gcrypt from an m4 source file that
> contributes to configure.in, but didn't apply those changes to or
> rebuild the configure script itself.  This allowed libgcrypt-config to
> be found, adding native libraries to the target build.

I'm really not happy with maintaining patches to generated files, do
you know why we don't use the usual autotools class to re-generate the
configure script at build time?

Ross


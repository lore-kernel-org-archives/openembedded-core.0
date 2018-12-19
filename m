Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 912DA71984
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 10:43:15 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id x124so10668744itd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 02:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iXLGS9dCBA7x0Rknn36P1/P1Yvh/hVdum0I3v5JbWRI=;
	b=rM6Evnb5J+ZRwQBqux0VJGVuflxc4B67zQKm6jKtX9pQxC/UVcDwN1ur0EPOZbDylV
	xfOQwDFLzb8vYC95Zby6tHU8gq35a/Yai70EcX80B1M3XwrR93JL5TCnUay7mvSYqTYU
	iC0do10+WqoVCgJGJgsVkrklr2b91+/AZ37axseGU6fZJ82EXXrL+q4cBmokjS8evL/N
	KL+urKtl3lC4XDyuymQjvHZSp2fwuVURuXPu3FRiC0qNRL/SFjKIdVyueA3wa1pzjXks
	rQD3fF8zmoPQ9YA+gM+yHG2Rzad5CmWx/pSr8bwiLpWYpY+kf54r6L5qfeBM1S/clwHL
	gAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iXLGS9dCBA7x0Rknn36P1/P1Yvh/hVdum0I3v5JbWRI=;
	b=J/wFoPTYPRscHhs92YlhBYywz4LU3MfCibttHs9tmz1Ml4SuI/nyrfyBnSH8+t1UD1
	pNuxviz9m01EdrAlDhRuiXHeWIunzw7ABdQ//FoOaOacSmYEnj/oyyMTak7gnOz7Je4e
	QYw5VonjnNsgA2ZqkNnhahG5VimGaIpfFIakFWTOrFREKmooMFEvXId3yuq4PWs35Gm3
	TXQkY2EjcV3T044kRfflZNe4ZPpVwjinzuD0jGINjfg65uSUaSwRuyoqGL8X/qoJDGQn
	UuAtgA3K2smQBgUh59aZlZWAHOd4vfCAAkc96Lz/0AxeyZ/NfvT1VYj93+44e2AVgwKw
	w6zQ==
X-Gm-Message-State: AA+aEWZ7TyT/xvp9i6o+cZXGYCC49PSFvVos4f3MwHfSW8TvW4b87NpO
	7mBnuTmNIF91+bzqCo/58aXUquIoOKCTZ11XAaFAvQ==
X-Google-Smtp-Source: AFSGD/XXOoQJLto9eo7T2uc+HjSpjjOBBYTL4P2empm1vnK68gNX5jJIIXxyuYonbkDnyYBO/Pgqtoydsl+JAOfhpI0=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr5694533ite.26.1545216196593; 
	Wed, 19 Dec 2018 02:43:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1545204865.git.kai.kang@windriver.com>
	<922e1e9572f10bfe3d8d08f2e79f3d6505aa5b28.1545204865.git.kai.kang@windriver.com>
In-Reply-To: <922e1e9572f10bfe3d8d08f2e79f3d6505aa5b28.1545204865.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 10:43:05 +0000
Message-ID: <CAJTo0LZpHKrEmYA3y__V7F=S8zM7UdOWu1BUZLGrta_g_48OVQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] grub-efi-native: workaround for fedora 29
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
X-List-Received-Date: Wed, 19 Dec 2018 10:43:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Dec 2018 at 07:43, <kai.kang@windriver.com> wrote:
> +Upstream-Status: Inappropriate [native]

If we're going to mark this as inappropriate then please make it clear
in the patch that its a workaround for a specific binutils and when
that stops being used we can remove it.  However isn't this a problem
when building grub on F29, even outside of Yocto?  If so then it's not
inappropriate, it's an upstream bug and they should have the fix.

Ross


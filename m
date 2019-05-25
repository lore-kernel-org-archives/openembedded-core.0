Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 808AB7E42A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 16:04:51 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id h11so18222729itf.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zOiVLiM5LZkngtpamAE6NlO5ZUtG76toYu2cResQg9Y=;
	b=BKNaj3PmmMLn39rrgjycOSrwsni88Q0Awqb+WN43IrOtLvezVUz4iXBU4GDOOTULF2
	RRAOmGAxa9UL+I5sTshhkAC5bAJZh2UEDraswPT8LfGJaenlxGvUFKojDpEQUAVG0rVP
	gP8lyZYgBm0Y3/tPAVArOUUHOs3/ipr+QmuPtWI1aegSe8JcTEwLu8/unii6vQnAR2uG
	TAcJOy8ccAXD9LePchKMSPRJAxgtbs/hfdlGbydCHlPhGIkO/F4hVzL1tIJBaEfryueO
	paC9d+Et0dyZ5CirwbTL9+mbr5S0nYO3yLkrkcQWwso/VPjgI7AYenG+jSlUcdP8eKsz
	F1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zOiVLiM5LZkngtpamAE6NlO5ZUtG76toYu2cResQg9Y=;
	b=EUrsnNifJfEX/jey4CgPg0/PXYKaUXZZt1cw2/ds356yc8r2n/DdkkkUOVfA0HQ+F2
	JFHiiTVl5i4rqh/Pf/FFWj6OUtgqDCRGoWeFN893N5SfYSD1gANFVL5UZcjSMTVuefJV
	Sa1ZK6wyWqHpv0JGKd3nLyzIkCzDtw8OMdg0ok6MjUX9pB7tzjm+HgwbVaZedOfJXe0r
	tZcVMhQ1LfN6q7RsX0sZccqadAnTB6t9Sqtbj8MoO6mnLaFPafFGpD3mbGeN/MiEhQYT
	5Eb8NlxcYq1bYE/Hgc0e9LTdWvI/uMZvebbPUD0EV6t16Y9yRsIxklxs8GFYGOHLck0X
	fQBA==
X-Gm-Message-State: APjAAAXhJRsnDYdn2CKQTQPNEcEnA4Tb5wGkg0y9QyyE2H8OPVyEBi5y
	qmXkQCyRVvY1P3LgLKXxXgEcCai/+NQQeJtx4K2h0A==
X-Google-Smtp-Source: APXvYqwRx6wT6/i4rVhURccCgI/ohJJkWJopiPqTmsTK55hUYlKCkCDrEhKIb0G7qJ+W7qNHesGRU9Y5cQaFz8luYMs=
X-Received: by 2002:a24:2c48:: with SMTP id i69mr21210214iti.133.1558800292535;
	Sat, 25 May 2019 09:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <1558679856-10339-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LbEXnKfSfOtpj3QVL9xsjsQJTuiZAGarPEFNz4v7q7_8w@mail.gmail.com>
	<CALatG=5SSBOa_TyQh8vY-iYshvp6+XHCS-Lg7tHCg_-qSay2YQ@mail.gmail.com>
	<a59002825b793658afa2606f0d110d70a08e2384.camel@linuxfoundation.org>
	<d06ff93257184dae284426f6d8f52672f351f1af.camel@iki.fi>
In-Reply-To: <d06ff93257184dae284426f6d8f52672f351f1af.camel@iki.fi>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 25 May 2019 17:04:41 +0100
Message-ID: <CAJTo0LZJMyAFw_6jD0ZJjQUqQQ2CnbL_RptF4DXA5BJBNP8uCw@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ming Liu <liu.ming50@gmail.com>
Subject: Re: [PATCH V2] alsa-utils: fix multilib names
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
X-List-Received-Date: Sat, 25 May 2019 16:04:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 May 2019 at 19:59, Tanu Kaskinen <tanuk@iki.fi> wrote:
>     18575b082a4042376fd1575465e69562dea04ddc added bash as a dependency of
>     alsa-utils-alsaconf so that the script interpreter will be available at
>     run time.  However, this has the undesirable side effect of making bash
>     be a build dependency for alsa-utils and, for those folks who don't need
>     alsaconf but do want some other part of alsa-utils, this cure is worse
>     than the original disease.

Avoiding building bash seems like quite an overreaction.  I'd say
merge the recipes and split the packages up so that bash isn't a
mandatory requirement, maybe even using PACKAGECONFIG if that is
useful.

In related news I've been meaning to gut the alsa-utils recipe as
that's the last recipe that actually depends on gtk2.

Ross


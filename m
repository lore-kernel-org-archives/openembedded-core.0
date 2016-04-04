Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id A81D17317E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 02:36:42 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j35so138937281qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Apr 2016 19:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vZI/c7R0D6aXZHGshIqn1/egrPkBy108BYqhEOIslNY=;
	b=BKecAYxB7mRj/Weyh5dClvhE87H+DcZerYEPsLghWMCcjEJJKIEAFsIhOr2ZqEkXKl
	4MIrK2Iit4rvmZ70ZD/FGFZ3dO/117qPvmRTakFq6Le13eZc8OUAz6PlKsO5tti2g2sT
	IpdqzObpSeezzoUD58UypRZF600LuxuDzodzbriDvvszHhojEE9NgH/Jp224oAekVjWQ
	OhWA9V4MD4+KvrmEXI9bRI7d6doPFWLmCYXYoGAtKSNIscIxkOEEzWEw+gDi3Sq/8742
	N2VHS7WVQrh8w7iG8bzJxsAXAVnGo8AgsDKbNy2J8G+UIS8CIOyNQzsjA1IU/kX++OYT
	daew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vZI/c7R0D6aXZHGshIqn1/egrPkBy108BYqhEOIslNY=;
	b=XwHdLXzu9imGdzeWN5l5sdJaFBdaJqUmSzRw8sGemLk+2qFmc/UY8cO33Fc0lbTUty
	MVVAS4z3JA0PqqRzQ3v3EpvVlY56guHwpd3DcqVFokqfWUTjiF/PN1ZTUxkA8Wm+Mmlu
	o5nkGFGgatC2V7ZjQ0jU0kQHbPz0edsvXyPGxtzqxRf5YIgPI5laM4yt47KGSepv3hQ5
	88z+swKhgueuYTS1g8R3Ue5wdWD26NdmkUjcE6ORlmz8ANmFKvnL5+00xCQ9988FEkBm
	0fvSfV3Zn1inOHM1S6gG0uZN/tCo5LAH/hnHqQuSlEkUJVliBl1KCAk9PDq0Ci2pqumR
	onCw==
X-Gm-Message-State: AD7BkJJ+6AYb/GE+gVJsM5W7lSGhVBmY4xop4Xgz2PgHu2qbV053mJUzPe/qmjDeE7iMwAwNvGcc28Qm/V/A5w==
X-Received: by 10.140.176.23 with SMTP id w23mr8882610qhw.76.1459737403346;
	Sun, 03 Apr 2016 19:36:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sun, 3 Apr 2016 19:36:13 -0700 (PDT)
In-Reply-To: <1459724450.7348.146.camel@linuxfoundation.org>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
	<1459724450.7348.146.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Apr 2016 19:36:13 -0700
Message-ID: <CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Mon, 04 Apr 2016 02:36:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 3, 2016 at 4:00 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> I added some text to bugzilla. The gist is: In poky the sources are
>> not deployed.
>
> I don't understand that. If you mean playing sources in the -dbg
> packages, poky does that too. Is there some specific configuration
> Angstrom makes which triggers this?
>
> There was a bug in master recently which broke source file deployment
> into -dbg packages but that was a bug everywhere which was then fixed
> when we realised.

Max, somewhere in thread you indicated angstrom 2015.12 release which
would be actually using jethro
and if it has been recently fixed in master than it would explain why
it worked on poky/master and not on angstrom
may be this fix should be cherry-picked to jethro.


Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 483EA77CDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 01:19:02 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id s68so104869984vke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 18:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FIjvZ74bKEBKwlEY6WXVlOY3aMDU61ioHgnl8sBIMDs=;
	b=gj087kOc45ft2TkJOEActOY5/QlHceKR32BUdZogd/zV1DR9/FGGoLGEhPnsSR8vEg
	2YAsC8V12Up2mdSZZHMeKJefN+ST7BhI8bdEVlDK9FL3hooYqSwBvAf2x46MH3N65+ik
	ViATi+cmb31RceC13HW3ZtOk8iMTPgwW57ST+YxrGd3PIrZ6yuFYQArCx78YUPUF33Qh
	HDcrpCUdXcCW02mWn//0vZuPW6rBGWoE+lxMgbeMZd0/7XtFs9qIPKLWhVses/jVjTWV
	L8theJ8nq1YxgHgDQ39aiyJ1DIPm0H5pRKt1hxiX0nF6cgJxHdu86sxO4Bclp8h3nqed
	I4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FIjvZ74bKEBKwlEY6WXVlOY3aMDU61ioHgnl8sBIMDs=;
	b=Kura+7jzcYiA9x723HOTKtoIeYL5KgTPhKSdbk4zyVnqMU/6yIL2tPZOgOb4nLmzUw
	B2MZKD1BDvBl5ppzAqGQ6rY+hwVhXwBS8Kt5XvCWtpAGpv8Dw8dIgHvMl18HkUxMeQKb
	FT/uqSeTds1aKZFJzU2yeMjDBhu928xmrJfmwMAWPQy4h6AqRVXwUTbPhw5iGIRpgJi4
	TT6MuLanfuhPLrP0iWFH83ftkiLLIYtH9MQSEyCsoeG8CFyiLOsR8aBSeVEoHvVyKcEU
	iRfqHRL7oGfdMNA1c/7ufws7YFc57FHVinGMWi6Qsr10vvzVwEaS7bXpa5dxrx7KiOy6
	AktA==
X-Gm-Message-State: AFeK/H2NAGh3DvXAfvGh+P8/eX7U8Ihi/Fy+2gXR02jgAqO2nzSAc7bANuttKUP0nfx1ZWODf565TNELz+v2Gw==
X-Received: by 10.31.155.72 with SMTP id d69mr21697763vke.160.1491873544019;
	Mon, 10 Apr 2017 18:19:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.30.70 with HTTP; Mon, 10 Apr 2017 18:19:03 -0700 (PDT)
In-Reply-To: <1301981f-af40-612f-a383-5feb2886e33e@windriver.com>
References: <CAEg-Je8BnTDr6BxLOUBO3Y5a+yKjggk=cLSY7n-Aeq61GMVmTQ@mail.gmail.com>
	<1301981f-af40-612f-a383-5feb2886e33e@windriver.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 10 Apr 2017 21:19:03 -0400
Message-ID: <CAHUNapShkap-XagZvEu8=r_21QRX9TiEtV9XwL6gox4SrNohXQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: About misappropriation of one of my patches in OpenEmbedded
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
X-List-Received-Date: Tue, 11 Apr 2017 01:19:03 -0000
Content-Type: text/plain; charset=UTF-8

First and foremost, yes a patch from Neal was mishandled. However, I
think the dial went up to 11 on this one a bit too quickly.

As far as I can tell Neal's attribution still appears in the
0001-Add-fallback-fopencookie-implementation.patch file. All that
happened was that an extraneous "com>" was removed from the email
address so it is now valid. The line was modified, not removed.


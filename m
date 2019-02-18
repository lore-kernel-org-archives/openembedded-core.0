Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8DEDF6C1F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 21:38:41 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i5so30717579oto.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 13:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4kUNwXKnZfM6y3h/nHwCPtizoeF5iwJblbl2MG+RxEg=;
	b=WmukwhpEg77ITyWjinlM4GyNTq91JexXlxE7q69jAN8fX8xIwgRFegGeCTJTvjZMWq
	VJzci+FbERWW/1LPpqqneENxepBPLfr2fWzgb5Y0MRW2ZAywLjeniFxxCyaB7ooFtyPr
	pneVSV9YWjg3ySkqssX7CVWBvPik9sgmxxeXpYMeaDnjxqjH9kZ6X7TeSdDfPu913UZl
	P5gU0YF4YJ5u7RY2DDCya7luTapysLd+z1ZeCZCaFX8n7Ug1SFd589xkCRV8ynYZlOO0
	e9ZDlvc5bJ6/7YodhGT5pP+dr9eRenOqREBgTmyfM2w4XMhdbW7S4KOD9ddSjtNPhlhD
	BzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4kUNwXKnZfM6y3h/nHwCPtizoeF5iwJblbl2MG+RxEg=;
	b=Hrci6GAN2IPMzkDCVZnX77w1dHoCItP+TUgKBcAvoKEkA1i9I1fRnKCqedcKu5ZIyG
	55v79TP7q6/rSvSdFla5qEWU16KNmeimM1ihB5dxHNCiV7mwvPVFWl+Y4isXQ8u4ceMm
	vgFK4V17RyCC10KQK4ygumbhj9P6hqS2DHqmfP7jTTKvuZ+cHEPKYrb1tPmGdeb55ROG
	kT4uiRkM0oGawBK6UBzax/rsPqs+qCbOT0WXWirRxN0kqH6dyyVTasPtz5zcWhrPirln
	bb6Xer4lm+pcvPHXgVwfHCtPVCAUa4Vy1kpeMmBowhfopQ0/a3bebpmNCFUu2yUyp5hZ
	Ndnw==
X-Gm-Message-State: AHQUAubjte3vB8Z96qe48TpdoheCNq25NoM1K/ZnYl4ayHplQGPM4PAl
	sqsqq9bX13JbtJhiyHthArn43KC9/hM7Vwtv370=
X-Google-Smtp-Source: AHgI3Ia+E/El35NF1jmxSadvB97fAbxMHH+j5A4nOyMgxFrdKN9ncdaaoKQ1TOOWZqqlIUXDd+QlkB3QrzZizEXzU2A=
X-Received: by 2002:aca:c3cb:: with SMTP id t194mr563141oif.70.1550525922396; 
	Mon, 18 Feb 2019 13:38:42 -0800 (PST)
MIME-Version: 1.0
References: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
	<20190218132948.27668-2-fabio.berton@ossystems.com.br>
	<b44b056e67f02f40a40be9cef5614123b1caf906.camel@linuxfoundation.org>
	<CANNYZj_XPBcXkqEkpkRZNqY6YQZTq0iNOmxa7HJZP77kUUZ_5w@mail.gmail.com>
	<730c5d1fe48cd4ed6063e0434271e3ab97ccd66e.camel@linuxfoundation.org>
	<CANNYZj9jUGVhKv3muArOrvrBLkPoWSb0eOSZmbQJ3jDKctkBCA@mail.gmail.com>
In-Reply-To: <CANNYZj9jUGVhKv3muArOrvrBLkPoWSb0eOSZmbQJ3jDKctkBCA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Feb 2019 22:38:30 +0100
Message-ID: <CANNYZj9+iNCrkA-8q2-m70F-PhyhfXhw1ZYtSe2ft-RbMoQFbA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Mon, 18 Feb 2019 21:38:41 -0000
Content-Type: text/plain; charset="UTF-8"

Also, mesa 18.3.4 is out :) so you could add that in as well in v2.

Alex

On Mon, 18 Feb 2019 at 19:20, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Mon, 18 Feb 2019 at 19:12, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>
> > That does, I think the patch still needs DRIDRIVERS = "swrast" though?
> > The details here should be in the commit message too.
>
> Ah, I forgot one more detail which explains the above: there are two
> swrast drivers, one dri-based, another gallium-based. Autotools lets
> you build both (not sure which one is installed then), meson forces
> you to choose. Thus DRIDRIVERS = "swrast" is only set for _native, as
> for _target we get the gallium driver instead.
>
> Alex


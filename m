Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AB0E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 11:35:47 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.web11.56587.1736159662885980355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 02:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dolcini.it header.s=default header.b=sJqplrI3;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id F39521F83F;
	Mon,  6 Jan 2025 11:34:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1736159660;
	bh=FSt9NGIIHPttmI2EwOjZmdLoytCMrX+Jx8F3/CbVSyE=; h=From:To:Subject;
	b=sJqplrI3ImWdqfAIv0Zbyrv9/CshvrwGwh6ezAwaU259ims48Y79Re7EA9oNVU741
	 x0mve6JveqAKT9UyMnoS8Wi7J+yAxC3cJwc454SwiYl042YRYZPnGkzkz+u1lvZh8x
	 UBip9zHKu6aHBGXk5+bXAvwDDkvNfrVam65LmDjDNQEA+b6m1h+yD5h5Bw8nafsEsj
	 LNovWKtdMlcuh3il89mZS4VwLUP1lUqRLF4eui0MiwGrRZE4vkLJSyCG4s/R3YGTMx
	 cFTl9GvCL5Thted4doLXKJIUgCVVpWROxWWc+dNzVa+75ivtPKapwFHgJke7jOfg5C
	 5bBdFQK424OzQ==
Date: Mon, 6 Jan 2025 11:34:16 +0100
From: "Francesco Dolcini" <francesco@dolcini.it>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: rafael@beims.me, openembedded-core@lists.openembedded.org,
	anuj.mittal@intel.com
Subject: Re: [OE-core] Possible upgrade of Bluez in Scarthgap branch
Message-ID: <20250106103416.GA15108@francesco-nb>
References: <17206ef3-ac44-4b07-b881-a639fb94f6fc@beims.me>
 <CANNYZj_V66Nzntuxx7jKgBjRxBKXJKkN_hgsFYTSRJ36j+030A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_V66Nzntuxx7jKgBjRxBKXJKkN_hgsFYTSRJ36j+030A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 11:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209450

Hello,

On Fri, Dec 27, 2024 at 08:05:48PM +0100, Alexander Kanavin wrote:
> On Fri, 27 Dec 2024 at 15:11, Rafael Beims via lists.openembedded.org
> <rafael=beims.me@lists.openembedded.org> wrote:
> > We found a problem related to key exchange that affects Bluez 5.72. This
> > problem was already resolved on Bluez 5.79
> > (https://github.com/bluez/bluez/commit/366a8c522b648f47147de4852c5c030d69b916b3),
> > and now we're wondering whether it would be acceptable to update the
> > Bluez recipe to the newer version on the Scarthgap branch since we don't
> > know the version policy regarding this recipe.
> >
> > We can prepare a patch if this kind of change can be made on the
> > released version.
> 
> The LTS version policy is bug and security fixes only, for all
> components.

I would say that what Rafael pointed out should qualify as a bug fix, in
such a case would you bump the whole bluez package or just add a
specific patch?

Francesco



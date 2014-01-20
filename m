Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 839BB6B678
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 17:38:47 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id t60so7047563wes.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 09:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=klHmR4ySItocFc5VxCAjW/THaJVFQ7aFXcjgvrzSEVk=;
	b=D4SpGCKhJdpOm7EmWoJUohxJEpyhTHDbnK3REhzV2BeiakN3rYSy5Fi4LFPPQkm6k/
	4D2o1GZpyPpDdiKWBrxRwuLkklZbL+Io4GA9dMM37zrODXUciYMMqvpP2IELpMAFYNSq
	z5q0cO2dFwfLsdIUgknebt91515FebVVipggJ97w5y9NmbSey8lhrNRs/iS62znbZ0la
	QZ8dW+kQrRpEqpAg0QXZ9yQt20VNOQRMAMZnRNE3o/gVOdSyXtQgLpkboTxCnZM8yu+i
	NtMb02aXiMuh1y8nw+zoQ1M0DN+Veu3M0cudZIA+v++3K7bLm4KcoPoqZ67+HcGQBnbO
	r/zg==
X-Gm-Message-State: ALoCoQlFUK5cwlJjuSCXDu2JpO5/P3MvgS1fkMFdZeEQt1+x70n6BvK5TrjfCR7qKRNC2onKOsKv
X-Received: by 10.181.11.201 with SMTP id ek9mr10833373wid.54.1390239528039;
	Mon, 20 Jan 2014 09:38:48 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id j9sm2578236wjz.13.2014.01.20.09.38.46
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 09:38:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZ2HFJ1QAyRYW9XXOrkttW5UOenkuFK29Z_R9si4sJCRA@mail.gmail.com>
Date: Mon, 20 Jan 2014 18:38:50 +0100
Message-Id: <6994CE74-3907-4CB6-8104-F3986ECDB5AB@dominion.thruhere.net>
References: <1390236004-18570-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LZ2HFJ1QAyRYW9XXOrkttW5UOenkuFK29Z_R9si4sJCRA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1827)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] kdbus: add git version
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
X-List-Received-Date: Mon, 20 Jan 2014 17:38:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 jan. 2014, om 17:49 heeft Burton, Ross <ross.burton@intel.com> het =
volgende geschreven:

> On 20 January 2014 16:40, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> This builds the kernel portion of the kdbus implementation. Userspace =
support needs systemd git and/or a special glib-2.0 branch.
>=20
> As awesome as kdbus could be it's very much fresh code, can this live
> outside of oe-core for now?

Sure. I haven't decided if I want to go all the way and make glib/qt/etc =
use kdnus natively instead of the systemd compat mode. I only need =
enough to do a presentation on this at ELC :)

> Great to see it though, presumably you'll be making recipes for
> systemd/glib?  For what it's worth you might find
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/gt=
k3git&id=3Dfc7c87f1f038f7b816318e2102ecb1c67ec50065
> useful for the glib part after changing SRCREV (been meaning to send
> that in for ages).

I'm waiting for systemd 209 to get released which will have the needed =
bits, I'm testing locally with a systemd_git.bb recipe. It's very nice =
to be able to drop connman and dbus-daemon for small images.

regards,

Koen=


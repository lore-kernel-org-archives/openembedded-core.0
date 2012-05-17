Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SV7h5-0004TE-Rk
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 22:53:07 +0200
Received: by wibhm14 with SMTP id hm14so2004419wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 13:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=EmUFVEheQgFU3BroMPWeGCUW6+oNzzPQQCvw08RWC9c=;
	b=PStb6nGSoFzapC0iwpRwO7tzfHPIFuM6AKty3xFZuu8k+ydZlU+4CDzudvwOzTFZO9
	kHxSbk8YWpyaduGGgItihFHIxJP5rVWP3/7cdnAizHLemzmvsyL9YNTuXdeNMQ8cp0/o
	l9SBgf/cbuqGmHWtDtfUYA2ToFiPCtl9nZjCpMpEpiejp31C8UZrhrKtDQU1S+i09S2b
	0I/gIWV38GPrJSRX9DIiZ04UY9H0ZuDIu/ElNFOTJqMjMuVe+0zRpreRPlfXvPBTo0sK
	Jrj3CL/kun0aAQ8ygRjOAm6HENn8uPTgTHzEwCrAIxoJojIS2s9UCvYSOTnsMV0uwjVV
	kiHQ==
Received: by 10.180.81.234 with SMTP id d10mr21607272wiy.10.1337287384924;
	Thu, 17 May 2012 13:43:04 -0700 (PDT)
Received: from [172.20.1.66] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h8sm24758914wix.4.2012.05.17.13.43.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 13:43:04 -0700 (PDT)
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
	<1337286572.7473.10.camel@ted>
In-Reply-To: <1337286572.7473.10.camel@ted>
Mime-Version: 1.0 (1.0)
Message-Id: <0FEE2025-8E84-4CBB-8568-483A55233BD7@dominion.thruhere.net>
X-Mailer: iPad Mail (9B206)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 May 2012 22:44:32 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQlpGMBiKR5wcdtdTONHQH2bxAh81meaXgTZwluThwVNqWRajj0wj21c8emspsvA+doMrWTb
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 20:53:08 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 17 mei 2012 om 22:29 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> On Tue, 2012-05-15 at 13:54 -0700, Khem Raj wrote:
>> On Tue, May 15, 2012 at 2:32 AM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>>> The commit breaks pkgconfig and after discussing it with the kmod and ud=
ev maintainers the conclusion was reached that putting the libraries in /lib=
 instead of /usr/lib is not supported.
>>>=20
>>> This reverts commit 6b74f2461735272bd950a4f060dab6e778a36f92.
>>=20
>> while this is what I had initially it doesn't go well with kmod living in=

>> /sbin and accessing libraries from /usr due to our QA checks although
>> I am all for simplifying it where we don't make this check at all.
>=20
> I've had requests for it along with a commitment to fix it and patches.
> If we decide we don't want this, fine and that will be the case if
> patches are not forthcoming to fix the QA issues. I don't think we've
> reached that point at this with that yet.
>=20
> I've decided to accept this patch and "unbreak" meta-oe/udev at the
> expense of screwing up OE-Core. I am however still deeply unhappy people
> are trying to bypass OE-Core this way and then "blackmail" OE-Core using
> breaking meta-oe as a reason. The whole systemd thing has been badly
> handled and needs to get fixed properly.

What does systemd have to do with this? This is about a broken commit breaki=
ng udev 182 for over a week.
If you have issues with systemd, send patches to meta-oe to fix it. Or at le=
ast bug reports that are more than the insinuations above.=20



Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URhQ9-0006xs-9H
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:18:05 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so2184350eae.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 04:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Z8XdmOe4VVfFjlCVmkf/SIXgvCkzcEMyhrRiBl+sOyo=;
	b=SeReVz0kYdVESCCcHrym6ULf1Lg5Rkc5fNbXOIkT7EGwHAY1CQO14HdLmfQ2XCRQKN
	LP3+KyxpSP7kazliJHgxsLycUpd4TQ2LIy5N+a7IpbybXSTsm//5XNQ/+iMsFT0pTKLa
	8EADfz1Uo4TK2w8BJEBawJMJoIJNUjHqygqevJ4QMOHpuZmPdaCPSG+BTnpAlWoRUmcG
	4lL9TYwgR0+1IMV5FQf4I6+4Ch10f2Vwk8RyZxtFwM2bNj/9Cm7KLItOwGc78JbRCW4I
	kZkP5bkArX1BtlIlqNSdaiA79hR+2QMzXnwnOhxrBLG9gmhq8ci78kIGG9pQZwL6UnGA
	z7HQ==
X-Received: by 10.14.5.137 with SMTP id 9mr56423347eel.30.1366023632739;
	Mon, 15 Apr 2013 04:00:32 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id n48sm12697546eeg.12.2013.04.15.04.00.30
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 04:00:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbfDu6bOAPYjd3ohzZJcvPDmYiT4RcUhZC9JXkQB6dmOw@mail.gmail.com>
Date: Mon, 15 Apr 2013 13:00:32 +0200
Message-Id: <053E167B-AF9D-4E0B-B8D8-D518096D2C49@dominion.thruhere.net>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	<9D7AC92D-FF69-4A31-B99C-D2008675A27B@dominion.thruhere.net>
	<CAJTo0Laqc93oxZcHZ+vF99q_UqJ_8TUV4QAxPy6VfBLDBUxOYg@mail.gmail.com>
	<CAJTo0LbfDu6bOAPYjd3ohzZJcvPDmYiT4RcUhZC9JXkQB6dmOw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkg5zL4mfc0Bw+DBgu9KQO8DnMX9u2hG2CtA4TqGfujhWGp4Ynei2H65jFh26FoCigHzyaK
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-dylan][PATCH] systemd: fix bootup with 'ro' by re-adding util-linux-mount to RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 11:18:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 12:42 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> Hi Koen,
>=20
> On 15 April 2013 11:16, Burton, Ross <ross.burton@intel.com> wrote:
>> On 15 April 2013 11:09, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>> Does busybox produce any useful errors as to why it's not working?
>>>=20
>>> No, it pretends everything is OK and the remount succeeded.
>>=20
>> Thanks busybox!
>=20
> There's several fixes upstream that we don't have in our busybox, it
> would be much appreciated if you could try this patch which rolls them
> all up.
>=20
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/mo=
unt&id=3D1fc11cc25938b6a0c1e9b69a30326de8608cb98f

Do you have an oe-core patch?=



Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1SVIWc-0002MQ-Pq
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 10:27:02 +0200
Received: by wibhm14 with SMTP id hm14so2344213wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 01:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=rgyEbyfAvS5BXy1gN8CUwkhCH4jnx9n0y1+80me6IzE=;
	b=C6pVwJjVL02lDEi3CYdywxcDYZQM4IxIv8XfMloE3BhjkeW7xAJNCzrYFo2mcJscUc
	1UDE0IN6sdH0qBuWRzt8Nr6KnNsO/yn1EAwl8DlKf1m/7mkZ9EhmAxmdtpMYBSiLY5jT
	hDh4l/hfUBrZZws0bCWgie3modaTqk7bAuJXlKtXnXf88XTgBMwvNGuIvT7XuAQWw9rZ
	oSluK3D/mmvxorXLEXOcPzJmIiaBPCxbrdVzs/9Jhclf+pwf1Vp2yWcStoWFAFmot350
	zjklY4HiHNGQTQjBPIeLrlYnVmPV68C9lI/dtlDablT7tVhddMTHeEiTDKkXcPagoVek
	b14g==
Received: by 10.180.83.72 with SMTP id o8mr25937551wiy.5.1337329019437;
	Fri, 18 May 2012 01:16:59 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f19sm30640714wiw.11.2012.05.18.01.16.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 01:16:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@beagleboard.org>
In-Reply-To: <709603A3-A890-440E-B127-69D7CF71480F@dominion.thruhere.net>
Date: Fri, 18 May 2012 10:16:56 +0200
Message-Id: <27EF0BCE-2D52-46C9-B90A-C146A24B4BD7@beagleboard.org>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
	<1337286572.7473.10.camel@ted>
	<0FEE2025-8E84-4CBB-8568-483A55233BD7@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted>
	<709603A3-A890-440E-B127-69D7CF71480F@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQk26+DEBVGc8Df3kjyc6PAfNHEmE5c6QoGF+yjWwZnqkSTCQO7LK75JH2HjW1AOYiDmyKWT
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
X-List-Received-Date: Fri, 18 May 2012 08:27:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mei 2012, om 08:19 heeft Koen Kooi het volgende geschreven:

>=20
> Op 17 mei 2012, om 23:02 heeft Richard Purdie het volgende geschreven:
>=20
>> On Thu, 2012-05-17 at 22:44 +0200, Koen Kooi wrote:
>>> Op 17 mei 2012 om 22:29 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>>=20
>>>> On Tue, 2012-05-15 at 13:54 -0700, Khem Raj wrote:
>>>>> On Tue, May 15, 2012 at 2:32 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>>> The commit breaks pkgconfig and after discussing it with the kmod =
and udev maintainers the conclusion was reached that putting the =
libraries in /lib instead of /usr/lib is not supported.
>>>>>>=20
>>>>>> This reverts commit 6b74f2461735272bd950a4f060dab6e778a36f92.
>>>>>=20
>>>>> while this is what I had initially it doesn't go well with kmod =
living in
>>>>> /sbin and accessing libraries from /usr due to our QA checks =
although
>>>>> I am all for simplifying it where we don't make this check at all.
>>>>=20
>>>> I've had requests for it along with a commitment to fix it and =
patches.
>>>> If we decide we don't want this, fine and that will be the case if
>>>> patches are not forthcoming to fix the QA issues. I don't think =
we've
>>>> reached that point at this with that yet.
>>>>=20
>>>> I've decided to accept this patch and "unbreak" meta-oe/udev at the
>>>> expense of screwing up OE-Core. I am however still deeply unhappy =
people
>>>> are trying to bypass OE-Core this way and then "blackmail" OE-Core =
using
>>>> breaking meta-oe as a reason. The whole systemd thing has been =
badly
>>>> handled and needs to get fixed properly.
>>>=20
>>> What does systemd have to do with this?
>>=20
>> Why does meta-oe has its own udev recipe?
>=20
> Because it's too much trouble to get the updated recipe into oe-core

And I admit that is not necessarily a bad thing. I would go as far as =
saying that for recipes like udev it's a good thing. OE-core has seen =
too many upgrades for the sake of upgrades that were only build tested.=



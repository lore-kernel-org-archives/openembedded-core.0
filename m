Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SVGgk-0002Xk-03
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 08:29:22 +0200
Received: by wibhm14 with SMTP id hm14so6459313wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 23:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=XUd2ltGDXIqyY+CTWI2eYqLj+MC5vGlXm5ubG/WDIcI=;
	b=EVtQe0i0hzMfK+7nTOgWQZtGj6nTJ2dhOLJQFNm3wWNoj1/zvMPu0FuFq55BX6rOHM
	dyf2p5emniuRJFR0t0KsOngaHUcK34RSqxfElpX8/vmQ7AqGG5+WP/Rj9BKFSgiP2qX+
	6QTHUNv89lk+rmvm4ItcL+yWL5fN89t5L+iZQeaPU06RLW/BQkgLhSna/ftthj/6gQ9e
	4v2kUBpBMP5zDIkyN/f87YyBYOkyKlbTeztnpEVYPLsUBeZiiSmWngBqxLbtC3zcg3hJ
	zIja+6e1wwOpOD/F0IhJAQHpYzGU5ZsljDZ7TzHwdXNSfgFdHAx2gfjT2DkeMlo5sZZ2
	690A==
Received: by 10.180.80.97 with SMTP id q1mr25203072wix.13.1337321958739;
	Thu, 17 May 2012 23:19:18 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ga8sm29621020wib.5.2012.05.17.23.19.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 23:19:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1337288563.7473.24.camel@ted>
Date: Fri, 18 May 2012 08:19:15 +0200
Message-Id: <709603A3-A890-440E-B127-69D7CF71480F@dominion.thruhere.net>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
	<1337286572.7473.10.camel@ted>
	<0FEE2025-8E84-4CBB-8568-483A55233BD7@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlJOt6xV6G0BhuKRqui5xciN5yXy+78Mwuy1VnZkauweuZZrQkuZHtCLpi2YnMb1QTCs9Jb
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
X-List-Received-Date: Fri, 18 May 2012 06:29:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2012, om 23:02 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-05-17 at 22:44 +0200, Koen Kooi wrote:
>> Op 17 mei 2012 om 22:29 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>=20
>>> On Tue, 2012-05-15 at 13:54 -0700, Khem Raj wrote:
>>>> On Tue, May 15, 2012 at 2:32 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>>> The commit breaks pkgconfig and after discussing it with the kmod =
and udev maintainers the conclusion was reached that putting the =
libraries in /lib instead of /usr/lib is not supported.
>>>>>=20
>>>>> This reverts commit 6b74f2461735272bd950a4f060dab6e778a36f92.
>>>>=20
>>>> while this is what I had initially it doesn't go well with kmod =
living in
>>>> /sbin and accessing libraries from /usr due to our QA checks =
although
>>>> I am all for simplifying it where we don't make this check at all.
>>>=20
>>> I've had requests for it along with a commitment to fix it and =
patches.
>>> If we decide we don't want this, fine and that will be the case if
>>> patches are not forthcoming to fix the QA issues. I don't think =
we've
>>> reached that point at this with that yet.
>>>=20
>>> I've decided to accept this patch and "unbreak" meta-oe/udev at the
>>> expense of screwing up OE-Core. I am however still deeply unhappy =
people
>>> are trying to bypass OE-Core this way and then "blackmail" OE-Core =
using
>>> breaking meta-oe as a reason. The whole systemd thing has been badly
>>> handled and needs to get fixed properly.
>>=20
>> What does systemd have to do with this?
>=20
> Why does meta-oe has its own udev recipe?

Because it's too much trouble to get the updated recipe into oe-core

> Is systemd related to that at all?

No

>> This is about a broken commit breaking udev 182 for over a week.
>=20
> OE-Core worked fine

So you say that moving the pkgconfig files from /usr/lib to /lib was =
fine. Good to know.=



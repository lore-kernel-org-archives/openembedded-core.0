Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPa3W-0006Gg-A3
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:02:37 +0200
Received: by mail-ea0-f182.google.com with SMTP id q15so2833197ead.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=I6y7Cy+UPzQ3kf0dNQpilAU2QFKVMDd/lPl9+Xjpf7E=;
	b=RK3ajEmIrUhoiJxQz/k/bbygs6mUNsd9mn3JKqlK4gMbAOibZ5tyAx5DEJsAPRbuI7
	kZdsxIM9qkXScAqVMHBHAnUgKsjPOSt63hLtkrpy6arMZn1oxegqd1Xve9pR4k7ZyL6J
	yaOBq2X71utgHA2mRdeT8A7MNb/o9EYRkwqXUJB7gptybpsyps962rze4gxFSvF2p3o7
	/3Ova08AkRHUuNAlJ0JpIFY5ZaQUk56mksRU2Z53f9MUlIOm/UByNQRoOPnbiOtqgfyu
	zvOewwrKMm+q1NGAJvdFQwrEmPmi1Cl9LIwkQTeja0qduS+diSac0dG+SUr2TqHw99kT
	qivw==
X-Received: by 10.15.98.141 with SMTP id bj13mr31571820eeb.29.1365518674284;
	Tue, 09 Apr 2013 07:44:34 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id
	cb50sm16675726eeb.14.2013.04.09.07.44.32
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 07:44:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3528EE5E-C07B-4EBC-83E2-B425A1DD5F22@dominion.thruhere.net>
Date: Tue, 9 Apr 2013 16:44:36 +0200
Message-Id: <BD05C246-767C-4B72-A7B7-0776A5E98355@dominion.thruhere.net>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
	<1365510909.12407.79.camel@ted>
	<CAP9ODKqEJCS56UaKT3M1cPpA-escn5f7d_kEBL2kasnLYN2avQ@mail.gmail.com>
	<3528EE5E-C07B-4EBC-83E2-B425A1DD5F22@dominion.thruhere.net>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQn2Ez8X2eEPv2LB1KJ3z2zWq2a+ITZmwiSBTAr3ewXE6XavzS3MNhj+xEmNBJvA8928wO38
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] udev: Move udevd back to /sbin
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
X-List-Received-Date: Tue, 09 Apr 2013 15:02:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 apr. 2013, om 16:41 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

>=20
> Op 9 apr. 2013, om 16:36 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:
>=20
>> On Tue, Apr 9, 2013 at 9:35 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Mon, 2013-04-08 at 19:29 +0300, Radu Moisan wrote:
>>>> Along with v182 upgrade udevd was moved to ${base_libdir}
>>>> making scripts like init-live.sh to fail in finding udevd
>>>>=20
>>>> Fixes [Yocto #4046]
>>>>=20
>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>> ---
>>>> meta/recipes-core/udev/udev.inc    |    3 ++-
>>>> meta/recipes-core/udev/udev_182.bb |    2 +-
>>>> 2 files changed, 3 insertions(+), 2 deletions(-)
>>>=20
>>> We needed a decision on this. I've rewritten the commit message and
>>> merged it. Most of the feedback was about the commit message, not =
the
>>> patch itself. There were also no better proposals for how we could
>>> actually fix the bugs we were seeing.
>>=20
>> If I read the thread right, it had two NACK's. So it wasn't a =
cosmetic
>> commit log issue.
>=20
> 4 replies to the patch:
>=20
> 1) me asking about the commit log
> 2) me NACK'ing the patch
> 3) Otavio NACK'ing the ptch
> 4) RP mentioning other discussions
>=20
> So 25% of the replies are about cosmetics, how is that "most of the =
replies"?

And by the way, does anyone actually bother testing patches to important =
infrastructure like udev?

[koen@rrMBP udev]$ git log --oneline -1
a866e1e udev: Move udevd back to /sbin

[koen@rrMBP udev]$ git grep /lib/udev/udevd
udev/init:[ -x /lib/udev/udevd ] || exit 1
udev/init:    /lib/udev/udevd -d
udev/udev-cache:[ -x /lib/udev/udevd ] || exit 1

So the patch broke the sysvinit script, congratulations!=



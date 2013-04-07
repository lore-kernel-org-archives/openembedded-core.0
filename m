Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UOkhB-00019k-Hs
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Apr 2013 10:11:31 +0200
Received: by mail-ee0-f41.google.com with SMTP id c1so1915970eek.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2013 00:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=WaegLEZuoLnJsFo0KbiGOyVPT2Kjo4tpB63aat+yB3o=;
	b=Q+VBnIf06ztyFUdv7Lte8FdBaF0/ZAto+HBHgQdQY5Kd6gk7nJvK93qfflblIJXTCC
	YWbDrcbZsOE03af/nLS7d9RLOD+DEuwYmYijN5Mt8UmebuHlXriVRQdnsH4Txmp7Sofl
	vju/Yb1mG2H7geHLi706mhFSR4lJOaTq/BVkFCIaUcDLqH8z1+IWhnE0RiE2VQZ5gy1J
	HU7ccBhuzZi6xtCWIXIaQNutziAbJQXA5+8LXd5vveBamCd5suRUv3rYr1ZZ3CAycAoE
	5jIW0/KyC6BzFPeqef04UVMlibPX4WAEenoZVMxIK+ThKI3H9qxdQLAM7o3G73YUBrtE
	4PUw==
X-Received: by 10.15.34.199 with SMTP id e47mr26390540eev.35.1365321248661;
	Sun, 07 Apr 2013 00:54:08 -0700 (PDT)
Received: from ?IPv6:2001:610:612::1c9f:d754:3922:c79d?
	([2001:610:612:0:1c9f:d754:3922:c79d])
	by mx.google.com with ESMTPS id m46sm24850404eeo.16.2013.04.07.00.54.05
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 07 Apr 2013 00:54:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365285646.6526.208.camel@ted>
Date: Sun, 7 Apr 2013 09:54:06 +0200
Message-Id: <E75873F2-FFD2-49D1-9355-9DBCA41033AA@dominion.thruhere.net>
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
	<1365006329-20964-3-git-send-email-radu.moisan@intel.com>
	<825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
	<515D75D5.4020204@intel.com>
	<1B3FBA45-5658-4BF8-A854-84058F80DCBF@dominion.thruhere.net>
	<515EBCA1.6000502@intel.com>
	<CAL7ttbc2VXkMz79oyHt69E0wsSvEYqndNHSQMLCDO56TF6v=og@mail.gmail.com>
	<1365172473.6526.195.camel@ted>
	<AB22E165-191E-4930-929D-E6B277A265F4@dominion.thruhere.net>
	<1365285646.6526.208.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnQE4leQVya4pYf1II4EJmFV3gJYGajcI8XWEPZN2IaSSrTPgkY97hhxQPFmWSHN9xW/Wz8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: enable multilib support
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
X-List-Received-Date: Sun, 07 Apr 2013 08:11:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 apr. 2013, om 00:00 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Sat, 2013-04-06 at 12:32 +0200, Koen Kooi wrote:
>> Op 5 apr. 2013, om 16:34 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>=20
>>> On Fri, 2013-04-05 at 16:29 +0300, Alex Damian wrote:
>>>> On udev-184 they changed the default location from /sbin/
>>>> to /lib/udev/ and I kept same as the upstream is.
>>>=20
>>> Firstly, I know some people did ask me questions offlist about this =
and
>>> I probably gave misleading answers. I thought this was a problem =
with
>>> the location of the rules directory initially. We need to have one =
rules
>>> directory regardless of multilibs.
>>>=20
>>> Binaries however are a very different question. The multilib code we
>>> have in OE is complex and does make some assumptions about layout, =
not
>>> least as we have to interface into several package managers and also
>>> work with all their assumptions. The situation is that:
>>>=20
>>> * library files are expected to go into /libX
>>> * binaries are expected to go into the usual bin/sbin dirs
>>> * files in /etc, /usr/share and other similar directories are =
expected=20
>>> to be identical
>>> * We have sanity tests which check for these things
>>>=20
>>> The package managers are taught to let certain packages "win" in
>>> bin/sbin and to error if overlapping files outside this are not
>>> identical.
>>>=20
>>> It therefore follows that we would have to start adding exceptions =
to
>>> this code if we have potential for both 32 bit and 64 bit /lib/udev/
>>> binaries. We'd also have to add rules about which one would be =
expected
>>> to "win" under which circumstances and so on.
>>>=20
>>> To me, the simplest solution here is to point libexec dir at /sbin =
so
>>> that we have /sbin/udev/ since this then works with the various =
multilib
>>> rules. It means a user can install the 64 bit and 32 bit multilibs =
for
>>> udev in parallel (for libudev for example) and that things should =
all
>>> work correctly.
>>>=20
>>> I appreciate upstream don't agree with that approach but equally =
they
>>> don't have the generic multilib support we have to worry about. =
Hacking
>>> the multilib code to pieces just to match upstream in this case is =
going
>>> to be a lot more painful, I appreciate its the not optimal solution
>>> though.
>>=20
>>=20
>> FWIW, the udev *libraries* (libudev, libgudev, etc) go in
>> $prefix/lib64 on 64 bit machines, the udev *binaries* into /lib. So
>> multi*lib* should work.
>=20
> Which is effectively what I said.
>=20
> multilib package A has binary X in /lib. multilib package also B has
> binary X in /lib. Package A and B cannot be installed at the same time
> (package managers can't cope) and the sanity tests will fail.
>=20
> Sure, we can force the libraries to be in separate packages.=20

For udev and systemd each and every library has its own subpackage =
already, so that isn't a problem here.




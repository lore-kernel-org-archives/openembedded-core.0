Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKutY-0000ls-4M
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 19:16:20 +0100
Received: by mail-pd0-f174.google.com with SMTP id p12so1716435pdj.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 10:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=vbLhyaf2KC2oQcZNHwXi6xTYnzbbNsUL+UDQcwnVWYs=;
	b=Y6gcWEH5NbWfnukWDAvcZWpODk7/rCGiL8SyRCiakLbzib9RNMGX5zbkklMDwZMbBa
	tzJYpFOf0LfrfbNKcZFewJ5Aj9pDF1+CO7fpWCWmd7yhuE5rI2hsIjx5SXDuVSHUpout
	HguIpwASMNIAFgiDEhzSGZ+plZYxk7iBrgFAml1mQ51Wzx4SbJBA+m86llxTJZOAbXvB
	0Fb0KV9MwaWmi1vRbsP3mDWQLbd9IWHwHICGwl2yyhXofuvyhSv2czS8vzh09OfDa0L1
	GNKbptBi2Gk7gQ8KKLJLHjGX4imQSh7aHwENIrewYpOEhqn4Iq6+9gsXySUQyOTfT6dK
	lRdg==
X-Received: by 10.68.197.70 with SMTP id is6mr30621112pbc.79.1364407158038;
	Wed, 27 Mar 2013 10:59:18 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id bs1sm11454707pbc.8.2013.03.27.10.59.16
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 10:59:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
Date: Wed, 27 Mar 2013 10:59:17 -0700
Message-Id: <DFE7A43C-A020-41DA-A089-43CA3B61A18B@gmail.com>
References: <1364386111-1734-1-git-send-email-ross.burton@intel.com>
	<5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Upgrade to 198
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
X-List-Received-Date: Wed, 27 Mar 2013 18:16:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 27, 2013, at 8:03 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

>=20
> Op 27 mrt. 2013, om 13:08 heeft Ross Burton <ross.burton@intel.com> =
het volgende geschreven:
>=20
>> From: Khem Raj <raj.khem@gmail.com>
>>=20
>> Tested on ppc and x86_64
>> compile tested for uclibc
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>=20
> Since 199 has been released a few days back, how about upgrading to =
that and drag in =
http://cgit.freedesktop.org/systemd/systemd/commit/?id=3D94243ef299425d6c7=
089a7a05c48c9bb8f6cf3da ?
>=20

OK I have setup here I will send another patch after testing out 199 on =
the configurations I have

> regards,
>=20
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




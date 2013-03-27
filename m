Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UKs9U-0003ag-KV
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 16:20:39 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so4286052eek.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 08:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=/ehzeP4ZWLaxhwCC0IgPpgZ4AIMAT7y6wPwnLYirYhc=;
	b=YatKY+aTx+hAvdaqjUToe1ClvelSMnvohp9Roa/p7PsrdKPp2MyvggFZyK34c6IN1Y
	9ETiSbYHTaP04IBYU/4KdLncVDTtpOXIvZrs4aDqE4lravrL4x7aib3iHSHmqRMea8bj
	z8pTXEYwA7rLXpyP4w9Y2Oim8AOXZfkG1qZ1rKThUMnUh/nytZj5GH5cYHL5iUgPgkS8
	jHK/Cu1fZ5RUCsGGOcjbGzbdLOIyAhSMqmV/jZB941svxEjsKfCRAF8XLZWE9ALRJy1M
	VKG9yh+KMdY8pDDQQtYmwtwKXpfdJPVWpifEYejP1SnW3KBT7m3KauFdyZV27QKg72Hx
	3LPQ==
X-Received: by 10.14.210.132 with SMTP id u4mr56384169eeo.19.1364396615009;
	Wed, 27 Mar 2013 08:03:35 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id q42sm31834434eem.14.2013.03.27.08.03.32
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 08:03:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1364386111-1734-1-git-send-email-ross.burton@intel.com>
Date: Wed, 27 Mar 2013 16:03:31 +0100
Message-Id: <5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
References: <1364386111-1734-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQldfwn/2qTKrmg+aGP9SWiYDlQw06I0S2UY+YrrtYd2NzhjCy6ceVqckZ4tKNyI0Th73Spo
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
X-List-Received-Date: Wed, 27 Mar 2013 15:20:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 mrt. 2013, om 13:08 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> From: Khem Raj <raj.khem@gmail.com>
>=20
> Tested on ppc and x86_64
> compile tested for uclibc
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Since 199 has been released a few days back, how about upgrading to that =
and drag in =
http://cgit.freedesktop.org/systemd/systemd/commit/?id=3D94243ef299425d6c7=
089a7a05c48c9bb8f6cf3da ?

regards,

Koen=



Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6jig-0007Oa-95
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 16:58:14 +0200
Received: by weyr6 with SMTP id r6so365167wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 07:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=sppAbqP0R3Jq1UG0Z3UhQfXB4/WPMZGRnQZLeVy/Rps=;
	b=gPinl9Z0PwDNvgtsmi8eGwOKDX0kiNZdIN6wtuYVysLSUaDy9SI8WZw6lV3laJ0dbK
	6ETCyLARzNS9MEjLLc4JYPskuHzIC7XMS40KGEAMmBJrJAUXsPRS9IoHfAlYrPHkau6z
	PBzx2BU1wm/Mq5X+xQOHlIX+Ej6WQsQwOO9ldN78iuJMCV2hq6wzBMxz1DbzAFGXVDAD
	eLG59aOEZNK7Bf9GQW6Kauwa6EJ5BgP7crC5eZHmHMKnT0ootXGah6EadaMcDED+9weW
	3jYUTAX9xYXqshdnsceYpVXuuXNmBI3vfCuhA4UDqXmOoQMluAsweE+JjL3A+NH91WgR
	Fkcw==
Received: by 10.216.68.2 with SMTP id k2mr1059553wed.69.1346251560386;
	Wed, 29 Aug 2012 07:46:00 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id h9sm10582109wiz.1.2012.08.29.07.45.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 07:45:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1346250187.git.ross.burton@intel.com>
Date: Wed, 29 Aug 2012 16:45:56 +0200
Message-Id: <861A06A7-8BB8-4136-B328-BDF56B93ACC6@dominion.thruhere.net>
References: <cover.1346250187.git.ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQml7uqOHcFn6YmTTeW8np+B8/u1aQ429YiQCISENhaSelKM1g9JzK3TppmBAfqAYELDF1Nc
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] tzdata fixes
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
X-List-Received-Date: Wed, 29 Aug 2012 14:58:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 aug. 2012, om 16:24 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> tzdata is missing a file to make the local timezone detection actually =
work in
> many programs, and isn't architecture specific.
>=20
> The following changes since commit =
603f6c631e9454d10517599e229943f2b26d08a5:
>=20
>  atom-pc: Drop glibc --with-tls option, its now the only option for =
glibc (2012-08-21 12:15:33 +0100)
>=20
> are available in the git repository at:
>=20
>  git://git.yoctoproject.org/poky-contrib ross/tz

Since you're posting to the oe-core list, why aren't you posting a =
branch that is actually mergeable into oe-core?!?!?!?=



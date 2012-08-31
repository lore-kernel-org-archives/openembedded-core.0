Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T7Lqg-0002i5-52
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 09:41:02 +0200
Received: by eekb57 with SMTP id b57so878737eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 00:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=2Ubb+JY4bgXb9/LMHQ02JUuLKkGmHxlFQwM5mLjhHxo=;
	b=Pbk14+FnmmtnEZkJWM9FLT847CN0/UQ5cT1DfsHDWssaytn1Awxw1IvmO18rFI+huO
	7CpfBV1ijPq0p7nmA09XZpJCC5JbZOxKSHmpjGqO7M3eyJ/9pqKuw0VRvpNShWkU7J0w
	V0B0Mwg0LGDQpWKLIZhKyrm/MUHI1fmeo8X/LTF9cFUmbAolsSTyxs5cwnWs6ov92Lse
	MgbCvy9VeMw46j6ulJ981ZIV/Of1XipbcF7xzw4jWFqbiw3WTIW6A13q3NuUEOcDM+MZ
	qJr3kKgPTEx7XDRmc2GSPIGY98o827xdBJnK09VqoSBKPjAQaq+pw6h0XcY5i0SMvm0u
	AjYA==
Received: by 10.14.199.67 with SMTP id w43mr9744006een.33.1346398125863;
	Fri, 31 Aug 2012 00:28:45 -0700 (PDT)
Received: from ?IPv6:2001:610:612::7933:3afd:9a4c:d894?
	([2001:610:612:0:7933:3afd:9a4c:d894])
	by mx.google.com with ESMTPS id i8sm10915384eeo.16.2012.08.31.00.28.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 00:28:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346369662-17265-1-git-send-email-sgw@linux.intel.com>
Date: Fri, 31 Aug 2012 09:28:44 +0200
Message-Id: <A19E8B5D-4A0F-439C-B67C-8CBB0CE84E16@dominion.thruhere.net>
References: <1346369662-17265-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQm82xkyVxb8pHeYQmqmdVUjb3CRNmUir7sRWfoJlxJeFm9BEDcjSuAAO+8+Gf2V7FqiE9Ut
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: Ignore eth0 cleanup when booting over the network
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
X-List-Received-Date: Fri, 31 Aug 2012 07:41:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 aug. 2012, om 01:34 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> There was a change to connman, such that it cleans up the
> route table for devices at startup, this was causing the
> network to get lost and NFS to loose it connection.
>=20
> The -I option will cause the device to be ignored.

Apart from the missing PR bump, what happens when you don't boot of the =
network? Will connman keep ignoring eth0?
FWIW I asked about nfsroot and connman and Marcel said: don't do that! =
So I'm inclined to say that if you're using nfsroot you shouldn't be =
using connman.=



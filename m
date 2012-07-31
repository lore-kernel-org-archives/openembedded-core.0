Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SwC1W-0004Ax-SR
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 14:58:06 +0200
Received: by eaad12 with SMTP id d12so300800eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 05:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=99s7RP6eTmRGK52Qnlb0u4iSQBZbbdGiT6cjd03bj8g=;
	b=o1iZf5QnYZcafYcT1msy1zXzmdVACqrkfxIpM4qpdhhiascxI/38vaahe/cgbCsf2V
	jBSAPaSaH9RLEzv0L/A8DnsAXJhIHlveycOf/9423HJyy5a2yYv7j30IXIlNZt1ZBzWp
	Bb6RSKrJ9XRkVp8vPTOnW443XWdTbvTF0y1rNG/MODdsjpclJapmpGOqYIbBCI5XYour
	AgQC4i/XND264pKGKYKoI4B2RaM/gmuaCdISM7EgBZoNkB3QVCANykW+70XPol6LQdv9
	4EO+zdGDu4bVk7EcJeYWkjFdbrw3BuKApvQh+9EUnUueUDJj6wA41JDKw4MaUgWukQ4w
	NRjg==
Received: by 10.14.181.137 with SMTP id l9mr16258426eem.28.1343738789926;
	Tue, 31 Jul 2012 05:46:29 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id w3sm37301eep.2.2012.07.31.05.46.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 05:46:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1343734010.9756.3.camel@ted>
Date: Tue, 31 Jul 2012 14:46:40 +0200
Message-Id: <5861D2CF-C4A7-47E2-A355-C77DF52A2D3B@dominion.thruhere.net>
References: <20120730175903.GN3261@jama.jama.net>
	<1343674860-1523-1-git-send-email-Martin.Jansa@gmail.com>
	<1343734010.9756.3.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQk989W8oVMZSB4clwNQOvGbDh/xhWtnpQegfG+OozX2X9h3OmvZ/ZTz94xRCPkg7TsMfCoq
Subject: Re: [PATCH] udev-extraconf: change LICENSE to MIT
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
X-List-Received-Date: Tue, 31 Jul 2012 12:58:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 jul. 2012, om 13:26 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Mon, 2012-07-30 at 21:01 +0200, Martin Jansa wrote:
>> * original recipe added by RP in =
fc128ab1e4fec27d44cebfa690a9bc233eda0caf was saying GPL
>> * later it was changed to GPLv2
>> * COPYING.GPL was added to reflect that
>> * meta-oe has similar recipe with MIT license and even more scripts, =
so lets change LICENSE here too
>>=20
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> meta/recipes-core/udev/udev-extraconf/COPYING.GPL |  339 =
---------------------
>> meta/recipes-core/udev/udev-extraconf_1.0.bb      |    8 +-
>> 2 files changed, 4 insertions(+), 343 deletions(-)
>> delete mode 100644 meta/recipes-core/udev/udev-extraconf/COPYING.GPL
>=20
> Er, I think we need to be a little more careful than this. Just =
because
> you want something to be so, doesn't make it happen just like that...
>=20
> Looking at the commit, I've just copied the license from the original
> source which was a GPLv2 recipe (udev). Where did mount.blacklist come
> from originally? Is there evidence its MIT licensed? How did meta-oe
> conclude this was MIT licensed?

It was written for oe-classic -> MIT licensed=



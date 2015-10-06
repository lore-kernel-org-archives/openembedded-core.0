Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 462E676E4B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 03:54:56 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so56301420pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 20:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=IoF2Ldh/WEuuc5FKXpt7GWyoTCBcqxAqezx8jIPCo/U=;
	b=uhy/nmG5ePYccUYZZ2cCO1lg39Oh1E5sltAJeCtlfZfsJnc2IvcUHXzOiJgmo2IzZN
	FtBbxzIXGrUi03417A/Qy0X/kHlPH5BAFfrjNJh6n7c7hE22bdEKWz9GHy9PHC28aldm
	2N996LAGUZ0di10qnVsVF+Wxyb71wTGclIS4Hx8gHdg9qwmvMh1nvT4/ctoXlVmAuJON
	zMlpEYKgHvHe8IK3S1xTlj8YfzmAexiPjeV/swaNTxii2l+bDo4A0jQ7qcXmkOIDF7XE
	BCmFMmOgpXNf+hXme3O0JkFFNZjir14hMgly9cthQpRZdt7w/RpjSxkLXC/oDR6v2LzU
	dKkw==
X-Received: by 10.68.249.66 with SMTP id ys2mr44999301pbc.82.1444103696898;
	Mon, 05 Oct 2015 20:54:56 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:6121:2c7:f101:d73c?
	([2601:646:8601:4580:6121:2c7:f101:d73c])
	by smtp.gmail.com with ESMTPSA id
	yq2sm30358241pbb.39.2015.10.05.20.54.56
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 05 Oct 2015 20:54:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3095\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
Date: Mon, 5 Oct 2015 20:54:53 -0700
Message-Id: <B6E9CFBB-3448-4508-A1E3-8BE0DC7CD212@gmail.com>
References: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3095)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] busybox fixes and cleanups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Oct 2015 03:54:57 -0000
X-Groupsio-MsgNum: 71935
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8994EDE2-06C6-4693-87D4-E89B2902A072";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8994EDE2-06C6-4693-87D4-E89B2902A072
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Oct 5, 2015, at 8:19 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> 
> Further busybox recipe cleanups, to be applied on top of:
> 
>  busybox.inc: remove redundant @DATADIR@ replacement
> 
> Andre McCurdy (7):
>  busybox_git: Enable getopt applet
>  busybox.inc: don't export EXTRA_OEMAKE
>  busybox: move common EXTRA_OEMAKE options into busybox.inc
>  busybox.inc: explicitly include CC=${CC} on make command line
>  busybox.inc: don't set .config CROSS_COMPILER_PREFIX
>  busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
>  busybox.inc: remove MAKEFLAGS over-ride from EXTRA_OEMAKE
> 
> meta/recipes-core/busybox/busybox.inc       | 14 +++++++++-----
> meta/recipes-core/busybox/busybox_1.23.2.bb |  2 --
> meta/recipes-core/busybox/busybox_git.bb    |  3 +--
> 3 files changed, 10 insertions(+), 9 deletions(-)
> 

LGTM



--Apple-Mail=_8994EDE2-06C6-4693-87D4-E89B2902A072
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYTRhAACgkQuwUzVZGdMxSbcQCfVXEd+/uugV4/ZzUweok4zp/B
HOUAn2BwrDa6XJoVXZ+iMgC793hGU4/E
=qM/j
-----END PGP SIGNATURE-----

--Apple-Mail=_8994EDE2-06C6-4693-87D4-E89B2902A072--

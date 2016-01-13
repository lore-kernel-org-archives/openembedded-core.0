Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 897B4731C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 06:42:29 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id e65so76341157pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 22:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2OakWzX/VyNPc7MMdhM7xygOufE+xlIvnLrlEtQBCgU=;
	b=yzbTLG/qGRFMNDvwqRoXqJWwHy2TTVO6cx9pkUgLBIfLEAOkTUA2B86XIf06Jr385s
	4kHZgyg0weBAft2kdJWgvgioIrXN2VWRq7JhHbr+T7Drxve3Z9v9x9VVhrnKPzCjn0dR
	fWS+PGOWTBZPD3TIafwgpvcLnpjhWGO0CNhWBJ7q1iZdf9b0j75jp+aKfpGTzz17Ev3D
	7g9BL/SCAY5oPBQi3xKTxvbhkO/Ajs52EwElFXzBEdAvpEqYFlkznG12EwYENUCYZw8K
	KgH7Rc+nNLjkHiEZNCN9OYAv1uHS7V6OuCWQkKGNTW/qcXFeUz2frvbSiQTrDTZdoPtz
	1/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=2OakWzX/VyNPc7MMdhM7xygOufE+xlIvnLrlEtQBCgU=;
	b=AXaVua7Ilsvu/KzKAGfRzLUx38GF5xgPnEJ87KJgaytt2KVVnLXbdwr75mHQ0beUl5
	5yCnBwSd3evJmgua72ygiJ0vIOWOQS9sW4CBU3YXO6y9CJLFFwpIbZBiBWyy3nWMHRqb
	qyjQ6WYWoo7Zi56JFaEbAaK8xS93kl6HWUSKXos82kbQAYnvPj0MZ6e5GauM5B/wa6NE
	VMrgMlwy5BNQ/PZpPQ2MhlqwEbpwl12RTP+yAydiPS89Xeo9e5wVtCxQswNagD83X+4q
	hk9aX4q6n7GHrxlbY9AP8WAgk0PeNWLODb4v+WR8ZUzM8PZGjJWe1E0gPzrOBnmOymH/
	P+Ew==
X-Gm-Message-State: ALoCoQmcJgQWAYxz5iJ/GPrp/b6vc5m3RdoT15lcEL7QLMVQi38R+oRJWQqu/n1FctG+x/trAxV28Pd2Ms8DoqizItq1wuFc4w==
X-Received: by 10.98.68.211 with SMTP id m80mr40431697pfi.117.1452667350241;
	Tue, 12 Jan 2016 22:42:30 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:5819:3c63:1381:916a?
	([2601:646:8802:5d5c:5819:3c63:1381:916a])
	by smtp.gmail.com with ESMTPSA id
	c86sm34664029pfd.75.2016.01.12.22.42.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jan 2016 22:42:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <201601130601.50890.marex@denx.de>
Date: Tue, 12 Jan 2016 22:42:24 -0800
Message-Id: <7493A0EF-E1B8-4FFF-B056-15F07BBCC480@gmail.com>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<CAMKF1spwghM0XJ7TP0chW4i1fwpG5qLqu=YzR8Jjc_BsLi48Hw@mail.gmail.com>
	<201601130601.50890.marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3112)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Wed, 13 Jan 2016 06:42:29 -0000
X-Groupsio-MsgNum: 75980
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B8F27FCF-32A9-4328-8E2D-4D41FFDF1193";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B8F27FCF-32A9-4328-8E2D-4D41FFDF1193
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Jan 12, 2016, at 9:01 PM, Marek Vasut <marex@denx.de> wrote:
> 
> On Wednesday, January 13, 2016 at 05:49:08 AM, Khem Raj wrote:
>> On Tue, Jan 12, 2016 at 7:36 PM, Marek Vasut <marex@denx.de> wrote:
>>> Upgrade U-Boot to latest version and drop upstreamed patches.
>>> 
>>> Repair configuration of U-Boot during build. It is no longer
>>> possible to run "make foomachine" in U-Boot. Instead, it is
>>> necessary to do "make foomachine_defconfig ; make". Fix this
>>> in u-boot.inc and u-boot-fw-utils*.bb .
>>> 
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>>> Cc: Ross Burton <ross.burton@intel.com>
>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>> 
>>> meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.10.bb |   49 -
>>> meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.01.bb |   49 +
>>> meta/recipes-bsp/u-boot/u-boot-mkimage_2015.10.bb  |   32 -
>>> meta/recipes-bsp/u-boot/u-boot-mkimage_2016.01.bb  |   32 +
>> 
>> can you make git work hard to detect renames so its easier to review it ?
>> 
>> git format -C
> 
> I usually use git format-patch -M -C, but didn't do it this time.
> I can do a repost if needed.
> 
> btw. do you have any other comment about this patch? It'd be nice if you
> could snip out of the irrelevant part(s) of the patch so it's easier to
> find the relevant comments.

I started to review it and it just put me off at very beginning.

> 
>>> meta/recipes-bsp/u-boot/u-boot.inc                 |    4 +-
>>> ...-u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch |  185 ---
>>> ...-non-Android-booting-with-ramdisk-and-or-.patch |   36 -
>>> ...board_f-enable-setup_board_part1-for-MIPS.patch |   59 -
>>> ...PS-bootm-rework-and-fix-broken-bootm-code.patch |  254 -----
>>> ...PS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch |   93 --
>>> ...-Replace-extern-inline-with-static-inline.patch | 1184
>>> -------------------- meta/recipes-bsp/u-boot/u-boot_2015.10.bb
> 
> [...]
> 
> Best regards,
> Marek Vasut


--Apple-Mail=_B8F27FCF-32A9-4328-8E2D-4D41FFDF1193
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaV8dQACgkQuwUzVZGdMxTB4ACeMepcHzUQXKaK9TWDoDPhsgcE
gP0An1eUWaFJjweeRDArJlFiGY/wC2eW
=ui99
-----END PGP SIGNATURE-----

--Apple-Mail=_B8F27FCF-32A9-4328-8E2D-4D41FFDF1193--

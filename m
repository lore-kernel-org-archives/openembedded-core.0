Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id E1909605F2;
	Wed,  7 Aug 2013 18:30:57 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so2227382pbb.27
	for <multiple recipients>; Wed, 07 Aug 2013 11:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=QgEA5l7YYlBRc4zHsbkufunYtqhCDH+OLKY8ZTQNG9Q=;
	b=L2rdm2R0zpqroSmCWAQRQN1GU+gtQgIA5PqZ4qJxpQrtM+Ci1Ly3PlCo/mCMrV3qD0
	GeaPS0JtvmTVbW8LEyaAZ6ncbgRMiEFpdvx5Pg8EoEKjRBOcFjfDnM0lkCHd12pDA0IO
	XbJlhvvce5hqSAM/9akSXr1H5GfZo5rENP2QEVxlTDxGervEjJmPrq1ohmgjFfmTD+HP
	jFVGIfwae1GubLXATqIbySj2uazEleWcbJFvii1fmaCOGx6EnD0P81E6Zb+ZjPWBm3/e
	Hicxe1NS+Z0RZ+xOTGlKe1+B8A0wwROlDkC4V2sQP+STZ+/GAf2WbV4x2feJQuCDjjd7
	WvGA==
X-Received: by 10.68.170.37 with SMTP id aj5mr2052639pbc.79.1375900258597;
	Wed, 07 Aug 2013 11:30:58 -0700 (PDT)
Received: from gourish-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id r7sm11814407pao.18.2013.08.07.11.30.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Aug 2013 11:30:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130807122314.GF17450@ibawizard.net>
Date: Wed, 7 Aug 2013 11:30:55 -0700
Message-Id: <705A265A-57A0-4534-8D31-F7F969183B35@gmail.com>
References: <51F18346.2@windriver.com> <20130807122314.GF17450@ibawizard.net>
To: =?windows-1252?Q?Petr_=8Atetiar?= <ynezz@true.cz>
X-Mailer: Apple Mail (2.1508)
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Add lua to oe-core.
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
X-List-Received-Date: Wed, 07 Aug 2013 18:30:58 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Aug 7, 2013, at 5:23 AM, Petr =8Atetiar <ynezz@true.cz> wrote:

> Randy MacLeod <randy.macleod@windriver.com> [2013-07-25 15:57:58]:
>=20
>> lua-5.2.2 is current, see: http://www.lua.org/download.html
>> so we'd likely uprev and send that version.
>=20
> Just FYI Lua 5.2 has quite a lot of changes to Lua 5.1[1].  So I =
wouldn't
> consider it as an drop-in replacement for Lua 5.1. Simply said it's =
not
> compatible out of the box.

5.2 is not ABI compatible with 5.1 see

http://www.lua.org/manual/5.2/manual.html#8

so you can add a new recipe for 5.2 on
the same lines at 5.1 but don't delete 5.1

>=20
>> oe-core.git $ grep -r lua * | egrep -v 'valuat|valuable|uargp|rpm'
>> meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb:
>>             --without-lua \
>=20
> For example lighttpd uses Lua 5.1.
>=20
> 1. http://www.corsix.org/content/look-lua-52-work3
>=20
> -- ynezz
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



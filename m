Return-Path: <prvs=22116a6d0=Mikko.Rapeli@bmw.de>
Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com
	[68.232.139.124])
	by mail.openembedded.org (Postfix) with ESMTP id 3FBB37F57F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1574323508; x=1605859508;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=0N6PJmJIMTCkgDayl/S6wNg3g3cXzPfRsbu0geID2OQ=;
	b=S0j8GSUjPCezaSx1U/xMTwYvknBkIHd8BB4sCOK8e6BupkdP2D1KWnAY
	zDp5qvuawAFjR5FHMk2UEKGW+SZm0Y8DOQauHaF2aJBa1VYoYp/6AF6nB
	c41mWvaaEjebHgQAsiW7tAVRvyDr4kjKDMrr//o+3N9SdlzjxSUlDY8Hk M=;
IronPort-SDR: VPlYDvTARo+pJoV1ZJVzxUKvqKv9IZTeHBMBf2DKqwwwZZZhC4BRACLM0QVQWTbUsoj1LmZXZm
	QeKKGbLF8bVJDeDwYA+KmY0suUi+M7sJPSA4mFL33pxfOUOaXjZJKXeEzhVFrz2YjD+oY9f/s1
	HOJGmHYXWIXakafs/vOanJ2F0x4YFwT2pbcN5BXtkkEeZJqAQzUL4LEULmoZ9x2JC0GwvnMtgm
	V0kFkY0fz1zOi0/fdKHRk+KloGmNsO3l3RvtQG5sfDGTGsJ1B4YPAIHd3j1e2QjvAIF8j47MZ9
	xQU=
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 21 Nov 2019 09:05:06 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw4.muc with ESMTP/TLS;
	21 Nov 2019 09:05:05 +0100
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb6.muc with ESMTP/TLS; 21 Nov 2019 09:05:05 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Thu, 21 Nov 2019 09:05:05 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Thu, 21 Nov 2019 09:05:05 +0100
From: <Mikko.Rapeli@bmw.de>
To: <armccurdy@gmail.com>
Thread-Topic: [OE-core] How to backport openssl to Sumo
Thread-Index: AQHVn87w8ZAVFbXnIEGLd+JWxeWsfaeUUpOAgAAIKACAAAD7gIAAJxaAgAAUHQCAABQNAIAAiWqA
Date: Thu, 21 Nov 2019 08:05:05 +0000
Message-ID: <20191121080503.GC3527@hiutale>
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
	<CAD0U-hKMtXR+tvpS45D9=+XqaZVZBs7jMm9U3Vk7r+mJuVW5-A@mail.gmail.com>
	<CAD0U-hJ96imEfDwAyMQyjvABmaNYxEexQWNvpHJr+wsNzpGSbw@mail.gmail.com>
	<CAJ86T=Ucx125+XdRrpnh64km1WypAyyc1fUN5pWbjXzmUSXu3g@mail.gmail.com>
In-Reply-To: <CAJ86T=Ucx125+XdRrpnh64km1WypAyyc1fUN5pWbjXzmUSXu3g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Thu, 21 Nov 2019 08:05:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A23929FF44379546874C7FF68F388ACE@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 03:53:14PM -0800, Andre McCurdy wrote:
> But anyway, in all cases, the way to debug what's going on isn't to
> try random recipe changes and then rebuild the final image. Instead
> you should build your chosen version of openssl, look in the
> packages-split directory to see which package includes the openssl
> command line tool and then add that package to your image.

Or enable buildhistory, build openssl and/or image(s), cd build/buildhistor=
y
and git grep for the binaries needed to find out which binary package
they belong to.

-Mikko=


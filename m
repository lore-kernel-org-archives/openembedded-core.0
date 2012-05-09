Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SS9uK-0003p9-2K
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:38:32 +0200
Received: by wibhj13 with SMTP id hj13so496883wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 09:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=U0hxgwLPvvNsJljxFqMf6g29H9TvSynVYctQ7RioJp0=;
	b=kxfo6qOciYu7qXzOi5L2vXti8YiObze1pkpQhWH+DVdF5e4jFYPPY7f+DJxDjtzomt
	odYB2iy6mQDleleTTTmJY4DUWeTTaeoApk7USGrpCqQMvI9bduk6fb9Xgb3c/xoof9PD
	6H0/FT+lmJTuvt9FyfH6B1QDfACoo967E8Urx7dVnE+ffCEeIU9hBD+kCmVURtj9lR5y
	Z4jYP3/YTb/nDUcCzH44KBArLgtLsd1UMZnABCCI1Bj8Ex9SY39LLhkSgK5esMNNOxf8
	qX0EdoQxG/hmnfVKhHGuiIVESGCjNUyXxn64mf2C5EHRdc2hZs5flu9QjuLcqiX35VUe
	H+4A==
Received: by 10.216.135.103 with SMTP id t81mr359751wei.113.1336580918936;
	Wed, 09 May 2012 09:28:38 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j3sm11040072wiw.1.2012.05.09.09.28.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 09:28:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1sqUUaG3ka7XKNAgFduBNTv2JtAa5imFSVpawJbdVPqAog@mail.gmail.com>
Date: Wed, 9 May 2012 18:28:35 +0200
Message-Id: <B090A023-EA9E-4750-BB53-D9AC631E3277@dominion.thruhere.net>
References: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
	<339076a9cf1ef906416bd850e5825c3bb8521983.1336517492.git.raj.khem@gmail.com>
	<73C72AB1-C5B4-40D1-BAA3-C349F4957C42@dominion.thruhere.net>
	<20120509094220.GA12898@jama.jama.net>
	<CAMKF1sqUUaG3ka7XKNAgFduBNTv2JtAa5imFSVpawJbdVPqAog@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk0PnGx1NabM6kP3HR/4/Z0/FJvBLcs0FbQAf8cyj2l/7MGKzJqxkHZQuMQtjSTD2STJk5E
Subject: Re: [PATCH 2/3] kmod: Update to .8 release
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
X-List-Received-Date: Wed, 09 May 2012 16:38:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2012, om 17:42 heeft Khem Raj het volgende geschreven:

> On Wed, May 9, 2012 at 2:42 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> On Wed, May 09, 2012 at 07:31:52AM +0200, Koen Kooi wrote:
>>>=20
>>> Op 9 mei 2012, om 00:53 heeft Khem Raj het volgende geschreven:
>>>=20
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> meta/recipes-kernel/kmod/kmod.inc |    4 ++--
>>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/meta/recipes-kernel/kmod/kmod.inc =
b/meta/recipes-kernel/kmod/kmod.inc
>>>> index 681e52b..70d376e 100644
>>>> --- a/meta/recipes-kernel/kmod/kmod.inc
>>>> +++ b/meta/recipes-kernel/kmod/kmod.inc
>>>> @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://packages.profusion.mobi/kmod/"
>>>> LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
>>>> LICENSE_libkmod =3D "LGPL-2.1+"
>>>> SECTION =3D "base"
>>>> -PV =3D "7+git${SRCREV}"
>>>> +PV =3D "8+git${SRCREV}"
>>>=20
>>> Drop the +git$SRCREV, it's a release.
>=20
> it does have 2 commits on top of .8 so  I have changed SRCREV to SRCPV
> and updated the pull tree.

Please drop the SRCPV, it's version '8', not =
8+giter8735827548237582758293=



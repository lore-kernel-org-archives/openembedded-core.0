Return-Path: <erik.boto@pelagicore.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8047765D03
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 11:07:27 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id m1so12014281oag.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jul 2014 04:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=v9JSAzKORW/h7X9sksILEF5ECJEYtz0evn+3tTQr1PM=;
	b=J+rrbZl/RV8Ju+t2tExOVU0LmFa7K5SuRbNocvPjRKwH3p6Fpw/gyADLeLLk4FrzG7
	lRsYZgtwhOlBcLscJ95axE7bWttD1heWuckOjSsBbPetZwgSUh7dOqbf5BKJn03MH3Lw
	BdcWKat3K+2ly/bmm+KUqnUQllTKn2D3Xq9dmBV2T1Spq0bobUQ68t4JamUb6Pd/Es50
	+DE6K+S5xPuJq5U6x/0gNawJEt77tpOBXwR16YdTmnyMzxFyMhb4QBSqU40rdmW6g3dl
	aiYIXzBv8JKd/ClAvBAY8sDuCVQbTn13SsjlP0bGmPzFvRmxuBHZZwc5DdA7RUQQ2pyk
	Rh3A==
X-Gm-Message-State: ALoCoQmZNwGQb4fidNi43fGALyBmw6WBYWkeeP/ayHTlJ5q3K3jqgMRcGJnE0+P9CGYjeO0Cybo5
MIME-Version: 1.0
X-Received: by 10.60.101.170 with SMTP id fh10mr56184764oeb.39.1404299248957; 
	Wed, 02 Jul 2014 04:07:28 -0700 (PDT)
Received: by 10.76.69.228 with HTTP; Wed, 2 Jul 2014 04:07:28 -0700 (PDT)
In-Reply-To: <CA+AhUGwRbd4kv0_wd3Y9=5SPe-cf76FKqMU4mdH7_m1YucWabw@mail.gmail.com>
References: <CA+AhUGwRbd4kv0_wd3Y9=5SPe-cf76FKqMU4mdH7_m1YucWabw@mail.gmail.com>
Date: Wed, 2 Jul 2014 13:07:28 +0200
Message-ID: <CA+AhUGwaxiyWWRbRdB995q+VJTfK3vrXr-ismOp95NKDS40bkA@mail.gmail.com>
From: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Building mesa uses hosts wayland-scanner instead of version from sysroot
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
X-List-Received-Date: Wed, 02 Jul 2014 11:07:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Short update:

It appears I have two machines where the configure script find
wayland-scanner in /usr/bin and one machine where it actually find the
correct one in the sysroot. The difference seems to be that the
machine where it works doesn't have a wayland-scanner in /usr/bin/,
for some reason the one in /usr/bin gets chosen before the sysroot
version when available.

Cheers,
Erik

On Wed, Jul 2, 2014 at 9:48 AM, Erik Bot=C3=B6 <erik.boto@pelagicore.com> w=
rote:
> Hi,
>
> I noticed differences when building mesa on my local machine and on
> one of our build servers. It failed on my local host due to errors in
> the generated wayland-drm-client-protocol.h but worked on the build
> server. Examining log.do_compile I noticed that it uses
> wayland-scanner from /usr/bin/ on both machines instead of using the
> one present in the sysroot, so I guess it works due to luck on one
> machine.
>
> If I make /usr/bin/wayland-scanner a symlink to the version in the
> sysroot it builds ok.
>
> Can anyone else verify if their mesa builds uses the hosts
> wayland-scanner? And does anyone the proper way to convince mesa to
> use the sysroot version?
>
> (I'm using daisy, so mesa 9.2.5)
>
> Cheers,
> Erik



--=20
Erik Bot=C3=B6
M.Sc.E.E.
SENIOR SOFTWARE ENGINEER

Pelagicore AB
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46 (0)768 817 203
E-Mail: erik.boto@pelagicore.com

PELAGICORE Experience Change


Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SxKFm-0001cK-Bg
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 17:57:30 +0200
Received: by eekb57 with SMTP id b57so243286eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 08:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VEytsgcriqdDQzJbDH6FXtVZeczI6dVdYjC//uQvXs8=;
	b=kllnRQGTC6JJD8pxjZ1EoMzDj2xzABfESxVvUa3sCdGHtgMCMN0xwLtI6T8GUXVbBl
	7e4SAnnl56DVZPJuBLKb0Xy28aEv9fSSDXZXGNI1egf5NIOgr91mNusEluDgluih2TJI
	gjluBbrbGG0pTuzcr6tp8R+2xEhL6UYfQEI6UYwIqTAxPZc7jeGhoeyIPrpZ3fWTpJK1
	TabgPnp66fD8zxp63/rj2THeWeO6hq1X/PcqT3mkopzyT3b2B8beJnJ5bdUBlXScRtVg
	xN8xgdS05TkB2gZBHVZAFaCygs/2TvizXQq3qCRFjRIP5BOhMdsx3rFL7UaaQ2AmLlG8
	B8sg==
Received: by 10.14.180.67 with SMTP id i43mr2676387eem.23.1344008749494;
	Fri, 03 Aug 2012 08:45:49 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id q3sm23474783eeo.4.2012.08.03.08.45.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 08:45:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <EC2F754A1E854583B06C4E1BF18AB5F9@intel.com>
Date: Fri, 3 Aug 2012 17:46:04 +0200
Message-Id: <132C9DB1-9203-4938-A080-7496B592D723@dominion.thruhere.net>
References: <cover.1343926021.git.ross.burton@intel.com>
	<94E6EEF2-BA2A-4B68-A9CB-98133061274E@dominion.thruhere.net>
	<8242048D6F2A4934B1D6E6CB30CF8C3A@intel.com>
	<C94E9933-5642-406C-ACBC-2F0A13E6AB41@dominion.thruhere.net>
	<EC2F754A1E854583B06C4E1BF18AB5F9@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQlxPJqww/zhimLSP4OW8kkInPAxcgAIGH7tkLyo9merE5EYZ1jzUsp9Dhv5xts7J687Da95
Subject: Re: [PATCH V3 00/11] Mesa upgrade/improvements
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
X-List-Received-Date: Fri, 03 Aug 2012 15:57:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 aug. 2012, om 15:19 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> On Friday, 3 August 2012 at 11:18, Koen Kooi wrote:
>> libegl and libgles aren't built nowadays, so the problem is avoided. =
Noone has dared to touch this subject the past 2.5 years: =
http://cgit.openembedded.org/openembedded/commit/recipes/mesa?id=3D3d96f8c=
b61225d515b5cb4fe863f0d50c3ced436
>>=20
>> The best solution[1] is to disable egl/gles in the mesa-recipes and =
add a seperate recipe for them. That way you still get glu and other =
useful mesa bits needed for gnome/efl/xfce/etc, but you can skip the =
sysroot/shlib poisoning if needed.
> After much digging I see that the Beagle PVR drivers only provide gles =
and egl, which is why you say that the problem was avoided.  Of course =
that's just one specific driver, for example the Cedar Trail EMGD driver =
does build libgl, libgles and libegl.
>=20
> If the solution is "put the egl/gles bits in another package"

Recipe, not package. Big difference :)

> then I'm totally confused as to what the actual problem is.  =
Considering there's numerous libegl libraries for the many variants of =
PVR on ARM, I'm struggling to understand exactly what is new here.
>=20
> Can you explain clearly what the problem is, I'm obviously missing =
something.  Once I understand the problem I can help with a solution.

You need mesa for the !egl and !gles libs and evil vendor blob for egl =
and gles libs. In the emgd case you can get gl from the evil vendor as =
well. To build e.g. EFL I need mesa for the !egl and !gles bits, to =
build EFL with gles support I need mesa (again !egl, !gles) in addition =
to evil vendor blob for egl and gles.=20
We could make this work with MACHINE_FEATURES or something similar, but =
that would mean that a very large chunk of userspace now becomes machine =
specific. This is how clutter worked in the past and just look at the =
fit the canonical/linaro people threw when they started doing 'embedded' =
and clutter.

To compress the above: you need to build both the mesa and the =
evil-egl-binary *recipes* for things to work, so the egl bits should be =
a different recipe, not a subpackage of the mesa recipe. This is all =
assuming we care abou the binary blobs e.g. TI distributes for 3d =
support. If you don't, fine, merge this patchset.

>> [1] The best solution if of course getting sgx support into mesa, but =
nothing is happening on that front apart from some posturing on the fsf =
side, no actual code.
>=20
> HahahHAHAHAHahha.  (wipes tears from eyes)  The FSF can posture all =
they want (wasn't aware they'd done that as the code is clearly closed =
source), but I can't see Imagination opening all their code any day =
soon.

It's a reverse engineering effort in which only FSF marketing is =
involved. Their idea is right, look at the Mali and Adreneo RE work, =
that's coming along nicely.=



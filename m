Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SxF9H-0002tB-SG
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 12:30:27 +0200
Received: by eekb57 with SMTP id b57so131192eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 03:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=VsPOV2JwhTCsRmN5AsuPg/RZ4KuZfZev0awY0cLUgWg=;
	b=nG5DaVnMKBlRFO8c3Hm94JugELC3c15ecI/QfRkypmIAmZ68oqP9UEWamA03o41As1
	mXN+sZw7nNYGLNFzNNHenwogqlxwVI5a+Z64wHWNe8r6VcEyqgz5Hfj6Js38zWNbnbeo
	+0Oy+4iH+KGIbsMszygJv+Rv/mKWHl3lix1fpjELcB475iP92S9bUQPVva8WjnZdV+lC
	eLhBH/t1lPYNU59NKV4kuMaP9Dl0xYWE7HXt8KLhDHXHt4mc5Wnbx27uJeapO9iz9Ia1
	N0b1u3TJygVVnaru2cdClLUxICBP4VfFMeivmzl6IOcoBRxM7oLRCLCbPHtOrJ/evy2K
	xB/g==
Received: by 10.14.178.7 with SMTP id e7mr1485643eem.20.1343989127184;
	Fri, 03 Aug 2012 03:18:47 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id s8sm24474736eeo.8.2012.08.03.03.18.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 03:18:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8242048D6F2A4934B1D6E6CB30CF8C3A@intel.com>
Date: Fri, 3 Aug 2012 12:18:52 +0200
Message-Id: <C94E9933-5642-406C-ACBC-2F0A13E6AB41@dominion.thruhere.net>
References: <cover.1343926021.git.ross.burton@intel.com>
	<94E6EEF2-BA2A-4B68-A9CB-98133061274E@dominion.thruhere.net>
	<8242048D6F2A4934B1D6E6CB30CF8C3A@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnb4tzcu48BYUJZPm2OlHOFr5Pv//d5oOj8ehMvwHO53SNzj9rg16Lz+W57bvPKFf6nqrWY
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
X-List-Received-Date: Fri, 03 Aug 2012 10:30:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 aug. 2012, om 21:03 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> On Thursday, 2 August 2012 at 19:38, Koen Kooi wrote:
>> This will still break every platform with a binary libegl and =
libgles.
>=20
> That is true and I'm all ears for suggestions. My best proposal so far =
is to let a package hint a prefix to the Debian renamer, so these =
packages get renamed to libmesa-gl, libmesa-egl, etc.
>=20
> That said I'm very curious how every platform with a binary libgl =
isn't already broken.

libegl and libgles aren't built nowadays, so the problem is avoided. =
Noone has dared to touch this subject the past 2.5 years: =
http://cgit.openembedded.org/openembedded/commit/recipes/mesa?id=3D3d96f8c=
b61225d515b5cb4fe863f0d50c3ced436

The best solution[1] is to disable egl/gles in the mesa-recipes and add =
a seperate recipe for them. That way you still get glu and other useful =
mesa bits needed for gnome/efl/xfce/etc, but you can skip the =
sysroot/shlib poisoning if needed.

regards,

Koen

[1] The best solution if of course getting sgx support into mesa, but =
nothing is happening on that front apart from some posturing on the fsf =
side, no actual code.=



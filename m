Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGnex-0004DL-DB
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 10:07:27 +0200
Received: by eyd9 with SMTP id 9so2541971eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 01:01:35 -0700 (PDT)
Received: by 10.213.32.207 with SMTP id e15mr1289955ebd.8.1319097694816;
	Thu, 20 Oct 2011 01:01:34 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 49sm23076192eec.1.2011.10.20.01.01.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 01:01:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E9FD2B2.5000508@intel.com>
Date: Thu, 20 Oct 2011 10:01:32 +0200
Message-Id: <C5906E2A-6B15-4452-88B5-466002B6B096@dominion.thruhere.net>
References: <66cdd5054e220fcce980222ed68a2afc37f614af.1318984111.git.nitin.a.kamble@intel.com>
	<35417d38f61615445ed0c4d875e0bd0aa5649af4.1318984111.git.nitin.a.kamble@intel.com>
	<4E9FD2B2.5000508@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/6] gmp: also generate the libgmpcxx library
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
X-List-Received-Date: Thu, 20 Oct 2011 08:07:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 okt. 2011, om 09:50 heeft Saul Wold het volgende geschreven:

> On 10/18/2011 05:30 PM, nitin.a.kamble@intel.com wrote:
>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>=20
>> configure runs few checks to make sure c++ compiler and runtime are =
working as expected
>> with the --enable-cxx=3Ddetect option.
>>=20
> Somehow this change has also changed what the gmp package provides, =
before this change the package provided libgmp10 via PKG_gmp: libgmp10, =
after this change, the libgmp10 is no longer provided and causes other =
breakage.
>=20
> The example case I found was a coreutils package that was built prior =
to this change failed to fulfill it's dependencies after this change =
when creating an image.  If I rebuild coreutils with the newer gmp =
build, then all is well, I think we need to understand this better =
before making this change.
>=20
> Did something else change in the packaging that would cause use to =
look the mapping above?

I suspect the shlib renaming doesn't happen when 2 libraries are present =
without LEAD_SONAME being set in the recipe. I suggest making a new =
subpackage for libgmpcxx.

regards,

Koen=



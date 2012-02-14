Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RxJWj-0006LA-Mj
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 15:38:41 +0100
Received: by daln34 with SMTP id n34so9010dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 06:30:30 -0800 (PST)
Received: by 10.68.75.79 with SMTP id a15mr57018665pbw.62.1329229481669;
	Tue, 14 Feb 2012 06:24:41 -0800 (PST)
Received: from [192.168.250.124] ([108.60.121.130])
	by mx.google.com with ESMTPS id o7sm3775185pbq.8.2012.02.14.06.24.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Feb 2012 06:24:40 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120214065309.GA29437@jama.jama.net>
Date: Tue, 14 Feb 2012 06:24:37 -0800
Message-Id: <A52C0572-3209-4104-B57D-1A8A84B89872@dominion.thruhere.net>
References: <4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<20120213074852.GA3832@jama.jama.net>
	<CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
	<60152733-3093-4B6D-8D98-517DEA75C5A2@dominion.thruhere.net>
	<857BE142E5399E46B20FD45B9DB8A7BC0FCE7381@SHSMSX102.ccr.corp.intel.com>
	<20120214065309.GA29437@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQklAFwNo0QweiUdUJaEaw9PMTGqKOy4ctJnH9vLXOYWZZJKTYUGL5mAnXKbw3jELhNftva1
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Tue, 14 Feb 2012 14:38:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 feb. 2012, om 22:53 heeft Martin Jansa het volgende geschreven:

> On Tue, Feb 14, 2012 at 04:52:30AM +0000, Lu, Lianhao wrote:
>>>>>>=20
>>>>>> It works if you -c cleansstate on a bunch of recipes, pango, =
cairo, fontconfig, gtk+, etc
>>>>>=20
>>=20
>> I tried rpm-native after "-c cleansstate", but it still asks for =
libz.la? Anyone has the clue?
>=20
> one .la still with libz.la in dependency tree is enough to pollute all
> .la files even when they get rebuild thanks to PR bump.
>=20
> That's why I sent another wider round of PR bumps to oe-core and also =
to
> all layers (oe-core, meta-openembedded/*, meta-smartphone/*) I'm using =
at once,=20
> because ie libsoup-2.4 from meta-efl wasn't PR bumped and was still =
pulling=20
> libz.la to all .la files depending on libsoup :/.
>=20
> And even my wider PR bump round isn't 100% complete for everybody,
> because it's based on sysroot popultated by my builds and you can have
> different .la files there (from different recipe versions or different
> layers).


Saul and I discussed this yesterday and we also suspect using =
--as-needed in LDFLAGS limits the impact of this problem. But still, PR =
bumps are needed to keep the -dev packages in the feeds working.

regards,

Koen=



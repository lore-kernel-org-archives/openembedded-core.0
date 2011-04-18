Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QBjRX-0003zo-Cy
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:04:26 +0200
Received: by wye20 with SMTP id 20so4083620wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 01:02:03 -0700 (PDT)
Received: by 10.227.28.94 with SMTP id l30mr4593770wbc.100.1303113721119;
	Mon, 18 Apr 2011 01:02:01 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o6sm3086948wbo.37.2011.04.18.01.02.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 01:02:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303110555.5518.64.camel@rex>
Date: Mon, 18 Apr 2011 10:01:59 +0200
Message-Id: <B4EB4EB4-C631-481F-94DE-65C7789136F2@dominion.thruhere.net>
References: <1303107421.5518.45.camel@rex>
	<20110418065013.GI25122@jama.jama.net>
	<1303110555.5518.64.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: RFC: Layer tooling brainstorming
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
X-List-Received-Date: Mon, 18 Apr 2011 08:04:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr 2011, om 09:09 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-04-18 at 08:50 +0200, Martin Jansa wrote:
>> On Mon, Apr 18, 2011 at 07:17:01AM +0100, Richard Purdie wrote:
>>=20
>> maybe I've missed something, but
>> * Parsing error when ie foo_1.0.bbappend is found, but foo_1.0.bb in
>>  upper layer was upgraded to foo_1.1.bb
>>=20
>> This can cause big problems when distribution explicitly enables
>> something in .bbappend with EXTRA_OECONF, and someone updates all
>> layers, builds foo_1.1.bb and installs it on targets before noticing
>> that foo_1.0.bbappend wasn't used. Then he has to bump PR after =
adding
>> foo_1.1.bbappend to distro layer (to fix foo on targets), so I would
>> prefer parsing error in this case (won't help if upper layer keeps =
both
>> versions foo_1.0.bb and foo_1.1.bb ;/).
>>=20
>> This should be combined with your 2nd point and person who changes
>> versioned dependency on upper layer should check that all needed
>> .bbappends still apply.
>=20
> Agreed but I thought we already had a tool to handle at least some of
> this though? Certainly integration of that with the above is essential
> though.

This is what I get for my setup:

koen@dominion:/OE/tentacle/build$ bitbake-layers=20
<string>:1: DeprecationWarning: Call to deprecated function =
bb.parse.parse_py.BBHandler.vars_from_file: Please use =
bb.parse.vars_from_file instead.
<string>:6: DeprecationWarning: Call to deprecated function bb.which: =
Please use bb.utils.which instead.
WARNING: Bitbake has not been run using the bitbake wrapper =
(scripts/bitbake); this is likely because your PATH has been altered =
from that normally set up by the poky-init-build-env script. Not using =
the wrapper may result in failures during package installation, so it is =
highly recommended that you set your PATH back so that the wrapper =
script is being executed.
WARNING: Pseudo is not functioning correctly, which will cause failures =
during package installation. Please check your configuration.
Parsing recipes..<string>:1: DeprecationWarning: Call to deprecated =
function bb.which: Please use bb.utils.which instead.
<string>:1: DeprecationWarning: Call to deprecated function bb.which: =
Please use bb.utils.which instead.
<string>:1: DeprecationWarning: Call to deprecated function bb.which: =
Please use bb.utils.which instead.
done.
INFO: State of append files:
INFO: base-files_3.0.14.bb:
INFO:   =
/OE/tentacle/sources/meta-angstrom/recipes-core/base-files/base-files_3.0.=
14.bbappend
INFO: libusb-compat_0.1.3.bb:
INFO:   =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-support/libusb/libu=
sb-compat_0.1.3.bbappend
INFO: sysvinit_2.88dsf.bb:
INFO:   =
/OE/tentacle/sources/meta-angstrom/recipes-core/sysvinit/sysvinit_2.88dsf.=
bbappend
koen@dominion:/OE/tentacle/build$=20

regards,

Koen=



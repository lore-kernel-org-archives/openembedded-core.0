Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQEHt-0003YN-Sh
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 09:50:22 +0200
Received: by wwb17 with SMTP id 17so2104822wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 00:45:33 -0700 (PDT)
Received: by 10.216.46.21 with SMTP id q21mr473249web.113.1306568733575;
	Sat, 28 May 2011 00:45:33 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c51sm1365293wek.47.2011.05.28.00.45.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 00:45:32 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DE02216.1010003@intel.com>
Date: Sat, 28 May 2011 09:45:30 +0200
Message-Id: <25E0A1D8-A93E-41D1-BD1A-C526C99AD312@dominion.thruhere.net>
References: <4DE02216.1010003@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/1][v3] license.bbclass parsing changes rebased sans debug
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
X-List-Received-Date: Sat, 28 May 2011 07:50:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 mei 2011, om 00:13 heeft Elizabeth Flanagan het volgende =
geschreven:

>=20
> Using python abstract syntax trees as a parser and an ast visitor =
class, I've
> begun the first steps to being able to put some sanity to license =
selection.
>=20
> One note. License modifiers have traditionally been limited to the "or =
greater"
> modifier "+". I've added another modifier "with exceptions" for =
licenses that
> have no generic ie common-licenses/GPL-2,0-with-GCC-exception

I get this now:

WARNING: =
/OE/tentacle/sources/openembedded-core/meta/files/common-licenses
WARNING: We need to use a SPDXLICENSEMAP for GPLv2

Is that really a warning, should that be a note or even complete hidden =
from the console?

regards,

Koen=



Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pz6kv-0005cQ-4i
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 13:20:13 +0100
Received: by wyb40 with SMTP id 40so4101634wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 05:18:31 -0700 (PDT)
Received: by 10.216.143.89 with SMTP id k67mr2353762wej.25.1300105111053;
	Mon, 14 Mar 2011 05:18:31 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id n73sm332811wej.12.2011.03.14.05.18.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Mar 2011 05:18:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201103141151.12235.paul.eggleton@linux.intel.com>
Date: Mon, 14 Mar 2011 13:18:29 +0100
Message-Id: <46D5E03C-9927-4F57-A6AC-7024B8478E1C@dominion.thruhere.net>
References: <cover.1299891748.git.sgw@linux.intel.com>
	<4D7ACD9C.3010002@linux.intel.com>
	<20110312023140.GA4829@sakrah.homelinux.org>
	<201103141151.12235.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1082)
Cc: poky@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/1] gnu-config make sure we use perl-native
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
X-List-Received-Date: Mon, 14 Mar 2011 12:20:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 mrt 2011, om 12:51 heeft Paul Eggleton het volgende geschreven:

> On Saturday 12 March 2011 02:31:40 Khem Raj wrote:
>>> Back to the drawing board on why the miss-match is occuring in
>>> Config.pm then.
>>=20
>> somewhere there is /usr/bin/perl referred may be a cross recipe ?
>=20
> I've hit this issue this morning, and have filed a bug report:
>=20
>  http://bugzilla.pokylinux.org/show_bug.cgi?id=3D866
>=20
> Not sure if it helps but at least it should be easy to reproduce.

I haven't checked if the OE .dev and OE core gnu-config are similar, but =
have a look at:

=
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dbe21179c53=
21bd0afb9221f020ac12ad75c86a3b
=
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dedcdefbf6e=
0675c1bcc1fc4f464f654223380e50

regards,

Koen=



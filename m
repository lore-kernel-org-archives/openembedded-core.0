Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q5Itf-0006vw-NE
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 16:30:53 +0200
Received: by wwb17 with SMTP id 17so2516191wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 07:28:47 -0700 (PDT)
Received: by 10.216.195.139 with SMTP id p11mr2596452wen.67.1301581727405;
	Thu, 31 Mar 2011 07:28:47 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id n2sm534507wej.46.2011.03.31.07.28.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 07:28:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 31 Mar 2011 16:28:46 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Message-Id: <97683FC9-5A69-4D7A-80A4-4FEA70730EA8@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: [Announce] Angstrom-layers has been deprecated, manual bblayers.conf editing needed
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
X-List-Received-Date: Thu, 31 Mar 2011 14:30:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Apologies for crossposting, please vet the addresses when replying.

When starting the yocto support in angstrom we started with a single =
repo with a few layers, angstrom-layers. Over time various layers were =
split out and moved (e.g. meta-oe) to make development easier and have =
clearer seperatation.Today the last piece of angstrom-layers has been =
split out into its own repo, which makes it obsolete. The necessary =
changes to the angstrom setup scripts have been made:

=
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/commit=
/?h=3Doe-core

For existing users you need to make a similar change to =
build/conf/bblayers.conf.

The new, but temporary, location for the TI BSP is now at =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/. The final location is unknown, since OE hasn't made up their mind =
about hosting BSPs on OE.org yet and TI needs to decide internally which =
location would be best (oe.org, angstrom, yocto, something else). But =
for the time being it will live on the angstrom server.

=46rom now on there should only be layer additions :)

regards,

Koen=



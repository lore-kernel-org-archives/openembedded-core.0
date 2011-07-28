Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmQJb-0007vu-W4
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 15:07:52 +0200
Received: by wyg30 with SMTP id 30so106328wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 06:03:36 -0700 (PDT)
Received: by 10.227.62.195 with SMTP id y3mr1329214wbh.94.1311858216287;
	Thu, 28 Jul 2011 06:03:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l55sm666742wed.41.2011.07.28.06.03.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 06:03:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311857437.3398.18.camel@lenovo.internal.reciva.com>
Date: Thu, 28 Jul 2011 15:03:29 +0200
Message-Id: <48068E2E-4F39-44D1-AB81-9C6495B3C0AC@dominion.thruhere.net>
References: <cover.1309883050.git.paul.eggleton@linux.intel.com>
	<e50edfa0e355ecfe38887adace64247e363150a8.1309883050.git.paul.eggleton@linux.intel.com>
	<613A1098-12B3-4A25-9E82-AC97326DBEA3@dominion.thruhere.net>
	<1311857437.3398.18.camel@lenovo.internal.reciva.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/1] combo-layer-tool: add tool to manipulate combo layers
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
X-List-Received-Date: Thu, 28 Jul 2011 13:07:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2011, om 14:50 heeft Phil Blundell het volgende geschreven:

> On Thu, 2011-07-28 at 14:11 +0200, Koen Kooi wrote:
>> 1) overlapping files like .gitignore breaks the script
>> 2) git format-patch | git am is a lossy process, so you can't import =
oe-core and bitbake from scratch:=20
>=20
> Assuming I understand the intent correctly (which is by no means
> certain), it sounds like maybe what you want for (2) is git-subtree.  =
I
> agree that generating patches and piping them into git am sounds a bit
> suboptimal for moving changesets from one place to another.

It indeed looks like scripts/combo-layer can be replaced with =
https://github.com/apenwarr/git-subtree/blob/master/git-subtree.txt

I'm still not sure how much the "everything in one repo" approach will =
buy the angstrom maintainers, but at least now I now a few more ways to =
assemble the one-git-repo-to-rule-them-all :)

regards,

Koen=



Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QromV-0000KN-IS
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 12:15:59 +0200
Received: by wwe32 with SMTP id 32so2498274wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 03:11:27 -0700 (PDT)
Received: by 10.227.135.129 with SMTP id n1mr650470wbt.10.1313143886682;
	Fri, 12 Aug 2011 03:11:26 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 8sm2213863wbx.0.2011.08.12.03.11.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Aug 2011 03:11:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201108121010.51135.paul.eggleton@linux.intel.com>
Date: Fri, 12 Aug 2011 12:11:24 +0200
Message-Id: <B10F3DBD-4A1F-45AE-886D-A08FDDA130E8@dominion.thruhere.net>
References: <1313078412-6872-1-git-send-email-noor_ahsan@mentor.com>
	<989A078976CDAD4CB2DC976EEF70E2A5068A4EA5@eu2-mail.mgc.mentorg.com>
	<20110812072950.GH2214@jama.jama.net>
	<201108121010.51135.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] bluez4: Added new recipe version 4.96
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
X-List-Received-Date: Fri, 12 Aug 2011 10:15:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 aug. 2011, om 11:10 heeft Paul Eggleton het volgende geschreven:

> On Friday 12 August 2011 08:29:50 Martin Jansa wrote:
>> I think that's expected with layers.. and someone will update it in
>> meta-oe as soon as it starts complaining..
>=20
> If we're updating the version in OE-core then do we still need the one =
in=20
> meta-oe? What would it do that the OE-core version wouldn't?

It would build from scratch, where the OE-core one wouldn't due to =
missing deps :) And your udev and bluez versions need to match since =
some utils (hid2hci) moved between them.

On a more serious note, how does one become a maintainer for a recipe in =
OE-core? Bluez4 only seems to get updates when someone tries to update =
recipes-connectivity/* and doesn't seem to get actually used or runtime =
tested.

regards,

Koen=



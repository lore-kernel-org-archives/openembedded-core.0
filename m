Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QvmUc-0003PD-Nd
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 10:37:54 +0200
Received: by wwj26 with SMTP id 26so3136303wwj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2011 01:33:09 -0700 (PDT)
Received: by 10.227.9.18 with SMTP id j18mr91069wbj.80.1314088389714;
	Tue, 23 Aug 2011 01:33:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm9sm5485259wbb.27.2011.08.23.01.33.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Aug 2011 01:33:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110823064454.GA8170@chargestorm.se>
Date: Tue, 23 Aug 2011 10:33:04 +0200
Message-Id: <55728DAE-E156-4EF8-BE63-0F2FEBE3BFCB@dominion.thruhere.net>
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
	<8c4bf939c0906cd744debeb85d5d55de622c184e.1313606178.git.paul.eggleton@linux.intel.com>
	<91BBD9D6-2616-4A85-B87A-5DFA1AD82152@dominion.thruhere.net>
	<20110823064454.GA8170@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [RFC PATCH 1/2] image.bbclass, kernel.bbclass: create warning file about deleting deploydir files
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
X-List-Received-Date: Tue, 23 Aug 2011 08:37:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 aug. 2011, om 08:44 heeft Anders Darander het volgende geschreven:

> * Koen Kooi <koen@dominion.thruhere.net> [110822 23:01]:
>> Op 17 aug. 2011, om 20:37 heeft Paul Eggleton het volgende =
geschreven:
>>> +	cp -n ${COREBASE}/meta/files/deploydir_readme.txt =
${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>>> +
>=20
>> That doesn't work on my debian box:
>=20
>> | + cp -n =
/OE/tentacle/sources/openembedded-core/meta/files/deploydir_readme.txt =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy/images/beagleboard/RE=
ADME_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>> | cp: invalid option -- 'n'
>> | Try `cp --help' for more information.
>=20
> Which debian version are you running?
>=20
> I've seen no problem, as far as I can tell, on neither my ubuntu, nor =
my
> debian box. (Although I'm running debian sid on that one).

koen@dominion:/OE/tentacle/sources/openembedded-core$ lsb_release -a
/usr/bin/lsb_release:81: DeprecationWarning: the sets module is =
deprecated
  import sets
No LSB modules are available.
Distributor ID:	Debian
Description:	Debian GNU/Linux 5.0 (lenny)
Release:	5.0
Codename:	lenny




Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qvbh1-0005q9-JG
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:05:59 +0200
Received: by wyf19 with SMTP id 19so4043427wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2011 14:01:15 -0700 (PDT)
Received: by 10.216.235.212 with SMTP id u62mr2349739weq.104.1314046875094;
	Mon, 22 Aug 2011 14:01:15 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id eq21sm5139944wbb.35.2011.08.22.14.01.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 14:01:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8c4bf939c0906cd744debeb85d5d55de622c184e.1313606178.git.paul.eggleton@linux.intel.com>
Date: Mon, 22 Aug 2011 23:01:11 +0200
Message-Id: <91BBD9D6-2616-4A85-B87A-5DFA1AD82152@dominion.thruhere.net>
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
	<8c4bf939c0906cd744debeb85d5d55de622c184e.1313606178.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Mon, 22 Aug 2011 21:05:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 aug. 2011, om 20:37 heeft Paul Eggleton het volgende geschreven:

> New users sometimes delete files in tmp/deploy/images assuming they =
will
> be re-created just by re-running the build, and then are confused when
> this doesn't work. To discourage people from doing this, create a file
> called README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt in
> tmp/deploy/images containing an explanation of what needs to be done =
to
> re-create files there.
>=20
> Fixes [YOCTO #1315] and [YOCTO #1346].
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/classes/image.bbclass      |    2 ++
> meta/classes/kernel.bbclass     |    2 ++
> meta/files/deploydir_readme.txt |    8 ++++++++
> 3 files changed, 12 insertions(+), 0 deletions(-)
> create mode 100644 meta/files/deploydir_readme.txt
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 54eb78b..286ae01 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -138,6 +138,8 @@ fakeroot do_rootfs () {
> 	mkdir -p ${IMAGE_ROOTFS}
> 	mkdir -p ${DEPLOY_DIR_IMAGE}
>=20
> +	cp -n ${COREBASE}/meta/files/deploydir_readme.txt =
${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> +

That doesn't work on my debian box:

| + cp -n =
/OE/tentacle/sources/openembedded-core/meta/files/deploydir_readme.txt =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy/images/beagleboard/RE=
ADME_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
| cp: invalid option -- 'n'
| Try `cp --help' for more information.=



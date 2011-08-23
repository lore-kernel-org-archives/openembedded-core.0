Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QvseK-0008TY-9e
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 17:12:20 +0200
Received: by wwe32 with SMTP id 32so182725wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2011 08:07:34 -0700 (PDT)
Received: by 10.227.167.75 with SMTP id p11mr363497wby.4.1314112054820;
	Tue, 23 Aug 2011 08:07:34 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb10sm53743wbb.5.2011.08.23.08.07.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Aug 2011 08:07:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3b2374ace44a610af75052498766f9840fb3d615.1314094152.git.paul.eggleton@linux.intel.com>
Date: Tue, 23 Aug 2011 17:07:27 +0200
Message-Id: <16D7EE53-0824-479A-8438-DEFCD976BBF8@dominion.thruhere.net>
References: <cover.1314094152.git.paul.eggleton@linux.intel.com>
	<3b2374ace44a610af75052498766f9840fb3d615.1314094152.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/1] image.bbclass: remove non-standard -n option from cp command
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
X-List-Received-Date: Tue, 23 Aug 2011 15:12:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 aug. 2011, om 12:11 heeft Paul Eggleton het volgende geschreven:

> -n is not a POSIX option and does not work on some systems (e.g. =
Debian
> Lenny); in any case it is not strictly necessary here, so remove it.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Tested-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> meta/classes/image.bbclass |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 286ae01..bf8b73a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -138,7 +138,7 @@ fakeroot do_rootfs () {
> 	mkdir -p ${IMAGE_ROOTFS}
> 	mkdir -p ${DEPLOY_DIR_IMAGE}
>=20
> -	cp -n ${COREBASE}/meta/files/deploydir_readme.txt =
${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> +	cp ${COREBASE}/meta/files/deploydir_readme.txt =
${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>=20
> 	if [ "${USE_DEVFS}" !=3D "1" ]; then
> 		for devtable in ${@get_devtable_list(d)}; do
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




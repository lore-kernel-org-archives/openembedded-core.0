Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RxJb1-0006Sf-9R
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 15:43:07 +0100
Received: by daln34 with SMTP id n34so12058dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 06:34:56 -0800 (PST)
Received: by 10.68.216.227 with SMTP id ot3mr60258033pbc.18.1329229713475;
	Tue, 14 Feb 2012 06:28:33 -0800 (PST)
Received: from [192.168.250.124] ([108.60.121.130])
	by mx.google.com with ESMTPS id y9sm3809758pbi.3.2012.02.14.06.28.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Feb 2012 06:28:32 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <f0a239770c953c55f604106afe0466a8b4ae4cea.1329226672.git.paul.eggleton@linux.intel.com>
Date: Tue, 14 Feb 2012 06:28:30 -0800
Message-Id: <9A8BCC00-5F64-41FD-8F83-DF1CB52D9650@dominion.thruhere.net>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
	<f0a239770c953c55f604106afe0466a8b4ae4cea.1329226672.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlGyIzL7/GUdfFrSVwSjr7q+nSoOh9MWbXdjHH5VLElyWc73P5xYxkRyfor4DYXqfJ2nR/n
Subject: Re: [PATCH 4/7] classes/buildhistory: use hostname instead of reading /etc/hostname
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
X-List-Received-Date: Tue, 14 Feb 2012 14:43:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 feb. 2012, om 05:40 heeft Paul Eggleton het volgende geschreven:

> For the purposes of querying the hostname to include it in the commit
> message, it seems "cat /etc/hostname" does not work on the Yocto =
Project
> autobuilder machines,

/etc/hostname is a debianism, but systemd is trying to make it a =
standard across all distros: =
http://0pointer.de/blog/projects/the-new-configuration-files.html

regards,

Koen

> and it's likely that the hostname command will be
> more generally reliable, so use that instead.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/classes/buildhistory.bbclass |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/buildhistory.bbclass =
b/meta/classes/buildhistory.bbclass
> index 3fbe3a8..dfc9b73 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -383,7 +383,7 @@ buildhistory_commit() {
> 		repostatus=3D`git status --porcelain`
> 		if [ "$repostatus" !=3D "" ] ; then
> 			git add ${BUILDHISTORY_DIR}/*
> -			HOSTNAME=3D`cat /etc/hostname 2>/dev/null || =
echo unknown`
> +			HOSTNAME=3D`hostname 2>/dev/null || echo =
unknown`
> 			git commit ${BUILDHISTORY_DIR}/ -m "Build =
${BUILDNAME} of ${DISTRO} ${DISTRO_VERSION} for machine ${MACHINE} on =
$HOSTNAME" --author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
> 			if [ "${BUILDHISTORY_PUSH_REPO}" !=3D "" ] ; =
then
> 				git push -q ${BUILDHISTORY_PUSH_REPO}
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




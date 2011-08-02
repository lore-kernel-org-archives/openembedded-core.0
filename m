Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QoEwg-0001Ag-EE
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 15:23:42 +0200
Received: by wyg30 with SMTP id 30so2521886wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 06:19:21 -0700 (PDT)
Received: by 10.216.132.169 with SMTP id o41mr1748766wei.83.1312291161318;
	Tue, 02 Aug 2011 06:19:21 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y29sm4017474weq.9.2011.08.02.06.19.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 06:19:20 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1312288218-15909-1-git-send-email-noor_ahsan@mentor.com>
Date: Tue, 2 Aug 2011 15:19:18 +0200
Message-Id: <0345DE75-8B54-42F3-96D1-DD37F271A3A8@dominion.thruhere.net>
References: <1312288218-15909-1-git-send-email-noor_ahsan@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] kernel.bbcalss: Added do_savedefconfig task.
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
X-List-Received-Date: Tue, 02 Aug 2011 13:23:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 aug. 2011, om 14:30 heeft Noor, Ahsan het volgende geschreven:

> * Added do_savedefconfig task to kernel.bbclass.
>=20
> Signed-off-by: Noor, Ahsan <noor_ahsan@mentor.com>
> ---
> meta/classes/kernel.bbclass |    6 ++++++
> 1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 25d2629..f2f05b1 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -197,6 +197,12 @@ kernel_do_configure() {
>=20
> do_configure[depends] +=3D "${INITRAMFS_TASK}"
>=20
> +do_savedefconfig() {
> +	oe_runmake savedefconfig
> +}
> +do_savedefconfig[nostamp] =3D "1"
> +addtask savedefconfig after do_configure
> +
> pkg_postinst_kernel () {
> 	cd /${KERNEL_IMAGEDEST}; update-alternatives --install =
/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} =
${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
> }

Is there a matching function to copy it to deploy?=



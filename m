Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QtRBh-00040Q-Cf
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 23:28:41 +0200
Received: by yxi19 with SMTP id 19so287862yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 14:24:02 -0700 (PDT)
Received: by 10.236.80.66 with SMTP id j42mr836206yhe.58.1313529842659;
	Tue, 16 Aug 2011 14:24:02 -0700 (PDT)
Received: from [10.76.0.133] (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r28sm511491yhm.52.2011.08.16.14.24.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 14:24:01 -0700 (PDT)
References: <1313525796-21604-1-git-send-email-agnel.joel@gmail.com>
In-Reply-To: <1313525796-21604-1-git-send-email-agnel.joel@gmail.com>
Mime-Version: 1.0 (iPad Mail 8L1)
Message-Id: <23CB1EF8-9ACB-4F95-BE6A-F084E515837A@beagleboard.org>
X-Mailer: iPad Mail (8L1)
From: Jason Kridner <jkridner@beagleboard.org>
Date: Tue, 16 Aug 2011 16:24:01 -0500
To: Joel A Fernandes <agnel.joel@gmail.com>
Cc: "Kooi, Koen" <k-kooi@ti.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] angstrom-task-gnome: Added gedit to task-gnome dependencies
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
X-List-Received-Date: Tue, 16 Aug 2011 21:28:41 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I see the README says this should be on the OE-core list, but maybe this sho=
uld go on the Angstrom list?

On Aug 16, 2011, at 3:24 PM, "Joel A Fernandes" <agnel.joel@gmail.com> wrote=
:

> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
> This patch can be applied  after these have been:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-August/034413=
.html
>=20
> recipes-angstrom/tasks/angstrom-task-gnome.bb |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angst=
rom/tasks/angstrom-task-gnome.bb
> index a2f9fae..75e59c6 100644
> --- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
> +++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
> @@ -41,6 +41,7 @@ RDEPENDS_task-gnome =3D " \
>   gpe-scap \
>   bash \=20
>   tzdata \
> +  gedit \
> "
>=20
> RRECOMMENDS_task-gnome =3D "ofono"
> --=20
> 1.7.0.4
>=20



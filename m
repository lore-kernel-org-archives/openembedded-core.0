Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCysu-0002Do-HX
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 21:18:04 +0200
Received: by bke11 with SMTP id 11so7636572bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2011 12:12:25 -0700 (PDT)
Received: by 10.223.65.76 with SMTP id h12mr26935688fai.7.1318187544868;
	Sun, 09 Oct 2011 12:12:24 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id r6sm14515841fam.0.2011.10.09.12.12.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Oct 2011 12:12:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318184003-19108-1-git-send-email-koen@dominion.thruhere.net>
Date: Sun, 9 Oct 2011 21:12:18 +0200
Message-Id: <1D2BB1DA-C3BE-4AA2-B776-B5B50ED9F510@dominion.thruhere.net>
References: <1318184003-19108-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] alsa-utils 0.10.24.2: fix systemd units when there's no asound.state
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
X-List-Received-Date: Sun, 09 Oct 2011 19:18:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 okt. 2011, om 20:13 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> ...-t-let-systemd-unit-restore-the-volume-wh.patch |   44 =
++++++++++++++++++++
> .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    3 +-
> 2 files changed, 46 insertions(+), 1 deletions(-)
> create mode 100644 =
meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-sy=
stemd-unit-restore-the-volume-wh.patch
>=20
> diff --git =
a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-=
systemd-unit-restore-the-volume-wh.patch =
b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-=
systemd-unit-restore-the-volume-wh.patch
> new file mode 100644
> index 0000000..3b5d969
> --- /dev/null
> +++ =
b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-=
systemd-unit-restore-the-volume-wh.patch
> @@ -0,0 +1,44 @@
> +=46rom 37c99a3cbff36915b56a5703eeaed3c70796f80f Mon Sep 17 00:00:00 =
2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Sun, 9 Oct 2011 20:06:35 +0200
> +Subject: [PATCH] alsactl: don't let systemd unit restore the volume =
when asound.state is missing
> +
> +This avoids an error on bootup
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> +
> +Upstream-status: Pending

Filed as https://bugtrack.alsa-project.org/alsa-bug/view.php?id=3D5459=



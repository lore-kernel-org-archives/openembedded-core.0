Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RRQNO-0004tc-8I
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 16:29:15 +0100
Received: by eyd9 with SMTP id 9so3334849eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 07:22:42 -0800 (PST)
Received: by 10.180.108.47 with SMTP id hh15mr3748584wib.14.1321629761786;
	Fri, 18 Nov 2011 07:22:41 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id co5sm516673wib.8.2011.11.18.07.22.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 07:22:40 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <dee6ab006094693ede5ec6669fa5616a3a00b067.1321628513.git.paul.eggleton@linux.intel.com>
Date: Fri, 18 Nov 2011 16:22:37 +0100
Message-Id: <0CB9A931-9EFF-42DB-B83C-9EBAF02962E8@dominion.thruhere.net>
References: <cover.1321628513.git.paul.eggleton@linux.intel.com>
	<dee6ab006094693ede5ec6669fa5616a3a00b067.1321628513.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [RFC PATCH 1/1] qt4: disable pulseaudio
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
X-List-Received-Date: Fri, 18 Nov 2011 15:29:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 nov. 2011, om 16:03 heeft Paul Eggleton het volgende geschreven:

> Disable pulseaudio support in phonon within Qt4; otherwise it
> auto-detects it and it may be enabled or disabled depending on what =
gets
> built first.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/recipes-qt/qt4/files/pulseaudio-config.patch |   31 =
+++++++++++++++++++++
> meta/recipes-qt/qt4/qt-4.7.4.inc                  |    3 +-
> meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb         |    2 +-
> meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb         |    2 +-
> 4 files changed, 35 insertions(+), 3 deletions(-)
> create mode 100644 meta/recipes-qt/qt4/files/pulseaudio-config.patch
>=20
> diff --git a/meta/recipes-qt/qt4/files/pulseaudio-config.patch =
b/meta/recipes-qt/qt4/files/pulseaudio-config.patch
> new file mode 100644
> index 0000000..5b32815
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/files/pulseaudio-config.patch
> @@ -0,0 +1,31 @@
> +# Allows disabling pulseaudio support within phonon at configure time
> +#=20
> +# Upstream-status: pending
> +#
> +# Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

What follows is a generic question and in no way a criticism or comment =
on your RFC: Have you thought about using git am'able patches for these =
things?Upstream for QT is using git, so it would be nice to use =
somethings as close to the upstream submission as we can get. I've been =
trying to do this for meta-oe and found it helpfull when coming back to =
do the actual upstream push later.

regards,

Koen=



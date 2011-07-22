Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QkAaw-0000hF-3p
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:56:26 +0200
Received: by wwi18 with SMTP id 18so1595995wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 00:52:17 -0700 (PDT)
Received: by 10.216.65.5 with SMTP id e5mr1011808wed.16.1311321137710;
	Fri, 22 Jul 2011 00:52:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w8sm1348442wec.24.2011.07.22.00.52.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 00:52:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <094c87f1cc2f3c987a4975a420994ace4529c521.1311318447.git.sgw@linux.intel.com>
Date: Fri, 22 Jul 2011 09:52:10 +0200
Message-Id: <274F4E49-B5DF-4F8E-97EE-DA162B3960F3@dominion.thruhere.net>
References: <cover.1311318447.git.sgw@linux.intel.com>
	<094c87f1cc2f3c987a4975a420994ace4529c521.1311318447.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [CONSOLIDATED PULL 06/16] default-versions: Update pulseaudio as arm no longer needs a seperate backport
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
X-List-Received-Date: Fri, 22 Jul 2011 07:56:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jul. 2011, om 09:25 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/conf/distro/include/default-versions.inc |    4 +---
> 1 files changed, 1 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/default-versions.inc =
b/meta/conf/distro/include/default-versions.inc
> index 377aba5..e3ef1e6 100644
> --- a/meta/conf/distro/include/default-versions.inc
> +++ b/meta/conf/distro/include/default-versions.inc
> @@ -1,9 +1,7 @@
> #
> # Default preferred versions
> #
> -PULSEAUDIOVERSION ?=3D "0.9.22"
> -PULSEAUDIOVERSION_arm ?=3D "0.9.15"
> -PREFERRED_VERSION_pulseaudio ?=3D "${PULSEAUDIOVERSION}"
> +PREFERRED_VERSION_pulseaudio ?=3D "0.9.23"

If you do that you need to rebuild things linking against pulse as well, =
e.g. gst-plugins-good. I haven't checked if gst actually depends on pull =
in oe-core though.=



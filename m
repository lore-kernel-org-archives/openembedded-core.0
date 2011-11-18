Received: from dgate10.ts.fujitsu.com ([80.70.172.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RRNYK-0007jE-MB
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 13:28:20 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:X-Enigmail-Version:
	Content-Type:Content-Transfer-Encoding;
	b=bojE14wOMNuhhJy1VD8j0m3pUdHmKdOXm4peAPnIFuLEJfQahy65fHfs
	ahvuBDp4mIzqGOUAJFFTrwBR/45F3C0MblREs5aCltuCPIL92oW18Tv3w
	OYt9iDbytQtQgS0ifWBbzzvG3v0EQiggqkhkLIxBFoPgHTlvjW8atyYdl
	IlcF935CqEvrlEl/+bY1COy/iy456M6fuASwZNVge5xy12tHfoBmekioe
	A41RZkNt496aoNy6plLc5XYoqZSLC;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1321618917; x=1353154917;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=t36M9bUf2vYGrGqGdjT1z8dEupzBWAS/p2FIwMSeALc=;
	b=nVF4IQanGS4DzUpR7QJlLQ91SaNCEE08o1nMieY+a3e4fDr+dbW8H3nW
	x63+zjVLA194lOwtSusws8rOblSJKtHv2toPy4uoUsm9KFWcddMgzqxI2
	rBp8LgIQdB+z4yX4M1wLx+zz1bHRPlv/14BqHrFacs2NfNC6RBWv7Qf5c
	wTcntZmVt+xFJxRZ0C3xcEybd+Vkb6X7YbFguNlOZ9gyrBcFnMB4SyIFs
	si9y7cvcHN9gkQbECPMzcHGXkwEXI;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.69,532,1315173600"; d="scan'208";a="93507051"
Received: from abgdgate30u.abg.fsc.net ([172.25.138.66])
	by dgate10u.abg.fsc.net with ESMTP; 18 Nov 2011 13:20:54 +0100
X-IronPort-AV: E=Sophos;i="4.69,532,1315173600"; d="scan'208";a="123313978"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate30u.abg.fsc.net with ESMTP; 18 Nov 2011 13:20:53 +0100
Message-ID: <4EC64DA5.2020406@ts.fujitsu.com>
Date: Fri, 18 Nov 2011 13:20:53 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1320799787.git.josh@linux.intel.com>
	<552def63eb1b587a3f0685c7e604ab1b9a1ac7e5.1320799787.git.josh@linux.intel.com>
In-Reply-To: <552def63eb1b587a3f0685c7e604ab1b9a1ac7e5.1320799787.git.josh@linux.intel.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/3] shared-mime-info: package runtime data separately
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
X-List-Received-Date: Fri, 18 Nov 2011 12:28:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 09.11.2011 01:53, schrieb Joshua Lock:
> The freedesktop.org.xml is required when updating the mime database but
> otherwise not much use. Therefore package it separately, rather than
> removing it completely, so that it can be used as required for on-device
> updates without adding almost 2MB to every image which hase shared-mime-info.

somehow this patch breaks the image creation for systemd-gnome-image.
Famous last words from bitbake:

--------------8<-snip-----------------
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-gnome:
|  *    shared-mime-info-data *         shared-mime-info-data *
|  * opkg_install_cmd: Cannot install package task-gnome.
| ERROR: Function 'do_rootfs' failed (see
/srv/oe/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/dm814x_evm-angstrom-linux-gnueabi/systemd-gnome-image-1.0-r0/temp/log.do_rootfs.6501
for further information)
NOTE: package systemd-gnome-image-1.0-r0: task do_rootfs: Failed
ERROR: Task 8
(/srv/oe/setup-scripts/sources/meta-angstrom/recipes-images/angstrom/systemd-gnome-image.bb,
do_rootfs) failed with exit code '1'
ERROR:
'/srv/oe/setup-scripts/sources/meta-angstrom/recipes-images/angstrom/systemd-gnome-image.bb'
failed
--------------8<-snip-----------------

And there is no package names shared-mime-info-data*. :-(


> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  .../shared-mime-info/shared-mime-info.inc          |    9 ++++++---
>  .../shared-mime-info/shared-mime-info_0.91.bb      |    2 +-
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
> index c8cab29..57e829c 100644
> --- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
> @@ -17,13 +17,16 @@ EXTRA_OECONF = "--disable-update-mimedb"
>  FILES_${PN} += "${datadir}/mime"
>  FILES_${PN}-dev += "${datadir}/pkgconfig/shared-mime-info.pc"
>  
> +# freedesktop.org.xml is only required when updating the mime database,
> +# package it separately
> +PACKAGES += "shared-mime-info-data"
> +FILES_shared-mime-info-data = "${datadir}/mime/packages/freedesktop.org.xml"
> +RDEPENDS_shared-mime-info-data = "shared-mime-info"
> +
>  do_install () {
>  	autotools_do_install
>  
>  	update-mime-database ${D}${datadir}/mime
> -
> -	# we do not need it on device and it is huge
> -	rm ${D}${datadir}/mime/packages/freedesktop.org.xml
>  }
>  
>  do_install_virtclass-native () {
> diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
> index 0c3b01c..bc4a8f7 100644
> --- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
> @@ -1,5 +1,5 @@
>  require shared-mime-info.inc
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI[md5sum] = "982a211560ba4c47dc791ccff34e8fbc"
>  SRC_URI[sha256sum] = "98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"

Regards
Rainer



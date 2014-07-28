Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8DF65CA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 13:22:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6SDLxQL027597; Mon, 28 Jul 2014 14:22:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 092hnCmwWotg; Mon, 28 Jul 2014 14:21:59 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6SDLu2A027418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 28 Jul 2014 14:21:57 +0100
Message-ID: <1406553715.13346.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Mon, 28 Jul 2014 14:21:55 +0100
In-Reply-To: <441004b90226e88ca148d267d4474c7d54853819.1406525420.git.Qi.Chen@windriver.com>
References: <cover.1406525420.git.Qi.Chen@windriver.com>
	<441004b90226e88ca148d267d4474c7d54853819.1406525420.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] systemd: add volatile-binds to RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jul 2014 13:22:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-07-28 at 13:34 +0800, Chen Qi wrote:
> ---
>  meta/recipes-core/systemd/systemd_213.bb |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_213.bb
> index 5de7cdc..4fb7ffc 100644
> --- a/meta/recipes-core/systemd/systemd_213.bb
> +++ b/meta/recipes-core/systemd/systemd_213.bb
> @@ -243,6 +243,7 @@ FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_uni
>  FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>  
>  RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
> +RDEPENDS_${PN} += "volatile-binds"
>  
>  RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units udev-hwdb\
>                        util-linux-agetty \

Do we always need/want to include this? Does this have any implications
for rw systems? I couldn't immediately see how this triggers on a ro
system...

Cheers,

Richard



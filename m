Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3VPt-0000CX-1W for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 17:33:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22GOgAg002981
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 16:24:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02309-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 16:24:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22GOXFP002975
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 16:24:34 GMT
Message-ID: <1330705477.309.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 16:24:37 +0000
In-Reply-To: <35a00c35bf914f035dd2ee8f1d4e8081e41c40be.1330450342.git.paul.eggleton@linux.intel.com>
References: <cover.1330450342.git.paul.eggleton@linux.intel.com>
	<35a00c35bf914f035dd2ee8f1d4e8081e41c40be.1330450342.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] qt4: make pulseaudio support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Fri, 02 Mar 2012 16:33:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-28 at 17:36 +0000, Paul Eggleton wrote:
> Add a pulseaudio DISTRO_FEATURES item and disable pulseaudio support in
> phonon within Qt4 if it is not present; otherwise it is a race condition
> as to whether it is enabled or disabled or breaks the build.
> 
> Note that this adds pulseaudio to DISTRO_FEATURES_BACKFILL thus leaving
> existing distro configurations unaffected.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/conf/bitbake.conf                             |    2 +-
>  meta/recipes-qt/qt4/qt-4.7.4.inc                   |    1 +
>  .../qt4/qt-4.7.4/pulseaudio-config.patch           |   45 ++++++++++++++++++++
>  meta/recipes-qt/qt4/qt-4.8.0.inc                   |    1 +
>  .../qt4/qt-4.8.0/pulseaudio-config.patch           |   45 ++++++++++++++++++++
>  meta/recipes-qt/qt4/qt4.inc                        |    2 +
>  6 files changed, 95 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/pulseaudio-config.patch
>  create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/pulseaudio-config.patch

Merged to master, thanks.

Richard



